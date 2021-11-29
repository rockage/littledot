<template>
  <div
    style="
      background: #e1e4e3;
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
        background: #eeeeee;
        box-shadow: darkgrey 1px 1px 1px 1px;
        margin-bottom: 0px;
      "
      v-for="(v, i) in card_datas"
      :key="i"
    >
      <DIV
        style="
          margin-left: 5px;
          height: 35px;
          background: #eeeeee;
          display: flex;
          flex-direction: row;
          align-items: center;
          font-weight: 900;
          font-size: middle;
        "
      >
        <img src="/static/arrow.png" style="margin-right: 5px" />
        {{ p_types[i] }}
      </DIV>

      <div
        style="
          display: flex;
          flex-wrap: wrap;
          background: white;
          width: 100%;
          padding: 10px;
        "
      >
        <v-card
          tile
          v-for="item in v"
          v-bind:key="item.id"
          max-width="160px"
          max-height="320px"
          style="margin: 5px; border-radius: 25px"
        >
          <v-img
            @click="route(item.name)"
            :src="'/static/products/' + item.name + '/main.jpg'"
            style="cursor: pointer"
          ></v-img>
                    <v-card-title> {{ item.name }} </v-card-title>          
          <v-card-subtitle>{{ item.description }}</v-card-subtitle>
        </v-card>
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
        3: "Solid State Headphone Amplifier",
        4: "Headphone & Speaker Dual Use",
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
      let local_data = {};
      if (this.sort == "all") {
        param.append("p_type", "all"); // index页面查询所有产品
      } else {
        param.append("p_type", this.$route.params.msg);
      }
      this.axios.post("productList", param).then((response) => {
        if (response.data) {
          let raw_datas = JSON.parse(response.data);
          let last_type = 0;
          for (let x in raw_datas) {
            if (last_type != raw_datas[x].type) {
              local_data[raw_datas[x].type] = new Array(); // type 如果和前一次不同，说明切换了一个分类
            }
            local_data[raw_datas[x].type].push(raw_datas[x]);

            last_type = raw_datas[x].type;
          }
          //me.card_datas = JSON.parse(JSON.stringify(local_data)); // 这个方案也可以解决vue视图不更新的问题
          me.card_datas = Object.assign({}, me.card_datas, local_data);

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
