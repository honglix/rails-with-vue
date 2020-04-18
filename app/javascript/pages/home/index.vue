<template>
  <div>
    <h1>Home</h1>
    <p><router-link :to="{ path: 'privacy' }">Privacy Policy</router-link></p>

    <template v-if="posts">
      <post v-bind:post="post" v-for="post in posts" :key="post.id"></post>
    </template>

    <template v-else>
      <p><a href="#" v-on:click.prevent="getPosts">Get Posts</a></p>
      <el-row>
  <el-button>默认按钮</el-button>
  <el-button type="primary">主要按钮</el-button>
  <el-button type="success">成功按钮</el-button>
  <el-button type="info">信息按钮</el-button>
  <el-button type="warning">警告按钮</el-button>
  <el-button type="danger">危险按钮</el-button>
</el-row>
    </template>
  </div>
</template>

<script>

import Post from '../../components/post.vue'

export default {
  components: {
    'post': Post
  },
  data: function () {
    return {
      posts: null
    }
  },
  methods: {
    getPosts: function() {
      this.axios.get('https://jsonplaceholder.typicode.com/posts').then((response) => {
        this.posts = response.data
      })
    }
  }
}
</script>

<style lang="scss" scoped>
   @import '../../scss/application.scss'
</style>
