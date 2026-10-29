Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313443;
	b=sZcGzOR3TkbGd1NEGXjqlkWJ5gTRSV3wZND7HrNIy0qW8Es1p4d91gJaqjRDn7szdb3e
	 M/P0ImS55/lLUxgospgijKF/hVmQ2r+8CqCCH3RrvzO/J3jfNq5ZC16Xn/sccOu7ky0/e
	 boCC77+QvmCSUJxsJ6UyGEEdvazHfvHJqPgdR6ca6OOhDvmVURY1XcTGdMWWA6ItexjbO
	 uA1CLeG5EJ8T7fejNonrZ83g6SFQMvJmNriIts57JalAcvvpqPI7m8t+en0+YajrVy6K6
	 3I+TvTpeVwCTA03Vv7ENvY2w4tq2c+T28uZKQmrMf+bwOLgDdWUGxoo01MZizGF6pbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313443;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BceAl54QKVUYCwlos2rrbrHnyRR4ipounEw1ZNQqeuU=;
	b=ASCbeLWBG1mo1N3RohgEctKJRcEyMYB985hGAdZC5XLjrAml2UIIJYFjoig+AWFyKAUE
	 60XvcT/Ws6toKIQFjukuhRnOyoDEWRvcdzwQM0DjsM5QJnEVL5QLfidT2TgmSu0uJSF5l
	 8KonHThtpP1oFcLnFXdBfx/+p43zQuQvULkjrS9vTYccYgMlvmdL414BWs0FyLogc3r+V
	 BiN4OcYXjniUvda5o6JrDCGBggZ5ryljjUUpxp83DjfnbvKro6QRiCuV8IAZoL0TX2qIs
	 HYmz1UKnUmwkeu0rB4p32r6fNxeWUZA6dtEheu6nPGeXxYJ2iO41aUFem7Ld3IDZxVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BK2LRppW;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D40606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 22:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1D40606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BK2LRppW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793313442; x=1824849442;
  h=date:from:to:cc:subject:message-id;
  bh=bElAtg//YLPd1AfRTOWDXNV5Rit4RqGiXDa0lfGk1Ws=;
  b=BK2LRppWdL3zscAvbKtnA1qY8eLbfltaRL7tjMMLC4HqIgoNrBj2dTvE
   u9zk6PFyX6bTIpVCH9aLQUT0FZADJxv+lbI4eHR/I+wLFVFksc/ZnCPhn
   qtnhvDjePFUSL4wMUEScGgs7Q6Y/QSXbY6+/67XvnlVFyYONJaBDO6h74
   dcPAAdOpMmd/JkmPHKP7GGRC/b0LDGaeZd3uWdJoXrJx6+OrsbYb+ffb3
   NMDbVD6pzhVgHmtONsZXvNG1X5VwSb5BiionG7aBYt5+DK+Py73L0m5MT
   YvMfChZZPad9+qzO6IATGHgKVX5OEUP+Zqz75X6bZV00rtSj8Y6bKIYtq
   Q==;
X-CSE-ConnectionGUID: SPGQ1FKrTra8U2gobH3bfw==
X-CSE-MsgGUID: 0X4TxhMbQYOaVZRbitGVCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1950571"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1950571"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 15:37:21 -0700
X-CSE-ConnectionGUID: WYy5uDy+TWC82C0wfO58cA==
X-CSE-MsgGUID: 9etViRrTTzKlz3ndOn2vaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="7084044"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 29 Oct 2026 15:37:20 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMYkI-000000005MZ-1S5F;
	Thu, 29 Oct 2026 22:37:18 +0000
Date: Thu, 29 Oct 2026 23:36:22 +0100
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/qmi-elem-info-clean 1/2]
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:188:35: warning: unused
 variable 'wlfw_mem_seg_s_v01_ei'
Message-ID: <202610292337.SXI0l0ju-lkp@intel.com>
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261029/202610292337.SXI0l0ju-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292337.SXI0l0ju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292337.SXI0l0ju-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:188:35: warning: unused variable 'wlfw_mem_seg_s_v01_ei' [-Wunused-const-variable]
     188 | static const struct qmi_elem_info wlfw_mem_seg_s_v01_ei[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:229:35: warning: unused variable 'wlfw_mem_seg_resp_s_v01_ei' [-Wunused-const-variable]
     229 | static const struct qmi_elem_info wlfw_mem_seg_resp_s_v01_ei[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/wlfw_mem_seg_s_v01_ei +188 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c

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

:::::: The code at line 188 was first introduced by commit
:::::: 11e1fcf2b494da810d551553c46f739e36501adc wifi: ath10k: Make QMI message rules const

:::::: TO: Jeff Johnson <quic_jjohnson@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
