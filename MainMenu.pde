
/**
* Sketch for main menu screen.
*
* https://www.sojamo.de/libraries/controlP5/examples/use/ControlP5callback/ControlP5callback.pde
* @author Ellaira Torio | 18021275
*/

import java.util.Map;

class MainMenu {
    PImage bgImg; 
    PImage logo; 
    String[] options = new String[]{"play", "tutorial", "exit"};
    
    public MainMenu() {
        try {
            bgImg = requestImage("menu_bg.png");
            logo = requestImage("Logo_pixel.png");
            renderTextButtons();
            
        } catch(Exception e) {
            ui.showException("Something went wrong", "Error", e);
        }
    }
    
    public void display() {
        renderBackground();
        renderLogo();
    }
    
    private void renderBackground() {
        if (bgImg.width <= 0) {
            background(0);
        }
        else{
            for (int i = 0; i < 500; i++) {
                float x = random(width);
                float y = random(height);
                color c = bgImg.get(int(x),int(y));
                fill(c);
                noStroke();
                rect(x,y, 10,10);
            }
        }  
    }
    
    private void renderLogo() {
        if (!(logo.width <= 0)) {
            image(logo,0,0);
        }
    }
    
    private void renderTextButtons() {
        int spacing = 120;
        fill(255);
        textAlign(CENTER);
        // text("PLAY", logo.width / 2, logo.height + spacing);
        // text("TUTORIAL", logo.width / 2, logo.height + (spacing * 2));
        // text("EXIT", logo.width / 2, logo.height + (spacing * 3));
        
        
        for (int i = 0; i < options.length; i++) {
            cp5.addTextlabel(options[i] + "_btn")
               .setText(options[i])
               .setPosition(logo.width / 2, logo.height + (spacing * i))
               .setColorValue(255)
               .setFont(font);
        }
    }
    // public void play(float value) {
    //     println(value);
// }
    
    public void clickHandler() {
        println("lmao nice");
    }
    // public void exit(float value) {
    //  println(value);
// }
}

