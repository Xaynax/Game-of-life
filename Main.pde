int size;
int factor;
boolean[][] grid;
boolean[][] newGrid;

void setup(){
  size = 100;
  factor = 10;
  size(1000, 1000);
  frameRate(20);
  
  grid = new boolean[size][size];
  
  for (int i = 0; i < size; i++){
    for (int j = 0; j < size; j++){
      grid[i][j] = Math.random() < 0.5? true : false;
    }
  }
}

int neighbours(int x, int y){
  int count = 0;
  for (int k = -1; k < 2; k++){
    for (int l = -1; l < 2; l++){
      if (grid[x+k][y+l] && !(k==0 && l==0)){
        count++;
      }
    }
  }
  return count;
}

void update(){
  int neighboursCount=0;
  newGrid = copyArray(grid);
  
  for (int i = 1; i < size-1; i++){
    for (int j = 1; j < size-1; j++){
      neighboursCount = neighbours(i,j);
      
      if (neighboursCount < 2){
        newGrid[i][j] = false;
      }
      else if (!grid[i][j] && neighboursCount == 3){
        newGrid[i][j] = true;
      }
      else if (neighboursCount > 3){
        newGrid[i][j] = false;
      }
    }
  }
  grid = copyArray(newGrid);
}

void draw(){
  background(255);
  noStroke();
  fill(0);
  
  update();
  
  for (int i = 0; i < size; i++){
    for (int j = 0; j < size; j++){
      if (grid[i][j]){
        rect(i*factor,j*factor, factor, factor);
      }
    }
  }
}
/**/

boolean[][] copyArray(boolean[][] actual){
  boolean[][] copy = new boolean[actual.length][actual[0].length];
  for (int i = 0; i < actual.length; i++){
    for (int j = 0; j < actual[i].length;j++){
      copy[i][j] = actual[i][j];
    }
  }
  return copy;
}
