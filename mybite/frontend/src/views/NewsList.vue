<template>
  <div class="app-container">
    <header class="header">
      <div class="logo"><span class="logo-icon">🏛️</span><span>中国省级非遗项目可视化平台</span></div>
      <nav class="nav">
        <router-link to="/" class="nav-item">首页</router-link>
        <router-link to="/heritage" class="nav-item">非遗名录</router-link>
        <router-link to="/statistics" class="nav-item">数据统计</router-link>
        <router-link to="/inheritors" class="nav-item">传承人</router-link>
        <router-link to="/news" class="nav-item active">资讯</router-link>
        <router-link to="/ai-analysis" class="nav-item">AI分析</router-link>
        <router-link to="/about" class="nav-item">关于我们</router-link>
      </nav>
    </header>
    <main class="main-content">
      <div class="page-header"><h1>📰 资讯中心</h1></div>
      <div v-loading="loading" class="news-list">
        <div v-for="item in list" :key="item.id" class="news-card">
          <div class="news-date">{{ formatDate(item.publishDate) }}</div>
          <div class="news-title">{{ item.title }}</div>
          <div class="news-content">{{ item.content }}</div>
        </div>
      </div>
    </main>
  </div>
</template>
<script setup>
import { ref, onMounted } from 'vue'
import { getNewsList } from '@/api'
const loading = ref(false), list = ref([])
const formatDate = (d) => d ? new Date(d).toLocaleDateString('zh-CN') : ''
onMounted(async () => {
  loading.value = true
  try { const res = await getNewsList(); if (res.code === 200) list.value = res.data || [] }
  finally { loading.value = false }
})
</script>
<style lang="scss" scoped>
.page-header h1 { color: #212121; font-size: 24px; margin-bottom: 20px; font-weight: 600; }
.news-list { display: flex; flex-direction: column; gap: 12px; }
.news-card { background: #fff; border-radius: 12px; padding: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  .news-date { color: #999; font-size: 12px; margin-bottom: 6px; }
  .news-title { font-size: 15px; font-weight: 600; color: #212121; margin-bottom: 8px; }
  .news-content { color: #666; font-size: 13px; line-height: 1.6; }
}
</style>
