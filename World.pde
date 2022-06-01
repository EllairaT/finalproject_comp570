/**

* @author Ellaira Torio | 18021275
*/  

class World {
    int dim = 100; // dimensions of the tiles in the grid.
    int gridHeight, gridWidth;
    PImage bg,mapImg;
    Tile[][] grid;
    int xOffset, yOffset;
    static PVector currentPosition // record currentPosition of mouseOver
    public World() {
        try {
            bg = requestImage("Backgrounds/gamebg.png");
            mapImg = requestImage("Backgrounds/map.png");
            initGrid();
        } catch(Exception e) {
            ui.showException("Something went wrong", "Error", e);
        }
    } 
    
    public void showWorld() {
        drawBackground();
        drawGrid();
    }
    
    private void drawBackground() {
        if (!(bg.width <= 0)) { // width 0 or less means image is not loaded yet (or error happens). 
            imageMode(CORNER);
            image(bg,0,0, width, height);
            imageMode(CENTER);
            image(mapImg, width / 2, height / 2, mapImg.width, height);
        }
    }
    
    private void initGrid() {
        gridHeight = floor(mapImg.height / dim);
        gridWidth = floor(mapImg.width / dim);
        grid = new Tile[gridWidth][gridHeight];
    }
    
    public void drawGrid() {
        if (grid.length == 0) {
            initGrid();
        }
        xOffset = (mapImg.width / 2) + dim - 15;
        yOffset = dim;
        translate(xOffset, yOffset);
        for (int i = 0; i < gridWidth; ++i) {
            for (int j = 0; j < gridHeight; ++j) {
                Tile tile =  new Tile(i * dim, j * dim , dim, dim, xOffset, yOffset);
                grid[i][j] = tile;               
                tile.display();
            }
        }   
    }
}
