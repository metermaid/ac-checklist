describe 'AppCtrl', ->

  AppCtrl = undefined
  $location = undefined
  $scope = undefined
  beforeEach module("checklist")

  it "should have a dummy test", inject(->
     expect( true ).toBeTruthy()
  )
