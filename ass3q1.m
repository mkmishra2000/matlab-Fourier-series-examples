
function ass3q1
    %Enter the any time period of the signal.
    T    = input('Enter the time period of the rect. signal: ');
    
    %Enter the input width of the signal...as given in question.
    T1   = input('Enter the width of the rect. signal(less than time period): ');
    
    %define angular frequency.
    w    = 2*pi/T;
    
    %define the hight of the signal
    k    = input('Enter the height of the rect. pulse:');
    
    %define time in which we want to compute the fourier series.
    t = -T:0.01:T;
    
    %define the expression according to the question.
    x1(t>(-T1)&t<(T1)) = k;
    
    x=[x1,zeros(1,length(t)-length(x1))]; %zero padding add extra length in
                                          %smaller ones.
    
    %fourier cofficient for index zero.                                      
    f0   = (2*k*T1)/T;
    
    %for loop for calculating the a(k) for positive sides
    for kpos = 1:1:40
        Apos(kpos)=trapz(t,x.*exp(-1i*kpos*w*t))/T;
    end
    
    %define positive index for future 
    pos = 1:1:40;
    
    %for loop for calculating the a(k) for negative sides
    for kneg = 1:1:40
        Aneg(kneg) = trapz(t,x.*exp(1i*kneg*w*t))/T;
    end
    
    %define negative index for future 
    neg = -1:-1:-40;
    
    %add the index.
    index = [neg,0,pos];
    
    %Add fourier cofficient form negative to positive 
    A =[Aneg,f0,Apos];
    
    subplot(4,1,1);
    grid on;
    plot(t,x);
    
    subplot(4,1,2);
    grid on;
    stem(index,A);
    
    subplot(4,1,3);
    grid on;
    stem(index,abs(A));
    
    subplot(4,1,4);
    grid on;
    stem(index,angle(A));
    
end
