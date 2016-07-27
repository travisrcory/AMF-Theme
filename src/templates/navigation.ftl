<div aria-expanded="false" id="navigationWrapperOuter" class="navigationCollapse collapse display">
	<div aria-expanded="false" class="navigationCollapse collapse width" id="navigationCollapse">
		<div id="navigationWrapperInner">

			<div class="container">
				<div class="row">
					<div class="pull-right">
						<button aria-controls="navigation" aria-expanded="false" class="header-button header-button-close" data-target=".navigationCollapse" data-toggle="collapse" type="button"><span class="header-button-label">Menu</span></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div aria-expanded="false" id="navigationOverlay" class="navigationCollapse collapse overlay" aria-controls="navigation" aria-expanded="false" data-target=".navigationCollapse" data-toggle="collapse" ></div>

<#-- <@liferay_aui.script use="liferay-navigation-interaction"> -->
<@liferay_aui.script use="liferay-navigation-interaction-advisorcompass">
	var navigation = A.one('#navigation');

	if (navigation) {
		<#-- navigation.plug(Liferay.NavigationInteraction); -->
		navigation.plug(Liferay.NavigationInteractionAdvisorcompass);
	}

	<#-- Liferay.Data.NAV_INTERACTION_LIST_SELECTOR = '.navbar-site'; -->
	<#-- Liferay.Data.NAV_LIST_SELECTOR = '.navbar-site'; -->
</@>