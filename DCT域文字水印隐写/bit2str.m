function message = bit2str(databits)
for i=1:(length(databits)/8)
    m=i-1;
    bits_str=strcat(num2str(databits(m*8+1)),num2str(databits(m*8+2)),...
        num2str(databits(m*8+3)),num2str(databits(m*8+4)),num2str(databits(m*8+5)),...
        num2str(databits(m*8+6)),num2str(databits(m*8+7)),num2str(databits(m*8+8)));
    message(i)=bin2dec(bits_str);
end
