class Monster extends GameEntity {
    String name;
    float speed, damage;
    boolean isAlive;
    PImage cardImage;
    AnimatedSprite sprite;
    
    
    public Monster() {
        
    }
    
    
    public void walk() {}
    public void attack() {}
    public void idle() {}
    public void playSpawnSound() {}
}


class Demon extends Monster {
    public Demon() {
        // play sound file in spawn
        super();
    }
}

class Golem extends Monster {
    public Golem() {
        super();
    }
}