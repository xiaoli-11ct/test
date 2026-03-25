import axios from 'axios'

const request = axios.create({
  baseURL: '/api',
  timeout: 30000
})

request.interceptors.response.use(
  response => response.data,
  error => {
    console.error('API Error:', error)
    return Promise.reject(error)
  }
)

export const getProvinces = () => request.get('/province/list')

export const getCategories = () => request.get('/category/list')

export const getHeritageList = (params) => request.get('/heritage/list', { params })

export const getHeritageById = (id) => request.get(`/heritage/${id}`)

export const getHeritageStats = () => request.get('/heritage/stats')

export const getInheritorList = (params) => request.get('/inheritor/list', { params })

export const getInheritorStats = () => request.get('/inheritor/stats')

export const getNationalStats = () => request.get('/statistics/national')

export const getProvinceStats = () => request.get('/statistics/provinces')

export const getNewsList = () => request.get('/news/list')
