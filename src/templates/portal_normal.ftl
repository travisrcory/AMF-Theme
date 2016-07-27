<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="advisor-compass-override ${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div id="wrapper">
	<#-- HEADER/BANNER -->
	<header id="banner" role="banner">
		<div class="container">
			<div class="row">
				<#-- LOGO -->
				<div id="heading" class="pull-left">
					<h1 class="site-title">
						<a class="${logo_css_class} text-hide" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">${site_name}</a>
					</h1>
				</div>
				<#-- logo -->

				<#-- NAVIGATION -->
				<div class="pull-right">
					<button aria-controls="navigation" aria-expanded="false" class="header-button header-button-navigation-open" data-target=".navigationCollapse" data-toggle="collapse" type="button">
						<span class="header-button-label">Menu</span>
					</button>
				</div>
				<#-- navigation -->

				<#-- SEARCH -->
				<div class="pull-right">
					<button aria-controls="search" aria-expanded="false" class="header-button header-button-search-open" data-target="#searchCollapse" data-toggle="collapse" type="button">
						<span class="header-button-label">Search</span>
					</button>
				</div>
				<#-- search -->
			</div>

			<div class="row">
				<#-- SEARCH -->
				<div aria-expanded="false" class="collapse" id="searchCollapse">
					<div id="search" role="search">
						<#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone")>

						<@liferay.search default_preferences="${freeMarkerPortletPreferences}" />

						<#assign VOID = freeMarkerPortletPreferences.reset()>
					</div>
				</div>
				<#-- search -->
			</div>
		</div>
	</header>
	<#-- header/banner -->

	<#-- NAVIGATION -->
	<#if has_navigation && is_setup_complete>
		<#include "${full_templates_path}/navigation.ftl" />
	</#if>
	<#-- navigation -->

	<#-- CONTENT -->
	<section id="content" class="container">
		<div class="row">
			<h1 class="hide-accessible">${the_title}</h1>

			<#-- TODO REMOVE -->
			<#-- <nav id="breadcrumbs">
				<@liferay.breadcrumbs />
			</nav> -->

			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>
		</div>
	</section>
	<#-- content -->

	<#-- FOOTER -->
	<footer id="footer" role="contentinfo" class="container" class="row">
		<div class="row">
			<p class="powered-by">
				<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
			</p>
		</div>
	</footer>
	<#-- footer -->
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>