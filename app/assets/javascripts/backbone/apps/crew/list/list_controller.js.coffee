@PlanetExpress.module 'CrewApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    list: ->
      crew = App.request 'crew:entities'
      @layout = @getLayoutView()

      @layout.on 'show', =>
        @titleRegion()
        @panelRegion()
        @newRegion()
        @crewRegion crew

      App.mainRegion.show @layout

    newRegion: ->
      newView = @getNewView()
      @layout.newRegion.show newView

    titleRegion: ->
      titleView = @getTitleView()
      @layout.titleRegion.show titleView

    panelRegion: ->
      panelView = @getPanelView()
      @layout.panelRegion.show panelView

    crewRegion: (crew) ->
      crewView = @getCrewView crew
      @layout.crewRegion.show crewView

    getCrewView: (crew) ->
      new List.Crew
        collection: crew

    getNewView: ->
      new List.New

    getPanelView: ->
      new List.Panel

    getTitleView: ->
      new List.Title

    getLayoutView: ->
      new List.Layout