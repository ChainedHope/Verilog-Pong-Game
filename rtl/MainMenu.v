`timescale 1ns / 1ps
////////////////////////////////////////////////////////////
//
//	Names: Larry Kozlowski and Alexander Romero
// Date: 2/22/17
// CM#1125 and CM#3297
// Purpose: Controls the main menu
////////////////////////////////////////////////////////////
module MainMenu(
				input clock,
				input reset,
				input [9:0] xpos,
				input [9:0] ypos,
				input rota,
				input rotb,
				output [2:0] red,
				output [2:0] green,
				output [1:0] blue,
				output speaker,
				output reg[2:0] menuSelect,
				input showCredits
		 );

reg [2:0] quadAr, quadBr;
always @(posedge clock) quadAr <= {quadAr[1:0], rota};
always @(posedge clock) quadBr <= {quadBr[1:0], rotb};

always @(posedge clock)
if(showCredits==0) begin
	if(quadAr[2] ^ quadAr[1] ^ quadBr[2] ^ quadBr[1])
	begin
		if(quadAr[2] ^ quadBr[1]) begin
			if(menuSelect < 1)
				menuSelect<=menuSelect+1'b1;
		end 
		else begin
			if(menuSelect > 0)
				menuSelect<=menuSelect-1'b1;
		end 
	end 
end

wire[2:0] red_logo, red_menu_credit, red_menu_pong;
wire[2:0] green_logo, green_menu_credit, green_menu_pong;
wire[1:0] blue_logo, blue_menu_credit, blue_menu_pong;

reg[9:0] credit_menu_offset;
reg[9:0] pong_menu_offset;
always@(menuSelect)
	case(menuSelect)
		0: begin pong_menu_offset<=10'd30; credit_menu_offset<=10'd0; end
		1: begin pong_menu_offset<=10'd0; credit_menu_offset<=10'd30; end
		default: begin pong_menu_offset<=10'd0; credit_menu_offset<=10'd0; end
	endcase

pong_logo_rom pong_logo(clock, xpos-10'd220, ypos-10'd80, red_logo, green_logo, blue_logo);
credit_menu_item_rom credit_menu_item(clock, xpos-10'd300-credit_menu_offset, ypos-10'd400, red_menu_credit, green_menu_credit, blue_menu_credit);
pong_menu_item_rom pong_menu_item(clock, xpos-10'd300-pong_menu_offset, ypos-10'd370, red_menu_pong, green_menu_pong, blue_menu_pong);


assign red = red_logo | red_menu_credit | red_menu_pong;
assign green = green_logo | green_menu_credit | green_menu_pong;
assign blue = blue_logo | blue_menu_credit | blue_menu_pong;

wire Loop;
wire Play = Loop;
PlaySound PlayBackgroundMusic(Play, speaker, reset, clock, Loop);

endmodule
