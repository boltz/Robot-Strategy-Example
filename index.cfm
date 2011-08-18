<cfoutput>
	<!DOCTYPE html>
<html class="no-js">
  <head>
    <title>Understanding the Principles of the MVC Pattern</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <script type="text/javascript">(function(H){H.className=H.className.replace(/\bno-js\b/,'js')})(document.documentElement)</script> 
    <link href="stylesheets/screen.css" type="text/css" rel="stylesheet" media="Screen,projection" />
  </head>
  <body>
    <div id="header">
      <div class="container">
        <h1>Understanding the Principles of the MVC Pattern</h1>
      </div>
    </div>
    
    <div id="content">
    	<div id="slides">
         <div class="slide">
         <h2>Understanding the Principles of the MVC Pattern</h2>
 			<p>
 			&nbsp;
			</p>
         </div>
      <div id="slides">
      	<div class="slide">
      	<h2>What is a Design Pattern?</h2>	
			
      	</div>
		<div class="slide">
      	<h2>What is a Design Pattern?</h2>	
			<ul>
				<li>reusable solution to a commonly occurring problem</li>
				<li>not a finished design that can be transformed directly into code</li>
				<li>Object-Oriented programming has relationships between classes that form patterns.</li>
				<li>Short-Hand for communication</li>
			</ul>
      	</div>
		
         <div class="slide">
         <h2>What is MVC?</h2>
 			<p>MVC was first described in 1979 by Trygve Reenskaug then working on Smalltalk at Xerox PARC. 
			The original implementation is described in depth in the influential paper "Applications Programming in Smalltalk-80: How to use Model View Controller"
			<br>
			<img src="./images/trygve.jpg">
			</p>
         </div>
		<div class="slide">
          <h2>What is MVC?</h2>
          <p>
        	MVC is a compound pattern. The pattern isolates "domain logic" (the application logic for the user) from the user interface (input and presentation), permitting independent development, testing and maintenance of each.
		  (Wikipedia)
		  <br><img src="./images/What-Is-MVC.png">
		  </p>
        </div>
       <div class="slide">
          <h2>What is MVC?</h2>
          <p>
        	MVC is a compound pattern consisting of the Observer, Strategy and Composite patterns.  These patterns work together to 
			decouple the thre players in the MVC model, which keeps designs clear and flexible.
		  (Head First: Design Patterns)
		  <br><img src="./images/mvc-cookie.png">
		  </p>
        </div>
        <div class="slide">
          <h2>Yeah, But What is MVC?</h2>
          <p>
 			It is a way of structuring your code so that you have more maintainable, expandable & reusable code.  It
			seperates:
			<ul>
				<li>How stuff looks (View) <img src="./images/view-makeup.jpg"  width="66" height="100"></li>	
				<li>How stuff works (Model)<img src="./images/brain.png"  width="66" height="43"></li>
				<li>Interpreting how to react to change (Controller)<img src="./images/Phone-Operator.png"  width="87.5" height="75.5"></li>
			</ul>
			<h0><img src="./images/timMug.png" width=50 height=50>(My Definition as of: #dateformat(now(), "short")# #timeformat(now(), "long")#)</h0>
 		  </p>
        </div>
        <div class="slide">
          <h2>The MVC Reddit Digital Frame</h2>
         <center><img src="./images/mvc-frame.png"</center>
		  </div>
        <div class="slide">
          <h2>What is the Model?</h2>
          <p>
			<ul>
				<li>Model holds all the "Business Logic"</li>
				<li>Defines things. What is an image? What is a gallery etc? What is a Reddit call?</li>
				<li>No Output</li>
				<li>No Application Logic.</li>
			</ul>
 		</p>
        </div>
		
		<div class="slide">
          <h2>What is the Model?</h2>
          <p>
          	<center><img src="./images/skinnymodel.png"></center>
			<ul>
				<li>Bad Model, too skinny</li>
			</ul>
 		</p>
        </div>
		
		<div class="slide">
          <h2>What is the Model?</h2>
          <p>
          	<center><img src="./images/fatmodel.png"></center>
			<ul>
				<li>A fat model is a good model</li>
			</ul>
 		</p>
        </div>
		
		<div class="slide">
          <h2>Model is an Observer Pattern</h2>
          <p>
			<img src="./images/PeepingTom.jpg" width="600" height="450">
 		</p>
        </div>
		
		<div class="slide">
          <h2>Model: What is the Observer Pattern?</h2>
          <p>
			<ul>
				<li>The observer pattern (a subset of the publish/subscribe pattern) is a software design pattern in which an object, called the subject, maintains a list of its dependents, called observers, and notifies them automatically of any state changes, usually by calling one of their methods. It is mainly used to implement distributed event handling systems.</li>
				<li>Intent: define a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.</li>
				<li>AKA: Dependents or Publish-Subscribe.</li>
			</ul>
 		</p>
        </div>
		
		<div class="slide">
          <h2>Model: What is the Observer Pattern? (It's like a news paper company)</h2>
          <p>
			<ul>
				<li>A newspaper publisher goes into business and begins
				publishing newspapers.</i>
				<li>You subscribe to a particular publisher, and every time
				there’s a new edition it gets delivered to you. As long as
				you remain a subscriber, you get new newspapers.</li>
				<li>You unsubscribe when you don’t want papers anymore,
				and they stop being delivered.</li>
				<li>While the publisher remains in business, people, hotels,
				airlines and other businesses constantly subscribe and
				unsubscribe to the newspaper</li>
			</ul>
 		</p>
        </div>
		
		<div class="slide">
          <h2>Model: Observer Pattern: Why is it better?</h2>
          <p>
			<ul>
				<li>It is loosely coupled</li>
				<li>Two objects can interact, but need to very little about each other.</li>
				<li>We can a add new observers at any time.</li>
				<li>Do not need to modify the subject (model) to add new types of observers (Views)</li>
				<li>We can reuse the subject (model) independently of the the observers (Views)</li>
				<li>Changes to either do not effect the other</li>
				
			</ul>
 		</p>
        </div>
		
		
		<div class="slide">
          <h2>Model as an Observer Pattern</h2>
          <p>
			<img src="./images/model-as-observer.png">
 		</p>
        </div>
		
		<div class="slide">
          <h2>What is The View?</h2>
          <p>
			<li>A view queries the model in order to generate an appropriate user interface.</li>
			<li>The view gets its own data from the model.</li>
			<li>In some implementations, the controller may issue a general instruction to the view to render itself. (Like Web apps)</li>
			<li>In others, the view is automatically notified by the model of changes in state (Observer) that require a screen update.</li>
 			<li>It is a Composite Pattern. (and sometimes a Observer too)</li>
		</p>
        </div>
		
		
		<div class="slide">
          <h2>View as a Composite Pattern</h2>
          <p>
			<img src="./images/view as composite.png">
			<li>Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and
			compositions of objects uniformly.</li>
			<li>?????? Don't Panic ????? HTML is doing this for you.</li>
			<li>The View is your output, your HTML</li>
 		</p>
        </div>
		
		<div class="slide">
          <h2>What is the Controller?</h2>
          <p>
			<li>Receives user input from the View</li>
			<li>Determines the appropiate call to make on the Model, so the model can change it's state</li>
			<li>May notify the view to change. Like disable a button or hide a menu</li>
			<li>It is the interpreter between the View & the Model</li>
			<li>It is a Strategy Pattern & sometimes an Observer Pattern too</li>
 		</p>
        </div>
		
		<div class="slide">
          <h2>What is a Strategy Pattern?</h2>
          <p>
			<li>Define a family of algorithms, encapsulate each one and make them interchangeable. Stragegy lets the algorithm vary independently from clients that use it.</li>
 			<li>Object A  ---> uses Object B</li>
			<li>Object A  ---> later needs to use Object C</li>
			<li>The ability to exchange objects B and C without changing object A is the Strategy design pattern in action.</li>
			<li>In order for this to be possible, objects B and C need to both implement the common set of functions that object A requires.</li>
		</p>
        </div>
		
		<div class="slide">
          <h2>Strategy Pattern Example</h2>
          <p><img src="./images/strategy-robot-java.gif">
			<li>
			<b>IBehaviour (Strategy)</b> - an interface that defines the behavior of a robot
			</li>
			<li><b>Concrete Strategies</b> - Aggressive, Defensive, Normal.  <br>Each define a specific behavior are given the same parameters (position, obstacles, nearest neighbor)</li>
 		  	<li><b>Context</b> - Robot is the context. It keeps the context info like position, close obstacles and passes this info to the strategy class.</li>
		  	<li>Like a game of Risk.</li>
		  </p>
        </div>
		
		<div class="slide">
          <h2>Strategy Pattern Code</h2>
          <p><br><img src="./images/rockem-sockem.png">
		  <br>Demo: <a href="http://cfmumbojumbo.com/cf/codedemos/robotstrategy/robotDemo.cfm">http://cfmumbojumbo.com/cf/codedemos/robotstrategy/robotDemo.cfm</a>
		  <br>Code is on github: <a href="https://github.com/boltz/Robot-Strategy-Example">https://github.com/boltz/Robot-Strategy-Example</a>
		  
		  </p>
        </div>
		
		
		<div class="slide">
          <h2>The Controller as a Strategy Pattern</h2>
          <p>
			<img src="./images/controller as strategy.png">
			<li>It is the "interpeter" between the View and the Model. Keeps them decoupled</li>
			<li>Controller provides the strategy for the View</li>
			<li>Keep your Controllers "thin"</li>
 		</p>
        </div>
		
		<div class="slide">
          <h2>MVC & The Web</h2>
          <p> 
		  Due to the "stateless" nature of the web. The view can not observe the Model directly (unless you are using websockets)
			<li>Controller informs the View of changes in the state of the Model.</li>
			<ol>
			<li>View sends your actions to controller.</li>
			<li>Controller calls the Model</li>
			<li>Controller observes the change in state of the Model</li>
			<li>Controller can decide on changes to the view (disable buttons etc) that are application specifc (not business logic)</li>
			<li>Controller informs the view of the change in state of the Model</li>
			<li>View return HTML to browser</li>
			</ol>
 		</p>
        </div>
		
		<div class="slide">
          <h2>Using MVC</h2>
		  <ul>
          <li>Do I need some complicated framework to use MVC? NO!</li>
		  <li><a href="http://www.dopefly.com/techblog/entry.cfm?entry=307">The easiest MVC EVER!</a></li>
		  <li><a href="http://www.dopefly.com/techblog/entry.cfm?entry=308">Slighlty Harder MVC</a></li>
		  <li>ColdBox (ColdFusion), AngularJS (Javascript), Cairngorm (Flex)</li>
		  </ul>
 		</p>
        </div>
		
		<div class="slide">
          <h2>MVC In ColdBox</h2>
		  
         	<p><center>The Reddit Picture Frame in all its glory
			<br>
			<img src="./images/reddit-pic-frame.png">
			</center>
         		
				
         	</p>
		
 		</p>
        </div>
		
		<div class="slide">
          <h2>Why would I want to?</h2>
		  <ul>
          <li>Keep designers out of your code!</li>
		  <li>The model is transportable.</li>
		  <li>Testability</li>
		  <li>Provide views for differing screens easily.</li>
		  <li>The pattern is used in almost all languages</li>
		  <li>People will stop laughing at you at conferences.</li>
		  </ul>
 		</p>
        </div>
		
		<div class="slide">
          <h2>Where can I learn more</h2>
		  <ul>
          <li>Head First: Design Patterns </li>
		  <li>Learn a MVC framework www.coldbox.org </li>
		  </ul>
 		</p>
        </div>
		
		
		
		
      </div>
    </div>
    
    <div id="footer">
      <div class="container">
      <a href="http://cfmumbojumbo.com/">Tim Cunningham 2011</a>
      </div>
    </div>
    <script type="text/javascript" src="scripts/jquery.js"></script>
    <script type="text/javascript" src="scripts/jquery.presentation.js"></script>
    <script type="text/javascript" src="scripts/global.js"></script>
  </body>
</html>
</cfoutput>
