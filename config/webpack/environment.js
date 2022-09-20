const { environment } = require('@rails/webpacker')

environment.output = { hashFunction: "sha256" }
module.exports = environment
