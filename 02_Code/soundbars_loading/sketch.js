let phase = 0;
let zoff = 0;
let radiusMax;
let alpha;
let col_magenta;
let col_cyan;

function setup() {
    createCanvas(windowHeight, windowHeight);
    resizeCanvas(windowWidth, windowHeight);
    radiusMax = 0;
    alpha = 10;
    colorMode(RGB);
    col_magenta = color(255, 0, 221,250);
    col_cyan = color(0, 255, 255,180);
}

function draw() {
    //background(0);
    translate(width / 2, height / 2);
    stroke(255);
    strokeWeight(10);
    noFill();
    beginShape();
    radiusMax = radiusMax + 13;
    alpha = alpha + 2;
    let noiseMax = map(mouseX, 0, width, 1.5, 1.5);
    for (let a = 0; a < TWO_PI; a += radians(1)) {
        let xoff = map(cos(a + phase), -1, 1, 0, noiseMax);
        let yoff = map(sin(a + phase), -1, 1, 0, noiseMax);
        let r = map(noise(xoff, yoff, zoff), 0, 1, 0, radiusMax);
        let x = r * cos(a);
        let y = r * sin(a);
        vertex(x, y);
        let ampColor= map(alpha,50,350,0,1);
        let colLerped = lerpColor(col_cyan, col_magenta, ampColor);
        stroke(colLerped);
        strokeWeight(0.2);
    }
    endShape(CLOSE);
    phase += 0.003;
    zoff += 0.005;
}

function windowResized() {
    //resizeCanvas(windowWidth, windowHeight);
}
