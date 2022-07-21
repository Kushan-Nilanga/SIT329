// create module
module blink (
	input wire clk, // 50MHz input clock
	output wire[7:0] LED // LED ouput
);

// create a binary counter
reg [31:0] cnt; // 32-bit counter

initial begin
cnt <= 32'h00000000; // start at zero
end


always @(posedge clk) begin
cnt <= cnt + 1; // count up
end

//assign LED to 25th bit of the counter to blink the LED at a few Hz
// clock / 2^n = bps
// our clock is 50 mhz (50000000)
// 50000000 / 4 Hz = 2^n -- 12500000 = 2^n -- n = 23
// 50000000 / 2 Hz = 2^n -- 25000000 = 2^n -- n = 24
// 50000000 / 1 = 2 ^ n --  50000000 = 2^n -- n = 25
// 50000000 / 0.5 = 2^n -- 100000000 = 2^n -- n = 26
// 50000000 / 0.25 = 2^n --200000000 = 2^n -- n = 27
// all these are approximate values
assign LED = cnt[28:21];

endmodule