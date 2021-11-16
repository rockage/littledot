<template>
  <div class="text-caption">
    <div class="box" style="align-content: flex-start; flex-flow: row wrap">
      <div class="box-item"  v-for="item in card_datas" v-bind:key="item.id">
        <v-card class="mx-auto" max-width="300">
          <v-img :src="item.img" height="300px"></v-img>
          <v-card-title> {{item.title}} </v-card-title>
          <v-card-subtitle>
             {{item.description}} 
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
  name: "amp",
  data() {
    return {
      show: false,
      card_datas: [],
    };
  },
  computed: {},
  methods: {
    viewInit: function () {
      let me = this;
      let param = new URLSearchParams();
      param.append("sortMethods", "default");
      this.axios.post("productList", param).then((response) => {
        if (response.data) {
          this.card_datas = JSON.parse(response.data);
          console.log( this.card_datas );
        }
      });
    },
  },
  mounted: function () {
    this.viewInit();
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
