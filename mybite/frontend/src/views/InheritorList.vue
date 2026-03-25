<template>
  <div class="app-container">
    <header class="header">
      <div class="logo"><span class="logo-icon">🏛️</span><span>中国省级非遗项目可视化平台</span></div>
      <nav class="nav">
        <router-link to="/" class="nav-item">首页</router-link>
        <router-link to="/heritage" class="nav-item">非遗名录</router-link>
        <router-link to="/statistics" class="nav-item">数据统计</router-link>
        <router-link to="/inheritors" class="nav-item active">传承人</router-link>
        <router-link to="/news" class="nav-item">资讯</router-link>
        <router-link to="/ai-analysis" class="nav-item">AI分析</router-link>
        <router-link to="/about" class="nav-item">关于我们</router-link>
      </nav>
    </header>
    <main class="main-content">
      <div class="page-header"><h1>👥 传承人名录</h1></div>
      <div v-loading="loading" class="inheritor-grid">
        <div v-for="item in list" :key="item.id" class="inheritor-card">
          <div class="avatar">👤</div>
          <div class="info"><div class="name">{{ item.name }}</div>
            <div class="meta">{{ item.provinceName }} | {{ item.categoryName }}</div>
            <div class="level">{{ item.level }}传承人</div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>
<script setup>
import { ref, onMounted } from 'vue'
import { getInheritorList } from '@/api'
const loading = ref(false), list = ref([])
onMounted(async () => {
  loading.value = true
  try { const res = await getInheritorList(); if (res.code === 200) list.value = res.data || [] } 
  finally { loading.value = false }
})
</script>
<style lang="scss" scoped>
.page-header h1 { color: #212121; font-size: 24px; margin-bottom: 20px; font-weight: 600; }
.inheritor-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; }
.inheritor-card { background: #fff; border-radius: 12px; padding: 20px; text-align: center; box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  .avatar { font-size: 44px; margin-bottom: 10px; }
  .name { font-size: 15px; font-weight: 600; color: #212121; }
  .meta { color: #757575; font-size: 12px; margin-top: 4px; }
  .level { color: #1976D2; font-size: 12px; margin-top: 8px; font-weight: 500; }
}
</style>
