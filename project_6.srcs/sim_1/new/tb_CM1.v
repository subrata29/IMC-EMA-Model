`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2023 12:17:01
// Design Name: 
// Module Name: tb_CM1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_CM1();

reg clk;
reg [9:0]s;
reg rst;
//reg [1:0]flag;
//reg [63:0] t[10:1];
reg [575:0]memory;
reg [63:0]key;
//integer i;
//integer file;
wire [63:0] dout;
wire d;
//wire d1,d2,d3,d11,d12,d21,d22,d31,d32;
//wire sb1,mb1, sb11,mb11,sb12,mb12,sb13,mb13, sb111,mb111, sb112,mb112,sb121,mb121,sb122,mb122,sb131,mb131,sb132,mb132;

Memory_Cayley_2 uut(.clk(clk), .rst(rst),.s(s), .key(key),.memory(memory), .dout(dout), .d(d));//,.d1(d1),.d2(d2),.d3(d3),
 //.d11(d11),.d12(d12),.d21(d21),.d22(d22),.d31(d31),.d32(d32), .sb1(sb1),
 //.mb1(mb1),.sb11(sb11),.mb11(mb11),.sb12(sb12),.mb12(mb12),.sb13(sb13),.mb13(mb13),.sb111(sb111),.mb111(mb111),
 //.sb112(sb112),.mb112(mb112),.sb121(sb121),.mb121(mb121),.sb122(sb122),.mb122(mb122),.sb131(sb131),.mb131(mb131),
 //.sb132(sb132),.mb132(mb132));

//initial

//begin
//file= $fopen ("bwrite.txt");
////assign d = s;
//end


initial 
begin
        //$readmemh("b.txt", t, 1, 10);
        //$readmemb("s.txt", st, 1, 10);
//        Cellr cr(d1,d2,d3,clk,rst,s[0],key[63:0],dout,d,flag);

//Cell c1(d11,d,d12,clk,rst,s[1],memory[63:0],dout1,d1,flag);

//Cell c2(d21,d,d22,clk,rst,s[2],memory[127:64],dout2,d2,flag);

//Cell c3(d31,d,d32,clk,rst,s[3],memory[191:128],dout2,d3,flag);


//Cell c11(y,d1,y,clk,rst,s[4],memory[255:192],dout11,d11,flag);
//Cell c12(y,d1,y,clk,rst,s[5],memory[319:256],dout12,d12,flag);

//Cell c21(y,d2,y,clk,rst,s[6],memory[383:320],dout21,d21,flag);
//Cell c22(y,d2,y,clk,rst,s[7],memory[447:384],dout22,d22,flag);

//Cell c31(y,d3,y,clk,rst,s[8],memory[511:448],dout31,d31,flag);
//Cell c32(y,d3,y,clk,rst,s[9],memory[575:512],dout32,d32,flag);
        //flag[0]=1'b0;
        //flag[1]=1'b1;
        key=64'b1111111111111111111111111111111111111111111111111111111111111111;
//        key=64'b11111101010101011100001000000001100011100000001010101010101000001;
        memory[63:0]=64'b0010110101001011010010110100101101001011010101010011001111000011;
        memory[127:64]=64'b010101010101010101010101010101010101010101010101010101010101;
        memory[191:128]=64'b010101010101010101010101010101010101010101010101010101010101;
        memory[255:192]=64'b11111101010101011100001000000001100011100000001010101010101000001;
        memory[319:256]=64'b010101010101010101010101010101010101010101010101010101010101;
        memory[383:320]=64'b010101010101010101010101010101010101010101010101010101010101;
        memory[447:384]=64'b010101010101010101010101010101010101010101010101010101010101;
        memory[511:448]=64'b1111111111111111111111111111111111111111111111111111111111111111;
        memory[575:512]=64'b1111111111111111111111111111111111111111111111111111111111111111;
        s[0]=1'b1;
        s[1]=1'b0;
        s[2]=1'b0;
        s[3]=1'b0;
        s[4]=1'b0;
        s[5]=1'b0;
        s[6]=1'b0;
        s[7]=1'b0;
        s[8]=1'b0;
        s[9]=1'b0;
        
        
        
//        for (i=0;i<=8;i=i+1)
//        begin                     
//            @(negedge clk)
//            begin
//                mem[i]=t[i+2];
//                //s=st[i];
//                //we[i-1]=1'b0;
//                //we[i]=1'b1;
////                $fwrite(file, "%d\n", mem[i]);
//            end
//        end
        //we=1'b0;
                
end
        
initial begin
clk=0;
//rst=0;
//we=9'b0;
//we[0]=1;

//    din=0;
//#5000 we=0; 
//    #120 address=4'd2;    
//    #130 address=4'd3;    
//    #140 address=4'd4;    
//    #150 address=4'd25;
//#160 address=5'd28;

end
//always #1 rst=0;
//always #100 we=~we;
always #1 clk=~clk;


initial
begin
//#50 we=9'b0;
//#2500 $fdisplay(file);

end
initial


#50000 $stop;

endmodule
