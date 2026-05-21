module Project1(
	input logic [9:0] SW, // switches
	output logic [9:0] LEDR, // LEDs
	output logic [6:0] HEX0, // seven seg display 0
	output logic [6:0] HEX1 // seven seg display 1
);

	// ACTIVITY 1 START
	// TASK: use SW[2:0] to output on LEDR[1:0] according to the full adder diagram
	
	// ACTIVITY 2 START
	// TASK: drive the seven segment display on HEX0 to show numbers 0-3 using switches SW[7:4]
	
	// Remaps the switches to use SW[7:4] instead of SW[3:0] when SW_remapped is referenced
	// Please use sw_remapped for your solution instead of SW directly!
	logic [3:0] SW_remapped;
	assign SW_remapped = SW[7:4];
	
	// ACTIVITY 3 START
    // TASK: display the output of the full adder circuit on HEX1 seven segment display
	

endmodule