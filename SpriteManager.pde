import java.util.Map;
import java.io.File;

enum SpriteType{
    STRUCTURE,
    MONSTER,
    TILE
}

class SpriteManager {
    HashMap<String, JSONObject> spriteData;
    ArrayList<Sprite> sprites;
    String path = "./Sprites/";
    
    public SpriteManager() {
        
    }
    
    private void loadFiles() {
        
    }
    
    public void prepareSprites() {
        
    }
    
    public void showAllSprites() {}
    
    
    public void getSprite(String name) {}
    
}