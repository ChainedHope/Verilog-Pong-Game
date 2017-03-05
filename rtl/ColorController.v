`timescale 1ns / 1ps
////////////////////////////////////////////////////////////
//
//	Names: Larry Kozlowski and Alexander Romero
// Date: 2/22/17
// CM#1125 and CM#3297
// Purpose: Takes color inputs and outputs the selected screen
////////////////////////////////////////////////////////////

module ColorController(
		 input Clock,
		 input[1:0] Select,
		 input[7:0] TitleColor,
		 input[7:0] GameColor,
		 input[7:0] CreditColor,
		 input[7:0] GameOverColor,
		 output reg[2:0] RedOut,
		 output reg[2:0] GreenOut,
		 output reg[1:0] BlueOut
    );

parameter TITLE_SCREEN = 0, GAME = 1, CREDITS = 2, GAME_OVER = 3;

always@(posedge Clock)
case(Select)
	TITLE_SCREEN: begin RedOut<=TitleColor[7:5]; GreenOut<=TitleColor[4:2]; BlueOut<=TitleColor[1:0]; end
	GAME: begin RedOut<=GameColor[7:5]; GreenOut<=GameColor[4:2]; BlueOut<=GameColor[1:0]; end
	CREDITS: begin RedOut<=CreditColor[7:5]; GreenOut<=CreditColor[4:2]; BlueOut<=CreditColor[1:0]; end
	GAME_OVER: begin RedOut<=GameOverColor[7:5]; GreenOut<=GameOverColor[4:2]; BlueOut<=GameOverColor[1:0]; end
endcase

endmodule
