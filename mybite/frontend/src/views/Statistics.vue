<template>
  <div class="app-container">
    <header class="header">
      <div class="logo"><span class="logo-icon">🏛️</span><span>中国省级非遗项目可视化平台</span></div>
      <nav class="nav">
        <router-link to="/" class="nav-item">首页</router-link>
        <router-link to="/heritage" class="nav-item">非遗名录</router-link>
        <router-link to="/statistics" class="nav-item active">数据统计</router-link>
        <router-link to="/inheritors" class="nav-item">传承人</router-link>
        <router-link to="/news" class="nav-item">资讯</router-link>
        <router-link to="/ai-analysis" class="nav-item">AI分析</router-link>
        <router-link to="/about" class="nav-item">关于我们</router-link>
      </nav>
    </header>
    <main class="main-content">
      <div class="page-header"><h1>📊 数据统计</h1></div>
      <div class="stats-overview">
        <div class="stat-card"><div class="value">{{ stats.totalCount }}</div><div class="label">非遗项目总数</div></div>
        <div class="stat-card"><div class="value">{{ stats.nationalCount }}</div><div class="label">国家级非遗</div></div>
        <div class="stat-card"><div class="value">{{ stats.inheritorCount }}</div><div class="label">传承人数量</div></div>
        <div class="stat-card"><div class="value">{{ stats.unescoCount }}</div><div class="label">联合国非遗</div></div>
      </div>
      <div ref="chartRef" class="chart-container"></div>
    </main>
  </div>
</template>
<script setup>
import { ref, onMounted } from 'vue'
import * as echarts from 'echarts'
import { getNationalStats, getProvinceStats } from '@/api'
const stats = ref({}), chartRef = ref(null), provinceData = ref([])
const loadData = async () => {
  const [nRes, pRes] = await Promise.all([getNationalStats(), getProvinceStats()])
  if (nRes.code === 200) stats.value = nRes.data || {}
  if (pRes.code === 200) provinceData.value = pRes.data || []
  setTimeout(initChart, 300)
}
const initChart = () => {
  if (!chartRef.value) return
  const chart = echarts.init(chartRef.value)
  const data = provinceData.value.filter(p => p.totalCount > 0).sort((a,b) => b.totalCount - a.totalCount).slice(0, 15)
  chart.setOption({
    backgroundColor: 'transparent',
    title: { text: '各省非遗项目数量TOP15', left: 'center', textStyle: { color: '#333', fontSize: 16 } },
    tooltip: { trigger: 'axis', backgroundColor: 'rgba(255,255,255,0.98)', borderColor: '#e0e0e0', textStyle: { color: '#333' } },
    xAxis: { type: 'value', name: '数量', axisLine: { lineStyle: { color: '#ccc' } }, axisLabel: { color: '#666' }, splitLine: { lineStyle: { color: '#eee' } } },
    yAxis: { type: 'category', data: data.map(d => d.provinceName), inverse: true, axisLine: { lineStyle: { color: '#ccc' } }, axisLabel: { color: '#666' } },
    series: [{ type: 'bar', data: data.map(d => ({ value: d.totalCount, itemStyle: { color: { type: 'linear', x: 0, y: 0, x2: 1, y2: 0, colorStops: [{ offset: 0, color: '#1976D2' }, { offset: 1, color: '#42A5F5' }] } } })), barWidth: 18 }]
  })
}
onMounted(() => loadData())
</script>
<style lang="scss" scoped>
.page-header h1 { color: #212121; font-size: 24px; margin-bottom: 20px; font-weight: 600; }
.stats-overview { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; margin-bottom: 20px;
  .stat-card { background: linear-gradient(135deg, #1976D2, #1565C0); border-radius: 12px; padding: 20px; text-align: center;
    .value { font-size: 28px; font-weight: 700; color: #fff; }
    .label { color: rgba(255,255,255,0.85); margin-top: 4px; font-size: 13px; }
  }
}
.chart-container { background: #fff; border-radius: 12px; padding: 16px; height: 450px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); }
</style>
