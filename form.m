function f=form(l,a,attr)

if(size(a,1)<=3)
    return
end

if(size(a,1)==0)
   sprintf('Leaf : ') 
end


p=unique(a(:,7));
if(size(p,1)==1)
    sprintf('Leaf : %d',p(1))
end


s1=size(attr);
flag=0;
for i=1:s1(2)
    if(attr(i)==0)
        flag=1;
        break
    end
end

if(flag==0)
    return;
end
n=attr_sel(a,attr);
attr(n)=1;

sprintf('Level : %d\n Splitting ttr : %d\n',l,n)

tmp=unique(a(:,n));
if(size(tmp,1)<=2)
    t1=find(a(:,n)==tmp(1));
    t2=find(a(:,n)==tmp(2));
    for j=1:size(t1,1)
    temp1(j,:)=a(t1(j),:);
    end
    for j=1:size(t2,1)
    temp2(j,:)=a(t2(j),:);
    end

else
    mid=(max(tmp)+min(tmp))/2;
    t1=find(a(:,n)<=mid);
    t2=find(a(:,n)>mid);
    for j=1:size(t1,1)
    temp1(j,:)=a(t1(j),:);
    end
    for j=1:size(t2,1)
    temp2(j,:)=a(t2(j),:);
    end
end
temp1
sprintf('Parents : %d',n)
if(size(temp1,1)==0) 
    sprintf('Leaf')
    return
else
    form(l+1,temp1,attr)
end
temp2
sprintf('Parents : %d',n)
if(size(temp2,1)==0)
    sprintf('Leaf')
    return
else
    form(l+1,temp2,attr)
end

end 