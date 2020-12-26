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
            prompt = '要加到多少的多少次方? (小於30000)';
            times = input(prompt);
            while(times > 30000)         %防呆: 要輸入正確數字才會往下走
                if(times > 30000)
                    warning('請輸入正確\n')
                    times = input(prompt);
                end
            end
            prompt2 = '要輸出小數點前幾位數字呢? (小於300位)'; %防呆: 要輸入正確數字才會往下走
            times2 = input(prompt2);
            while(times2 > 300)
                if(times2 > 300)
                    warning('請輸入正確\n')
                    times2 = input(prompt2);
                end
            end
            num=0; %答案的初始值為0
            for ii=1:times %把所有的n^n算出來相加 
                num=num+sq(ii);
            end
            num=mod(num,10^times2); %如果num > 10^10 會再mod一次
            ans=sym(num); %sym這個方程式是讓值不會以科學記號表示 ans是char
            fprintf('1^1+2^2+3^3+...+%d^%d 小數點前%d位數字是 %s\n',times,times,times2,ans)
            again='要再做一次嗎? 要: 1，不要:0\nchoice:';
            ans=input(again);
        elseif(method==2)
            prompt = '要做到多少的多少次方? (小於30000)';
            times = input(prompt);
            while(times > 30000)         %防呆: 要輸入正確數字才會往下走
                if(times > 30000)
                    warning('請輸入正確\n')
                    times = input(prompt);
                end
            end
            prompt2 = '要輸出小數點前幾位數字呢? (小於300位)'; %防呆: 要輸入正確數字才會往下走
            times2 = input(prompt2);
            while(times2 > 300)
                if(times2 > 300)
                    warning('請輸入正確\n')
                    times2 = input(prompt2);
                end
            end
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
            elseif(mod(times,2)==1)
                num=mod(num,10^times2);%mod這個方程式得到的正負號是根據後面的參數來決定，為後面是正的，所以答案一定是正的
            end
            ans=sym(abs(num)); %sym這個方程式是讓值不會以科學記號表示 ans是char
            fprintf('1^1-2^2+3^3+...+(-1)^(%d-1)*%d^%d 小數點前%d位數字是 %s\n',times,times,times,times2,ans)
            again='要再做一次嗎? 要: 1，不要:0\nchoice:';
            ans=input(again);
        end
    end
end