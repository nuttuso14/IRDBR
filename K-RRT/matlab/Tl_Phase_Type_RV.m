clear all

%% Parameters
k = 2; % #Zi due to array problem k cannot be assigned with high value may be we can swap k and ni eg., k=5 ni=3 we can use k=3 m=15 rather than k=5 m=15
%m = 9; % size of alpha
ni = [3 6 75];
lambda = [2.5 3.125 2.5];


%ni = [8 5 5 3 5];
%lambda = [25 10 10 10 15];

%% Initialize alpha
for i=1:k
    mi(i)=ni(i)*k;
    a{i}= [ones(1,1) zeros(1,mi(i)-1)];
end

% 3D matrix

for i = k:-1:1
   Ti{i} = lambda(i) * ( tril(triu(ones(mi(i))),1)+eye(mi(i))*(-2) );
   
end

%% Compute alpha by Kronecker Product
v1 = a{1,1};

for i = 2:k
    
    v1 = kron(v1,a{1,i});
    
end



%% Compute T by Kronecker Sum
Si = Ti{1,1};

for i = 2:k

    [r,s] = size(Si);
    [p,q] = size(Ti{1,i});
    
    Si = kron(Si,eye(p)) + kron(eye(r),Ti{1,i});
    
end

%% Probability
[m,n] = size(Si);
tmin = 1;
tmax = 5;
step = 0.1;
t = [tmin:step:tmax];

for i = 1:(tmax-tmin)/step +1 
    
    P(i) = 1 - v1*expm(Si*t(i))*ones(m,1);
    X = sprintf('%f , %f',t(i),P(i));
    disp(X)

end

%% Plot
plot(t,P,'-o')
grid on
xlabel('t')
ylabel('P')
