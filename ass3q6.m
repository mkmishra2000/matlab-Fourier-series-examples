function ass3q6
    %define the time period
    t=0:0.01:2*pi;
    
    %define the expression
    for i=1:length(t)
        if t(i)<pi
            y(i)=t(i); 
        else
            y(i)=pi;
        end
    end
    
    w=(2*pi)/4;       %angular frequency
    
    %calculating the positive part
    for kpos =1:1:30
        Apos(kpos)=(trapz(t,y.*exp(-1i*w*kpos*t)))/(2*pi);
    end
    kpos =1:1:30;
    
    %calculating the negative part
    for kneg= 1:1:30
        Aneg(kneg)=(trapz(t,y.*exp(1i*w*kneg*t)))/(2*pi);
    end
    kneg=-1:-1:-30;
    
    A0 = 3*pi/4; %zeroth coefficient after calculation
    
    k=[kneg,0,kpos];    %indexing
    
    A=[Aneg ,A0 ,Apos]; %fourier coefficient
    
    subplot(4,1,1);
    plot(t,y);
    grid on;
    
    subplot(4,1,2);
    stem(k,abs(A));
    grid on;
    
    subplot(4,1,3);
    stem(k,angle(A));
    grid on;
    
    subplot(4,1,4);
    stem(k,A);
    grid on;
    
end
