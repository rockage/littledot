<template>
  <div class="text-caption">
    
    <div class="box">
      <div class="box-item" v-for="item in card_datas" v-bind:key="item.id">

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
  computed: {},
  watch: {
    // 如果路由有变化，视图即时刷新
    $route: "viewInit",
  },
  methods: {
    viewInit: function () {
      let me = this
      let param = new URLSearchParams()
      param.append("sortMethods", "default")
      param.append("Class", this.$route.params.msg)
      this.axios.post("productList", param).then((response) => {
        if (response.data) {
          me.card_datas = JSON.parse(response.data)
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
    this.viewInit()
  },
  mounted: function () {
    
  },
};
</script>
<style>

.box-item {
  
  background: green;
  width:50px;
  height:50px;
}
</style>
