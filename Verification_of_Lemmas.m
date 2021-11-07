(* ::Package:: *)

(* ::Input:: *)
(*(*The code below verifies Lemmas 4.2, 4.3, 6.1 of Good elliptic curves with a specified torsion subgroup. We start by defining the quantities A_T, B_T, D_T, \hat{D}_T, f_t, g_t, h_T, and z_T. We use the following naming convention: If T=C_N (resp. C_2 \times C_{2N}), then we write X_T has XN (resp. X2N) for X =/= \hat{D}. For \hat{D}_T, we use the name naming convention, but write instead DhN or Dh2N. *)*)


(* ::Input:: *)
(*A1[a_,b_]=(a^3 - 3*a^2*b - 6*a*b^2 - b^3) * (a^9 - 225*a^8*b - 855*a^7*b^2 - 1866*a^6*b^3 - 2844*a^5*b^4 - 3123*a^4*b^5 - 2265*a^3*b^6 - 981*a^2*b^7 - 234*a*b^8 - b^9);*)
(*A2[a_,b_]=a^16 - 240*a^15*b + 2152*a^14*b^2 - 5040*a^13*b^3 + 4572*a^12*b^4 + 1680*a^11*b^5 - 3112*a^10*b^6 + 6480*a^9*b^7 - 6970*a^8*b^8 - 6480*a^7*b^9 - 3112*a^6*b^10 - 1680*a^5*b^11 + 4572*a^4*b^12 + 5040*a^3*b^13 + 2152*a^2*b^14 + 240*a*b^15 + b^16;*)
(*A3[a_,b_]=(a^3 - 3*a^2*b - 6*a*b^2 - b^3) * (a^3 + 3*a^2*b - b^3) * (a^6 + 12*a^5*b + 69*a^4*b^2 + 88*a^3*b^3 + 24*a^2*b^4 - 6*a*b^5 + b^6);*)
(*A4[a_,b_]=(a^4 - 2*a^3*b - 2*a*b^3 + b^4) * (a^12 - 6*a^11*b + 12*a^10*b^2 - 14*a^9*b^3 + 243*a^8*b^4 - 468*a^7*b^5 + 456*a^6*b^6 - 468*a^5*b^7 + 243*a^4*b^8 - 14*a^3*b^9 + 12*a^2*b^10 - 6*a*b^11 + b^12);*)
(*A5[a_,b_]=1152921504606846976*b^80 - 422212465065984*b^60 + 15032385536*b^40 + 393216*b^20 + 1;*)
(*A6[a_,b_]=(a^4 + 4*a^3*b - 6*a^2*b^2 + 4*a*b^3 + b^4) * (a^12 - 12*a^11*b + 78*a^10*b^2 - 188*a^9*b^3 + 111*a^8*b^4 + 264*a^7*b^5 - 444*a^6*b^6 + 264*a^5*b^7 + 111*a^4*b^8 - 188*a^3*b^9 + 78*a^2*b^10 - 12*a*b^11 + b^12);*)
(*A7[a_,b_]=(a^2 + a*b + b^2) * (a^6 + 11*a^5*b + 30*a^4*b^2 + 15*a^3*b^3 - 10*a^2*b^4 - 5*a*b^5 + b^6);*)
(*A8[a_,b_]=a^16 - 8*a^14*b^2 + 12*a^12*b^4 + 8*a^10*b^6 - 10*a^8*b^8 + 8*a^6*b^10 + 12*a^4*b^12 - 8*a^2*b^14 + b^16;*)
(*A9[a_,b_]=(a^3 + 3*a^2*b - b^3) * (a^9 + 9*a^8*b + 27*a^7*b^2 + 48*a^6*b^3 + 54*a^5*b^4 + 45*a^4*b^5 + 27*a^3*b^6 + 9*a^2*b^7 - b^9);*)
(*A10[a_,b_]=(1/16) * (a^12 + 16*a^11*b + 104*a^10*b^2 + 360*a^9*b^3 + 720*a^8*b^4 + 816*a^7*b^5 + 416*a^6*b^6 - 96*a^5*b^7 - 240*a^4*b^8 - 80*a^3*b^9 + 64*a^2*b^10 + 64*a*b^11 + 16*b^12);*)
(*A12[a_,b_]=(a^4 - 2*a^3*b - 2*a*b^3 + b^4) * (a^12 - 6*a^11*b + 12*a^10*b^2 - 14*a^9*b^3 + 3*a^8*b^4 + 12*a^7*b^5 - 24*a^6*b^6 + 12*a^5*b^7 + 3*a^4*b^8 - 14*a^3*b^9 + 12*a^2*b^10 - 6*a*b^11 + b^12);*)
(*A22[a_,b_]=a^16 + 232*a^14*b^2 + 732*a^12*b^4 - 1192*a^10*b^6 + 710*a^8*b^8 - 1192*a^6*b^10 + 732*a^4*b^12 + 232*a^2*b^14 + b^16;*)
(*A24[a_,b_]=(a^8 - 4*a^7*b + 4*a^6*b^2 + 28*a^5*b^3 + 6*a^4*b^4 - 28*a^3*b^5 + 4*a^2*b^6 + 4*a*b^7 + b^8) * (a^8 + 4*a^7*b + 4*a^6*b^2 - 28*a^5*b^3 + 6*a^4*b^4 + 28*a^3*b^5 + 4*a^2*b^6 - 4*a*b^7 + b^8);*)
(*A26[a_,b_]=(a^4 - 2*a^3*b + 6*a^2*b^2 - 2*a*b^3 + b^4) * (a^12 - 6*a^11*b + 6*a^10*b^2 + 10*a^9*b^3 + 15*a^8*b^4 - 36*a^7*b^5 + 84*a^6*b^6 - 36*a^5*b^7 + 15*a^4*b^8 + 10*a^3*b^9 + 6*a^2*b^10 - 6*a*b^11 + b^12);*)
(*A28[a_,b_]=a^16 - 8*a^14*b^2 + 12*a^12*b^4 + 8*a^10*b^6 + 230*a^8*b^8 + 8*a^6*b^10 + 12*a^4*b^12 - 8*a^2*b^14 + b^16;*)
(*B1[a_,b_]=(-1) * (a^18 + 522*a^17*b - 8433*a^16*b^2 - 56382*a^15*b^3 - 174843*a^14*b^4 - 433494*a^13*b^5 - 1084008*a^12*b^6 - 2541474*a^11*b^7 - 4836168*a^10*b^8 - 7036328*a^9*b^9 - 7787457*a^8*b^10 - 6599304*a^7*b^11 - 4265121*a^6*b^12 - 2050470*a^5*b^13 - 692973*a^4*b^14 - 148722*a^3*b^15 - 17154*a^2*b^16 - 504*a*b^17 + b^18);*)
(*B2[a_,b_]=(-1) * (a^8 - 24*a^7*b + 20*a^6*b^2 - 24*a^5*b^3 - 26*a^4*b^4 + 24*a^3*b^5 + 20*a^2*b^6 + 24*a*b^7 + b^8) * (a^16 + 528*a^15*b - 3992*a^14*b^2 + 11088*a^13*b^3 - 7716*a^12*b^4 - 3696*a^11*b^5 + 3032*a^10*b^6 - 14256*a^9*b^7 + 17606*a^8*b^8 + 14256*a^7*b^9 + 3032*a^6*b^10 + 3696*a^5*b^11 - 7716*a^4*b^12 - 11088*a^3*b^13 - 3992*a^2*b^14 - 528*a*b^15 + b^16);*)
(*B3[a_,b_]=(-1) * (a^6 + 12*a^5*b + 15*a^4*b^2 - 20*a^3*b^3 - 30*a^2*b^4 - 6*a*b^5 + b^6) * (a^12 + 6*a^11*b + 48*a^10*b^2 + 428*a^9*b^3 + 1899*a^8*b^4 + 3636*a^7*b^5 + 3030*a^6*b^6 + 720*a^5*b^7 - 288*a^4*b^8 - 58*a^3*b^9 + 48*a^2*b^10 + 6*a*b^11 + b^12);*)
(*B4[a_,b_]=(-1) * (a^8 - 4*a^7*b + 28*a^6*b^2 - 52*a^5*b^3 + 46*a^4*b^4 - 52*a^3*b^5 + 28*a^2*b^6 - 4*a*b^7 + b^8) * (a^16 - 8*a^15*b + 104*a^13*b^3 - 220*a^12*b^4 + 216*a^11*b^5 - 728*a^10*b^6 + 1144*a^9*b^7 - 1026*a^8*b^8 + 1144*a^7*b^9 - 728*a^6*b^10 + 216*a^5*b^11 - 220*a^4*b^12 + 104*a^3*b^13 - 8*a*b^15 + b^16);*)
(*B5[a_,b_]=(-1) * (8*b^4 - 4*b^2 + 1) * (8*b^4 + 4*b^2 + 1) * (4096*b^16 - 2048*b^14 + 512*b^12 - 64*b^8 + 8*b^4 - 4*b^2 + 1) * (4096*b^16 + 2048*b^14 + 512*b^12 - 64*b^8 + 8*b^4 + 4*b^2 + 1) * (1152921504606846976*b^80 - 633318697598976*b^60 + 79456894976*b^40 + 589824*b^20 + 1);*)
(*B6[a_,b_]=(-1) * (a^8 - 4*a^7*b + 4*a^6*b^2 + 20*a^5*b^3 - 26*a^4*b^4 + 20*a^3*b^5 + 4*a^2*b^6 - 4*a*b^7 + b^8) * (a^16 - 8*a^15*b + 24*a^14*b^2 - 568*a^13*b^3 + 2684*a^12*b^4 - 4776*a^11*b^5 + 2344*a^10*b^6 + 4840*a^9*b^7 - 8826*a^8*b^8 + 4840*a^7*b^9 + 2344*a^6*b^10 - 4776*a^5*b^11 + 2684*a^4*b^12 - 568*a^3*b^13 + 24*a^2*b^14 - 8*a*b^15 + b^16);*)
(*B7[a_,b_]=(-1) * (a^12 + 18*a^11*b + 117*a^10*b^2 + 354*a^9*b^3 + 570*a^8*b^4 + 486*a^7*b^5 + 273*a^6*b^6 + 222*a^5*b^7 + 174*a^4*b^8 + 46*a^3*b^9 - 15*a^2*b^10 - 6*a*b^11 + b^12);*)
(*B8[a_,b_]=(-1) * (a^8 - 4*a^6*b^2 - 2*a^4*b^4 - 4*a^2*b^6 + b^8) * (a^16 - 8*a^14*b^2 + 12*a^12*b^4 + 8*a^10*b^6 - 34*a^8*b^8 + 8*a^6*b^10 + 12*a^4*b^12 - 8*a^2*b^14 + b^16);*)
(*B9[a_,b_]=(-1) * (a^18 + 18*a^17*b + 135*a^16*b^2 + 570*a^15*b^3 + 1557*a^14*b^4 + 2970*a^13*b^5 + 4128*a^12*b^6 + 4230*a^11*b^7 + 3240*a^10*b^8 + 2032*a^9*b^9 + 1359*a^8*b^10 + 1080*a^7*b^11 + 735*a^6*b^12 + 306*a^5*b^13 + 27*a^4*b^14 - 42*a^3*b^15 - 18*a^2*b^16 + b^18);*)
(*B10[a_,b_]=(-1/64) * (a^2 + 2*a*b + 2*b^2) * (a^4 + 6*a^3*b + 6*a^2*b^2 - 4*a*b^3 - 4*b^4) * (a^4 + 6*a^3*b + 12*a^2*b^2 + 8*a*b^3 + 2*b^4) * (a^8 + 10*a^7*b + 32*a^6*b^2 + 40*a^5*b^3 + 14*a^4*b^4 + 8*a^2*b^6 - 4*b^8);*)
(*B12[a_,b_]=(-1) * (a^8 - 4*a^7*b + 4*a^6*b^2 - 4*a^5*b^3 - 2*a^4*b^4 - 4*a^3*b^5 + 4*a^2*b^6 - 4*a*b^7 + b^8) * (a^16 - 8*a^15*b + 24*a^14*b^2 - 40*a^13*b^3 + 44*a^12*b^4 - 24*a^11*b^5 - 32*a^10*b^6 + 88*a^9*b^7 - 114*a^8*b^8 + 88*a^7*b^9 - 32*a^6*b^10 - 24*a^5*b^11 + 44*a^4*b^12 - 40*a^3*b^13 + 24*a^2*b^14 - 8*a*b^15 + b^16);*)
(*B22[a_,b_]=(-1) * (a^8 + 20*a^6*b^2 - 26*a^4*b^4 + 20*a^2*b^6 + b^8) * (a^8 - 24*a^7*b + 20*a^6*b^2 - 24*a^5*b^3 - 26*a^4*b^4 + 24*a^3*b^5 + 20*a^2*b^6 + 24*a*b^7 + b^8) * (a^8 + 24*a^7*b + 20*a^6*b^2 + 24*a^5*b^3 - 26*a^4*b^4 - 24*a^3*b^5 + 20*a^2*b^6 - 24*a*b^7 + b^8);*)
(*B24[a_,b_]=(-1) * (a^4 - 4*a^3*b - 6*a^2*b^2 + 4*a*b^3 + b^4) * (a^4 + 4*a^3*b - 6*a^2*b^2 - 4*a*b^3 + b^4) * (a^8 - 4*a^6*b^2 + 22*a^4*b^4 - 4*a^2*b^6 + b^8) * (a^8 + 20*a^6*b^2 - 26*a^4*b^4 + 20*a^2*b^6 + b^8);*)
(*B26[a_,b_]=(-1) * (a^8 - 4*a^7*b + 4*a^6*b^2 - 28*a^5*b^3 + 22*a^4*b^4 - 28*a^3*b^5 + 4*a^2*b^6 - 4*a*b^7 + b^8) * (a^8 - 4*a^7*b + 4*a^6*b^2 - 4*a^5*b^3 - 2*a^4*b^4 - 4*a^3*b^5 + 4*a^2*b^6 - 4*a*b^7 + b^8) * (a^8 - 4*a^7*b + 4*a^6*b^2 + 20*a^5*b^3 - 26*a^4*b^4 + 20*a^3*b^5 + 4*a^2*b^6 - 4*a*b^7 + b^8);*)
(*B28[a_,b_]=(-1) * (a^8 - 4*a^6*b^2 - 26*a^4*b^4 - 4*a^2*b^6 + b^8) * (a^8 - 4*a^6*b^2 - 2*a^4*b^4 - 4*a^2*b^6 + b^8) * (a^8 - 4*a^6*b^2 + 22*a^4*b^4 - 4*a^2*b^6 + b^8);*)
(*D1[a_,b_]=(-1) * b * a * (a + b) * (a^2 + a*b + b^2)^3 * (a^3 + 6*a^2*b + 3*a*b^2 - b^3)^9;*)
(*D2[a_,b_]=(-1) * b * a * (a - b) * (a + b) * (a^2 + b^2)^2 * (a^2 - 2*a*b - b^2)^4 * (a^2 + 2*a*b - b^2)^16;*)
(*D3[a_,b_]=(-1) * b^3 * a^3 * (a + b)^3 * (a^2 + a*b + b^2)^9 * (a^3 + 6*a^2*b + 3*a*b^2 - b^3)^3;*)
(*D4[a_,b_]=(a - b)^2 * b^4 * a^4 * (a + b)^6 * (a^2 + b^2) * (a^2 - 4*a*b + b^2)^3 * (a^2 - a*b + b^2)^12;*)
(*D5[a_,b_]=(2^75) * b^100 * (64*b^8 - 8*b^4 - 1) * (4096*b^16 - 1024*b^12 + 256*b^8 - 24*b^4 + 1) * (4096*b^16 + 1536*b^12 + 256*b^8 + 16*b^4 + 1);*)
(*D6[a_,b_]=(a + b)^2 * b^3 * a^3 * (a - b)^6 * (a^2 - a*b + b^2) * (a^2 - 4*a*b + b^2)^4 * (a^2 + b^2)^12;*)
(*D7[a_,b_]=(-1) * b^7 * a^7 * (a + b)^7 * (a^3 + 8*a^2*b + 5*a*b^2 - b^3);*)
(*D8[a_,b_]=(a - b)^4 * (a + b)^4 * b^16 * a^16 * (a^2 - 2*a*b - b^2) * (a^2 + 2*a*b - b^2) * (a^2 + b^2)^2;*)
(*D9[a_,b_]=(-1) * b^9 * a^9 * (a + b)^9 * (a^2 + a*b + b^2)^3 * (a^3 + 6*a^2*b + 3*a*b^2 - b^3);*)
(*D10[a_,b_]=(1/4096) * a^5 * (a + 2*b)^5 * b^10 * (a + b)^10 * (a^2 + 6*a*b + 4*b^2) * (a^2 + a*b - b^2)^2;*)
(*D12[a_,b_]=(a + b)^2 * (a - b)^6 * b^12 * a^12 * (a^2 - 4*a*b + b^2) * (a^2 + b^2)^3 * (a^2 - a*b + b^2)^4;*)
(*D22[a_,b_]=b^2 * a^2 * (a - b)^2 * (a + b)^2 * (a^2 + b^2)^4 * (a^2 - 2*a*b - b^2)^8 * (a^2 + 2*a*b - b^2)^8;*)
(*D24[a_,b_]=b^4 * a^4 * (a - b)^4 * (a + b)^4 * (a^2 - 2*a*b - b^2)^4 * (a^2 + 2*a*b - b^2)^4 * (a^2 + b^2)^8;*)
(*D26[a_,b_]=(a + b)^4 * b^6 * a^6 * (a - b)^12 * (a^2 - 4*a*b + b^2)^2 * (a^2 - a*b + b^2)^2 * (a^2 + b^2)^6;*)
(*D28[a_,b_]=b^8 * a^8 * (a - b)^8 * (a + b)^8 * (a^2 - 2*a*b - b^2)^2 * (a^2 + 2*a*b - b^2)^2 * (a^2 + b^2)^4;*)
(*Dh1[a_,b_]=(-1)* (a + b) * (a^2 + a*b + b^2) * (a^3 + 6*a^2*b + 3*a*b^2 - b^3);*)
(*Dh2[a_,b_]=(-1)* (a - b) * (a + b) * (a^2 + b^2) * (a^2 - 2*a*b - b^2) * (a^2 + 2*a*b - b^2);*)
(*Dh3[a_,b_]=(-1)* (a + b) * (a^2 + a*b + b^2) * (a^3 + 6*a^2*b + 3*a*b^2 - b^3);*)
(*Dh4[a_,b_]=(-1)* (a + b) * (a - b) * (a^2 + b^2) * (a^2 - 4*a*b + b^2) * (a^2 - a*b + b^2);*)
(*Dh5[a_,b_]=(2/5) * (64*b^8 - 8*b^4 - 1) * (4096*b^16 - 1024*b^12 + 256*b^8 - 24*b^4 + 1) * (4096*b^16 + 1536*b^12 + 256*b^8 + 16*b^4 + 1);*)
(*Dh6[a_,b_]=(-1)* (a + b) * (a - b) * (a^2 + b^2) * (a^2 - 4*a*b + b^2) * (a^2 - a*b + b^2);*)
(*Dh7[a_,b_]=(-1) * (a + b) * (a^3 + 8*a^2*b + 5*a*b^2 - b^3);*)
(*Dh8[a_,b_]=(-1)* (a - b) * (a + b) * (a^2 + b^2) * (a^2 - 2*a*b - b^2) * (a^2 + 2*a*b - b^2);*)
(*Dh9[a_,b_]=(-1)* (a + b) * (a^2 + a*b + b^2) * (a^3 + 6*a^2*b + 3*a*b^2 - b^3);*)
(*Dh10[a_,b_]=(-1/8) * (a + b) * (a + 2*b) *  (a^2 + 6*a*b + 4*b^2) * (a^2 + a*b - b^2);*)
(*Dh12[a_,b_]=(-1)* (a + b) * (a - b) * (a^2 + b^2) * (a^2 - 4*a*b + b^2) * (a^2 - a*b + b^2);*)
(*Dh22[a_,b_]=(-1)* (a - b) * (a + b) * (a^2 + b^2) * (a^2 - 2*a*b - b^2) * (a^2 + 2*a*b - b^2);*)
(*Dh24[a_,b_]=(-1)* (a - b) * (a + b) * (a^2 + b^2) * (a^2 - 2*a*b - b^2) * (a^2 + 2*a*b - b^2);*)
(*Dh26[a_,b_]=(-1)* (a + b) * (a - b) * (a^2 + b^2) * (a^2 - 4*a*b + b^2) * (a^2 - a*b + b^2);*)
(*Dh28[a_,b_]=(-1)* (a - b) * (a + b) * (a^2 + b^2) * (a^2 - 2*a*b - b^2) * (a^2 + 2*a*b - b^2);*)
(*f3[x_]=B3[1,x]^2/(1728*D3[1,x])-x;*)
(*f4[x_]=B4[1,x]^2/(1728*D4[1,x])-x;*)
(*f6[x_]=B6[1,x]^2/(1728*D6[1,x])-x;*)
(*f7[x_]=B7[1,x]^2/(1728*D7[1,x])-x;*)
(*f8[x_]=B8[1,x]^2/(1728*D8[1,x])-x;*)
(*f9[x_]=B9[1,x]^2/(1728*D9[1,x])-x;*)
(*f10[x_]=B10[1,x]^2/(1728*D10[1,x])-x;*)
(*f12[x_]=B12[1,x]^2/(1728*D12[1,x])-x;*)
(*f22[x_]=B22[1,x]^2/(1728*D22[1,x])-x;*)
(*f24[x_]=B24[1,x]^2/(1728*D24[1,x])-x;*)
(*f26[x_]=B26[1,x]^2/(1728*D26[1,x])-x;*)
(*f28[x_]=B28[1,x]^2/(1728*D28[1,x])-x;*)
(*g3[x_]=A3[1,x]^2+B3[1,x]*Dh3[1,x];*)
(*g4[x_]=A4[1,x]^2+B4[1,x]*Dh4[1,x];*)
(*g6[x_]=A6[1,x]^2+B6[1,x]*Dh6[1,x];*)
(*g7[x_]=A7[1,x]^2+B7[1,x]*Dh7[1,x];*)
(*g8[x_]=A8[1,x]^2+B8[1,x]*Dh8[1,x];*)
(*g9[x_]=A9[1,x]^2+B9[1,x]*Dh9[1,x];*)
(*g10[x_]=A10[1,x]^2+B10[1,x]*Dh10[1,x];*)
(*g12[x_]=A12[1,x]^2+B12[1,x]*Dh12[1,x];*)
(*g22[x_]=A22[1,x]^2+B22[1,x]*Dh22[1,x];*)
(*g24[x_]=A24[1,x]^2+B24[1,x]*Dh24[1,x];*)
(*g26[x_]=A26[1,x]^2+B26[1,x]*Dh26[1,x];*)
(*g28[x_]=A28[1,x]^2+B28[1,x]*Dh28[1,x];*)
(*h1[x_]=A1[1,x]^3-Dh1[1,x]^6;*)
(*h2[x_]=A2[1,x]^3-Dh2[1,x]^6;*)
(*h3[x_]=A3[1,x]^3-Dh3[1,x]^6;*)
(*h4[x_]=A4[1,x]^3-Dh4[1,x]^6;*)
(*h5[x_]=A5[1,x]^3-Dh5[1,x]^6;*)
(*h6[x_]=A6[1,x]^3-Dh6[1,x]^6;*)
(*h7[x_]=A7[1,x]^3-Dh7[1,x]^6;*)
(*h8[x_]=A8[1,x]^3-Dh8[1,x]^6;*)
(*h9[x_]=A9[1,x]^3-Dh9[1,x]^6;*)
(*h10[x_]=A10[1,x]^3-Dh10[1,x]^6;*)
(*h12[x_]=A12[1,x]^3-Dh12[1,x]^6;*)
(*h22[x_]=A22[1,x]^3-Dh22[1,x]^6;*)
(*h24[x_]=A24[1,x]^3-Dh24[1,x]^6;*)
(*h26[x_]=A26[1,x]^3-Dh26[1,x]^6;*)
(*h28[x_]=A28[1,x]^3-Dh28[1,x]^6;*)
(*z1[x_]=Max[Abs[A1[1,x]^3],B1[1,x]^2]-Dh1[1,x]^6;*)
(*z2[x_]=Max[Abs[A2[1,x]^3],B2[1,x]^2]-Dh2[1,x]^6;*)
(*z3[x_]=Max[Abs[A3[1,x]^3],B3[1,x]^2]-Dh3[1,x]^6;*)
(*z4[x_]=Max[Abs[A4[1,x]^3],B4[1,x]^2]-Dh4[1,x]^6;*)
(*z6[x_]=Max[Abs[A6[1,x]^3],B6[1,x]^2]-Dh6[1,x]^6;*)
(*z7[x_]=Max[Abs[A7[1,x]^3],B7[1,x]^2]-Dh7[1,x]^6;*)
(*z8[x_]=Max[Abs[A8[1,x]^3],B8[1,x]^2]-Dh8[1,x]^6;*)
(*z9[x_]=Max[Abs[A9[1,x]^3],B9[1,x]^2]-Dh9[1,x]^6;*)
(*z10[x_]=Max[Abs[A10[1,x]^3],B10[1,x]^2]-Dh10[1,x]^6;*)
(*z12[x_]=Max[Abs[A12[1,x]^3],B12[1,x]^2]-Dh12[1,x]^6;*)
(*z22[x_]=Max[Abs[A22[1,x]^3],B22[1,x]^2]-Dh22[1,x]^6;*)
(*z24[x_]=Max[Abs[A24[1,x]^3],B24[1,x]^2]-Dh24[1,x]^6;*)
(*z26[x_]=Max[Abs[A26[1,x]^3],B26[1,x]^2]-Dh26[1,x]^6;*)
(*z28[x_]=Max[Abs[A28[1,x]^3],B28[1,x]^2]-Dh28[1,x]^6;*)


(* ::Input:: *)
(*(* We now consider each T separately. *)*)


(* ::Input:: *)
(*(*Case T=C_1. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]4.41147, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta1=Max[x /. NSolve[D1[1,x] == 0,x,Reals]];theta1*)
(*Max[Max[x /. NSolve[A1[1,x] == 0,x,Reals]],Max[x /. NSolve[Dh1[1,x] == 0,x,Reals]],Max[x /. NSolve[h1[x] == 0,x,Reals]]] <=theta1*)
(*{A1[1,5000]>0,D1[1,5000]>0,Dh1[1,5000]>0,h1[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_1. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T=0, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi1=Max[x /. NSolve[z1[x] == 0,x,Reals]];xi1*)
(*z1[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_2. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]2.41421, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta2=Max[x /. NSolve[D2[1,x] == 0,x,Reals]];theta2*)
(*Max[Max[x /. NSolve[A2[1,x] == 0,x,Reals]],Max[x /. NSolve[Dh2[1,x] == 0,x,Reals]],Max[x /. NSolve[h2[x] == 0,x,Reals]]] <=theta2*)
(*{A2[1,5000]>0,D2[1,5000]>0,Dh2[1,5000]>0,h2[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_2. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T=0, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi2=Max[x /. NSolve[z1[x] == 0,x,Reals]];xi2*)
(*z2[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_3. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]4.41147, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta3=Max[x /. NSolve[D3[1,x] == 0,x,Reals]];theta3*)
(*Max[Max[x /. NSolve[A3[1,x] == 0,x,Reals]],Max[x /. NSolve[Dh3[1,x] == 0,x,Reals]],Max[x /. NSolve[h3[x] == 0,x,Reals]]]<=theta3*)
(*{A3[1,5000]>0,D3[1,5000]>0,Dh3[1,5000]>0,h3[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_3. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]43.4033, (2) the greatest real root of g_T(x), \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta3=Max[x /. NSolve[f3[x] == 0,x,Reals]];delta3*)
(*Max[Max[x /. NSolve[g3[x] == 0,x,Reals]],Max[x /. NSolve[-B3[1,x] == 0,x,Reals]]]<=delta3*)
(*{f3[5000]>0,g3[5000]>0,-B3[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_3. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T\[TildeTilde]0.1686, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi3=Max[x /. NSolve[z3[x] == 0,x,Reals]];xi3*)
(*z3[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_4. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]3.73205, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta4=Max[x/. NSolve[D4[1,x]==0,x,Reals]];theta4*)
(*Max[Max[x/. NSolve[A4[1,x]==0,x,Reals]],Max[x/. NSolve[Dh4[1,x]==0,x,Reals]],Max[x/. NSolve[h4[x]==0,x,Reals]]]<=theta4*)
(*{A4[1,5000]>0,D4[1,5000]>0,Dh4[1,5000]>0,h4[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_4. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]13.5934, (2) the greatest real root of g_T(x), \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta4=Max[x/. NSolve[f4[x]==0,x,Reals]];delta4*)
(*Max[Max[x/. NSolve[g4[x]==0,x,Reals]],Max[x/. NSolve[-B4[1,x]==0,x,Reals]]]<=delta4*)
(*{f4[5000]>0,g4[5000]>0,-B4[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_4. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T=0, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi4=Max[x/. NSolve[z4[x]==0,x,Reals]];xi4*)
(*z4[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_5. We verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]0.0.67062, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta5=Max[x/. NSolve[D5[1,x]==0,x,Reals]];theta5*)
(*Max[Max[x/. NSolve[A5[1,x]==0,x,Reals]],Max[x/. NSolve[Dh5[1,x]==0,x,Reals]],Max[x/. NSolve[h5[x]==0,x,Reals]]]<=theta5*)
(*{A5[1,5000]>0,D5[1,5000]>0,Dh5[1,5000]>0,h5[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_6. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]3.73205, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta6=Max[x/. NSolve[D6[1,x]==0,x,Reals]];theta6*)
(*Max[Max[x/. NSolve[A6[1,x]==0,x,Reals]],Max[x/. NSolve[Dh6[1,x]==0,x,Reals]],Max[x/. NSolve[h6[x]==0,x,Reals]]]<=theta6*)
(*{A6[1,5000]>0,D6[1,5000]>0,Dh6[1,5000]>0,h6[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_6. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]43.3677, (2) the greatest real root of g_T(x), \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta6=Max[x/. NSolve[f6[x]==0,x,Reals]];delta6*)
(*Max[Max[x/. NSolve[g6[x]==0,x,Reals]],Max[x/. NSolve[-B6[1,x]==0,x,Reals]]]<=delta6*)
(*{f6[5000]>0,g6[5000]>0,-B6[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_6. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T=0, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi6=Max[x/. NSolve[z6[x]==0,x,Reals]];xi6*)
(*z6[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_7. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]6.2959, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta7=Max[x/. NSolve[D7[1,x]==0,x,Reals]];theta7*)
(*Max[Max[x/. NSolve[A7[1,x]==0,x,Reals]],Max[x/. NSolve[Dh7[1,x]==0,x,Reals]],Max[x/. NSolve[h7[x]==0,x,Reals]]]<=theta7*)
(*{A7[1,5000]>0,D7[1,5000]>0,Dh7[1,5000]>0,h7[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_7. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]7.07956, (2) the greatest real root of g_T(x), \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta7=Max[x/. NSolve[f7[x]==0,x,Reals]];delta7*)
(*Max[Max[x/. NSolve[g7[x]==0,x,Reals]],Max[x/. NSolve[-B7[1,x]==0,x,Reals]]]<=delta7*)
(*{f7[5000]>0,g7[5000]>0,-B7[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_7. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T\[TildeTilde]4.3444, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi7=Max[x/. NSolve[z7[x]==0,x,Reals]];xi7*)
(*z7[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_8. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]2.41421, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta8=Max[x/. NSolve[D8[1,x]==0,x,Reals]];theta8*)
(*Max[Max[x/. NSolve[A8[1,x]==0,x,Reals]],Max[x/. NSolve[Dh8[1,x]==0,x,Reals]],Max[x/. NSolve[h8[x]==0,x,Reals]]]<=theta8*)
(*{A8[1,5000]>0,D8[1,5000]>0,Dh8[1,5000]>0,h8[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_8. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]2.48383, (2) the greatest real root of g_T(x), \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta8=Max[x/. NSolve[f8[x]==0,x,Reals]];delta8*)
(*Max[Max[x/. NSolve[g8[x]==0,x,Reals]],Max[x/. NSolve[-B8[1,x]==0,x,Reals]]]<=delta8*)
(*{f8[5000]>0,g8[5000]>0,-B8[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_8. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T\[TildeTilde]2.0198, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi8=Max[x/. NSolve[z8[x]==0,x,Reals]];xi8*)
(*z8[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_9. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]4.41147, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta9=Max[x/. NSolve[D9[1,x]==0,x,Reals]];theta9*)
(*Max[Max[x/. NSolve[A9[1,x]==0,x,Reals]],Max[x/. NSolve[Dh9[1,x]==0,x,Reals]],Max[x/. NSolve[h9[x]==0,x,Reals]]]<=theta9*)
(*{A9[1,5000]>0,D9[1,5000]>0,Dh9[1,5000]>0,h9[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_9. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]4.75552, (2) the greatest real root of g_T(x), \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta9=Max[x/. NSolve[f9[x]==0,x,Reals]];delta9*)
(*Max[Max[x/. NSolve[g9[x]==0,x,Reals]],Max[x/. NSolve[-B9[1,x]==0,x,Reals]]]<=delta9*)
(*{f9[5000]>0,g9[5000]>0,-B9[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_9. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T\[TildeTilde]3.2938, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi9=Max[x/. NSolve[z9[x]==0,x,Reals]];xi9*)
(*z9[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_10. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]1.61803, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta10=Max[x/. NSolve[D10[1,x]==0,x,Reals]];theta10*)
(*Max[Max[x/. NSolve[A10[1,x]==0,x,Reals]],Max[x/. NSolve[Dh10[1,x]==0,x,Reals]],Max[x/. NSolve[h10[x]==0,x,Reals]]]<=theta10*)
(*{A10[1,5000]>0,D10[1,5000]>0,Dh10[1,5000]>0,h10[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_10. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]3.06311, (2) the greatest real root of g_T(x), \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta10=Max[x/. NSolve[f10[x]==0,x,Reals]];delta10*)
(*Max[Max[x/. NSolve[g10[x]==0,x,Reals]],Max[x/. NSolve[-B10[1,x]==0,x,Reals]]]<=delta10*)
(*{f10[5000]>0,g10[5000]>0,-B10[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_10. Lastly, we verify Lemma 6.1. The code below shows that z_T is a continuous function with no real roots. Since z_T(5000)>0, we conclude that z_T is positive throughout its domain *)*)
(*NSolve[z10[x]==0,x,Reals]*)
(*z10[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_12. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]3.73205, (2) the greatest real root of A_T(1,x), \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta12=Max[x/. NSolve[D12[1,x]==0,x,Reals]];theta12*)
(*Max[Max[x/. NSolve[A12[1,x]==0,x,Reals]],Max[x/. NSolve[Dh12[1,x]==0,x,Reals]],Max[x/. NSolve[h12[x]==0,x,Reals]]]<=theta12*)
(*{A12[1,5000]>0,D12[1,5000]>0,Dh12[1,5000]>0,h12[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_12. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]3.89418, (2) the greatest real root of g_T(x), \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta12=Max[x/. NSolve[f12[x]==0,x,Reals]];delta12*)
(*Max[Max[x/. NSolve[g12[x]==0,x,Reals]],Max[x/. NSolve[-B12[1,x]==0,x,Reals]]]<=delta12*)
(*{f12[5000]>0,g12[5000]>0,-B12[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_12. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T\[TildeTilde]2.9354, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi12=Max[x/. NSolve[z12[x]==0,x,Reals]];xi12*)
(*z12[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_2. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]2.41421, (2) A_T(1,x) has no real roots and the greatest real root of \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta22=Max[x/. NSolve[D22[1,x]==0,x,Reals]];theta22*)
(*NSolve[A22[1,x]==0,x,Reals]*)
(*Max[Max[x/. NSolve[Dh22[1,x]==0,x,Reals]],Max[x/. NSolve[h22[x]==0,x,Reals]]]<=theta22*)
(*{A22[1,5000]>0,D22[1,5000]>0,Dh22[1,5000]>0,h22[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_2. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]1728.57, (2) g_T(x) has no real roots and the greatest real root of \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta22=Max[x/. NSolve[f22[x]==0,x,Reals]];delta22*)
(* NSolve[g22[x]==0,x,Reals]*)
(*Max[x/. NSolve[-B22[1,x]==0,x,Reals]]<=delta22*)
(*{f22[5000]>0,g22[5000]>0,-B22[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_2. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T=0, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi22=Max[x/. NSolve[z22[x]==0,x,Reals]];xi22*)
(*z22[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_4. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]2.41421, (2) A_T(1,x) has no real roots and the greatest real root of \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta24=Max[x/. NSolve[D24[1,x]==0,x,Reals]];theta24*)
(*NSolve[A24[1,x]==0,x,Reals]*)
(*Max[Max[x/. NSolve[Dh24[1,x]==0,x,Reals]],Max[x/. NSolve[h24[x]==0,x,Reals]]]<=theta24*)
(*{A24[1,5000]>0,D24[1,5000]>0,Dh24[1,5000]>0,h24[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_4. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]12.2907, (2) g_T(x) has no real roots and the greatest real root of \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta24=Max[x/. NSolve[f24[x]==0,x,Reals]];delta24*)
(*NSolve[g24[x]==0,x,Reals]*)
(*Max[x/. NSolve[-B24[1,x]==0,x,Reals]]<=delta24*)
(*{f24[5000]>0,g24[5000]>0,-B24[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_4. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T=0, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi24=Max[x/. NSolve[z24[x]==0,x,Reals]];xi24*)
(*z24[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_6. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]3.73205, (2) A_T(1,x) has no real roots and the greatest real root of \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta26=Max[x/. NSolve[D26[1,x]==0,x,Reals]];theta26*)
(*NSolve[A26[1,x]==0,x,Reals]*)
(*Max[Max[x/. NSolve[Dh26[1,x]==0,x,Reals]],Max[x/. NSolve[h26[x]==0,x,Reals]]]<=theta26*)
(*{A26[1,5000]>0,D26[1,5000]>0,Dh26[1,5000]>0,h26[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_6. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]3.89418, (2) the greatest real root of g_T(x), \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta26=Max[x/. NSolve[f26[x]==0,x,Reals]];delta26*)
(*Max[Max[x/. NSolve[g26[x]==0,x,Reals]],Max[x/. NSolve[-B26[1,x]==0,x,Reals]]]<=delta26*)
(*{f26[5000]>0,g26[5000]>0,-B26[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_6. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T=0, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi26=Max[x/. NSolve[z26[x]==0,x,Reals]];xi26*)
(*z26[5000]>0*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_8. We first verify Lemma 4.2. The code below shows that (1) the greatest real root of D_T(1,x) is \theta_T\[TildeTilde]2.41421, (2) A_T(1,x) has no real roots and the greatest real root of \hat{D}_T, h_T(x) is at most \theta_T, and (3) the continuous functions A_T(1,x), D_T(1,x), \hat{D}_T, h_T(x) are positive on the interval (\theta_T,infinity) *)*)
(*theta28=Max[x/. NSolve[D28[1,x]==0,x,Reals]];theta28*)
(*NSolve[A28[1,x]==0,x,Reals]*)
(*Max[Max[x/. NSolve[Dh28[1,x]==0,x,Reals]],Max[x/. NSolve[h28[x]==0,x,Reals]]]<=theta28*)
(*{A28[1,5000]>0,D28[1,5000]>0,Dh28[1,5000]>0,h28[5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_8. Next, we verify Lemma 4.3. The code below shows that (1) the greatest real root of  f_T(x) is \delta_T\[TildeTilde]3.38169, (2) g_T(x) has no real roots and the greatest real root of \-B_T(1,x) is at most \delta_T, and (3) the continuous functions f_T(x), g_T(x), -B_T(1,x) are positive on the interval (\delta_T,infinity) *)*)
(*delta28=Max[x/. NSolve[f28[x]==0,x,Reals]];delta28*)
(*NSolve[g28[x]==0,x,Reals]*)
(*Max[x/. NSolve[-B28[1,x]==0,x,Reals]]<=delta28*)
(*{f28[5000]>0,g28[5000]>0,-B28[1,5000]>0}*)


(* ::Input:: *)
(*(*Case T=C_2 \times C_8. Lastly, we verify Lemma 6.1. The code below shows that (1) the greatest real root of  z_T(x) is \xi_T=0, (2) the continuous functions z_T(x) is positive on the interval (\xi_T,infinity) *)*)
(*xi28=Max[x/. NSolve[z28[x]==0,x,Reals]];xi28*)
(*z28[5000]>0*)



