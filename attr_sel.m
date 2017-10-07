function n=attr_sel(a,attr)
s_a=size(a);
r_a=s_a(1);
c_a=s_a(2);
clss=unique(a(:,7));
for i=1:size(clss,1)
    cl_freq(i)=sum(length(find(a(:,7)==clss(i))));
end
info_gain=0;

for i=1:size(clss,1)
    p=cl_freq(i)/r_a;
    info_gain=info_gain-(p*log2(p));
end
for i=1:size(a,2)-1
    inf_gain(i)=find_inf(a,i);
end
for i=1:size(inf_gain,2)
    gain(i)=info_gain-inf_gain(i);
    if(attr(i)==1)
        gain(i)=0-gain(i);
    end
end
n=find(gain==max(gain));
end