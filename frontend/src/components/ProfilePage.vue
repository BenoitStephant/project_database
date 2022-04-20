<template>
  <div class="profile_page">
    <div class="profile_display">
      <div>
        Username: {{ userProfile.username }}
      </div>
      <div>
        Matches played: {{ userProfile.match_played }}
      </div>
      <div>
        Favorite category id: {{ userProfile.favorite_category_id }}
      </div>
      <div>
        Creation: {{ userProfile.created_at }}
      </div>
      <button class="login_button" @click="logout()">logout</button>
    </div>
  </div>
</template>

<script>
import { mutations, state } from "../store";
export default {
  name: "ProfilePage",
  data() {
    return {
      userProfile: {},
      userMatchs: {},
    };
  },
  async beforeMount() {
    if (!state.isLogged) {
      this.$router.push({ name: "Login" });
    } else {
      try {
        this.userProfile = await this.axios
          .get(state.api + "users", {
            params: { user_id: state.userId },
          })
          .then((res) => {
            return res.data.user;
          });
        this.userMatchs = await this.axios
          .get(state.api + "users/matches")
          .then((res) => {
            return res.data.matches;
          });
        console.log(this.userProfile, this.userMatchs);
      } catch (error) {
        console.log(error.response.data.message);
      }
    }
  },
  methods: {
    logout() {
      mutations.setLogin(false);
      mutations.setUserId("");
      this.axios.defaults.headers.common = {
        Authorization: "",
      };
      this.$router.push({ name: "Login" });
    },
  },
};
</script>

<style scoped>
.profile_page {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: calc(100vh - 70px);
}
.profile_display {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  background-color: gray;
  padding: 15px;
  border-radius: 10px;
  color: white;
  box-shadow: 5px 10px 20px -10px black;
}
.login_button{
  width: 100%;
  align-self: center;
  margin-top: 15px;
}
</style>