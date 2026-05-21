module Project2(
	input  logic [9:0] SW,       // SW[9] = sign, SW[8:0] = binary number
    output logic [6:0] HEX0,     // Ones place
    output logic [6:0] HEX1,     // Tens place
    output logic [6:0] HEX2,     // Hundreds place
    output logic [6:0] HEX3      // Sign display
);

	// FUNCTION: Convert digit (0-9) to 7-segment display
	 
	// FUNCTION: Convert sign bit to 7-segment display
	 
	// main process to handle input conversion
    always_comb begin
        int temp_signed;
        int temp_abs;
        int hundreds, tens, ones;
		  int temp;
        logic sign_bit;
		  
		  // Convert input (signed 9-bit number with SW[9] as sign indicator)
			
		  // Get absolute value and sign
	
		  // Break into decimal digits
		  
		  // HEX3 assignment (sign to seven segment function)
		  
		  // HEX2, HEX1, HEX0 assignment (digit to seven segment function)
		  
		  
    end

endmodule