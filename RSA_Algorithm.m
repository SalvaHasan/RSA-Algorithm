%------Salva Hasan (16PWCSE1392)------%
clc
clear
%--Randomly generate large Prime numbers p and q in range of [100 to 1000]--%
p=1;q=1;
check1=0;check2=0;

 while(1)

     if(isprime(p))
         check1=1;
     else
         p=randi([100,1000]);
     end   
     if(isprime(q))
        check2=1;
     else
        q=randi([100,1000]);
     end
     if(check1 && check2 == 1)
        break;
     end 
end

n=p*q;
totf = (p-1)*(q-1);

%-----Pick e randomly from 1 to totient function-----%
e = randi([1,totf]);

while(1)
%If GCD is 1 then e and totient function are co-prime
if(gcd(e,totf)~= 1)             
   e = randi([1,totf]);
else
    break;
end
end


%-----Find modular multiplicative inverse of e mod totf -----%

% d*e mod totf = 1, where d should be in range [0 totf-1]   

for i = 0:(totf-1)
    if(mod(e*i,totf) == 1)
        d=i;
       break;
    end
end

Message=input('Enter Message: ');

fprintf('The prime numbers P = %d and Q = %d\n',p,q);
fprintf('Computed value for n = %d and Totient Function = %d\n',n,totf);
fprintf('Computed value for e = %d and d = %d\n',e,d);
CipherText = double(mod(sym(Message)^e,n));
fprintf('Encrypted Message: %d\n',CipherText);
PlainText = double(mod(sym(CipherText)^d,n));
fprintf('Decrypted Message: %d\n',PlainText);



