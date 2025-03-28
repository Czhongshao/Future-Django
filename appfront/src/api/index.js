import Axios from 'axios'

const axiosInstance = Axios.create({
    baseURL: 'http://localhost:8000', // 后端 API 地址
    withCredentials: true // 允许跨域请求携带 Cookie
})

// CSRF Token 拦截器
axiosInstance.interceptors.request.use((config) => {
    config.headers['X-Requested-With'] = 'XMLHttpRequest'
    const match = document.cookie.match(/csrftoken=([^;]+)/)
    if (match) {
        config.headers['X-CSRFToken'] = match[1]
    }
    return config
}, (error) => {
    return Promise.reject(error)
})

export default axiosInstance