import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/views/Home.vue'
import HeritageList from '@/views/HeritageList.vue'
import HeritageDetail from '@/views/HeritageDetail.vue'
import InheritorList from '@/views/InheritorList.vue'
import Statistics from '@/views/Statistics.vue'
import NewsList from '@/views/NewsList.vue'
import AIAnalysis from '@/views/AIAnalysis.vue'
import About from '@/views/About.vue'

const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/heritage', name: 'HeritageList', component: HeritageList },
  { path: '/heritage/:id', name: 'HeritageDetail', component: HeritageDetail },
  { path: '/inheritors', name: 'InheritorList', component: InheritorList },
  { path: '/statistics', name: 'Statistics', component: Statistics },
  { path: '/news', name: 'NewsList', component: NewsList },
  { path: '/ai-analysis', name: 'AIAnalysis', component: AIAnalysis },
  { path: '/about', name: 'About', component: About }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
