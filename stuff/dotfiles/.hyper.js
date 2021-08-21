module.exports = {
  config: {
    verminal: {
      fontFamily: "Cascadia Mono, Roboto Mono for Powerline",
      fontSize: 12,
    },
    uiFontFamily: "Cascadia Mono",
    padding: "0 10px 0",
    bell: false,
    defaultSSHApp: false,
    shell: "/usr/local/bin/zsh",
    modifierKeys: {
      altIsMeta: true,
    },
  },
  plugins: ["verminal"],
};
