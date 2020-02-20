import Typed from 'typed.js';

const card = document.getElementById("cocktails-ingredients").value;


const loadDynamicCardText = () => {
  new Typed('.card-typed-text', {
    strings: [`${card}`],
    typeSpeed: 15,
    loop: false,
    showCursor: false
  });
}

export { loadDynamicCardText };
