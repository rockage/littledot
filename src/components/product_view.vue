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
import { marked } from "marked";

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
      let url = "/static/products/" + product_name + "/info.md";
      this.axios({ url: url, baseURL: "" })
        .then((response) => {
          if (response.data) {
            me.carousel = true;
            me.output = marked(response.data);

            for (let i = 1; i <= 5; i++) {
              me.pic_group.push({
                src: "/static/products/" + product_name + "/" + String(i) + ".jpg",
              });
            }
          } else {
          }
        })
        .catch(function (err) {
          me.carousel = false;
          me.output = marked(
            '<h1 class="h1-text">Sorry, this page is under construction</h1>'
          );
        });
    },
  },
  mounted: function () {
    this.readFile();
  },
};
</script>
<style>
.h1-text {
  text-align: center;
  margin-top: 10px;
}

.html_output {
  line-height: 2 !important;
  font-family: "Lato", sans-serif;
}

.main {
  display: flex;
  margin: 10px;
  flex-direction: column;
}

.main img {
  width: 90%;
  height: auto;
}


</style>
