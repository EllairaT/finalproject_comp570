/**
* 
* Isometric world generation
* There are two important things to note:
* converting local isometric grid coords to global screen-space coordinates
* converting global screen-space coordinates to local isometric grid coords
* as local X increases, global X and Y increase.
* as local Y increases, global Y increases but X decreases. This is how we get the slanted look


* @author Ellaira Torio | 18021275
*/

class World {
    
    Tile[][] tiles;
    int rows = 50;
    int cols = 50;
    int isoW = 151;
    int isoH = 63;
    int isoX = width / 2;
    int isoY = (height - isoH * 63) / 2;
    
    
    public World() {
        tiles = new Tile[rows][cols];
        initializeTiles();
    } 
    
    public void createWorld() {
        println(sm.getSpriteByName("tree"));
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
                PVector v = new PVector(x, y);
                Tile t = new Tile(isEdgeTile(x,y), cartesianToIso(v));
                tiles[x][y] = t;
            }
        }
    }
    
    public void drawTiles() {
        for (Tile[] i : tiles) {
            for (Tile t : i) {
                t.drawTile();
            }
        }
    }
    
    public PVector cartesianToIso(PVector p) {
        // Cartesian to isometric:
        PVector newVector = new PVector(0,0);
        newVector.x = p.x - p.y;
        newVector.y = (p.x + p.y) / 2;
        return newVector;
    }
    
    // public PVector IsoToCartesian(PVector p) {  
    //     // TODO: convert to java
    //     // var tempPt : Point = new Point(0, 0);
    //     // tempPt.x = (2 * pt.y + pt.x) / 2;
    //     // tempPt.y = (2 * pt.y - pt.x) / 2;
    //     // return(tempPt);
// }
    
}
