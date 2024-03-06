Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1763D9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 01:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709688373; cv=none; b=YuQyhRlTvTgKwum8IiL7r4+8fcT9FwAnY3WbIm8tjGG3MC13Q5c6lJPYzj85rjxXDcNUf5xIca9ebYe7TDo4LttUoiGXR/hAAOIGbcVE+1siiSeOPoPnidY4FSsKk28m6cQVI6Tn3SlN2wMXhvYm/8T86H4XSdVoUYOpKOJ86iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709688373; c=relaxed/simple;
	bh=2NMgZLX6X1JHrSrj3HVAn45miXYDG43CO54sBZ49M/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IbDz2fi5eS2m0il/gPfSrfclmAPvSGHxavP9BlJJwdxKaxVKPNtE+itTdmY8/tub97LlFIKzVtZCpSWtxnO/IPWMIi5G1Zw7ik7hLYuPaPliCkpfF3zt40VswhT6HfN/cZRuG+YEJh0E7Prdvay6lYUU1vTCvd4uE276weof77g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGjZvNRf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGjZvNRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709688371; x=1741224371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2NMgZLX6X1JHrSrj3HVAn45miXYDG43CO54sBZ49M/w=;
  b=NGjZvNRfS6Y/vo9jNjB+U5406P+vMDM+X0iXSQ62ZaY2H3uHYADHy0Fh
   Tz/AX0v5UyvdvJYWmlnVkhukXefg+NsqVk5yr8jLYJOKkGEhWWgSoqz/n
   LkoODHJG9GBK0Sdd5DQl0Hu7til4zVeifSwMugzgn8SpqhOIyRm8ubkrO
   ILKCim15m2sspRCGXvSLZ+eZd9kpqu/m1GmLahPfyL6Batg/60XNLO4f8
   OjI0ICtwczx552xNvEQHhaelCLP6N2lTubwgLWy2j9yU+GRZWjEv642ft
   pE4Fu+vurwFgG58GniSsb9WyfpEl1rOI2KxvQ2TFSVbrGsvWpbyGrhDO0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15703989"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="15703989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 17:26:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="32735319"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Mar 2024 17:26:05 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhg2l-0003oj-1L;
	Wed, 06 Mar 2024 01:26:03 +0000
Date: Wed, 6 Mar 2024 09:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 23841/27434]
 drivers/thirdparty/ast/ast_mode.c:560:12: warning: variable 'ch' set but not
 used
Message-ID: <202403060948.8LHP9rJw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: cbe224488e92e2e20a7d2b686fd28491f1e98744 [23841/27434] drivers: add thirdparty drivers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240306/202403060948.8LHP9rJw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060948.8LHP9rJw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060948.8LHP9rJw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thirdparty/ice/ice_ethtool.c: In function 'ice_get_strings':
>> drivers/thirdparty/ice/ice_ethtool.c:1723:55: warning: '%s' directive output may be truncated writing up to 639 bytes into a region of size 32 [-Wformat-truncation=]
    1723 |                         snprintf(p, ETH_GSTRING_LEN, "%s",
         |                                                       ^~
   drivers/thirdparty/ice/ice_ethtool.c:1723:25: note: 'snprintf' output between 1 and 640 bytes into a destination of size 32
    1723 |                         snprintf(p, ETH_GSTRING_LEN, "%s",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1724 |                                  ice_gstrings_vsi_stats[i].stat_string);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/ice/ice_ethtool.c:1782:55: warning: '%s' directive output may be truncated writing up to 1719 bytes into a region of size 32 [-Wformat-truncation=]
    1782 |                         snprintf(p, ETH_GSTRING_LEN, "%s",
         |                                                       ^~
   drivers/thirdparty/ice/ice_ethtool.c:1782:25: note: 'snprintf' output between 1 and 1720 bytes into a destination of size 32
    1782 |                         snprintf(p, ETH_GSTRING_LEN, "%s",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1783 |                                  ice_gstrings_pf_stats[i].stat_string);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/ice/ice_ethtool.c:1805:55: warning: '%s' directive output may be truncated writing up to 395 bytes into a region of size 32 [-Wformat-truncation=]
    1805 |                         snprintf(p, ETH_GSTRING_LEN, "%s",
         |                                                       ^~
   drivers/thirdparty/ice/ice_ethtool.c:1805:25: note: 'snprintf' output between 1 and 396 bytes into a destination of size 32
    1805 |                         snprintf(p, ETH_GSTRING_LEN, "%s",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1806 |                                  ice_gstrings_priv_flags[i].name);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/thirdparty/ice/ice_ptp.c: In function 'ice_get_e810t_sma_config':
>> drivers/thirdparty/ice/ice_ptp.c:68:27: warning: '%s' directive output may be truncated writing up to 479 bytes into a region of size 64 [-Wformat-truncation=]
      68 |                          "%s", ice_e810t_pin_desc[i].name);
         |                           ^~
   drivers/thirdparty/ice/ice_ptp.c:67:17: note: 'snprintf' output between 1 and 480 bytes into a destination of size 64
      67 |                 snprintf(ptp_pins[i].name, sizeof(ptp_pins[i].name),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      68 |                          "%s", ice_e810t_pin_desc[i].name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/thirdparty/lpfc/lpfc_mem.c:92: warning: Function parameter or member 'align' not described in 'lpfc_mem_alloc'
--
>> drivers/thirdparty/lpfc/lpfc_nvmet.c:379: warning: Function parameter or member 'ctx_buf' not described in 'lpfc_nvmet_ctxbuf_post'
>> drivers/thirdparty/lpfc/lpfc_nvmet.c:379: warning: Excess function parameter 'ctxp' description in 'lpfc_nvmet_ctxbuf_post'
>> drivers/thirdparty/lpfc/lpfc_nvmet.c:379: warning: Excess function parameter 'mp' description in 'lpfc_nvmet_ctxbuf_post'
>> drivers/thirdparty/lpfc/lpfc_nvmet.c:1951: warning: Function parameter or member 'piocb' not described in 'lpfc_nvmet_unsol_ls_event'
>> drivers/thirdparty/lpfc/lpfc_nvmet.c:1951: warning: Excess function parameter 'nvmebuf' description in 'lpfc_nvmet_unsol_ls_event'
--
>> drivers/thirdparty/lpfc/lpfc_nvme.c:272: warning: Function parameter or member 'pnvme_lport' not described in 'lpfc_nvme_create_queue'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:272: warning: Function parameter or member 'qsize' not described in 'lpfc_nvme_create_queue'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:272: warning: Excess function parameter 'lpfc_pnvme' description in 'lpfc_nvme_create_queue'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:333: warning: Function parameter or member 'pnvme_lport' not described in 'lpfc_nvme_delete_queue'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:333: warning: Excess function parameter 'lpfc_pnvme' description in 'lpfc_nvme_delete_queue'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:648: warning: Function parameter or member 'pnvme_lport' not described in 'lpfc_nvme_ls_req'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:648: warning: Function parameter or member 'pnvme_rport' not described in 'lpfc_nvme_ls_req'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:648: warning: Function parameter or member 'pnvme_lsreq' not described in 'lpfc_nvme_ls_req'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:648: warning: Excess function parameter 'lpfc_pnvme' description in 'lpfc_nvme_ls_req'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:648: warning: Excess function parameter 'lpfc_nvme_lport' description in 'lpfc_nvme_ls_req'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:648: warning: Excess function parameter 'lpfc_nvme_rport' description in 'lpfc_nvme_ls_req'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:783: warning: Function parameter or member 'pnvme_lport' not described in 'lpfc_nvme_ls_abort'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:783: warning: Function parameter or member 'pnvme_rport' not described in 'lpfc_nvme_ls_abort'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:783: warning: Function parameter or member 'pnvme_lsreq' not described in 'lpfc_nvme_ls_abort'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:783: warning: Excess function parameter 'lpfc_pnvme' description in 'lpfc_nvme_ls_abort'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:783: warning: Excess function parameter 'lpfc_nvme_lport' description in 'lpfc_nvme_ls_abort'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:783: warning: Excess function parameter 'lpfc_nvme_rport' description in 'lpfc_nvme_ls_abort'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:964: warning: Function parameter or member 'phba' not described in 'lpfc_nvme_io_cmd_wqe_cmpl'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:964: warning: Function parameter or member 'pwqeIn' not described in 'lpfc_nvme_io_cmd_wqe_cmpl'
>> drivers/thirdparty/lpfc/lpfc_nvme.c:964: warning: Function parameter or member 'wcqe' not described in 'lpfc_nvme_io_cmd_wqe_cmpl'
   drivers/thirdparty/lpfc/lpfc_nvme.c:964: warning: Excess function parameter 'lpfc_pnvme' description in 'lpfc_nvme_io_cmd_wqe_cmpl'
   drivers/thirdparty/lpfc/lpfc_nvme.c:964: warning: Excess function parameter 'lpfc_nvme_lport' description in 'lpfc_nvme_io_cmd_wqe_cmpl'
   drivers/thirdparty/lpfc/lpfc_nvme.c:964: warning: Excess function parameter 'lpfc_nvme_rport' description in 'lpfc_nvme_io_cmd_wqe_cmpl'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1215: warning: Function parameter or member 'vport' not described in 'lpfc_nvme_prep_io_cmd'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1215: warning: Function parameter or member 'lpfc_ncmd' not described in 'lpfc_nvme_prep_io_cmd'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1215: warning: Function parameter or member 'pnode' not described in 'lpfc_nvme_prep_io_cmd'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1215: warning: Function parameter or member 'cstat' not described in 'lpfc_nvme_prep_io_cmd'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1215: warning: Excess function parameter 'lpfc_pnvme' description in 'lpfc_nvme_prep_io_cmd'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1215: warning: Excess function parameter 'lpfc_nvme_lport' description in 'lpfc_nvme_prep_io_cmd'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1215: warning: Excess function parameter 'lpfc_nvme_rport' description in 'lpfc_nvme_prep_io_cmd'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1215: warning: Excess function parameter 'lpfc_nvme_fcreq' description in 'lpfc_nvme_prep_io_cmd'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1215: warning: Excess function parameter 'hw_queue_handle' description in 'lpfc_nvme_prep_io_cmd'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1333: warning: Function parameter or member 'vport' not described in 'lpfc_nvme_prep_io_dma'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1333: warning: Function parameter or member 'lpfc_ncmd' not described in 'lpfc_nvme_prep_io_dma'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1333: warning: Excess function parameter 'lpfc_pnvme' description in 'lpfc_nvme_prep_io_dma'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1333: warning: Excess function parameter 'lpfc_nvme_lport' description in 'lpfc_nvme_prep_io_dma'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1333: warning: Excess function parameter 'lpfc_nvme_rport' description in 'lpfc_nvme_prep_io_dma'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1333: warning: Excess function parameter 'lpfc_nvme_fcreq' description in 'lpfc_nvme_prep_io_dma'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1333: warning: Excess function parameter 'hw_queue_handle' description in 'lpfc_nvme_prep_io_dma'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1511: warning: bad line:  indicated in @lpfc_nvme_rport.
   drivers/thirdparty/lpfc/lpfc_nvme.c:1522: warning: Function parameter or member 'pnvme_lport' not described in 'lpfc_nvme_fcp_io_submit'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1522: warning: Function parameter or member 'pnvme_rport' not described in 'lpfc_nvme_fcp_io_submit'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1522: warning: Function parameter or member 'pnvme_fcreq' not described in 'lpfc_nvme_fcp_io_submit'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1522: warning: Excess function parameter 'lpfc_pnvme' description in 'lpfc_nvme_fcp_io_submit'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1522: warning: Excess function parameter 'lpfc_nvme_lport' description in 'lpfc_nvme_fcp_io_submit'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1522: warning: Excess function parameter 'lpfc_nvme_rport' description in 'lpfc_nvme_fcp_io_submit'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1522: warning: Excess function parameter 'lpfc_nvme_fcreq' description in 'lpfc_nvme_fcp_io_submit'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1828: warning: Function parameter or member 'abts_cmpl' not described in 'lpfc_nvme_abort_fcreq_cmpl'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1828: warning: Excess function parameter 'rspiocb' description in 'lpfc_nvme_abort_fcreq_cmpl'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1855: warning: Function parameter or member 'phba' not described in 'lpfc_nvme_complete_pend_io'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1855: warning: Function parameter or member 'pnvme_fcreq' not described in 'lpfc_nvme_complete_pend_io'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1881: warning: Function parameter or member 'phba' not described in 'lpfc_nvme_insert_pend_io'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1881: warning: Function parameter or member 'pnvme_fcreq' not described in 'lpfc_nvme_insert_pend_io'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1881: warning: Function parameter or member 'pnvme_lport' not described in 'lpfc_nvme_insert_pend_io'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1881: warning: Function parameter or member 'pnvme_rport' not described in 'lpfc_nvme_insert_pend_io'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1881: warning: Function parameter or member 'hw_queue_handle' not described in 'lpfc_nvme_insert_pend_io'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1881: warning: Function parameter or member 'to_head' not described in 'lpfc_nvme_insert_pend_io'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1979: warning: Function parameter or member 'pnvme_lport' not described in 'lpfc_nvme_fcp_abort'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1979: warning: Function parameter or member 'pnvme_rport' not described in 'lpfc_nvme_fcp_abort'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1979: warning: Function parameter or member 'pnvme_fcreq' not described in 'lpfc_nvme_fcp_abort'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1979: warning: Excess function parameter 'lpfc_pnvme' description in 'lpfc_nvme_fcp_abort'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1979: warning: Excess function parameter 'lpfc_nvme_lport' description in 'lpfc_nvme_fcp_abort'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1979: warning: Excess function parameter 'lpfc_nvme_rport' description in 'lpfc_nvme_fcp_abort'
   drivers/thirdparty/lpfc/lpfc_nvme.c:1979: warning: Excess function parameter 'lpfc_nvme_fcreq' description in 'lpfc_nvme_fcp_abort'
   drivers/thirdparty/lpfc/lpfc_nvme.c:2198: warning: Function parameter or member 'ndlp' not described in 'lpfc_get_nvme_buf'
   drivers/thirdparty/lpfc/lpfc_nvme.c:2198: warning: Function parameter or member 'idx' not described in 'lpfc_get_nvme_buf'
   drivers/thirdparty/lpfc/lpfc_nvme.c:2198: warning: Function parameter or member 'expedite' not described in 'lpfc_get_nvme_buf'
   drivers/thirdparty/lpfc/lpfc_nvme.c:2303: warning: Function parameter or member 'vport' not described in 'lpfc_nvme_create_localport'
   drivers/thirdparty/lpfc/lpfc_nvme.c:2447: warning: Function parameter or member 'vport' not described in 'lpfc_nvme_destroy_localport'
   drivers/thirdparty/lpfc/lpfc_nvme.c:2447: warning: Excess function parameter 'pnvme' description in 'lpfc_nvme_destroy_localport'
--
>> drivers/thirdparty/lpfc/lpfc_hbadisc.c:1276: warning: Function parameter or member 'phba' not described in 'lpfc_sli4_clear_fcf_rr_bmask'
>> drivers/thirdparty/lpfc/lpfc_hbadisc.c:1376: warning: Function parameter or member 'sw_name' not described in 'lpfc_sw_name_match'
>> drivers/thirdparty/lpfc/lpfc_hbadisc.c:1376: warning: Excess function parameter 'fab_name' description in 'lpfc_sw_name_match'
>> drivers/thirdparty/lpfc/lpfc_hbadisc.c:1464: warning: Function parameter or member 'fcf_rec' not described in 'lpfc_copy_fcf_record'
>> drivers/thirdparty/lpfc/lpfc_hbadisc.c:1464: warning: Excess function parameter 'fcf' description in 'lpfc_copy_fcf_record'
>> drivers/thirdparty/lpfc/lpfc_hbadisc.c:2021: warning: Cannot understand  lpfc_sli4_fcf_record_match - testing new FCF record for matching existing FCF
    on line 2021 - I thought it was a doc line
>> drivers/thirdparty/lpfc/lpfc_hbadisc.c:2143: warning: Function parameter or member 'fcf_index' not described in 'lpfc_sli4_fcf_pri_list_del'
>> drivers/thirdparty/lpfc/lpfc_hbadisc.c:2174: warning: Function parameter or member 'fcf_index' not described in 'lpfc_sli4_set_fcf_flogi_fail'
>> drivers/thirdparty/lpfc/lpfc_hbadisc.c:2200: warning: Function parameter or member 'fcf_index' not described in 'lpfc_sli4_fcf_pri_list_add'
>> drivers/thirdparty/lpfc/lpfc_hbadisc.c:2200: warning: Function parameter or member 'new_fcf_record' not described in 'lpfc_sli4_fcf_pri_list_add'
--
>> drivers/thirdparty/lpfc/lpfc_bsg.c:296: warning: Function parameter or member 'ptra' not described in 'lpfc_chk_params'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:296: warning: Function parameter or member 'ptrb' not described in 'lpfc_chk_params'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:296: warning: Excess function parameter 'prta' description in 'lpfc_chk_params'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:296: warning: Excess function parameter 'prtb' description in 'lpfc_chk_params'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:309: warning: Function parameter or member 'ptra' not described in 'lpfc_chk_wwpn'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:309: warning: Function parameter or member 'ptrb' not described in 'lpfc_chk_wwpn'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:309: warning: Excess function parameter 'prta' description in 'lpfc_chk_wwpn'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:309: warning: Excess function parameter 'prtb' description in 'lpfc_chk_wwpn'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:322: warning: Function parameter or member 'ptra' not described in 'lpfc_chk_lun'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:322: warning: Function parameter or member 'ptrb' not described in 'lpfc_chk_lun'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:322: warning: Excess function parameter 'prta' description in 'lpfc_chk_lun'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:322: warning: Excess function parameter 'prtb' description in 'lpfc_chk_lun'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:333: warning: Function parameter or member 'fcp_lun' not described in 'lpfc_conv_lun'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:333: warning: Excess function parameter 'prta' description in 'lpfc_conv_lun'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:351: warning: Function parameter or member 'ndlp' not described in 'lpfc_set_ndlp_fcp_pri'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:351: warning: Function parameter or member 'first_lun' not described in 'lpfc_set_ndlp_fcp_pri'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:351: warning: Excess function parameter 'first_lunr' description in 'lpfc_set_ndlp_fcp_pri'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:524: warning: Function parameter or member 'ndlp' not described in 'lpfc_set_ndlps_fcp_priority'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:524: warning: Excess function parameter 'phba' description in 'lpfc_set_ndlps_fcp_priority'
>> drivers/thirdparty/lpfc/lpfc_bsg.c:524: warning: Excess function parameter 'rules' description in 'lpfc_set_ndlps_fcp_priority'
   drivers/thirdparty/lpfc/lpfc_bsg.c:1298: warning: Function parameter or member 'phba' not described in 'lpfc_bsg_ct_unsol_event'
   drivers/thirdparty/lpfc/lpfc_bsg.c:1298: warning: Function parameter or member 'pring' not described in 'lpfc_bsg_ct_unsol_event'
   drivers/thirdparty/lpfc/lpfc_bsg.c:1846: warning: Function parameter or member 'cmp' not described in 'lpfc_issue_ct_rsp'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4493: warning: Function parameter or member 'job' not described in 'lpfc_bsg_sli_cfg_read_cmd_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4493: warning: Function parameter or member 'dmabuf' not described in 'lpfc_bsg_sli_cfg_read_cmd_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4493: warning: Excess function parameter 'mb' description in 'lpfc_bsg_sli_cfg_read_cmd_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4493: warning: Excess function parameter 'dmabuff' description in 'lpfc_bsg_sli_cfg_read_cmd_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4681: warning: Function parameter or member 'job' not described in 'lpfc_bsg_sli_cfg_write_cmd_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4681: warning: Function parameter or member 'nemb_tp' not described in 'lpfc_bsg_sli_cfg_write_cmd_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4681: warning: Function parameter or member 'dmabuf' not described in 'lpfc_bsg_sli_cfg_write_cmd_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4681: warning: Excess function parameter 'mb' description in 'lpfc_bsg_sli_cfg_write_cmd_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4681: warning: Excess function parameter 'dmabuff' description in 'lpfc_bsg_sli_cfg_write_cmd_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4847: warning: Function parameter or member 'job' not described in 'lpfc_bsg_handle_sli_cfg_mbox'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4847: warning: Function parameter or member 'dmabuf' not described in 'lpfc_bsg_handle_sli_cfg_mbox'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4847: warning: Excess function parameter 'mb' description in 'lpfc_bsg_handle_sli_cfg_mbox'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4847: warning: Excess function parameter 'dmabuff' description in 'lpfc_bsg_handle_sli_cfg_mbox'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4996: warning: Function parameter or member 'job' not described in 'lpfc_bsg_read_ebuf_get'
   drivers/thirdparty/lpfc/lpfc_bsg.c:4996: warning: Excess function parameter 'dmabuf' description in 'lpfc_bsg_read_ebuf_get'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5067: warning: Function parameter or member 'job' not described in 'lpfc_bsg_write_ebuf_set'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5190: warning: Function parameter or member 'job' not described in 'lpfc_bsg_handle_sli_cfg_ebuf'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5190: warning: Function parameter or member 'dmabuf' not described in 'lpfc_bsg_handle_sli_cfg_ebuf'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5190: warning: Excess function parameter 'mb' description in 'lpfc_bsg_handle_sli_cfg_ebuf'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5190: warning: Excess function parameter 'dmabuff' description in 'lpfc_bsg_handle_sli_cfg_ebuf'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5235: warning: Function parameter or member 'job' not described in 'lpfc_bsg_handle_sli_cfg_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5235: warning: Function parameter or member 'dmabuf' not described in 'lpfc_bsg_handle_sli_cfg_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5235: warning: Excess function parameter 'mb' description in 'lpfc_bsg_handle_sli_cfg_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5235: warning: Excess function parameter 'dmabuff' description in 'lpfc_bsg_handle_sli_cfg_ext'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5313: warning: Function parameter or member 'job' not described in 'lpfc_bsg_issue_mbox'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5313: warning: Excess function parameter 'mb' description in 'lpfc_bsg_issue_mbox'
   drivers/thirdparty/lpfc/lpfc_bsg.c:5979: warning: Function parameter or member 'buf' not described in 'lpfc_manage_auth_update_obj'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6073: warning: Function parameter or member 'buf' not described in 'lpfc_manage_auth_pwd_fetch'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6073: warning: Function parameter or member 'src' not described in 'lpfc_manage_auth_pwd_fetch'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6195: warning: Function parameter or member 'vport' not described in 'lpfc_manage_auth_pwd_update'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6195: warning: Function parameter or member 'buf' not described in 'lpfc_manage_auth_pwd_update'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6195: warning: Excess function parameter 'phba' description in 'lpfc_manage_auth_pwd_update'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6323: warning: Function parameter or member 'vport' not described in 'lpfc_manage_auth_drvr_cfg_update'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6323: warning: Function parameter or member 'buf' not described in 'lpfc_manage_auth_drvr_cfg_update'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6323: warning: Excess function parameter 'phba' description in 'lpfc_manage_auth_drvr_cfg_update'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6423: warning: Function parameter or member 'buf' not described in 'lpfc_manage_auth_cfg_fetch'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6423: warning: Function parameter or member 'wwpn' not described in 'lpfc_manage_auth_cfg_fetch'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6423: warning: Function parameter or member 'src' not described in 'lpfc_manage_auth_cfg_fetch'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6559: warning: Function parameter or member 'vport' not described in 'lpfc_manage_auth_cfg_delete'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6559: warning: Function parameter or member 'buf' not described in 'lpfc_manage_auth_cfg_delete'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6559: warning: Function parameter or member 'flag' not described in 'lpfc_manage_auth_cfg_delete'
   drivers/thirdparty/lpfc/lpfc_bsg.c:6559: warning: Excess function parameter 'phba' description in 'lpfc_manage_auth_cfg_delete'
--
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:294:5: warning: no previous prototype for 'megasas_readl' [-Wmissing-prototypes]
     294 | u32 megasas_readl(struct megasas_instance *instance,
         |     ^~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:356:21: warning: no previous prototype for 'megasas_get_cmd' [-Wmissing-prototypes]
     356 | struct megasas_cmd *megasas_get_cmd(struct megasas_instance
         |                     ^~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:382:1: warning: no previous prototype for 'megasas_return_cmd' [-Wmissing-prototypes]
     382 | megasas_return_cmd(struct megasas_instance *instance, struct megasas_cmd *cmd)
         | ^~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:1155:1: warning: no previous prototype for 'megasas_issue_polled' [-Wmissing-prototypes]
    1155 | megasas_issue_polled(struct megasas_instance *instance, struct megasas_cmd *cmd)
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:1997:6: warning: no previous prototype for 'megasas_blk_limits_max_hw_sectors' [-Wmissing-prototypes]
    1997 | void megasas_blk_limits_max_hw_sectors(struct queue_limits *limits, unsigned int max_hw_sectors)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:2312:6: warning: no previous prototype for 'megaraid_sas_kill_hba' [-Wmissing-prototypes]
    2312 | void megaraid_sas_kill_hba(struct megasas_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:2353:1: warning: no previous prototype for 'megasas_check_and_restore_queue_depth' [-Wmissing-prototypes]
    2353 | megasas_check_and_restore_queue_depth(struct megasas_instance *instance)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:2434:6: warning: no previous prototype for 'megasas_start_timer' [-Wmissing-prototypes]
    2434 | void megasas_start_timer(struct megasas_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:2759:5: warning: no previous prototype for 'megasas_sriov_start_heartbeat' [-Wmissing-prototypes]
    2759 | int megasas_sriov_start_heartbeat(struct megasas_instance *instance,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:4609:6: warning: no previous prototype for 'megasas_free_cmds' [-Wmissing-prototypes]
    4609 | void megasas_free_cmds(struct megasas_instance *instance)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:4646:5: warning: no previous prototype for 'megasas_alloc_cmds' [-Wmissing-prototypes]
    4646 | int megasas_alloc_cmds(struct megasas_instance *instance)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_base.c: In function 'megasas_setup_irqs_ioapic':
>> drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:5930:25: warning: variable 'pdev' set but not used [-Wunused-but-set-variable]
    5930 |         struct pci_dev *pdev;
         |                         ^~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_base.c: In function 'megasas_setup_irqs_msix':
   drivers/thirdparty/megaraid_sas/megaraid_sas_base.c:6023:25: warning: variable 'pdev' set but not used [-Wunused-but-set-variable]
    6023 |         struct pci_dev *pdev;
         |                         ^~~~
--
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:197:1: warning: no previous prototype for 'megasas_enable_intr_fusion' [-Wmissing-prototypes]
     197 | megasas_enable_intr_fusion(struct megasas_instance *instance)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:220:1: warning: no previous prototype for 'megasas_disable_intr_fusion' [-Wmissing-prototypes]
     220 | megasas_disable_intr_fusion(struct megasas_instance *instance)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c: In function 'megasas_fusion_update_can_queue':
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:411:46: warning: variable 'reg_set' set but not used [-Wunused-but-set-variable]
     411 |         struct megasas_register_set __iomem *reg_set;
         |                                              ^~~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c: At top level:
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:3683:1: warning: no previous prototype for 'complete_cmd_fusion' [-Wmissing-prototypes]
    3683 | complete_cmd_fusion(struct megasas_instance *instance, u32 MSIxIndex,
         | ^~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:3895:6: warning: no previous prototype for 'megasas_enable_irq_poll' [-Wmissing-prototypes]
    3895 | void megasas_enable_irq_poll(struct megasas_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:3914:6: warning: no previous prototype for 'megasas_sync_irqs' [-Wmissing-prototypes]
    3914 | void megasas_sync_irqs(unsigned long instance_addr)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:3980:1: warning: no previous prototype for 'megasas_complete_cmd_dpc_fusion' [-Wmissing-prototypes]
    3980 | megasas_complete_cmd_dpc_fusion(unsigned long instance_addr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:4002:13: warning: no previous prototype for 'megasas_isr_fusion' [-Wmissing-prototypes]
    4002 | irqreturn_t megasas_isr_fusion(int irq, void *devp)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:4038:1: warning: no previous prototype for 'build_mpt_mfi_pass_thru' [-Wmissing-prototypes]
    4038 | build_mpt_mfi_pass_thru(struct megasas_instance *instance,
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:4096:1: warning: no previous prototype for 'build_mpt_cmd' [-Wmissing-prototypes]
    4096 | build_mpt_cmd(struct megasas_instance *instance, struct megasas_cmd *cmd)
         | ^~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:4122:1: warning: no previous prototype for 'megasas_issue_dcmd_fusion' [-Wmissing-prototypes]
    4122 | megasas_issue_dcmd_fusion(struct megasas_instance *instance,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:4321:5: warning: no previous prototype for 'megasas_wait_for_outstanding_fusion' [-Wmissing-prototypes]
    4321 | int megasas_wait_for_outstanding_fusion(struct megasas_instance *instance,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:4452:6: warning: no previous prototype for 'megasas_refire_mgmt_cmd' [-Wmissing-prototypes]
    4452 | void megasas_refire_mgmt_cmd(struct megasas_instance *instance, bool return_ioctl)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fusion.c:5023:26: warning: no previous prototype for 'megasas_get_peer_instance' [-Wmissing-prototypes]
    5023 | struct megasas_instance *megasas_get_peer_instance(struct megasas_instance *instance)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c:101:5: warning: no previous prototype for 'mega_div64_32' [-Wmissing-prototypes]
     101 | u64 mega_div64_32(uint64_t dividend, uint32_t divisor)
         |     ^~~~~~~~~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c: In function 'mega_div64_32':
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c:103:13: warning: variable 'remainder' set but not used [-Wunused-but-set-variable]
     103 |         u32 remainder;
         |             ^~~~~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c: At top level:
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c:387:5: warning: no previous prototype for 'MR_GetSpanBlock' [-Wmissing-prototypes]
     387 | u32 MR_GetSpanBlock(u32 ld, u64 row, u64 *span_blk,
         |     ^~~~~~~~~~~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c: In function 'MR_GetSpanBlock':
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c:406:51: warning: variable 'debugBlk' set but not used [-Wunused-but-set-variable]
     406 |                                         u64  blk, debugBlk;
         |                                                   ^~~~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c: At top level:
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c:438:5: warning: no previous prototype for 'mr_spanset_get_span_block' [-Wmissing-prototypes]
     438 | u32 mr_spanset_get_span_block(struct megasas_instance *instance,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c:665:4: warning: no previous prototype for 'get_arm' [-Wmissing-prototypes]
     665 | u8 get_arm(struct megasas_instance *instance, u32 ld, u8 span, u64 stripe,
         |    ^~~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c: In function 'mr_spanset_get_phy_params':
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c:721:32: warning: variable 'fusion' set but not used [-Wunused-but-set-variable]
     721 |         struct fusion_context *fusion;
         |                                ^~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c: At top level:
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c:812:4: warning: no previous prototype for 'MR_GetPhyParams' [-Wmissing-prototypes]
     812 | u8 MR_GetPhyParams(struct megasas_instance *instance, u32 ld, u64 stripRow,
         |    ^~~~~~~~~~~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c: In function 'MR_GetPhyParams':
   drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c:825:32: warning: variable 'fusion' set but not used [-Wunused-but-set-variable]
     825 |         struct fusion_context *fusion;
         |                                ^~~~~~
   drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c: At top level:
>> drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c:1379:4: warning: no previous prototype for 'megasas_get_best_arm_pd' [-Wmissing-prototypes]
    1379 | u8 megasas_get_best_arm_pd(struct megasas_instance *instance,
         |    ^~~~~~~~~~~~~~~~~~~~~~~
..


vim +/ch +560 drivers/thirdparty/ast/ast_mode.c

   556	
   557	static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
   558	{
   559		struct ast_private *ast = crtc->dev->dev_private;
 > 560		u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
   561	
   562		if (ast->chip == AST1180)
   563			return;
   564	
   565		switch (mode) {
   566		case DRM_MODE_DPMS_ON:
   567			ast_wait_one_vsync(ast);
   568			ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xdf, 0);
   569			ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, 0);
   570			if (ast->tx_chip_type == AST_TX_DP501)
   571				ast_set_dp501_video_output(crtc->dev, 1);
   572	
   573			if (ast->tx_chip_type == AST_TX_ASTDP) {
   574				ast_dp_power_on_off(crtc->dev, AST_DP_POWER_ON);
   575				ast_wait_one_vsync(ast);
   576				ast_dp_set_on_off(crtc->dev, 1);
   577			}
   578	
   579			ast_crtc_load_lut(crtc);
   580			break;
   581		case DRM_MODE_DPMS_STANDBY:
   582		case DRM_MODE_DPMS_SUSPEND:
   583		case DRM_MODE_DPMS_OFF:
   584			ch = mode;
   585			if (ast->tx_chip_type == AST_TX_DP501)
   586				ast_set_dp501_video_output(crtc->dev, 0);
   587	
   588			if (ast->tx_chip_type == AST_TX_ASTDP) {
   589				ast_dp_set_on_off(crtc->dev, 0);
   590				ast_dp_power_on_off(crtc->dev, AST_DP_POWER_OFF);
   591			}
   592	
   593			ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xdf, 0x20);
   594			ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, mode);
   595			break;
   596		}
   597	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
