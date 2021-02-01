# Assigment 2: Loops

## Description
This is an interactive artwork that I like to call RAIN IN THE DESERT (because it literally is drain falling on the desert). The user can move their mouse up to
slow down the speed of the rain drops, and even freeze them. Similarly, they can move their mouse to the bottom of the screen to acccelerate the rainfall. I got
this idea last week in the lab, when we were show the system variable mouseX and mouseY. I thought of a game called CELESTE in which one of the tasks is to slow
the falling of a feather. I thought I could do something similar, but instead of a feather, I wanted to do rain (mainly because I really miss rain and it actually
rained some weeks ago-the happiest day of January). Because of how repetitive rainfall is and the many droplets needed to create the illusion of rain, I decided
that this would be the perfect project to test my knowledge of loops (and I managed to sneak some object oriented programming in it).

## My experience in Steps  (Again, it was mostly me struggling)

1. The first thing I did was to create a canva and set the color of the background. By doing this, I could proceed with the drawing of the image of the dessert
which I then uploaded using an PImage variable. (I didn't actually show the image until after I was done with the rain)
2. Before starting this project, I watched Daniel Shiffman's tutorials on Object Oriented Programming and decided to incorporate that knowledge in this project
since it would be very difficult to redraw all the raindrops. I also decided to use arrays for this matter and saw a couple of videos on classes and arrays.
3. Afterwards, I created a class called rainDrop to create drops with a random x and y position, a falling speed and an end position of the drop. 
4. Then I created a function called fallPosition that would track the y position of the drop as it fell by adding the speed to the initialized y position.
5. To actually show the drops falling, I created a function called show() that showcases the position of the drop and represents the drop as a small white 
rectangle (it took me a while to figure out how to show the rain). In this function I also call fallPosition to update the y position of the drop.
6. I had to test if what I was doing made sense so I decided to make an array of rainDrop objects and in the draw function, for each one of them, I used the show.
7. It look horrible. After some seconds it looked nice, but the first chunk was just -- ewwww.  so I decided to take a break.
8. Once I convinced myself that it could look worse, I decided to move on. I thought it would be interesting to show that the drop actually fell and create ripples
for the drops. 
9. I created a ripple function and added two global variables to the object for the diameters of the ellipses I would use to make the ripples (initializing them to
0 at the begining). I would show the ellipse and then make it grow by adding the speed of the drop to the diameters.  
10. I called the ripple function in the draw function when the y position exceeded the end point of the fall. 
11. I then noticed that the ripples would keep on growing and growing and growing and growing and growing...
12. I took another break.
13. I decided to create a reset function that would reset the drops to other random x and y positions once the ripples achieved a certain size.
14. It worked! Was it the best solution? Probably not, but I decided to take another break.
15. I had to adjust somethings after this (mainly the fact that the ripples where just circles that looked abnormal since the rain is kind of falling in a 3D-ish 
manner).
16. I know had to do the dreaded mouse-speed control thing. To be honest I was very lost at the beginning, but I saw some more of Shiffman's videos and learned 
about map() and used it to track the y position of the mouse in relation to the height in order to decelerate or accelerate the speed of the rainfall. 
17. The problem was that I didn't know where to put that piece of code.
18. I tried in the draw function for some reason. Then I realizes that was stupid and putting it in the fallPosition would do nothing, so I decided to place it in
the show function.
19. Only problem was I didn't know where to put it within the function: before or after? I tried after and failed. Then did before and it worked. The problem now 
was that the ripples were still going, so I decided to also slow down the speed in the ripple function. 
20. It worked! Yay. 
21. Now, I had to fix the fact that the first batch of raindrops was falling by itself. Like this:
![alt text]()
I know, it looks disgusting.
22. I also didn't like the fact that the animation would'nt start if the mouse was not on the canva. (Professor said that it is what it is, so I gave up and left 
it at that). 
23. After breaking my head for some time, I watched another video by Shifmann in which he had the same problem and he enlarged the range of y values. I figured 
that because the rainfall after the first batch look fine, I would only have to enlarge the range of the rainDrop(), not the one of the reset. 
24. Now it was looking good.
25. I showed the image of the Dunes in the background and all was well (at least I think). 

I probably left out other struggles. If I did, I probably commented them in the code itself. It was quite a chaotic process for me. Every time I tried to fix 
something that required a variable, I had to declare it somewhere else and intiliaze it somewhere else from the function that I was orignally doing. If you see
my explanation in comparison to the order of the actual code, you will see that it is very different. Most of the things that I did were done on the go. For 
example, I thought of adding an end position to the drops because I saw that all of them were falling on the same line, and I wanted to add some depth to the 
animation. I made the drops rectangles because when I used a line, the drops looked very weird and stiff (maybe because the stroke was thicker?). The ellipses also 
looked very weird at the beginning, that took some time. I didn't even thought of using an if statement for calling the show and ripple function until I had to test
the ripple function. So yes, I was all over the place most of the time, but it was very entertaining.

## Loops
I probably abused of the If statements. I learned that they are the most convinient way to solve many issues of stuff not working or stoping when it should. 
The For loops I mainly used to repeat the same procedure for each drop in the array (from filling the element in to calling the functions). Something very funny 
that happened to me was that at the beginning I declared the size of the arrray to be 400 and later changed it to 600. The thing is that I wrote the size as a 
number and not as a variable, so when I changed it to 600, I didn't saw a change because it was still only filling 400 drops and showing only 400 drops, so I 
decided to do myself a favor and just write a variable for the size. I really appreciate loops right now because even with their help, it took me quite some time
to do this assigments, so I can imagine how horrible it would be if I had to re-write everything 600 times to make each drop. 

Long Live Loops!


## Final Result
