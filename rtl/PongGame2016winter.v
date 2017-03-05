`timescale 1ns / 1ps
////////////////////////////////////////////////////////////
//
//	Names: Larry Kozlowski and Alexander Romero
// Date: 2/22/17
// CM#1125 and CM#3297
// Purpose: Top level module for Pong game
////////////////////////////////////////////////////////////

module PongGame2016winter(
		 input Clock, 
		 input Reset, 
		 input rota, 
		 input rotb, 
		 input pauseButton,
		 output [2:0] red,
		 output [2:0] green,
		 output [1:0] blue,
		 output hsync, 
		 output vsync,
		 output speaker,
		 output hsync_pmod,
		 output vsync_pmod
    );

wire [9:0] xpos;
wire [9:0] ypos;
assign hsync_pmod = hsync;
assign vsync_pmod = vsync;
parameter [9:0] NumberofPixels=10'd640, NumberofLines=10'd480;
parameter [9:0] SystemClock=10'd100, CRTClock=10'd25; //MHz 

CRTcontroller2016winter VGAdisplay(NumberofPixels, NumberofLines, SystemClock, CRTClock, 
     hsync, vsync, xpos, ypos, Reset, Clock);
	  
GameController Game(Clock, Reset, pauseButton, rota, rotb, xpos, ypos, red, green, blue, speaker);
	    
endmodule


