<template>
  <div class="main">
    <v-carousel hide-delimiters v-if="carousel">
      <v-carousel-item
        v-for="(item, i) in pic_group"
        :key="i"
        :src="item.src"
        reverse-transition="fade-transition"
        transition="fade-transition"
      ></v-carousel-item>
    </v-carousel>

    <div v-html="output" class="html_output"></div>
  </div>
</template>
<script>

export default {
  name: "products",
  data() {
    return {
      carousel: false,
      output: "",
      pic_group: [],
    };
  },
  computed: {},
  watch: {},
  methods: {
    readFile: function () {
      let me = this;
      let product_name = this.$route.params.msg;
      let param = new URLSearchParams();
      param.append("product_name", product_name);

      this.axios.post("productContents", param).then((response) => {
        if (response.data) {
          me.carousel = true;
          let data = JSON.parse(response.data)
          me.output = data[0].contents
          for (let i = 1; i <= 5; i++) {
            me.pic_group.push({
              src:
                "/static/products/" + product_name + "/" + String(i) + ".jpg",
            });
          }
        }
      });
    },
  },
  mounted: function () {
    this.readFile();
  },
};
</script>


<style scoped>
img {
  max-width: 800px;
  display: block;
}



.h1-text {
  text-align: center;
  margin-top: 10px;
}

.html_output {
  line-height: 2 !important;
  white-space:pre-wrap;
  font-family: "Lato", sans-serif;
  margin-top:20px;
}

.title {
  font-size: large;
}

.main {
  display: flex;
  margin: 10px;
  flex-direction: column;
}

.main img {
  width: 100%;
  height: auto;
}
</style>
