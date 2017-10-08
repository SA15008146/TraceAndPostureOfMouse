打开 program_start_test.m 文件 ；

一般情况下 mod = 1 ,做反转设置mod = 0 ; 可能是0 , 我忘记了；
mod = 2 表示宽时间间隔下；
不同的mod 需要不同的paramList，注意修改；

修改 file 为保存录像的路径 ；

运行 program_start_test ;


mod = 2;
paramList:
    cutArea = [206.5 234.5 146 153]
    startArea = [221.5 242.5 151 151];
    checkLine = [871.5 224.5 0.25 50;
                 871.5 542.5 0.25 50];
    endArea = [728.5 7.5 109 313;
           732.5 314.5 108 317];
    wrongArea = [582.5 14.5 253 307;
            588.5 311.5 249 322];

mod = 1 || 0 ;
paramList:
    cutArea = [519.5 85.5 752 615];
    startArea = [36 229 99 99];
    checkLine = [685.5 159.5 0.25 44;   %UP
                 685.5 454.5 0.25 44];  %DOWN

    endArea = [544.5 8.5 94 286;        %UP
               547.5 285.5 93 304];     %DOWN
              
    wrongArea = [380.5 48.5 240 222;    %UP
                 383.5 315.5 236 253];  %DOWN

