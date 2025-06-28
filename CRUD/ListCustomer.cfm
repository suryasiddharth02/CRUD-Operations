<cfquery name="getCustomers" datasource="#application.dsn#">
  SELECT
    customer_id,
    first_name,
    last_name,
    email,
    phone
  FROM
    customer
</cfquery>

<h1>Customer List</h1>
<table border="1" cellpadding="5" cellspacing="0">
  <tr>
  <th>#</th>
    <th>Customer ID</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Actions</th>
  </tr>
  <cfoutput query="getCustomers">
    <tr>
      <td>#getCustomers.currentRow#</td>
      <td>#customer_id#</td>
      <td>#first_name#</td>
      <td>#last_name#</td>
      <td>#email#</td>
      <td>#phone#</td>
      <td>
        <a href="EditCustomer.cfm?id=#customer_id#">Edit</a>
        <a href="DeleteCustomer.cfm?id=#customer_id#" onclick="return confirm('Are you sure you want to delete this customer?');">Delete</a>
      </td>
    </tr>
  </cfoutput>
</table>