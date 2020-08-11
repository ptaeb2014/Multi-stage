<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
  width: 100%;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 10px 10px;
  text-decoration: none;
  font-size: 12px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.active {
  background-color: #4CAF50;
  color: white;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
</style>
</head>
<body>
  
<div class="topnav" id="myTopnav">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <a href="index.html"><i class="fa fa-fw fa-home"></i> Home</a>
  <a href="https://ptaeb2014.github.io/Description/"><i class="fa fa-fw fa-cog"></i> Description</a>
  <a href="https://fit-winds.github.io/IRLSetup/"><i class="fa fa-fw fas fa-wind"></i> IRL setup</a>
  <a href="https://fl-asgs.github.io/ECFL-IRL//"><i class="fa fa-fw fas fa-water"></i> IRL ASGS</a>
  <a href="https://ptaeb2014.github.io/WhoWeAre/"><i class="fa fa-fw fas fa-users"></i> Who we are</a>  
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>

<div style="padding-left:16px">
  <p></p>
</div>

<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>
</body>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Cambria, sans-serif;
  margin: 0;
}

* {
  box-sizing: border-box;
}

.row > .column {
  padding: 0 8px;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

.column {
  float: left;
  width: 22%;
  margin.left: 4px
}

/* The Modal (background) */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: black;
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  width: 30%;
  max-width: 1200px;
}

/* The Close Button */
.close {
  color: white;
  position: absolute;
  top: 10px;
  right: 25px;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #999;
  text-decoration: none;
  cursor: pointer;
}

.mySlides {
  display: none;
}

.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

img {
  margin-bottom: -4px;
}

.caption-container {
  text-align: center;
  background-color: black;
  padding: 2px 16px;
  color: white;
}

.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

img.hover-shadow {
  transition: 0.3s;
}

.hover-shadow:hover {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

p1 {
  font-size: 15px;
  color: #707070;
}

p2 {
  font-size: 15px;
  font-weight: bold;
  color: #707070;
}

p3 {
  font-size: 18px;
  font-weight: bold;
  color: #000000;
}

hr { 
    display: block;
    margin-before: 0.5em;
    margin-after: 0.0em;
    margin-start: auto;
    margin-end: auto;
    overflow: hidden;
    border-style: inset;
    border-width: 0px;
    height: 3px;
    background-color:#000;
} 

</style>
<body>

<p>3.5-day forecast starting on Mon May 18 2020 cycle 12Z<p>
<br>

<p3>Representative animated forecast results</p3>
<hr>

<div><p1>Representative animations are created from simulations forced by NAM.</p1></div>
<div><p1>Click on the image below to see more plots</p1></div>

<br>
<div class="row">
    <img src="https://github.com/ptaeb2014/Multi-stage/blob/master/plots/full_elev_wind.gif?raw=true" style="width:100%" onclick="openModal();currentSlide(1)" class="hover-shadow cursor">
</div>

<div id="myModal" class="modal">
  <span class="close cursor" onclick="closeModal()">&times;</span>
  <div class="modal-content">

    <div class="mySlides">
      <div class="numbertext">1 / 4</div>
      <img src="https://github.com/ptaeb2014/Multi-stage/blob/master/plots/full_elev_wind.gif?raw=true" style="width:100%">
    </div>

    <div class="mySlides">
      <div class="numbertext">2 / 4</div>
      <img src="https://github.com/ptaeb2014/Multi-stage/blob/master/plots/full_hs_dir.gif?raw=true" style="width:100%">
    </div>
    
    <div class="mySlides">
      <div class="numbertext">3 / 4</div>
      <img src="https://github.com/ptaeb2014/Multi-stage/blob/master/plots/irl_elev_wind.gif?raw=true" style="width:100%">
    </div>
    
    <div class="mySlides">
      <div class="numbertext">4 / 4</div>
      <img src="https://github.com/ptaeb2014/Multi-stage/blob/master/plots/irl_hs_dir.gif?raw=true" style="width:100%">
    </div>
    
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>

    <div class="caption-container">
      <p id="caption"></p>
    </div>


    <div class="column">
      <img class="demo cursor" src="https://github.com/ptaeb2014/Multi-stage/blob/master/plots/full_elev_wind.gif?raw=true" style="width:100%" onclick="currentSlide(1)" alt="Water Level and Wind">
    </div>
    <div class="column">
      <img class="demo cursor" src="https://github.com/ptaeb2014/Multi-stage/blob/master/plots/full_hs_dir.gif?raw=true" style="width:100%" onclick="currentSlide(2)" alt="Wave Height and Direction">
    </div>
    <div class="column">
      <img class="demo cursor" src="https://github.com/ptaeb2014/Multi-stage/blob/master/plots/irl_elev_wind.gif?raw=true" style="width:100%" onclick="currentSlide(3)" alt="Water Level and Wind">
    </div>
    <div class="column">
      <img class="demo cursor" src="https://github.com/ptaeb2014/Multi-stage/blob/master/plots/irl_hs_dir.gif?raw=true" style="width:100%" onclick="currentSlide(4)" alt="Wave Height and Direction">
    </div>
  </div>
</div>


<script>
function openModal() {
  document.getElementById('myModal').style.display = "block";
}

function closeModal() {
  document.getElementById('myModal').style.display = "none";
}

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>


<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.container {
  position: relative;
  width: 100%;
  max-width: 500px;
}

.container img {
  width: 100%;
  height: auto;
}

.container .btn1 {
  position: absolute;
  top: 1.6%;
  left: 30%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn2 {
  position: absolute;
  top: 3.4%;
  left: 29.8%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn3 {
  position: absolute;
  top: 16%;
  left: 40%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn4 {
  position: absolute;
  top: 17.1%;
  left: 37%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn5 {
  position: absolute;
  top: 21.9%;
  left: 37.5%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn6 {
  position: absolute;
  top: 27.8%;
  left: 49%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn7 {
  position: absolute;
  top: 30.3%;
  left: 50.5%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn8 {
  position: absolute;
  top: 31.5%;
  left: 55%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn9 {
  position: absolute;
  top: 31.8%;
  left: 42%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn10 {
  position: absolute;
  top: 33%;
  left: 47%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn11 {
  position: absolute;
  top: 35%;
  left: 47.2%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn12 {
  position: absolute;
  top: 36.2%;
  left: 45.5%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn13 {
  position: absolute;
  top: 40%;
  left: 47.5%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn14 {
  position: absolute;
  top: 42%;
  left: 50%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn15 {
  position: absolute;
  top: 43.3%;
  left: 48.9%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn16 {
  position: absolute;
  top: 46%;
  left: 51%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn17 {
  position: absolute;
  top: 56%;
  left: 59%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn18 {
  position: absolute;
  top: 56%;
  left: 61.5%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn19 {
  position: absolute;
  top: 61%;
  left: 61.9%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn20 {
  position: absolute;
  top: 73.5%;
  left: 69.1%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn21 {
  position: absolute;
  top: 75.1%;
  left: 70.2%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn22 {
  position: absolute;
  top: 86%;
  left: 77.2%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.container .btn23 {
  position: absolute;
  top: 97.6%;
  left: 85.5%;
  background-color: #830000;
  border: none;
  cursor: pointer;
  width: 10px;
  height: 10px;
  opacity: 0;
}

.button5 {border-radius: 50%;}

.container .btn:hover {
  background-color: black;
}
</style>
<body>

<style>

hr { 
    display: block;
    margin-before: 0.5em;
    margin-after: 0.0em;
    margin-start: auto;
    margin-end: auto;
    overflow: hidden;
    border-style: inset;
    border-width: 0px;
    height: 3px;
    background-color:#000;
}  

.blinking{
    animation:blinkingText 1.5s infinite;
}

@keyframes blinkingText{
    0%{    color: #707070;  }
    50%{   color: #943A3A;  }
    100%{  color: #001FFF;  }
}

.blinking_dot{
    animation:blinking_dotText 1.5s infinite;
}

@keyframes blinking_dotText{
    0%{    color: #707070;  }
    50%{   color: #FC5617;  }
    100%{  color: #900000;  }
}

</style>

<br>
<br>
<br>
<p3>Time series forecast water level and wave height</p3>
<hr>

<div><p2><span class="blinking">If using Chrome, make sure the browser allows all pop-ups</span></p2></div>
<div><p1>Click on the</p1><p2><span class="blinking_dot"> dots </span></p2><p1> for time series forecasts</p1></div>
<div><p1>At points in <font color="orange">orange</font>, forecasts are validated using real-time observations</p1></div>
<br> 
 
<div class="container">
  <img src="https://github.com/ptaeb2014/Multi-stage/blob/master/images/station-300DPI.jpg?raw=true" alt="Stations map" style="width:100%">
  <button class="btn1 button5" onclick="myFunction1();"></button>
  <button class="btn2 button5" onclick="myFunction2();"></button>
  <button class="btn3 button5" onclick="myFunction3();"></button>
  <button class="btn4 button5" onclick="myFunction4();"></button>
  <button class="btn5 button5" onclick="myFunction5();"></button>
  <button class="btn6 button5" onclick="myFunction6();"></button>
  <button class="btn7 button5" onclick="myFunction7();"></button>
  <button class="btn8 button5" onclick="myFunction8();"></button>
  <button class="btn9 button5" onclick="myFunction9();"></button>
  <button class="btn10 button5" onclick="myFunction10();"></button>
  <button class="btn11 button5" onclick="myFunction11();"></button>
  <button class="btn12 button5" onclick="myFunction12();"></button>
  <button class="btn13 button5" onclick="myFunction13();"></button>
  <button class="btn14 button5" onclick="myFunction14();"></button>
  <button class="btn15 button5" onclick="myFunction15();"></button>
  <button class="btn16 button5" onclick="myFunction16();"></button>
  <button class="btn17 button5" onclick="myFunction17();"></button>
  <button class="btn18 button5" onclick="myFunction18();"></button>
  <button class="btn19 button5" onclick="myFunction19();"></button>
  <button class="btn20 button5" onclick="myFunction20();"></button>
  <button class="btn21 button5" onclick="myFunction21();"></button>
  <button class="btn22 button5" onclick="myFunction22();"></button>
  <button class="btn23 button5" onclick="myFunction23();"></button>
</div>

<script>
function myFunction1() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSSouthSmyrna.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLSouthSmyrna.jpg?raw=true","water level", "height=500px, width=500px");  
}

function myFunction2() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSSouthNewSmyrna.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLSouthNewSmyrna.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction3() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSHauloverCanal.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLHaulover.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction4() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSNorthIndianRiver.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLNorthIndianRiver.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction5() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSTitusville.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLTitusville.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction6() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSNorthCape.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLNorthCape.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction7() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/Trident_WL.jpg?raw=true","Water Level", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/Trident_Wind.jpg?raw=true","Wind", "height=500px, width=500px");
}

function myFunction8() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/NOAA41113_HS.jpg?raw=true","Water Level", "height=500px, width=500px");
}

function myFunction9() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSCocoa.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLCocoa.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction10() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSNorthSR520.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLNorthSR520.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction11() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSThousandIslandBR.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLThousandIslandBR.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction12() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSSouthRockledge.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLSouthRockledge.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction13() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSNorthSR404.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLNorthSR404.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction14() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSLansingIsland.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLLansingIsland.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction15() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSNorthSR518.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLNorthSR518.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction16() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSNorthUSR192.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLNorthUSR192.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction17() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSNorthSebInlet.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLNorthSebInlet.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction18() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/CPRG_HS.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/CPRG_WL.jpg?raw=true","water level", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/CPRG_Cur.jpg?raw=true","Current", "height=500px, width=500px");
}

function myFunction19() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSWabasso.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLWabasso.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction20() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSFortPierceNorth.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLFortPierceNorth.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction21() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSFortPierce.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLFortPierce.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction22() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSStlucieSouthA1A.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLStlucieSouthA1A.jpg?raw=true","water level", "height=500px, width=500px");
}

function myFunction23() {
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/HSJupiterInletLoxahatchee.jpg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://github.com/ptaeb2014/Multi-stage/blob/master/plots/WLJupiterInletLoxahatchee.jpg?raw=true","water level", "height=500px, width=500px");
}
</script>

</body>
</html>
