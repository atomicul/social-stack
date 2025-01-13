/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/index.html"],
  theme: {
    extend: {},
  },
  daisyui: {
      themes: ["aqua"],
  },
  plugins: [require("daisyui")]
}

