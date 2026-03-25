<template>
  <div class="app-container">
    <header class="header">
      <div class="logo">
        <span class="logo-icon">🏛️</span>
        <span>中国省级非遗项目可视化平台</span>
      </div>
      <nav class="nav">
        <router-link to="/" class="nav-item active">首页</router-link>
        <router-link to="/heritage" class="nav-item">非遗名录</router-link>
        <router-link to="/statistics" class="nav-item">数据统计</router-link>
        <router-link to="/inheritors" class="nav-item">传承人</router-link>
        <router-link to="/news" class="nav-item">资讯</router-link>
        <router-link to="/ai-analysis" class="nav-item">AI分析</router-link>
        <router-link to="/about" class="nav-item">关于我们</router-link>
      </nav>
    </header>

    <main class="main-content">
      <div class="stats-overview">
        <div class="stat-card"><div class="stat-value">{{ nationalStats.totalCount || 0 }}</div><div class="stat-label">非遗总数</div></div>
        <div class="stat-card"><div class="stat-value">{{ nationalStats.nationalCount || 0 }}</div><div class="stat-label">国家级</div></div>
        <div class="stat-card"><div class="stat-value">{{ provinceStats.length }}</div><div class="stat-label">省份</div></div>
        <div class="stat-card"><div class="stat-value">{{ categories.length }}</div><div class="stat-label">分类</div></div>
      </div>

      <div class="map-section">
        <div class="section-title">
          <h2>🗺️ 各省非遗分布地图</h2>
          <p>点击省份查看该省非遗项目详情</p>
        </div>
        <div ref="mapRef" class="china-map"></div>
      </div>

      <div class="categories-section">
        <div class="section-title">
          <h2>📂 十大非遗分类</h2>
        </div>
        <div class="categories-grid">
          <div v-for="cat in categories" :key="cat.id" class="category-card" @click="goToCategory(cat.id)">
            <div class="category-icon">{{ getCategoryIcon(cat.id) }}</div>
            <div class="category-name">{{ cat.name }}</div>
          </div>
        </div>
      </div>

      <div class="bottom-section">
        <div class="news-section">
          <div class="section-title"><h3>📰 最新资讯</h3></div>
          <div class="news-list">
            <div v-for="item in newsList" :key="item.id" class="news-item">
              <span class="news-date">{{ formatDate(item.publishDate) }}</span>
              <span class="news-text">{{ item.title }}</span>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import * as echarts from 'echarts'
import { getNationalStats, getProvinceStats, getCategories, getNewsList } from '@/api'

const router = useRouter()
const route = useRoute()
const mapRef = ref(null)
const nationalStats = ref({})
const provinceStats = ref([])
const categories = ref([])
const newsList = ref([])
const mapLoaded = ref(false)

const provinceNameMap = {
  '北京市': '北京', '天津市': '天津', '河北省': '河北', '山西省': '山西',
  '内蒙古自治区': '内蒙古', '辽宁省': '辽宁', '吉林省': '吉林', '黑龙江省': '黑龙江',
  '上海市': '上海', '江苏省': '江苏', '浙江省': '浙江', '安徽省': '安徽',
  '福建省': '福建', '江西省': '江西', '山东省': '山东', '河南省': '河南',
  '湖北省': '湖北', '湖南省': '湖南', '广东省': '广东', '广西壮族自治区': '广西',
  '海南省': '海南', '重庆市': '重庆', '四川省': '四川', '贵州省': '贵州',
  '云南省': '云南', '西藏自治区': '西藏', '陕西省': '陕西', '甘肃省': '甘肃',
  '青海省': '青海', '宁夏回族自治区': '宁夏', '新疆维吾尔自治区': '新疆',
  '台湾省': '台湾', '香港特别行政区': '香港', '澳门特别行政区': '澳门'
}

const categoryIcons = ['📜', '🎵', '💃', '🎭', '🎤', '⚔️', '🎨', '🏺', '💊', '🎉']

const getCategoryIcon = (id) => categoryIcons[(id - 1) % categoryIcons.length]

const formatDate = (d) => d ? new Date(d).toLocaleDateString('zh-CN') : ''

const goToCategory = (id) => {
  router.push({ path: '/heritage', query: { categoryId: id } })
}

const initMap = async () => {
  if (!mapRef.value) return
  
  const chart = echarts.init(mapRef.value)
  
  const mapData = provinceStats.value.map(s => ({
    name: provinceNameMap[s.provinceName] || s.provinceName,
    value: s.totalCount || 0,
    provinceId: s.provinceId,
    provinceName: s.provinceName,
    nationalCount: s.nationalCount || 0
  }))
  
  const maxCount = Math.max(...mapData.map(s => s.value), 1)
  
  const option = {
    backgroundColor: 'transparent',
    tooltip: {
      trigger: 'item',
      backgroundColor: 'rgba(255,255,255,0.98)',
      borderColor: '#e0e0e0',
      borderWidth: 1,
      padding: [12, 16],
      textStyle: { color: '#333' },
      formatter: (params) => {
        if (params.seriesType === 'map') {
          const data = mapData.find(m => 
            m.name === params.name || m.provinceName === params.name || provinceNameMap[m.provinceName] === params.name
          )
          const fullName = data ? data.provinceName : params.name
          return `<div style="font-size:14px;font-weight:600;margin-bottom:6px;">${fullName}</div>
            <div style="color:#666;">非遗总数: <span style="color:#1976D2;font-weight:600;">${data ? data.value : 0}</span> 项</div>
            <div style="color:#666;">国家级: <span style="color:#1976D2;font-weight:600;">${data ? data.nationalCount : 0}</span> 项</div>`
        }
        return ''
      }
    },
    visualMap: {
      min: 0,
      max: maxCount,
      left: 'left',
      top: 'bottom',
      text: ['多', '少'],
      textStyle: { color: '#666' },
      calculable: true,
      itemWidth: 16,
      itemHeight: 120,
      inRange: {
        color: ['#E3F2FD', '#64B5F6', '#1976D2', '#0D47A1']
      }
    },
    series: [{
      name: '非遗数量',
      type: 'map',
      map: 'china',
      roam: true,
      zoom: 1.2,
      label: {
        show: true,
        color: '#333',
        fontSize: 11
      },
      itemStyle: {
        areaColor: '#FAFAFA',
        borderColor: '#E0E0E0',
        borderWidth: 1
      },
      emphasis: {
        label: {
          show: true,
          color: '#1976D2',
          fontSize: 12,
          fontWeight: '600'
        },
        itemStyle: {
          areaColor: '#BBDEFB',
          borderColor: '#1976D2',
          borderWidth: 2
        }
      },
      data: mapData
    }]
  }
  
  echarts.registerMap('china', chinaGeoJSON)
  
  chart.setOption(option)
  mapLoaded.value = true
  
  chart.on('click', (params) => {
    if (params.seriesType === 'map' && params.data) {
      const clickedData = params.data
      if (clickedData && clickedData.provinceId) {
        router.push({ path: '/heritage', query: { provinceId: clickedData.provinceId } })
      }
    }
  })
  
  window.addEventListener('resize', () => chart.resize())
}

const loadData = async () => {
  try {
    await fetchChinaMap()
    
    const [statsRes, provincesRes, catsRes, newsRes] = await Promise.all([
      getNationalStats(),
      getProvinceStats(),
      getCategories(),
      getNewsList()
    ])
    
    if (statsRes.code === 200) nationalStats.value = statsRes.data || {}
    if (provincesRes.code === 200) provinceStats.value = provincesRes.data || []
    if (catsRes.code === 200) categories.value = catsRes.data || []
    if (newsRes.code === 200) newsList.value = (newsRes.data || []).slice(0, 5)
    
    setTimeout(initMap, 500)
  } catch (err) {
    console.error('加载数据失败:', err)
  }
}

let chinaGeoJSON = null

const fetchChinaMap = async () => {
  try {
    const response = await fetch('https://geo.datav.aliyun.com/areas_v3/bound/100000_full.json')
    chinaGeoJSON = await response.json()
  } catch (err) {
    console.error('加载地图数据失败:', err)
  }
}

onMounted(() => {
  loadData()
})
</script>

<style lang="scss" scoped>
.stats-overview {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
  margin-bottom: 20px;

  .stat-card {
    background: linear-gradient(135deg, #1976D2 0%, #1565C0 100%);
    border-radius: 12px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 14px rgba(25, 118, 210, 0.3);

    .stat-value {
      font-size: 32px;
      font-weight: 700;
      color: #fff;
    }

    .stat-label {
      color: rgba(255,255,255,0.85);
      font-size: 13px;
      margin-top: 4px;
    }
  }
}

.map-section {
  background: #fff;
  border-radius: 12px;
  padding: 24px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  margin-bottom: 20px;

  .section-title {
    margin-bottom: 16px;
    h2 { color: #1a1a1a; font-size: 20px; font-weight: 600; }
    p { color: #999; font-size: 13px; margin-top: 4px; }
    h3 { color: #1a1a1a; font-size: 16px; font-weight: 600; }
  }

  .china-map {
    height: 500px;
    width: 100%;
  }
}

.categories-section {
  background: #fff;
  border-radius: 12px;
  padding: 24px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  margin-bottom: 20px;

  .section-title {
    margin-bottom: 20px;
    h2 { color: #1a1a1a; font-size: 20px; font-weight: 600; }
  }

  .categories-grid {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 16px;
  }

  .category-card {
    background: #fafafa;
    border-radius: 10px;
    padding: 20px 16px;
    text-align: center;
    cursor: pointer;
    transition: all 0.25s ease;
    border: 1px solid #f0f0f0;

    &:hover {
      transform: translateY(-4px);
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
      background: #fff;
      border-color: #1976D2;
      
      .category-name { color: #1976D2; }
      .category-icon { transform: scale(1.15); }
    }

    .category-icon {
      font-size: 28px;
      margin-bottom: 10px;
      transition: transform 0.25s ease;
    }

    .category-name {
      font-size: 13px;
      color: #555;
      font-weight: 500;
      transition: color 0.2s;
    }
  }
}

.bottom-section {
  display: flex;
  gap: 20px;
}

.news-section {
  flex: 1;
  background: #fff;
  border-radius: 12px;
  padding: 20px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);

  .news-list {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  .news-item {
    display: flex;
    gap: 10px;
    font-size: 13px;
    cursor: pointer;
    padding: 8px 10px;
    margin: -8px -10px;
    border-radius: 6px;
    transition: background 0.2s;
    &:hover { 
      background: #f5f5f5;
      .news-text { color: #1976D2; }
    }

    .news-date {
      color: #999;
      white-space: nowrap;
      flex-shrink: 0;
    }

    .news-text {
      color: #333;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      transition: color 0.2s;
    }
  }
}
</style>
