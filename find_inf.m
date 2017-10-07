function f=find_inf(a,i)
total=size(a,1);
x=unique(a(:,i));

if(size(x,1)==1)
    f=1;
    return
end
y=unique(a(:,7));
if(size(x,1)>2)
mx=max(x);
mn=min(x);
mid=(mn+mx)/2;
t1=find(a(:,i)<=mid);
t2=find(a(:,i)>mid);
for j=1:size(t1,1)
    temp1(j,:)=a(t1(j),:);
end
for j=1:size(t2,1)
    temp2(j,:)=a(t2(j),:);
end
p1=size(temp1,1)/total;
p2=size(temp2,1)/total;
inf1=0;
inf2=0;
for j=1:size(y,1)
    pt=length(find(temp1(:,7)==y(j)))/size(temp1,1);
    pt2=length(find(temp2(:,7)==y(j)))/size(temp2,1);
   if(pt~=0)
    inf1=inf1-pt*log2(pt);
   end
   if(pt2~=0)
   inf2=inf2-pt2*log2(pt2);
   end
end
f=size(temp1,1)*inf1/total+size(temp2,1)*inf2/total;

else
    t1=find(a(:,i)==x(1));
    t2=find(a(:,i)==x(2));
 for j=1:size(t1,1)
    temp1(j,:)=a(t1(j),:);
 end
for j=1:size(t2,1)
    temp2(j,:)=a(t2(j),:);
end
    p1=size(temp1,1)/total;
    p2=size(temp2,1)/total;
    inf1=0;
    inf2=0;
    for j=1:size(y,1)
    pt=length(find(temp1(:,7)==y(j)))/size(temp1,1);
    pt2=length(find(temp2(:,7)==y(j)))/size(temp2,1);
   if(pt~=0)
    inf1=inf1-pt*log2(pt);
   end
   if(pt2~=0)
   inf2=inf2-pt2*log2(pt2);
   end
   end
   f=size(temp1,1)*inf1/total+size(temp2,1)*inf2/total;
end


end