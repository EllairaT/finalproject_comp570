/**
* 
* @author Ellaira Torio | 18021275
*/
import java.util.Map;
import java.io.File;
import java.util.Iterator;
import java.util.Set;


enum SpriteType{
    TOWER,
    MONSTER,
    CARD,
}

class Meta{    
    PImage img;
    JSONObject data;
    JSONArray objects;
    SpriteType type;
    
    public Meta(String i, String o, JSONArray arr, String t) {
        try{
            img = loadImage(i); // this is where the images and such actually get loaded in 
            data = loadJSONObject(o);
            objects = arr;
            type = SpriteType.valueOf(t);
        }
        catch(Exception e) {
            println("Error loading files: " +  e);
        }
    }   
    
    // for debugging purposes
    public String toString() {
        return img.toString() + "; " + type.toString() + "; " + data.hashCode() + "; " + objects.toString();
    }
}

class SpriteManager {
    JSONObject data;
    ArrayList<Sprite> sprites;
    HashMap<String, Meta> spriteSheetData;
    File folder = new File(dataPath("Sprites"));
    
    public SpriteManager() {
        sprites = new ArrayList<Sprite>();
        spriteSheetData = new HashMap<String,Meta>();
        data = loadJSONObject("game_info.json");
    }
    
    // it is far better to load each spritesheet once and then get the actual image data
    // based on its coordinates, which is defined in its corresponding json object
    // instead of loading the image file every time a sprite is needed
    public void loadData() {
        Set<String> arr = data.keys();
        try{
            for (String o : arr) {
                String key = "";
                if (data.get(o) instanceof JSONObject) {
                    key = o;
                    JSONObject m = data.getJSONObject(o).getJSONObject("meta");
                    JSONArray a = data.getJSONObject(o).getJSONArray("objects");
                    Meta meta = new Meta(m.getString("imgSource"), m.getString("dataSource"), a, key);
                    spriteSheetData.put(key, meta);
                }
                else{
                    JSONArray array = data.getJSONArray(o);
                    key = "MONSTER";
                    for (int i = 0; i < array.size(); i++) {
                        JSONObject m = array.getJSONObject(i);
                        String name = key + "_" + m.getString("name");
                        Meta meta = new Meta(m.getString("imgSource"), m.getString("dataSource"), null, key);
                        spriteSheetData.put(name, meta); 
                    }
                }
            }
        }
        catch(Exception e) {
            println("Error while loading: " + e.getMessage());
        }
    }
    
    public void createSprites() {
        for (Map.Entry < String, Meta > entry : spriteSheetData.entrySet()) {
            String key = entry.getKey();
            Meta value = entry.getValue();
            
            println("Creating " + key + " sprites");
            // those with the objects array have multiple sprites in one image file 
            // so these would be tiles, tower, card
            if (value.objects != null) {            
                for (int i = 0; i < value.objects.size(); i++) {
                    JSONObject obj = value.objects.getJSONObject(i);
                    JSONObject spriteData = getSpriteData(value.data, obj.getString("filename"));
                    String name = obj.getString("name");
                    boolean isAnimated = obj.getBoolean("isAnimated");
                    
                    if (spriteData != null) {
                        JSONObject position = spriteData.getJSONObject("frame");
                        int x = position.getInt("x");
                        int y = position.getInt("y");
                        int w = position.getInt("w");
                        int h = position.getInt("h");
                        PImage spriteImg = getSpriteByPosition(value.img,x,y,w,h);
                        Sprite sprite = new Sprite(value.type, name, isAnimated, spriteImg, spriteData);
                        sprites.add(sprite);
                    }
                }
            }
            else{
                // createAnimatedSprite();
            }
        }
        println("finished");
    }
    
    // private void createAnimatedSprite(){}
    
    private PImage getSpriteByPosition(PImage img, int x, int y, int w, int h) {
        return img.get(x,y,w,h);
    }
    
    private JSONObject getSpriteData(JSONObject d, String key) {
        JSONArray frames = d.getJSONArray("frames");
        for (int i = 0; i < frames.size(); i++) {
            JSONObject frame = frames.getJSONObject(i);
            if (key.equals(frame.getString("filename"))) {
                return frame;
            }
        }
        return null;
    }
    
    public  ArrayList<Sprite> getSpritesByType(SpriteType type) {
        ArrayList<Sprite> newList = new ArrayList<Sprite>();
        for (Sprite o : sprites) {
            if (type == o.type) {
                newList.add(o);
            }
        }
        
        return newList;
    }
    
    public Sprite getSpriteByName(String name) {
        for (Sprite o : sprites) {
            if (name.equals(o.name)) {
                return o;
            }
        }
        return null;
    }
    
    public void start() {
        println("loading and creating sprites...");
        loadData();
        createSprites();
    }
}
