`timescale 1ns / 1ps
//File: vsyncModuleTemplate.v
//To be completed by students. Add your name and date after you have revised this file
//Author: 
//Date: 
//The line increment is synchronized with the hsync pulse
//synch pulse is generated at the end of the line: Active Video-BackPorch-SynchPulse-FrontPorch
//this is how it is done by the video timer of the pong game
//LineEnd and FrameEnd are ANDed to restart frame

module vsyncModuleTemplate(LineEnd, SynchPulse, FrontPorch, ActiveVideo, BackPorch, vsync, yposition, reset, clock);
parameter yresolution=10;
input [yresolution-1:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch;
input reset, clock, LineEnd;
output vsync;
output reg[yresolution-1:0] yposition;
wire [yresolution-1:0] ycount, EndCount;
wire LineEnd2;
//hsynch starts next line
ClockedNegativeOneShot RestartUnit(LineEnd, NextLineOneShot, reset, clock);
//a counter is needed to generate synch signal and y coordinate
//to be completed by students
//vsync <= ~(ypos == 490 || ypos == 491); yposition<=ycount; // active for lines 490 and 491 
assign vsync = ~(ycount>(ActiveVideo+FrontPorch)&&ycount<(ActiveVideo+FrontPorch+SynchPulse));
assign EndCount=SynchPulse+FrontPorch+ActiveVideo+BackPorch;
assign LineEnd2=ycount==EndCount;	//reset counter


always@(LineEnd, ycount, SynchPulse, BackPorch, ActiveVideo, FrontPorch) 
	yposition<=ycount;
//module UniversalCounter10bitsV5(P,BeginCount, EndCount, Q,S1,S0,TerminalCount, Reset, CLOCK);
UniversalCounter10bitsV5 YPositionCounter(10'd0,10'd0, EndCount, ycount, LineEnd2,LineEnd2||NextLineOneShot,   , reset, clock) ;
endmodule
