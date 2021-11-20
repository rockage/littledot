<template>
  <div class="grid_box">
    <v-card
      class="ma-1"
      tile
      v-for="item in card_datas"
      v-bind:key="item.id"
      max-width="320px"
      max-height="480px"
    >
      <v-img :src="item.img"></v-img>          
      <v-card-title> {{ item.title }} </v-card-title>          
      <v-card-subtitle>
                    {{ item.description }}          
      </v-card-subtitle>
               
      <v-card-actions>
                   
        <v-btn color="orange lighten-2" text @click="route(item.name)">
                        Explore            
        </v-btn>
                 
      </v-card-actions>
             
    </v-card>
  </div>
</template>
<script>
export default {
  name: "products",
  data() {
    return {
      show: false,
      card_datas: [],
    }
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
          console.log( me.card_datas )
        }
      })
    },
    route: function (product_name) {
      this.$router.push({
        name: "products_view",
        params: {
          msg: product_name,
        },
      })
    },
  },
  created() {
    this.viewInit()
  },
  mounted: function () {},
}
</script>
<style>
.grid_box {
  display: grid;
  grid-template-columns: repeat(auto-fill, 320px);
  justify-content: center;
}
</style>
