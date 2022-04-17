import { reactive } from 'vue'

export const state = reactive({ isLogged: false, api: "http://localhost:3030/" });

export const mutations = {
  setLogin(newVal) {
    state.isLogged = newVal;
  },
};
