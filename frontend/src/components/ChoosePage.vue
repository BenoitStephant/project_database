<template>
  <div class="choose_page">
    <div class="match_ui">
      <div class="match_header">
        <div class="match_category">Category</div>
        <hr />
        <div class="match_concept">Concept</div>
      </div>
      <div class="match_content">
        <div class="match_choice">
          <img class="match_image" alt="Dog" src="../assets/logo.png" />
          <div class="choice_name">Dog</div>
          <button>choose 1</button>
        </div>
        <div class="vhr"></div>
        <div class="match_choice">
          <img class="match_image" alt="Cat" src="../assets/logo.png" />
          <div class="choice_name">Cat</div>
          <button>choose 2</button>
        </div>
      </div>
      <div class="match_footer"></div>
      <button>I can't choose</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "ChoosePage",
};
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
