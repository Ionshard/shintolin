db = require '../db'

module.exports = (coords, terrain, cb) ->
  tile =
    x: coords.x
    y: coords.y
    z: coords.z
    terrain: terrain
    people: []
  db.tiles.insert tile, cb
