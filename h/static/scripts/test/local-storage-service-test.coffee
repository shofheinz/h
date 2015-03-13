{module, inject} = require('angular-mock')

assert = chai.assert
sinon.assert.expose assert, prefix: null
sandbox = sinon.sandbox.create()


describe 'localstorage', ->
  provider = null
  $window = null

  before ->
    angular.module('h', [])
    require('../local-storage-service')

#  beforeEach module('h')

  describe 'memory fallback', ->
    service = null

    beforeEach module ($provide, localstorageProvider) ->

      fakeWindow = {
        localStorage: {}
      }

      $provide.value '$window', fakeWindow
      provider = localstorageProvider
      return

    beforeEach inject (localstorage) ->
      service = localstorage
      return

    afterEach ->
      sandbox.restore()

    it 'set/getItem', ->
      key = 'test.memory.key'
      value = 'What shall we do with a drunken sailor?'
      service.setItem key, value
      actual = service.getItem key
      assert.equal value, actual


