<template>
  <div class="app-container">
    <header class="header">
      <div class="logo"><span class="logo-icon">🏛️</span><span>中国省级非遗项目可视化平台</span></div>
      <nav class="nav">
        <router-link to="/" class="nav-item">首页</router-link>
        <router-link to="/heritage" class="nav-item">非遗名录</router-link>
        <router-link to="/statistics" class="nav-item">数据统计</router-link>
        <router-link to="/inheritors" class="nav-item">传承人</router-link>
        <router-link to="/news" class="nav-item">资讯</router-link>
        <router-link to="/ai-analysis" class="nav-item">AI分析</router-link>
        <router-link to="/about" class="nav-item active">关于我们</router-link>
      </nav>
    </header>
    <main class="main-content">
      <div class="about-container">
        <div class="about-card">
          <h1>🏛️ 关于我们</h1>
          <p>中国省级非遗项目可视化平台致力于展示和保护中国非物质文化遗产。</p>
          <div class="features">
            <div class="feature"><span class="icon">🗺️</span><div><h3>地图可视化</h3><p>交互式中国地图展示各省非遗分布</p></div></div>
            <div class="feature"><span class="icon">📊</span><div><h3>数据统计</h3><p>全国非遗项目统计数据一览无余</p></div></div>
            <div class="feature"><span class="icon">📂</span><div><h3>十大分类</h3><p>涵盖民间文学、传统音乐、传统舞蹈等</p></div></div>
            <div class="feature"><span class="icon">👥</span><div><h3>传承人名录</h3><p>国家级代表性传承人信息</p></div></div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>
<script setup>
</script>
<style lang="scss" scoped>
.about-container { max-width: 800px; margin: 0 auto; }
.about-card { background: #fff; border-radius: 12px; padding: 32px; box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  h1 { color: #212121; font-size: 22px; margin-bottom: 16px; font-weight: 600; }
  > p { color: #666; font-size: 14px; line-height: 1.8; margin-bottom: 24px; }
  .features { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
  .feature { display: flex; gap: 12px; align-items: flex-start;
    .icon { font-size: 28px; }
    h3 { color: #212121; font-size: 14px; margin-bottom: 4px; font-weight: 600; }
    p { color: #757575; font-size: 12px; }
  }
}
</style>
