/* autogenerated by Processing revision 1282 on 2022-05-27 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import controlP5.*;
import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.model.options.*;
import uibooster.utils.*;
import java.util.Stack;
import java.util.Map;
import java.util.Map;
import java.io.File;
import java.util.Iterator;
import java.util.Set;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class FinalProject extends PApplet {











static SpriteManager sm;
UiBooster ui;
Game game;
PFont font;
ControlP5 cp5;


/**
Setting up variables and libraries to be used globally.
*/
 public void setup() {
    /* size commented out by preprocessor */;
    surface.setTitle("RESISTANCE");
    // font = loadFont("Onyx-64.vlw");
    sm = new SpriteManager();
    sm.start();
    cp5 = new ControlP5(this);
    game = new Game();
    // textFont(font);
    noStroke();  
}


 public void draw() {
    background(150);
    watchPositions(mouseX, mouseY);
    fill(0);
    game.drawWorld();
}

 public void watchPositions(int x, int y) {
    text("mouse:  " + mouseX + ", " + mouseY, 5, 15);
    text("grid pos:    " + x + ", " + y, 5, 45);
}
// multiple images will be present 
 public void preload() {
    
}
/**
* Game class contains the game state and general methods and helper functions. 
*
* @author Ellaira Torio | 18021275
*/

class Game {
    
    
    World world;
    
    public Game() {
        
        world = new World();
        
    }
    
    
    
    public void displayMainMenu() {
        // mainMenu.display();       
        
    }
    
    public void drawWorld() {
        world.showWorld();
    }
    
    
}
/**
* 
*
* @author Ellaira Torio | 18021275
*/
abstract class GameEntity{
    PVector position;
    boolean isVisible;
    boolean isAlive;
    int health;
    
    public void spawnAt(float x, float y) {}
    public void despawn() {}
    
    public void toggleVisible() {
        isVisible = !isVisible;
    }
    
    public void takeDamage(float damage) {
        health -= damage;
    }
    
    public void handleCollision(GameEntity g) {
    }
}
/**
* This GSM uses a stack for game states
*
* @author Ellaira Torio | 18021275
*/


enum GameState{
    ENTERED, RUNNING, PAUSED, QUITTING
}

class GameStateManager {
    Stack<String> s = new Stack<String>();
    
    public GameStateManager() {
        
    }
    
}

/**
* Sketch for main menu screen.
*
* https://www.sojamo.de/libraries/controlP5/examples/use/ControlP5callback/ControlP5callback.pde
* @author Ellaira Torio | 18021275
*/



class MainMenu {
    PImage bgImg; 
    PImage logo; 
    String[] options = new String[]{"play", "tutorial", "exit"};
    
    public MainMenu() {
        // try {
        //     bgImg = requestImage("menu_bg.png");
        //     logo = requestImage("Logo_pixel.png");
        
        
    // } catch(Exception e) {
        //     ui.showException("Something went wrong", "Error", e);
    // }
    }
    
    public void display() {
        renderTextButtons();
        renderBackground();
        renderLogo();
    }
    
    private void renderBackground() {
        if (bgImg.width <= 0) {
            background(0);
        }
        else{
            for (int i = 0; i < 500; i++) {
                float x = random(width);
                float y = random(height);
                int c = bgImg.get(PApplet.parseInt(x),PApplet.parseInt(y));
                fill(c);
                noStroke();
                rect(x,y, 10,10);
            }
        }  
    }
    
    private void renderLogo() {
        if (!(logo.width <= 0)) {
            image(logo,0,0);
        }
    }
    
    private void renderTextButtons() {
        int spacing = 120;
        fill(255);
        textAlign(CENTER);
        // text("PLAY", logo.width / 2, logo.height + spacing);
        // text("TUTORIAL", logo.width / 2, logo.height + (spacing * 2));
        // text("EXIT", logo.width / 2, logo.height + (spacing * 3));
        
        
        for (int i = 0; i < options.length; i++) {
            cp5.addTextlabel(options[i] + "_btn")
               .setText(options[i])
               .setPosition(logo.width / 2, logo.height + (spacing * i))
               .setColorValue(255)
               .setFont(font);
        }
    }
    // public void play(float value) {
    //     println(value);
// }
    
    public void clickHandler() {
        println("lmao nice");
    }
    // public void exit(float value) {
    //  println(value);
// }
}
class Monster extends GameEntity {
    String name;
    float speed, damage;
    boolean isAlive;
    PImage cardImage;
    AnimatedSprite sprite;
    
    
    public Monster() {
        
    }
    
    
    public void walk() {}
    public void attack() {}
    public void idle() {}
    public void playSpawnSound() {}
}


class Demon extends Monster {
    public Demon() {
        // play sound file in spawn
        super();
    }
}

class Golem extends Monster {
    public Golem() {
        super();
    }
}

class Sprite {
    SpriteType type;
    String name;
    boolean isAnimated;
    PImage spriteImg;
    JSONObject spriteData;
    
    public Sprite(SpriteType t, String n, boolean b, PImage img, JSONObject d) {
        type = t;
        name = n;
        isAnimated = b;
        spriteImg = img;
        spriteData = d;
    }
    
    public PImage getImage() {
        return spriteImg;
    }
    public void showSprite() {}
    
}

class AnimatedSprite extends Sprite{
    ArrayList<PImage> idleAnim;
    ArrayList<PImage> walkingAnim;
    ArrayList<PImage> attackingAnim;
    int length, index;
    float speed;
    
    public AnimatedSprite(SpriteType t, String n, boolean b, PImage sh, JSONObject d) {
        super(t,n,b,sh,d);
    }
    
    private void findFrames(ArrayList<PImage> animation) {}
    public void animateIdle() {}
    public void animateWalk() {}
    public void animateAttack() {}
}
/**
* 
* @author Ellaira Torio | 18021275
*/






enum SpriteType{
    TOWER,
    MONSTER,
    TILES, 
    CARD,
}

class Meta{    
    PImage img;
    JSONObject data;
    JSONArray objects;
    SpriteType type;
    public Meta(String i, String o, JSONArray arr, String t) {
        try{
            img = loadImage(i);
            data = loadJSONObject(o);
            objects = arr;
            type = SpriteType.valueOf(t);
        }
        catch(Exception e) {
            println("Error loading files: " +  e);
        }
    }   
    
    // for debugging purposes
    public String toString() {
        return img.toString() + "; " + type.toString() + "; " + data.hashCode() + "; " + objects.toString();
    }
    
}

class SpriteManager {
    JSONObject data;
    ArrayList<Sprite> sprites;
    HashMap<String, Meta> spriteSheetData;
    File folder = new File(dataPath("Sprites"));
    
    public SpriteManager() {
        sprites = new ArrayList<Sprite>();
        spriteSheetData = new HashMap<String,Meta>();
        data = loadJSONObject("game_info.json");
    }
    
    // it is far better to load each spritesheet once and then get the actual image data
    // based on its coordinates, which is defined in its corresponding json object
    // instead of loading the image file every time a sprite is needed
    public void loadData() {
        Set<String> arr = data.keys();
        try{
            for (String o : arr) {
                String key = "";
                if (data.get(o) instanceof JSONObject) {
                    key = o;
                    JSONObject m = data.getJSONObject(o).getJSONObject("meta");
                    JSONArray a = data.getJSONObject(o).getJSONArray("objects");
                    Meta meta = new Meta(m.getString("imgSource"), m.getString("dataSource"), a, key);
                    spriteSheetData.put(key, meta);
                }
                else{
                    JSONArray array = data.getJSONArray(o);
                    key = "MONSTER";
                    for (int i = 0; i < array.size(); i++) {
                        JSONObject m = array.getJSONObject(i);
                        String name = key + "_" + m.getString("name");
                        Meta meta = new Meta(m.getString("imgSource"), m.getString("dataSource"), null, key);
                        spriteSheetData.put(name, meta); 
                    }
                }
            }
        }
        catch(Exception e) {
            println("Error while loading: " + e.getMessage());
        }
    }
    
    public void createSprites() {
        for (Map.Entry < String, Meta > entry : spriteSheetData.entrySet()) {
            String key = entry.getKey();
            Meta value = entry.getValue();
            
            println("Creating " + key + " sprites");
            // those with the objects array have multiple sprites in one image file 
            // so these would be tiles, tower, card
            if (value.objects != null) {            
                for (int i = 0; i < value.objects.size(); i++) {
                    JSONObject obj = value.objects.getJSONObject(i);
                    JSONObject spriteData = getSpriteData(value.data, obj.getString("filename"));
                    String name = obj.getString("name");
                    boolean isAnimated = obj.getBoolean("isAnimated");
                    
                    if (spriteData != null) {
                        JSONObject position = spriteData.getJSONObject("frame");
                        int x = position.getInt("x");
                        int y = position.getInt("y");
                        int w = position.getInt("w");
                        int h = position.getInt("h");
                        PImage spriteImg = getSpriteByPosition(value.img,x,y,w,h);
                        Sprite sprite = new Sprite(value.type, name, isAnimated, spriteImg, spriteData);
                        sprites.add(sprite);
                    }
                }
            }
            else{
                // createAnimatedSprite();
            }
        }
        println("finished");
    }
    
    // private void createAnimatedSprite(){}
    
    private PImage getSpriteByPosition(PImage img, int x, int y, int w, int h) {
        return img.get(x,y,w,h);
    }
    
    private JSONObject getSpriteData(JSONObject d, String key) {
        JSONArray frames = d.getJSONArray("frames");
        for (int i = 0; i < frames.size(); i++) {
            JSONObject frame = frames.getJSONObject(i);
            if (key.equals(frame.getString("filename"))) {
                return frame;
            }
        }
        return null;
    }
    
    public  ArrayList<Sprite> getSpritesByType(SpriteType type) {
        ArrayList<Sprite> newList = new ArrayList<Sprite>();
        for (Sprite o : sprites) {
            if (type == o.type) {
                newList.add(o);
            }
        }
        
        return newList;
    }
    
    public  Sprite getSpriteByName(String name) {
        for (Sprite o : sprites) {
            if (name.equals(o.name)) {
                return o;
            }
        }
        return null;
    }
    
    public void start() {
        println("loading and creating sprites...");
        loadData();
        createSprites();
    }
    // private createSprite(SpriteType type, String name) {
    //  switch(type) {
    //  case MONSTER : 
    //  break;    
    //  default : 
    //  break;
    
    //     }
// }
}

class Tile {
    boolean isOccupied;
    boolean isEdgeTile;
    int xPos, yPos;
    PImage img;
    int isoTileW = 45; 
    int isoTileH = isoTileW / 2;
    int isoPosX = width / 2;
    int isoPosY = (height - isoTileH  * isoTileH) / 2;
    
    public Tile(boolean isEdge, int x, int y) {
        isEdgeTile = isEdge;
        img = isEdgeTile ? sm.getSpriteByName("concrete").getImage() : sm.getSpriteByName("grass").getImage();
        xPos = x;
        yPos = y;
    }
    
    public void drawTile(int x, int y) {
        int mx = isoToCartesianX(mouseX, mouseY) ;
        int my = isoToCartesianY(mouseX, mouseY) ;
        if (mx == x && my == y ) {
             watchPositions(mx, my);
        }
        textureMode(NORMAL); 
        beginShape(); 
        texture(img);
        vertex(cartesianToIsoX(x, y), cartesianToIsoY(x, y), 0, 0); //left 
        vertex(cartesianToIsoX(x, y - 1), cartesianToIsoY(x, y - 1), 1, 0); //top 
        vertex(cartesianToIsoX(x - 1, y - 1), cartesianToIsoY(x - 1, y - 1), 1, 1); //right
        vertex(cartesianToIsoX(x - 1, y), cartesianToIsoY(x - 1, y), 0, 1); //bottom
        endShape(CLOSE);
    } 
    
    public int cartesianToIsoX(int x, int y) {
        	return isoPosX  + (x - y) * isoTileW;
    }
    public int cartesianToIsoY(int x, int y) {
        	return (isoPosY+ (x + y) * isoTileH);
    }

    public int isoToCartesianX(int x, int y) {
		return ((x- isoPosX ) / isoTileW + (y -  isoPosY) /  isoTileH) / 2;
    }
    
    public int isoToCartesianY(int x, int y) {
		return ((y - isoPosY) /  isoTileH - (x - isoPosX ) / isoTileW) / 2;
    }
}
class Tower extends GameEntity{
    
}
/**
* 
* Isometric world generation
* There are two important things to note:
* converting local isometric grid coords to global screen-space coordinates
* converting global screen-space coordinates to local isometric grid coords
* as local X increases, global X and Y increase.
* as local Y increases, global Y increases but X decreases. This is how we get the slanted look

https://wintermutedigital.com/post/isometric-art-games/
https://gamedevelopment.tutsplus.com/tutorials/creating-isometric-worlds-a-primer-for-game-developers--gamedev-6511

* @author Ellaira Torio | 18021275
*/

class World {
    Tile[][] tiles;
    int rows = 20;
    int cols = 20;
    
    
    public World() {
        tiles = new Tile[rows][cols];
        initializeTiles();
    } 
    
    public void showWorld() {
        drawTiles();
    }
    
    private boolean isEdgeTile(int x, int y) {
        int xMin = max(0, x - 1);
        int xMax = min(rows - 1, x + 1);
        int yMin = max(0, y - 1);
        int yMax = min(rows - 1, y + 1);
        
        if (x == xMin || x == xMax || y == yMin || y == yMax) {
            return true;
        } 
        return false;
    }
    
    public void initializeTiles() {
        for (int x = 0; x < rows; x++) {
            for (int y = 0; y < cols; y++) {
                PVector v = new PVector(x,y);
                Tile t = new Tile(isEdgeTile(x,y), x, y);
                tiles[x][y] = t;
            }
        }
    }
    
    public void drawTiles() {
        translate(0, -100);
        for (int x = 0; x < rows; x++) {
            for (int y = 0; y < cols; y++) {
                tiles[x][y].drawTile(x,y);
            }
        }
    }
}


  public void settings() { size(1920, 1080, P2D); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FinalProject" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
