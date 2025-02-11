Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D97C190486
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 08:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260953; cv=none; b=JusBngE4C5qYe91jFEqjycbMVPy5FoN0bqpmlVeWevf7LIT9xRYMyoeq+j6K33MWkmhYs13YJCVlvxXXLj5MQnIumtSb2ZEwTGJMHgznUFKieZ8D5W3O3mgdTASZA8MNKq+/D7Ne6SmNHKuwbKigHFlJt4LP3ATr2h9XoAnvpzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260953; c=relaxed/simple;
	bh=7Z0QCNEFgFlGbxUd9C8YGSeo3pJ0qVWvaQp1zNvBFxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aMcXYWKRlZhIn2O0j2AF6F5Sj/WzXnj3NH10vIBttpuR5IfZxN6ZrhkCXWnF95C8oH3mzuMJdzS7q90Uvy2Fkcwp6H7ByfvXVD+ap9xZMRYg11VdfeRGNvuSb07On2gg2b21w+3L4j6FTEkfYsf7aCaFJhpjJ/cquppOnq6BHys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGBICcm3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGBICcm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739260951; x=1770796951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Z0QCNEFgFlGbxUd9C8YGSeo3pJ0qVWvaQp1zNvBFxA=;
  b=OGBICcm3EEG8O6cFLMWIvkZNDNFTyulUXa1k1H4RC0jEK2lJghxHZbNZ
   GRUacoE92UNNGXIisQNfsfG1veYmyevD6aqrPz0ko7ZiKfTpULR0B3udU
   M1KymPVvgfdmcIA7WHODX91To7eDfPzv4fXhfZPnlBTIxI0aTx2kqY421
   vSG5f8I3Z5yv9r+wAsdKh2oGkwSDJIBfOhxl00GTdac6A+LwmBxWfwsbk
   SL9C1kIi5kTmz019l/kM2P1FG+6QUIlzyANoayibuUn5BXYrbDMkr639X
   r8rNG2rioJIFIiLhsWTa+lMA/600WOobR4QoAZ3G4n+JCNtmmpFF6cAVk
   Q==;
X-CSE-ConnectionGUID: anRJ4Zc9TWCd0oFALDdHPw==
X-CSE-MsgGUID: KpqZlLGFQCaIbMKCBffpow==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50095953"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="50095953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:02:30 -0800
X-CSE-ConnectionGUID: PdknFYBBTmmkrsEbKBeFdA==
X-CSE-MsgGUID: iiLlQiTbRHqJljeR1rdu/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143338302"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Feb 2025 00:02:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thlDu-0013tz-0K;
	Tue, 11 Feb 2025 08:02:26 +0000
Date: Tue, 11 Feb 2025 16:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 217/217]
 drivers/misc/mediatek/slbc/slbc.c:283:5: warning: no previous prototype for
 'slbc_force_cache_ratio'
Message-ID: <202502111519.48o6q97l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b603fe68bcf1fd8aa46dd46190c53d641dce5cf0
commit: 506f6613f2e6836fd59eeab2456dcfb0a000954d [217/217] CHROMIUM: misc: mediatek: slc: Porting SLBC driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250211/202502111519.48o6q97l-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111519.48o6q97l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111519.48o6q97l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: drivers/misc/mediatek/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/include/mt-plat: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/sspm: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/sspm/v3: No such file or directory [-Wmissing-include-dirs]
>> drivers/misc/mediatek/slbc/slbc.c:283:5: warning: no previous prototype for 'slbc_force_cache_ratio' [-Wmissing-prototypes]
     283 | int slbc_force_cache_ratio(enum slc_ach_uid uid, unsigned int ratio)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc.c:301:5: warning: no previous prototype for 'slbc_total_ceil' [-Wmissing-prototypes]
     301 | int slbc_total_ceil(unsigned int ceil)
         |     ^~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc.c:319:5: warning: no previous prototype for 'slbc_cg_priority' [-Wmissing-prototypes]
     319 | int slbc_cg_priority(bool gpu_first)
         |     ^~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc.c:328:5: warning: no previous prototype for 'slbc_disable_dcc' [-Wmissing-prototypes]
     328 | int slbc_disable_dcc(bool disable)
         |     ^~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc.c:337:5: warning: no previous prototype for 'slbc_disable_slc' [-Wmissing-prototypes]
     337 | int slbc_disable_slc(bool disable)
         |     ^~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc.c:394:12: warning: no previous prototype for 'slbc_common_module_init' [-Wmissing-prototypes]
     394 | int __init slbc_common_module_init(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
--
   cc1: warning: drivers/misc/mediatek/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/include/mt-plat: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/sspm: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/sspm/v3: No such file or directory [-Wmissing-include-dirs]
>> drivers/misc/mediatek/slbc/slbc_mt8196.c:186:6: warning: no previous prototype for 'slbc_sram_init' [-Wmissing-prototypes]
     186 | void slbc_sram_init(struct mtk_slbc *slbc)
         |      ^~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_mt8196.c:251:6: warning: no previous prototype for '_slbc_force_cmd' [-Wmissing-prototypes]
     251 | void _slbc_force_cmd(unsigned int force)
         |      ^~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_mt8196.c:377:6: warning: no previous prototype for 'slbc_buffer_cb_notify' [-Wmissing-prototypes]
     377 | void slbc_buffer_cb_notify(u32 res, u32 sid, u32 sid_list)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c: In function '_slbc_request':
>> drivers/misc/mediatek/slbc/slbc_mt8196.c:655:40: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     655 |                         d->emi_paddr = (void __iomem *)((((unsigned long)d->paddr)
         |                                        ^
   drivers/misc/mediatek/slbc/slbc_mt8196.c: In function 'slbc_suspend_cb':
>> drivers/misc/mediatek/slbc/slbc_mt8196.c:1610:40: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
    1610 |                         } else if (sid == UID_AOV |
         |                                    ~~~~^~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c:1612:45: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
    1612 |                                         sid == UID_AOV_APU) {
         |                                         ~~~~^~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c: In function 'slbc_resume_cb':
   drivers/misc/mediatek/slbc/slbc_mt8196.c:1637:40: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
    1637 |                         } else if (sid == UID_AOV |
         |                                    ~~~~^~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c:1639:45: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
    1639 |                                         sid == UID_AOV_APU) {
         |                                         ~~~~^~~~~~~~~~~~~~
--
   cc1: warning: drivers/misc/mediatek/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/include/mt-plat: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/sspm: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/sspm/v3: No such file or directory [-Wmissing-include-dirs]
   drivers/misc/mediatek/slbc/slbc_ipi.c: In function '_slbc_request_cache_scmi':
>> drivers/misc/mediatek/slbc/slbc_ipi.c:432:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     432 |                         d->paddr = (void __iomem *)(long long)rvalue.slbc_resv1;
         |                                    ^
   drivers/misc/mediatek/slbc/slbc_ipi.c: In function '_slbc_release_cache_scmi':
   drivers/misc/mediatek/slbc/slbc_ipi.c:465:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     465 |                         d->paddr = (void __iomem *)(long long)rvalue.slbc_resv1;
         |                                    ^
   drivers/misc/mediatek/slbc/slbc_ipi.c: In function '_slbc_request_buffer_scmi':
   drivers/misc/mediatek/slbc/slbc_ipi.c:527:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     527 |                         d->paddr = (void __iomem *)(long long)rvalue.slbc_resv1;
         |                                    ^
   drivers/misc/mediatek/slbc/slbc_ipi.c: In function '_slbc_release_buffer_scmi':
   drivers/misc/mediatek/slbc/slbc_ipi.c:559:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     559 |                         d->paddr = (void __iomem *)(long long)rvalue.slbc_resv1;
         |                                    ^
--
   cc1: warning: drivers/misc/mediatek/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/include/mt-plat: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/sspm: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/sspm/v3: No such file or directory [-Wmissing-include-dirs]


vim +/slbc_force_cache_ratio +283 drivers/misc/mediatek/slbc/slbc.c

   282	
 > 283	int slbc_force_cache_ratio(enum slc_ach_uid uid, unsigned int ratio)
   284	{
   285		if (common_ops && common_ops->slbc_force_cache_ratio)
   286			return common_ops->slbc_force_cache_ratio(uid, ratio);
   287		else
   288			return -ENODEV;
   289	}
   290	EXPORT_SYMBOL_GPL(slbc_force_cache_ratio);
   291	
   292	int slbc_ceil(enum slc_ach_uid uid, unsigned int ceil)
   293	{
   294		if (common_ops && common_ops->slbc_ceil)
   295			return common_ops->slbc_ceil(uid, ceil);
   296		else
   297			return -ENODEV;
   298	}
   299	EXPORT_SYMBOL_GPL(slbc_ceil);
   300	
 > 301	int slbc_total_ceil(unsigned int ceil)
   302	{
   303		if (common_ops && common_ops->slbc_total_ceil)
   304			return common_ops->slbc_total_ceil(ceil);
   305		else
   306			return -ENODEV;
   307	}
   308	EXPORT_SYMBOL_GPL(slbc_total_ceil);
   309	
   310	int slbc_window(unsigned int window)
   311	{
   312		if (common_ops && common_ops->slbc_window)
   313			return common_ops->slbc_window(window);
   314		else
   315			return -ENODEV;
   316	}
   317	EXPORT_SYMBOL_GPL(slbc_window);
   318	
 > 319	int slbc_cg_priority(bool gpu_first)
   320	{
   321		if (common_ops && common_ops->slbc_cg_priority)
   322			return common_ops->slbc_cg_priority(gpu_first);
   323		else
   324			return -ENODEV;
   325	}
   326	EXPORT_SYMBOL_GPL(slbc_cg_priority);
   327	
 > 328	int slbc_disable_dcc(bool disable)
   329	{
   330		if (common_ops && common_ops->slbc_disable_dcc)
   331			return common_ops->slbc_disable_dcc(disable);
   332		else
   333			return -ENODEV;
   334	}
   335	EXPORT_SYMBOL_GPL(slbc_disable_dcc);
   336	
 > 337	int slbc_disable_slc(bool disable)
   338	{
   339		if (common_ops && common_ops->slbc_disable_slc)
   340			return common_ops->slbc_disable_slc(disable);
   341		else
   342			return -ENODEV;
   343	}
   344	EXPORT_SYMBOL_GPL(slbc_disable_slc);
   345	
   346	int slbc_get_cache_size(enum slc_ach_uid uid)
   347	{
   348		if (common_ops && common_ops->slbc_get_cache_size)
   349			return common_ops->slbc_get_cache_size(uid);
   350		else
   351			return -ENODEV;
   352	}
   353	EXPORT_SYMBOL_GPL(slbc_get_cache_size);
   354	
   355	int slbc_get_cache_hit_rate(enum slc_ach_uid uid)
   356	{
   357		if (common_ops && common_ops->slbc_get_cache_hit_rate)
   358			return common_ops->slbc_get_cache_hit_rate(uid);
   359		else
   360			return -ENODEV;
   361	}
   362	EXPORT_SYMBOL_GPL(slbc_get_cache_hit_rate);
   363	
   364	int slbc_get_cache_hit_bw(enum slc_ach_uid uid)
   365	{
   366		if (common_ops && common_ops->slbc_get_cache_hit_bw)
   367			return common_ops->slbc_get_cache_hit_bw(uid);
   368		else
   369			return -ENODEV;
   370	}
   371	EXPORT_SYMBOL_GPL(slbc_get_cache_hit_bw);
   372	
   373	int slbc_get_cache_usage(int *cpu, int *gpu, int *other)
   374	{
   375		if (common_ops && common_ops->slbc_get_cache_usage)
   376			return common_ops->slbc_get_cache_usage(cpu, gpu, other);
   377		else
   378			return -ENODEV;
   379	}
   380	EXPORT_SYMBOL_GPL(slbc_get_cache_usage);
   381	
   382	void slbc_register_common_ops(struct slbc_common_ops *ops)
   383	{
   384		common_ops = ops;
   385	}
   386	EXPORT_SYMBOL_GPL(slbc_register_common_ops);
   387	
   388	void slbc_unregister_common_ops(struct slbc_common_ops *ops)
   389	{
   390		common_ops = NULL;
   391	}
   392	EXPORT_SYMBOL_GPL(slbc_unregister_common_ops);
   393	
 > 394	int __init slbc_common_module_init(void)
   395	{
   396		return 0;
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
