<template>
  <div class="rankings_page">
    <div class="data_container">
      <h2>All items rankings</h2>
      <div class="filter_header">
        <div class="category_header">
          Choose category:
          <select
            name="category_combobox"
            id="categoriesBox"
            @change="onCategoryChange($event)"
          >
            <option
              v-for="category in categories"
              :value="category.id"
              :key="category.id"
            >
              {{ category.name }}
            </option>
          </select>
        </div>
        <div class="theme_header">
          Choose theme:
          <select
            name="theme_combobox"
            id="themes"
            @change="onThemeChange($event)"
          >
            <!-- Depends on the category -->
            <option
              v-for="theme in categories[selectedCategory].themes"
              :value="theme"
              :key="theme"
            >
              {{ theme }}
            </option>
            Emotions
          </select>
        </div>
      </div>
      <table-lite
        v-if="!loadingB"
        :is-slot-mode="true"
        :is-static-mode="true"
        :columns="table.columns"
        :rows="table.rows"
        :total="table.totalRecordCount"
        :sortable="table.sortable"
        class="in_table"
      ></table-lite>
    </div>
  </div>
</template>

<script>
import TableLite from "vue3-table-lite";
import { reactive, defineComponent } from "vue";
import { state } from "../../store";

function onCategoryChange(event) {
  this.selectedCategory = this.categories.findIndex(function (item) {
    return item.id === event.target.value;
  });
  console.log(this.selectedCategory);
  console.log(event.target.value);
}

function onThemeChange(event) {
  this.selectedTheme = event.target.value;
  queryCategoryContentFromCategoryAndTheme(
    this.categories[this.selectedCategory].id,
    this.selectedTheme
  );
}

function queryCategoryContentFromCategoryAndTheme(category, theme) {
  console.log("Fetching all items corresponding to:");
  console.log({ category, theme });
  //categoryContent = queryCodeHere();
}

export default defineComponent({
  name: "RankingsPage",
  components: { TableLite },
  data() {
    return {
      //This should be fetched on from DB on page load
      categories: [
        { id: "movies", name: "Movies", themes: ["emotion", "appreciation"] },
        {
          id: "animals",
          name: "Animals",
          themes: ["morphology", "appreciation", "emotions"],
        },
        {
          id: "household_objects",
          name: "Household Objects",
          themes: ["function", "material"],
        },
        { id: "tools", name: "Tools", themes: ["function", "material"] },
        {
          id: "paintings",
          name: "Paintings",
          themes: ["emotion", "appreciation"],
        },
        {
          id: "musical_instruments",
          name: "Musical Instruments",
          themes: ["emotion", "appreciation"],
        },
      ],
      concepts: [],
      loadingB: true,

      //This is fetched from the DB on theme selection
      categoryContent: {
        concepts: [
          { id: "exciting", name: "Exciting" },
          { id: "joyful", name: "Joyful" },
          { id: "scary", name: "Scary" },
          { id: "sinister", name: "Sinister" },
        ],
        items: [
          {
            id: "DummyMovie",
            name: "I just need content",
            imgSrc: "link",
            themeScores: [2000, 750, 1750, 900],
          },
        ],
      },

      selectedCategory: 0,
      selectedTheme: "",
    };
  },
  async beforeMount() {
    try {
      // this.categories = await this.axios
      //   .get(state.api + "categories")
      //   .then((res) => {
      //     this.loadingA = false;
      //     return res.data
      //   });
      this.table.rows = await this.axios.get(state.api + "concepts").then((res) => {
        this.loadingB = false;
        return res.data;
      });
      this.table.totalRecordCount = this.table.rows.length;
    } catch (error) {
      const err = error;
      this.error = "Serveur error:" + err.message;
    }
  },
  setup() {
    // Table config
    const table = reactive({
      columns: [
        {
          label: "ID",
          field: "id",
          width: "3%",
          sortable: true,
          isKey: true,
        },
        {
          label: "Name",
          field: "name",
          width: "10%",
          sortable: true,
        },
        {
          label: "Date",
          field: "created_at",
          width: "15%",
          sortable: true,
        },
      ],
      rows: [{ id: 0, name: "bob", created_at: "2" }],
      totalRecordCount: 1,
      sortable: {
        order: "id",
        sort: "asc",
      },
    });
    return {
      table,
    };
  },
  methods: {
    onCategoryChange,
    onThemeChange,
  },
});
</script>

<style scoped>
.rankings_page {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  color: white;
}
::v-deep(.dataTables_paginate) {
  display: none;
}
.category_header {
  display: flex;
  justify-content: center;
  align-items: center;
}
.theme_header {
  display: flex;
  justify-content: center;
  align-items: center;
}
.filter_header {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  margin-bottom: 12px;
}
.data_container {
  display: block;
  width: 75%;
  padding: 13px 25px 25px 25px;
  margin: 25px;
  background-color: gray;
  border-radius: 10px;
  box-shadow: 5px 10px 20px -10px black;
}
.in_table {
  color: black;
  border-radius: 10px;
  box-shadow: 0px 0px 25px -12px black;
}
</style>
