<cfimage source="#expandPath("../../")#\images\square.png" name="backGround" > 
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

<cfimage source="#expandPath("../../")#\images\angryrobot.png" name="angryBot" > 
<cfimage source="#expandPath("../../")#\images\happyRobot.png" name="happyBot" > 
<cfimage source="#expandPath("../../")#\images\neutralRobot.png" name="mehBot" > 

<cfloop query="session.robotMatrix">
	<cfset imagePaste("#backGround#", "#evaluate(mood)#",x,y)>
</cfloop>
<center>
Refresh browser see them move.<br>
<cfimage source="#backGround#" action="writeToBrowser"  >

<br>
<hr>
<img src="../../images/happyRobot.png">Moves 1st. Always moves away from the nearest robot. Can't move diagonally.<br>
<img src="../../images/neutralRobot.png">Moves 2st & 4th. Moves randomly & diagonally & twice.<br>
<img src="../../images/angryRobot.png">Moves 3rd. Always attacks the nearest robot. Can't move diagonally.<br>

</center>