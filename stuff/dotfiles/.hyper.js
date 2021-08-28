module.exports = {
  config: {
    verminal: {
      fontFamily: "Cascadia Mono, RobotoMono Nerd Font, Roboto Mono for Powerline",
      fontSize: 12,
    },
    uiFontFamily: "Cascadia Mono",
    padding: "0 10px 0",
    bell: false,
    shell: "/usr/local/bin/zsh",
    modifierKeys: {
      altIsMeta: true,
    },
  },
  plugins: ["verminal"],
};
