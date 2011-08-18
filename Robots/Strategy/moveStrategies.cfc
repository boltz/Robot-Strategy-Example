<cfcomponent name="MoveStrategies" extends="pathFind">
	<cffunction name="init" output="true">
		<cfargument name="robotMatrix" required="true">
		<cfif isSimpleValue(arguments.robotMatrix) IS False>
			<cfset this.robotMatrix = arguments.robotMatrix>
		<cfelse>
			<cfset this.robots.init = True>
			<cfset this.robotMatrix = setMatrix(1,0,0,"angryBot")>
			<cfset this.robotMatrix = setMatrix(2,400,0,"happyBot")>
			<cfset this.robotMatrix = setMatrix(3,200,300,"mehBot")>
		</cfif>
		<cfreturn this>
	</cffunction>
	
	<!--- These are our concrete strategies --->
	<cffunction name="aggressive" output="true">
		<cfargument name="myID" type="numeric" required="true">
		<cfset var target = getClosestTarget(arguments.myID, this.robotMatrix)>
		<cfset this.robotMatrix = moveCloser(arguments.myID, target.robotID, this.robotMatrix)>
		<cfreturn this.robotMatrix>
	</cffunction>
	
	<cffunction name="defensive" output="true">
		<cfargument name="myID" type="numeric" required="true">
		<cfset var target = getClosestTarget(arguments.myID, this.robotMatrix)>
		<cfset this.robotMatrix = moveAway(arguments.myID, target.robotID, this.robotMatrix)>
		<cfreturn this.robotMatrix>
	</cffunction>
	
	<cffunction name="random" output="true">
		<cfargument name="myID" type="numeric" required="true">
		<cfset this.robotMatrix = moveRandom(arguments.myID, this.robotMatrix)>
		<cfreturn this.robotMatrix>		
	</cffunction>
	
	

</cfcomponent>