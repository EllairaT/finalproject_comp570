


import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.model.options.*;
import uibooster.utils.*;

UiBooster ui;
Game game;
PFont font;

void setup() {
    size(1920, 1080, P2D);
    surface.setTitle("RESISTANCE");
    noStroke();  
    font = loadFont("Onyx-64.vlw");
    textFont(font);
    game = new Game();
}

void draw() {
    game.displayMainMenu();
}

