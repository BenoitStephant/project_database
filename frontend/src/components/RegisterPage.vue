<template>
  <div class="register_page">
    <form @submit="login()" @submit.prevent>
      <h1>Register</h1>
      <div>
        <input required type="string" placeholder="Username" v-model="username" />
      </div>
      <div>
        <input required type="password" placeholder="Password" v-model="password" @input="verifyPass()"/>
      </div>
      <div>
        <input required type="password" placeholder="PasswordCheck" v-model="passwordCheck" @input="verifyPass()" />
      </div>
      <div v-if="error">
        {{ error }}
      </div>
      <div v-if="success" id="success">Registered Successfully</div>
      <button type="submit">Submit</button>
    </form>
    <a href="/login">Login</a>
  </div>
</template>

<script>
import { state } from "../store";
export default {
  name: "RegisterPage",
  data: () => ({
    username: "",
    password: "",
    passwordCheck: "",
    error: null,
    success: false,
  }),
  methods: {
    login: async function () {
      const auth = { username: this.username, password: this.password };
      // Correct username is 'foo' and password is 'bar'
      this.success = false;
      this.error = null;

      if (this.password != this.passwordCheck){
        this.error = "Password not identical !";
        return;
      }

      try {
        const res = await this.axios
          .post(state.api + "register", auth)
          .then((res) => res.data);
        this.success = true;
        console.log(res);
        this.$router.push({ name: "Login" });
      } catch (err) {
        this.error = err.message;
      }
    },
    verifyPass: function() {
      if (this.password != this.passwordCheck){
        this.error = "Password not identical !";
        return;
      } else {
        this.error = null;
      }
    }
  },
};
</script>

<style scoped></style>
