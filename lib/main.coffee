{ basename } = require 'path'

semver = require 'semver-regex'

name = basename(process.cwd())

keywords = name.split(/-|_/g)

description = keywords.map (str) ->

  str.charAt(0).toUpperCase() + str.slice(1)

module.exports =

  namespace: "package"

  prompts:

    filename:

      default: "package.json"

    name:

      default: name

    version:

      default: "0.0.0"

      validate: (val) ->

        if semver(val) then return true

        return "invalid semver #{val}"

    keywords:

      default: JSON.stringify keywords

    description:

      default: description.join " "
