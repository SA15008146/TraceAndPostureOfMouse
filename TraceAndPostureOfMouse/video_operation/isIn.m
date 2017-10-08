%isIn
function isin = isIn(pos,area)
isin =0;
if pos(1)>area(1)&&pos(1)<area(1)+area(3)&&pos(2)>area(2)&&pos(2)<area(2)+area(4)
    isin = 1;
end


