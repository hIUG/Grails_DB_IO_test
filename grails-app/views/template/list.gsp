<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Template list</title>
	</head>
	<body>
		<div class="nav" role="navigation">
                        <ul><li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li><g:link class="add" action="add">Upload new template</g:link></li></ul>
		</div>
		<div class="content scaffold-list" role="main">
			<h1>Template list</h1>
			<g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="filename" title="Filename" />
						<g:sortableColumn property="uploadDate" title="Upload date" />
						<g:sortableColumn property="uploadStatus" title="Upload status" />
						<g:sortableColumn property="rowCount" title="Row count" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${documentInstanceList}" status="i" var="documentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="download" id="${documentInstance.id}">${documentInstance.fileName}</g:link></td>
						<td><g:formatDate date="${documentInstance.uploadDate}" /></td>
						<td>${documentInstance.uploadStatus}</td>
						<td>${documentInstance.rowCount}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${documentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>