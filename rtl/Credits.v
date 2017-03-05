`timescale 1ns / 1ps
////////////////////////////////////////////////////////////
//
//	Names: Larry Kozlowski and Alexander Romero
// Date: 2/22/17
// CM#1125 and CM#3297
// Purpose: Sets the image for the credits screen
////////////////////////////////////////////////////////////
module credits(
		input Clock,
		input Reset,
		input[9:0] xpos,
		input[9:0] ypos,
		output[2:0] red,
		output[2:0] green,
		output[1:0] blue
    );

//Credits_rom credits_rom(Clock, xpos,ypos,red,green,blue);
assign red = 3'b111;
assign green =3'b000;
assign blue = 2'b11;
endmodule
