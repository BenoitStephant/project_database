<template>
  <div class="rankings_page">
    <div class="category_header">
      <select name="category_combobox" id="categoriesBox" @change="onCategoryChange($event)">
        <option v-for="category in categories" :value="category.id" :key="category.id">{{ category.name }}</option>
      </select>
    </div>
    <div class="theme_header">
      <select name="theme_combobox" id="themes" @change="onThemeChange($event)">
        <!-- Depends on the category -->
        <option v-for="theme in categories[selectedCategory].themes" :value="theme"
                :key="theme">{{theme}}</option>
        Emotions
      </select>
    </div>
    <div class="concept_table">
      <div class="concept_table_header">
        <div class="spacer"></div>
        <div class="concept_table_header">Concept</div>
        <button class="compare_button">Compare</button>
      </div>
      <div class="table_header">
        <button class="item_column">Item</button>
        <div class="table_header_separator"></div>
        <div class="concept_headers">
          <button v-for="concept in categoryContent.concepts" :value="concept.id" :key="concept.id">{{concept.name}}</button>
        </div>
      </div>
      <div class="table_item_container">
        <RankingItem v-for="item in categoryContent.items" :key="item.id"
          v-bind:id="item.id" v-bind:name="item.name" v-bind:imgSrc="item.imgSrc" v-bind:themeScores="item.themeScores"
        />
      </div>
    </div>
    <div>Welcome to the rankings page</div>
  </div>
</template>

<script>

import RankingItem from "@/components/rankings/RankingItem";
function onCategoryChange(event) {
  this.selectedCategory = this.categories.findIndex(function(item) {
    return item.id === event.target.value;
  });
  console.log(this.selectedCategory);
  console.log(event.target.value);
}

function onThemeChange(event) {
  this.selectedTheme = event.target.value;
  queryCategoryContentFromCategoryAndTheme(this.categories[this.selectedCategory].id, this.selectedTheme)
}

function queryCategoryContentFromCategoryAndTheme(category, theme) {
  console.log("Fetching all items corresponding to:");
  console.log({category, theme});
  //categoryContent = queryCodeHere();
}

export default {
  name: "RankingsPage",
  components: {RankingItem},
  data() {
    return {
      //This should be fetched on from DB on page load
      categories: [
        {id: "movies",
          name: "Movies",
          themes: ["emotion", "appreciation"]
        },
        {id: "animals",
          name: "Animals",
          themes: ["morphology", "appreciation", "emotions"]
        },
        {id: "household_objects",
          name: "Household Objects",
          themes: ["function", "material"]
        },
        {id: "tools",
          name: "Tools",
          themes: ["function", "material"]
        },
        {id: "paintings",
          name: "Paintings",
          themes: ["emotion", "appreciation"]
        },
        {id: "musical_instruments",
          name: "Musical Instruments",
          themes: ["emotion", "appreciation"]
        },],

      //This is fetched from the DB on theme selection
      categoryContent: {
        concepts: [
          {id: "exciting",
            name: "Exciting"
          },
          {id: "joyful",
            name: "Joyful"
          },
          {id: "scary",
            name: "Scary"
          },
          {id: "sinister",
            name: "Sinister"
          }],
        items: [{
          id: "DummyMovie",
          name: "I just need content",
          imgSrc: "link",
          themeScores: [2000, 750, 1750, 900]
        }]
      },

      selectedCategory: 0,
      selectedTheme: ""
    }
  },
  methods: {
    onCategoryChange,
    onThemeChange
  }
}
</script>

<style scoped>

</style>