class Monster extends GameEntity {
    String name;
    float speed, damage;
    boolean isAlive;
    PImage cardImage;
    AnimatedSprite sprite;
    
    
    public Monster(String n) {
        name = n;
    }
    
    
    public void walk() {}
    public void attack() {}
    public void playSpawnSound() {}
}


class Demon extends Monster {
    public Demon() {
        super("Demon");
    }
}

class Golem extends Monster {
    public Golem() {
        super("Golem");
    }
}