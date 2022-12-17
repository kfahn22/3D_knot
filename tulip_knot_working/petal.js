let x, y, z;

class Petal {
    constructor(_px, _py, _c) {
        this.px = _px;
        this.py = _py;
        this.col = _c;
        this.j = 0; // determines symmetry // 0
        this.k = 8;   // values other than 8 render very different knots
        this.l = .01; // 0.01
        this.m = .3; // .3
        this.p = 9; //9
        this.q = 8; //8 // disk like shape as q increases
        this.s1 = 4;
        this.h2 = 4;
        this.sc = 5; // determines scale
        // tulip shape 180, zinnia shape 120, 
        this.pi = 210; // 180 // angle mode is degrees
        this.points = [];
    }

    // https://github.com/anuraghazra/CanvasFun/blob/master/LoveHearts/Heart.js
    // Reference for this function
    // We need to loop through torus knot before creating object
    oneKnot() {
        for (let beta = 0; beta < 361; beta += 1) {
            let r = this.sc * (this.j + this.s1 * sin(this.k * beta));
            let phi = this.l * this.pi * (this.p * beta);
            let theta = this.m * this.pi * sin(this.q * beta);
            x = r * cos(1*theta) * (this.h2 + cos(1*phi)); // multiply scalar by theta petals wrap up 
            y = -r * sin(1*theta) * (this.h2 + cos(phi));
            z = r * sin(1*phi);
            if (this.points.length < 361) {
                this.points[beta] = createVector(x, y, z);
            } else {
                break;
            }
        }
    }

    stem(d,h) {
        translate(this.px, this.py+this.h2);
        ambientLight(0,255,0);
        ambientMaterial(0);
        cylinder(d,h);
    }
    show(angle, num) {
        rotateY(angle);
       // let num = 18;
        for (let k = 1; k < num; k += 1) {
            push();
            this.stem(4,200);
            translate(0, -2*this.h2*this.sc);
            // //fill(0,255,00);
            // cylinder(4, 75);
            let m = map(k, 1, num, 360, 20);
            rotateY(m);
            beginShape();
            for (let v of this.points) {
                noFill();
                let c = color(245, 100, 118, 50);
                stroke(c);
                vertex(v.x, v.y, v.z);
            }
            endShape();
            pop();
        }

    }
}