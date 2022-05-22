
class Tile {
    boolean isOccupied;
    boolean isEdgeTile;
    int xPos, yPos;
    PImage texture;
    
    public Tile(boolean isEdge, int x, int y) {
        isEdgeTile = isEdge;
        // texture =  isEdgeTile ? loadImage("Tiles/tile_tree.png") : loadImage("Tiles/tile_grass.png");
        texture = loadImage("Sprites/tiles.png");
        xPos = x * texture.width;
        yPos = y * texture.height;
    }
    
    public void drawTile() {
        image(texture, xPos, yPos);
    }
}
