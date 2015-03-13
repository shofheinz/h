{module, inject} = require('angular-mock')

assert = chai.assert
sinon.assert.expose assert, prefix: null


describe 'h:local-storage', ->
  sandbox = null

  before ->
    angular.module('h', [])
    require('../local-storage-service')

  beforeEach module('h')

  beforeEach module ($provide) ->
    sandbox = sinon.sandbox.create()
    return

  afterEach ->
    sandbox.restore()


  describe 'local-storage service', ->
    localstorage = null

    beforeEach inject (_localstorage_) ->
      localstorage = _localstorage_

    it 'works', ->
      assert.equal 1,1
