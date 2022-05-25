// Create text object	
PFont myFont = createFont("Consolas", 12, true);
textFont(myFont);

// Color arrays	or palettes (top side, left side, right side)
color[] RedCube = { color(#ef2929), color(#a40000), color(#cc0000) };
color[] GreenCube = { color(#8ae234), color(#4e9a06), color(#73d216) };
color[] BlueCube = { color(#729fcf), color(#204a87), color(#3465a4) };
color[] Palette = { RedCube, GreenCube, BlueCube };

void setup() {
    size(1100, 800);
    smooth();
    IsoW = 64; // cell width
    IsoH = 32; // cell height
    IsoX = width / 2;
    IsoY = (height - IsoH * 32) / 2;
    noLoop();
}

void draw() {
    background(255);
    
    fill(0);
    
    // Tweak the position of the grid, moving it down
    translate(0, 400);
    
    // This draws the coordinates
    tweakX = 10;
    tweakY = 5;
    for (x = 0; x < 8; x++) {
        for (y = 0; y < 8; y++) {
            text(x + "," + y, IsoToScreenX(x, y) - tweakX, IsoToScreenY(x, y) + IsoH + tweakY);
        }
    }
    
    // This draws the isometric grid
    stroke(221, 221, 221);
    for (i = 0; i <= 8; i++) {
        line(IsoToScreenX(0, i), IsoToScreenY(0, i), IsoToScreenX(8, i), IsoToScreenY(8, i));
        line(IsoToScreenX(i, 0), IsoToScreenY(i, 0), IsoToScreenX(i, 8), IsoToScreenY(i, 8));
    }
    
    // This draws the cubes
    for (x = 0; x < 8; x++) {
        for (y = 0; y < 8; y++) {
            int number = int(random(0, 5));
            color[] objPalette = RandomPalette();
            for (z = 0; z < number; z++) {
                DrawCube(x - z, y - z, objPalette);
            }
        }
    }
}

void IsoToScreenX(localX, localY) {
    return IsoX + (localX - localY) * IsoW;
}
void IsoToScreenY(localX, localY) {
    return IsoY + (localX + localY) * IsoH;
}
void ScreenToIsoX(globalX, globalY) {
    return((globalX - IsoX) / IsoW + (globalY - IsoY) / IsoH) / 2;
}
void ScreenToIsoY(globalX, globalY) {
    return((globalY - IsoY) / IsoH - (globalX - IsoX) / IsoW) / 2;
}

// Draws a cube at the specified Isometric coordinates
void DrawCube(IsoX, IsoY, CubeColor) {
    stroke(0, 0, 0);
    strokeWeight(3);
    // Top side
    fill(CubeColor[0]);
    beginShape();
    vertex(IsoToScreenX(IsoX, IsoY), IsoToScreenY(IsoX, IsoY));
    vertex(IsoToScreenX(IsoX, IsoY - 1), IsoToScreenY(IsoX, IsoY - 1));
    vertex(IsoToScreenX(IsoX - 1, IsoY - 1), IsoToScreenY(IsoX - 1, IsoY - 1));
    vertex(IsoToScreenX(IsoX - 1, IsoY), IsoToScreenY(IsoX - 1, IsoY));
    endShape(CLOSE);
    
    // Left side
    fill(CubeColor[1]);
    beginShape();
    vertex(IsoToScreenX(IsoX + 1, IsoY + 1), IsoToScreenY(IsoX + 1, IsoY + 1));
    vertex(IsoToScreenX(IsoX, IsoY), IsoToScreenY(IsoX, IsoY));
    vertex(IsoToScreenX(IsoX - 1, IsoY), IsoToScreenY(IsoX - 1, IsoY));
    vertex(IsoToScreenX(IsoX, IsoY + 1), IsoToScreenY(IsoX, IsoY + 1));
    endShape(CLOSE);
    
    // Right side
    fill(CubeColor[2]);
    beginShape();
    vertex(IsoToScreenX(IsoX + 1, IsoY + 1), IsoToScreenY(IsoX + 1, IsoY + 1));
    vertex(IsoToScreenX(IsoX + 1, IsoY), IsoToScreenY(IsoX + 1, IsoY));
    vertex(IsoToScreenX(IsoX, IsoY - 1), IsoToScreenY(IsoX, IsoY - 1));
    vertex(IsoToScreenX(IsoX, IsoY), IsoToScreenY(IsoX, IsoY));
    endShape(CLOSE);
    
    // Restore previous settings
    noFill();
    strokeWeight(1);
}

// Randomize the cube color
void RandomPalette() {
    int index = int(random(0, 3));
    color[] objPalette = Palette[index];
    return objPalette;
}

// Redraw when mouse is clicked
void mousePressed() {
    redraw();
}