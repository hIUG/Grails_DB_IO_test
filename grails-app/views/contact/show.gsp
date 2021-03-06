
<%@ page import="dbio.sample.Contact" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contact" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contact">
			
				<g:if test="${contactInstance?.birthdate}">
				<li class="fieldcontain">
					<span id="birthdate-label" class="property-label"><g:message code="contact.birthdate.label" default="Birthdate" /></span>
					
						<span class="property-value" aria-labelledby="birthdate-label"><g:formatDate date="${contactInstance?.birthdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="contact.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${contactInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="contact.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${contactInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.sex}">
				<li class="fieldcontain">
					<span id="sex-label" class="property-label"><g:message code="contact.sex.label" default="Sex" /></span>
					
						<span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${contactInstance}" field="sex"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:contactInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${contactInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
