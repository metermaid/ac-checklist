modules = [
  'templates',
  'checklist.tasks',
  'ui.router'
]

appModule = angular.module('checklist', modules)


appConfig = ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/tasks'

appConfig.$inject = ['$stateProvider', '$urlRouterProvider']
appModule.config appConfig


appController = ($scope, $location) ->
  $scope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
    if angular.isDefined(toState.data.pageTitle)
      $scope.pageTitle = toState.data.pageTitle + ' | AC Checklist'

appController.$inject = ['$scope', '$location']
appModule.controller 'AppCtrl', appController
