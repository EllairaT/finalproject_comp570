/**
* Game class contains the game state and general methods and helper functions. 
*
* @author Ellaira Torio | 18021275
*/

class Game {
    MainMenu mainMenu;
    SpriteManager spriteManager;
    public Game() {
        mainMenu = new MainMenu();
        spriteManager = new SpriteManager();
        printSprites();
    }
    
    public void displayMainMenu() {
        mainMenu.display();
    }
    
    public void printSprites() {
        spriteManager.loadData();
    }
    
}