function sigma()
% Project 16
% 求出1^1+2^2+3^3+⋯+1000^1000 的小數點前10位數字
%{
方法 分別求出每一項的值，然後分別 mod 10^10
所有的值相加再mod一次就會得到答案。(因為所有值相加後可能會超出10位)
%}
%{
function sq()
因為在n^n中，值在大到一定情況時會呈現Inf，便沒辦法計算
所以需要把n^n拆開來算，代數課有教
Note: 
(Prop) 若a1 = b1 mod k, a2 = b2 mod k
 則 a1+a2 = (b1+b2)mod k 且 a1a2 = b1b2 mod k

得到x^n mod k = (((x mod k)*x mod k)...)mod k 乘n次
prove 在下面
%}
    function y=sq(x) 
        y=1;
        for ii=1:x
            y=mod(y*x,10^times2);
        end
    end
    ans=1;
    while(ans==1)
        fprintf('------------------------------------------------------------\n')
        ask='輸入1:輸出1^1+2^2+...+n^n的小數點前k位數字\n輸入2:輸出1^1-2^2-...+(-1)^(n-1)*n^n的小數點前k位數字\nchoice:';
        method=input(ask);
        if(method==1)
            prompt = '要加到多少的多少次方? ';
            times = input(prompt);
            prompt2 = '要輸出小數點前幾位數字呢?';
            times2 = input(prompt2);
            num=0; %答案的初始值為0
            for ii=1:times %把所有的n^n算出來相加 
                num=num+sq(ii);
            end
            num=mod(num,10^times2); %如果num > 10^10 會再mod一次
            ans=sym(num); %sym這個方程式是讓值不會以科學記號表示 ans是char
            fprintf('1^1+2^2+3^3+...+%d^%d = %s\n',times,times,ans)
            again='要再做一次嗎? 要: 1，不要:0\nchoice:';
            ans=input(again);
        elseif(method==2)
            prompt = '要做到多少的多少次方? ';
            times = input(prompt);
            prompt2 = '要輸出小數點前幾位數字呢?';
            times2 = input(prompt2);
            num=0;  %答案的初始值為0
            plus=0; %基數項初始值
            minus=0;%偶數項初始值
            for ii=1:2:times %基數項都是正的全部相加 
                plus=plus+sq(ii);
            end
            for jj=2:2:times %偶數項都是負的全部加起來
                minus=minus+(-1)*sq(jj);
            end
            num=plus+minus;
            if(mod(times,2)==0 && num > 0) %因為次方是偶數，又每一項越來越大，答案是負的
                num=mod(num,10^times2) - 10^times2; %因為plus和minus是10位數字左右，所以num的值有可能正的，這時mod完再減10^times2
            elseif(mod(times,2)==1)%如果次方是奇數的話，又每一項越來越大，可以知道答案最後會是正的
                num=mod(num,10^times2);%mod這個方程式得到的正負號是根據後面的參數來決定，為後面是正的，所以答案一定是正的
            end
            ans=sym(num); %sym這個方程式是讓值不會以科學記號表示 ans是char
            fprintf('1^1-2^2+3^3+...+(-1)^(%d-1)*%d^%d = %s\n',times,times,times,ans)
            again='要再做一次嗎? 要: 1，不要:0\nchoice:';
            ans=input(again);
        end
    end
%{
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
%}
end