<cfparam  name="url.id" default="0">
<cfif url.id GT 0>
<cfinvoke component="CRUD.Customer" method="deleteCustomer" customer_id="#url.id#">
</cfif>
<cflocation url="ListCustomer.cfm"> 