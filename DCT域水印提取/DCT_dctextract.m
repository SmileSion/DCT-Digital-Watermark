clc; 
clear;
wi=imread('watermarkedLiYunFei.bmp');
wi=double(wi)/255;
wi=wi(:,:,1);
T=dctmtx(8); 
DCTcheck=blkproc(wi,[8 8],'P1*x*P2',T,T');
 
for i=1:80      
    if  DCTcheck(i+4,i+1)<=DCTcheck(i+3,i+2)    
        message(i,1)=1;  
    else
        message(i,1)=0;  
    end
end
out=bit2str(message);
fid=fopen('MyScret.txt', 'wt');
fwrite(fid,out)
fclose(fid);
