`timescale 1ns / 1ps
///File: PongDriver2016winter.v
//pong game with new controller template
//ECE497-01 Winter 2016-2017
//Term Project VGA driver template
//
//Date: Jan, 2017
//the video controller uses synch timings from the pong game
//the system clock should be 100MHz
//the VGA pixel clock is 25MHz
//this is a template for students to complete
//try to match the video_timer

module PongDriver2016winter(
   input Clock, Reset, rota, rotb,
    output [2:0] red,
    output [2:0] green,
    output [1:0] blue,
    output hsync, vsync
    );

wire [9:0] xpos;
wire [9:0] ypos;

parameter [9:0] NumberofPixels=10'd640, NumberofLines=10'd480;
parameter [9:0] SystemClock=10'd100, CRTClock=10'd25; //MHz 

//module CRTcontroller2016spring(Xresolution, Yresolution, SystemClock, 
// hsync, vsync, xposition, yposition, reset, clock);
CRTcontroller2016winter VGAdisplay(NumberofPixels, NumberofLines, SystemClock, CRTClock, 
     hsync, vsync, xpos, ypos, Reset, Clock);
	  
/* module game_module2016spring(input clk25, input Reset,
				input [9:0] xpos,
				input [9:0] ypos,
				input rota,
				input rotb,
				output [2:0] red,
				output [2:0] green,
				output [1:0] blue);
*/
game_module2016winter gameUnit(Clock, Reset, xpos, ypos, rota, rotb, red, green, blue);
					
endmodule
