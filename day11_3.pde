import java.util.Calendar;

int sizeX, sizeY;
int quantity;
char chars[] = {'а', 'б', 'в', 'г', 'ґ', 'д', 'е', 'є', 'ж', 'з', 'и', 'і', 'ї', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ь', 'ю', 'я'};
char str;
PFont font;
int fontSize;

void setup() {
  size(600, 600);
  background(0); 
  noStroke();
  
  quantity = (int)(random(8, 20));
  
  sizeX = width/quantity;
  sizeY = height/quantity;
  fontSize = sizeX / 2;

  font = createFont("Arsenal-Bold.otf", fontSize);

  rectangles();
}

void draw() {
}

void rectangles() {
  for (int x = 0; x <= width; x+=sizeX) {
    for (int y = 0; y <= width; y+=sizeY) {
      fill(drawColor());
      textFont(font, fontSize);
      textMode(SHAPE);
      textAlign(CENTER, CENTER);
      str = chars[((int)(random(0, chars.length)))];
      text(str, x - sizeX/2, y - sizeY/2);
      rect(x, y, sizeX, sizeY);
    }
  }
}

color drawColor() {

  color c1 = color(random(50, 200), random(20, 120), random(20, 30));
  color c2 = color(random(50, 80), random(20, 100), random(60, 100));
  color c3 = color(random(50, 80), random(20, 100), random(20, 100));
  
  float num = random(100) / random(100);
  println(num);

  if (num > 1) {
    return c1;
  }
  else if (num >=3) {
    return c2;
  }
  else {
   return c3; 
  }
}

void mousePressed() {
  quantity = (int)(random(2, 20));
  
  sizeX = width/quantity;
  sizeY = height/quantity;
  fontSize = sizeX / 2;

  font = createFont("Arsenal-Bold.otf", fontSize);
  
  rectangles();
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


