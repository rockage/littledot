<template>
  <v-app id="LittleDot Audio">
    <v-navigation-drawer v-model="drawer" app clipped>
      <v-list dense>
        <v-subheader class="mt-4 grey--text text--darken-1"
          >PRODUCTS</v-subheader
        >
        <!-- v-subheader 是组的标题 -->
        <v-list-item
          v-for="item in products"
          :key="item.text"
          @click="route(item.path, item.msg)"
          link
        >
          <!-- v-for 是 vue的标准语法，item in items的 items 是一个数组，:key 表示唯一值 -->
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>
              {{ item.text }}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
      <v-divider></v-divider>

      <v-list dense>
        <v-subheader class="mt-4 grey--text text--darken-1"
          >COMMUNICATION</v-subheader
        >
        <!-- v-subheader 是组的标题 -->
        <v-list-item
          v-for="item in communications"
          :key="item.text"
          @click="route(item.path, item.msg)"
          link
        >
          <!-- v-for 是 vue的标准语法，item in items的 items 是一个数组，:key 表示唯一值 -->
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>
              {{ item.text }}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <!-- v-app-bar 是顶部栏，一般放一些操作类的按钮、搜索功能等 -->
    <v-app-bar app clipped-left color="white" dense>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <!-- 此处通过修改drawer变量来决定导航栏是否隐藏，PS：当宽度被压缩的时候导航栏自动隐藏（比如手机） -->
      <v-toolbar-title></v-toolbar-title>
     <img src="/static/logo.png" style="cursor:pointer;" @click="route('index','index')"> </img>
    </v-app-bar>

    <v-main>
      <router-view></router-view>
    </v-main>


  </v-app>
</template>

<script>
export default {
  name: "app",

  props: {
    source: String,
  },
  data: () => ({
    drawer: false,
    localStorage: window.localStorage,
    products: [
      {
        icon: "mdi-headphones",
        text: "Headphone Amps",
        path: "products",
        msg: "headphone_amp",
      },
      {
        icon: "mdi-speaker",
        text: "Loud Speaker Amps",
        path: "products",
        msg: "loudspeaker_amp",
      },
      {
        icon: "mdi-crop-rotate",
        text: "DAC & Streaming",
        path: "products",
        msg: "dac",
      },
      {
        icon: "mdi-sine-wave",
        text: "Power Regenerator",
        path: "products",
        msg: "regenerator",
      },
      {
        icon: "mdi-disc-player",
        text: "CD Player",
        path: "products",
        msg: "cdplayer",
      },
      {
        icon: "mdi-earbuds",
        text: "Headphone & IEMs",
        path: "products",
        msg: "iems",
      },
    ],
    communications: [
      { icon: "mdi-forum", text: "Forums", path: "forums", msg: "index" },
      { icon: "mdi-account-box", text: "Contact Us", path: "contact", msg: "index" },
    ],
  }),
  methods: {
    route: function (path, msg) {

      this.$router.push({
        name: path,
        params: {
          msg: msg,
        },
      });
    },
  },
};
</script>
<style>
@font-face {
  font-family: "Lato";
  font-style: normal;
  font-weight: 300;
  font-display: swap;
  src: url(/static/S6u9w4BMUTPHh7USeww.woff) format("woff");
}
</style>
