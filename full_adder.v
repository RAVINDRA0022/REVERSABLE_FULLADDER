`timescale 1ns / 1ps

module reversible_full_adder(input a, b, cin, output sum, carry);

    wire p, q, r;
    wire p1;

    peres_gate PG1 (
        .a(a), 
        .b(b), 
        .c(1'b0), 
        .x(p), 
        .y(q), 
        .z(r)       
    );
    
    peres_gate PG2 (
        .a(q), 
        .b(cin), 
        .c(r),     
        .x(p1), 
        .y(sum), 
        .z(carry)
    );

endmodule

module peres_gate (
    input a, b, c, 
    output x, y, z
);
    assign x = a;
    assign y = a ^ b;
    assign z = (a & b) ^ c;
endmodule
