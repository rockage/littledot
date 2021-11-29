<template>
  <div
    style="
      background: red;
      width: 100%;
      font-family: 'Lato', sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
    "
  >
    <div
      style="
        width: 95%;
        background: green;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      "
    >
      <div style="width: 90%; background: orange" v-for="(v, i) in card_datas">
        {{ v }} - {{ i }}
      </div>
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
      card_datas: {},
      p_types: {
        1: "Tube Headphone Amplifier",
        2: "Hybrid Headphone Amplifier",
        3: "Solid State Amplifier",
        4: "Speaker Amplifier",
        5: "DAC & Streaming",
        6: "Power Regenerator",
        7: "CD Player",
        8: "Headphone & IEMs",
      },
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
          let raw_datas = JSON.parse(response.data);
          let last_type = 0;
          for (let x in raw_datas) {
            if (last_type != raw_datas[x].type) {
              me.card_datas[raw_datas[x].type] = new Array(); // type 如果和前一次不同，说明切换了一个分类
            }
            me.card_datas[raw_datas[x].type].push(raw_datas[x]);
            last_type = raw_datas[x].type;
          }
          console.log(me.card_datas);
          //this.card_datas = {1:1,2:2,3:3}
        }
      });
    },
    route: function (product_name) {
      this.$router.push({
        name: "product_view",
        params: {
          msg: product_name,
        },
      });
    },
  },
  created() {},
  mounted: function () {
    setTimeout(() => {
      this.viewInit(); //娃娃消失
    }, 4000);
  },
};
</script>
<style>
.grid_box {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(160px, max-content));
  justify-content: space-between;
}
</style>
