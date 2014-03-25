<%@ page import="dbio.sample.Contact" %>



<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'birthdate', 'error')} required">
	<label for="birthdate">
		<g:message code="contact.birthdate.label" default="Birthdate" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthdate" precision="day"  value="${contactInstance?.birthdate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="contact.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${contactInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="contact.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${contactInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="contact.sex.label" default="Sex" />
		
	</label>
	<g:textField name="sex" value="${contactInstance?.sex}"/>

</div>

