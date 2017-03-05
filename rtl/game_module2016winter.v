`timescale 1ns / 1ps
//Source: http://www.bigmessowires.com/2009/06/21/fpga-pong/
//
// -----------------------------------------------
// updates the ball and paddle positions, and
// determines the output video image
// This is the original game module with Reset being added
// -----------------------------------------------
module game_module2016winter(input clk25, input Reset,
				input [9:0] xpos,
				input [9:0] ypos,
				input rota,
				input rotb,
				input pause,
				output [2:0] red,
				output [2:0] green,
				output [1:0] blue,
				output reg score,
				output reg missedO,
				output speaker);
		
// paddle movement		
reg [8:0] paddlePosition;
reg [2:0] quadAr, quadBr;
always @(posedge clk25) quadAr <= {quadAr[1:0], rota};
always @(posedge clk25) quadBr <= {quadBr[1:0], rotb};

always @(posedge clk25)
if(~pause) begin
	if(quadAr[2] ^ quadAr[1] ^ quadBr[2] ^ quadBr[1])
	begin
		if(quadAr[2] ^ quadBr[1]) begin
			if(paddlePosition < 508) begin        // make sure the value doesn't overflow
				paddlePosition <= paddlePosition + 4;	
		end end
		else begin
			if(paddlePosition > 3) begin       // make sure the value doesn't underflow
				paddlePosition <= paddlePosition - 3'd4;
		end end
	end 
end
		
// ball movement	
reg [9:0] ballX;
reg [8:0] ballY;
reg ballXdir, ballYdir;
reg bounceX, bounceY;
	
wire endOfFrame = (xpos == 0 && ypos == 480);
	
always @(posedge clk25) begin
	if(~pause) begin
		if (endOfFrame) begin // update ball position at end of each frame
			if (ballX == 0 && ballY == 0) begin // cheesy reset handling, assumes initial value of 0
				ballX <= 480;
				ballY <= 300;
			end
			else begin
				if (ballXdir ^ bounceX) 
					ballX <= ballX + 2;
				else 
					ballX <= ballX - 2;	

				if (ballYdir ^ bounceY) 
					ballY <= ballY + 2'd2;
				else
					ballY <= ballY - 2'd2;	
				end
			end	
		end	
	end	
		
// pixel color	
reg [5:0] missTimer;	
wire visible = (xpos < 640 && ypos < 480);
wire top = (visible && ypos <= 10);
wire bottom = (visible && ypos >= 475);
wire left = (visible && xpos <=10);
wire right = (visible && xpos >= 630);
wire border = (visible && (left || right || top));
wire paddle = (xpos >= paddlePosition+4 && xpos <= paddlePosition+124 && ypos >= 440 && ypos <= 447);
wire ball = (xpos >= ballX && xpos <= ballX+7 && ypos >= ballY && ypos <= ballY+7);
wire background = (visible && !(border || paddle || ball));
wire checkerboard = (xpos[5] ^ ypos[5]);
assign missed = visible && missTimer != 0;
wire paddleMovement = quadAr[2] ^ quadAr[1] ^ quadBr[2] ^ quadBr[1];
wire moveRight = quadAr[2] ^ quadBr[1];
wire moveLeft = quadAr[1] ^ quadBr[2];

assign red   = { missed || border || paddle || ball, ball, ball};
assign green = { !missed && (border || paddle || ball), 2'b00 };
assign blue  = { background && checkerboard, background && !checkerboard  }; 
		
// ball collision	
always @(posedge clk25) begin
	if(~pause) begin
		if (!endOfFrame) begin
			if (ball && (left || right))
				bounceX <= 1;
			if (ball && (top || bottom || (paddle && ballYdir)))
				bounceY <= 1;
			if (ball && bottom)
				missTimer <= 63;
			if (ball && (paddle && ballYdir))
				score<=1'b1;
			if (ball && ~(paddle&&ballYdir))
				score<=1'b0;
		end
		else begin
			if (ballX == 0 && ballY == 0) begin // cheesy reset handling, assumes initial value of 0
				ballXdir <= 1;
				ballYdir <= 1;
				bounceX <= 0;
				bounceY <= 0;
			end 
			else begin
				if (bounceX)
					ballXdir <= ~ballXdir;
				if (bounceY)
					ballYdir <= ~ballYdir;			
				bounceX <= 0;
				bounceY <= 0;
			
				if (missTimer != 0) begin
					missTimer <= missTimer - 1;
				end
			end
		end
	end
end

always@(posedge clk25)
	if(Reset==1'b1) missedO <= 1'b0;
	else if(missed) missedO <= 1'b1;
	else if(ball && top) missedO<=1'b0;
	else missedO<=missedO;

ThreeMusicNotes THN(moveRight, moveLeft, missed || score, speaker, Reset||pause, clk25);

endmodule
