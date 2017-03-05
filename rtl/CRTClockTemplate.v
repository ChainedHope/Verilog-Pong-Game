`timescale 1ns / 1ps
//File: CRTClockTemplate.v
//Generate 25MHz VGA clock from a SystemClock
//SystemClockFreq and CRTClockFreq are input parameters in MHz
//ECE497-01 Winter 2016-2017
//Term Project on Pong game on VGA
//this is a template to be completed by students

module CRTClockTemplate(SystemClockFreq, CRTClockFreq, PixelClock, Reset, Clock);

parameter SystemClockSize=10;
input [SystemClockSize-1:0] SystemClockFreq;
input [SystemClockSize-1:0] CRTClockFreq;
output reg	PixelClock;
input Reset, Clock;

reg[SystemClockSize-1:0] SystemCounter=0;
reg[SystemClockSize-1:0] CRTCounter=0;

//a counter is needed to generate PixelClock
initial PixelClock = 0;
always@(posedge Clock)
if(Reset==1) begin CRTCounter<=0; PixelClock<=0; end
else if(CRTCounter==(SystemClockFreq/(CRTClockFreq*2)-1)) begin PixelClock<=~PixelClock; CRTCounter<=0; end
else begin CRTCounter<=CRTCounter+1'b1; end


endmodule

