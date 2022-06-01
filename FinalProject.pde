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
    fullScreen(P2D);
    // size(500,500,P2D);
    surface.setResizable(true);
    surface.setTitle("RESISTANCE");
    font = loadFont("Fonts/Onyx-64.vlw");
    sm = new SpriteManager();
    sm.start();
    cp5 = new ControlP5(this);
    game = new Game();
    currentX = 0;
    currentY = 0;
    textFont(font);
    noStroke();  
    
    
}

void draw() {
    background(150);
    fill(0);
    game.drawWorld();
}

// multiple images will be present 
void preload() {
    
}

