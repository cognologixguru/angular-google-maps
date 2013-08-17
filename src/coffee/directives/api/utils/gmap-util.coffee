@ngGmapModule "directives.api.utils", ->
	@GmapUtil =
		createMarkerOptions:(map,coords,icon,defaults) ->
			angular.extend({}, defaults, {
				position: new google.maps.LatLng(coords.latitude, coords.longitude),
				map: map.getMap(),
				icon: icon,
				visible: coords.latitude? and coords.longitude?
			})

		createWindowOptions:(gMarker,scope,content,defaults) ->
			angular.extend({}, defaults, {
				content: content,
				position: 
					if angular.isObject(gMarker)
						gMarker.getPosition() 
					else 
						new google.maps.LatLng(scope.coords.latitude, scope.coords.longitude)
			})	
