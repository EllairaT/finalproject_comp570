
class Tile {
    boolean isOccupied;
    boolean isEdgeTile;
    float xPos, yPos;
    PImage img;
    
    public Tile(boolean isEdge, PVector p) {
        isEdgeTile = isEdge;
        if (sm != null) {
            img = isEdgeTile ? sm.getSpriteByName("concrete").getImage() : sm.getSpriteByName("grass").getImage();
            
            if (img != null) {
                xPos = p.x * img.width;
                yPos = p.y * img.height;
            }
        }
    }
    
    public void drawTile() {
        image(img, xPos, yPos);
    }
}
