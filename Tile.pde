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
        
    }
    
    
    public void drawTile() {
    } 
}
