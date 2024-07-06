const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("KomeileumModule", (m) => {

  const kml = m.contract("Komeileum");

  return { kml };
});
