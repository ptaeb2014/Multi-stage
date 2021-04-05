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

<p>3.5-day forecast starting on Mon Apr 05 2021 cycle 00Z<p>
<br>

<p3>Representative animated forecast results</p3>
<hr>

<div><p1>Representative animations are created from simulations forced by NAM.</p1></div>
<div><p1>Click on the image below to see more plots</p1></div>

<br>
<div class="row">
    <img src="https://xbbava.sn.files.1drv.com/y4mu7OJB1v9n7oPHt9GpVVkZ8ub1ZfxHUeGqh03zb00ip469VMXeogQT7fQM5pcyoOmxfegZAXWgVYaOgrEuf5AChz7jWM5EhMH7WD62qj-6DPETURBC09JXC6v7tYsHqVqxguIzloTFez9XmyM-g0uGFeNZX0IkMX-GgEB3gs4re5l3afRWZ69b1U-Va6cuHALtNlFBIrEXyA9Z2K2v6ZQzA?raw=true" style="width:100%" onclick="openModal();currentSlide(1)" class="hover-shadow cursor">
</div>

<div id="myModal" class="modal">
  <span class="close cursor" onclick="closeModal()">&times;</span>
  <div class="modal-content">

    <div class="mySlides">
      <div class="numbertext">1 / 4</div>
      <img src="https://xbbava.sn.files.1drv.com/y4mu7OJB1v9n7oPHt9GpVVkZ8ub1ZfxHUeGqh03zb00ip469VMXeogQT7fQM5pcyoOmxfegZAXWgVYaOgrEuf5AChz7jWM5EhMH7WD62qj-6DPETURBC09JXC6v7tYsHqVqxguIzloTFez9XmyM-g0uGFeNZX0IkMX-GgEB3gs4re5l3afRWZ69b1U-Va6cuHALtNlFBIrEXyA9Z2K2v6ZQzA?raw=true" style="width:100%">
    </div>

    <div class="mySlides">
      <div class="numbertext">2 / 4</div>
      <img src="https://jicsiw.sn.files.1drv.com/y4mzHMkeESbUwmJ-QpYU1h2NZOVuQW5eHGeH_sALm7Z0oXcGDRycrUuRKQ5k4hNTXflaItmTmKn17cg7TR57riz30cjo2IFpfAOQe960WJZLnhyqWOnb08FTZHOs9qtNOJBD6O3Slc-dnpSQT2w9zHFqw9memdNu2w4YngDnU4XUgL9Eu3MPcbSvLr43b0naKvysa5d1YKFIJ_mmXtNb4aXiQ?raw=true" style="width:100%">
    </div>

    <div class="mySlides">
      <div class="numbertext">3 / 4</div>
      <img src="https://vclrja.sn.files.1drv.com/y4mCGTl69TfsjAMHBoSkF4KW4T20i-hvJe5_nga3ImCxhzvdzB8qNDsfU4puJJItW9sxPG5kLukvaqfvyU97Rn-lKg7Ma8o6wEwiANySEzqYqa3PokBFU5ybSoRy_VgX0jSCH3NSVgBmmpQ5AUUbHCvQbfVyKBdEnwOUo7CsOsVqBB3WDVkd59qi2EfTuZ4RB1d8ccis3kIQ68GUFqqLbb3mA?raw=true" style="width:100%">
    </div>

    <div class="mySlides">
      <div class="numbertext">4 / 4</div>
      <img src="https://wd4adg.sn.files.1drv.com/y4mY8hAC7ebc8QEuD7wl4cUmWo_F3e36aHliaHb61O96sBpjkzbJ1qdvH5HlwclsbqhHG7yM_d6H9TB8MRzD-i86Q4CbnHAHOl1eNhfw-GoanQ47j10fkyApZE_pwfn2VY2W8kq3ar4CQpMJnbhVhh4nXBD7VLf3yBnOTRGfgfMvQMona61Zf2vXN07BmVzAC-V__bt6L9SQJM2SjBKn-GtWw?raw=true" style="width:100%">
    </div>
 
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>

    <div class="caption-container">
      <p id="caption"></p>
    </div>


    <div class="column">
      <img class="demo cursor" src="https://xbbava.sn.files.1drv.com/y4mu7OJB1v9n7oPHt9GpVVkZ8ub1ZfxHUeGqh03zb00ip469VMXeogQT7fQM5pcyoOmxfegZAXWgVYaOgrEuf5AChz7jWM5EhMH7WD62qj-6DPETURBC09JXC6v7tYsHqVqxguIzloTFez9XmyM-g0uGFeNZX0IkMX-GgEB3gs4re5l3afRWZ69b1U-Va6cuHALtNlFBIrEXyA9Z2K2v6ZQzA?raw=true" style="width:100%" onclick="currentSlide(1)" alt="Water Level and Wind">
    </div>
    <div class="column">
      <img class="demo cursor" src="https://jicsiw.sn.files.1drv.com/y4mzHMkeESbUwmJ-QpYU1h2NZOVuQW5eHGeH_sALm7Z0oXcGDRycrUuRKQ5k4hNTXflaItmTmKn17cg7TR57riz30cjo2IFpfAOQe960WJZLnhyqWOnb08FTZHOs9qtNOJBD6O3Slc-dnpSQT2w9zHFqw9memdNu2w4YngDnU4XUgL9Eu3MPcbSvLr43b0naKvysa5d1YKFIJ_mmXtNb4aXiQ?raw=true" style="width:100%" onclick="currentSlide(2)" alt="Wave Height and Direction">
    </div>
    <div class="column">
      <img class="demo cursor" src="https://vclrja.sn.files.1drv.com/y4mCGTl69TfsjAMHBoSkF4KW4T20i-hvJe5_nga3ImCxhzvdzB8qNDsfU4puJJItW9sxPG5kLukvaqfvyU97Rn-lKg7Ma8o6wEwiANySEzqYqa3PokBFU5ybSoRy_VgX0jSCH3NSVgBmmpQ5AUUbHCvQbfVyKBdEnwOUo7CsOsVqBB3WDVkd59qi2EfTuZ4RB1d8ccis3kIQ68GUFqqLbb3mA?raw=true" style="width:100%" onclick="currentSlide(3)" alt="Water Level and Wind">
    </div>
    <div class="column">
      <img class="demo cursor" src="https://wd4adg.sn.files.1drv.com/y4mY8hAC7ebc8QEuD7wl4cUmWo_F3e36aHliaHb61O96sBpjkzbJ1qdvH5HlwclsbqhHG7yM_d6H9TB8MRzD-i86Q4CbnHAHOl1eNhfw-GoanQ47j10fkyApZE_pwfn2VY2W8kq3ar4CQpMJnbhVhh4nXBD7VLf3yBnOTRGfgfMvQMona61Zf2vXN07BmVzAC-V__bt6L9SQJM2SjBKn-GtWw?raw=true" style="width:100%" onclick="currentSlide(4)" alt="Wave Height and Direction">
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
 window.open("https://87lwug.sn.files.1drv.com/y4mRLgaYs05hPu05oJd9TsdTMnQbUM3Z5GYrxhh8px80h8GdUIBxnGOQwAgR4byu0r0WHsRqttBx0afEWuLnlYpro33gbnSgoqS9qQueaovBEYTKGZHPYomb1-cFY6Cw1NzI_i5HoGtRbI4l4UqNaI0asDrc2fejWtPhGwkKC5csQIB0aVPOKEVv7qhoTlMykBvb7-UraWOJTvnhonng0O83A?raw=true","wave height", "height=500px, width=500px");
  window.open("https://vck1ow.sn.files.1drv.com/y4mroyy2BvhAdlqB55TMBVn14_Sv1fPYyanawW9ok_u7UM3Ai9PD1tqyCS6GLFROJ3QFdIMur2mQaunrUChhkdbv8rO_u2tXDXPvVQUw1chvbOroh96RlqhbAg4uawszGmczuLoeROUu0fHqoGf4q4qW213yT4MJagu9FHq8GPicMUFo0tnOv4juzV2PZWmW2XJQkx5iVZtwurJKbaLDgDlmw?raw=true","water level", "height=500px, width=500px");
}

function myFunction2() {
  window.open("https://vcl5sg.sn.files.1drv.com/y4mRT8_nYb9Z2KXKO0cYZyWjDsu7-3YBHero6hDANv4pYDV6YamhtWehzxyr7uI__dtgVYu0N5NupVVqmbSFnQqEx-Us_rHgpJBCbbgytUGjyit_xSloUjJl322CiJvAQEzdloTq2QrsdzBfvX9aRy5LrFu164ZeWictZVjp9QW9uct3KQYkv5OO6eoRTSLnK1KB0NS6_6jToJC7tJgpsBvPA?raw=true","wave height", "height=500px, width=500px");
  window.open("https://wd4txw.sn.files.1drv.com/y4mxowQOJ2EN1zN-nwgt2zSDp-mMHBPTuMXvv66WtztnBQpAgklZl9JUERH6J87H_xJhnlX-U369jLNoDZJP1FBEhq1cSYk1msKnrOO8QaXdZCiSukCNUyDoZLjt8o7hoaCHQAueTmyFCWzLmsLdq9kLTT6QxXqIUDh0ARZzYcMFH9z7_T7SqrgMjWqc1BpCV5PK0WTJ0Kno87t87dL_D457g?raw=true","water level", "height=500px, width=500px");
}

function myFunction3() {
  window.open("https://vcmhdq.sn.files.1drv.com/y4m1ZBDne5WdoCNPP8znKUnkr6UHWgL9p1MaBkrppvaWpjvwrVBdvB7SbXHewnAA75v4lfSUkTzboWFTYa-Jn-fmjcmUl1z9La9HTI7ZaGWxV4LuGUdSW_QQ6jC8E2bBN_2-RBR-VvJGwm-I0RtkvTp3EN8WOaKWWzTdppEJh_2fujvwab55KbYB10Q_Bf-5Q_ewKM9WU16yQUb4wRQw5z4Ew?raw=true","wave height", "height=500px, width=500px");
  window.open("https://wd68yq.sn.files.1drv.com/y4mS_40J3LQh44DKJUvabtD_qwIG1juk41rPL9zFgZAD6YOE00Vbblmnm5O2XRMnGQq81Ik-2Ft-v3OIAwMVN6nfL6wtg8Tw9Qf_oGFdc9QpRZDcRRjLJCOIFW1b4MTMwkmfL-0vsE8iyeV0SAU5eHDbNhyk_xDymiK0dsZbpHIcj_4UURMnNyevzTwQUbYN3LO_I4b5K3tukwKnJ-ufkZ6pA?raw=true","water level", "height=500px, width=500px");
}

function myFunction4() {
  window.open("https://vck8gg.sn.files.1drv.com/y4m1Z7dEFGusH23t5K2GcAuGy-TH9xh2QMyBUx9CHav_EAqLHS5dQ4MAe7Xqzu1evhRe9thld5DqMQ1yDKC1f9kgubsxkWgnTt0KQ95ExQoowT6rNBrLsy6K3spFnwXnNsmL2EyTl4q7XJJTBj5pFz7GRL85pNXE0FC284azenQSZdKpgE935STAdlwAgAz6vwD7vdbO4Vl-WaWRXhTJoU3Kw?raw=true","wave height", "height=500px, width=500px");
  window.open("https://kzx1gq.sn.files.1drv.com/y4mmep7wsDudPT-abLU2iT4Wb8DN9eNqaDwOG9PSPweZDXQKkykGvF9Hk9j24Wr4XCzvSx5Wd_El7Pws2crVYOM9jplKECrCPvktgHjTLaFW1wJq_0CJOGIlp_EssqKyzud2QK79Yjn36qm4Je5Tha77Ba6kXgZ1g5oKHjWw6mBrDl4udCPuyCoBn-VnRZezlmFydPH0qMzO2TPm2p_z28amw?raw=true","water level", "height=500px, width=500px");
}

function myFunction5() {
  window.open("https://87li9w.sn.files.1drv.com/y4myE7owPoZc0A1g5wiqFfPTVungA9BHi3ha7G7o4df3GN6Lt3m4ig6mQOqikbnM_V3PoXTy8DG9UgdMCKfbIEAQYhifAIBjV_Fdt_Cqsxxc7LKnaFIo_yibDmCTMoC4eYAImDy391uW0q0br5evRyqeATFBjjk1M-pVZyxxxdTE4Kd0M7jfM5mNsTiEf9RDMgc-Oq8rLLk4DND0ZZz6Y8FCg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://87klxw.sn.files.1drv.com/y4ml0lpXbeuytgyX_-y94pz_ckI9Lzs0Uc7o2uiSishR9DxHoMIl9L4WnptMjol4YVOF3LpEDzrDZgXrkxNWWos4V8-c9t3RzZNJtB1BWECtknsGtpjlUIGgTrReiPzX0XVM6CV3XmW4k3sORkNztOxTd4rKefYCQdDqZpZ1-uYujz0DFldCOaNtNFTeikZEjGS4DhRrI107zNGz2Q_eCwshQ?raw=true","water level", "height=500px, width=500px");
}

function myFunction6() {
  window.open("https://87kega.sn.files.1drv.com/y4m_GyCV1QpgHTVbQAzB-8r4F-xKzpIxv0ZeogC_DBlWTnF664mdXsPmEw9xPkg2lEYsafPqq1h-RSBrV7FP5qBdsoVTrapp2bUjsoew-pLDfb5dtFvapyTA5U78PDHtTmrJnKfJwU9HOUNgQH-bQ5iuOZNW21Y3kGFEb1r3bJiUz1-0Bt5WPBANiaYFkgcREVUhFwXl3GvDrvv5zy8_OQgkg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://kzwq9g.sn.files.1drv.com/y4mQkPnl69dKySA_M5xdLgZmROh4WK4195F2B1B7fWyH1eiBExlkg97J4p0GT-oZgSUkQu98mRnblw67NmvbDmXk8MvIKhPOeu7dJhDyvmnsee_5KO_j2K2JZIkaYWcWJMLy-45mB8bvpQ61yOPTXqSK8URaq_9yY6V46KS3xf_IVyvT-JU7urqsx5dn-5KGh1jpOK5E2RKEKC5NCYiM-6QAA?raw=true","water level", "height=500px, width=500px");
}


function myFunction7() {
  window.open("https://kzwjrw.sn.files.1drv.com/y4mRcdXevMPjkbKcf14SQTJWBVat1UBZNkDKkjut4OoUzFoh7RKyouTLRg0ZGJspBorcQLK28l8z8I0VHMXhEU_XM8YsvvFkfWh-IyHcx7a1a5PY5L13CSTIdDQPts8pi_gKMk3p2fmS5LgScChE-7gWpQ3hlTGQRzv2s_xZpgkiSPrkd4Nusu_wm28wweSSQI_vPRDTkL9lfWmWZBHaRJtCQ?raw=true","Water Level", "height=500px, width=500px");
  window.open("https://jifhlw.sn.files.1drv.com/y4mgTev0X5kt2Q5-0V__xzJ5hOrf3F0cuzINnSUj73rbNxYfto4xPtZITdcu-LFCecg8YO4TBC4r9sVojon7chEz0WfjW5Ant6Zu4iw4Q7o36VCo1BnOCCuc_nM6KN49AFK92e3nAid3B7GTldu8BhYaeLrbEiHMWaQ38J9sFqmYBbbZLVehWoObWeUn0icO8MzW7Cm_OCFVJo6HZ1_WoNnqQ?raw=true","Wind", "height=500px, width=500px");
}

function myFunction8() {
  window.open("https://wd54ug.sn.files.1drv.com/y4mcph8hIABi8QErsLODrtG4HBmRKWCzn9zcjC-bx0BXiFMHN7_9BPaoI7OkUi01V1Q54I1H_dvV_FZw4A2cGcJF9atV-HAry_uKDsHAGCMmfNyOj6cSAxyxxy4ANAPC6r5KNxeTXk1GyccRoQC_QnW9Z24sfPFgguX5KhPoz1mo22IPlWWWgo7rNiZNHHnVwsnyXjh-9ATAsK3nNFnXmnfWg?raw=true","Wave height", "height=500px, width=500px");
}

function myFunction9() {
  window.open("https://jiey9q.sn.files.1drv.com/y4mY3E5yauGqry4TtJpeEnugwIwp1vHznyOc920_oDinfbE7wNG4D7V-zXJBic3iUehb5NKdMvGmfi0RwZ6QEbrQnQ5-FySTcKtG-aKG_JYrgh7EmPSj_9PUqOqS_JUlHeV_6hIn0Md9ySOiJ9hdoumbDgE3ch1L8o66WZwZzihLpnQufbCg4xTcPnVx9bEVDcQctQZruh8faKDxVwLQ6_EFA?raw=true","wave height", "height=500px, width=500px");
  window.open("https://87jv3g.sn.files.1drv.com/y4mpDt2UEEMdELVnP7MGIgsoEd6m0Z9KdZBAy6PK6GzGgKA-pZyMiReVy1U_suoFYMhCO_YK50cyJha86h98KC_Fgg9YgYk57SA09clQYfXzXnRRMDVfeyCzGqdGTuDFN3UhrSj-z9Ht_y3lSQtvqw8ItZQdRsM3iSb1wG_-9qs4Zmlr7DPRuz5-yQTorIryxLIm6URQtutrGyZGD2BXoYolQ?raw=true","water level", "height=500px, width=500px");
}

function myFunction10() {
  window.open("https://87if9q.sn.files.1drv.com/y4m37qPK6JrjLHCuglIzb9kUBqU1zIpAVTgWbYNu_WgfEEwPUEL4p_nhHImn5pkcOtPFP2tlqBK8XNW7fY-d97FUdUV6qCBCI0qBud1xY9-CXNQUxpOCamYgIqFbs-4oiU4HkxNxjIJiVZBIN7KWHT4dmyVElD4_iON_t4bvi0a7GOMk5KmCZM-S_iC_RAkEEskRmRXUokDV26Bpo27AEQo4w?raw=true","wave height", "height=500px, width=500px");
  window.open("https://wd5qmq.sn.files.1drv.com/y4mv6v0fEFBF7-84a8M3COy-xe0BAMZpcus5uBYZW6GbVWeoEjJVazikonS1xQdj-HUkxFURlSElPK8W_2rhaBW5ROBgVNL13aLFbIL1J27s19fOjK4tImpuH3kZL9v8CA3Tej5au2BLQzBUwkt0mVDDOmztdKgeA9obCIYgCIqIZrDy-_QOVmaFVnX5Eh8ecyLxGSjCl8sHWYwtUhY42SXvA?raw=true","water level", "height=500px, width=500px");
}

function myFunction11() {
  window.open("https://jidwmg.sn.files.1drv.com/y4mEuoleYhaq3XPQLJNpvfJDaSO8AjvouALU3FOAwr3FtOEnBrwLhwiyVAWK2JtyKFbndxNCkM-8T-B_QOLZpAbfHHSTksrzYjqJrt63iqkrDj9J0CJPwMgdF3E4fpdfCh3x2bTqF7FzbDCF-yLTyu8e86JTr9tcSiVqPgv9or1G1H-z0-QTD5e8ujYyEwS3A77vkPuQLuUU5nVEzCD1s-t1g?raw=true","wave height", "height=500px, width=500px");
  window.open("https://87jjba.sn.files.1drv.com/y4m4Os0m_QUNc-QJiDbvINSL_7nO3rfzHXldHXWrgqIwGOHHzq09CMkmxhRWn0cr65EQ06UytYAY152DIGWRU1e3sunLjQhVquRKmO7MMmuFePMJ_dxsqzP8hkK6j8BfR7NQIYvAnyXt9njLbWsKqdHvM_cQv5uhHja7oOtOxxZdpJOrlEsyUg6cEkOKApzk2ZSLSTEuFSLpymYywxHv8An3A?raw=true","water level", "height=500px, width=500px");
}

function myFunction12() {
  window.open("https://vcnx9g.sn.files.1drv.com/y4mv1MerNtbG8_37Ket0rpSzFCcTIe-qfO_ODL9SQHl6eMJitKOR9wFE3Dv7sTg8UUHWvF5yISAHeeYgh6hCayks0hHnVrgDS7KwHj7tBX9S8WvcAvPHA1jt8Gat4rG9C1swz-WpbJEyPi1Z7uoeG5AVsRSow0aaaW_BH-rxiEEMXVir4N9YZiVhhWbkEk0A-CRyI49olik0Nu9KIYycABeIw?raw=true","wave height", "height=500px, width=500px");
  window.open("https://jiczag.sn.files.1drv.com/y4mL57FRwodxEuw1r9fjjb6GS6Y7QrwAhf5WSup3Av3aujDLAJuVAcXVDJ3QjFHWOzMKw08QJqqxLULQSRpdcmsvgakvqD9K-2eQXzhXmOJ4tT6TnPTU1plCicr_hDI1hFbtcGRK2bF2LcqxYGk34JPmtENmqZnLncy77oJSJkQuwMecMuiR6cXkS3Hbvp0x_vGIYNb0ZmAjp118MJb9yQYJw?raw=true","water level", "height=500px, width=500px");
}

function myFunction13() {
  window.open("https://wd54ug.sn.files.1drv.com/y4mXNPMamrt1YwvGJAAtNz5FufusQuKCnRanN5iMqp7FUnQhkC7RQA6U8rHulaatGOTb7X04sEtrn1QZrzUEbGRmdHHjKZxWFpL2fU_dkbmhfktaJqk1-1_kL7kPhv9kR-zFuLirkAcmg2pQy9mVX8Z-r0dZ-cUY3wRx7lkCvPQfH_B1Yblqc9NFAYzzn2q7dIHmkYQQfbu25yoyv-9bi37xQ?raw=true","wave height", "height=500px, width=500px");
}

function myFunction14() {
  window.open("https://jidida.sn.files.1drv.com/y4mT4YVywjgh4yzQdRzC5FYfOJDTXt-6uCQbqNnBVQU_wBVUxNTsNpQLkx8d_afjh2EtXr6kHvbZxJ2dfA8B9CU6kn62SUxQMS89p0-nAxWsnX7yplH-lxIE0wasfnpJve931BsRB3Fi0b_ny8hw3rd_VWs4H0yGnUVmcPAG_AjXGJcNQwazzKLdBzQkgCwatl84ZVazt-L4sP_ZMZKFHwiOA?raw=true","wave height", "height=500px, width=500px");
  window.open("https://jidpuw.sn.files.1drv.com/y4msbhQfPmMqhwaFLQtwYpckRPRQsD5OrsE9R91scSNYrvckcCuxiW0Cvv0T5cO3qrNw-C-U_hGKpllaTwT9gfpls89qY-eVEPNNwMaq3bn3E-mmBO8vFzcitmEvr7OK_Pm2c8SiuXd_XXIo55w6hi5kFokcTX3DJazDanDqxSV8KvPkPU_cX58oNtT4CIqMVHHOZTSMQqdVXeD5mYhIjXakw?raw=true","water level", "height=500px, width=500px");
}

function myFunction15() {
  window.open("https://kzwxpq.sn.files.1drv.com/y4mqxDDtTKPrLZDDCFUFT9WkLAd5yYJ05rUKAk0JUb74mFJS1GD8nICFmVIYcg10Fz8uMwyx2dsNIBy4F9U4x_FaVnxCfNAHC-FZp41DS5mf1jTELsdnoIjX_Zqnxwmi_UGTSD9TtOvxnDvu588Ykhm7jHkzTETB5K8TWPXsqkBiCbNYJBlxV_b4OVxtIbZr4M0FjT005rQwGONJ-Vywu_fEg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://kzxuog.sn.files.1drv.com/y4mvAnRFvqeNMti2kxWNr_1Tfv41j5oEWr1oGPPPOzADCeG6Ws8Hpz69CQG1M2SkuYLtLKRKgxkAgATrpj6S2Xl_CLXxXUQ0fb05w-1LZNvNoEqYqBszkkMQzIvUc2HkrP4c0vyh5kZ72c2juA4JBxqp183b4Nx6i3aHn__DRqnJMY293AI-uqESOPup96cNDK4k66Bf-YrE8WACUnXrEkL2g?raw=true","water level", "height=500px, width=500px");
}

function myFunction16() {
  window.open("https://87k6aq.sn.files.1drv.com/y4mXuT7_xjNfZmMqV0l4ByPr37NYhHK2GaH5N-8FWe9eEDZvNh28CYRNSBEkOuCURqbmEdnSQkAAh4Plpq1Hic3a8Q7nX5s5hTeYmOsy3DqH5nCxPLboXnCjzBXsMbNgPv7qk0dNkuPIWDPBYmbSBUMzmsSPixw34IM59vMXRiPipXoRkoDKWipKIKpKX6ptLep_Az4Co_LRmp7HTLRqKR3tg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://jifo3g.sn.files.1drv.com/y4mNJ2Tva6m2EDVfJ5NUNNQJ-tylZMRrd3Rc6xhZ5HaSjDY2EzTjJRCDUbSjfyTaBn2XqGTqDpVO0_cKW8_9oc3txZbIIZUJth-ATEsqj1iZ0bVXvm7AL5Mp2Fx6zIYVETS4CcE9HRQhAskL-iegynL0IZsXA9ppjjV4IoirK6QcLrsBHJTa6NAp_G1JHhRV6JgZK5MJdzYiqEPyARcdI7sUQ?raw=true","water level", "height=500px, width=500px");
}

function myFunction17() {
  window.open("https://jicldw.sn.files.1drv.com/y4mdkA624lFqH3iv28PpFw4SCOaixXeNZtPVIltASN4JwHGDbq6c04mTysEl9Qey8THoiEXWvKY58Zcuoyk9RpykArg6LUqNj9Rej9mEaOqod8-92DVTj4Wt1YR64L4U3tC6CNU1RMKdGO_nfevR7lakAqcFe61Y5_RWKa1cVhvPynsdFfxdMvA68pEJNCyn0YBivb6wbJEAgqCPneVSKYPjA?raw=true","wave height", "height=500px, width=500px");
  window.open("https://kzwqma.sn.files.1drv.com/y4mFEFnCeaJW_OqyqRetN9PB89p_mUOLD2-cn4qBut68wxkzvBzmBjCFc43k1KEzX_Y10owX_lTMA7h1jlBaS2wp9W0pzjCKJKeY2wuw6T4B4OnkEnC6C-kEtwL_e7JTLAv1FtvO8i294W51SlKfT68-PzjT_3Jt_TgAxrFQeJrtJ_7rXaJV0WOQe-3LF4jR08vVCPnIWCpzuUT7-lUgpop7A?raw=true","water level", "height=500px, width=500px");
}

function myFunction18() {
  window.open("https://wd4hvq.sn.files.1drv.com/y4mqdKpYSmvKNLouI30hF87ivpkbnLPV4xaJ17kQjW3icwebbN8mApZfvl0X4PtzVa-yAGMx1Klf-YyhOjtZ9C73Fnwi4Sm2mSvW1A_gnICPCkzfeq6WvizNZ85HZQSSOZmDN3K0nRNqNxV8W9gE2AtsOQPVBXphodF0oKN-1X3BU8As-YWk--YUT13bh2aJWGZ4N49Q9DyUf54GagtzahvtA?raw=true","wave height", "height=500px, width=500px");
  window.open("https://vckgmq.sn.files.1drv.com/y4mvgSa01CM1bzegdmUqGNR4MbHtOP-fjdu0KTgQu85fBmvxWVQKAsgnpYLTR6x5vNP9I0UnBWmEXCx9khTOAwLNt4gSIGDUK9dUzKCF1FzN-MJikfVYJ16FwVLDnJi2t3X8FjWHmK7EnrhMhlmZI82iDTBj3affKjS8D204mg1m2ndvGtYNFIa852qTOSMn_BdLdsz1Tj8AntsSpRcGANMVw?raw=true","water level", "height=500px, width=500px");
  window.open("https://wd7kja.sn.files.1drv.com/y4moVwV6zOtf7DRmamzkgoA4m88e06TGROw6Km2thCt7IczuRLVedmG0zm0HiQxzsn7ks1RKa1UnXV7bGvcbM-lF8YRmCe-TmEOORr1wZlw0NNory0hZWtTAqcmYDgVmy0oyU2GDQY1Z6OLmkwl75O-3d9Mq9RgBB-T2TEytD7RbnImXFVJDC2fLVxIm9Iz2SOit6MJRtDcSKLApnPCQQk3zQ?raw=true","Current", "height=500px, width=500px");
}

function myFunction19() {
  window.open("https://vcnqrw.sn.files.1drv.com/y4mu6qNL8skGu6dF0CcHXFn2n7RVMZBo-JXdDYuAm9bz6WsfALeZlDxULma-mMJ1ixdWN2fI6ijZGQVkn96KG2nMssdj8m94LkSi9CQ0p38ic9i6QayA1ACm05tDE6bDZ1-O6TWRsGfqmU_iPoPOWaeIbG7hnQWdXjuK5QaqiGTTTmqighRkNvCMxxSLiyuohYf6F_4-bGI4irRbVdf-Joerg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://kzykiw.sn.files.1drv.com/y4marTrBdbvSSfzz9trb9oC0fHpTJC_ILlcdjWENUiqUPhs8d9kCzPvv9TxkQYqqa0jpRa33wGKDCNskiwLR5Hr7IcHo6cLyYvQvV-phvHWdnHo-G9R5vCvIt4UQuwxYesF1MFk0SeWhOy2YVNqHQqwBXSdQuKFC07_qu2WhMw3CWVo48ISqlN1YdHV29TpgT4WZLBIBGhukmozhpD0T_66lQ?raw=true","water level", "height=500px, width=500px");
}

function myFunction20() {
  window.open("https://wd6uow.sn.files.1drv.com/y4mqM3zxEkI9VWjjmLJFSMoEz2j_Sifq9euOV_LI0kZOKJopmGpwQzliWa1H7YSv3FsRElrH13EDg6NanIqbanV639WmumX_bg6mfLe74O7jqIE_tu8UPOiqfRSfIVnlK7CCikYc_UrdAVhXTW93PaQTIoKuaA5tXcn2XiBVAuvORulrdgqEdhYb8eP0K_EVcIFsFnWqLJMqi-wmKqmqRuENg?raw=true","wave height", "height=500px, width=500px");
  window.open("https://vckujw.sn.files.1drv.com/y4ma0cuKtbD7XOhfWWso90LHg1AcA1sU93MtG6zox0Os905JwC_WQkwGMe4C_FwGlX7-ryC0rrxce6edjg2Ec4Q_mJbkkdOKBPphfS9yS1Wm1Px0yCpNuu-gZvD2meGzkaAL1EMjDrFpwDjv6Wndg21yWCPbefs9Zm6wwQ3eLuUM0BMs9q9LGJuagBwgTg-5sIIRzk8G2QKCIi7B7RXY4Qiig?raw=true","water level", "height=500px, width=500px");
}

function myFunction21() {
  window.open("https://vclyaw.sn.files.1drv.com/y4mG0Y-pfW3lsHyr58JqgXXL2nag8L3xaEqP90MoRQ1wNcpkq0S8BgluSSCuoATuzAK0MEFMkapn_olzRDGEbisdkt815udk0a2E_W04KSeGEafQcwKPkntJn_XIdgvuBYBZA30qDlGZ6sVekb7Wqds-Rvrk2iPxnQ6a-nH11vyHlpP2NORAklo_Mte9ee3D4JAhAOKDa-O7Wtsf-a7Dx-e-g?raw=true","wave height", "height=500px, width=500px");
  window.open("https://87impa.sn.files.1drv.com/y4mxakVaem7S5BdwYlCOVU0YR8fGnJYGJDCowlnR8mu7xYJX1bwqhHoC7IBvAetJZhSXhHgQ4BxVPLa89MSL5XzXYkIha3EpikeIfM1Y95yx6qPfKFP5IjPXu8KDwtnGerjjZjurgPXrPWWJK5-SPnwA0ZGmPkzBW7pmEF_yvNdRVz5N8CubeSi7Ze6J612G6JsvIDmqWpm328rg7VAYsCLzQ?raw=true","water level", "height=500px, width=500px");
}

function myFunction22() {
  window.open("https://kzyysq.sn.files.1drv.com/y4mpxGyP-A0IRrFG-GeOYKVhgxxH0XE6enWD_NZmiNa-5rVWnhO2sHslm984a0VYgCi2DCyLYx9kK4h36ZD2ufezcHAukHIpubUQXafA7HFhMznH0FtJ5Kid7vQK3pD3x4LJwSi7nQ4Rfxly7tYKAQ1FGBb8Z6AGSjmHFtrf7faYH1KVLlPPhLjI_s0Uu0wEtkBAyhdMWz27JDXVrpxYCWXjA?raw=true","wave height", "height=500px, width=500px");
  window.open("https://jif9ga.sn.files.1drv.com/y4mu-9ISBIi1ZRKfBmjv67fooy4-mq0PlrNN57Fd7WMUiMR01IrqqB40rj8-5gbNrXbJjsFH9j_qWTs6okqElkxpHnEWwS4ZUmbR93eC-48oEOuGT5zG0sGh2M5zFLJ0T1pQ4dJlvfRqeO-9GLBGMHHrZeLQU7LvD81tJutyNIjpgGynKEII1dGTWwsGqORzxhAHxxGj8YoKt2K807yMaDKrQ?raw=true","water level", "height=500px, width=500px");
}

function myFunction23() {
  window.open("https://87lbsa.sn.files.1drv.com/y4mgdLeOpZyDNkifqHpdH5s-zzQfV1luEQOiTJ3EiHnq4SPucp5hn6BuJ_tdif9MKb14w2olbSQU7kc8vt0aMel_wtKvon5IFzcPFitG-ZUtjDFAzlW6Xtbt8xI2hGhg-lfcJYwV9f6vXWEO6wxFDObS9tMnB119xpDxEhIrl5yPR7KGjJgZmK_2Pqv7nOslMGl3Il0aIoFjFQFCLMuNWlDig?raw=true","wave height", "height=500px, width=500px");
  window.open("https://wd5jsa.sn.files.1drv.com/y4mCUKL3j6rQ6RQnZdb3clWE8PaeRk5fm1owJuZvkPGsPB1uYmTnThvpms-wIwhlQA9gHAEwPvp5Du2KoHMU3AjclEB_H17FxF_qUSKpt3EH2AjG00TnDty0XUN9oOko27r-7x6s-NFlopu2c_2nAWeiXGzbaZnbuoYN48CcmP4SXSv8iPpvxuve2xv5ufc-SrWXlPG58rHSPiNGIm8FVhjzQ?raw=true","water level", "height=500px, width=500px");
}
</script>

</body>
</html>
