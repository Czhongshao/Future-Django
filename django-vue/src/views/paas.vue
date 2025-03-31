<!-- src/views/pass.vue -->
<template>
    <div>
        paas
        <button @click="getChange">anniu</button>
    </div>
</template>
 
<script>
// 导入api
export default {
    name: "PaasView",
    methods: {
        async getChange() {
            console.log('请求错误')
            try {
                const data = await paasClusterInfo('GET', 'action=list') // 调用paasClusterInfo
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


