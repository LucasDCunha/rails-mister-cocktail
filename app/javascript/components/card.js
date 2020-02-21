import Typed from 'typed.js';

const card = document.getElementById("cocktails-ingredients").value;


const loadDynamicCardText = (text) => {
  new Typed('.card-typed-text', {
    strings: [text],
    typeSpeed: 10,
    loop: false,
    showCursor: false
  });
}

export { loadDynamicCardText };
