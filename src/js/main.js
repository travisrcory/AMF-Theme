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
						console.log('initializer()');
						var instance = this;

						instance._navigationToggleTriggers = A.all('.navigation-toggle-trigger');
						instance._navigationToggleTargets = A.all('.navigation-toggle-target');

						instance._navigationToggleTriggers.on(
							'click',
							function (event) {
								console.log('instance._navigationToggleTriggers.on(click)');

								var isOpen = instance._navigationToggleTargets.first().hasClass('open')

								instance._navigationToggleTriggers.attr('aria-expanded', !isOpen);

								instance._navigationToggleTargets.toggleClass('open', !isOpen);
							}
						);

						// var navigation = instance.get('host').all('ul');

						// navigation.each(
						// 	function (node) {
						// 		console.log(' >navigation.each');
						// 		instance._initChildMenuHandlers(node);
						// 	}
						// );

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
							navigation.delegate(['click'], instance._onMouseToggle, 'li', instance);

							navigation.delegate('keydown', instance._handleKeyDown, 'a', instance);
						}
					},

					_initNodeFocusManager: function() {
						var instance = this;

						var host = instance.get('host');

						host.plug(
							A.Plugin.NodeFocusManager,
							{
								descendants: '.menuitem-title',  // TODO
								focusClass: 'focused',
								keys: {
									next: 'down:40', // TODO
									previous: 'down:38' // TODO
								}
							}
						);

						var focusManager = host.focusManager;

						focusManager.after(['activeDescendantChange', 'focusedChange'], instance._showMenu, instance);

						instance._focusManager = focusManager;
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