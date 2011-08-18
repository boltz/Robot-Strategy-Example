<cfcomponent >
	<cfset this.tileSize = 50>
	<cfset this.totalGridX = 400>
	<cfset this.totalGridY = 400>
	
	<cfset pathQry = queryNew("x,y,score")>
	<cfset robotMatrix = queryNew("robotID,x,y,mood,score")>
	
	<cffunction name="init">
		<cfargument name="tileSize" type="numeric" required="true"> 
		<cfargument name="totalGridX" type="numeric" required="true"> 
		<cfargument name="totalGridY" type="numeric" required="true"> 
		
		<cfset this.tileSize = arguments.tileSize>
		<cfset this.totalGridX  = arguments.totalGridX>
		<cfset this.totalGridY = arguments.totalGridY>
		
		<cfreturn this>
	</cffunction>
	
	<cffunction name="setMatrix">
		<cfargument name="robotID" type="numeric" default="true">
		<cfargument name="x" type="numeric" required="true">
		<cfargument name="y" type="numeric" required="true">
		<cfargument name="mood" type="string" required="true">
		
		<cfset queryAddRow(robotMatrix)>
		<cfset querySetCell(robotMatrix,"robotID",robotID)>
		<cfset querySetCell(robotMatrix,"X",X)>
		<cfset querySetCell(robotMatrix,"Y",Y)>
		<cfset querySetCell(robotMatrix,"mood",mood)>
		
		<cfreturn robotMatrix>
	</cffunction>
	
	<cffunction name="updateMatrix">
		<cfargument name="robotID" type="numeric" default="true">
		<cfargument name="x" type="numeric" required="true">
		<cfargument name="y" type="numeric" required="true">
		<cfargument name="mood" type="string" required="true">
		<cfargument name="robotMatrix" type="query" required="true">
		<cfset var updatedMatrix = "">
		
		<cfquery name="updatedMatrix" dbtype="query" > 
			UPDATE arguments.robotMatrix
			SET x = #arguments.x#,
				y = #arguments.y#,
				mood = #arguments.mood#
			WHERE robotID = #arguments.robotID#
		</cfquery>
	
		<cfreturn updatedMatrix>
	</cffunction>
	
	<cffunction name="listNeighbors" hint="Given my co-ordinates on a tile, will return the adjacet tile" access="remote" >
		<cfargument name="x" type="numeric" required="true">
		<cfargument name="y" type="numeric" required="true">
		<cfargument name="tileSize"  type="numeric" required="true" default="#this.tileSize#">
		<cfargument name="totalGridX" type="numeric" required="true" default="#this.totalGridX#">
		<cfargument name="totalGridY" type="numeric" required="true" default="#this.totalGridY#">
		
		<cfset pathQry = queryNew("x,y,score")>

		<cfif isOnGrid(x,y,tileSize,totalGridX,totalGridY) is FALSE>
			<cfthrow message="Not on the grid">
		</cfif>
		<cfset var iCount = 1>
		<!--- Left Neighbor --->
		<cfif  isOnGrid((arguments.x - tileSize),arguments.y,tileSize,totalGridX,totalGridY)>
			<cfset queryAddRow(pathQry)>
			<cfset querySetCell(pathQry,"X",arguments.x - arguments.tileSize)>
			<cfset querySetCell(pathQry,"Y",arguments.Y - 0)>
		</cfif>
		
		<!--- Top Neighbor --->
		<cfif isOnGrid((arguments.x),(arguments.y - tileSize),tileSize,totalGridX,totalGridY)>
			<cfset queryAddRow(pathQry)>
			<cfset querySetCell(pathQry,"X",arguments.x - 0)>
			<cfset querySetCell(pathQry,"Y", arguments.y - arguments.tileSize)>
		</cfif>
		
		<!--- Right Neighbor --->
		<cfif isOnGrid((arguments.x + tileSize),arguments.y,tileSize,totalGridX,totalGridY)	>			
			<cfset queryAddRow(pathQry)>
			<cfset querySetCell(pathQry,"X", arguments.x + arguments.tileSize)>
			<cfset querySetCell(pathQry,"Y",arguments.Y - 0)>
		</cfif>	
		
		<!--- Bottom Neighbor --->
		<cfif isOnGrid((arguments.x),(arguments.y + tileSize),tileSize,totalGridX,totalGridY)>			
			<cfset queryAddRow(pathQry)>
			<cfset querySetCell(pathQry,"X",arguments.x + 0)>
			<cfset querySetCell(pathQry,"Y", arguments.y + arguments.tileSize)>
		</cfif>	
		
		<cfreturn pathQry>

	</cffunction>
	
	<cffunction name="listDiagNeighbors">
		<cfargument name="x" type="numeric" required="true">
		<cfargument name="y" type="numeric" required="true">
		<cfargument name="tileSize"  type="numeric" required="true" default="#this.tileSize#">
		<cfargument name="totalGridX" type="numeric" required="true" default="#this.totalGridX#">
		<cfargument name="totalGridY" type="numeric" required="true" default="#this.totalGridY#">
		
		<cfset pathQry = queryNew("x,y,score")>

		<cfif isOnGrid(x,y,tileSize,totalGridX,totalGridY) is FALSE>
			<cfthrow message="Not on the grid">
		</cfif>
		<cfset var iCount = 1>
		<!--- Top Left Neighbor --->
		<cfif  isOnGrid((arguments.x - tileSize),(arguments.y - tileSize),tileSize,totalGridX,totalGridY)>
			<cfset queryAddRow(pathQry)>
			<cfset querySetCell(pathQry,"X",arguments.x - arguments.tileSize)>
			<cfset querySetCell(pathQry,"Y",arguments.Y - arguments.tileSize)>
		</cfif>
		
		<!--- Bottom Left Neighbor --->
		<cfif  isOnGrid((arguments.x - tileSize),(arguments.y + tileSize),tileSize,totalGridX,totalGridY)>
			<cfset queryAddRow(pathQry)>
			<cfset querySetCell(pathQry,"X",arguments.x - arguments.tileSize)>
			<cfset querySetCell(pathQry,"Y",arguments.Y + arguments.tileSize)>
		</cfif>
		
		<!--- Top Right Neighbor --->
		<cfif  isOnGrid((arguments.x + tileSize),(arguments.y - tileSize),tileSize,totalGridX,totalGridY)>
			<cfset queryAddRow(pathQry)>
			<cfset querySetCell(pathQry,"X",arguments.x + arguments.tileSize)>
			<cfset querySetCell(pathQry,"Y",arguments.Y - arguments.tileSize)>
		</cfif>	
		
		<!--- Bottom Right Neighbor --->
		<cfif  isOnGrid((arguments.x + tileSize),(arguments.y + tileSize),tileSize,totalGridX,totalGridY)>
			<cfset queryAddRow(pathQry)>
			<cfset querySetCell(pathQry,"X",arguments.x + arguments.tileSize)>
			<cfset querySetCell(pathQry,"Y",arguments.Y + arguments.tileSize)>
		</cfif>	
		
		<cfreturn pathQry>
	</cffunction>
	
	<cffunction name="manhattanDist" access="remote" >
		<cfargument name="myX" type="numeric" required="true" >
		<cfargument name="myY" type="numeric" required="true" >
		<cfargument name="targetX" type="numeric" required="true" >
		<cfargument name="targetY" type="numeric" required="true" >	
		
		<cfset var H = abs(myX-targetX) + abs(myY-targetY)>
		
		<cfreturn H>
	</cffunction>
	
	<cffunction name="scorePaths" access="remote">
		<cfargument name="myX" type="numeric" required="true" >
		<cfargument name="myY" type="numeric" required="true" >
		<cfargument name="targetX" type="numeric" required="true" >
		<cfargument name="targetY" type="numeric" required="true" >
		<cfset var i = 0>
		<cfset var score = 0>
		<cfset var openList = listNeighbors(myX, myY)>
		
		<cfloop query="openList">
			<cfset score = manhattanDist(openList.X,openList.Y,targetX,targetY)>
			<cfset querySetCell(openList,"score",score,currentRow)>
		</cfloop>
		
		<cfreturn openList>		
	</cffunction>

	<cffunction name="scoreDiagPaths" access="remote">
		<cfargument name="myX" type="numeric" required="true" >
		<cfargument name="myY" type="numeric" required="true" >
		<cfargument name="targetX" type="numeric" required="true" >
		<cfargument name="targetY" type="numeric" required="true" >
		<cfset var i = 0>
		<cfset var score = 0>
		<cfset var openList = listDiagNeighbors(myX, myY)>
		
		<cfloop query="openList">
			<cfset score = manhattanDist(openList.X,openList.Y,targetX,targetY)>
			<cfset querySetCell(openList,"score",score,currentRow)>
		</cfloop>
		
		<cfreturn openList>		
	</cffunction>
	`
	<cffunction name="isOnGrid">
		<cfargument name="x" type="numeric" required="true">
		<cfargument name="y" type="numeric" required="true">
		<cfargument name="tileSize"  type="numeric" required="true" default=this.tileSize>
		<cfargument name="totalGridX" type="numeric" required="true" default=this.totalGridX> 
		<cfargument name="totalGridY" type="numeric" required="true" default=this.totalGridY> 
		
		<cfif arguments.x GTE 0 AND arguments.x LTE arguments.totalGridX
			AND arguments.Y GTE 0 AND arguments.Y LTE arguments.totalGridY>
				<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>
	
	<cffunction name="moveCloser" access="remote">
		<cfargument name="myID" type="numeric" required="true">
		<cfargument name="targetID" type="numeric" required="true">
		<cfargument name="robotMatrix" type="query" required="true">
		<cfset var me ="">
		<cfset var them="">
		<cfset var bestPath="">
		
		<cfquery name="me" dbtype="query" >
			SELECT *
			FROM arguments.robotMatrix
			WHERE robotID = #arguments.myID#
		</cfquery> 
		
		<cfquery name="them" dbtype="query" >
			SELECT *
			FROM arguments.robotMatrix
			WHERE robotID = #arguments.targetID#
		</cfquery> 
		
		
		<cfset var bestPath ="">
		<cfset var openPaths = scorePaths(me.x,me.y,them.x,them.y)>
		
		<cfquery name="bestpath" dbtype= "query" maxrows=1>
			SELECT *
			FROM openPaths
			ORDER BY Score ASC, X ASC, Y ASC
		</cfquery> 
		
		
		
		<cfloop query="arguments.robotMatrix">
			<cfif arguments.robotMatrix.robotID IS arguments.myID>
				<cfset querySetCell(arguments.robotMatrix,"x",bestPath.x, currentRow)>
				<cfset querySetCell(arguments.robotMatrix,"y",bestPath.y, currentRow)>
			</cfif>
		</cfloop>
		
		<cfreturn arguments.robotMatrix>		
	</cffunction>
	
	<cffunction name="moveAway" access="remote">
		<cfargument name="myID" type="numeric" required="true">
		<cfargument name="targetID" type="numeric" required="true">
		<cfargument name="robotMatrix" type="query" required="true">
		<cfset var me ="">
		<cfset var them="">
		
		<cfquery name="me" dbtype="query" >
			SELECT *
			FROM arguments.robotMatrix
			WHERE robotID = #arguments.myID#
		</cfquery> 
		
		<cfquery name="them" dbtype="query" >
			SELECT *
			FROM arguments.robotMatrix
			WHERE robotID = #arguments.targetID#
		</cfquery> 
		
		<cfset var bestPath ="">
		<cfset var openPaths = scorePaths(me.x,me.y,them.x,them.y)>
		
		<cfquery name="bestpath" dbtype= "query" maxrows=1>
			SELECT *
			FROM openPaths
			ORDER BY Score DESC, X DESC, Y DESC
		</cfquery> 
		
		
		<cfloop query="arguments.robotMatrix">
			<cfif arguments.robotMatrix.robotID IS arguments.myID>
				<cfset querySetCell(arguments.robotMatrix,"x",bestPath.x, currentRow)>
				<cfset querySetCell(arguments.robotMatrix,"y",bestPath.y, currentRow)>
			</cfif>
		</cfloop>
		
		<cfreturn arguments.robotMatrix>		
	</cffunction>
	
	
	<cffunction name="moverandom" access="remote">
		<cfargument name="myID" type="numeric" required="true">
		<cfargument name="robotMatrix" type="query" required="true">
		<cfset var me ="">
		<cfset var them="">
		<cfset var randX = randRange(0,this.totalGridX)>
		<cfset var randY = randRange(0, this.totalGridY)>
		
		<cfquery name="me" dbtype="query" >
			SELECT *
			FROM arguments.robotMatrix
			WHERE robotID = #arguments.myID#
		</cfquery> 
		
	
		<cfset var bestPath ="">
		<cfset var openPaths = scoreDiagPaths(me.x,me.y,randX,randY)>
		
		<cfquery name="bestpath" dbtype= "query" maxrows=1>
			SELECT *
			FROM openPaths
			ORDER BY Score DESC, X DESC, Y DESC
		</cfquery> 
		
		
		<cfloop query="arguments.robotMatrix">
			<cfif arguments.robotMatrix.robotID IS arguments.myID>
				<cfset querySetCell(arguments.robotMatrix,"x",bestPath.x, currentRow)>
				<cfset querySetCell(arguments.robotMatrix,"y",bestPath.y, currentRow)>
			</cfif>
		</cfloop>
		
		<cfreturn arguments.robotMatrix>		
	</cffunction>
	
	<cffunction name="scoreAllTargets">
		<cfargument name="myID" type="numeric" required="true">
		<cfargument name="robotMatrix" type="query" required="true">
		<cfset var targets = "">
		<cfset var me = "">
		<cfset var score = 0>
		
		<cfquery name="me" dbtype="query">
			SELECT *
			FROM arguments.robotMatrix
			WHERE robotID = #myID#
		</cfquery>
		
		<cfquery name="targets" dbtype="query">
			SELECT *
			FROM arguments.robotMatrix
			WHERE robotID <> #myID#
		</cfquery>
		
		
		<cfloop query="targets">
			<cfset score = scorePaths(me.x,me.y,targets.x,targets.y).score>
			<cfset querySetCell(targets, "score", score, currentRow)>
		</cfloop>
		
		<cfreturn targets>
	</cffunction>
	
	<cffunction name="getClosestTarget">
		<cfargument name="myID" type="numeric" required="true">
		<cfargument name="robotMatrix" type="query" required="true">
		
		<cfset var nearest ="">
		<cfset var targets = scoreAllTargets(myID, arguments.robotMatrix)>
		
		<cfquery name="nearest" dbtype="query" maxrows=1>
			SELECT *
			FROM targets
			ORDER BY score ASC, X ASC, Y ASC
		</cfquery>
		
		<cfreturn nearest>
		
	</cffunction>
</cfcomponent>