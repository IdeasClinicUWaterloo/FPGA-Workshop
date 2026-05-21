module Project2(
	input  logic [9:0] SW,       // SW[9] = sign, SW[8:0] = binary number
   output logic [6:0] HEX0,     // Ones place
   output logic [6:0] HEX1,     // Tens place
   output logic [6:0] HEX2,     // Hundreds place
   output logic [6:0] HEX3      // Sign display
);

	// FUNCTION: Convert digit (0-9) to 7-segment display
	
	// solution:
	function automatic logic [6:0] to_seven_segment;
		input [3:0] digit;
        case (digit)
            0: to_seven_segment = 7'b1000000;
            1: to_seven_segment = 7'b1111001;
            2: to_seven_segment = 7'b0100100;
            3: to_seven_segment = 7'b0110000;
            4: to_seven_segment = 7'b0011001;
            5: to_seven_segment = 7'b0010010;
            6: to_seven_segment = 7'b0000010;
            7: to_seven_segment = 7'b1111000;
            8: to_seven_segment = 7'b0000000;
            9: to_seven_segment = 7'b0010000;
            default: to_seven_segment = 7'b1111111; // off
        endcase
    endfunction
	 
	 // FUNCTION: Convert sign bit to 7-segment display
	 
	 // solution:
	 function automatic logic [6:0] sign_to_seg;
		input logic sign;
        if (sign)
            sign_to_seg = 7'b0111111; // minus sign (middle segment only)
        else
            sign_to_seg = 7'b1111111; // blank
    endfunction
	 
	 // main process to handle input conversion
    always_comb begin
        int temp_signed;
        int temp_abs;
        int hundreds, tens, ones;
		  int temp;
        logic sign_bit;
		  
		  // Convert input (signed 9-bit number with SW[9] as sign indicator)
		  
		  // solution:
        if (SW[9] == 1'b1)
				temp_signed = int'(unsigned'(SW[8:0])) - 512;
		  else
				temp_signed = int'(unsigned'(SW[8:0]));
			
		  // Get absolute value and sign
		  
		  // solution:
        if (temp_signed < 0) begin
			 temp_abs = -temp_signed;
			 sign_bit = 1'b1;
			end else begin
				temp_abs = temp_signed;
				sign_bit = 1'b0;
			end
			
		  // Break into decimal digits
		  
		  // solution:
        temp = temp_abs;
		  hundreds = temp / 100;
		  temp = temp % 100;
		  tens = temp / 10;
		  ones = temp % 10;
		  
		  // HEX3 assignment (sign to seven segment function)
		  
		  // solution:
		  HEX3 = sign_to_seg(sign_bit);
		  
		  
		  // HEX2, HEX1, HEX0 assignment (digit to seven segment function)
		  
		  // solution:
		  HEX2 = to_seven_segment(hundreds);
        HEX1 = to_seven_segment(tens);
        HEX0 = to_seven_segment(ones);
		  
	 end

endmodule