<%@ page import="dbio.sample.Template" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Upload template</title>
	</head>
	<body>
		<div class="nav" role="navigation">
                        <ul><li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li><g:link class="list" action="list">Template list</g:link></li></ul>
		</div>
		<div class="content scaffold-create" role="main">
			<h1>Upload template</h1>
			<g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
			<g:uploadForm action="upload">
				<fieldset class="form">
                    <input type="file" name="file" />
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="upload" class="save" value="Upload" />
				</fieldset>
			</g:uploadForm>
		</div>
	</body>
</html>