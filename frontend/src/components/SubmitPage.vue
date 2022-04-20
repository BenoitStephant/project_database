<template>
  <div class="submit_page">
    <div class="go_to_login" v-if="!isLogged">
      Please login before add
    </div>
    <div class="submit_cat" v-else>
      <input type="text" placeholder="Category name">
      <button>Send category</button>
    </div>
  </div>
</template>

<script>
import { state } from "../store";
export default {
  name: "SubmitPage",
  data() {
    return {
      isLogged: state.isLogged
    }
  }
}
</script>

<style scoped>
.submit_page {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: calc(100vh - 70px);
}
.submit_cat{
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.submit_cat input{
  margin-bottom: 10px;
}
</style>