<template>
  <div class="text-caption">
    <div
      class="box"
      style="align-content: flex-start;flex-flow: row wrap;"
    >
      <div class = "box-item">
        <v-card class="mx-auto" max-width="300">
          <v-img src="/static/products/mk2/main.jpg" height="300px"></v-img>
          <v-card-title> MK-12 Headphone Amp. </v-card-title>
          <v-card-subtitle>
            A classic entry-level pure tubes amp.
          </v-card-subtitle>
          <v-card-actions>
            <v-btn color="orange lighten-2" text> Explore </v-btn>
          </v-card-actions>
        </v-card>
      </div>
      <div class = "box-item">
        <v-card class="mx-auto" max-width="300">
          <v-img src="/static/products/ldh1/main.jpg" height="300px"></v-img>
          <v-card-title> MK-11 Headphone Amp. </v-card-title>
          <v-card-subtitle>
            A classic entry-level pure tubes amp.
          </v-card-subtitle>
          <v-card-actions>
            <v-btn color="orange lighten-2" text> Explore </v-btn>
          </v-card-actions>
        </v-card>
      </div>

      <div class = "box-item">
        <v-card class="mx-auto" max-width="300">
          <v-img src="/static/products/ld1+/main.jpg" height="300px"></v-img>
          <v-card-title> LD1+ Headphone Amp. </v-card-title>
          <v-card-subtitle>
            A classic entry-level hybrid tubes amp.
          </v-card-subtitle>
          <v-card-actions>
            <v-btn color="orange lighten-2" text> Explore </v-btn>
          </v-card-actions>
        </v-card>
      </div>

      <div class = "box-item">
        <v-card class="mx-auto" max-width="300">
          <v-img src="/static/products/mk3/main.jpg" height="300px"></v-img>
          <v-card-title> MK-3 Headphone Amp. </v-card-title>
          <v-card-subtitle>
            A classic entry-level pure tubes amp.
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
    };
  },
  computed: {},
  methods: {
    TEST1: function () {},
  },
  mounted: function () {},
};
</script>
<style>
.box {
  display: flex;
}
.box-item {
  flex:0 0 300px;
  margin: 10px;
}
</style>
