<cfparam name="url.id" default="0">

<cfif structKeyExists(form, "submit")>
    <cfquery datasource="#application.dsn#">
        UPDATE customer SET
            first_name = <cfqueryparam value="#form.first_name#" cfsqltype="cf_sql_varchar">,
            last_name = <cfqueryparam value="#form.last_name#" cfsqltype="cf_sql_varchar">,
            email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">,
            phone = <cfqueryparam value="#form.phone#" cfsqltype="cf_sql_varchar">
        WHERE customer_id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
    </cfquery>
    <cflocation url="ListCustomer.cfm">
</cfif>