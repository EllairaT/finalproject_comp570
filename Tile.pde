/**
* https://clintbellanger.net/articles/isometric_math/ 
*
* @author Ellaira Torio | 18021275
*/

class Tile {
    PImage img;
    PVector mapPosition;    //local grid position i.e. [0,5]
    PVector screenPosition; //'true' position on the screen
    boolean isEdgeTile;
    static final int TILE_SIZE = 82;
    static final int TILE_SIZE_HALF = TILE_SIZE / 2;
    static final int TILE_SIZE_QUARTER = TILE_SIZE_HALF / 2;
    PVector tile;
    public Tile(boolean isEdge, int x, int y) {
        isEdgeTile = isEdge;
        mapPosition = new PVector(x, y);
        tile = mapToScreen(mapPosition);
        screenPosition = new PVector(0,0);
        img = isEdgeTile ? sm.getSpriteByName("concrete").getImage() : sm.getSpriteByName("grass").getImage();
    }
    
    
    public void drawTile() {
        textureMode(NORMAL); 
        if (isMouseOver()) {
            tint(0, 153, 204);
        }
        else{
            noTint();
        }
        beginShape(); 
        texture(img);
        vertex(tile.x, tile.y + TILE_SIZE_QUARTER, 0,0);             //left vertex
        vertex(tile.x + TILE_SIZE_HALF, tile.y, 1,0);                //top vertex
        vertex(tile.x + TILE_SIZE, tile.y + TILE_SIZE_QUARTER, 1,1);  //right vertex
        vertex(tile.x + TILE_SIZE_HALF,tile.y + TILE_SIZE_HALF,0,1); //bottom vertex
        endShape(CLOSE);
    } 
    
    
    
    public boolean isMouseOver() {
        PVector mousePos = new PVector(mouseX, mouseY);
        PVector result = screenToMap(mousePos);
        println("Mouse coords on screen: " + mousePos);
        println("Mouse coords in map: " + result);
        println("Actual Grid position: " + mapPosition);
        if (result.x == mapPosition.x &&  result.y == mapPosition.y) {
            return true;
        } 
        return false;
    }  
    
    public PVector mapToScreen(PVector map) {
        PVector result = new PVector(0,0);
        result.x = (map.x - map.y) * TILE_SIZE_HALF;
        result.y = (map.x + map.y) * TILE_SIZE_QUARTER;
        
        // need to account for the camera offset
        result.x += (width / 2);
        result.y += (height / 4);
        return result;
    }
    
    public PVector screenToMap(PVector screen) {
        PVector result = new PVector(0,0);
        result.x = (screen.x / TILE_SIZE + screen.y / TILE_SIZE_HALF) / 2;
        result.y = (screen.y / TILE_SIZE - (screen.x / TILE_SIZE_HALF)) / 2;
        return result;
    }
    
    public PVector screenToMap(int x, int y) {
        return new PVector(0,0);
    }
}
