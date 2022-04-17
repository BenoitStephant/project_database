<template>
  <div class="login_page">
    <form @submit="login()" @submit.prevent>
      <h1>Login</h1>
      <div>
        <input type="string" placeholder="Username" v-model="username" />
      </div>
      <div>
        <input type="password" placeholder="Password" v-model="password" />
      </div>
      <div v-if="error">
        {{ error }}
      </div>
      <div v-if="success" id="success">Logged in Successfully</div>
      <button type="submit">Submit</button>
    </form>
    <a href="/register">Register</a>
  </div>
</template>

<script>
import { mutations, state } from "../store";
export default {
  name: "LoginPage",
  data: () => ({
    username: "",
    password: "",
    error: null,
    success: false,
  }),
  methods: {
    login: async function () {
      const auth = { username: this.username, password: this.password };
      // Correct username is 'foo' and password is 'bar'
      this.success = false;
      this.error = null;

      try {
        const res = await this.axios
          .post(state.api + "login", auth)
          .then((res) => res.data);
        this.success = true;
        this.axios.defaults.headers.common = {
          Authorization: "Bearer " + res.access_token,
        };
        mutations.setLogin(true);
        this.$router.push({ name: "Profile"})
      } catch (err) {
        this.error = err.message;
      }
    },
  },
};
</script>

<style scoped></style>
