<template>
  <div class="profile_page">
    <div>
      Welcome to the profile page (you'll be redirected instantly to /login if
      not logged in)
    </div>
    <button @click="logout()">logout</button>
  </div>
</template>

<script>
import { mutations, state } from "../store";
export default {
  name: "ProfilePage",
  beforeMount() {
    if (!state.isLogged) {
      this.$router.push({ name: "Login" });
    }
  },
  methods: {
    logout() {
      mutations.setLogin(false);
      this.axios.defaults.headers.common = {
        Authorization: "",
      };
      this.$router.push({name: "Login"})
    },
  },
};
</script>

<style scoped>
</style>