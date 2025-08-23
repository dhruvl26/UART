`timescale 1ns / 1ps

module uart_tb;

    reg clk, reset, rx, tx_start;
    reg [7:0] din;
    wire tx_done_tick, rx_done_tick, tx;
    wire [7:0] dout;
    
    uart uut (.clk(clk), .reset(reset), .rx(rx), .tx_start(tx_start), .din(din), 
             .tx_done_tick(tx_done_tick), .rx_done_tick(rx_done_tick), .tx(tx), .dout(dout));
    
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50 MHz clock (20ns period)
    end
    
    initial begin
        reset = 1; 
        rx = 1; 
        tx_start = 0; 
        din = 8'h00;
        
        #20 reset = 0; 
        #100 tx_start = 1; 
        din = 8'hA5; 
        #20 tx_start = 0;
        
        
        #100000
        rx = 0;          // Start bit
        #104167;         // 104.167 µs for 9600 baud
        rx = 1;          // Bit 0: 1
        #104167;
        rx = 0;          // Bit 1: 0
        #104167;
        rx = 1;          // Bit 2: 1
        #104167;
        rx = 0;          // Bit 3: 0
        #104167;
        rx = 0;          // Bit 4: 0
        #104167;
        rx = 1;          // Bit 5: 1
        #104167;
        rx = 0;          // Bit 6: 0
        #104167;
        rx = 1;          // Bit 7: 1
        #104167;
        rx = 1;          // Stop bit
        #104167;

        
        #50000 $finish;
    end
endmodule
