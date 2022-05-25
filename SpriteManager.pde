import java.util.Map;
import java.io.File;
import java.util.Iterator;

enum SpriteType{
    TOWER,
    MONSTER,
    TILES, 
    CARD,
}

class SpriteManager {
    ArrayList<Sprite> sprites;
    File folder = new File(dataPath("Sprites"));
    JSONObject data;
    
    public SpriteManager() {
        sprites = new ArrayList<Sprite>();
        data = loadJSONObject("game_info.json");
    }
    
    public void loadData() {
        // Get the array of items from the JSON object
        println(data.getJSONObject("Game"));
    }   
    
    private void loadJSON() {
        
    }
}
