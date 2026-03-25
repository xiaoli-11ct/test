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
        <router-link to="/ai-analysis" class="nav-item active">AI分析</router-link>
        <router-link to="/about" class="nav-item">关于我们</router-link>
      </nav>
    </header>
    <main class="main-content">
      <div class="page-header">
        <h1>🤖 AI智能分析</h1>
        <p>基于Gemini AI的非遗数据分析与咨询服务</p>
      </div>

      <div class="ai-container">
        <div class="ai-sidebar">
          <div class="analysis-type" :class="{ active: analysisType === 'overall' }" @click="selectType('overall')">
            <span class="icon">📊</span>
            <div class="text">
              <div class="title">整体分析</div>
              <div class="desc">全国非遗概况分析</div>
            </div>
          </div>
          <div class="analysis-type" :class="{ active: analysisType === 'province' }" @click="selectType('province')">
            <span class="icon">🗺️</span>
            <div class="text">
              <div class="title">省份分析</div>
              <div class="desc">指定省份非遗特色</div>
            </div>
          </div>
          <div class="analysis-type" :class="{ active: analysisType === 'type' }" @click="selectType('type')">
            <span class="icon">📂</span>
            <div class="text">
              <div class="title">类型分析</div>
              <div class="desc">指定分类深度分析</div>
            </div>
          </div>
          <div class="analysis-type" :class="{ active: analysisType === 'custom' }" @click="selectType('custom')">
            <span class="icon">💬</span>
            <div class="text">
              <div class="title">智能问答</div>
              <div class="desc">自定义问题咨询</div>
            </div>
          </div>
        </div>

        <div class="ai-main">
          <div class="ai-input-section">
            <template v-if="analysisType === 'province'">
              <el-select v-model="provinceId" placeholder="选择省份" @change="runAnalysis">
                <el-option v-for="p in provinces" :key="p.id" :label="p.provinceName" :value="p.id" />
              </el-select>
            </template>
            <template v-else-if="analysisType === 'type'">
              <el-select v-model="categoryId" placeholder="选择分类" @change="runAnalysis">
                <el-option v-for="c in categories" :key="c.id" :label="c.name" :value="c.id" />
              </el-select>
            </template>
            <template v-else-if="analysisType === 'custom'">
              <div class="custom-input">
                <el-input v-model="question" type="textarea" :rows="2" placeholder="请输入您想了解的问题..." @keyup.enter="runAnalysis" />
                <el-button type="primary" @click="runAnalysis" :loading="loading">发送</el-button>
              </div>
            </template>
            <template v-else>
              <el-button type="primary" @click="runAnalysis" :loading="loading">开始分析</el-button>
            </template>
          </div>

          <div v-if="loading" class="ai-loading">
            <div class="loading-spinner"></div>
            <p>AI正在分析中...</p>
          </div>

          <div v-else-if="result" class="ai-result">
            <div class="result-header">
              <span class="icon">🤖</span>
              <span>AI分析结果</span>
            </div>
            <div class="result-content">{{ result }}</div>
          </div>

          <div v-else class="ai-empty">
            <span class="icon">💡</span>
            <p>选择分析类型并点击开始，获取AI智能分析结果</p>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { getProvinces, getCategories } from '@/api'
import axios from 'axios'

const provinces = ref([])
const categories = ref([])
const analysisType = ref('overall')
const provinceId = ref(null)
const categoryId = ref(null)
const question = ref('')
const loading = ref(false)
const result = ref('')

const selectType = (type) => {
  analysisType.value = type
  result.value = ''
}

const runAnalysis = async () => {
  if (loading.value) return
  
  loading.value = true
  result.value = ''
  
  try {
    let url = 'http://localhost:8000/api/ai-analysis/'
    let data = {}
    
    if (analysisType.value === 'overall') {
      url += 'overall'
      data = { type: 'overall' }
    } else if (analysisType.value === 'province') {
      if (!provinceId.value) {
        loading.value = false
        return
      }
      url += 'province'
      data = { type: 'province', provinceId: provinceId.value }
    } else if (analysisType.value === 'type') {
      if (!categoryId.value) {
        loading.value = false
        return
      }
      url += 'type'
      data = { type: 'type', categoryId: categoryId.value }
    } else if (analysisType.value === 'custom') {
      if (!question.value.trim()) {
        loading.value = false
        return
      }
      url += 'custom'
      data = { type: 'custom', question: question.value }
    }
    
    const res = await axios.post(url, data)
    if (res.data && res.data.code === 200) {
      result.value = res.data.data
    } else {
      result.value = '分析服务暂时不可用'
    }
  } catch (err) {
    console.error(err)
    result.value = '⚠️ AI服务暂时不可用\n\n请按顺序启动服务：\n1. 先启动后端 (localhost:8081)\n2. 再启动AI服务 (localhost:8000)\n\n如已启动但仍失败，请查看终端错误信息。'
  } finally {
    loading.value = false
  }
}

onMounted(async () => {
  const [pRes, cRes] = await Promise.all([getProvinces(), getCategories()])
  if (pRes.code === 200) provinces.value = pRes.data || []
  if (cRes.code === 200) categories.value = cRes.data || []
})
</script>

<style lang="scss" scoped>
.page-header {
  margin-bottom: 20px;
  h1 { font-size: 24px; font-weight: 600; color: #212121; }
  p { color: #757575; font-size: 13px; margin-top: 4px; }
}

.ai-container {
  display: flex;
  gap: 20px;
  min-height: 500px;
}

.ai-sidebar {
  width: 280px;
  flex-shrink: 0;
}

.analysis-type {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 16px;
  background: #fff;
  border-radius: 12px;
  margin-bottom: 12px;
  cursor: pointer;
  transition: all 0.2s;
  border: 2px solid transparent;
  box-shadow: 0 2px 8px rgba(0,0,0,0.06);

  .icon { font-size: 24px; }
  
  .text {
    .title { font-size: 14px; font-weight: 600; color: #212121; }
    .desc { font-size: 12px; color: #999; margin-top: 2px; }
  }

  &:hover {
    border-color: #1976D2;
  }

  &.active {
    border-color: #1976D2;
    background: #E3F2FD;
  }
}

.ai-main {
  flex: 1;
  background: #fff;
  border-radius: 12px;
  padding: 24px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.06);
}

.ai-input-section {
  margin-bottom: 24px;
  padding-bottom: 20px;
  border-bottom: 1px solid #f0f0f0;

  .el-select { width: 200px; margin-right: 12px; }
}

.custom-input {
  display: flex;
  gap: 12px;
  align-items: flex-start;
  
  .el-textarea { flex: 1; }
}

.ai-loading {
  text-align: center;
  padding: 60px 0;
  
  .loading-spinner {
    width: 40px;
    height: 40px;
    border: 3px solid #E3F2FD;
    border-top-color: #1976D2;
    border-radius: 50%;
    animation: spin 1s linear infinite;
    margin: 0 auto 16px;
  }
  
  @keyframes spin {
    to { transform: rotate(360deg); }
  }
  
  p { color: #757575; }
}

.ai-empty {
  text-align: center;
  padding: 80px 0;
  
  .icon { font-size: 48px; display: block; margin-bottom: 16px; }
  p { color: #999; }
}

.ai-result {
  .result-header {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 16px;
    padding-bottom: 12px;
    border-bottom: 1px solid #f0f0f0;
    
    .icon { font-size: 20px; }
    span { font-weight: 600; color: #212121; }
  }
  
  .result-content {
    font-size: 14px;
    line-height: 1.8;
    color: #424242;
    white-space: pre-wrap;
  }
}
</style>
