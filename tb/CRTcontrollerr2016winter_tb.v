`timescale 1ns / 1ps

module CRTcontroller2016winter_tb;
//change pixel clock to 10
	reg [9:0] Xresolution, Yresolution;
	reg [9:0] SystemClock, CRTClock;
	reg reset, clock;

	wire hsync, vsync;
	wire [9:0] xposition, yposition;
	wire PixelClock=uut.PixelClock;

	// Instantiate the Unit Under Test (UUT)
	CRTcontroller2016winter uut (
	Xresolution, Yresolution, SystemClock, CRTClock, hsync, vsync, xposition, yposition, reset, clock
	);
	
	initial begin
		// Initialize Inputs
		Xresolution = 640;
		Yresolution = 480;
		SystemClock = 100;
		CRTClock = 25;
		reset = 0;
		clock=0;
	end
	always #5 clock=~clock;
	initial fork
	#0 reset=1; 	#50 reset=0; 
   #700 $stop;
	join
      
endmodule

