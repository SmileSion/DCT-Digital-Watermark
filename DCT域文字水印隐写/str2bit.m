function msg_bits = str2bit(msgStr)
    msgBin = de2bi(int8(msgStr),8,'left-msb');
    len = size(msgBin,1).*size(msgBin,2);
    msg_bits = reshape(double(msgBin).',len,1).';
    end  
