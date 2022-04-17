import { createApp } from "vue";
import App from "./App.vue";
import { createRouter, createWebHistory } from "vue-router";
import VueCookies from "vue-cookies";
import routes from "./router/index";
import axios from "axios";
import VueAxios from "vue-axios";

const router = createRouter({ history: createWebHistory(), routes });

const app = createApp(App).use(router).use(VueCookies).use(VueAxios, axios);

app.mount("#app");
