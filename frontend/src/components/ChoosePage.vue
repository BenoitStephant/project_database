<template>
  <div class="choose_page">
    <div v-if="isLogged" class="match_ui">
      <div class="match_header">
        <div class="match_category">Category</div>
        <select
          name="category_combobox"
          id="categoriesBox"
          @change="onCategoryChange($event)"
          v-model="selectedCategory"
        >
          <option
            v-for="category in categories"
            :value="category.id"
            :key="category.id + category.name"
          >
            {{ category.name }}
          </option>
        </select>
        <hr />
        <div class="match_concept">Concept</div>
        <div class="match_concept_name">
          {{ currentMatch.concept.name }}
        </div>
      </div>
      <div class="match_content">
        <div class="match_choice">
          <img
            class="match_image"
            alt="Dog"
            v-bind:src="currentMatch.items[0].image_url"
          />
          <div class="choice_name">{{ currentMatch.items[0].name }}</div>
          <p class="choice_desc">{{ currentMatch.items[0].description }}</p>
          <button @click="onChooseButton(0)">choose 1</button>
        </div>
        <div class="vhr"></div>
        <div class="match_choice">
          <img
            class="match_image"
            alt="Cat"
            v-bind:src="currentMatch.items[1].image_url"
          />
          <div class="choice_name">{{ currentMatch.items[1].name }}</div>
          <p class="choice_desc">{{ currentMatch.items[1].description }}</p>
          <button @click="onChooseButton(1)">choose 2</button>
        </div>
      </div>
      <button @click="onCantChoose()">I can't choose</button>
    </div>
    <div v-else>Please login</div>
  </div>
</template>

<script>
import { state } from "../store";
import { defineComponent } from "vue";

async function onCategoryChange(event) {
  this.selectedCategory = event.target.value;
  try {
    this.currentMatch = await this.axios
      .get(state.api + "match", {
        params: { category_id: this.selectedCategory },
      })
      .then((res) => res.data);
  } catch (error) {
    console.log(error);
  }
  console.log(this.selectedCategory);
  console.log(this.currentMatch);
}

async function onChooseButton(winner) {
  try {
    this.success = await this.axios
      .post(state.api + "match", {
        category_id: this.selectedCategory,
        concept_id: this.currentMatch.concept.id,
        item_0_id: this.currentMatch.items[0].id,
        item_1_id: this.currentMatch.items[1].id,
        winner: winner,
        user_id: "4fb037c4-4b00-447b-9f68-2f546af63f4f",
      })
      .then((res) => {
        res.data;
      });
    console.log(this.success);
    this.currentMatch = await this.axios
      .get(state.api + "match", {
        params: { category_id: this.selectedCategory },
      })
      .then((res) => res.data);
  } catch (error) {
    console.log(error);
  }
}

async function onCantChoose() {
  try {
    this.currentMatch = await this.axios
      .get(state.api + "match", {
        params: { category_id: this.selectedCategory },
      })
      .then((res) => res.data);
  } catch (error) {
    console.log(error);
  }
}

export default defineComponent({
  name: "ChoosePage",
  data: () => ({
    categories: [],
    loading: true,
    selectedCategory: 1,
    currentMatch: {},
    isLogged: state.isLogged,
  }),
  async beforeMount() {
    if (!state.isLogged) {
      this.$router.push({ name: "Login" });
    } else {
      try {
        this.currentMatch = await this.axios
          .get(state.api + "match", {
            params: { category_id: this.selectedCategory },
          })
          .then((res) => {
            this.loading = true;
            return res.data;
          });
        this.categories = await this.axios
          .get(state.api + "categories")
          .then((res) => {
            this.loading = true;
            return res.data.categories;
          });
      } catch (error) {
        console.log(error);
      }
    }
  },
  methods: {
    onCategoryChange,
    onChooseButton,
    onCantChoose,
  },
});
</script>

<style scoped>
.choose_page {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: calc(100vh - 40px);
}
.match_ui {
  display: flex;
  flex-direction: column;
  background-color: gray;
  padding: 15px;
  border-radius: 10px;
  color: white;
  box-shadow: 5px 10px 20px -10px black;
}
.match_content {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  margin: 10px;
}
.match_concept_name {
  font-style: italic;
}
.match_footer {
  background-color: aqua;
}
.match_choice {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  margin: 10px;
}
.match_image {
  border-radius: 100px;
  height: 100px;
  width: 100px;
  object-fit: contain;
  margin-bottom: 15px;
  background-color: white;
  box-shadow: 0px 0px 25px -12px black;
}
.vhr {
  display: inline;
  border-right: 1px solid white;
  margin: 40px 10px;
}
</style>
