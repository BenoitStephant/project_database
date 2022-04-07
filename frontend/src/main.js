import {createApp} from "vue";
import App from './App.vue'
import {createRouter, createWebHistory} from "vue-router";
import routes from "./router/index"

const router = createRouter( {history: createWebHistory(), routes});

const app = createApp(App).use(router);

app.mount("#app");
