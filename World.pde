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
    int rows = 15;
    int cols = 15;
    
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
        for (int x = 0; x < rows; x++) {
            for (int y = 0; y < cols; y++) {
                tiles[x][y].drawTile();
            }
        }
    }
}
