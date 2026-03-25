<template>
  <div class="app-container">
    <header class="header">
      <div class="logo"><span class="logo-icon">🏛️</span><span>中国省级非遗项目可视化平台</span></div>
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
      <button class="back-btn" @click="router.back()">← 返回</button>
      <div v-loading="loading" class="detail-container">
        <div class="detail-header">
          <h1>{{ heritage.name }}</h1>
          <div class="detail-tags">
            <span class="tag level">{{ heritage.level }}</span>
            <span class="tag category">{{ heritage.categoryName }}</span>
            <span class="tag province">{{ heritage.provinceName }}</span>
            <span v-if="heritage.declarationYear" class="tag year">{{ heritage.declarationYear }}年申报</span>
          </div>
        </div>
        
        <div class="detail-media">
          <div class="media-gallery">
            <div v-if="heritage.videoUrl" class="video-section">
              <h4>📹 视频介绍</h4>
              <iframe :src="getEmbedUrl(heritage.videoUrl)" frameborder="0" allowfullscreen></iframe>
            </div>
            <div v-else-if="heritage.imgUrl" class="main-image">
              <img :src="heritage.imgUrl" :alt="heritage.name" />
            </div>
            <div v-else class="main-image" :style="{ background: getCategoryGradient(heritage.categoryId) }">
              <span class="category-icon">{{ getCategoryIcon(heritage.categoryId) }}</span>
            </div>
          </div>
        </div>
        
        <div class="detail-info">
          <div v-if="heritage.code" class="info-section">
            <h3>项目编号</h3>
            <p>{{ heritage.code }}</p>
          </div>
          <div class="info-section">
            <h3>项目简介</h3>
            <p>{{ heritage.intro || '暂无简介' }}</p>
          </div>
          <div class="info-section">
            <h3>详细介绍</h3>
            <div class="detailed-description">
              <p v-if="heritage.description">{{ heritage.description }}</p>
              <p v-else>{{ getDetailedDescription(heritage) }}</p>
            </div>
          </div>
          <div class="info-section">
            <h3>传承人</h3>
            <div class="inheritor-info">
              <p>{{ heritage.inheritor || '集体传承' }}</p>
              <p v-if="heritage.declarationYear" class="inheritor-note">自 {{ heritage.declarationYear }} 年起传承</p>
            </div>
          </div>
          <div class="info-section">
            <h3>相关价值</h3>
            <ul class="value-list">
              <li>具有重要的历史、文化和艺术价值</li>
              <li>体现了中华民族优秀传统文化的独特魅力</li>
              <li>是地方文化的重要代表和标志性符号</li>
              <li>具有不可替代的活态传承特性</li>
            </ul>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>
<script setup>
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { getHeritageById } from '@/api'
const route = useRoute(), router = useRouter()
const loading = ref(false), heritage = ref({})

const categoryConfig = {
  1: { icon: '📖', gradient: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)', name: '民间文学' },
  2: { icon: '🎵', gradient: 'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)', name: '传统音乐' },
  3: { icon: '💃', gradient: 'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)', name: '传统舞蹈' },
  4: { icon: '🎭', gradient: 'linear-gradient(135deg, #43e97b 0%, #38f9d7 100%)', name: '传统戏剧' },
  5: { icon: '🎤', gradient: 'linear-gradient(135deg, #fa709a 0%, #fee140 100%)', name: '曲艺' },
  6: { icon: '⚔️', gradient: 'linear-gradient(135deg, #a8edea 0%, #fed6e3 100%)', name: '传统体育' },
  7: { icon: '🎨', gradient: 'linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%)', name: '传统美术' },
  8: { icon: '🏺', gradient: 'linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%)', name: '传统技艺' },
  9: { icon: '💊', gradient: 'linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%)', name: '传统医药' },
  10: { icon: '🏮', gradient: 'linear-gradient(135deg, #ff758c 0%, #ff7eb3 100%)', name: '民俗' }
}

const getCategoryImage = (categoryId) => {
  return ''
}

const getCategoryGradient = (categoryId) => {
  return categoryConfig[categoryId]?.gradient || 'linear-gradient(135deg, #1976D2 0%, #42A5F5 100%)'
}

const getCategoryIcon = (categoryId) => {
  return categoryConfig[categoryId]?.icon || '🏛️'
}

const getEmbedUrl = (url) => {
  if (!url) return ''
  if (url.includes('bilibili.com/video/BV')) {
    const bv = url.match(/BV[\w]+/)[0]
    return `https://player.bilibili.com/player.html?bvid=${bv}&autoplay=0`
  }
  if (url.includes('bilibili.com/video/av')) {
    const av = url.match(/av\d+/)[0]
    return `https://player.bilibili.com/player.html?avid=${av.replace('av', '')}&autoplay=0`
  }
  if (url.includes('douyin.com/video/')) {
    return url.replace('douyin.com/video/', 'douyin.com/aweme/v1/web/aweme/detail/?aweme_id=')
  }
  return url
}

const getDetailedDescription = (item) => {
  const categoryDescriptions = {
    1: `${item.name}是中国民间文学的杰出代表，承载着深厚的历史文化底蕴。这一传说在民间广为流传，距今已有数千年的历史。它不仅是一个美丽的爱情故事，更反映了古代人民对自由爱情的向往和追求。该项目对于研究中国古代社会民俗、文化传统具有重要的学术价值，同时也是进行优秀传统文化教育的重要载体。`,
    2: `${item.name}是中国传统音乐的瑰宝，体现了中华音乐的深厚底蕴。这种音乐形式历史悠久，是中华民族音乐创造力的集中体现。其旋律优美、意境深远,既保留了传统音乐的核心元素，又融合了地方特色，形成了自己独特的艺术风格。作为非物质文化遗产的重要组成部分，对于研究中国古代音乐史、了解传统音乐的发展演变具有重要意义。`,
    3: `${item.name}是中国传统舞蹈的典型代表，具有鲜明的民族特色和地方风格。这种舞蹈形式源远流长，起源于古代祭祀活动，后逐渐发展成为民间表演艺术。其动作优美、韵律独特,既有强烈的艺术感染力，又具有良好的群众基础。该舞蹈项目是中华民族集体智慧的结晶，对于传承民族文化、丰富人民精神文化生活发挥着重要作用。`,
    4: `${item.name}是中国传统戏剧的典范，被誉为"国粹"或地方戏曲的代表。这一戏剧形式集文学、音乐、舞蹈、美术、武术于一体,是中国综合性舞台艺术的集中体现。其表演程式严谨、唱腔独特、脸谱精美,具有极高的艺术价值。作为中国传统文化的重要载体，对于弘扬民族精神、传承戏曲艺术具有重要意义。`,
    5: `${item.name}是中国曲艺艺术的重要形式，以其独特的表演风格深受人民群众喜爱。这种曲艺形式融合了说、唱、演、评等多种艺术手段，语言幽默风趣,内容贴近生活。它起源于民间，是劳动人民智慧创造的结晶。该项目对于研究中国曲艺发展史、了解地方文化特色具有重要价值，同时也是丰富群众文化生活的重要形式。`,
    6: `${item.name}是中国传统体育武术的代表，具有深厚的文化底蕴和独特的健身价值。这种技艺历史悠久，是中国武术文化的重要组成部分。其动作刚柔并济、内外兼修,既有强身健体的功效，又具有防身自卫的功能。该项目对于传承中国传统武术、弘扬武德精神、促进全民健身具有重要意义。`,
    7: `${item.name}是中国传统美术的杰出代表，具有浓郁的地方特色和民族风格。这种美术形式历史悠久，是劳动人民长期实践经验的结晶。其作品精美绝伦、寓意深刻,既有很高的艺术欣赏价值，又具有深厚的文化内涵。该项目对于传承传统美术技艺、研究民间艺术发展具有重要意义。`,
    8: `${item.name}是中国传统技艺的典范，体现了中国古代劳动人民的卓越智慧和创造力。这种技艺历史悠久，工序复杂,需要经过长期的学习和实践才能掌握。其产品精美绝伦、经久耐用,代表了中国传统工艺的最高水平。该项目对于传承传统技艺、弘扬工匠精神、促进传统工艺振兴具有重要意义。`,
    9: `${item.name}是中国传统医药的瑰宝，承载着中华民族几千年的医疗智慧。这种医药体系理论完整、疗效显著,是中国传统文化的重要组成部分。其诊疗方法独特、用药讲究,既注重整体调理，又强调辨证施治。该项目对于传承发展中医药事业、研究中国传统医学具有重要价值。`,
    10: `${item.name}是中华民族重要的传统节日，凝聚着丰富的文化内涵和民族情感。这种民俗活动历史悠久，形式多样,是中华民族集体记忆的重要载体。它不仅是时间的标记，更是文化的传承，寄托着人们对美好生活的向往。该项目对于研究中国传统节日文化、传承民族文化基因具有重要意义。`
  }
  return categoryDescriptions[item.categoryId] || `${item.name}是中国非物质文化遗产的重要组成部分，具有深厚的历史文化价值和独特的艺术魅力。该项目在长期的发展过程中，形成了独特的表现形式和艺术风格，体现了中华民族的创造力和审美情趣。作为传统文化的重要载体，对于传承民族文化、增进民族团结、促进文化交流具有重要意义。`
}

onMounted(async () => {
  loading.value = true
  try { const res = await getHeritageById(route.params.id); if (res.code === 200) heritage.value = res.data || {} } 
  finally { loading.value = false }
})
</script>
<style lang="scss" scoped>
.back-btn { background: #1976D2; color: #fff; border: none; padding: 8px 16px; border-radius: 6px; cursor: pointer; font-size: 13px; margin-bottom: 16px; &:hover { background: #1565C0; } }
.detail-container { background: #fff; border-radius: 12px; padding: 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  .detail-header { margin-bottom: 20px;
    h1 { color: #212121; font-size: 24px; margin-bottom: 12px; font-weight: 600; }
    .detail-tags { display: flex; gap: 8px; flex-wrap: wrap;
      .tag { padding: 4px 12px; border-radius: 6px; font-size: 12px; font-weight: 500;
        &.level { background: #E3F2FD; color: #1976D2; }
        &.category { background: #f5f5f5; color: #424242; border: 1px solid #e0e0e0; }
        &.province { background: #f5f5f5; color: #757575; border: 1px solid #e0e0e0; }
        &.year { background: #FFF3E0; color: #E65100; border: 1px solid #FFB74D; }
      }
    }
  }
  .detail-media { margin-bottom: 24px;
    .media-gallery {
      .main-image {
        width: 100%;
        height: 400px;
        border-radius: 12px;
        overflow: hidden;
        margin-bottom: 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        
        .category-icon {
          font-size: 120px;
          color: #fff;
          text-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }
        
        img {
          width: 100%;
          height: 100%;
          object-fit: cover;
        }
      }
      .video-section {
        h4 { font-size: 15px; color: #212121; margin-bottom: 10px; font-weight: 600; }
        iframe { width: 100%; height: 400px; border-radius: 8px; }
        video { width: 100%; max-height: 300px; border-radius: 8px; background: #000; }
      }
    }
    .media-placeholder { height: 280px; background: #fafafa; display: flex; flex-direction: column; align-items: center; justify-content: center; border-radius: 8px; span { font-size: 48px; } p { color: #999; margin-top: 8px; font-size: 13px; } }
  }
  .detail-info { .info-section { margin-bottom: 20px; padding-bottom: 20px; border-bottom: 1px solid #f0f0f0;
    h3 { color: #212121; font-size: 15px; margin-bottom: 10px; font-weight: 600; }
    p { color: #666; line-height: 1.8; font-size: 14px; }
    .detailed-description { 
      p { text-align: justify; } 
    }
    .inheritor-info {
      .inheritor-note { font-size: 12px; color: #999; margin-top: 4px; }
    }
    .value-list {
      margin: 0; padding-left: 20px;
      li { color: #666; line-height: 1.8; font-size: 14px; margin-bottom: 8px; }
    }
  } }
}
</style>
