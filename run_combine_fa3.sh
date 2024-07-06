ext="2024_06_01"
tag="Mar24_noSM"
eosdir="/eos/user/b/bjoshi/www/VHAnomalous/01_06_2024/new_combine_plots/"

year="combined"

fggff_ws_int_model_opts="-m 125 -P HiggsAnalysis.CombinedLimit.HiggsSingleAnomalousCoupling:FA3_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase --PO CMS_zz4l_fai1,muV altSignal=ALT_0M"
fggff_ws_twoHiggs_model_opts="-m 125 -P  HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs --PO muFloating"

fggff_combine_int_model_opts="--algo grid -M MultiDimFit --alignEdges 1 -t -1 --saveSpecifiedNuis all --saveInactivePOI 1 --setParameterRanges muV=0.0,4.0:muf=0.0,10.0:fa3_ggH=0.,1.:CMS_zz4l_fai1=-0.003,0.003 --setParameters muV=1.,CMS_zz4l_fai1=0.,muf=1.,fa3_ggH=0. --robustFit=1 --setRobustFitAlgo=Minuit2,Migrad --X-rtd FITTER_NEW_CROSSING_ALGO --setRobustFitTolerance=0.1 --X-rtd FITTER_NEVER_GIVE_UP --X-rtd FITTER_BOUND --cminFallbackAlgo Minuit2,0:1 --freezeParameters MH -m 125  --cminDefaultMinimizerStrategy 0"
fggff_combine_int_model_opts_float="--algo grid -M MultiDimFit --alignEdges 1 --saveSpecifiedNuis all --saveInactivePOI 1 --setParameterRanges muV=0.0,4.0:muf=0.0,10.0:fa3_ggH=0.,1.:CMS_zz4l_fai1=-0.003,0.003 --setParameters muV=1.,CMS_zz4l_fai1=0.,muf=1.,fa3_ggH=0. --robustFit=1 --setRobustFitAlgo=Minuit2,Migrad --X-rtd FITTER_NEW_CROSSING_ALGO --setRobustFitTolerance=0.1 --X-rtd FITTER_NEVER_GIVE_UP --X-rtd FITTER_BOUND --cminFallbackAlgo Minuit2,0:1 --freezeParameters MH -m 125 --floatOtherPOIs 1"

# #########################################################################################################
#                                               VH_MET
# #########################################################################################################

# datacard="Models/datacards/Datacard_allera_accat2_ALT_0M_fa3.txt"
# dirext="${tag}_VH_MET_combined_${ext}"
# output_ws="vh_met_workspace_${dirext}.root"
# text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
# for poi in muV; do
#       prof_name="_profile1D_syst_CMS_${poi}_VH_MET_${dirext}"
#       combineTool.py -d $output_ws $fggff_combine_int_model_opts -n $prof_name -P $poi --fastScan
#       plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_VH_MET_${dirext}" --main-label "Expected" --y-max 20 --translate translate_fa3.json
#       cp "./${poi}_VH_MET_${dirext}.png" $eosdir
# done


# datacard="Models/datacards/Datacard_allera_accat2_ALT_0M_fa3.txt"
# dirext="${tag}_VH_MET_combined_${ext}"
# output_ws="vh_met_workspace_${dirext}.root"
# #text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
# for poi in muV; do
#       prof_name="_profile1D_syst_CMS_${poi}_VH_MET_float_${dirext}"
#       combineTool.py -d $output_ws $fggff_combine_int_model_opts_float -n $prof_name -P $poi --fastScan
#       plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_VH_MET_float_${dirext}" --main-label "Expected" --y-max 20 --translate translate_fa3.json
#       cp "./${poi}_VH_MET_float_${dirext}.png" $eosdir
# done


# #########################################################################################################
#                                               VH LEP
# #########################################################################################################

# dirext="${tag}_VH_LEP_combined_fa3_${ext}"
# output_ws="vh_lep_workspace_${dirext}.root"
# datacard="Models/datacards/Datacard_${tag}_combined_${ext}_ANOM_STXS_VH_LEP_Int_fa3.txt"
# text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
# for poi in muV CMS_zz4l_fai1; do
#       prof_name="_profile1D_syst_CMS_${poi}_VH_LEP_${dirext}"
#       combineTool.py -d $output_ws $fggff_combine_int_model_opts -n $prof_name -P $poi --fastScan
#       plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_VH_LEP_${dirext}" --main-label "Expected" --y-max 20 --translate translate_fa3.json
#       cp "./${poi}_VH_LEP_${dirext}.png" $eosdir
#       cp "higgsCombine$prof_name.MultiDimFit.mH125.root" $eosdir
# done

# #########################################################################################################

# dirext="${tag}_combined_fa3_${ext}"
# output_ws="wh_workspace_${dirext}.root"
# datacard="Models/datacards/Datacard_${tag}_combined_${ext}_ANOM_STXS_WH_Int_fa3.txt"
# text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
# for poi in muV CMS_zz4l_fai1; do
#      prof_name="_profile1D_syst_CMS_${poi}_WHLeptonic_${dirext}"
#      combineTool.py -d $output_ws $fggff_combine_int_model_opts  -P $poi -n $prof_name --fastScan
#      plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_WHLeptonic_${dirext}" --main-label "Expected" --y-max 20 --translate translate_fa3.json  --POI $poi
#      cp "./${poi}_WHLeptonic_${dirext}.png" $eosdir
#      cp "higgsCombine$prof_name.MultiDimFit.mH125.root" $eosdir
# done

# dirext="${tag}_combined_fa3_${ext}"
# output_ws="zh_workspace_${dirext}.root"
# datacard="Models/datacards/Datacard_${tag}_combined_${ext}_ANOM_STXS_ZH_Int_fa3.txt"
# text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
# for poi in CMS_zz4l_fai1 muV; do
#      prof_name="_profile1D_syst_CMS_${poi}_ZHLeptonic_${dirext}"
#      combineTool.py -d $output_ws $fggff_combine_int_model_opts -P $poi -n $prof_name --fastScan
#      plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_ZHLeptonic_${dirext}" --main-label "Expected" --y-max 20 --translate translate_fa3.json  --POI $poi
#      mv "./${poi}_ZHLeptonic_${dirext}.png" $eosdir
#      cp "higgsCombine$prof_name.MultiDimFit.mH125.root" $eosdir
# done

# #########################################################################################################
#                                          VH LEP (TwoHiggsJPC)
# #########################################################################################################

# dirext="${tag}_combined_fa3_${ext}"
# output_ws="wh_workspace_${dirext}_twoHiggs.root"
# datacard="Models/datacards/Datacard_${tag}_combined_${ext}_ANOM_STXS_WH_twoHiggs_fa3.txt"
# text2workspace.py $datacard -o $output_ws $fggff_ws_twoHiggs_model_opts
# for poi in r; do
#      prof_name="_profile1D_syst_CMS_${poi}_WHLeptonic_${dirext}"
#      combineTool.py -d $output_ws $fggff_combine_twoHiggs_model_opts -P $poi -n $prof_name
#      plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_WHLeptonic_${dirext}" --main-label "Expected" --y-max 30
#      cp "./${poi}_WHLeptonic_${dirext}.png" $eosdir
#      cp "higgsCombine$prof_name.MultiDimFit.mH125.root" $eosdir
# done

#run: sed -i -e "s/2016preVFP.root/.root/g" ./Models/datacards/Datacard_Nov23_2016preVFP_2023_11_14_ANOM_STXS_WH_Int_fa3.txt
     # cp ../Signal/outdir_${dirext}/packaged/*root ./Models/signal/
     # cp ../Background/outdir_${dirext}/*root ./Models/background/

# for year in 2016preVFP 2016postVFP 2017; do
#      dirext="${tag}_${year}_fa3_${ext}"
#      output_ws="wh_workspace_${dirext}.root"
#      datacard="Models/datacards/Datacard_${tag}_${year}_${ext}_ANOM_STXS_WH_Int_fa3.txt"
#      text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
#      for poi in muV CMS_zz4l_fai1; do
#           prof_name="_profile1D_syst_CMS_${poi}_WHLeptonic_${dirext}"
#           combineTool.py -d $output_ws $fggff_combine_int_model_opts -P $poi -n $prof_name --floatOtherPOIs 1
#           plot1DScan.py "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_WHLeptonic_${dirext}" --y-max 20 --translate translate_fa3.json  --POI $poi --main-label "Expected"
#           cp "./${poi}_WHLeptonic_${dirext}.png" $eosdir
#      done
# done

# for year in 2016preVFP 2016postVFP 2017 2018; do
#      dirext="${tag}_${year}_fa3_${ext}"
#      output_ws="zh_workspace_${dirext}.root"
#      datacard="Models/datacards/Datacard_${tag}_${year}_${ext}_ANOM_STXS_ZH_Int_fa3.txt"
#      #text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
#      for poi in CMS_zz4l_fai1; do
#           prof_name="_profile1D_syst_CMS_${poi}_ZHLeptonic_${dirext}"
#           combineTool.py -d $output_ws $fggff_combine_int_model_opts -P $poi -n $prof_name
#           plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_ZHLeptonic_${dirext}" --main-label "Expected" --y-max 30
#           mv "./${poi}_ZHLeptonic_${dirext}.png" $eosdir
#      done
# done

# for year in 2016preVFP 2016postVFP 2017 2018; do
#      dirext="${tag}_${year}_fa3_${ext}"
#      output_ws="wh_workspace_${dirext}_twoHiggs.root"
#      datacard="Models/datacards/Datacard_${tag}_${year}_${ext}_ANOM_STXS_WH_twoHiggs_fa3.txt"
#      text2workspace.py $datacard -o $output_ws $fggff_ws_twoHiggs_model_opts
#      for poi in r x; do
#           prof_name="_profile1D_syst_CMS_${poi}_WHLeptonic_${dirext}"
#           combineTool.py -d $output_ws $fggff_combine_twoHiggs_model_opts -P $poi -n $prof_name
#           plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_WHLeptonic_${dirext}" --main-label "Expected" --y-max 30
#           cp "./${poi}_WHLeptonic_${dirext}.png" $eosdir
#      done
# done

# dirext="${tag}_combined_fa3_${ext}"
# output_ws="zh_workspace_${dirext}.root"
# datacard="Models/datacards/Datacard_${tag}_combined_${ext}_ANOM_STXS_ZH_Int_fa3.txt"
# text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
# for poi in muV CMS_zz4l_fai1; do
#      prof_name="_profile1D_syst_CMS_${poi}_ZHLeptonic_${dirext}"
#      combineTool.py -d $output_ws $fggff_combine_int_model_opts -P $poi -n $prof_name
#      plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_ZHLeptonic_${dirext}" --main-label "Expected" --y-max 30
#      mv "./${poi}_ZHLeptonic_${dirext}.png" $eosdir
# done

# dirext="${tag}_combined_fa3_${ext}"
# output_ws="wh_workspace_${dirext}.root"
# datacard="Models/datacards/Datacard_${tag}_combined_${ext}_ANOM_STXS_WH_Int_fa3.txt"
# text2workspace.py $datacard -o $output_ws $fggff_combine_int_model_opts
# for poi in CMS_zz4l_fai1 muV; do
#      combineTool.py -d $output_ws $fggff_combine_int_model_opts -n "_profile1D_syst_CMS_${poi}_WHLeptonic_${dirext}"
#      plot1DScan.py --POI $poi "higgsCombine_profile1D_syst_CMS_${poi}.MultiDimFit.mH125.root" -o "${poi}_WHLeptonic_${dirext}" --main-label "Expected" --y-max 30
#      cp "./${poi}_WHLeptonic_${dirext}.png" $eosdir
# done

# dirext="${tag}_combined_fa3_${ext}"
# output_ws="zh_workspace_${dirext}.root"
# datacard="Models/datacards/Datacard_${tag}_combined_${ext}_ANOM_STXS_ZH_Int_fa3.txt"
# text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
# for poi in muV CMS_zz4l_fai1; do
#      prof_name="_profile1D_syst_CMS_${poi}_ZHLeptonic_${dirext}"
#      combineTool.py -d $output_ws $fggff_combine_int_model_opts -P $poi -n $prof_name
#      plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_ZHLeptonic_${dirext}" --main-label "Expected" --y-max 30
#      mv "./${poi}_ZHLeptonic_${dirext}.png" $eosdir
# done

########################################################################################

# dirext="${tag}_combined_fa3_${ext}"
# output_ws="vh_lep_float_workspace_${dirext}.root"
# datacard="Models/datacards/Datacard_${tag}_combined_${ext}_ANOM_STXS_VH_LEP_Int_fa3.txt"
# echo $datacard
# text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
# for poi in muV CMS_zz4l_fai1; do
#       prof_name="_profile1D_syst_CMS_${poi}_VH_LEP_float_${dirext}"
#       combineTool.py -d $output_ws $fggff_combine_int_model_opts_float -n $prof_name -P $poi --fastScan
#       plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_VH_LEP_float_${dirext}" --main-label "Expected" --y-max 20 --translate translate_fa3.json
#       cp "./${poi}_VH_LEP_float_${dirext}.png" $eosdir
#       cp  "higgsCombine$prof_name.MultiDimFit.mH125.root" $eosdir
# done

dirext="${tag}_combined_fa3_${ext}"
output_ws="wh_float_workspace_${dirext}.root"
datacard="Models/datacards/Datacard_${tag}_combined_${ext}_ANOM_STXS_WH_Int_fa3.txt"
text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
for poi in muV CMS_zz4l_fai1; do
     prof_name="_profile1D_syst_CMS_${poi}_WHLeptonic_float_${dirext}" 
     combineTool.py -d $output_ws $fggff_combine_int_model_opts_float -n $prof_name -P $poi --fastScan
     plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_WHLeptonic_float_${dirext}" --main-label "Expected" --y-max 30 --translate translate_fa3.json
     cp "./${poi}_WHLeptonic_float_${dirext}.png" $eosdir
     cp  "higgsCombine$prof_name.MultiDimFit.mH125.root" $eosdir
done

dirext="${tag}_combined_fa3_${ext}"
output_ws="zh_float_workspace_${dirext}.root"
datacard="Models/datacards/Datacard_${tag}_combined_${ext}_ANOM_STXS_ZH_Int_fa3.txt"
text2workspace.py $datacard -o $output_ws $fggff_ws_int_model_opts
for poi in muV CMS_zz4l_fai1; do
     prof_name="_profile1D_syst_CMS_${poi}_ZHLeptonic_float_${dirext}"
     combineTool.py -d $output_ws $fggff_combine_int_model_opts_float -P $poi -n $prof_name --fastScan
     plot1DScan.py --POI $poi "higgsCombine$prof_name.MultiDimFit.mH125.root" -o "${poi}_ZHLeptonic_float_${dirext}" --main-label "Expected" --y-max 30 --translate translate_fa3.json
     cp "./${poi}_ZHLeptonic_float_${dirext}.png" $eosdir
     cp  "higgsCombine$prof_name.MultiDimFit.mH125.root" $eosdir
done
