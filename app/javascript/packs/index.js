const button = document.getElementById("create_button");
button.addEventListener('click', (event) => {
  event.preventDefault();
  event.currentTarget.style.display="none";
  const form = document.querySelector('.new_list');
  form.classList.add("show");
})
