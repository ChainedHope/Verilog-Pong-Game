////////////////////////////////////////////////////////////
//
//	Names: Larry Kozlowski and Alexander Romero
// Date: 2/22/17
// CM#1125 and CM#3297
// Purpose: Pixel unit for the Play option
////////////////////////////////////////////////////////////

module pong_menu_item_rom
	(
		input wire clk,
		input wire [9:0] xpos,
		input wire [9:0] ypos,
		output reg [2:0] red,
		output reg [2:0] green,
		output reg [1:0] blue
	);

	(* rom_style = "block" *)


	reg [9:0] ypos_reg;
	reg [9:0] xpos_reg;

	always @(posedge clk)
		begin
		ypos_reg <= ypos;
		xpos_reg <= xpos;
		end

	always @*
	case ({xpos_reg, ypos_reg})
		20'b00000000010000000110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000010000000111: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000010000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000010000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000010000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000010000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000010000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000010000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000010000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000100000000110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000100000000111: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000100000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000100000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000100000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000100000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000100000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000100000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000100000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000110000000110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000110000000111: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000110000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000000110000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001000000000110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001000000000111: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001000000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001000000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001010000000110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001010000000111: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001010000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001010000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001100000000110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001100000000111: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001100000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001100000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001110000000110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001110000000111: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001110000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001110000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001110000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000001110000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010000000000111: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010000000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010000000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010000000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010110000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010110000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010110000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010110000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010110000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010110000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000010110000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011000000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011000000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011000000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011000000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011000000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011000000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011000000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011010000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011010000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011100000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011100000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011110000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000011110000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000100000000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000100000000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000100010000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000100100000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000100100000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000100110000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000100110000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000100110000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000100110000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101000000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101000000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101000000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101000000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101000000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101000000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101010000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101010000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101010000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101010000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101010000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101100000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101100000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101100000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101100000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101100000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101100000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101110000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101110000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101110000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000101110000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000110000000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000110000000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000110000000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000110010000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000110100000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000110110000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000110110000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111000000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111000000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111000000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111010000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111010000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111010000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111010000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111010000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111100000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111100000001011: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111100000001100: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111100000001101: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111100000001110: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111110000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111110000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00000111110000001010: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00001000000000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00001000000000001001: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		20'b00001000010000001000: begin red <= 3'b111; green <= 3'b111; blue <= 2'b11; end
		default: begin red <= 3'b000; green <= 3'b000; blue <= 2'b00; end
	endcase
endmodule