// Code based on 3D Knot coding challenge
// Coding Train / Daniel Shiffman
// https://thecodingtrain.com/challenges/87-3d-knots
// https://youtu.be/r6YMKr1X0VA
// Javascript transcription: Chuck England

// Code from challenge: https://editor.p5js.org/codingtrain/sketches/fa1rAWng9

// Equation for Torus knots from
// https://home.adelphi.edu/~stemkoski/knotgallery/

let angle = 0;
let x, y;
let tulips = [];
let colorOptions1 = ['#9ad5ca', '#acdde7', '#3adb9e3', '#a379c9'];

function setup() {
    createCanvas(600, 600, WEBGL);
    angleMode(DEGREES);

    for (i = 0; i < 2; i++) {
        x = 100*i;
        y = 100*i;
        let c = colorOptions1[i % 4];
        tulips.push(new Tulip(x, y, c));
    }
}

function draw() {
    background('#e1faf9');
    translate(0, -height/6, 0);
    rotateY(angle);
    //rotateY(360 / i);
    //angle += 0.01;

    noFill();
    strokeWeight(1);
    push();
    for (i = 0; i < tulips.length; i++) {
        translate(i*100, 0);
        tulips[i].oneKnot();
        tulips[i].show(angle, 18);  
    }
    pop();
   angle += 0.03;
}