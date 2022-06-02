
class Tile {
    int xPos, yPos, h, w;
    boolean  isSelected;
    GameEntity currentEntity;
    int xOffset, yOffset;
    
    public Tile(int x, int y, int ww, int hh, int xOff, int yOff) {
        rectMode(CENTER);
        xPos = x;
        yPos = y;
        w = ww;
        h = hh;
        xOffset = xOff;
        yOffset = yOff;
    }
    
    public void toggleState() {
        isSelected = isSelected;
    }
    
    public void display() {
        if (isMouseOver(mouseX - xOffset, mouseY - yOffset)) {
            fill(255,50);
        }
        else{
            noFill();
        }
        stroke(255, 50);
        rect(xPos, yPos, w, h);
    }
    
    public boolean isMouseOver(int x, int y) {
        boolean isOverX = (x >= xPos && x <= xPos + w);
        boolean isOverY = (y >= yPos && y <= yPos + h);
        
        if (isOverX && isOverY) {
            return true;
        } else{
            return false;
        }
    }
}
