import Typed from 'typed.js';

const loadDynamicCardText = (text) => {
  new Typed('.card-typed-text', {
    strings: [text],
    typeSpeed: 1,
    loop: false,
    showCursor: false
  });
}

export { loadDynamicCardText };
