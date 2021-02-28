const fs = require("fs");
const path = require("path");
const solc = require("solc");

const inboxPath = path.resolve(__dirname, "contracts", "inbox.sol");
const inboxFile = fs.readFileSync(inboxPath, "utf-8");

const input = JSON.stringify({
  language: "Solidity",
  sources: {
    "inbox.sol": {
      content: inboxFile,
    },
  },
  settings: {
    outputSelection: {
      "*": {
        "*": ["*"],
      },
    },
  },
});

module.exports = {
  compiledData: JSON.parse(solc.compile(input)).contracts["inbox.sol"]["Inbox"],
};
