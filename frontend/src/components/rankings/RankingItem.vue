<template>
<div class="ranking_item">
  <div class="ranking_item_name">{{name}}</div>
  <img class="ranking_item_icon" :src="imgSrc" :alt="name">
  <button class="ranking_item_concepts" v-for="themeScore in themeScores" :key="themeScore">{{themeScore}}</button>
</div>
</template>

<script>
export default {
  name: "RankingItem",
  props: ["id", "name", "imgSrc", "themeScores"],
  data() {
    return {
    }
  }
}
</script>

<style scoped>

</style>