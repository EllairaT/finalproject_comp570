/**
* Game class contains the game state and general methods and helper functions. 
*
* @author Ellaira Torio | 18021275
*/

class Game {
    MainMenu mainMenu;
    
    public Game() {
        mainMenu = new MainMenu();
    }
    
    public void displayMainMenu() {
        mainMenu.display();
    }
    
}