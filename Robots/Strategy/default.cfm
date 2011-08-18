<cfparam name="robot1"  default=1>
<cfparam name="robot2"  default=2>
<cfparam name="robot3"  default=3>
<!--- Robotmatrix is a query object that is passed around to keep track of all the robots--->
<cfparam name="session.robotMatrix" default="">
<cfparam name="reset" default="">
<cfif reset NEQ "">
	<cfset session.robotMatrix = "">
</cfif>

<!--- Set up strategy object --->
<cfset strategies = createObject("component", "moveStrategies").init(session.robotMatrix)>

<!--- Set up context that uses the strategy --->
<cfset mover = createObject("component", "Mover").init(strategies.robotMatrix)>
<cfset session.robotMatrix = strategies.robotMatrix>

<!--- Happy Bot Strategy --->
<cfset mover.setStrategy(strategies.defensive)>
<cfset move = mover.move(robot2)>
<cfset session.robotMatrix = move>


<!--- Random Bot Strategy ---->
<cfset mover.setStrategy(strategies.random)>
<cfset move = mover.move(robot3)>
<cfset session.robotMatrix = move>  


<!--- Angry Bot Strategy --->
<cfset mover.setStrategy(strategies.aggressive)>
<cfset move = mover.move(robot1)>
<cfset session.robotMatrix = move> 

<!--- Random Bot Strategy ---->
<cfset mover.setStrategy(strategies.random)>
<cfset move = mover.move(robot3)>
<cfset session.robotMatrix = move>  


<!--- You can add as many strategies as you need to moveStrategies.cfc
	and do not have alter your move() function. --->

<!--- Create Image and display locations --->
<cfinclude template="imageDisplay.cfm">