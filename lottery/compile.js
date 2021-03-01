const fs = require("fs");
const path = require("path");
const solc = require("solc");

const lotteryPath = path.resolve(__dirname, "contracts", "lottery.sol");
const lotteryFile = fs.readFileSync(lotteryPath, "utf-8");

const input = JSON.stringify({
  language: "Solidity",
  sources: {
    "lottery.sol": {
      content: lotteryFile,
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
  compiledData: JSON.parse(solc.compile(input)).contracts["lottery.sol"][
    "Lottery"
  ],
};
