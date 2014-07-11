@PlanetExpress.module 'CrewApp', (CrewApp, App, Backbone, Marionette, $, _) ->

  class CrewApp.Router extends Marionette.AppRouter
    appRoutes:
      'crew'  : 'list'

  API =
    list: ->
      CrewApp.List.Controller.list()

    newCrew: ->
      CrewApp.New.Controller.newCrew()

    editMember: (member) ->
      CrewApp.Edit.Controller.edit member

  App.reqres.setHandler 'new:crew:member:view', ->
    API.newCrew()

  App.vent.on 'crew:member:clicked', (member) ->
    App.navigate Routes.edit_crew_path member.id
    API.editMember member

  App.addInitializer ->
    new CrewApp.Router
      controller: API