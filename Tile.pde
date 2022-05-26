
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
