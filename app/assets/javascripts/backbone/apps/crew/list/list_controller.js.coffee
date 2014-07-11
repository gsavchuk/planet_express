@PlanetExpress.module 'CrewApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    list: ->
      crew = App.request 'crew:entities'
      @layout = @getLayoutView()

      @layout.on 'show', =>
        @titleRegion()
        @panelRegion()
        @crewRegion crew

      App.mainRegion.show @layout

    newRegion: ->
      region = @layout.newRegion
      newView = App.request 'new:crew:member:view'

      newView.on 'form:cancel:button:clicked', =>
        region.empty()

      region.show newView

    titleRegion: ->
      titleView = @getTitleView()
      @layout.titleRegion.show titleView

    panelRegion: ->
      panelView = @getPanelView()

      panelView.on 'new:crew:button:clicked', =>
        @newRegion()

      @layout.panelRegion.show panelView

    crewRegion: (crew) ->
      crewView = @getCrewView crew

      crewView.on 'childview:crew:member:clicked', (child, member) ->
        App.vent.trigger 'crew:member:clicked', member

      @layout.crewRegion.show crewView

    getCrewView: (crew) ->
      new List.Crew
        collection: crew

    getPanelView: ->
      new List.Panel

    getTitleView: ->
      new List.Title

    getLayoutView: ->
      new List.Layout