<template>
  <div class="navbar">
    <router-link to="/" class="navbar_link">Choose</router-link>
    <router-link to="/rankings" class="navbar_link">Rankings</router-link>
    <router-link to="/submit" class="navbar_link">Add One</router-link>
    <router-link to="/login" class="navbar_link">Profile</router-link>
  </div>
</template>

<script>
export default {
  name: "NavBar"
}
</script>

<style scoped>
.navbar_link {
  margin: 0 5px
}
</style>