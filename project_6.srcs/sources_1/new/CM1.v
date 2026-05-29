`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2023 12:13:51
// Design Name: 
// Module Name: CM1
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


module CM1(clk, rst, s, key, memory, dout, d);//,d1,d2,d3,d11,d12,d21,d22,d31,d32, sb1,mb1, sb11,mb11,sb12,mb12,sb13,mb13, sb111,mb111, sb112,mb112,sb121,mb121,sb122,mb122,sb131,mb131,sb132,mb132);
input clk,rst;
input [9:0]s;
output [3:0]dout;
output d;
//input [3:0] tempd;
reg [1:0]flag;
//wire d1,d2,d3,d11,d12,d21,d22,d31,d32;
//wire sb1,mb1, sb11,mb11,sb12,mb12,sb13,mb13, sb111,mb111, sb112,mb112,sb121,mb121,sb122,mb122,sb131,mb131,sb132,mb132;
wire y;
wire dout1,dout2,dout3;
wire dout11,dout12,dout21,dout22,dout31,dout32;
input [575:0]memory;
input [63:0]key;
assign y=1'b0;


always@*
begin
   flag[0]=1'b0;
   flag[1]=1'b1;
end
 
Cellr cr(d1,d2,d3,clk,rst,s[0],key,dout,d,flag);//b1,mb1);

Cell c1(d11,d,d12,clk,rst,s[1],memory[63:0],dout1,d1,flag);//,sb11,mb11);

Cell c2(d21,d,d22,clk,rst,s[2],memory[127:64],dout2,d2,flag);//,sb12,mb12);

Cell c3(d31,d,d32,clk,rst,s[3],memory[191:128],dout3,d3,flag);//,sb13,mb13);


Cell c11(y,d1,y,clk,rst,s[4],memory[255:192],dout11,d11,flag);//,sb111,mb111);
Cell c12(y,d1,y,clk,rst,s[5],memory[319:256],dout12,d12,flag);//,sb112,mb112);

Cell c21(y,d2,y,clk,rst,s[6],memory[383:320],dout21,d21,flag);//,sb121,mb121);
Cell c22(y,d2,y,clk,rst,s[7],memory[447:384],dout22,d22,flag);//,sb122,mb122);

Cell c31(y,d3,y,clk,rst,s[8],memory[511:448],dout31,d31,flag);//,sb131,mb131);
Cell c32(y,d3,y,clk,rst,s[9],memory[575:512],dout32,d32,flag);//,sb132,mb132);

endmodule



module Cellr(l,p,r,clk,rst,s,mem,dout,d,flag);//,sb,mb);
    input l,p,r;
    input [63:0]mem;

    input clk,rst,s;
     reg sb;
     reg mb;
    output reg d;
    output reg [63:0]dout;
    //input [3:0]din;
    //reg [3:0]mem;
    input [1:0]flag;
    reg [1:0]f;
    
    wire I0,I1,I2,I3,I4;
    wire  q00,q01,clear;
    //wire [7:0] Q;
    //wire I00,I01,I02,I03,I04,I05,I06,I07,clear0;
    wire df,dg;//D0,D1,
    wire Q0,Dtemp1,Dtemp2;
    wire x1,x2,x3,x4;
    wire sync1, sync2, sync3, sync4;
    integer i=0;
    reg d0,d1;
    
    always@*
        begin
            d0<=df;
            d1<=dg;
        end
//    always
//        begin
//            f<=flag;
//        end
    
//    initial
//    begin
//        d=s;
//    end
    FGr FG1r(f[0],f[1],d,mem[i],clk,rst,x1,x2);
    GGr GG2r(f[0],f[1],d,clk,rst,x3,x4);//m,s,clk,reset,mout,sout
    Fr F1r(p,l,r,d,f[0],df);
    
    Gr G1r(p,l,r,d,f[0],dg);
    
    //assign Dtemp1=D0&~sync;
    //assign Dtemp2=D1&sync;
    //assign D=Dtemp1 | Dtemp2;
    
    //assign Out1=Q0;
    //assign sync1=x1&~sync;
    //assign sync2=x2&~sync;
    //assign sync3=x3&sync;
    //assign sync4=x4&sync;
    //assign I0=sync1 | sync3;
    //assign I1=sync2 | sync4;
    
    initial
    begin
         d<=s;
         f<=flag;
    end
    always@(posedge clk)
        begin
            i=i+1;
            dout<=mem;
             if (i<=67)
               begin
                  d = d0;//df;
                  f[0] = x1;
                  f[1] = x2;
               end 
             else
               begin           
                  d = d1;
                  f[0]=x3;
                  f[1]=x4;
               end
         end
         
    always@(posedge clk)
    begin
        sb=f[0];
        mb=f[1];
    end
         
         
endmodule

module Fr(p, l, r, self, s, out);
    input l, r, p, self, s;
    output reg out;
    always @*
    begin 
        out = s;
    end
endmodule

module Gr(p, l, r, self, s, out);
    input l, r, p, self, s;
     output reg out;
     always @*
    begin 
        out = self | l | r | p;
    end
endmodule


module FGr(s,m, self, qr, clk,reset, s0, m0);
    input s, m,self, qr,clk,reset;
    output reg s0;
    output reg m0;
    wire t1, t2;
//    assign s0 = qr;
    
    always @(posedge clk)
    begin
        if (qr == 1)
            begin
                s0 = 1;
                if (m==0)
                begin
                    m0=0;
                end
                else
                begin
                    if (qr == self)
                        m0=1;
                    else 
                        m0=0; 
                end                 
                    
            end 
        else
            begin
                s0 = 0;
                
               if (m==0)
                begin
                    m0=0;
                end
                else
                begin
                    if (qr == self)
                        m0=1;
                    else 
                        m0=0; 
                end 
            end
    end
    
//    always @(posedge clk)
//    begin
//        if (qr ==1 | qr ==0)
//            m0 <= qr ^ ~self; // Equivalent to m0 <= qr ^ ~self;
//        else
//           m0=1'b1;
//    end
endmodule

module GGr(s,m,self,clk,reset,mout,sout);
    input s,m,self,clk,reset;
    output reg sout;
    output reg mout;
    always @(posedge clk)
    begin	//Positive edge triggered DFF
		
		sout <= m;
		mout <=1'b0;
		
    end
	always@(~reset) 
	begin   //active LOW reset
		mout <= 1'b0;
		//sout <= 1'b0;
	end
//    assign t1 = qr & self;
//    assign t2 = (~qr) | (~self);
//    assign m = t1 | t2;        
endmodule

module Cell(l,p,r,clk,rst,s,mem,dout,d,flag);//,sb,mb);
    input l,p,r;
    input [63:0]mem;

    input clk,rst,s;
     reg sb;
     reg mb;
    output reg d;
    output reg [63:0]dout;
    //input [3:0]din;
    
    //reg [1:0]f1;
    //wire [1:0]f11;
    input [1:0]flag;
    reg [1:0]f;
    
    wire I0,I1,I2,I3,I4;
    wire  q00,q01,clear;
    wire df,dg;//D0,D1,
    wire Q0,Dtemp1,Dtemp2;
    wire x1,x2,x3,x4;
    wire sync1, sync2, sync3, sync4;
    integer i=0,j=0;
    reg d0,d1;
    
    always@*
        begin
            d0<=df;
            d1<=dg;
           
        end
    FG FG1(f[0],f[1],d,mem[i],clk,rst,x1,x2);
    GG GG2(f[0],f[1],d,clk,rst,x3,x4);//m,s,clk,reset,mout,sout
    F F1(p,l,r,d,f[0],df);
    
    G G1(clk,p,l,r,d,f[0],f[1],dg);  
    
   
    initial
    begin
         d<=s;
         f<=flag;
          //f1[0]=0;
          //f1[0]=0;
    end
    always@(posedge clk)
        begin
             
            i=i+1;
            dout<=mem;
             if (i<=67)
               begin
                  d = d0;//df;
                  f[0] = x1;
                  if (f[1] != x2)
                  begin
                    j=j+1;
                  end
                  if (j<=1)
                  begin
                    f[1] = x2;  
                  end
                  else
                    f[1]=0;
                  
                  //f1=f11;
               end 
               
             else
               begin           
                  d = d1;//dg;
                  f[0]=x3;
                  if (i==68)
                    f[1]=x4;
                  else
                    f[1]=0;
               end
         end
         
    always@(posedge clk)
    begin
        sb=f[0];
        mb=f[1];

    end
    
   
     
endmodule

module F(p, l, r, self, s, out);
    input l, r, p, self, s;
    output reg out;  
    always @*
    begin 
        out = p;
    end
endmodule

module FG(s,m,self,qr,clk,reset,s0,m0);
    input s,self, qr,m,clk,reset;
    
    output reg s0;
    output reg m0;
    initial
        begin
            assign s0 = s | self;
            //m0=1;
          
        end
     
    always @(posedge clk)
    begin
//        if (self==1'bX)
//        begin
//            assign s0 = s;
////            if (m==0)
////                m0=0;
////            else 
//            m0=1;         
//        end
//        else
     
//            if (m & s)
//                begin
//            if (qr == 1 | qr == 0)
       // begin
        if (qr === 1'b1 || qr === 1'b0)
               if (self === qr)
                 begin
                      if (m === 0)
                      begin
                        //f11[0]=f1[0]+1;
                      end
                       
                      m0=1;
                 end
               else
                   begin
                      if (m === 1)
                      begin
                        //f12=f12+1;
                      end
                      m0=0;
                      //f12=1;
                   end
               
        else
        begin
        if (m === 1)
            m0=1;
        else
            m0=0;
//         //if (f11<=1)
//         begin
//           //if (f12 < 2)
//                m0=1;
//            else
//                m0=0;
//         end
         //else
          //m0=f11;
          //
         //begin & f12 === 0)
//                begin
//                if (m === 1 && f12 === 0)
//                    m0=1;
                 
//                end
//             else
               
                    
//            if (f11 === 1)
//                begin
//                if (m === 1 && f12 === 0)
//                    m0=1;
                 
//                end
//             else
//                m0=0;
                
           //if (self)
             //   m0=1;
           //else   
           //begin  
               //if (self === qr)
                //    m0=1;
               //else
                //    m0=0;
           //end
           
         end
         
                //m0<=self;
//           if (m==0)
//                begin
//                    m0=0;
//                end
//            else
//                begin
//                    if (qr != self)
//                       begin
//                         m0=0;
//                       end
//                    else 
//                        begin
//                        if (qr == self)
//                           m0=1; 
//                        else
//                            m0=0;
//                        end
//                end 
////                end
                        
//                       begin
//                            m0 <= qr ^ ~self; // Equivalent to m0 <= qr ^ ~self;
//                       end
//                    else
//                        begin
//                             m0<=1'b1;
//                        end
                      
//                end           
//            else
//                if (m==0)
//                    m0=0;
//                else 
//                    m0<=1;
//        assign s0 = s | self;
       
           
    end

endmodule

module G(clk, p, l, r, self, s,m, out);
    input clk,l, r, p, self, s,m;
    output reg out;
    always@(posedge clk)
    begin 
        out = l | r | m;
    end
endmodule

module GG(s,m,self,clk,reset,mout,sout);
    input s,m,self,clk,reset;
    output reg sout;
    output reg mout;
    wire t1,t2;
    
    always@(negedge clk)
    begin	//Positive edge triggered DFF
		sout <= m;
		mout <=1'b0;
    end
	always@(~reset) 
	begin   //active LOW reset
		mout <= 1'b0;
		sout <= 1'b0;
	end
//    assign t1 = qr & self;
//    assign t2 = (~qr) | (~self);
//    assign m = t1 | t2;        
endmodule
