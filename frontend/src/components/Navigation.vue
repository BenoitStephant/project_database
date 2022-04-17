<template>
  <div class="navbar_custom">
    <router-link to="/" class="navbar_link">Choose</router-link>
    <router-link to="/rankings" class="navbar_link">Rankings</router-link>
    <router-link to="/submit" class="navbar_link">Add One</router-link>
    <router-link v-if="state.isLogged" to="/profile" class="navbar_link">Profile</router-link>
    <router-link v-else to="/login" class="navbar_link">Login</router-link>
  </div>
</template>

<script>
import { state } from '../store'
export default {
  name: "NavBar",
  data() {
    return {
      state
    }
  }
}
</script>

<style scoped>
.navbar_custom {
  background-color: lightgray;
  display: flex;
  padding-left: 10px;
  align-items: center;
  height: 40px;
}
.navbar_link {
  margin: 0 5px;
}
</style>