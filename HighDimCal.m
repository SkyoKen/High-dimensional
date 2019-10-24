%ランダム発生させた点数
n=input('ndata=');
%次元
d=input('dims=');
%
draw("norm",n,d);  
%draw("unif",n,d);   %連続一様分布

function draw(dist,n_,d_)
ndata=n_;         %ランダム発生させたn_個の点
dims=1:d_;      %1からd_次元まで
ndim = size(dims, 2);
Lmean=[];
tic
for j= 1:ndim
    dim = dims(j);
    if dist=='unif'
        X=random(dist,-1,1,ndata,dim);
    elseif dist=='norm'
        X=random(dist,0,1,ndata,dim);
    end
    % 原点からの距離
    L=[];
    for i=1:ndata
        d=X(i,:);
        l=sqrt(d*d');
        L=[L,l];
    end
    Lmean= [Lmean, mean(L)];
    fprintf('%ss dims=%d,Lmean=%f\n',num2str(toc),dims(j),Lmean(j));
end
fprintf("計算完了\n");
%図を描く
 figure('Name', 'dist='+dist+' dim=[1:'+num2str(dim)+']'+' plot(dims, Lmean)')
 plot(dims, Lmean);
%ｘ軸を対数目盛にする
 figure('Name', 'dist='+dist+' dim=[1:'+num2str(dim)+']'+' semilogx(dims,Lmean)')
semilogx(dims,Lmean);
%ｘ軸とｙ軸を対数目盛にする
 figure('Name', 'dist='+dist+' dim=[1:'+num2str(dim)+']'+' loglog(dims,Lmean)')
 loglog(dims,Lmean);
end

