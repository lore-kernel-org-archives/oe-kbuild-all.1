Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311523;
	b=N7bAXwMaK2sZQvjaBeBJh70lf9uTv8xvldhh35Rs1AKWGtD5h99e1WzVVe67v4FUZsI1
	 kYahcqSja6draeLBhH08QT5dECTc5ZPEKeDzEVMOHMrZfMl3ZMOFhtlKcmN7+irHwUfCT
	 6qvaBtYC3WXs/PDT3Sit5JBuiTOzDp/6cobpJ/IThqDjgegTgfCMtdNS0SSKTxg6S7zCT
	 1nGfHL3fztf0axd/GYNrUAN1U5jbof4gcjnBv+Fj1tKiBqgJ+xT139dqbDJ6vbP4ICggu
	 wcCKbSVPDIHExE5JDtuXvA5aUMwNaM7+V5jNQR+wDxHBo/2d/rVNt6Ok7+l9tqmkzbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311523;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CAPhJ15hu5aheqz58ZUolUySdjqBMiTOrM3Q2nOO+6g=;
	b=GXLQgDllkyiYkrAcp2091NFul/1U8rrWISL+sOZyo1KGYubxADypnWS8NGCWkHSOFApR
	 s3ZnBKkec9jbsB/arMyj30NkxjbGywQyFjOgUHAUJnyzRWcE0yOlUGWCL0AuUC3PeQM4d
	 NHGU3+kwYDK0KE660HdrqceckB3onNdnEquz63J6A1MCEVMgn/LF2pA49a7f+NwofVdAD
	 5aTvISTvkiRPF/BDjtyEhiYXlGLVnwEkR3PGl1MaJoHXBok6+XgGF91YCBzHiMTI0ewSU
	 0aK8Umw+vJlnI5a7NA1QZ1sYsy1bZHneAFWJc6dJx+DvydG6M9wZt8dv8ofS6LVor6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTsDQWjJ;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA6606A31D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 22:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9EA6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTsDQWjJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793311521; x=1824847521;
  h=date:from:to:cc:subject:message-id;
  bh=pWNDlVRkz3cDdtBEA4XL8+I4ZgqkW7hPAl55UCAelfU=;
  b=HTsDQWjJqks/V+4jjN2BKdj2YRIJEt1eyynCGLmTAXQKlJz9IHljWMVn
   517ynjdYyWcdBaz4Bnr4L23kRXRRh+IXli3x6mOULsczXldFqkEZMKlt/
   eAwri53sUhfvBpLu5h/oTiUTbeU7b5dCS+e3plUrT30TIjCuWWNnsV+y+
   otMGhSHta3jJWM4NM83cWOclJ1UlSGvAYWsvryzfFe+QW8dwS2W9GKqws
   FEzJV6g6qgU7XdyKAAwDOhrs0vLVujBpGDEyKJdLHZDx3hXbh4dISpvwP
   fqbweDTdjA4MCl6fsP5ZpnhtNseORHcZ8oM3MZZ1aRfX+Hb4tbg2tU/Lm
   g==;
X-CSE-ConnectionGUID: RCZVdeKpQKmX0HoG4YvgnQ==
X-CSE-MsgGUID: GIuM7qsASbyRsblCwgHDRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2163089"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2163089"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 15:05:20 -0700
X-CSE-ConnectionGUID: 4mzT5kG3RY+2OykCzNHG5Q==
X-CSE-MsgGUID: geHOkkvzTPGDcbmblitNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5361917"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2026 15:05:19 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMYFI-000000005MD-3qPR;
	Thu, 29 Oct 2026 22:05:16 +0000
Date: Thu, 29 Oct 2026 23:05:15 +0100
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/qmi-elem-info-clean 1/2]
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:229:35: warning:
 'wlfw_mem_seg_resp_s_v01_ei' defined but not used
Message-ID: <202610292328.ryUZaTgz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/krzk/linux n/qmi-elem-info-clean
head:   145edb2b10d358ba7ae541f22f39b73222f7c8bf
commit: 9090b0046ce1c96b4cb0ad6e097474796798c4d7 [1/2] wifi: ath10k: Drop unused qmi_elem_info arrays
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261029/202610292328.ryUZaTgz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292328.ryUZaTgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292328.ryUZaTgz-lkp@intel.com/

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
