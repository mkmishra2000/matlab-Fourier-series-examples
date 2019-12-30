function ass3q3
    %define the angular frequency
    w=(2*pi)/6;
    
    %define the time for calculate the fourier seriers coefficients
    t=-3:0.01:3;
    
    %define the expression (it is little bit tricky)
    x1(t>-2&t<-1) = 1;
    x2(t<2&t>1)   =-1;
    %zero padding for length equalization
    x11=[x1,zeros(1,length(t)-length(x1))];
    x22=[x2,zeros(1,length(t)-length(x2))];
    x=x11+x22;

    %fourier series for first 25
    for k=1:1:25
        A(k)=(trapz(t,x.*exp(-1i*w*k*t)))/6;
    end
    
    k= 1:1:25;
    
    %for  ploting fourier series representation.
    f=0;
    for p=1:1:100
        cp= 1i*(cos(p*w)-cos(2*p*w))/(p*w);% p-th harmonics.
        f=f+(cp*(exp(1i*w*p*t)));%add harmonics
    end
    
    subplot(4,1,1);
    plot(t,x);
    axis([-4,4,-2,2]);
    grid on;
    
    subplot(4,1,2);
    stem(k,abs(A));
    grid on;
    
    subplot(4,1,3);
    stem(k,angle(A));
    grid on;
    
    subplot(4,1,4);
    plot(t,f);
    grid on;
    
end
