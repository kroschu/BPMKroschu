// Autogenerated with DRAKON Editor 1.29
import java.util.Iterator;
// The start of the class declaration.
// This way, the diagrams will become class methods.
// Символы Юникод

class Sky {
	
	float width;
	float height;

	color topColor;
	color bottomColor;



Sky(float width, float height, color topColor, color bottomColor) {
    // item 6
    this.width = width;
    this.height = height;
    // item 7
    this.topColor = topColor;
    this.bottomColor = bottomColor;
}

void draw() {
    // item 18
    beginShape();
    // item 13
    fill(topColor);
    // item 15
    vertex(0, 0);
    vertex(width, 0);
    // item 14
    fill(bottomColor);
    // item 16
    vertex(width, height);
    vertex(0, height);
    // item 17
    endShape(CLOSE);
}

// Don't forget the closing curly brace.
}
