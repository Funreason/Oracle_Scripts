alter session set current_schema=sms;

SELECT
  /*+ MONITOR CARDINALITY(LOAN 100000000) ORDERED FULL(LOAN) FULL(
  TRADE) FULL(PRODUCT) FULL(CHAN_MKG_REF) FULL(PROPERTY) FULL(
  PROP_LEGAL_INFO) FULL(COMMITMENT) FULL(BORROWER) FULL(
  LOAN_ADDITIONAL_DATA) FULL(BORROWER_GS_INFO) FULL(CONVRTBL_LN_INFO)
  NO_PUSH_PRED(LOAN_APPRAISAL_STATUS_VW)*/
  NVL(upper(loan.afi_ind),' '),
  NVL(upper(loan_rev_purp_cash_vw.all_cash_codes),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.all_dcsng_svr_codes),' '),
  NVL(upper(loan_disposition_vw.all_disp_codes),' '),
  NVL(upper(mnl_fqm_ovrd_rsn_vw.all_mnl_fqm_ovrd_rsn_desc),' '),
  NVL(upper(loan_sale_ovrd_vw.all_ovrd_codes),' '),
  NVL(upper(loan_program_code_pivot_vw.all_program_codes),' '),
  NVL(upper(loan_sale_error_vw.all_sale_errors),' '),
  NVL(upper(loan_sale_hist_vw.all_sale_ids),' '),
  NVL(upper(sys_fqm_ovrd_rsn_vw.all_sys_fqm_ovrd_rsn_desc),' '),
  NVL(upper(loan_alt_doc_vw.alt_doc_ids),' '),
  NVL(upper(appraisal_request.appr_doc_fl_id),' '),
  NVL(upper(property.appr_lic_num),' '),
  NVL(upper(property.appr_supv_lic_num),' '),
  property.appr_to_note_days_cnt,
  NVL(upper(as400_spec_feat_stg.as400_spec_feat_10_cde),' '),
  NVL(upper(as400_spec_feat_stg.as400_spec_feat_1_cde),' '),
  NVL(upper(as400_spec_feat_stg.as400_spec_feat_2_cde),' '),
  NVL(upper(as400_spec_feat_stg.as400_spec_feat_3_cde),' '),
  NVL(upper(as400_spec_feat_stg.as400_spec_feat_4_cde),' '),
  NVL(upper(as400_spec_feat_stg.as400_spec_feat_5_cde),' '),
  NVL(upper(as400_spec_feat_stg.as400_spec_feat_6_cde),' '),
  NVL(upper(as400_spec_feat_stg.as400_spec_feat_7_cde),' '),
  NVL(upper(as400_spec_feat_stg.as400_spec_feat_8_cde),' '),
  NVL(upper(as400_spec_feat_stg.as400_spec_feat_9_cde),' '),
  NVL(upper(loan_additional_data.as400_stat_cde),' '),
  NVL(upper(loan_salability.avm_ind),' '),
  ROUND (loan_additional_data.base_ltv_pct,3),
  loan_additional_data.base_mortg_amt,
  ROUND (loan_buydown_vw.bd_chg_rte_pct_1,2),
  ROUND (loan_buydown_vw.bd_chg_rte_pct_10,2),
  ROUND (loan_buydown_vw.bd_chg_rte_pct_2,2),
  ROUND (loan_buydown_vw.bd_chg_rte_pct_3,2),
  ROUND (loan_buydown_vw.bd_chg_rte_pct_4,2),
  ROUND (loan_buydown_vw.bd_chg_rte_pct_5,2),
  ROUND (loan_buydown_vw.bd_chg_rte_pct_6,2),
  ROUND (loan_buydown_vw.bd_chg_rte_pct_7,2),
  ROUND (loan_buydown_vw.bd_chg_rte_pct_8,2),
  ROUND (loan_buydown_vw.bd_chg_rte_pct_9,2),
  loan_buydown_vw.bd_chg_term_nbr_1,
  loan_buydown_vw.bd_chg_term_nbr_10,
  loan_buydown_vw.bd_chg_term_nbr_2,
  loan_buydown_vw.bd_chg_term_nbr_3,
  loan_buydown_vw.bd_chg_term_nbr_4,
  loan_buydown_vw.bd_chg_term_nbr_5,
  loan_buydown_vw.bd_chg_term_nbr_6,
  loan_buydown_vw.bd_chg_term_nbr_7,
  loan_buydown_vw.bd_chg_term_nbr_8,
  loan_buydown_vw.bd_chg_term_nbr_9,
  loan_buydown_vw.bd_pmt_num_amt_1,
  loan_buydown_vw.bd_pmt_num_amt_10,
  loan_buydown_vw.bd_pmt_num_amt_2,
  loan_buydown_vw.bd_pmt_num_amt_3,
  loan_buydown_vw.bd_pmt_num_amt_4,
  loan_buydown_vw.bd_pmt_num_amt_5,
  loan_buydown_vw.bd_pmt_num_amt_6,
  loan_buydown_vw.bd_pmt_num_amt_7,
  loan_buydown_vw.bd_pmt_num_amt_8,
  loan_buydown_vw.bd_pmt_num_amt_9,
  loan_buydown_vw.bd_pmt_prd_cnt_1,
  loan_buydown_vw.bd_pmt_prd_cnt_10,
  loan_buydown_vw.bd_pmt_prd_cnt_2,
  loan_buydown_vw.bd_pmt_prd_cnt_3,
  loan_buydown_vw.bd_pmt_prd_cnt_4,
  loan_buydown_vw.bd_pmt_prd_cnt_5,
  loan_buydown_vw.bd_pmt_prd_cnt_6,
  loan_buydown_vw.bd_pmt_prd_cnt_7,
  loan_buydown_vw.bd_pmt_prd_cnt_8,
  loan_buydown_vw.bd_pmt_prd_cnt_9,
  loan_buydown_vw.bd_rt_1,
  loan_buydown_vw.bd_rt_10,
  loan_buydown_vw.bd_rt_2,
  loan_buydown_vw.bd_rt_3,
  loan_buydown_vw.bd_rt_4,
  loan_buydown_vw.bd_rt_5,
  loan_buydown_vw.bd_rt_6,
  loan_buydown_vw.bd_rt_7,
  loan_buydown_vw.bd_rt_8,
  loan_buydown_vw.bd_rt_9,
  loan_buydown_vw.bd_rt_diff_amt_1,
  loan_buydown_vw.bd_rt_diff_amt_10,
  loan_buydown_vw.bd_rt_diff_amt_2,
  loan_buydown_vw.bd_rt_diff_amt_3,
  loan_buydown_vw.bd_rt_diff_amt_4,
  loan_buydown_vw.bd_rt_diff_amt_5,
  loan_buydown_vw.bd_rt_diff_amt_6,
  loan_buydown_vw.bd_rt_diff_amt_7,
  loan_buydown_vw.bd_rt_diff_amt_8,
  loan_buydown_vw.bd_rt_diff_amt_9,
  TO_CHAR (borrower_gs_info_1_vw.borrower_date_of_birth,'YYYYMMDD'),
  TO_CHAR (borrower_gs_info_2_vw.borrower_date_of_birth,'YYYYMMDD'),
  TO_CHAR (borrower_gs_info_3_vw.borrower_date_of_birth,'YYYYMMDD'),
  TO_CHAR (borrower_gs_info_4_vw.borrower_date_of_birth,'YYYYMMDD'),
  NVL(upper(borrower_gs_info_1_vw.borrower_ethnicity_cde),' '),
  NVL(upper(borrower_gs_info_2_vw.borrower_ethnicity_cde),' '),
  NVL(upper(borrower_gs_info_3_vw.borrower_ethnicity_cde),' '),
  NVL(upper(borrower_gs_info_4_vw.borrower_ethnicity_cde),' '),
  NVL(upper(borrower_gs_info_1_vw.borrower_race_2),' '),
  NVL(upper(borrower_gs_info_2_vw.borrower_race_2),' '),
  NVL(upper(borrower_gs_info_3_vw.borrower_race_2),' '),
  NVL(upper(borrower_gs_info_4_vw.borrower_race_2),' '),
  NVL(upper(borrower_gs_info_1_vw.borrower_race_3),' '),
  NVL(upper(borrower_gs_info_2_vw.borrower_race_3),' '),
  NVL(upper(borrower_gs_info_3_vw.borrower_race_3),' '),
  NVL(upper(borrower_gs_info_4_vw.borrower_race_3),' '),
  NVL(upper(borrower_gs_info_1_vw.borrower_race_4),' '),
  NVL(upper(borrower_gs_info_2_vw.borrower_race_4),' '),
  NVL(upper(borrower_gs_info_3_vw.borrower_race_4),' '),
  NVL(upper(borrower_gs_info_4_vw.borrower_race_4),' '),
  NVL(upper(borrower_gs_info_1_vw.borrower_race_5),' '),
  NVL(upper(borrower_gs_info_2_vw.borrower_race_5),' '),
  NVL(upper(borrower_gs_info_3_vw.borrower_race_5),' '),
  NVL(upper(borrower_gs_info_4_vw.borrower_race_5),' '),
  ROUND ((loan.ln_curr_int_rte - loan.ln_sbsdy_rte),4),
  borrower_gs_info_1_vw.brwr_age_nbr,
  borrower_gs_info_2_vw.brwr_age_nbr,
  borrower_gs_info_3_vw.brwr_age_nbr,
  borrower_gs_info_4_vw.brwr_age_nbr,
  borrower_1_vw.brwr_agy_fico_scor_nbr,
  borrower_2_vw.brwr_agy_fico_scor_nbr,
  borrower_3_vw.brwr_agy_fico_scor_nbr,
  borrower_4_vw.brwr_agy_fico_scor_nbr,
  NVL(upper(borrower_1_vw.brwr_agy_fico_src),' '),
  NVL(upper(borrower_2_vw.brwr_agy_fico_src),' '),
  NVL(upper(borrower_3_vw.brwr_agy_fico_src),' '),
  NVL(upper(borrower_4_vw.brwr_agy_fico_src),' '),
  NVL(upper(borrower_1_vw.brwr_bankrptcy_ind),' '),
  NVL(upper(borrower_2_vw.brwr_bankrptcy_ind),' '),
  NVL(upper(borrower_3_vw.brwr_bankrptcy_ind),' '),
  NVL(upper(borrower_4_vw.brwr_bankrptcy_ind),' '),
  NVL(upper(borrower_1_vw.brwr_citz_typ_cde),' '),
  NVL(upper(borrower_2_vw.brwr_citz_typ_cde),' '),
  NVL(upper(borrower_3_vw.brwr_citz_typ_cde),' '),
  NVL(upper(borrower_4_vw.brwr_citz_typ_cde),' '),
  NVL(upper(borrower_1_vw.brwr_cntry_cd),' '),
  TO_CHAR (loan_additional_data.brwr_corr_rte_lock_dt,'YYYYMMDD'),
  NVL(upper(borrower_gs_info_1_vw.brwr_counsel_conf_typ),' '),
  NVL(upper(borrower_gs_info_2_vw.brwr_counsel_conf_typ),' '),
  NVL(upper(borrower_gs_info_3_vw.brwr_counsel_conf_typ),' '),
  NVL(upper(borrower_gs_info_4_vw.brwr_counsel_conf_typ),' '),
  NVL(upper(borrower_gs_info_1_vw.brwr_counsel_format_typ),' '),
  NVL(upper(borrower_gs_info_2_vw.brwr_counsel_format_typ),' '),
  NVL(upper(borrower_gs_info_3_vw.brwr_counsel_format_typ),' '),
  NVL(upper(borrower_gs_info_4_vw.brwr_counsel_format_typ),' '),
  NVL(upper(borrower_1_vw.brwr_cred_rpt_id),' '),
  NVL(upper(borrower_2_vw.brwr_cred_rpt_id),' '),
  NVL(upper(borrower_3_vw.brwr_cred_rpt_id),' '),
  NVL(upper(borrower_4_vw.brwr_cred_rpt_id),' '),
  NVL(upper(borrower_1_vw.brwr_cred_rpt_ref_nbr),' '),
  NVL(upper(borrower_2_vw.brwr_cred_rpt_ref_nbr),' '),
  NVL(upper(borrower_3_vw.brwr_cred_rpt_ref_nbr),' '),
  NVL(upper(borrower_4_vw.brwr_cred_rpt_ref_nbr),' '),
  NVL(upper(borrower_1_vw.brwr_fgn_natl_ind),' '),
  NVL(upper(borrower_2_vw.brwr_fgn_natl_ind),' '),
  NVL(upper(borrower_3_vw.brwr_fgn_natl_ind),' '),
  NVL(upper(borrower_4_vw.brwr_fgn_natl_ind),' '),
  borrower_1_vw.brwr_fico_scor_nbr,
  borrower_2_vw.brwr_fico_scor_nbr,
  borrower_3_vw.brwr_fico_scor_nbr,
  borrower_4_vw.brwr_fico_scor_nbr,
  NVL(upper(borrower_1_vw.brwr_fn_pwe_ind),' '),
  NVL(upper(borrower_2_vw.brwr_fn_pwe_ind),' '),
  NVL(upper(borrower_3_vw.brwr_fn_pwe_ind),' '),
  NVL(upper(borrower_4_vw.brwr_fn_pwe_ind),' '),
  NVL(upper(borrower_1_vw.brwr_forclos_ind),' '),
  NVL(upper(borrower_2_vw.brwr_forclos_ind),' '),
  NVL(upper(borrower_3_vw.brwr_forclos_ind),' '),
  NVL(upper(borrower_4_vw.brwr_forclos_ind),' '),
  NVL(upper(borrower_gs_info_1_vw.brwr_fst_byr_ind),' '),
  NVL(upper(borrower_gs_info_2_vw.brwr_fst_byr_ind),' '),
  NVL(upper(borrower_gs_info_3_vw.brwr_fst_byr_ind),' '),
  NVL(upper(borrower_gs_info_4_vw.brwr_fst_byr_ind),' '),
  NVL(upper(borrower_gs_info_1_vw.brwr_fst_time_hmebyr_ind),' '),
  NVL(upper(borrower_gs_info_2_vw.brwr_fst_time_hmebyr_ind),' '),
  NVL(upper(borrower_gs_info_3_vw.brwr_fst_time_hmebyr_ind),' '),
  NVL(upper(borrower_gs_info_4_vw.brwr_fst_time_hmebyr_ind),' '),
  NVL(upper(borrower_gs_info_1_vw.brwr_gendr_cde),' '),
  NVL(upper(borrower_gs_info_2_vw.brwr_gendr_cde),' '),
  NVL(upper(borrower_gs_info_3_vw.brwr_gendr_cde),' '),
  NVL(upper(borrower_gs_info_4_vw.brwr_gendr_cde),' '),
  ROUND (borrower_gs_info_1_vw.brwr_hsng_exp_amt,2),
  NVL(upper(borrower_1_vw.brwr_lgl_entity_nme),' '),
  NVL(upper(borrower_1_vw.brwr_lgl_entity_typ),' '),
  NVL(upper(borrower_1_vw.brwr_mladcty_nme),' '),
  NVL(upper(borrower_1_vw.brwr_mladl1_txt),' '),
  NVL(upper(borrower_1_vw.brwr_mladr_cntry_cde),' '),
  NVL(upper(borrower_1_vw.brwr_mladr_same_ind),' '),
  NVL(upper(borrower_1_vw.brwr_mladst_cde),' '),
  NVL(upper(borrower_1_vw.brwr_mladzip_cde),' '),
  borrower_1_vw.brwr_mo_in_hm_qty,
  borrower_2_vw.brwr_mo_in_hm_qty,
  borrower_3_vw.brwr_mo_in_hm_qty,
  borrower_4_vw.brwr_mo_in_hm_qty,
  ROUND (borrower_gs_info_1_vw.brwr_mth_debt_amt,2),
  ROUND (borrower_1_vw.brwr_piti_ratio_pct,2),
  ROUND (borrower_2_vw.brwr_piti_ratio_pct,2),
  ROUND (borrower_3_vw.brwr_piti_ratio_pct,2),
  ROUND (borrower_4_vw.brwr_piti_ratio_pct,2),
  borrower_1_vw.brwr_posn_nbr,
  borrower_2_vw.brwr_posn_nbr ,
  borrower_gs_info_1_vw.brwr_posn_nbr,
  borrower_gs_info_2_vw.brwr_posn_nbr,
  borrower_gs_info_3_vw.brwr_posn_nbr,
  borrower_gs_info_4_vw.brwr_posn_nbr,
  borrower_gs_info_1_vw.brwr_qulfy_inc_amt,
  borrower_gs_info_2_vw.brwr_qulfy_inc_amt,
  borrower_gs_info_3_vw.brwr_qulfy_inc_amt,
  borrower_gs_info_4_vw.brwr_qulfy_inc_amt,
  NVL(upper(borrower_gs_info_1_vw.brwr_race_cde),' '),
  NVL(upper(borrower_gs_info_2_vw.brwr_race_cde),' '),
  NVL(upper(borrower_gs_info_3_vw.brwr_race_cde),' '),
  NVL(upper(borrower_gs_info_4_vw.brwr_race_cde),' '),
  NVL(upper(borrower_1_vw.brwr_self_emp_ind),' '),
  NVL(upper(borrower_2_vw.brwr_self_emp_ind),' '),
  NVL(upper(borrower_3_vw.brwr_self_emp_ind),' '),
  NVL(upper(borrower_4_vw.brwr_self_emp_ind),' '),
  borrower_1_vw.brwr_ssn_nbr,
  borrower_2_vw.brwr_ssn_nbr,
  borrower_3_vw.brwr_ssn_nbr,
  borrower_4_vw.brwr_ssn_nbr,
  borrower_gs_info_1_vw.brwr_tot_mth_inc_amt,
  borrower_gs_info_2_vw.brwr_tot_mth_inc_amt,
  borrower_gs_info_3_vw.brwr_tot_mth_inc_amt,
  borrower_gs_info_4_vw.brwr_tot_mth_inc_amt,
  ROUND (borrower_1_vw.brwr_tot_ratio_pct,2),
  ROUND (borrower_2_vw.brwr_tot_ratio_pct,2),
  ROUND (borrower_3_vw.brwr_tot_ratio_pct,2),
  ROUND (borrower_4_vw.brwr_tot_ratio_pct,2),
  TO_CHAR (borrower_1_vw.brwr_visa_expir_dt,'YYYYMMDD'),
  TO_CHAR (borrower_2_vw.brwr_visa_expir_dt,'YYYYMMDD'),
  TO_CHAR (borrower_3_vw.brwr_visa_expir_dt,'YYYYMMDD'),
  TO_CHAR (borrower_4_vw.brwr_visa_expir_dt,'YYYYMMDD'),
  NVL(upper(loan_additional_data.buydwn_contrib_typ),' '),
  floor(loan.ln_term_nbr - months_between (loan.ln_maturity_dte,
  SYSDATE)),
  ROUND(TRUNC(SYSDATE) - loan.ln_fnd_dte),
  NVL(upper(loan_rev_purp_cash_vw.cash_cd_1),' '),
  NVL(upper(loan_rev_purp_cash_vw.cash_cd_2),' '),
  NVL(upper(loan_rev_purp_cash_vw.cash_cd_3),' '),
  NVL(upper(loan_rev_purp_cash_vw.cash_cd_4),' '),
  NVL(upper(loan_rev_purp_cash_vw.cash_cd_5),' '),
  NVL(upper(loan_rev_purp_cash_vw.cash_cd_6),' '),
  NVL(upper(loan_rev_purp_cash_vw.cash_cd_7),' '),
  NVL(upper(loan_rev_purp_cash_vw.cash_cd_8),' '),
  NVL(upper(chan_mkg_ref.clnt_chan_cde),' '),
  NVL(upper(loan.clnt_id),' '),
  NVL(upper(loan.clnt_lex_lndr_cde),' '),
  NVL(upper(chan_mkg_ref.clnt_mkt_pgm_cde),' '),
  cls_cost_1_vw.cls_cost_cntrb_amt,
  cls_cost_2_vw.cls_cost_cntrb_amt,
  cls_cost_3_vw.cls_cost_cntrb_amt,
  cls_cost_4_vw.cls_cost_cntrb_amt,
  cls_cost_5_vw.cls_cost_cntrb_amt,
  cls_cost_6_vw.cls_cost_cntrb_amt,
  cls_cost_7_vw.cls_cost_cntrb_amt,
  cls_cost_8_vw.cls_cost_cntrb_amt,
  NVL(upper(cls_cost_1_vw.cls_cost_fnd_typ_cd),' '),
  NVL(upper(cls_cost_2_vw.cls_cost_fnd_typ_cd),' '),
  NVL(upper(cls_cost_3_vw.cls_cost_fnd_typ_cd),' '),
  NVL(upper(cls_cost_4_vw.cls_cost_fnd_typ_cd),' '),
  NVL(upper(cls_cost_5_vw.cls_cost_fnd_typ_cd),' '),
  NVL(upper(cls_cost_6_vw.cls_cost_fnd_typ_cd),' '),
  NVL(upper(cls_cost_7_vw.cls_cost_fnd_typ_cd),' '),
  NVL(upper(cls_cost_8_vw.cls_cost_fnd_typ_cd),' '),
  cls_cost_1_vw.cls_cost_seq_num,
  cls_cost_2_vw.cls_cost_seq_num,
  cls_cost_3_vw.cls_cost_seq_num,
  cls_cost_4_vw.cls_cost_seq_num,
  cls_cost_5_vw.cls_cost_seq_num,
  cls_cost_6_vw.cls_cost_seq_num,
  cls_cost_7_vw.cls_cost_seq_num,
  cls_cost_8_vw.cls_cost_seq_num,
  NVL(upper(cls_cost_1_vw.cls_cost_src_typ_cd),' '),
  NVL(upper(cls_cost_2_vw.cls_cost_src_typ_cd),' '),
  NVL(upper(cls_cost_3_vw.cls_cost_src_typ_cd),' '),
  NVL(upper(cls_cost_4_vw.cls_cost_src_typ_cd),' '),
  NVL(upper(cls_cost_5_vw.cls_cost_src_typ_cd),' '),
  NVL(upper(cls_cost_6_vw.cls_cost_src_typ_cd),' '),
  NVL(upper(cls_cost_7_vw.cls_cost_src_typ_cd),' '),
  NVL(upper(cls_cost_8_vw.cls_cost_src_typ_cd),' '),
  TO_CHAR (commitment.cmt_fnl_stl_dte,'YYYYMMDD'),
  NVL(upper(commitment.cmt_id),' '),
  NVL(upper(loan.cmt_id),' '),
  TO_CHAR (commitment.cmt_iss_dte,'YYYYMMDD'),
  NVL(upper(commitment.cmt_pool_id),' '),
  loan.comb_curr_bal_amt,
  loan_additional_data.concess_cntrb_ovrge_amt,
  NVL(upper(loan_salability.conduit_ind),' '),
  NVL(upper(property.const_ln_typ_cde),' '),
  NVL(upper(property.county_cond_id),' '),
  loan_salability.csh_out_tot_amt,
  loan_additional_data.csh_resv_amt,
  TO_CHAR (loan.cstr_perm_note_dte,'YYYYMMDD'),
  NVL(upper(loan_county_history_vw.curr_county_cond_id_1),' '),
  NVL(upper(loan_county_history_vw.curr_county_cond_id_10),' '),
  NVL(upper(loan_county_history_vw.curr_county_cond_id_2),' '),
  NVL(upper(loan_county_history_vw.curr_county_cond_id_3),' '),
  NVL(upper(loan_county_history_vw.curr_county_cond_id_4),' '),
  NVL(upper(loan_county_history_vw.curr_county_cond_id_5),' '),
  NVL(upper(loan_county_history_vw.curr_county_cond_id_6),' '),
  NVL(upper(loan_county_history_vw.curr_county_cond_id_7),' '),
  NVL(upper(loan_county_history_vw.curr_county_cond_id_8),' '),
  NVL(upper(loan_county_history_vw.curr_county_cond_id_9),' '),
  MOD((ln_curr_int_rte * 100000),125),
  MOD((ln_curr_int_rte * 100000),500),
  NVL(upper(
    CASE
      WHEN loan_salability.ln_dap_pgm_cd1 NOT IN ('TALREDMNT',
        'TUSSOLARP')
      THEN 'Y'
    END ),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.dcsng_svr_cd_1),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.dcsng_svr_cd_10),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.dcsng_svr_cd_2),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.dcsng_svr_cd_3),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.dcsng_svr_cd_4),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.dcsng_svr_cd_5),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.dcsng_svr_cd_6),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.dcsng_svr_cd_7),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.dcsng_svr_cd_8),' '),
  NVL(upper(loan_dcsng_svr_cd_vw.dcsng_svr_cd_9),' '),
  ROUND (loan_home_equity.disb_amt,2),
  dn_pmt_1_vw.dn_pmt_amt,
  dn_pmt_2_vw.dn_pmt_amt,
  dn_pmt_3_vw.dn_pmt_amt,
  dn_pmt_4_vw.dn_pmt_amt,
  dn_pmt_5_vw.dn_pmt_amt,
  dn_pmt_6_vw.dn_pmt_amt,
  dn_pmt_7_vw.dn_pmt_amt,
  dn_pmt_8_vw.dn_pmt_amt,
  dn_pmt_1_vw. dn_pmt_seq_num,
  dn_pmt_2_vw.dn_pmt_seq_num,
  dn_pmt_3_vw.dn_pmt_seq_num,
  dn_pmt_4_vw.dn_pmt_seq_num,
  dn_pmt_5_vw.dn_pmt_seq_num,
  dn_pmt_6_vw.dn_pmt_seq_num,
  dn_pmt_7_vw.dn_pmt_seq_num,
  dn_pmt_8_vw.dn_pmt_seq_num,
  NVL(upper(dn_pmt_1_vw.dn_pmt_src_typ_cd),' '),
  NVL(upper(dn_pmt_2_vw.dn_pmt_src_typ_cd),' '),
  NVL(upper(dn_pmt_3_vw.dn_pmt_src_typ_cd),' '),
  NVL(upper(dn_pmt_4_vw.dn_pmt_src_typ_cd),' '),
  NVL(upper(dn_pmt_5_vw.dn_pmt_src_typ_cd),' '),
  NVL(upper(dn_pmt_6_vw.dn_pmt_src_typ_cd),' '),
  NVL(upper(dn_pmt_7_vw.dn_pmt_src_typ_cd),' '),
  NVL(upper(dn_pmt_8_vw.dn_pmt_src_typ_cd),' '),
  NVL(upper(dn_pmt_1_vw.dn_pmt_typ_ref_cd),' '),
  NVL(upper(dn_pmt_2_vw.dn_pmt_typ_ref_cd),' '),
  NVL(upper(dn_pmt_3_vw.dn_pmt_typ_ref_cd),' '),
  NVL(upper(dn_pmt_4_vw.dn_pmt_typ_ref_cd),' '),
  NVL(upper(dn_pmt_5_vw.dn_pmt_typ_ref_cd),' '),
  NVL(upper(dn_pmt_6_vw.dn_pmt_typ_ref_cd),' '),
  NVL(upper(dn_pmt_7_vw.dn_pmt_typ_ref_cd),' '),
  NVL(upper(dn_pmt_8_vw.dn_pmt_typ_ref_cd),' '),
  NVL(upper(loan_alt_doc_vw.doc_id_1),' '),
  NVL(upper(loan_alt_doc_vw.doc_id_2),' '),
  NVL(upper(loan_alt_doc_vw.doc_id_3),' '),
  NVL(upper(loan_alt_doc_vw.doc_id_4),' '),
  NVL(upper(loan_additional_data.doc_tst_rslt_txt),' '),
  NVL(upper(loan.doc_typ_cde),' '),
  NVL(upper(loan_additional_data.dti_thr_tst_rslt_txt),' '),
  NVL(upper(loan_real_info.du_cr_rsk_cls_cd),' '),
  NVL(upper(loan_real_info.du_elig_ind),' '),
  ROUND (loan_salability.ecrw_compl_amt,2),
  ROUND(ln_ecs_scor_nbr, 0),
  NVL(upper(loan_additional_data.emp_ln_ind),' '),
  NVL(upper(loan_salability.exceptn_outcome_txt),' '),
  NVL(upper(loan_salability.exceptn_rsn_txt),' '),
  NVL(upper(loan_feature_fhlmc_vw.feat_cde_1),' '),
  NVL(upper(loan_feature_fnma_vw.feat_cde_1),' '),
  NVL(upper(loan_feature_fhlmc_vw.feat_cde_10),' '),
  NVL(upper(loan_feature_fnma_vw.feat_cde_10),' '),
  NVL(upper(loan_feature_fhlmc_vw.feat_cde_2),' '),
  NVL(upper(loan_feature_fnma_vw.feat_cde_2),' '),
  NVL(upper(loan_feature_fhlmc_vw.feat_cde_3),' '),
  NVL(upper(loan_feature_fnma_vw.feat_cde_3),' '),
  NVL(upper(loan_feature_fhlmc_vw.feat_cde_4),' '),
  NVL(upper(loan_feature_fnma_vw.feat_cde_4),' '),
  NVL(upper(loan_feature_fhlmc_vw.feat_cde_5),' '),
  NVL(upper(loan_feature_fnma_vw.feat_cde_5),' '),
  NVL(upper(loan_feature_fhlmc_vw.feat_cde_6),' '),
  NVL(upper(loan_feature_fnma_vw.feat_cde_6),' '),
  NVL(upper(loan_feature_fhlmc_vw.feat_cde_7),' '),
  NVL(upper(loan_feature_fnma_vw.feat_cde_7),' '),
  NVL(upper(loan_feature_fhlmc_vw.feat_cde_8),' '),
  NVL(upper(loan_feature_fnma_vw.feat_cde_8),' '),
  NVL(upper(loan_feature_fhlmc_vw.feat_cde_9),' '),
  NVL(upper(loan_feature_fnma_vw.feat_cde_9),' '),
  NVL(upper(loan_additional_data.fedrl_hpm_cde),' '),
  NVL(upper(loan_appraisal_status_vw.fh_appraisal_status),' '),
  TO_CHAR (loan_additional_data.fha_case_asn_dte,'YYYYMMDD'),
  TO_CHAR (loan_reverse.fha_case_assign_dte,'YYYYMMDD'),
  NVL(upper(loan_feature_fhlmc_vw.fhlmc_feat_codes),' '),
  loan_additional_data.fltt_dir_loan_amt,
  NVL(upper(loan_appraisal_status_vw.fn_appraisal_status),' '),
  NVL(upper(loan_feature_fnma_vw.fnma_feat_codes),' '),
  NVL(upper(loan_additional_data.fqm_fltt_tst_rslt_txt),' '),
  NVL(upper(loan_additional_data.fqm_mnl_ovrd_other_rsn_desc),' '),
  EXTRACT(MONTH FROM loan.ln_fst_pmt_due_dte),
  TO_CHAR (loan_reverse.fst_signing_dte,'YYYYMMDD'),
  NVL(upper(loan.grade_cde),' '),
  NVL(upper(
    CASE
      WHEN loan_program_code_pivot_vw.all_program_codes LIKE '%FN%'
      OR loan_program_code_pivot_vw.all_program_codes LIKE '%FN2FN%'
      THEN 'FNMAHARP'
      WHEN loan_program_code_pivot_vw.all_program_codes LIKE '%FD%'
      OR loan_program_code_pivot_vw.all_program_codes LIKE '%FD2FD%'
      THEN 'FHLMCHARP'
      WHEN loan_program_code_pivot_vw.all_program_codes LIKE '%DR%'
      OR loan_program_code_pivot_vw.all_program_codes LIKE '%DUREFI%'
      THEN 'DUREFI'
      WHEN loan_program_code_pivot_vw.all_program_codes LIKE
        '%HARPMI%'
      THEN 'HARPMI'
    END ),' '),
  NVL(upper(loan_reverse.hecm_to_hecm_ind),' '),
  NVL(upper(
    CASE
      WHEN loan_salability.ln_fnma_del_fee > 0
      THEN 'Y'
      WHEN loan_salability.ln_fnma_del_fee <= 0
      THEN 'N'
    END ),' '),
  NVL(upper(loan_additional_data.high_bal_ind),' '),
  NVL(upper(loan_salability.housing_lates_cnt),' '),
  NVL(upper(prop_unit_info_vw.hud_spcl_afrdbl_ind_1),' '),
  NVL(upper(prop_unit_info_vw.hud_spcl_afrdbl_ind_10),' '),
  NVL(upper(prop_unit_info_vw.hud_spcl_afrdbl_ind_2),' '),
  NVL(upper(prop_unit_info_vw.hud_spcl_afrdbl_ind_3),' '),
  NVL(upper(prop_unit_info_vw.hud_spcl_afrdbl_ind_4),' '),
  NVL(upper(prop_unit_info_vw.hud_spcl_afrdbl_ind_5),' '),
  NVL(upper(prop_unit_info_vw.hud_spcl_afrdbl_ind_6),' '),
  NVL(upper(prop_unit_info_vw.hud_spcl_afrdbl_ind_7),' '),
  NVL(upper(prop_unit_info_vw.hud_spcl_afrdbl_ind_8),' '),
  NVL(upper(prop_unit_info_vw.hud_spcl_afrdbl_ind_9),' '),
  loan_additional_data.hve_pt_val_est_age_days,
  NVL(upper(adjustbl_ln_info.idx_type_cde),' '),
  NVL(upper(loan.invr_cde),' '),
  TO_CHAR (ADD_MONTHS(TRUNC(SYSDATE), -1),'YYYYMMDD'),
  NVL(upper(wholesal_ln_info.lex_cmt_id),' '),
  loan_salability.lis_cmt_bank_nbr,
  NVL(upper(loan.lis_prod_cde),' '),
  NVL(upper(loan.lms_ln_purp_cde),' '),
  NVL(upper(property.lms_prop_typ_cde),' '),
  ROUND (loan.ln_1chg_rte_pct,2),
  NVL(upper(loan.ln_1day_ok_ind),' '),
  ROUND (loan.ln_2chg_rte_pct,4),
  ROUND (loan.ln_3chg_rte_pct,4),
  NVL(upper(loan_salability.ln_ad_tool_cde),' '),
  ROUND (adjustbl_ln_info.ln_adj_to_idx_pct,5),
  loan.ln_age_mth,
  NVL(upper(loan.ln_agy_cnform_ind),' '),
  NVL(upper(loan.ln_amort_term_nbr),' '),
  NVL(upper(loan.ln_amort_type_cde),' '),
  loan_mortgage_ins.ln_annual_mip_rte,
  TO_CHAR (loan_additional_data.ln_applc_dte,'YYYYMMDD'),
  NVL(upper(loan.ln_avr_act_cde),' '),
  NVL(upper(loan_salability.ln_brkr_in_ind),' '),
  NVL(upper(loan.ln_busn_line_cde),' '),
  NVL(upper(loan.ln_busn_line_struct_cde),' '),
  NVL(upper(loan.ln_busn_pgm_cde),' '),
  NVL(upper(loan.ln_busn_typ_new_cde),' '),
  NVL(upper(loan.ln_busn_type_cde),' '),
  NVL(upper(loan.ln_buy_dwn_cde),' '),
  NVL(upper(loan.ln_buy_dwn_type_cde),' '),
  NVL(upper(loan_salability.ln_cap_mkt_group_cde),' '),
  NVL(upper(loan_salability.ln_case_nbr),' '),
  NVL(upper(loan_salability.ln_case_nbr_ind),' '),
  NVL(upper(loan.ln_cash_on_hand_ind),' '),
  NVL(upper(loan.ln_cfrm_lst_yr_ind),' '),
  NVL(upper(loan.ln_chan_cde),' '),
  NVL(upper(loan.ln_clsr_id),' '),
  convrtbl_ln_info.ln_cnvrt_prd_nbr,
  NVL(upper(loan_salability.ln_collat_rev_cde),' '),
  ROUND (loan.ln_comb_bal_amt,0),
  ROUND (loan.ln_comb_ltv_pct,4),
  NVL(upper(property.ln_condo_prj_nme),' '),
  NVL(upper(loan_additional_data.ln_coop_proj_id),' '),
  NVL(upper(loan_salability.ln_cr_dec_cd),' '),
  NVL(upper(loan_salability.ln_cr_rsk_cl_cd),' '),
  NVL(upper(loan.ln_cred_grad_cde),' '),
  ROUND (loan.ln_curr_int_rte,5),
  NVL(upper(loan.ln_curr_stat_cde),' '),
  TO_CHAR (loan.ln_curt_lst_pymt_dte,'YYYYMMDD'),
  NVL(upper(loan_salability.ln_dap_pgm_cd1),' '),
  NVL(upper(loan_salability.ln_dap_pgm_cd2),' '),
  NVL(upper(loan_salability.ln_dap_pgm_cd3),' '),
  NVL(upper(loan.ln_decision_review_lvl_cd),' '),
  NVL(upper(loan_disposition_vw.ln_disp_cde_1),' '),
  NVL(upper(loan_disposition_vw.ln_disp_cde_10),' '),
  NVL(upper(loan_disposition_vw.ln_disp_cde_2),' '),
  NVL(upper(loan_disposition_vw.ln_disp_cde_3),' '),
  NVL(upper(loan_disposition_vw.ln_disp_cde_4),' '),
  NVL(upper(loan_disposition_vw.ln_disp_cde_5),' '),
  NVL(upper(loan_disposition_vw.ln_disp_cde_6),' '),
  NVL(upper(loan_disposition_vw.ln_disp_cde_7),' '),
  NVL(upper(loan_disposition_vw.ln_disp_cde_8),' '),
  NVL(upper(loan_disposition_vw.ln_disp_cde_9),' '),
  NVL(upper(loan.ln_doc_lvl_cde),' '),
  NVL(upper(loan.ln_doc_nme),' '),
  NVL(upper(loan.ln_doc_option_cd),' '),
  NVL(upper(loan_real_info.ln_dsrvr_crd_rsk_cls),' '),
  NVL(upper(loan_salability.ln_du_case_num),' '),
  NVL(upper(loan_additional_data.ln_du_excpt_unit_ind),' '),
  NVL(upper(loan_salability.ln_du_recommend_cde),' '),
  NVL(upper(loan.ln_e_mtg_ind),' '),
  NVL(upper(loan.ln_eap_elg_rsn_cde),' '),
  NVL(upper(loan.ln_eap_elig_ind),' '),
  NVL(upper(loan.ln_ecs_scor_cde),' '),
  loan.ln_ecs_scor_nbr,
  loan.ln_ecs_ver_nbr,
  NVL(upper(loan.ln_entity_cde),' '),
  NVL(upper(loan_additional_data.ln_fh_proj_class_cde),' '),
  NVL(upper(loan.ln_fha_sect_of_act_cde),' '),
  loan_salability.ln_fhlmc_del_fee,
  NVL(upper(loan.ln_fico_scor_cde),' '),
  loan.ln_fico_scor_nbr,
  NVL(upper(loan_salability.ln_fmly_cde),' '),
  TO_CHAR (loan.ln_fnd_dte,'YYYYMMDD'),
  loan_salability.ln_fnma_del_fee,
  adjustbl_ln_info.ln_fst_adj_cap_pct,
  TO_CHAR (loan.ln_fst_pmt_due_dte,'YYYYMMDD'),
  NVL(upper(loan_additional_data.ln_gnnd_ind),' '),
  NVL(upper(loan_additional_data.ln_gov_insur_ind),' '),
  NVL(upper(loan.ln_hme_acc_cde),' '),
  NVL(upper(loan.ln_hme_acc_ind),' '),
  loan.ln_icc_cde,
  TO_CHAR (loan.ln_imd_dlv_dte,'YYYYMMDD'),
  NVL(upper(loan.ln_imd_dlv_ind),' '),
  TO_CHAR (loan.ln_int_acrl_dte,'YYYYMMDD'),
  loan.ln_int_only_prd,
  TO_CHAR (ADD_MONTHS(TRUNC(loan.ln_fst_pmt_due_dte), -1),'YYYYMMDD')
  ,
  TO_CHAR (loan.ln_int_rte_qte_dte,'YYYYMMDD'),
  NVL(upper(loan.ln_invr_id),' '),
  NVL(upper(loan_salability.ln_lp_bulk_ind),' '),
  TO_CHAR (loan_additional_data.ln_lp_dec_dte,'YYYYMMDD'),
  NVL(upper(loan_salability.ln_lp_key_nbr),' '),
  TO_CHAR (loan.ln_lst_pmt_rcd_dte,'YYYYMMDD'),
  NVL(upper(loan_salability.ln_map_center_cd),' '),
  TO_CHAR (loan.ln_maturity_dte,'YYYYMMDD'),
  max_buydown.ln_max_bd_chg_term_nbr,
  adjustbl_ln_info.ln_max_int_inc_pct,
  max_buydown.ln_max_temp_bd_rt,
  NVL(upper(loan.ln_mers_rgstr_ind),' '),
  NVL(upper(loan_mortgage_ins.ln_mi_auto_ordr_ind),' '),
  NVL(upper(loan_mortgage_ins.ln_mi_cert_id),' '),
  ROUND (loan_mortgage_ins.ln_mi_cvrg_pct,3),
  TO_CHAR (loan_mortgage_ins.ln_mi_fst_prm_dte,'YYYYMMDD'),
  NVL(upper(loan_mortgage_ins.ln_mi_ins_nbr),' '),
  NVL(upper(loan_mortgage_ins.ln_mi_pd_typ_cde),' '),
  NVL(upper(loan_mortgage_ins.ln_mi_pln_id),' '),
  loan_mortgage_ins.ln_mi_prem_amt,
  NVL(upper(loan_mortgage_ins.ln_mi_renew_cde),' '),
  NVL(upper(loan_mortgage_ins.ln_mi_sng_prem_ind),' '),
  NVL(upper(loan.ln_min_doc_typ),' '),
  adjustbl_ln_info.ln_min_int_inc_pct,
  NVL(upper(loan.ln_min_nbr),' '),
  TO_CHAR (loan_additional_data.ln_mod_eff_dte,'YYYYMMDD'),
  loan.ln_mod_ln_amt,
  NVL(upper(loan_mortgage_ins.ln_mtg_pfin_ind),' '),
  NVL(upper(loan.ln_nocnfm_crd_ind),' '),
  NVL(upper(loan.ln_non_trdtn_cr_ind),' '),
  TO_CHAR (loan.ln_note_dte,'YYYYMMDD'),
  NVL(upper(loan_additional_data.ln_note_pay_to_txt),' '),
  NVL(upper(loan.ln_note_stat_cde),' '),
  loan_additional_data.ln_num_mort_prop_cnt,
  TO_CHAR (adjustbl_ln_info.ln_nxt_int_chg_dte,'YYYYMMDD'),
  TO_CHAR (loan.ln_nxt_pmt_due_dte,'YYYYMMDD'),
  loan.ln_orgnl_amt,
  loan.ln_orgnl_int_rte,
  NVL(upper(loan.ln_orig_au_cde),' '),
  NVL(upper(loan.ln_orig_lpo_cde),' '),
  ROUND (loan.ln_orig_ltv_pct,4),
  ROUND (loan.ln_orig_pi_amt,2),
  NVL(upper(loan.ln_orig_source),' '),
  ROUND (loan.ln_oth_fin_amt,2),
  NVL(upper(loan.ln_pgm_cde),' '),
  NVL(upper(loan.ln_pl_ins_ctg_cde),' '),
  NVL(upper(wholesal_ln_info.ln_pool_cert_ind),' '),
  loan.ln_ppmt_mm_qty,
  NVL(upper(loan_salability.ln_prc_rsk_cl_cd),' '),
  adjustbl_ln_info.ln_prd_dcr_pct,
  adjustbl_ln_info.ln_prd_inc_pct,
  NVL(upper(loan.ln_prod_disp_cde),' '),
  NVL(upper(loan_salability.ln_prod_opt_cde),' '),
  NVL(upper(loan_additional_data.ln_proj_class),' '),
  NVL(upper(loan.ln_purp_cde),' '),
  ROUND (loan.ln_qlfy_int_rte,2),
  NVL(upper(loan.ln_relo_ind),' '),
  ROUND (loan_reverse.ln_rev_income_amt,2),
  TO_CHAR (loan.ln_rgstr_dte,'YYYYMMDD'),
  NVL(upper(loan.ln_rsca_id),' '),
  loan.ln_rtelck_dd_qty,
  TO_CHAR (loan.ln_rtelck_dte,'YYYYMMDD'),
  NVL(upper(wholesal_ln_info.ln_rtnd_ind),' '),
  NVL(upper(loan_sale.ln_sale_disp_cde),' '),
  NVL(upper(loan_sale.ln_sale_ind),' '),
  NVL(upper(loan_sale.ln_sale_risk_cde),' '),
  NVL(upper(loan_additional_data.ln_sbord_frd_cde),' '),
  NVL(upper(loan.ln_sbsdy_cde),' '),
  ROUND (loan.ln_sbsdy_rte,5),
  NVL(upper(loan_salability.ln_scndy_fnce_cde),' '),
  NVL(upper(loan_additional_data.ln_scra_ind),' '),
  NVL(upper(loan_mortgage_ins.ln_sect_act_cde),' '),
  NVL(upper(loan_salability.ln_sect_act_cde),' '),
  NVL(upper(loan.ln_serv_file_cde),' '),
  loan.ln_serv_nbr,
  NVL(upper(loan_salability.ln_sgnft_inacc_ind),' '),
  NVL(upper(loan.ln_simul_second_ind),' '),
  NVL(upper(loan_sale.ln_sle_fh_elig_ind),' '),
  NVL(upper(loan_sale.ln_sle_fn_elig_ind),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_1),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_10),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_11),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_12),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_13),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_14),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_15),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_16),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_17),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_18),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_19),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_2),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_20),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_21),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_22),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_23),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_24),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_25),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_26),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_27),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_28),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_29),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_3),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_30),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_4),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_5),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_6),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_7),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_8),' '),
  NVL(upper(loan_sale_hist_vw.ln_sle_obj_id_9),' '),
  loan.ln_stat_cde,
  TO_CHAR (loan.ln_stat_dte,'YYYYMMDD'),
  NVL(upper(loan.ln_sub_doc_cde),' '),
  NVL(upper(loan_salability.ln_table_fund_ind),' '),
  NVL(upper(loan.ln_team_id),' '),
  NVL(upper(loan.ln_temp_bd_cde),' '),
  loan.ln_term_nbr,
  ROUND (loan.ln_tot_ltv_pct,4),
  NVL(upper(loan.ln_type_cde),' '),
  ROUND (loan.ln_unpd_bal_amt,2),
  NVL(upper(loan.ln_unsal_excp_cde),' '),
  loan_mortgage_ins.ln_upfront_mip_rte,
  NVL(upper(loan.ln_uwr_auth_level_cde),' '),
  NVL(upper(loan.ln_uwr_cde),' '),
  NVL(upper(loan.loan_hoepa_status),' '),
  NVL(upper(loan.loan_lien_status),' '),
  NVL(upper(loan_additional_data.loan_orig_co_id),' '),
  NVL(upper(loan_additional_data.loan_orig_id),' '),
  ROUND (loan.loan_rate_spread,3),
  NVL(upper(loan.loan_uwr_type_cde),' '),
  TO_CHAR (loan_reverse.lock_expir_dte,'YYYYMMDD'),
  NVL(upper(loan_salability.loss_mit_code),' '),
  NVL(upper(
    CASE
      WHEN
        (
          loan.ln_icc_cde                IN ('237','238','245')
        OR loan_salability.loss_mit_code IN ('1','2')
        )
      AND loan.ln_mod_ln_amt > 0
      THEN 'Y'
    END ),' '),
  NVL(upper(loan_additional_data.lp_aftr_nte_dte_aprvl_ind),' '),
  NVL(upper(loan_real_info.lp_elig_ind),' '),
  NVL(upper(loan_additional_data.lvng_rvcl_trst_ind),' '),
  loan_reverse.max_prin_limit_amt,
  NVL(upper(loan_reverse.mi_cash_fnl_cde),' '),
  NVL(upper(LENGTH (loan_mortgage_ins.ln_mi_cert_id)),' '),
  NVL(upper(
    CASE
      WHEN regexp_like(trim(loan_mortgage_ins.ln_mi_cert_id),
        '^[\+\-]?[0-9]*\.?[0-9]+$')
      THEN LENGTH (TO_NUMBER (ln_mi_cert_id))
      ELSE LENGTH (ln_mi_cert_id)
    END ),' '),
  loan_mortgage_ins.mi_one_time_tot_amt,
  NVL(upper(loan_additional_data.mnl_fqm_ovrd_rslt_cd),' '),
  NVL(upper(mnl_fqm_ovrd_rsn_vw.mnl_fqm_ovrd_rsn_desc_1),' '),
  NVL(upper(mnl_fqm_ovrd_rsn_vw.mnl_fqm_ovrd_rsn_desc_2),' '),
  NVL(upper(mnl_fqm_ovrd_rsn_vw.mnl_fqm_ovrd_rsn_desc_3),' '),
  NVL(upper(mnl_fqm_ovrd_rsn_vw.mnl_fqm_ovrd_rsn_desc_4),' '),
  NVL(upper(mnl_fqm_ovrd_rsn_vw.mnl_fqm_ovrd_rsn_desc_5),' '),
  ROUND (loan_reverse.mo_srvc_fee_amt,2),
  loan_additional_data.mod_orig_act_int_rte_note_pct,
  NVL(upper(loan_additional_data.mod_orig_amort_type),' '),
  NVL(upper(loan_additional_data.mod_orig_balloon_pmt_ind),' '),
  loan_additional_data.mod_orig_chg_rt_adj_mo_cnt,
  loan_additional_data.mod_orig_init_fix_eff_mo_cnt,
  NVL(upper(loan_additional_data.mod_orig_int_calc_typ),' '),
  NVL(upper(loan_additional_data.mod_orig_int_only_ind),' '),
  loan_additional_data.mod_orig_int_only_term_mo_cnt,
  TO_CHAR (loan_additional_data.mod_orig_maturity_dte,'YYYYMMDD'),
  NVL(upper(loan_additional_data.mod_orig_mortg_typ_cde),' '),
  loan_additional_data.mod_orig_note_repaid_amt,
  NVL(upper(loan_additional_data.mod_orig_pmt_freq_typ),' '),
  TO_CHAR (loan_additional_data.mod_orig_sched_fst_pay_dte,'YYYYMMDD'
  ),
  NVL(upper(loan_reverse.mortg_applied_typ),' '),
  NVL(upper(property.msa_cde),' '),
  TO_CHAR (prop_legal_info.mtg_dte,'YYYYMMDD'),
  ROUND(MONTHS_BETWEEN(adjustbl_ln_info.ln_nxt_int_chg_dte,
  loan.ln_fst_pmt_due_dte)),
  NVL(upper(loan_real_info.mx_like_ind),' '),
  NVL(upper(loan.non_prim_ind),' '),
  NVL(upper(loan_salability.non_prime_purp_of_cash),' '),
  loan.num_of_brwr_cnt,
  EXTRACT(MONTH FROM adjustbl_ln_info.ln_nxt_int_chg_dte)-1,
  NVL(upper(loan_additional_data.orig_inv_ln_nbr),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_1),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_10),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_11),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_12),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_13),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_14),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_15),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_16),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_17),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_18),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_19),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_2),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_20),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_21),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_22),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_23),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_24),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_25),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_26),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_27),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_28),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_29),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_3),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_30),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_4),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_5),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_6),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_7),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_8),' '),
  NVL(upper(loan_status_histry_vw.orig_stat_cd_9),' '),
  NVL(upper(loan.orig_sys_id),' '),
  ROUND (CAST(loan.ln_orgnl_amt AS FLOAT),2),
  ROUND (loan_home_equity.other_fin_line_bal,2),
  ROUND (loan_home_equity.other_fin_loan_bal,2),
  ROUND (loan_home_equity.other_line_bal,2),
  ROUND (loan_home_equity.other_line_limit,1),
  ROUND (loan_home_equity.other_loan_bal,2),
  ROUND (loan_home_equity.other_new_fin_line_bal,2),
  ROUND (loan_home_equity.other_new_fin_loan_bal,2),
  NVL(upper(loan_sale_ovrd_vw.ovrd_cde_1),' '),
  NVL(upper(loan_sale_ovrd_vw.ovrd_cde_10),' '),
  NVL(upper(loan_sale_ovrd_vw.ovrd_cde_2),' '),
  NVL(upper(loan_sale_ovrd_vw.ovrd_cde_3),' '),
  NVL(upper(loan_sale_ovrd_vw.ovrd_cde_4),' '),
  NVL(upper(loan_sale_ovrd_vw.ovrd_cde_5),' '),
  NVL(upper(loan_sale_ovrd_vw.ovrd_cde_6),' '),
  NVL(upper(loan_sale_ovrd_vw.ovrd_cde_7),' '),
  NVL(upper(loan_sale_ovrd_vw.ovrd_cde_8),' '),
  NVL(upper(loan_sale_ovrd_vw.ovrd_cde_9),' '),
  NVL(upper(loan.pgm_cde),' '),
  NVL(upper(loan_program_code_pivot_vw.pgm_cde_1),' '),
  NVL(upper(loan_program_code_pivot_vw.pgm_cde_10),' '),
  NVL(upper(loan_program_code_pivot_vw.pgm_cde_2),' '),
  NVL(upper(loan_program_code_pivot_vw.pgm_cde_3),' '),
  NVL(upper(loan_program_code_pivot_vw.pgm_cde_4),' '),
  NVL(upper(loan_program_code_pivot_vw.pgm_cde_5),' '),
  NVL(upper(loan_program_code_pivot_vw.pgm_cde_6),' '),
  NVL(upper(loan_program_code_pivot_vw.pgm_cde_7),' '),
  NVL(upper(loan_program_code_pivot_vw.pgm_cde_8),' '),
  NVL(upper(loan_program_code_pivot_vw.pgm_cde_9),' '),
  NVL(upper(loan_additional_data.pgm_tracking_cde),' '),
  NVL(upper(loan_real_info.pilot_cd),' '),
  NVL(upper(loan_additional_data.post_cls_fqm_stat_cde),' '),
  NVL(upper(loan_additional_data.post_cls_modfy_by_usr_id),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_1),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_10),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_11),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_12),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_13),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_14),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_15),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_16),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_17),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_18),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_19),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_2),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_20),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_21),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_22),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_23),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_24),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_25),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_26),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_27),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_28),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_29),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_3),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_30),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_4),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_5),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_6),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_7),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_8),' '),
  NVL(upper(loan_status_histry_vw.pr_stat_cd_9),' '),
  NVL(upper(loan_county_history_vw.prev_county_cond_id_1),' '),
  NVL(upper(loan_county_history_vw.prev_county_cond_id_10),' '),
  NVL(upper(loan_county_history_vw.prev_county_cond_id_2),' '),
  NVL(upper(loan_county_history_vw.prev_county_cond_id_3),' '),
  NVL(upper(loan_county_history_vw.prev_county_cond_id_4),' '),
  NVL(upper(loan_county_history_vw.prev_county_cond_id_5),' '),
  NVL(upper(loan_county_history_vw.prev_county_cond_id_6),' '),
  NVL(upper(loan_county_history_vw.prev_county_cond_id_7),' '),
  NVL(upper(loan_county_history_vw.prev_county_cond_id_8),' '),
  NVL(upper(loan_county_history_vw.prev_county_cond_id_9),' '),
  NVL(upper(loan_additional_data.prev_ln_acq_type),' '),
  NVL(upper(loan_additional_data.prev_ln_invstr_id),' '),
  NVL(upper(loan_additional_data.prev_ln_mi_cert_id),' '),
  ROUND (loan_additional_data.prev_ln_mi_cvrg_pct,3),
  NVL(upper(loan_additional_data.prev_ln_mi_ins_nbr),' '),
  NVL(upper(product.prod_grp_nme),' '),
  NVL(upper(loan.prod_lne_cde),' '),
  NVL(upper(product.prod_lne_cde),' '),
  NVL(upper(product.prod_nme),' '),
  NVL(upper(loan_additional_data.prod_rstr_tst_rslt_txt),' '),
  NVL(upper(product.prod_val_fhlmc_ind),' '),
  NVL(upper(product.prod_val_fnma_ind),' '),
  TO_CHAR (property.prop_appr_dte,'YYYYMMDD'),
  NVL(upper(property.prop_appr_form_typ),' '),
  NVL(upper(property.prop_appr_rpt_review_ind),' '),
  NVL(upper(property.prop_appr_typ),' '),
  ROUND (property.prop_appr_val_amt,0),
  NVL(upper(property.prop_attch_cde),' '),
  property.prop_blt_yr,
  NVL(upper(property.prop_class_cde),' '),
  NVL(upper(property.prop_condo_prj_status),' '),
  NVL(upper(property.prop_const_stat_cde),' '),
  NVL(upper(property.prop_deed_rest_ind),' '),
  NVL(upper(property.prop_estat_held_typ_cde),' '),
  NVL(upper(property.prop_ins_cde),' '),
  NVL(upper(property.prop_leasehold_ind),' '),
  NVL(upper(property.prop_lp_appr_form),' '),
  NVL(upper(property.prop_mladcnt_nme),' '),
  NVL(upper(property.prop_mladcty_nme),' '),
  NVL(upper(property.prop_mladst_cde),' '),
  NVL(upper(property.prop_mladzip_cde),' '),
  NVL(upper(property.prop_occ_cde),' '),
  NVL(upper(property.prop_prj_attach_typ_ind),' '),
  property.prop_prj_condo_id,
  NVL(upper(property.prop_prj_design_typ),' '),
  property.prop_prj_dwell_unit_cnt,
  property.prop_prj_dwell_unit_sold_cnt,
  NVL(upper(property.prop_pud_ind),' '),
  ROUND (property.prop_purch_amt,2),
  NVL(upper(property.prop_steel_frame_ind),' '),
  NVL(upper(property.prop_tax_cde),' '),
  NVL(upper(property.prop_typ_cde),' '),
  prop_unit_info_vw.prop_unit_nbr_1,
  prop_unit_info_vw.prop_unit_nbr_10,
  prop_unit_info_vw.prop_unit_nbr_2,
  prop_unit_info_vw.prop_unit_nbr_3,
  prop_unit_info_vw.prop_unit_nbr_4,
  prop_unit_info_vw.prop_unit_nbr_5,
  prop_unit_info_vw.prop_unit_nbr_6,
  prop_unit_info_vw.prop_unit_nbr_7,
  prop_unit_info_vw.prop_unit_nbr_8,
  prop_unit_info_vw.prop_unit_nbr_9,
  prop_unit_info_vw.prop_unit_rent_amt_1,
  prop_unit_info_vw.prop_unit_rent_amt_10,
  prop_unit_info_vw.prop_unit_rent_amt_2,
  prop_unit_info_vw.prop_unit_rent_amt_3,
  prop_unit_info_vw.prop_unit_rent_amt_4,
  prop_unit_info_vw.prop_unit_rent_amt_5,
  prop_unit_info_vw.prop_unit_rent_amt_6,
  prop_unit_info_vw.prop_unit_rent_amt_7,
  prop_unit_info_vw.prop_unit_rent_amt_8,
  prop_unit_info_vw.prop_unit_rent_amt_9,
  property.prop_units_nbr,
  prop_unit_info_vw.prop_unt_br_nbr_1,
  prop_unit_info_vw.prop_unt_br_nbr_10,
  prop_unit_info_vw.prop_unt_br_nbr_2,
  prop_unit_info_vw.prop_unt_br_nbr_3,
  prop_unit_info_vw.prop_unt_br_nbr_4,
  prop_unit_info_vw.prop_unt_br_nbr_5,
  prop_unit_info_vw.prop_unt_br_nbr_6,
  prop_unit_info_vw.prop_unt_br_nbr_7,
  prop_unit_info_vw.prop_unt_br_nbr_8,
  prop_unit_info_vw.prop_unt_br_nbr_9,
  NVL(upper(loan_salability.prv_invstr_nme),' '),
  NVL(upper(loan_salability.purp_of_cash),' '),
  loan_additional_data.qm_actl_resid_incm_amt,
  NVL(upper(loan_additional_data.qm_stat_cde),' '),
  TO_CHAR (loan_additional_data.recert_dte,'YYYYMMDD'),
  loan_additional_data.recert_value_amt,
  NVL(upper(
    CASE
      WHEN
        (
          (
            loan.ln_busn_pgm_cde = 'REL'
          OR loan.ln_chan_cde    = 'REL'
          OR loan_program_code_pivot_vw.all_program_codes LIKE
            '%,JVRELO,%'
          )
        OR
          (
            loan.ln_busn_pgm_cde = 'JRE'
          AND loan.ln_relo_ind   = 'Y'
          )
        )
      THEN 'Y'
    END ),' '),
  TO_CHAR (loan_additional_data.repur_dte,'YYYYMMDD'),
  NVL(upper(loan_reverse.rms_stat_cde),' '),
  NVL(upper(wholesal_ln_info.rpd_fnd_ind),' '),
  NVL(upper(loan.rsca_co_id),' '),
  NVL(upper(loan_sale.sale_catg_cde),' '),
  NVL(upper(loan_sale_error_vw.sale_err_1),' '),
  NVL(upper(loan_sale_error_vw.sale_err_10),' '),
  NVL(upper(loan_sale_error_vw.sale_err_11),' '),
  NVL(upper(loan_sale_error_vw.sale_err_12),' '),
  NVL(upper(loan_sale_error_vw.sale_err_13),' '),
  NVL(upper(loan_sale_error_vw.sale_err_14),' '),
  NVL(upper(loan_sale_error_vw.sale_err_15),' '),
  NVL(upper(loan_sale_error_vw.sale_err_16),' '),
  NVL(upper(loan_sale_error_vw.sale_err_17),' '),
  NVL(upper(loan_sale_error_vw.sale_err_18),' '),
  NVL(upper(loan_sale_error_vw.sale_err_19),' '),
  NVL(upper(loan_sale_error_vw.sale_err_2),' '),
  NVL(upper(loan_sale_error_vw.sale_err_20),' '),
  NVL(upper(loan_sale_error_vw.sale_err_21),' '),
  NVL(upper(loan_sale_error_vw.sale_err_22),' '),
  NVL(upper(loan_sale_error_vw.sale_err_23),' '),
  NVL(upper(loan_sale_error_vw.sale_err_24),' '),
  NVL(upper(loan_sale_error_vw.sale_err_25),' '),
  NVL(upper(loan_sale_error_vw.sale_err_26),' '),
  NVL(upper(loan_sale_error_vw.sale_err_27),' '),
  NVL(upper(loan_sale_error_vw.sale_err_28),' '),
  NVL(upper(loan_sale_error_vw.sale_err_29),' '),
  NVL(upper(loan_sale_error_vw.sale_err_3),' '),
  NVL(upper(loan_sale_error_vw.sale_err_30),' '),
  NVL(upper(loan_sale_error_vw.sale_err_31),' '),
  NVL(upper(loan_sale_error_vw.sale_err_32),' '),
  NVL(upper(loan_sale_error_vw.sale_err_33),' '),
  NVL(upper(loan_sale_error_vw.sale_err_34),' '),
  NVL(upper(loan_sale_error_vw.sale_err_35),' '),
  NVL(upper(loan_sale_error_vw.sale_err_36),' '),
  NVL(upper(loan_sale_error_vw.sale_err_37),' '),
  NVL(upper(loan_sale_error_vw.sale_err_38),' '),
  NVL(upper(loan_sale_error_vw.sale_err_39),' '),
  NVL(upper(loan_sale_error_vw.sale_err_4),' '),
  NVL(upper(loan_sale_error_vw.sale_err_40),' '),
  NVL(upper(loan_sale_error_vw.sale_err_41),' '),
  NVL(upper(loan_sale_error_vw.sale_err_42),' '),
  NVL(upper(loan_sale_error_vw.sale_err_43),' '),
  NVL(upper(loan_sale_error_vw.sale_err_44),' '),
  NVL(upper(loan_sale_error_vw.sale_err_45),' '),
  NVL(upper(loan_sale_error_vw.sale_err_46),' '),
  NVL(upper(loan_sale_error_vw.sale_err_47),' '),
  NVL(upper(loan_sale_error_vw.sale_err_48),' '),
  NVL(upper(loan_sale_error_vw.sale_err_49),' '),
  NVL(upper(loan_sale_error_vw.sale_err_5),' '),
  NVL(upper(loan_sale_error_vw.sale_err_50),' '),
  NVL(upper(loan_sale_error_vw.sale_err_6),' '),
  NVL(upper(loan_sale_error_vw.sale_err_7),' '),
  NVL(upper(loan_sale_error_vw.sale_err_8),' '),
  NVL(upper(loan_sale_error_vw.sale_err_9),' '),
  NVL(upper(loan_sale.sale_err_catg_cde),' '),
  NVL(upper(loan_sale.sale_trgt_catg_cde),' '),
  NVL(upper(loan_sale.sale_uwtgt_ctg_cde),' '),
  NVL(upper(loan_home_equity.sbord_fnce_type),' '),
  property.seller_cont_pct,
  loan_buydown_vw.seq_nbr_1,
  loan_buydown_vw.seq_nbr_10,
  loan_buydown_vw.seq_nbr_2,
  loan_buydown_vw.seq_nbr_3,
  loan_buydown_vw.seq_nbr_4,
  loan_buydown_vw.seq_nbr_5,
  loan_buydown_vw.seq_nbr_6,
  loan_buydown_vw.seq_nbr_7,
  loan_buydown_vw.seq_nbr_8,
  loan_buydown_vw.seq_nbr_9,
  NVL(upper(loan.spcl_agcy_waiver_ind),' '),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_1,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_10,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_11,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_12,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_13,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_14,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_15,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_16,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_17,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_18,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_19,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_2,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_20,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_21,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_22,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_23,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_24,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_25,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_26,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_27,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_28,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_29,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_3,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_30,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_4,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_5,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_6,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_7,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_8,'YYYYMMDD'),
  TO_CHAR (loan_status_histry_vw.stat_chgd_dte_9,'YYYYMMDD'),
  NVL(upper(loan_additional_data.state_hpm_cde),' '),
  NVL(upper(loan_additional_data.sys_fqm_ovrd_rslt_cd),' '),
  NVL(upper(sys_fqm_ovrd_rsn_vw.sys_fqm_ovrd_rsn_desc_1),' '),
  NVL(upper(sys_fqm_ovrd_rsn_vw.sys_fqm_ovrd_rsn_desc_2),' '),
  NVL(upper(sys_fqm_ovrd_rsn_vw.sys_fqm_ovrd_rsn_desc_3),' '),
  NVL(upper(sys_fqm_ovrd_rsn_vw.sys_fqm_ovrd_rsn_desc_4),' '),
  NVL(upper(sys_fqm_ovrd_rsn_vw.sys_fqm_ovrd_rsn_desc_5),' '),
  ROUND (loan_home_equity.tot_ln_line_amt,2),
  loan.tot_scnd_ln_disb_amt,
  NVL(upper(loan_real_info.tran_lvl_dcp_ind),' '),
  ROUND (trade.trd_amt,2),
  TO_CHAR (trade.trd_dte,'YYYYMMDD'),
  TO_CHAR (trade.trd_fnl_stl_dte,'YYYYMMDD'),
  NVL(upper(trade.trd_id),' '),
  TO_CHAR (trade.trd_iss_dte,'YYYYMMDD'),
  NVL(upper(trade.trd_pool_typ_cde),' '),
  NVL(upper(borrower_1_trst_vw.trust_1_nm),' '),
  NVL(upper(borrower_2_trst_vw.trust_1_nm),' '),
  NVL(upper(borrower_3_trst_vw.trust_1_nm),' '),
  NVL(upper(borrower_4_trst_vw.trust_1_nm),' '),
  NVL(upper(borrower_1_trst_vw.trust_1_type),' '),
  NVL(upper(borrower_2_trst_vw.trust_1_type),' '),
  NVL(upper(borrower_3_trst_vw.trust_1_type),' '),
  NVL(upper(borrower_4_trst_vw.trust_1_type),' '),
  NVL(upper(borrower_1_trst_vw.trust_1_typnm),' '),
  NVL(upper(borrower_1_trst_vw.trust_2_nm),' '),
  NVL(upper(borrower_2_trst_vw.trust_2_nm),' '),
  NVL(upper(borrower_3_trst_vw.trust_2_nm),' '),
  NVL(upper(borrower_4_trst_vw.trust_2_nm),' '),
  NVL(upper(borrower_1_trst_vw.trust_2_type),' '),
  NVL(upper(borrower_2_trst_vw.trust_2_type),' '),
  NVL(upper(borrower_3_trst_vw.trust_2_type),' '),
  NVL(upper(borrower_4_trst_vw.trust_2_type),' '),
  NVL(upper(borrower_1_trst_vw.trust_3_nm),' '),
  NVL(upper(borrower_2_trst_vw.trust_3_nm),' '),
  NVL(upper(borrower_3_trst_vw.trust_3_nm),' '),
  NVL(upper(borrower_4_trst_vw.trust_3_nm),' '),
  NVL(upper(borrower_1_trst_vw.trust_3_type),' '),
  NVL(upper(borrower_2_trst_vw.trust_3_type),' '),
  NVL(upper(borrower_3_trst_vw.trust_3_type),' '),
  NVL(upper(borrower_4_trst_vw.trust_3_type),' '),
  NVL(upper(borrower_3_trst_vw.trust_3_typnm),' '),
  NVL(upper(borrower_1_trst_vw.trust_4_nm),' '),
  NVL(upper(borrower_2_trst_vw.trust_4_nm),' '),
  NVL(upper(borrower_3_trst_vw.trust_4_nm),' '),
  NVL(upper(borrower_4_trst_vw.trust_4_nm),' '),
  NVL(upper(borrower_1_trst_vw.trust_4_type),' '),
  NVL(upper(borrower_2_trst_vw.trust_4_type),' '),
  NVL(upper(borrower_3_trst_vw.trust_4_type),' '),
  NVL(upper(borrower_4_trst_vw.trust_4_type),' '),
  NVL(upper(borrower_4_trst_vw.trust_4_typnm),' '),
  NVL(upper(loan_additional_data.value_waiver_ind),' '),
  TO_CHAR (loan_salability.wf_uw_eff_date,'YYYYMMDD'),
  loan_additional_data.wh_age_days_nbr,
  TO_CHAR (wholesal_ln_info.whlsl_aprv_dte,'YYYYMMDD'),
  DECODE(sub_1.ln_serv_nbr,NULL,vchar_ntt(),sub_1.CHAR_TBL),
  DECODE(sub_2.ln_serv_nbr,NULL,vchar_ntt(),sub_2.CHAR_TBL),
  DECODE(sub_3.ln_serv_nbr,NULL,vchar_ntt(),sub_3.CHAR_TBL),
  DECODE(sub_4.ln_serv_nbr,NULL,vchar_ntt(),sub_4.CHAR_TBL),
  DECODE(sub_5.ln_serv_nbr,NULL,vchar_ntt(),sub_5.CHAR_TBL),
  DECODE(sub_6.ln_serv_nbr,NULL,vchar_ntt(),sub_6.CHAR_TBL),
  DECODE(sub_7.ln_serv_nbr,NULL,loan_county_cond_history_ntt(),
  sub_7.lcch_ntt),
  DECODE(sub_8.ln_serv_nbr,NULL,vchar_ntt(),sub_8.CHAR_TBL),
  DECODE(sub_9.ln_serv_nbr,NULL,char_ntt(),sub_9.CHAR_TBL),
  DECODE(sub_10.ln_serv_nbr,NULL,vchar_ntt(),sub_10.CHAR_TBL),
  DECODE(Sub_11.ln_serv_nbr,NULL,buydown_ntt(),Sub_11.BDOWN_NTT),
  DECODE(Sub_12.ln_serv_nbr,NULL,PROP_UNIT_GSE_INFO_NTT(),
  Sub_12.pugi_ntt),
  DECODE(sub_13.ln_serv_nbr,NULL,num7_ntt(),sub_13.NUM7_TBL),
  DECODE(sub_14.ln_serv_nbr,NULL,num7_ntt(),sub_14.NUM7_TBL),
  DECODE(sub_15.ln_serv_nbr,NULL, vchar_ntt(),sub_15.CHAR_TBL),
  DECODE(sub_16.ln_serv_nbr,NULL,char_ntt(),sub_16.CHAR_TBL),
  DECODE(sub_17.ln_serv_nbr,NULL,appraisal_status_ntt(),
  sub_17.app_status_ntt)
FROM
  loan
JOIN chan_mkg_ref
ON
  (
    loan.clnt_id = chan_mkg_ref.clnt_id
  )
AND
  (
    loan.clnt_lex_lndr_cde = chan_mkg_ref.clnt_id_srce_id
  )
AND
  (
    NVL (TRIM (loan.clnt_lex_lndr_cde), ' ') = NVL (TRIM (
    chan_mkg_ref.wscmt_id), ' ')
  OR loan.clnt_lex_lndr_cde = 'L'
  )
LEFT OUTER JOIN wholesal_ln_info
ON
  (
    loan.ln_serv_nbr                        = wholesal_ln_info.ln_serv_nbr
  AND MOD (wholesal_ln_info.ln_serv_nbr, 8) = 3
  )
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fvchar_ntt ( 'ln_sale_ovrd_cde', 'loan_sale_ovrd',
      'ln_ovrd_cd_rem_dte IS NULL', 8, 3)) a
  )
  sub_1
ON
  sub_1.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fvchar_ntt ( 'sale_err_id', 'sale_error',
      'sale_err_rmv_dte IS NULL', 8, 3)) a
  )
  sub_2
ON
  sub_2.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fvchar_ntt ( 'spcl_feat_cde', 'loan_feature',
      'agy_shrt_nme = ''FNMA''', 8, 3)) a
  )
  sub_3
ON
  sub_3.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fvchar_ntt ( 'spcl_feat_cde', 'loan_feature',
      'agy_shrt_nme = ''FHLMC''', 8, 3)) a
  )
  sub_4
ON
  sub_4.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fvchar_ntt ( 'pgm_cde', 'loan_program_code', NULL, 8
      , 3)) a
  )
  sub_5
ON
  sub_5.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fvchar_ntt ( 'ln_doc_id', 'ln_alt_doc', '', 8, 3)) a
  )
  sub_6
ON
  sub_6.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE ( NTT.floan_county_cond_history_ntt ( 8, 3)) a
  )
  sub_7
ON
  sub_7.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fvchar_ntt ( 'ln_sle_obj_id', 'loan_sale_hist',
      'ln_sle_rmv_dte IS NOT NULL', 8, 3)) a
  )
  sub_8
ON
  sub_8.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fchar_ntt ( 'ln_disp_cde', 'loan_disposition',
      'ln_disp_end_dte IS NULL', 8, 3)) a
  )
  sub_9
ON
  sub_9.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fvchar_ntt ( 'pr_stat_cde', 'loan_status_histry',
      NULL, 8, 3)) a
  )
  sub_10
ON
  sub_10.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE ( NTT.fbuydown_ntt (8, 3)) a
  )
  sub_11
ON
  sub_11.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE ( NTT.fPROP_UNIT_GSE_INFO_NTT ( 8, 3)) a
  )
  Sub_12
ON
  Sub_12.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fnum7_ntt ( 'brwr_posn_nbr', 'borrower', NULL, 8, 3)
      ) a
  )
  sub_13
ON
  sub_13.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fnum7_ntt ( 'brwr_posn_nbr', 'borrower_gs_info',
      NULL, 8, 3)) a
  )
  sub_14
ON
  sub_14.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fvchar_ntt ( 'dcsng_svr_cd',
      'loan_salability_decisioning', NULL, 8, 3)) a
  )
  sub_15
ON
  sub_15.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE (NTT.fchar_ntt ( 'purp_of_cash_cde',
      'loan_reverse_purpose_cash', NULL, 8, 3)) a
  )
  sub_16
ON
  sub_16.ln_serv_nbr = loan.ln_serv_nbr
LEFT OUTER JOIN
  (
    SELECT
      /*+ CARDINALITY(a 100000) */
      *
    FROM
      TABLE ( NTT.fappraisal_status_ntt ( 8, 3)) a
  )
  sub_17
ON
  sub_17.ln_serv_nbr = loan.ln_serv_nbr
JOIN commitment
ON
  (
    loan.cmt_id = commitment.cmt_id
  )
JOIN property
ON
  (
    loan.ln_serv_nbr                = property.ln_serv_nbr
  AND MOD (property.LN_SERV_NBR, 8) = 3
  )
JOIN product
ON
  (
    loan.prod_lne_cde = product.prod_lne_cde
  )
JOIN loan_sale
ON
  (
    loan.ln_serv_nbr = loan_sale.ln_serv_nbr
  )
AND MOD (loan_sale.LN_SERV_NBR, 8) = 3
AND
  (
    loan_sale.sale_catg_cde <> 'XL'
  OR TRIM (sale_catg_cde)   IS NULL
  )
JOIN loan_salability
ON
  (
    loan.ln_serv_nbr                       = loan_salability.ln_serv_nbr
  AND MOD (loan_salability.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN borrower_2_vw
ON
  (
    loan.ln_serv_nbr                     = borrower_2_vw.ln_serv_nbr
  AND MOD (borrower_2_vw.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN borrower_gs_info_3_vw
ON
  (
    loan.ln_serv_nbr                             = borrower_gs_info_3_vw.ln_serv_nbr
  AND MOD (borrower_gs_info_3_vw.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN adjustbl_ln_info
ON
  (
    loan.ln_serv_nbr                        = adjustbl_ln_info.ln_serv_nbr
  AND MOD (adjustbl_ln_info.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN loan_mortgage_ins
ON
  (
    loan.ln_serv_nbr                         = loan_mortgage_ins.ln_serv_nbr
  AND MOD (loan_mortgage_ins.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN loan_home_equity
ON
  (
    loan.ln_serv_nbr                        = loan_home_equity.ln_serv_nbr
  AND MOD (loan_home_equity.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN loan_real_info
ON
  (
    loan.ln_serv_nbr                      = loan_real_info.ln_serv_nbr
  AND MOD (loan_real_info.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN convrtbl_ln_info
ON
  (
    loan.ln_serv_nbr                        = convrtbl_ln_info.ln_serv_nbr
  AND MOD (convrtbl_ln_info.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN prop_legal_info
ON
  (
    loan.ln_serv_nbr                       = prop_legal_info.ln_serv_nbr
  AND MOD (prop_legal_info.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN trade
ON
  (
    commitment.trd_id = trade.trd_id
  )
LEFT OUTER JOIN max_buydown
ON
  (
    loan.ln_serv_nbr                   = max_buydown.ln_serv_nbr
  AND MOD (max_buydown.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN as400_spec_feat_stg
ON
  (
    loan.ln_serv_nbr                           = as400_spec_feat_stg.ln_serv_nbr
  AND MOD (as400_spec_feat_stg.ln_serv_nbr, 8) = 3
  )
LEFT OUTER JOIN loan_reverse
ON
  (
    loan.ln_serv_nbr                    = loan_reverse.ln_serv_nbr
  AND MOD (loan_reverse.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN loan_additional_data
ON
  (
    loan.ln_serv_nbr                            = loan_additional_data.ln_serv_nbr
  AND MOD (loan_additional_data.LN_SERV_NBR, 8) = 3
  )
JOIN borrower_1_vw
ON
  (
    loan.ln_serv_nbr                     = borrower_1_vw.ln_serv_nbr
  AND MOD (borrower_1_vw.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN borrower_3_vw
ON
  (
    loan.ln_serv_nbr                     = borrower_3_vw.ln_serv_nbr
  AND MOD (borrower_3_vw.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN borrower_4_vw
ON
  (
    loan.ln_serv_nbr                     = borrower_4_vw.ln_serv_nbr
  AND MOD (borrower_4_vw.LN_SERV_NBR, 8) = 3
  )
JOIN borrower_gs_info_1_vw
ON
  (
    loan.ln_serv_nbr                             = borrower_gs_info_1_vw.ln_serv_nbr
  AND MOD (borrower_gs_info_1_vw.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN borrower_gs_info_2_vw
ON
  (
    loan.ln_serv_nbr                             = borrower_gs_info_2_vw.ln_serv_nbr
  AND MOD (borrower_gs_info_2_vw.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN borrower_gs_info_4_vw
ON
  (
    loan.ln_serv_nbr                             = borrower_gs_info_4_vw.ln_serv_nbr
  AND MOD (borrower_gs_info_4_vw.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN appraisal_request
ON
  (
    loan.ln_serv_nbr                         = appraisal_request.ln_serv_nbr
  AND MOD (appraisal_request.LN_SERV_NBR, 8) = 3
  )
LEFT OUTER JOIN loan_status_histry_vw
ON
  (
    loan.ln_serv_nbr = loan_status_histry_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_buydown_vw
ON
  (
    loan.ln_serv_nbr = loan_buydown_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_sale_error_vw
ON
  (
    loan.ln_serv_nbr = loan_sale_error_vw.ln_serv_nbr
  )
LEFT OUTER JOIN prop_unit_info_vw
ON
  (
    loan.ln_serv_nbr = prop_unit_info_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_sale_hist_vw
ON
  (
    loan.ln_serv_nbr = loan_sale_hist_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_alt_doc_vw
ON
  (
    loan.ln_serv_nbr = loan_alt_doc_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_feature_fnma_vw
ON
  (
    loan.ln_serv_nbr = loan_feature_fnma_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_rev_purp_cash_vw
ON
  (
    loan.ln_serv_nbr = loan_rev_purp_cash_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_disposition_vw
ON
  (
    loan.ln_serv_nbr = loan_disposition_vw.ln_serv_nbr
  )
LEFT OUTER JOIN xyz loan_appraisal_status_vw
ON
  (
    loan.ln_serv_nbr = loan_appraisal_status_vw.ln_serv_nbr
  )
LEFT OUTER JOIN xyz loan_appraisal_status_vw
ON
  (
    loan.ln_serv_nbr = loan_appraisal_status_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_status_histry_vw
ON
  (
    loan.ln_serv_nbr = loan_status_histry_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_sale_error_vw
ON
  (
    loan.ln_serv_nbr = loan_sale_error_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_feature_fhlmc_vw
ON
  (
    loan.ln_serv_nbr = loan_feature_fhlmc_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_county_history_vw
ON
  (
    loan.ln_serv_nbr = loan_county_history_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_sale_ovrd_vw
ON
  (
    loan.ln_serv_nbr = loan_sale_ovrd_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_program_code_pivot_vw
ON
  (
    loan.ln_serv_nbr = loan_program_code_pivot_vw.ln_serv_nbr
  )
LEFT OUTER JOIN loan_dcsng_svr_cd_vw
ON
  (
    loan.ln_serv_nbr = loan_dcsng_svr_cd_vw.ln_serv_nbr
  )
LEFT OUTER JOIN borrower_1_trst_vw
ON
  (
    loan.ln_serv_nbr = borrower_1_trst_vw.ln_serv_nbr
  )
LEFT OUTER JOIN borrower_2_trst_vw
ON
  (
    loan.ln_serv_nbr = borrower_2_trst_vw.ln_serv_nbr
  )
LEFT OUTER JOIN borrower_3_trst_vw
ON
  (
    loan.ln_serv_nbr = borrower_3_trst_vw.ln_serv_nbr
  )
LEFT OUTER JOIN borrower_4_trst_vw
ON
  (
    loan.ln_serv_nbr = borrower_4_trst_vw.ln_serv_nbr
  )
LEFT OUTER JOIN cls_cost_1_vw
ON
  (
    loan.ln_serv_nbr = cls_cost_1_vw.ln_serv_nbr
  )
LEFT OUTER JOIN cls_cost_2_vw
ON
  (
    loan.ln_serv_nbr = cls_cost_2_vw.ln_serv_nbr
  )
LEFT OUTER JOIN cls_cost_3_vw
ON
  (
    loan.ln_serv_nbr = cls_cost_3_vw.ln_serv_nbr
  )
LEFT OUTER JOIN cls_cost_4_vw
ON
  (
    loan.ln_serv_nbr = cls_cost_4_vw.ln_serv_nbr
  )
LEFT OUTER JOIN cls_cost_5_vw
ON
  (
    loan.ln_serv_nbr = cls_cost_5_vw.ln_serv_nbr
  )
LEFT OUTER JOIN cls_cost_6_vw
ON
  (
    loan.ln_serv_nbr = cls_cost_6_vw.ln_serv_nbr
  )
LEFT OUTER JOIN cls_cost_7_vw
ON
  (
    loan.ln_serv_nbr = cls_cost_7_vw.ln_serv_nbr
  )
LEFT OUTER JOIN cls_cost_8_vw
ON
  (
    loan.ln_serv_nbr = cls_cost_8_vw.ln_serv_nbr
  )
LEFT OUTER JOIN dn_pmt_1_vw
ON
  (
    loan.ln_serv_nbr = dn_pmt_1_vw.ln_serv_nbr
  )
LEFT OUTER JOIN dn_pmt_2_vw
ON
  (
    loan.ln_serv_nbr = dn_pmt_2_vw.ln_serv_nbr
  )
LEFT OUTER JOIN dn_pmt_3_vw
ON
  (
    loan.ln_serv_nbr = dn_pmt_3_vw.ln_serv_nbr
  )
LEFT OUTER JOIN dn_pmt_4_vw
ON
  (
    loan.ln_serv_nbr = dn_pmt_4_vw.ln_serv_nbr
  )
LEFT OUTER JOIN dn_pmt_5_vw
ON
  (
    loan.ln_serv_nbr = dn_pmt_5_vw.ln_serv_nbr
  )
LEFT OUTER JOIN dn_pmt_6_vw
ON
  (
    loan.ln_serv_nbr = dn_pmt_6_vw.ln_serv_nbr
  )
LEFT OUTER JOIN dn_pmt_7_vw
ON
  (
    loan.ln_serv_nbr = dn_pmt_7_vw.ln_serv_nbr
  )
LEFT OUTER JOIN dn_pmt_8_vw
ON
  (
    loan.ln_serv_nbr = dn_pmt_8_vw.ln_serv_nbr
  )
LEFT OUTER JOIN mnl_fqm_ovrd_rsn_vw
ON
  (
    loan.ln_serv_nbr = mnl_fqm_ovrd_rsn_vw.ln_serv_nbr
  )
LEFT OUTER JOIN sys_fqm_ovrd_rsn_vw
ON
  (
    loan.ln_serv_nbr = sys_fqm_ovrd_rsn_vw.ln_serv_nbr
  )
JOIN loan_search_result
ON
  (
    loan.ln_serv_nbr = loan_search_result.ln_serv_nbr
  )
AND
  (
    loan_search_result.created_by_usr_id = 'smsbtch'
  )
WHERE
  (
    loan.ln_curr_stat_cde IN ('D20','E10','F10','F20','H10','H20',
    'I10','K10','R10')
  OR
    (
      (
        loan.ln_curr_stat_cde = 'I20'
      )
    AND
      (
        (
          loan_sale.sale_trgt_catg_cde != 'BK'
        )
      AND
        (
          loan_salability.ln_fnma_del_fee <= 0
        )
      AND
        (
          NVL(loan_sale.sale_catg_cde,' ') NOT IN ('EZ', 'EY', 'E1',
          'FP', 'PA', 'PB', 'PH', 'PN', 'P6', 'WF', 'WG', 'WP', 'XA')
        )
      AND
        (
          SUBSTR(loan.cmt_id,4,4) NOT IN ( '-049', '-095', '-096',
          '-100')
        )
      )
    )
  )
AND NOT
  (
    loan.clnt_lex_lndr_cde    = 'L'
  AND wholesal_ln_info.ROWID IS NULL
  )
AND
  (
    wholesal_ln_info.lex_cmt_id         = chan_mkg_ref.wscmt_id
  OR NVL (loan.clnt_lex_lndr_cde, 'X') <> 'L'
  )
AND MOD (LOAN.LN_SERV_NBR, 8) = 3 ;