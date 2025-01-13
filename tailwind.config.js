/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./build/index.html"],
  theme: {
    extend: {},
  },
  daisyui: {
      themes: ["aqua"],
  },
  plugins: [require("daisyui")]
}

