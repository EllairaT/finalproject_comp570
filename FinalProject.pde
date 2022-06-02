
/**
* 
*
* @author Ellaira Torio | 18021275
*/
import controlP5.*;
import java.util.Map;


PFont font;
Game game;
ControlP5 cp5;
Controller fps;
boolean isDevMode;
static GameStateManager gsm;
Textlabel gameInfo;

public enum GameState{
    ENTERED, RUNNING, PAUSED, QUITTING
} 

void setup() {
    fullScreen(P2D);
    surface.setTitle("RESISTANCE");
    isDevMode = false;
    cp5 = new ControlP5(this);
    gsm = new GameStateManager(this);
    fps =  cp5.addFrameRate().setInterval(5).setPosition(0,height - 10);
    setDevControls();
    noStroke();  
}

void draw() {
    background(150);
    gsm.updateDisplay();
}

void keyPressed() {
    // I see you, Mac users.
    if (key == ENTER || key == RETURN) {
        gsm.setState(GameState.RUNNING);
    }
}

// helper function to switch between states quickly 
void setDevControls() {
    cp5.mapKeyFor(new ControlKey() { public void keyEvent() { gsm.setState(GameState.ENTERED); } } , '1');
    cp5.mapKeyFor(new ControlKey() { public void keyEvent() { gsm.setState(GameState.RUNNING); } } , '2');
}