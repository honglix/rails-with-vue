<template>
  <div>
    <el-container>
      <el-main></el-main>
    </el-container>

    <el-dialog title="讓我知道你叫什麼？" :visible.sync="dialogVisible" width="30%">
      <span>Nickname:</span>
      <el-input v-model="nickname" placeholder="请输入"></el-input>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogVisible = false; createUser()">确 定</el-button>
      </span>
    </el-dialog>

    <el-row :gutter="24" justify="center" text-align="center">
      <el-col :span="4">
        <div class="grid-content bg-purple">.</div>
      </el-col>
      <el-col :span="16">
        <div class="grid-content bg-purple">
          <el-steps :active="active" finish-status="success">
            <el-step title="步骤 1"></el-step>
            <el-step title="步骤 2"></el-step>
            <el-step title="步骤 3"></el-step>
          </el-steps>
        </div>

        <el-container>
          <el-main>
            <el-button style="margin-top: 12px;" @click="next">下一步</el-button>
            <el-button v-on:click="getPosts" v-if="active == 1">點我看笑話</el-button>
            <el-container>
              <el-main v-if="active != 0 ">{{posts}}</el-main>
            </el-container>

            <el-container>
              <div class="grid-content bg-purple">
                <div class="block" v-if="active == 3 ">
                  <span class="demonstration">給個評分吧!</span>
                  <el-rate v-model="value1"></el-rate>
                </div>
              </div>
            </el-container>
          </el-main>誰用了這個app?
          <el-timeline :reverse="reverse">
            <el-timeline-item
              v-for="(user, index) in allUser"
              :key="index"
              :timestamp="user.created_at"
            >{{user.nickname}}</el-timeline-item>
          </el-timeline>
        </el-container>
      </el-col>
      <el-col :span="4"></el-col>
    </el-row>
  </div>
</template>

<script>
import Post from "../../components/post.vue";

export default {
  components: {
    post: Post
  },
  data: function() {
    return {
      posts: null,
      active: 0,
      value1: null,
      dialogVisible: false,
      nickname: "",
      allUser: [],
      reverse: true
    };
  },
  created() {
    this.axios.get("/api/v1/users").then(response => {
      this.allUser = response.data;
    });
  },

  methods: {
    getUserList: function() {},
    getPosts: function() {
      this.axios
        .get("https://autumnfish.cn/api/joke/list?&num=1")
        .then(response => {
          this.posts = response.data.jokes.toString();
        });
    },
    next() {
      if (this.active++ > 2) this.active = 0;
      if (this.active == 1) {
        (this.posts = ""), (this.dialogVisible = true);
      }
    },
    createUser() {
      console.log("Heel");
      this.axios
        .post("/api/v1/users", {
          nickname: this.nickname
        })
        .then(function(response) {
          console.log(response);
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../../scss/application.scss";
</style>
