import controlP5.*;


import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.model.options.*;
import uibooster.utils.*;

static SpriteManager sm;
static int currentX;
static int currentY;
UiBooster ui;
Game game;
PFont font;
ControlP5 cp5;


/**
Setting up variables and libraries to be used globally.
*/
void setup() {
    size(1920, 1080, P2D);
    surface.setTitle("RESISTANCE");
    // font = loadFont("Onyx-64.vlw");
    sm = new SpriteManager();
    sm.start();
    cp5 = new ControlP5(this);
    game = new Game();
    currentX = 0;
    currentY = 0;
    // textFont(font);
    noStroke();  
}


void draw() {
    background(150);
    fill(0);
    trackMousePosition();
    game.drawWorld();
}

void trackMousePosition() {
    text("mouse:  " + mouseX + ", " + mouseY, 5, 15);
    // text("grid pos:    " + currentX + ", " + currentY, 5, 45);
}
// multiple images will be present 
void preload() {
    
}
