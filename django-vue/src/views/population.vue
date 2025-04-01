<template>
  <div class="population-data-container">
    <h1>人口数据</h1>
    <div class="button-group">
      <button @click="fetchData">获取数据</button>
      <button @click="fetchDataByYear">按年份获取数据</button>
      <button @click="fetchDataByProvince">按省份获取数据</button>
      <button @click="fetchDataByYearAndProvince">按年份和省份获取数据</button>
      <button @click="fetchPaginatedData">分页获取数据</button>
    </div>

    <div v-if="data" class="data-display">
      <h2>数据</h2>
      <ul>
        <li v-for="item in data.data" :key="item.province">
          {{ item.province }} {{ item.year }}年 总人口：{{ item.total_population }} 万人
        </li>
      </ul>
      <p>总页数: {{ data.total_pages }}</p>
      <p>当前页: {{ data.current_page }}</p>
    </div>

    <!-- 分页按钮 -->
    <div v-if="data" class="pagination">
      <button @click="goToPage(1)" :disabled="currentPage === 1">首页</button>
      <button @click="prevPage" :disabled="currentPage <= 1">上一页</button>
      <button @click="nextPage" :disabled="currentPage >= data.total_pages">下一页</button>
      <button @click="goToPage(data.total_pages)" :disabled="currentPage === data.total_pages">尾页</button>
    </div>
  </div>
</template>

<script>
import {
  getPopulationData,
  getPopulationDataByYear,
  getPopulationDataByProvince,
  getPopulationDataByYearAndProvince,
  getPaginatedPopulationData
} from '@/api/populationAPI';

export default {
  data() {
    return {
      data: null,
      currentPage: 1, // 当前页码
      pageSize: 10 // 每页显示的数据条数
    };
  },
  methods: {
    fetchData() {
      getPopulationData().then(data => {
        this.data = data;
      });
    },
    fetchDataByYear() {
      getPopulationDataByYear(2023).then(data => {
        this.data = data;
      });
    },
    fetchDataByProvince() {
      getPopulationDataByProvince('北京').then(data => {
        this.data = data;
      });
    },
    fetchDataByYearAndProvince() {
      getPopulationDataByYearAndProvince(2023, '北京').then(data => {
        this.data = data;
      });
    },
    fetchPaginatedData() {
      // 根据当前页码和每页大小请求分页数据
      getPaginatedPopulationData(this.currentPage, this.pageSize).then(data => {
        this.data = data;
      });
    },
    prevPage() {
      if (this.currentPage > 1) {
        this.currentPage -= 1; // 减少当前页码
        this.fetchPaginatedData(); // 重新请求分页数据
      }
    },
    nextPage() {
      if (this.data && this.currentPage < this.data.total_pages) {
        this.currentPage += 1; // 增加当前页码
        this.fetchPaginatedData(); // 重新请求分页数据
      }
    },
    goToPage(page) {
      if (page !== this.currentPage) {
        this.currentPage = page; // 设置当前页码
        this.fetchPaginatedData(); // 重新请求分页数据
      }
    }
  }
};
</script>

<style scoped>
.population-data-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 8px;
  background-color: #f9f9f9;
}

.button-group {
  margin-bottom: 20px;
}

.button-group button {
  margin-right: 10px;
  padding: 8px 16px;
  font-size: 14px;
  cursor: pointer;
}

.data-display {
  margin-bottom: 20px;
}

.data-display ul {
  list-style-type: none;
  padding: 0;
}

.data-display li {
  margin-bottom: 10px;
}

.pagination {
  display: flex;
  justify-content: center;
  gap: 10px;
}

.pagination button {
  padding: 8px 16px;
  font-size: 14px;
  cursor: pointer;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
}

.pagination button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}
</style>