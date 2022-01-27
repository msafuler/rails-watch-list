import $ from 'jquery';
import 'select2';

$(document).ready(function () {
  $('.movie-select').select2();
});

const button = document.getElementById("add_movie_button");
button.addEventListener('click', (event) => {
  event.preventDefault();
  event.currentTarget.style.display = "none";
  const form = document.querySelector('.new_bookmark');
  form.classList.add("show");
})
