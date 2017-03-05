`timescale 1ns / 1ps
////////////////////////////////////////////////////////////
//
//	Names: Larry Kozlowski and Alexander Romero
// Date: 2/22/17
// CM#1125 and CM#3297
// Purpose: Controls game inputs and outputs
////////////////////////////////////////////////////////////
module GameController(
		 input Clock,
		 input Reset,
		 input pauseButton,
		 input rota, 
		 input rotb, 
		 input[9:0] xpos,
		 input[9:0] ypos,
		 output[2:0] red,
		 output[2:0] green,
		 output[1:0] blue,
		 output speaker
		 );
		 
wire [3:0] score10, score1;
wire [2:0] red_game, red_menu, red_credits, red_game_over, green_game, green_menu, green_credits, green_game_over, red_D1, red_D2, green_D1, green_D2, menuSelect;
wire [1:0] blue_game, blue_menu, blue_credits, blue_game_over, blue_D1, blue_D2;
wire speaker_main_menu, speaker_game, scored, scoreOS, missed, missedOS, missedDB, pauseOS, pauseDebounce, SevenSegPixel1, SevenSegPixel2, SevenSegPixel3;
reg [6:0] score;
reg [1:0] lifes;
reg showCredits = 0, gameOver = 0, pause=1, start = 0;

//Set the speaker output depending on what screen is shown
assign speaker = (~start) ? speaker_main_menu : (~pause && ~gameOver) ? speaker_game : 1'b0;
assign score10 = score/10;
assign score1 = score%10;

//Game signal one shots and debouncers
ClockedOneShot scoreOSU(scored, scoreOS, Reset, Clock);
Debouncer mDB(missed, missedDB, Reset, Clock);
ClockedOneShot mOS(missedDB, missedOS, Reset, Clock);
Debouncer pBDB(pauseButton, pauseDebounce, Reset, Clock);
ClockedOneShot pBOS(pauseDebounce, pauseOS, Reset, Clock);

//Score updater
always@(posedge Clock  or posedge Reset)
if(Reset==1'b1) score<=1'b0;
else if(scoreOS==1'b1) score<=score+1'b1;
else if(missed==1'b1) score<=1'b0;

//Game Pause
always@(posedge pauseOS  or posedge Reset)
if(Reset==1'b1) begin pause<=1'b1; end
else if(start==1'b1) pause<=~pause;
else if(gameOver==1'b1) pause<=1'b1;
else pause<=1'b1;

//Menu Selection and game start
always@(posedge pauseOS  or posedge Reset)
if(Reset==1'b1) begin start<=1'b0; end
else if(menuSelect==1'b0) begin start<=1'b1; end
else if(menuSelect==1'b1 && start == 1'b0) begin showCredits<=~showCredits; start<=1'b0; end

//Gameover & lifes
always@(posedge Clock or posedge Reset)
if(Reset==1'b1) begin lifes<=2'd3; gameOver<=1'b0; end
else if(missedOS==1'b1) lifes<=lifes-1'b1;
else if(lifes==2'd0) begin gameOver<=1'b1;end
else if(gameOver==1'b1 && pauseButton==1'b1) begin gameOver<=1'b0; lifes<=2'd3; end

//Display Counters
assign red_D1={2'b0, SevenSegPixel1||SevenSegPixel2||SevenSegPixel3};
assign green_D1={SevenSegPixel1||SevenSegPixel2||SevenSegPixel3, 1'b0, SevenSegPixel1||SevenSegPixel2||SevenSegPixel3};
assign blue_D1={1'b0, SevenSegPixel1||SevenSegPixel2||SevenSegPixel3};

//assign red = (start) ? (gameOver) ? red_game_over : (red_game | red_D1) : (showCredits) ? red_credits :  red_menu;
//assign green = (start) ? (gameOver) ? green_game_over : (green_game | green_D1) : (showCredits) ? green_credits : green_menu;
//assign blue = (start) ? (gameOver) ? blue_game_over : (blue_game | blue_D1) :  (showCredits) ? blue_credits : blue_menu;
wire[9:0] Digit1X = 10'd550, Digit1Y=10'd20, Digit2X=10'd575, Digit2Y=10'd20, Digit3X=10'd90, Digit3Y=10'd20;

VGA7SegDisplay DU_Score10 (Digit1X, Digit1Y, xpos, ypos, score10, SevenSegPixel1);
VGA7SegDisplay DU_Score1 (Digit2X, Digit2Y, xpos, ypos, score1, SevenSegPixel2);
VGA7SegDisplay DU_Lives1 (Digit3X, Digit3Y, xpos, ypos, lifes, SevenSegPixel3);

game_module2016winter gameUnit(Clock, Reset, xpos, ypos, rota, rotb, pause, red_game, green_game, blue_game, scored, missed, speaker_game);
MainMenu mainMenu(Clock, Reset, xpos, ypos, rota, rotb, red_menu, green_menu, blue_menu, speaker_main_menu, menuSelect, showCredits);
credits credits_(Clock, Reset, xpos, ypos, red_credits, green_credits, blue_credits);
GameOver_rom GameOverRom(Clock, xpos-10'd92, ypos-10'd104, red_game_over, green_game_over, blue_game_over);

wire[1:0] select = (start) ? (gameOver) ? 2'd3 : 2'd1 : (showCredits) ? 2'd2 : 2'd0;
wire[7:0] menuColors = {red_menu, green_menu, blue_menu};
wire[7:0] gameColors = {red_game | red_D1, green_game | green_D1, blue_game | blue_D1};
wire[7:0] creditColors = {red_credits, green_credits, blue_credits};
wire[7:0] gameOverColors = {red_game_over, green_game_over, blue_game_over};
ColorController Colors(Clock, select, menuColors, gameColors, creditColors, gameOverColors, red, green, blue);

endmodule

