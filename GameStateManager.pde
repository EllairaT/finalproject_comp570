/**
* This GSM uses a stack for game states
*
* @author Ellaira Torio | 18021275
*/

import java.util.Stack;
enum GameState{
    ENTERED, RUNNING, PAUSED, QUITTING
}

class GameStateManager {
    Stack<String> s = new Stack<String>();
    
    public GameStateManager() {
        
    }
    
}
