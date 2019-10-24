# High-dimensional
　d次元超立方体中にランダムに発生させたn個の点について，原点からの距離を計算し，その平均距離を求める。
<p align="right">2019.10.25</p>


## 目次
* [1.結果](#結果)
* [2.ソースコード](#ソースコード)

## 結果
次元をx軸とし，求めた平均距離をy軸としたグラフを表示する。
```Matlab
dist=norm;  ndata=100;  dims=10000;
```

|  通常目盛 | 片対数 | 両対数 |
|  ----  | ----  | ----  |
| ![通常目盛](https://github.com/SkyoKen/High-dimensional/blob/master/image/100000_norom.jpg)  | ![片対数](https://github.com/SkyoKen/High-dimensional/blob/master/image/100000_senmilogx.jpg)  | ![両対数](https://github.com/SkyoKen/High-dimensional/blob/master/image/100000_loglog.jpg) |
## ソースコード
### 入力
```Matlab
%ランダム発生させた点数
n=input('ndata=');
%次元
d=input('dims=');
```

### 初期化

```Matlab
ndata=n_;       %ランダム発生させたn_個の点
dims=1:d_;      %1からd_次元まで
ndim = size(dims, 2);
Lmean=[];
```

### 計算
```Matlab
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
```

### 描画
```Matlab
%図を描く
 figure('Name', 'dist='+dist+' dim=[1:'+num2str(dim)+']'+' plot(dims, Lmean)')
 plot(dims, Lmean);
%ｘ軸を対数目盛にする
 figure('Name', 'dist='+dist+' dim=[1:'+num2str(dim)+']'+' semilogx(dims,Lmean)')
semilogx(dims,Lmean);
%ｘ軸とｙ軸を対数目盛にする
 figure('Name', 'dist='+dist+' dim=[1:'+num2str(dim)+']'+' loglog(dims,Lmean)')
 loglog(dims,Lmean);
```

[TOP↑](#High-dimensional)
