clc
r1='1>=11100000000001=100';
r2='1<=111001>0011101=101';
f_r1=randi(5);
f_r2=randi(5);
fitness='111111110000000011100';

for j=1:20

for i=1:size(fitness,2)
    if(fitness(i)=='1')
        off1(i)=r1(i);
        off2(i)=r2(i);
    else
        off1(i)=r2(i);
        off2(i)=r1(i);
    end
    
end
f_off1=randi(5);
f_off2=randi(5);
if(f_off1>f_r1)
    r1=off1;
elseif(f_off2>f_r1)
        r1=off2;
elseif(f_off1>f_r2)
            r2=off1;
else
    r2=off2;
end
tv=randi(3)
if(tv==1)
    %Weight_mutation
    rand1=randi(3);
    if(rand1==1)
        if(r1(1)=='0')
            r1(1)='1';
        else
            r1(1)='0';
        end
    elseif(rand1==2)
        if(r1(9)=='0')
            r1(9)='1';
        else
            r1(9)='0';
        end
    end
elseif(tv==2)
    %operator mutation
    if(r1(2)=='>')
        r1(2)='<';
    elseif(r1(2)=='=')
        r1(2)='>';
    elseif(r1(3)=='=')
        r1(3)='0';
    else
        r1(3)='=';
    end
else
    %value mutation
    if(r1(4)=='0')
        r1(4)='1';
    else
        r1(4)='0';
    end
end

end
r1
r2