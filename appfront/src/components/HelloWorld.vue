<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <!-- 显示书籍列表 -->
    <ul>
      <li v-for="(book, index) in books" :key="index" style="display:block">
        {{ index }} - {{ book.name }} - {{ book.author }}
      </li>
    </ul>
    <!-- 添加书籍表单 -->
    <form @submit.prevent="bookSubmit">
      输入书名：<input type="text" placeholder="book name" v-model="inputBook.name"><br>
      输入作者：<input type="text" placeholder="book author" v-model="inputBook.author"><br>
      <button type="submit">提交</button>
    </form>
  </div>
</template>

<script>
import { getBooks, postBook } from '../api/api.js'

export default {
  name: 'HelloWorld',
  data() {
    return {
      msg: '欢迎使用 Vue.js 应用',
      books: [], // 存储书籍列表
      inputBook: {
        name: '',
        author: ''
      }
    }
  },
  methods: {
    loadBooks() {
      getBooks()
        .then(response => {
          this.books = response.data
        })
        .catch(error => {
          console.error('加载书籍失败:', error)
        })
    },
    bookSubmit() {
      postBook(this.inputBook.name, this.inputBook.author)
        .then(response => {
          console.log('添加书籍成功:', response.data)
          this.loadBooks() // 重新加载书籍列表
        })
        .catch(error => {
          console.error('添加书籍失败:', error)
        })
    }
  },
  created() {
    this.loadBooks() // 页面加载时获取书籍列表
  }
}
</script>