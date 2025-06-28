<cfif structKeyExists(form, "submit")>
    <cfquery datasource="#application.dsn#">
        INSERT INTO customer (
            first_name,
            last_name,
            email,
            phone
        ) VALUES (
            <cfqueryparam value="#form.firstName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.lastName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.phone#" cfsqltype="cf_sql_varchar">
        )
    </cfquery>
    <cflocation url="ListCustomer.cfm">
</cfif>

<form method="post" action="AddCustomer.cfm">
    <h1>Add Customer</h1>
    <label for="firstName">First Name:</label>
    <input type="text" name="firstName" id="firstName" required>
    <br>
    <label for="lastName">Last Name:</label>
    <input type="text" name="lastName" id="lastName" required>
    <br>
    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required>
    <br>
    <label for="phone">Phone:</label>
    <input type="tel" name="phone" id="phone" required>
    <br>
    <input type="submit" name="submit" value="Add Customer">
</form>