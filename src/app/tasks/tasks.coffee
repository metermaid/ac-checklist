modules = [
  'ui.router'
]

tasks = angular.module 'checklist.tasks', modules

tasksConfig = ($stateProvider) ->
  $stateProvider.state "tasks",
    url: "/tasks"
    views:
      main:
        controller: "tasksCtrl"
        templateUrl: "tasks/index.tpl.html"

    data:
      pageTitle: "Tasks"

tasksConfig.$inject = ['$stateProvider']
tasks.config tasksConfig

tasks.factory "taskStorage", ->
  storageID = "acnl_tasks"
  defaults = '[
    { "name": "Check Turnip Prices", "done": false },
    { "name": "Find Fossils", "done": false },
    { "name": "Pull Weeds", "done": false },
    { "name": "Money Rock", "done": false },
    { "name": "Gem Rock", "done": false },
    { "name": "Harvest Fruits", "done": false },
    { "name": "Check Stores", "done": false },
    { "name": "Dream Suite", "done": false },
    { "name": "Comedy Routine", "done": false },
    { "name": "Visit Isabelle", "done": false }
  ]'

  {
    get: ->
      JSON.parse localStorage.getItem(storageID) or defaults
    put: (new_tasks) ->
      localStorage.setItem(storageID, JSON.stringify(new_tasks))
  }

tasksController = ($scope, taskStorage) ->
  current_tasks = $scope.current_tasks = taskStorage.get()

  $scope.newTask = ""

  $scope.$watch "current_tasks", ((newValue, oldValue) ->
    taskStorage.put current_tasks  if newValue isnt oldValue
  ), true

  $scope.addTask = ->
    newTask = $scope.newTask.trim()
    return unless newTask.length
    current_tasks.push
      name: newTask
      done: false

    $scope.newTask = ""

  $scope.removeTask = (idx) ->
    current_tasks.splice idx, 1

  $scope.unmarkAll = ->
    current_tasks.forEach (task) ->
      task.done = false

  $scope.markAll = (completed) ->
    current_tasks.forEach (task) ->
      task.done = true


tasksController.$inject = ['$scope', 'taskStorage']
tasks.controller 'tasksCtrl', tasksController


