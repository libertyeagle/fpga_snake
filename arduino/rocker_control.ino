int VRX = A0;
int VRY = A1;
int SW = A2;
int L = 1;
int R = 2;
int U = 3;
int D = 4;
int x, y;
bool left = false, right = false, up = false, down = false;

void setup() {
  pinMode(VRX, INPUT);
  pinMode(VRY, INPUT);
  pinMode(L, OUTPUT);
  pinMode(R, OUTPUT);
  pinMode(U, OUTPUT);
  pinMode(D, OUTPUT);
}

void loop() {
  x = analogRead(VRX);
  y = analogRead(VRY);
  if (x > 1010) {
    left = false;
    right = true;
    up = false;
    down = false;
  }
  else if (x < 15) {
    left = true;
    right = false;
    up = false;
    down = false;
  }
  else if (y > 1010) {
    left = false;
    right = false;
    up = false;
    down = true;
  }
  else if (y < 15) {
    left = false;
    right = false;
    up = true;
    down = false;
  }
  else {
    left = false;
    right = false;
    up = false;
    down = false;
  }
  digitalWrite(L, left);
  digitalWrite(R, right);
  digitalWrite(U, up);
  digitalWrite(D, down);
}
