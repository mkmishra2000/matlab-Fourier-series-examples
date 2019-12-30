function ass3q2
 %Enter the any time period of the signal.
    T    = input('Enter the time period of the rect. signal: ');
    
    %define angular frequency.
    w    = 2*pi/T;
    
    %time period define
    t = -T:0.01:T;
    
    %define the expression
    x1 = t;
    
    %a(0) zeroth fourier coefficient.
    f0 = 0;
    
    %for loop for calculating the a(k) for positive sides
    for kpos = 1:1:40
        Apos(kpos)=trapz(t,x1.*exp(-1i*kpos*w*t))/T;
    end
    
    %define positive index for future
    pos = 1:1:40;
    
    %for loop for calculating the a(k) for negative sides
    for kneg = 1:1:40
        Aneg(kneg) = trapz(t,x1.*exp(1i*kneg*w*t))/T;
    end
    
    %define negative index for future 
    neg = -1:-1:-40;
    
    %add the index.
    index = [neg,0,pos];
    
    %Add fourier cofficient form negative to positive
    A =[Aneg,f0,Apos];
    
    %now i want to draw the fourier series in it so that i will use
    %simplified version of the fourier series(by adding harmonics).
    f=0;
    for p=1:1:100
        cp= (((4*1i*cos(2*p*w))/(p*w))+(-2*sin(2*p*w)/(p*p*w*w)))/4;
        f=f+(cp*(exp(1i*w*p*t))); %add all harmonics in it.
    end
    
    %plot the graphs.
    subplot(4,1,1);
    grid on;
    stem(index,A);
    
    subplot(4,1,2);
    grid on;
    stem(index,abs(A));
    
    subplot(4,1,3);
    grid on;
    stem(index,angle(A));
    
    subplot(4,1,4);
    grid on;
    plot(t,f);
    
end