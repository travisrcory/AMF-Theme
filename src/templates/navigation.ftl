<div aria-expanded="false" class="collapse navbar-collapse" id="navigationCollapse">
	<div class="navigation-overlay" aria-controls="navigation" aria-expanded="false" data-target="#navigationCollapse" data-toggle="collapse" ></div>

	<nav class="${nav_css_class}" id="navigation" role="navigation">
		<h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>

		<div class="pull-right">
			<button aria-controls="navigation" aria-expanded="false" class="collapsed navbar-toggle" data-target="#navigationCollapse" data-toggle="collapse" type="button">Menu</button>
		</div>

		<#-- LVL1 NAV -->
		<ul aria-label="<@liferay.language key="site-pages" />" class="lvl1" role="menubar">
			<#list nav_items as nav_item_lvl1>
				<#assign nav_item_lvl1_attr_has_popup = "" />
				<#assign nav_item_lvl1_attr_selected = "" />
				<#assign nav_item_lvl1_class_selected = "" />
				<#assign nav_item_lvl1_layout = nav_item_lvl1.getLayout() /><#--TODO Needed? -->

				<#if nav_item_lvl1.isSelected()>
					<#assign nav_item_lvl1_attr_has_popup = "aria-haspopup='true'" />
					<#assign nav_item_lvl1_attr_selected = "aria-selected='true'" />
					<#assign nav_item_lvl1_class_selected = "selected" />
				</#if>

				<li ${nav_item_lvl1_attr_selected} class="${nav_item_lvl1_class_selected}" id="layout_${nav_item_lvl1.getLayoutId()}" role="presentation">
					<#if nav_item_lvl1.hasChildren()>
						<span aria-labelledby="layout_${nav_item_lvl1.getLayoutId()}" ${nav_item_lvl1_attr_has_popup} ${nav_item_lvl1.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_lvl1_layout /> ${nav_item_lvl1.getName()}</span></span>

						<#-- LVL2 NAV -->
						<ul class="child-menu lvl2" role="menu">
							<#list nav_item_lvl1.getChildren() as nav_child_lvl2>
								<#assign nav_child_lvl2_attr_has_popup = "" />
								<#assign nav_child_lvl2_attr_selected = "" />
								<#assign nav_child_lvl2_class_selected = "" />

								<#if nav_item_lvl1.isSelected()>
									<#assign nav_child_lvl2_attr_has_popup = "aria-haspopup='true'" />
									<#assign nav_child_lvl2_attr_selected = "aria-selected='true'" />
									<#assign nav_child_lvl2_class_selected = "selected" />
								</#if>

								<li ${nav_child_lvl2_attr_selected} class="${nav_child_lvl2_class_selected}" id="layout_${nav_child_lvl2.getLayoutId()}" role="presentation">
									<#if nav_child_lvl2.hasChildren()>
										<span aria-labelledby="layout_${nav_child_lvl2.getLayoutId()}" ${nav_child_lvl2_attr_has_popup} role="menuitem"><span>${nav_child_lvl2.getName()}</span></span>

										<#-- LVL3 NAV -->
										<ul class="child-menu lvl3" role="menu">
											<#list nav_child_lvl2.getChildren() as nav_child_lvl3>
												<#assign nav_child_lvl3_attr_has_popup = "" />
												<#assign nav_child_lvl3_attr_selected = "" />
												<#assign nav_child_lvl3_class_selected = "" />

												<#if nav_child_lvl2.isSelected()>
													<#assign nav_child_lvl3_attr_has_popup = "aria-haspopup='true'" />
													<#assign nav_child_lvl3_attr_selected = "aria-selected='true'" />
													<#assign nav_child_lvl3_class_selected = "selected" />
												</#if>

												<li ${nav_child_lvl3_attr_selected} class="${nav_child_lvl3_class_selected}" id="layout_${nav_child_lvl3.getLayoutId()}" role="presentation">
													<#if nav_child_lvl3.hasChildren()>
														<span aria-labelledby="layout_${nav_child_lvl3.getLayoutId()}" ${nav_child_lvl3_attr_has_popup} role="menuitem"><span>${nav_child_lvl3.getName()}</span></span>

														<#-- LVL4 NAV -->
														<ul class="child-menu lvl4" role="menu">
															<#list nav_child_lvl3.getChildren() as nav_child_lvl4>
																<#assign nav_child_lvl4_attr_has_popup = "" />
																<#assign nav_child_lvl4_attr_selected = "" />
																<#assign nav_child_lvl4_class_selected = "" />

																<#if nav_child_lvl3.isSelected()>
																	<#assign nav_child_lvl4_attr_has_popup = "aria-haspopup='true'" />
																	<#assign nav_child_lvl4_attr_selected = "aria-selected='true'" />
																	<#assign nav_child_lvl4_class_selected = "selected" />
																</#if>

																<li ${nav_child_lvl4_attr_selected} class="${nav_child_lvl4_class_selected}" id="layout_${nav_child_lvl4.getLayoutId()}" role="presentation">
																	<a aria-labelledby="layout_${nav_child_lvl4.getLayoutId()}" href="${nav_child_lvl4.getURL()}" ${nav_child_lvl4.getTarget()} role="menuitem">${nav_child_lvl4.getName()}</a>
																</li>
															</#list>
														</ul>
														<#-- lvl4 NAV -->
													<#else>
														<a aria-labelledby="layout_${nav_child_lvl3.getLayoutId()}" href="${nav_child_lvl3.getURL()}" ${nav_child_lvl3.getTarget()} role="menuitem">${nav_child_lvl3.getName()}</a>
													</#if>
												</li>
											</#list>
										</ul>
										<#-- lvl3 NAV -->
									<#else>
										<a aria-labelledby="layout_${nav_child_lvl2.getLayoutId()}" href="${nav_child_lvl2.getURL()}" ${nav_child_lvl2.getTarget()} role="menuitem">${nav_child_lvl2.getName()}</a>
									</#if>
								</li>
							</#list>
						</ul>
						<#-- lvl2 NAV -->
					<#else>
						<a aria-labelledby="layout_${nav_item_lvl1.getLayoutId()}" ${nav_item_lvl1_attr_has_popup} href="${nav_item_lvl1.getURL()}" ${nav_item_lvl1.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_lvl1_layout /> ${nav_item_lvl1.getName()}</span></a>
					</#if>
				</li>
			</#list>

			<#-- <#if is_signed_in> -->
				<li role="presentation">
					<@liferay_aui["button"] onClick='TODO' value="logout" />
					<@liferay_aui.button onClick='TODO' value="logout" />
				</li>
			<#-- </#if> -->
		</ul>
		<#-- lvl1 nav -->
	</nav>
</div>

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