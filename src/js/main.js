AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {
	}
);

Liferay.Portlet.ready(

	/*
	This function gets loaded after each and every portlet on the page.

	portletId: the current portlet's id
	node: the Alloy Node object of the current portlet
	*/

	function(portletId, node) {
	}
);

Liferay.on(
	'allPortletsReady',

	/*
	This function gets loaded when everything, including the portlets, is on
	the page.
	*/

	function() {
	}
);

/*
Extends Liferay's built-in liferay-navigation-interaction module.
*/
AUI.add(
	'liferay-navigation-interaction-advisorcompass',
	function(A) {
		var NAME = 'liferaynavigationinteractionadvisorcompass';

		var NavigationInteractionAdvisorcompass = A.Component.create(
			{
				EXTENDS: Liferay.NavigationInteraction,

				NAME: NAME,

				NS: NAME,

				prototype: {
					initializer: function(config) {
						var instance = this;

						var navigationOverlay = instance.get('host').get('parentNode').one('.navigation-overlay');

						Liferay.detach(['hideNavigationMenu', 'showNavigationMenu']);

						Liferay.on(
							['hideNavigationMenu', 'showNavigationMenu'],
							instance._onNavigationMenuToggle
						);
					},

					_initChildMenuHandlers: function(navigation) {
						console.log('_initChildMenuHandlers()');
						var instance = this;

						if (navigation) {
							navigation.delegate(['click'], instance._onMouseToggle, '> li', instance);

							navigation.delegate('keydown', instance._handleKeyDown, 'a', instance);
						}
					},

					_onNavigationMenuToggle: function(event) {
						var instance = this;

						var showMenu = (event.type == 'showNavigationMenu');

						var menu = event.menu;

						if (menu) {
							instance._lastShownMenu = null;

							if (showMenu) {
								instance._lastShownMenu = menu;
							}

							// menu.toggleClass('hover', showMenu); // not needed
							if (true) { // TODO check if has child pages
								menu.toggleClass('open', showMenu);
							}
						}
					},

					_onMouseToggle: function(event) {
						console.log('_onMouseToggle()');
						var instance = this;

						var mapHover = instance.MAP_HOVER;

						var eventType = 'showNavigationMenu';

						if (event.currentTarget.hasClass('open')) {
							eventType = 'hideNavigationMenu';
						}

						mapHover.menu = event.currentTarget;

						Liferay.fire(eventType, mapHover);
					}
				}
			}
		);

		Liferay.NavigationInteractionAdvisorcompass = NavigationInteractionAdvisorcompass;
	},
	'',
	{
		requires: ['liferay-navigation-interaction']
	}
);