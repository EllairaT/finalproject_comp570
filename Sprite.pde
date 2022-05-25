class Sprite {
    SpriteType type;
    String name;
    boolean isAnimated;
    PImage spriteImg;
    JSONObject spriteData;
    
    public Sprite(SpriteType t, String n, boolean b, PImage img, JSONObject d) {
        type = t;
        name = n;
        isAnimated = b;
        spriteImg = img;
        spriteData = d;
    }
    
    public PImage getImage() {
        return spriteImg;
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