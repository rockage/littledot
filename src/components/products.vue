<template>
  <div class="text-caption">
    {{ $route.params.msg }}
    <div class="box" style="align-content: flex-start; flex-flow: row wrap">
      <div class="box-item" v-for="item in card_datas" v-bind:key="item.id">
        <v-card class="mx-auto" max-width="300">
          <v-img :src="item.img" height="300px"></v-img>
          <v-card-title> {{ item.title }} </v-card-title>
          <v-card-subtitle>
            {{ item.description }}
          </v-card-subtitle>
          <v-card-actions>
            <v-btn color="orange lighten-2" text> Explore </v-btn>
          </v-card-actions>
        </v-card>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "products",
  data() {
    return {
      show: false,
      card_datas: [],
    };
  },
  computed: {

  },
  watch: {
    // 如果路由有变化，视图即时刷新
    $route: "viewInit",
  },
  methods: {
    viewInit: function () {
      let me = this;
      let param = new URLSearchParams();
      param.append("sortMethods", "default");
      param.append("Class", this.$route.params.msg);
      this.axios.post("productList", param).then((response) => {
        if (response.data) {
          this.card_datas = JSON.parse(response.data);
        }
      });
    },
  },
  mounted: function () {
    this.viewModel = this.$route.params.msg;
  },
};
</script>
<style>
.box {
  display: flex;
}
.box-item {
  flex: 0 0 300px;
  margin: 10px;
}
</style>
