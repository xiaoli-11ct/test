<template>
  <div class="app-container">
    <header class="header">
      <div class="logo">
        <span class="logo-icon">🏛️</span>
        <span>中国省级非遗项目可视化平台</span>
      </div>
      <nav class="nav">
        <router-link to="/" class="nav-item">首页</router-link>
        <router-link to="/heritage" class="nav-item active">非遗名录</router-link>
        <router-link to="/statistics" class="nav-item">数据统计</router-link>
        <router-link to="/inheritors" class="nav-item">传承人</router-link>
        <router-link to="/news" class="nav-item">资讯</router-link>
        <router-link to="/ai-analysis" class="nav-item">AI分析</router-link>
        <router-link to="/about" class="nav-item">关于我们</router-link>
      </nav>
    </header>

    <main class="main-content">
      <div class="page-header">
        <h1>📋 非遗名录</h1>
        <p>浏览中国非物质文化遗产代表性项目</p>
      </div>

      <div class="filter-bar">
        <el-select v-model="filters.provinceId" placeholder="选择省份" clearable @change="loadData">
          <el-option v-for="p in provinces" :key="p.id" :label="p.provinceName" :value="p.id" />
        </el-select>
        
        <el-select v-model="filters.categoryId" placeholder="选择分类" clearable @change="loadData">
          <el-option v-for="c in categories" :key="c.id" :label="c.name" :value="c.id" />
        </el-select>
        
        <el-select v-model="filters.level" placeholder="选择级别" clearable @change="loadData">
          <el-option label="国家级" value="国家级" />
          <el-option label="省级" value="省级" />
        </el-select>
      </div>

      <div v-loading="loading" class="heritage-grid">
        <div v-for="item in heritageList" :key="item.id" class="heritage-card" @click="goToDetail(item.id)">
          <div class="card-img">
            <img v-if="item.imgUrl" :src="item.imgUrl" :alt="item.name" @error="handleImgError($event)" />
            <div v-else class="category-fallback" :style="{ background: getCategoryConfig(item.categoryId).bg }">
              <span class="category-icon">{{ getCategoryConfig(item.categoryId).icon }}</span>
            </div>
          </div>
          <div class="card-content">
            <div class="card-title">{{ item.name }}</div>
            <div class="card-meta">
              <span>{{ item.provinceName }}</span>
              <span>{{ item.categoryName }}</span>
            </div>
            <div class="card-tag">{{ item.level }}</div>
          </div>
        </div>
      </div>

      <el-empty v-if="!loading && heritageList.length === 0" description="暂无数据" />
    </main>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { getProvinces, getCategories, getHeritageList } from '@/api'

const router = useRouter()
const route = useRoute()
const loading = ref(false)
const heritageList = ref([])
const provinces = ref([])
const categories = ref([])
const filters = ref({
  provinceId: null,
  categoryId: null,
  level: null
})

const categoryConfig = {
  1: { icon: '📖', bg: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)', name: '民间文学' },
  2: { icon: '🎵', bg: 'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)', name: '传统音乐' },
  3: { icon: '💃', bg: 'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)', name: '传统舞蹈' },
  4: { icon: '🎭', bg: 'linear-gradient(135deg, #43e97b 0%, #38f9d7 100%)', name: '传统戏剧' },
  5: { icon: '🎤', bg: 'linear-gradient(135deg, #fa709a 0%, #fee140 100%)', name: '曲艺' },
  6: { icon: '⚔️', bg: 'linear-gradient(135deg, #a8edea 0%, #fed6e3 100%)', name: '传统体育' },
  7: { icon: '🎨', bg: 'linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%)', name: '传统美术' },
  8: { icon: '🏺', bg: 'linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%)', name: '传统技艺' },
  9: { icon: '💊', bg: 'linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%)', name: '传统医药' },
  10: { icon: '🏮', bg: 'linear-gradient(135deg, #ff758c 0%, #ff7eb3 100%)', name: '民俗' }
}

const getCategoryConfig = (categoryId) => {
  return categoryConfig[categoryId] || { icon: '🏛️', bg: 'linear-gradient(135deg, #1976D2 0%, #42A5F5 100%)', name: '' }
}

const handleImgError = (event) => {
  event.target.style.display = 'none'
  const fallback = event.target.nextElementSibling
  if (fallback) {
    fallback.style.display = 'flex'
  }
}

const loadData = async () => {
  loading.value = true
  try {
    const params = {}
    if (filters.value.provinceId) params.provinceId = filters.value.provinceId
    if (filters.value.categoryId) params.categoryId = filters.value.categoryId
    
    const res = await getHeritageList(params)
    if (res.code === 200) {
      let list = res.data || []
      if (filters.value.level) {
        list = list.filter(i => i.level === filters.value.level)
      }
      heritageList.value = list
    }
  } catch (err) {
    console.error(err)
  } finally {
    loading.value = false
  }
}

const goToDetail = (id) => {
  router.push(`/heritage/${id}`)
}

onMounted(async () => {
  const [pRes, cRes] = await Promise.all([getProvinces(), getCategories()])
  if (pRes.code === 200) provinces.value = pRes.data || []
  if (cRes.code === 200) categories.value = cRes.data || []
  
  if (route.query.provinceId) filters.value.provinceId = parseInt(route.query.provinceId)
  if (route.query.categoryId) filters.value.categoryId = parseInt(route.query.categoryId)
  
  loadData()
})
</script>

<style lang="scss" scoped>
.page-header {
  margin-bottom: 16px;
  h1 { font-size: 24px; font-weight: 600; color: #212121; }
  p { color: #757575; font-size: 13px; margin-top: 4px; }
}

.filter-bar {
  display: flex;
  gap: 12px;
  margin-bottom: 20px;
  
  :deep(.el-select) { 
    width: 160px;
  }
}

.heritage-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
}

.card-img {
  position: relative;
  height: 150px;
  overflow: hidden;
  
  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  
  .category-fallback {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    
    .category-icon {
      font-size: 48px;
    }
  }
}
</style>
