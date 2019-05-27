clear;
pre_csv = { ...
'schoenigHs_3.csv',...
'Labuhn2018Ms_214.csv',...
'Labuhn2018Hs_210.csv',...
'schoenigMm_6.csv',...
'ren2015_39.csv',...
'hart2016-HelaLib1Avg_4256.csv',...
'doench2014HsA375_1276.csv',...
'gandhi2016-ci2_72.csv',...
'xu2015TrainMEsc_981.csv',...
'chari2015Valid293T_10.csv',...
'chari2015ValidA549_10.csv',...
'chari2015ValidHepG2_10.csv',...
'chari2015ValidPGP1iPS_10.csv',...
'chari2015ValidSKNAS_10.csv',...
'chari2015ValidU2OS_10.csv',...
'concordet2-Hs_26.csv',...
'concordet2-Mm_18.csv',...
'doench2014Hs_881.csv',...
'doench2014Mm_951.csv',...
'doench2016_2333.csv',...
'farboud2015_50.csv',...
'hart2016-GbmAvg_4272.csv',...
'hart2016-Hct1162lib1Avg_4239.csv',...
'hart2016-Hct1162lib2Avg_3617.csv',...
'chari2015Train293T_1234.csv',...
'hart2016-HelaLib2Avg_3845.csv',...
'hart2016-Rpe1Avg_4214.csv',...
'housden2015_75.csv',...
'wang2015hg19_2921.csv',...
'xu2015_35.csv',...
'xu2015TrainHl60_2076.csv',...
'xu2015TrainKbm7_2076.csv',...
'schoenigRn_15.csv',...
'liu2016-mm9_205.csv'};


for file = pre_csv
    name = file{1,1};
    filename = ['data/U6/', name];
    csv = readtable(filename);
    resfilename = ['predict_scores/',name];
    resf = fopen(resfilename,'w');
    for i=1:height(csv)
        ftmp = fopen('tmp_test.fa','w');
        fprintf(ftmp,'>');
        guide = csv(i,1);
        guide1 = guide{1,1};
        guide2 = guide1{1,1};
        disp(guide2);
        fprintf(ftmp,guide2);
        fprintf(ftmp,'\n');
        seq_longSeq100Bp43nt = csv(i,4);
        seq_longSeq100Bp43nt1 = seq_longSeq100Bp43nt{1,1};
        seq_longSeq100Bp43nt2 = seq_longSeq100Bp43nt1{1,1};
        fprintf(ftmp,seq_longSeq100Bp43nt2);
        fclose(ftmp);
        seq = csv(i,2);
        seq1 = seq{1,1};
        seq2 = seq1{1,1}; 
        res = TSAM('tmp_test.fa',1,1,1);
        for m=1:size(res)
          res_seq = res(m,1);
          res_seq1 = res_seq{1,1};
          if seq2(1:20) == res_seq1
              fprintf(resf,seq2);
              fprintf(resf,',');
              value = res(m,4);
              value1 = value{1,1};
              fprintf(resf,num2str(value1));
              fprintf(resf,'\n');
              break;
          end
        end
    end
    fclose(resf);
end
