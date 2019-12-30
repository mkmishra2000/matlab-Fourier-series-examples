function ass3q5
    %define time period
    t1=-2:0.01:2;
    
    %define expression
    for i=1:length(t1)
        if t1(i)<0
            y(i)=0;      % for negative part zero
        else
            y(i)=t1(i);  %for positive part
        end
    end
    
    w=(2*pi)/4; %angualar frequency
    
    %positive side calculation
    for kpos =1:1:30
        Apos(kpos)=(trapz(t1,y.*exp(-1i*w*kpos*t1)))/4;
    end
    kpos =1:1:30;
    
    %negative side calculation
    for kneg= 1:1:30
        Aneg(kneg)=(trapz(t1,y.*exp(1i*w*kneg*t1)))/4;
    end
    kneg=-1:-1:-30;
    
    A0=4;              %first fourier coefficient (zeroth harmonics)
    
    k=[kneg,0,kpos];   %indexing
    
    A=[Aneg ,A0 ,Apos];%jioning the coefficient
    
    subplot(4,1,1);
    plot(t1,y);
    grid on;
    
    subplot(4,1,2);
    stem(k,abs(A));
    grid on;
    
    subplot(4,1,3);
    stem(k,angle(A));
    grid on
    
    subplot(4,1,4);
    stem(k,A);
    grid on;
    
end
