# final_project-brian890405
final_project-brian890405 created by GitHub Classroom
我要做 project16

求出1^1+2^2+3^3+⋯+1000^1000 的小數點前10位數字
方法 分別求出每一項的值，然後分別 mod 10^10
所有的值相加再mod一次就會得到答案。(因為所有值相加後可能會超出10位)
因為在n^n中，值在大到一定情況時會呈現Inf，便沒辦法計算
所以需要把n^n拆開來算，代數課有教
Note:
(Prop) 若a1 = b1 mod k, a2 = b2 mod k
則 a1+a2 = (b1+b2)mod k 且 a1a2 = b1b2 mod k
<pf> x^n mod k = (((x mod k)*x mod k)...)mod k 乘n次
<sol>
    let x=ak+b, n=1 x^1 mod k = x mod k
    n=2 x^2 mod k = ((x mod k)*x mod k)⇒L.H.S=ak^2+2abk+b^2 mod k = b^2 mod k
    RHS=b(ak+b)mod k=(abk+b^2)mod k = b^2 mod k(成立)
    Assume n成立, x^n mod k = ∑(n取m)(ak)^m*b^(n-m) mod k,m從0~n = (b^n+k(...))mod k=b^n mod k
    則n+1時,R.H.S=(((x mod k)*x mod k)...)mod k 乘n+1次 = (b^n mod k)*x mod k =
    (b^n mod k*(ak+b))mod k = b^n mod k mod k * (ak+b) mod k = 
    b^n mod k * b mod k = b^(n+1) mod k
    by 數學歸納法 得證

推廣:
可以依自己喜歡求出1^1+2^2+3^3+⋯+n^n(n可以自己訂) 小數點前kk位數字 (k自訂 k<300)
求出1^1-2^2+3^3-⋯+(-1)^n-1*n^n 的小數點前 k位數字
