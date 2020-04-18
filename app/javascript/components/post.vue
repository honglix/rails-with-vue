<template>
  <div>
    <h2>{{ post.title }}</h2>
    <p>{{ post.body }}</p>
    <hr />

      <el-radio v-model="radio" label="1">备选项</el-radio>
  <el-radio v-model="radio" label="2">备选项</el-radio>


  </div>
</template>

<script>
export default {
  props: ['post'],
    data () {
      return {
        radio: '1'
      };
    }
}
</script>
