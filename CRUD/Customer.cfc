<cfcomponent displayname="Customer" hint="Coldfusion Component for Customer CRUD">

<!-- Create a new customer -->
<cffunction  name="createCustomer" access="remote" returntype="void">
<cfargument name="first_name" type="string" required="yes">
<cfargument name="last_name" type="string" required="yes">
<cfargument name="email" type="string" required="yes">
<cfargument name="phone" type="string" required="yes">

<cfquery datasource="#application.dsn#" name="createCustomer">
INSERT INTO customer (first_name, last_name, email, phone)
VALUES (
    <cfqueryparam value="#arguments.first_name#" cfsqltype="cf_sql_varchar">,
    <cfqueryparam value="#arguments.last_name#" cfsqltype="cf_sql_varchar">,
    <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
    <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">
)
</cfquery>
</cffunction>

<!-- Read customer details -->
<cffunction  name="getCustomer" access="remote" returntype="query">
<cfquery datasource="#application.dsn#" name="getCustomer">
SELECT * FROM customer
</cfquery>
</cffunction>

<!-- Update customer details -->
<cffunction  name="updateCustomer" access="remote" returntype="void">
<cfargument name="customer_id" type="numeric" required="yes">
<cfargument name="first_name" type="string" required="yes">
<cfargument name="last_name" type="string" required="yes">
<cfargument name="email" type="string" required="yes">
<cfargument name="phone" type="string" required="yes">

<cfquery datasource="#application.dsn#" name="updateCustomer">
UPDATE customer
SET first_name = <cfqueryparam value="#arguments.first_name#" cfsqltype="cf_sql_varchar">,
    last_name = <cfqueryparam value="#arguments.last_name#" cfsqltype="cf_sql_varchar">,
    email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
    phone = <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">
WHERE customer_id = <cfqueryparam value="#arguments.customer_id#" cfsqltype="cf_sql_integer">
</cfquery>
</cffunction>

<!-- Delete a customer -->
<cffunction  name="deleteCustomer" access="remote" returntype="void">
<cfargument name="customer_id" type="numeric" required="yes">
<cfquery datasource="#application.dsn#" name="deleteCustomer">
DELETE FROM customer
WHERE customer_id = <cfqueryparam value="#arguments.customer_id#" cfsqltype="cf_sql_integer">
</cfquery>
</cffunction>

</cfcomponent>