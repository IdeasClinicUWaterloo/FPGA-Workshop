module Activity1(
	input logic [9:0] SW, // switches
	output logic [9:0] LEDR, // LEDs
	output logic [6:0] HEX0, // seven seg display 0
	output logic [6:0] HEX1 // seven seg display 1
);

	// ACTIVITY 1 START
	// TASK: use SW[2:0] to output on LEDR[1:0] according to the full adder diagram
	
	// solution begin:
	assign LEDR[0] = SW[0] ^ SW[1] ^ SW[2];   // Sum
   assign LEDR[1] = (SW[0] & SW[1]) | (SW[1] & SW[2]) | (SW[0] & SW[2]); // Cout
	
	// ACTIVITY 2 START
	// TASK: drive the seven segment display on HEX0 to show numbers 0-3 using switches SW[7:4]
	
	// Remaps the switches to use SW[7:4] instead of SW[3:0] when SW_remapped is referenced
	// Please use sw_remapped for your solution instead of SW directly!
	
	logic [3:0] SW_remapped;
	assign SW_remapped = SW[7:4];
	
	// solution begin:
	always_comb begin
		casez (SW_remapped)
        4'b???1: HEX0 = 7'b1000000; // SW[0] → 0
        4'b??10: HEX0 = 7'b1111001; // SW[1] → 1
        4'b?100: HEX0 = 7'b0100100; // SW[2] → 2
        4'b1000: HEX0 = 7'b0110000; // SW[3] → 3
        default: HEX0 = 7'b1111111; // off
		endcase
	end
	
	// ACTIVITY 3 START
	
	// solution begin:
	
	// helper variable to store full adder output
	logic [1:0] display;
	assign display = {(SW[0] & SW[1]) | (SW[1] & SW[2]) | (SW[0] & SW[2]), SW[0] ^ SW[1] ^ SW[2]}; // {Cout, sum}
	 
	 always_comb begin
		  case (display)
            2'd0: HEX1 = 7'b1000000; // 0
            2'd1: HEX1 = 7'b1111001; // 1
            2'd2: HEX1 = 7'b0100100; // 2
            2'd3: HEX1 = 7'b0110000; // 3
				default: HEX1 = 7'b1111111; // off
        endcase
    end
	
	

endmodule