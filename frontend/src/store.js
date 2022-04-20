import { reactive } from 'vue'

export const state = reactive({ isLogged: false, api: "http://localhost:3030/", userId: "" });

export const mutations = {
  setLogin(newVal) {
    state.isLogged = newVal;
  },
  setUserId(newVal) {
    state.userId = newVal;
  },
};
