# converts image to Verilog HDL that infers a ROM using Xilinx Block RAM
# note: 12-bit color map word is r3, r2, r1, r0, g3, g2, g1, g0, b3, b2, b1, b0

from scipy import misc
import math

# returns string of 12-bit color at row x, column y of image
def get_color_bits(im, y, x):
    # convert color components to byte string and slice needed upper bits
    b  = format(im[y][x][0], 'b').zfill(8)
    rx = b[0:3]
    b  = format(im[y][x][1], 'b').zfill(8)
    gx = b[0:3]
    b  = format(im[y][x][2], 'b').zfill(8)
    bx = b[0:2]

    # return concatination of RGB bits
    return str(rx+gx+bx)

# write to file Verilog HDL
# takes name of file, image array,
# pixel coordinates of background color to mask as 0
def rom_12_bit(name, im, mask=False, rem_x=-1, rem_y=-1):

    # get colorbyte of background color
    # if coordinates left at default, map all data without masking
    if rem_x == -1 or rem_y == -1:
        a = "000000000000"
        
    # else set mask compare byte
    else:
        a = get_color_bits(im, rem_x, rem_y)

    # make output filename from input
    file_name = name.split('.')[0] + "_rom.v"

    # open file
    f = open(file_name, 'w')

    # get image dimensions
    y_max, x_max, z = im.shape

    # get width of row and column case words
    row_width = math.ceil(math.log(y_max-1,2))
    col_width = math.ceil(math.log(x_max-1,2))

    # write beginning part of module up to case statements
    f.write("module " + name.split('.')[0] + "_rom\n\t(\n\t\t")
    f.write("input wire clk,\n\t\tinput wire [9:0] xpos,\n\t\t")
    f.write("input wire [9:0] ypos,\n\t\t")
    f.write("output reg [2:0] red,\n\t\t")
    f.write("output reg [2:0] green,\n\t\t")
    f.write("output reg [1:0] blue\n\t);\n\n\t")
    f.write("(* rom_style = \"block\" *)\n\n\n\t")
    f.write("reg [9:0] ypos_reg;\n\t")
    f.write("reg [9:0] xpos_reg;\n\n\t")
    f.write("always @(posedge clk)\n\t\tbegin\n\t\typos_reg <= ypos;\n\t\txpos_reg <= xpos;\n\t\tend\n\n\t")
    f.write("always @*\n\tcase ({xpos_reg, ypos_reg})\n")
    

    # loops through y rows and x columns
    for x in range(x_max):
        for y in range(y_max):
            if(get_color_bits(im,y,x) != "00000000"):
				# write : color_data = 
                color_data = get_color_bits(im, y, x)
                case = format(x, 'b').zfill(10) + format(y, 'b').zfill(10)
                f.write("\t\t20'b" + case + ": begin red <= 3'b")

				# if mask is set to false, just write color data
                if(mask == False):
                    f.write(color_data[:3] + "; green <= 3'b")
                    f.write(color_data[3:6] + "; blue <= 2'b")
                    f.write(color_data[-2:] +";\n")
                elif(get_color_bits(im, y, x) != a):
					# write color bits to file
                    f.write(color_data[:3] + "; green <= 3'b")
                    f.write(color_data[3:6] + "; blue <= 2'b")
                    f.write(color_data[-2:] +"; end\n")
                    print(color_data+ " :: red=" + color_data[:3]+" green=" + color_data[3:6] + " blue=" + color_data[-2:])
                
                
        
    # write end of module
    f.write("\t\tdefault: begin red <= 3'b000; green <= 3'b000; blue <= 2'b00; end\n\tendcase\nendmodule")

    # close file
    f.close()    

# driver function
def generate(name, rem_x=1, rem_y=1):
    im = misc.imread(name, mode = 'RGB')
    print("width: " + str(im.shape[1]) + ", height: " + str(im.shape[0]))
    rom_12_bit(name, im, True)

# generate rom from full bitmap image
generate("pong_logo.bmp")
generate("pong_menu_item.bmp")
generate("credit_menu_item.bmp")
generate("credits.bmp");
generate("game_over.bmp");
generate("game_bar.bmp");