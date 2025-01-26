/// @description Insert description here
// You can write your code in this editor
 
 
 if (distance_to_point(other.x,other.y) < 10) {
	 
	capturedInBubble = true;
	
	myBubble = other;
	other.myCapturedInsect = self;
	
	capturedByPlayerNum = other.playerNum;
	
 }
 
 if (x < other.x) {
	 
	x++;	 
 } else if (x > other.x) {
	 
	x--;
 }
 
  if (y < other.y) {
	 
	y++;	 
 } else if (y > other.y) {
	 
	y--;
 }