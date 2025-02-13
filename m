Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51820A5E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434148; cv=none; b=dLo2qp0M0JH+IdzDlOEvei2bTTFaL6CwF5nrfpEajMlD3NSNQ1vcnnayuSiBmOP67EhmhJbVhV3KtfJIpSmN6LT0+xcl445b35TL+litx2KPENl8TK6hgklngSfpIvvpDHUli7eYwEUs9L/laY28AYvWGpEu4L6fp5ZZPU/qCOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434148; c=relaxed/simple;
	bh=ckWd/nFwO7TRd0Klcg2nz9X1SkFgJlXm9fbdmQY9EQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y3U9Zs4ZyMXsyusMT8qGCnBJR0W/yBWXJUyZg5iLWN7t6wr17PjlYazYExrFkux44t4jPMS8p2CEpmMXK4Ur18U0GtQpPBGtIvFUCMVeOqd5rx8SUWx3Tguq1IZhOx27b/ptwy0lgDhtIoXO95YVBcZgzZ4/L+rUEw0QYvpxNW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aENv5Kbk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aENv5Kbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739434147; x=1770970147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ckWd/nFwO7TRd0Klcg2nz9X1SkFgJlXm9fbdmQY9EQs=;
  b=aENv5KbkIYaovhevAp3g0IBlwK6pGH4vcQoD3En2Ca5YcU7NV0AE+vRI
   T46bOnqvH+Wf5iOy0OFyBRwToxg6qO/JXCWbiI+wFVBJ0k4Q1Z5tVZjGZ
   zDMC5iXlrHuaqEH5CFkZJBo2NKi/tSFNI+aHFEinDk215efplZznU/ppg
   xluRej8ijI8wtSdPMOdbd5F748CMSvNHkGRgcrJ5u9eSiC3u2Fqfr5+QY
   qPOgXGrOgGYoJkFqGepZ1Y2NKRcv+M1DhGOF8n5sahGRTSNFNunxY4rDa
   eeHUIujKg6qYQEiusFSsc0Mw4ARh3jZ+dTmmfxnLfsAojJc2sOfImLyx2
   g==;
X-CSE-ConnectionGUID: 8+r5dsZ8SdOQ3c/2ygGO4g==
X-CSE-MsgGUID: u0lKP/aUTw6KBwRKQvfGgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40246542"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40246542"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 00:09:05 -0800
X-CSE-ConnectionGUID: fZR+v177Qs+Ed/SRIWKK3w==
X-CSE-MsgGUID: JhFZiNjhT6GO28K0FzZdyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113730524"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 00:08:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiUHH-0016lp-2z;
	Thu, 13 Feb 2025 08:08:55 +0000
Date: Thu, 13 Feb 2025 16:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/str-enable-disable 35/36]
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:229:35: warning:
 'wlfw_mem_seg_resp_s_v01_ei' defined but not used
Message-ID: <202502131536.AvYb9thE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/str-enable-disable
head:   6c9652f6b59a48e3ffc567fb41acbe262a9b0357
commit: 021178bf9ed9bf280ce069f32ccd284d4a497e6a [35/36] wifi
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250213/202502131536.AvYb9thE-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131536.AvYb9thE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131536.AvYb9thE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:229:35: warning: 'wlfw_mem_seg_resp_s_v01_ei' defined but not used [-Wunused-const-variable=]
     229 | static const struct qmi_elem_info wlfw_mem_seg_resp_s_v01_ei[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:188:35: warning: 'wlfw_mem_seg_s_v01_ei' defined but not used [-Wunused-const-variable=]
     188 | static const struct qmi_elem_info wlfw_mem_seg_s_v01_ei[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~


vim +/wlfw_mem_seg_resp_s_v01_ei +229 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c

bc17d4b90cdd3e Govind Singh 2018-10-11  187  
11e1fcf2b494da Jeff Johnson 2022-09-14 @188  static const struct qmi_elem_info wlfw_mem_seg_s_v01_ei[] = {
bc17d4b90cdd3e Govind Singh 2018-10-11  189  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  190  		.data_type      = QMI_UNSIGNED_4_BYTE,
bc17d4b90cdd3e Govind Singh 2018-10-11  191  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  192  		.elem_size      = sizeof(u32),
bc17d4b90cdd3e Govind Singh 2018-10-11  193  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  194  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  195  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  196  					   size),
bc17d4b90cdd3e Govind Singh 2018-10-11  197  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  198  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  199  		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
bc17d4b90cdd3e Govind Singh 2018-10-11  200  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  201  		.elem_size      = sizeof(enum wlfw_mem_type_enum_v01),
bc17d4b90cdd3e Govind Singh 2018-10-11  202  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  203  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  204  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  205  					   type),
bc17d4b90cdd3e Govind Singh 2018-10-11  206  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  207  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  208  		.data_type      = QMI_DATA_LEN,
bc17d4b90cdd3e Govind Singh 2018-10-11  209  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  210  		.elem_size      = sizeof(u8),
bc17d4b90cdd3e Govind Singh 2018-10-11  211  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  212  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  213  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  214  					   mem_cfg_len),
bc17d4b90cdd3e Govind Singh 2018-10-11  215  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  216  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  217  		.data_type      = QMI_STRUCT,
bc17d4b90cdd3e Govind Singh 2018-10-11  218  		.elem_len       = QMI_WLFW_MAX_NUM_MEM_CFG_V01,
bc17d4b90cdd3e Govind Singh 2018-10-11  219  		.elem_size      = sizeof(struct wlfw_mem_cfg_s_v01),
bc17d4b90cdd3e Govind Singh 2018-10-11  220  		.array_type       = VAR_LEN_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  221  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  222  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  223  					   mem_cfg),
bc17d4b90cdd3e Govind Singh 2018-10-11  224  		.ei_array      = wlfw_mem_cfg_s_v01_ei,
bc17d4b90cdd3e Govind Singh 2018-10-11  225  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  226  	{}
bc17d4b90cdd3e Govind Singh 2018-10-11  227  };
bc17d4b90cdd3e Govind Singh 2018-10-11  228  
11e1fcf2b494da Jeff Johnson 2022-09-14 @229  static const struct qmi_elem_info wlfw_mem_seg_resp_s_v01_ei[] = {
bc17d4b90cdd3e Govind Singh 2018-10-11  230  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  231  		.data_type      = QMI_UNSIGNED_8_BYTE,
bc17d4b90cdd3e Govind Singh 2018-10-11  232  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  233  		.elem_size      = sizeof(u64),
bc17d4b90cdd3e Govind Singh 2018-10-11  234  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  235  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  236  		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  237  					   addr),
bc17d4b90cdd3e Govind Singh 2018-10-11  238  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  239  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  240  		.data_type      = QMI_UNSIGNED_4_BYTE,
bc17d4b90cdd3e Govind Singh 2018-10-11  241  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  242  		.elem_size      = sizeof(u32),
bc17d4b90cdd3e Govind Singh 2018-10-11  243  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  244  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  245  		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  246  					   size),
bc17d4b90cdd3e Govind Singh 2018-10-11  247  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  248  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  249  		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
bc17d4b90cdd3e Govind Singh 2018-10-11  250  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  251  		.elem_size      = sizeof(enum wlfw_mem_type_enum_v01),
bc17d4b90cdd3e Govind Singh 2018-10-11  252  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  253  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  254  		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  255  					   type),
bc17d4b90cdd3e Govind Singh 2018-10-11  256  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  257  	{}
bc17d4b90cdd3e Govind Singh 2018-10-11  258  };
bc17d4b90cdd3e Govind Singh 2018-10-11  259  

:::::: The code at line 229 was first introduced by commit
:::::: 11e1fcf2b494da810d551553c46f739e36501adc wifi: ath10k: Make QMI message rules const

:::::: TO: Jeff Johnson <quic_jjohnson@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
