<cfset pathFind = createObject("component", "pathFind" ).init(50,400,300)>


<cfif isDefined("session.robots.init") IS False OR isDefined("reset")>
	<cfset session.robots.init = True>
	<cfset session.robotMatrix = pathFind.setMatrix(1,0,0,"angryBot")>
	<cfset session.robotMatrix = pathFind.setMatrix(2,400,0,"happyBot")>
	<cfset session.robotMatrix = pathFind.setMatrix(3,200,300,"mehBot")>
	<!--- <cfset session.robotMatrix = pathFind.setMatrix(4,400,100,"happyBot")> --->
	<cfset robotMatrix=session.RobotMatrix>
	<Cfdump var="#robotMatrix#">
<cfelse>
	<cfset robotMatrix=session.robotMatrix>
</cfif>






<cfset happyTarget = pathFind.getClosestTarget(2, session.robotMatrix)>
<cfset session.robotMatrix = pathFind.moveAway(2, happyTarget.robotID, session.robotMatrix)>


<cfset mehTarget = pathFind.getClosestTarget(3, session.robotMatrix)>
<cfset session.robotMatrix = pathFind.moveRandom(3, session.robotMatrix)>

<!--- <cfset happyTarget = pathFind.getClosestTarget(4, session.robotMatrix)>
<cfset session.robotMatrix = pathFind.moveAway(4, happyTarget.robotID, session.robotMatrix)> --->

<cfset angrytarget = pathFind.getClosestTarget(1, session.robotMatrix)>
<cfset session.robotMatrix = pathFind.moveCloser(1, angryTarget.robotID, session.robotMatrix)>

<cfset session.robotMatrix = pathFind.moveRandom(3, session.robotMatrix)>


<cfset session.robotMatrix = pathFind.moveRandom(2, session.robotMatrix)>








<cfimage source="C:\inetpub\wwwroot\MVCPattern\images\square.png" name="backGround" > 
<cfset imageSetDrawingColor(backGround,"cyan")>

<cfloop index="i" from="0" to="500"  step="50">
	<cfset x = ArrayNew(1)> 
	<cfset y = ArrayNew(1)> 
	<cfset x[1] = 0 + i > 
	<cfset y[1] = 0> 
	<cfset x[2] = 0 + i> 
	<cfset y[2] = 500> 
<cfset ImageDrawLines(backGround,x,y)> 
</cfloop>

<cfloop index="i" from="0" to="500"  step="50">
	<cfset x = ArrayNew(1)> 
	<cfset y = ArrayNew(1)> 
	<cfset x[1] = 0 > 
	<cfset y[1] = 0  + i> 
	<cfset x[2] = 500> 
	<cfset y[2] = 0 + i> 
<cfset ImageDrawLines(backGround,x,y)> 
</cfloop>

<cfimage source="C:\inetpub\wwwroot\MVCPattern\images\angryrobot.png" name="angryBot" > 
<cfimage source="C:\inetpub\wwwroot\MVCPattern\images\happyRobot.png" name="happyBot" > 
<cfimage source="C:\inetpub\wwwroot\MVCPattern\images\neutralRobot.png" name="mehBot" > 

<cfloop query="robotMatrix">
	<cfset imagePaste("#backGround#", "#evaluate(mood)#",x,y)>
</cfloop>
<cfimage source="#backGround#" action="writeToBrowser"  >