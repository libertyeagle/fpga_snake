`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:56:35 11/30/2017 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
	input clk,
	input sw,
	input reset_high,
	input reset,
	input [3:0] btn,
	output [7:0] rgb,
	output hsync,
	output vsync,
	output led_red,
	output led_green,
	output led_blue
	);

	wire [3:0] direction;
	wire video, p_tick, text_on, g_over;
	wire [9:0] pix_x, pix_y;
	wire [7:0] graph_rgb, text_rgb;
	wire [3:0] score1, score0;
	wire [3:0] high1, high0;

	direction_gen new_direction(clk, ~reset, btn, direction);

	vga_sync sync(clk, reset, hsync, vsync, video_on, p_tick, pix_x, pix_y);

	graph snake_graph(clk, ~reset, ~reset_high, sw, direction, video_on, pix_x, pix_y, graph_rgb, score1, score0, high1, high0, g_over);
	
	text snake_text(clk, video_on, score1, score0, high1, high0, g_over, pix_x, pix_y, text_on, text_rgb);
	
	assign rgb = (text_on) ? text_rgb : graph_rgb;

	assign led_red = (reset) ? 1'b1: g_over;
	assign led_green = (reset) ? 1'b1: ((~sw) && (~g_over));
	assign led_blue = (reset) ? 1'b1: (sw && (~g_over));
	
endmodule