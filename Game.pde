/**
* Game class contains the game state and general methods and helper functions. 
*
* @author Ellaira Torio | 18021275
*/

class Game {
    MainMenu mainMenu;
    
    World world;
    
    public Game() {
        mainMenu = new MainMenu();
        world = new World();
        
        world.createWorld();
    }
    
    public void displayMainMenu() {
        mainMenu.display();
    }
}