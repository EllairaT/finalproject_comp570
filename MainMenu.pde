
/**
* Sketch for main menu screen.
*
* https://www.sojamo.de/libraries/controlP5/examples/use/ControlP5callback/ControlP5callback.pde
* @author Ellaira Torio | 18021275
*/


class MainMenu {
    PImage bgImg; 
    PImage logo; 
    String[] options = new String[]{"play", "tutorial", "exit"};
    
    public MainMenu() {
        try {
            bgImg = requestImage("Backgrounds/menu_bg.png");
            logo = requestImage("Logo_pixel.png");
        } catch(Exception e) {
            println("Error: " + e.toString());
        }
    }
    
    public void display() {
        renderBackground();
        renderLogo();
        renderTextButtons();
    }
    
    private void renderBackground() {
        imageMode(CORNER);
        if (!(bgImg.width <= 0)) {
            image(bgImg,0,0, width, height);   
        }
    }
    
    private void renderLogo() {
        if (!(logo.width <= 0)) {
            image(logo,0,0);
        }
    }
    
    private void renderTextButtons() {
        int spacing = 150;
        fill(255);
        textSize(50);
        text("Press enter to continue",(logo.width / 2) - 250, logo.height + spacing);
    }
}
