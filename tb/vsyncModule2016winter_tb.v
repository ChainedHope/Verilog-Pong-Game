`timescale 1ns / 1ps

module vsyncModule2016winter_tb;

	reg LineEnd;
	reg [9:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch;
	reg reset, clock;

	wire vsync;
	wire [9:0] yposition;
//module vsyncModuleVer5(LineEnd, SynchPulse, FrontPorch, ActiveVideo, BackPorch, vsync, yposition, reset, clock);
//module vsyncModuleTemplate(LineEnd, SynchPulse, FrontPorch, ActiveVideo, BackPorch, vsync, yposition, reset, clock);

	vsyncModuleTemplate uut (LineEnd, SynchPulse, FrontPorch, ActiveVideo, 
	BackPorch, vsync, yposition, reset, clock);
	
	initial begin
		SynchPulse = 2;  BackPorch = 3;  ActiveVideo = 5;
		FrontPorch = 2;   reset = 0; clock = 0;    LineEnd=0; end
	always #1 clock=~clock;
	always #6 LineEnd=~LineEnd;
	initial fork
	#0 reset=1; 	#12 reset=0; 

   #300 $stop;
	join
endmodule

