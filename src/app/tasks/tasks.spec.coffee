describe 'Tasks functionality', ->
  $scope = undefined
  httpBackend = undefined

  beforeEach angular.mock.module("checklist")
  
  # create the custom mocks on the root scope
  beforeEach angular.mock.inject(($rootScope, $state) ->
    #create an empty scope
    scope = $rootScope.$new()
    scope.$state = $state
  )

  describe "task list controller", ->
    
    #mock the controller for the same reason and include $rootScope and $controller
    beforeEach angular.mock.inject(($controller) ->
      #declare the controller and inject our scope
      $controller "tasksCtrl",
        $scope: scope
        $state: scope.$state

      scope.$digest()
    )
    
	  it "should not add empty tasks", inject()
