<cfparam name="url.id" default="0">
<cfif NOT isNumeric(url.id) OR url.id EQ 0>
    <h2>Error: No valid customer ID provided.</h2>
    <cfabort>
</cfif>

<!-- Fetch existing customer data -->
<cfquery name="cust" datasource="#application.dsn#">
    SELECT * FROM customer WHERE customer_id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
</cfquery>

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

<!-- HTML Form -->
<!DOCTYPE html>
<html lang="en">
<style>
* {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }
    body {
        width: 100vw;
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }
    h1 {
        color: #333;
    }
    form {
        width: 100%;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    label {
        margin-bottom: 5px;
        font-weight: bold;
    }
    input[type="text"],
    input[type="email"],
    input[type="tel"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    input[type="submit"] {
        background-color: blue;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #218838;
    }
</style> 
<head>
<title>Update Customer</title>
</head>
<body>
<cfif NOT structKeyExists(cust, "customer_id")>
    <h2>Error: Customer not found.</h2>
    <cfabort>
</cfif>
<cfoutput>
<form style="margin: 10px; padding: 10px;" method="post" action="EditCustomer.cfm?id=#url.id#">
    <h1>Update Customer</h1>
    <label for="first_name">First Name:</label>
    <br>
    <input type="text" name="first_name" id="first_name" value="#cust.first_name#" required>
    <br>
    <label for="last_name">Last Name:</label>
    <br>
    <input type="text" name="last_name" id="last_name" value="#cust.last_name#" required>
    <br>
    <label for="email">Email:</label>
    <br>
    <input type="email" name="email" id="email" value="#cust.email#" required>
    <br>
    <label for="phone">Phone:</label>
    <br>
    <input type="tel" name="phone" id="phone" value="#cust.phone#" required>
    <br>
    <input type="submit" name="submit" value="Update Customer">
</form>
</body>
</cfoutput>

