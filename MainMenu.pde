class MainMenu {
    PImage bgImg; 
    PImage logo; 
    
    public MainMenu() {
        try {
            bgImg = requestImage("menu_bg.png");
            logo = requestImage("Logo_pixel.png");
        } catch(Exception e) {
            ui.showException("Something went wrong", "Error", e);
        }
    }
    
    public void display() {
        renderBackground();
        renderLogo();
        renderTextButtons();
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
        text("PLAY", logo.width / 2, logo.height + spacing);
        text("TUTORIAL", logo.width / 2, logo.height + (spacing * 2));
        text("EXIT", logo.width / 2, logo.height + (spacing * 3));
    }
}

