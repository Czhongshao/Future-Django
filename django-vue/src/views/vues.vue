<!-- src/views/vues.vue -->
<template>
    <div>
        vues
        <button @click="getChange">anniu</button>
    </div>
</template>
 
<script>
// 导入api
import { vuesClusterInfo } from '@/api/vuesinfo'
export default {
    name: "VuesView",
    methods: {
        async getChange() {
            console.log('请求错误')
            try {
                const data = await vuesClusterInfo('GET', 'action=list') // 调用vuesClusterInfo
                console.log(data)
            } catch (error) {
                console.error('An error occurred: ', error)
            }
        }
    }
}
</script>
 
<style>
/* 这里可以添加一些页面样式 */
</style>


