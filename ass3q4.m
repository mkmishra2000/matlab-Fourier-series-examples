function ass3q4
    %define the angular frequency
    w=(2*pi)/4;
    
    %define the time period
    t=-2:0.01:2;
    
    %define the expression
    for i=1:length(t)
        if t(i)<0    
            x(i)=-t(i); % for negative part
        else
            x(i)=t(i);  % for positive part
        end
    end

    %fourier series for positive ones
    for kpos =1:1:30
        Apos(kpos)=(trapz(t,x.*exp(-1i*w*kpos*t)))/4;
    end
    kpos =1:1:30;
    
    %fourier series for negative ones
    for kneg= 1:1:30
        Aneg(kneg)=(trapz(t,x.*exp(1i*w*kneg*t)))/4;
    end
    kneg=-1:-1:-30;
    
    A0=4; % zeroth coffecient
    k=[kneg,0,kpos]; %for indexing
    A=[Aneg,A0,Apos]; % joining the coefficient

%f=0;
 %for p=1:1:100
   % cp= ((cos(2*p*w))/(2*p*p*w*w))-(1i*(sin(2*p*w))/(p*w))-(1/(2*p*p*w*w));
   % f=f+(cp*(exp(1i*w*p*t)));
%end
    subplot(3,1,1);
    plot(t,x);
    grid on;
    
    subplot(3,1,2);
    stem(k,abs(A));
    grid on;
    
    subplot(3,1,3);
    stem(k,angle(A));
    grid on;
    
   % subplot(4,1,4);
   % plot(t,f);
end