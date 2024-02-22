function Pa = logicagenerale(Pload,Pinv)
%
N=length(Pload);
Pn=Pload;
Pa=Pinv/N*ones(N,1);
delta=Pa-Pn;
stop=0;
while (stop==0)
    ip=delta>=0; 
    in=delta<0;
    M=sum(in);
    if(M~=0)
        margine=sum(delta(ip))/M;
        Pa(in)=Pa(in)+margine;
        Pa(ip)=Pa(ip)-delta(ip);
    end
    delta2=Pa-Pn;
    if sum(abs(delta2-delta))==0
        stop=1;
    else
        delta=delta2;
    end
end
ip = Pa > Pload
Pa(ip)=Pload(ip)
end