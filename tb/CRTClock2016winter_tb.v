`timescale 1ns / 1ps

//

module CRTClock2016winter_tb;

	reg [30:0] SystemClock, CRTClock;
	reg Reset, Clock;

	wire CRTclock;

	CRTClockTemplate uut (SystemClock,CRTClock, CRTclock, Reset, Clock);

	initial begin SystemClock = 100; CRTClock = 25; Reset = 0; Clock = 0; end
 
	initial fork
	#0 Reset=1; #20 Reset=0;
	#800 $stop;
	join
	always #4 Clock=~Clock;   
endmodule

