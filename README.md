# $1^1$ + $2^2$ + $3^3$ + ... + $1000^{1000}$ 的小數點前十位數字
方法 
分別求出每一項的值，然後分別 mod $10^{10}$
所有的值相加再mod一次就會得到答案。(因為所有值相加後可能會超出10位)
因為在 $n^n$ 中，值在大到一定情況時會呈現Inf，便沒辦法計算
所以需要把 $n^n$ 拆開來算
(Prop) 
*  $a_1$ = $b_1$ mod k
*  $a_2$ = $b_2$ mod k
* $a_1$+$a_2$ = ($b_1$+$b_2$) mod k 且 $a_1$$a_2$ = $b_1$$b_2$ mod k
<pf> $x^n$ mod k = (((x mod k)*x mod k)...)mod k 乘n次 
<sol>
    let x=ak+b 
    1. when n=1, $x^1$ mod k = x mod k
    2. n=2, $x^2$ mod k = ((x mod k) * x mod k) ⇒ L.H.S=$(ak)^2$ + 2abk + $b^2$ mod k = $b^2$ mod k
    R.H.S=b(ak+b) mod k = (abk + $b^2$ ) mod k = $b^2$ mod k (成立)
    3. Assume n 成立, $x^n$ mod k 
    = $\displaystyle\sum_{m=0}^n$$\left(\begin{array}{c}n\\m\\\end{array}\right)$$(ak)^m$$b^{n-m}$ mod k = ($b^n$+k(...)) mod k=b^n mod k
    則n+1時,R.H.S=(((x mod k)*x mod k)...)mod k 乘n+1次 = ($b^n$ mod k) * x mod k =
    ($b^n$ mod k * (ak+b))mod k = ($b^n$ mod k mod k) * ((ak+b) mod k) = 
    $b^n$ mod k * b mod k = $b^{n+1}$ mod k
    by M.I 故得證

# 推廣:
一、可以依自己喜歡求出 $1^1$ + $2^2$ + $3^3$ + ... + $1000^{1000}$ (n可以自己訂) 小數點前k位數字 (k自訂 k < 300)

二、求出 $1^1$ - $2^2$ + $3^3$ - ⋯ +$(-1)^{n-1}$*$n^n$ 的小數點前 k位數字
因為正負相間很複雜，所以選擇正和負分開相加，才不會出錯
最後正加負 答案產生的情況有2種正負值
* 次方是偶數，又每一項越來越大，答案是負的
  但是因為正和負的都是算完後先 mod之後再相加，所以答案可能正負都有可能出現
  <解決方法>
  如果是正的，直接扣掉 mod的數字 接著在mod一次 ( 因為 3 mod 5 = -2 mod 5 )
* 次方是奇數的話，又每一項越來越大，答案最後會是正的

三、

P.S.我需要90分才不用補考 拜託 >_<
