class Sprite {
    SpriteType type;
    String name;
    float x,y,w,h;
    boolean isAnimated;
    PImage spriteSheet;
    JSONObject spriteData;
    
    public Sprite(SpriteType t, String n, boolean b, PImage sh, JSONObject d) {
        type = t;
        name = n;
        isAnimated = b;
        spriteSheet = sh;
        spriteData = d;
    }
    
    public void showSprite() {}
}

class AnimatedSprite extends Sprite{
    ArrayList<PImage> idleAnim;
    ArrayList<PImage> walkingAnim;
    ArrayList<PImage> attackingAnim;
    int length, index;
    float speed;
    
    public AnimatedSprite(SpriteType t, String n, boolean b, PImage sh, JSONObject d) {
        super(t,n,b,sh,d);
    }
    
    private void findFrames(ArrayList<PImage> animation) {}
    public void animateIdle() {}
    public void animateWalk() {}
    public void animateAttack() {}
}