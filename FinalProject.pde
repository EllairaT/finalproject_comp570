import controlP5.*;


import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.model.options.*;
import uibooster.utils.*;

UiBooster ui;
Game game;
PFont font;

ControlP5 cp5;
/**
Setting up variables and libraries to be used globally.
cp5 in particular needs to be defined in setup.
*/
void setup() {
    size(1920, 1080, P2D);
    surface.setTitle("RESISTANCE");
    noStroke();  
    font = loadFont("Onyx-64.vlw");
    textFont(font);
    cp5 = new ControlP5(this);
    game = new Game();
}

void draw() {
    game.displayMainMenu();
}

