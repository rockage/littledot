<template>
<div style="
          display: flex;
          flex-direction: column;
          align-items: center;
          background: #e1e4e3;
          width:100%;
          ">
  <div class="grid_box" style="background:white;width:95%;box-shadow: darkgrey 1px 1px 1px 1px;">
    <v-card
      tile
      v-for="item in card_datas"
      v-bind:key="item.id"
      max-width="160px"
      max-height="320px"
      style="margin-top:5px;margin-bottom:5px;">
      <v-img @click="route(item.name)"  :src="'/static/products/' + item.name + '/main.jpg'" style="cursor:pointer;"></v-img>  
      
              
      <v-card-title> {{ item.name }} </v-card-title>          
      <v-card-subtitle>{{ item.description }}</v-card-subtitle>

    </v-card>
  </div>
  </div>
</template>
<script>
export default {
  name: "products",
  props: ["sort"],
  data() {
    return {
      show: false,
      card_datas: [],
    };
  },
  computed: {},
  watch: {
    // 如果路由有变化，视图即时刷新
    $route: "viewInit",
  },
  methods: {
    viewInit: function () {
      let me = this;
      let param = new URLSearchParams();
      param.append("sortMethods", "default");
      if (this.sort == "all") {
        param.append("Class", "all"); // index页面查询所有产品
      } else {
        param.append("Class", this.$route.params.msg);
      }
      this.axios.post("productList", param).then((response) => {
        if (response.data) {
          me.card_datas = JSON.parse(response.data);
        }
      });
    },
    route: function (product_name) {
      this.$router.push({
        name: "products_view",
        params: {
          msg: product_name,
        },
      });
    },
  },
  created() {
    this.viewInit();
  },
  mounted: function () {},
};
</script>
<style>
.grid_box {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(160px, max-content));
  justify-content: space-between;

}
</style>
