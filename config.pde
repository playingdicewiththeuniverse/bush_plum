// number of attempts per node, 30 suggested
final int K = 30;

// dimensions of canvas, -1 for either value = fullscreen
int CANVAS_WIDTH  = 1080;
int CANVAS_HEIGHT = 1080;

// how to select nodes from the stack
// 0 = random (default), 1 = top of stack, 2 = bottom of stack
int INDEX_SELECTION_MODE = 0;

// how to choose random radius
// 0 = random (default), 1 = noise, 2 = quantized noise
int RANDOM_RADIUS_MODE = 0;

// randomness/noise seed and scaling factors
int SEED = 42;
float RANDOM_SCALE = 4.0;
float NOISE_SCALE  = 0.1;
float NOISE_MIN    = 0.2;
float NOISE_MAX    = 0.8;

// is the program outputing each frame
boolean RECORD = false;

// how many updates per frame
int SPEED = 100;

// how fast color cycles on mode 5
int COLOR_SPEED = 0;

// min and maximum dot radius, and spacing distance
float R_MIN = 4;
float R_MAX = 12;
float DIST  = 5;


int DISPLAY_COLOR_MODE = 1;
int DISPLAY_SHAPE_MODE = 1;
