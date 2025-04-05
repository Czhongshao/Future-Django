// django-vue/src/api/gdpAPI.js
import axios from 'axios';

// 基础 URL
const API_GDP_URL = 'http://127.0.0.1:8000/api/gdp';

// 获取人口数据
export async function getGDPData(params = {}) {
    try {
        const response = await axios.get(`${API_GDP_URL}`, { params });
        return response.data;
    } catch (error) {
        console.error('Error fetching GDP data:', error);
        throw error;
    }
}
