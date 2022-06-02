/**
*
* @author Ellaira Torio | 18021275
*/
class GameStateManager {
    GameState currentState;
    SpriteManager sm;
    MainMenu menu;
    Game game;
    
    public GameStateManager(PApplet p) { //need this to be able to register events.     
        currentState = GameState.ENTERED; 
        sm = new SpriteManager();
        menu = new MainMenu();
        game = new Game();
    }
    
    public GameState getCurrentState() {
        return currentState;
    }
    
    public void updateDisplay() {
        switch(currentState) {
            case ENTERED :
                menu.display();
                break;	
            case RUNNING :
                game.display();
                break;
            case QUITTING :
                break;
        }
    }
    
    public void setState(GameState state) {
        currentState = state;
        println("Gamestate now set to " + state);
    }
}
