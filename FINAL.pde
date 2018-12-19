void setup() {
  size(1280, 800);
  left= new Leftpaddle();
  right= new Rightpaddle();
  newball= new Ball();
  frameRate(30);
  playerleft = loadImage("player.png");
  playerright = loadImage("player.png");
  ball = loadImage("ball.png");
}


void draw() {
  pong ();
}
