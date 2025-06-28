<cfcomponent>

  <!-- Application settings -->
  <cfset this.name = "MyAppName">
  <cfset this.sessionManagement = true>
  <cfset this.applicationTimeout = createTimeSpan(1, 0, 0, 0)>
  <cfset this.sessionTimeout = createTimeSpan(0, 0, 20, 0)>

  <!-- onApplicationStart: Called when the app first starts -->
  <cffunction name="onApplicationStart" returntype="boolean" output="false">
    <cfset application.dsn = "application">
    <cfreturn true>
  </cffunction>

</cfcomponent>