<template>
  <div style="display: flex; flex-direction: column; height: 100%; width: 100%">
           

    <div
      style="
        display: flex;
        flex-direction: column;
        align-items: center;
        background: #e1e4e3;
      "
    >
      <div
        style="
          width: 100%;
          display: flex;
          flex-direction: row;
          justify-content: center;
          background: #e1e4e3;
          flex-wrap: wrap;
        "
      >
        <img src="/static/index-left.jpg" style="width: 380px" />
        <img src="/static/index-right.jpg" style="width: 380px" />
      </div>

      <div
        style="
          width: 90%;
          display: flex;
          flex-direction: column;
          align-items: center;
          background: #ffffff;
          flex-wrap: wrap;
          padding: 15px;
          margin-top: 5px;
          margin-bottom: 20px;
          font-family: 'Lato', sans-serif;
          box-shadow: darkgrey 1px 1px 1px 1px;
        "
      >
        <SPAN style="font-weight:bold;font-size:large;">LD-ZERO Hybrid Tube Headphone Amp</SPAN>
        <BR></BR>
        ■ Released in November 2021 <BR></BR> ■ Build in USB DAC <BR></BR> ■
        LDAC Blueteeth 5.0 <BR></BR>
        ■ DC Battery Power Available      

        <v-btn color="orange lighten-2" text @click="route(item.name)"
          ><SPAN style="font-weight:bold;">Explore</SPAN></v-btn
        >
      </div>
    </div>

           

    <products sort="all"></products>
  </div>
</template>
<script>
import products from "./products.vue";
export default {
  name: "index",
  data() {
    return {};
  },
  components: {
    // <runoob> 将只在父模板可用
    products,
  },
  computed: {},
  watch: {},
  methods: {},
  created() {},
  mounted: function () {},
};
</script>
<style></style>
