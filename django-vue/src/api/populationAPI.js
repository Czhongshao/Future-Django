// django-vue/src/api/populationAPI.js
import axios from 'axios';

// 基础 URL
const API_Population_URL = 'http://127.0.0.1:8000/api/';

// 获取人口数据
export function getPopulationData(params = {}) {
    return axios.get(`${API_Population_URL}`, { params })
        .then(response => {
            return response.data;
        })
        .catch(error => {
            console.error('Error fetching population data:', error);
            throw error;
        });
}

// 获取特定年份的人口数据
export function getPopulationDataByYear(year) {
    return getPopulationData({ year });
}

// 获取特定省份的人口数据
export function getPopulationDataByProvince(province) {
    return getPopulationData({ province });
}

// 获取特定年份和省份的人口数据
export function getPopulationDataByYearAndProvince(year, province) {
    return getPopulationData({ year, province });
}