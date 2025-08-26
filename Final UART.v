`timescale 1ns / 1ps
module uart
     (
        input wire clk, reset,
        input wire  rx, tx_start,
        input wire [7:0] din,
        output wire tx_done_tick, rx_done_tick, tx,
        output wire [7:0] dout
     );
     
     wire tick;
     
     mod_m_counter #(.M(326)) baud_gen_unit(.clk(clk), .reset(reset), .q(), .max_tick(tick));
     
     uart_rx uart_rx_unit(.clk(clk), .reset(reset), .rx(rx), .s_tick(tick), .rx_done_tick(rx_done_tick), .dout(dout));
     
     uart_tx uart_tx_unit(.clk(clk), .reset(reset), .tx_start(tx_start), .s_tick(tick), .din(din), .tx_done_tick(tx_done_tick), .tx(tx));
     
endmodule
 
 
