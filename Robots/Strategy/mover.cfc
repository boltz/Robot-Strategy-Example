<cfcomponent extends="pathFind">
	<cffunction name="init">
		<cfargument name="robotMatrix" type="query" required="true" >
		<cfset this.robotMatrix = arguments.robotMatrix>
		<cfreturn this>
	</cffunction>
	
	<!--- sets the strategy and sets up passing the function --->
	<cffunction name="setStrategy">
		<cfargument name="moveStrategy" required="true" >
		<cfset variables.moveStrategy = arguments.moveStrategy>
	</cffunction>
	
	<cffunction name="move">
		<cfargument name="myID">
		<cfset var path = variables.moveStrategy(arguments.myID, this.robotMatrix)>
		<cfreturn this.robotMatrix>
	</cffunction>

</cfcomponent>