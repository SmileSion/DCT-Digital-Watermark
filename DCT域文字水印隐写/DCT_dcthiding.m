clc; 
clear; 
msgfid=fopen('hidden.txt','r');%%打开秘密文件,读入秘密信息 
[msg,count]=fread(msgfid); 
count=count*8; 
alpha=0.02; 
fclose(msgfid); 
msg=str2bit(msg)'; 
[len,col]=size(msg); 
io=imread('LiYunFei.bmp');
io=double(io)/255; 
output=io; 
i1=io(:,:,1);
T=dctmtx(8); 
DCTrgb=blkproc(i1,[8 8],'P1*x*P2',T,T');
[row,col]=size(DCTrgb); 
row=floor(row/8); 
col=floor(col/8);  
temp=0; 
for i=1:count;     
    if msg(i,1)==0     
        if DCTrgb(i+4,i+1)<DCTrgb(i+3,i+2)            
            temp=DCTrgb(i+4,i+1);        
            DCTrgb(i+4,i+1)=DCTrgb(i+3,i+2);        
            DCTrgb(i+3,i+2)=temp;      
        end
    else
        if  DCTrgb(i+4,i+1)>DCTrgb(i+3,i+2)     
            temp=DCTrgb(i+4,i+1);      
            DCTrgb(i+4,i+1)=DCTrgb(i+3,i+2);     
            DCTrgb(i+3,i+2)=temp;      
        end
    end
    if DCTrgb(i+4,i+1)<DCTrgb(i+3,i+2)    
        DCTrgb(i+4,i+1)=DCTrgb(i+4,i+1)-alpha;
    else
        DCTrgb(i+3,i+2)=DCTrgb(i+3,i+2)-alpha;
    end
end
wi=blkproc(DCTrgb,[8 8],'P1*x*P2',T',T);
output=io;
output(:,:,1)=wi;
imwrite(output,'watermarkedLiYunFei.bmp');
figure;
subplot(1,2,1);imshow('LiYunFei.bmp');title('原始图像');
subplot(1,2,2);imshow('watermarkedLiYunFei.bmp');title('嵌入图像');
