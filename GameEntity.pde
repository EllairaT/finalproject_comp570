/**
* 
*
* @author Ellaira Torio | 18021275
*/
abstract class GameEntity{
    PVector position;
    boolean isVisible;
    boolean isAlive;
    int health;
    
    public void spawnAt(float x, float y) {}
    public void despawn() {}
    
    public void toggleVisible() {
        isVisible = !isVisible;
    }
    
    public void takeDamage(float damage) {
        health -= damage;
    }
    
    public void handleCollision(GameEntity g) {
    }
}