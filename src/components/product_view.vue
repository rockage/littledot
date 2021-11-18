<template>
  <div id="editor">
    <div v-html="output"></div>
  </div>
</template>
<script>
import { marked } from "marked"

export default {
  name: "products",
  data() {
    return {
      input: "",
      output: "",
    }
  },
  computed: {},
  watch: {},
  methods: {
    readFile: function () {
      let me = this
      let product_name = this.$route.params.msg
      let url = "/static/products/" + product_name + "/" + product_name + ".md"
      this.axios({ url: url, baseURL: "" })
        .then((response) => {
          if (response.data) {
            console.log(response.data)
            me.output = marked(response.data)
          } else {
          }
        })
        .catch(function (err) {
          me.output = marked(
            '<h1 class="h1-text">Sorry, this page is under construction</h1>'
          )
        })
    },
  },
  mounted: function () {
    this.readFile()
    //console.log( marked(this.input))
  },
}
</script>
<style>
.h1-text {
  text-align: center;
  margin-top: 30%;
}
</style>
