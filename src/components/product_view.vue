<template>
  <div id="editor">
    <textarea :value="input"></textarea>
    <div v-html="output"></div>
  </div>
</template>
<script>
import { marked } from "marked";

export default {
  name: "products",
  data() {
    return {
      input: "",
      output: "",
    };
  },
  computed: {},
  watch: {},
  methods: {
    readFile: function () {
      this.axios({ url: "/static/products/mk2/mk2.md", baseURL: "" }).then(
        (response) => {
          if (response.data) {
            console.log(response.data);
            this.output = marked(response.data);
            console.log("okok");
          }
        }
      );
    },
  },
  mounted: function () {
    this.readFile();
    //console.log( marked(this.input))
  },
};
</script>
<style>
html,
body,
#editor {
  margin: 0;
  height: 100%;
  font-family: "Helvetica Neue", Arial, sans-serif;
  color: #333;
}

textarea,
#editor div {
  display: inline-block;
  width: 49%;
  height: 100%;
  vertical-align: top;
  box-sizing: border-box;
  padding: 0 20px;
}

textarea {
  border: none;
  border-right: 1px solid #ccc;
  resize: none;
  outline: none;
  background-color: #f6f6f6;
  font-size: 14px;
  font-family: "Monaco", courier, monospace;
  padding: 20px;
}

code {
  color: #f66;
}
</style>
