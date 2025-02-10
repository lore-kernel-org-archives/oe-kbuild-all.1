Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7B124E4B1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223625; cv=none; b=gprtPgQ+aOU5MHUrl0DcegE0uHFXx2jQnCf8O6FCEvN5+Fwd4QIVbm88lm+hhy1CaieceoW7G9knwKPNV2DM1DRmhLUkSibdYWM2501zJgV4M+nuOY9vDRlo0jS7vZmebk09JkFzGTmArGaUnSfVK20wbGoP5qdJexZj8ovbTQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223625; c=relaxed/simple;
	bh=prnteViesIGDgRYqEM9GnFwLb0GsqG/fuygOM/J+4FI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TrG31ARACX6DrLdXcTjxD1saKq0ZMbP7LctB9fJTmjFkgvC0UpA2hHIvexxD6pjAxlIaopwvT2Rqbrz0zoWDbjQtKkToF6TBzc7mJA/d4csT8Uj7pf6AFcbQYBkhf//F8j5WIEwFBKa526HdrdxCFVvKzaW7KhQHTTMqLfcd+0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfYbq8EV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfYbq8EV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739223623; x=1770759623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=prnteViesIGDgRYqEM9GnFwLb0GsqG/fuygOM/J+4FI=;
  b=RfYbq8EVVOiUCG1pOx2I7lcYv2f/GmP4O0vFK/4Xai2L5z8jIy593J1q
   Rb2q21qKVW2LcL8t5LkLhQRJ9fmPpyXxMUYjqjAjQq+Zve1HnG2bEPnfg
   vSXQhe97VYMKsK7CMxj2yIJtxM1zw1YJEhno9NA3wqzevESg4WWCltOek
   +lb5TlTyg7aCCcXzRZc2zBr4dA2KC6xDtZAjYdrEjR4Bnu6FJN/jx3ZK3
   tR5qUvbCyBucwEMX6U0PGUky9GRBgdp8w5fLpvSf69rceL4F0ZiwaQw1U
   JOMa+QbIasrUCCYSRGgoshWKu1jBtbkyqQLVqCpxsEM+VN03n49ubG6tv
   g==;
X-CSE-ConnectionGUID: gJyDoE3sRwa3kZ9HCM+Y7Q==
X-CSE-MsgGUID: OmTxo484TVWDPl4y2Be3Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39689560"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39689560"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 13:40:22 -0800
X-CSE-ConnectionGUID: kD5r0LoUQ/qtNLCv+udTPA==
X-CSE-MsgGUID: k3HgOt1BSnesMuqEssHGLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="117389538"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Feb 2025 13:40:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thbVr-0013RH-0n;
	Mon, 10 Feb 2025 21:40:19 +0000
Date: Tue, 11 Feb 2025 05:39:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 217/217]
 drivers/misc/mediatek/slbc/slbc.c:283:5: warning: no previous prototype for
 function 'slbc_force_cache_ratio'
Message-ID: <202502110503.0KWM4nMr-lkp@intel.com>
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
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250211/202502110503.0KWM4nMr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110503.0KWM4nMr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110503.0KWM4nMr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/mediatek/slbc/slbc.c:283:5: warning: no previous prototype for function 'slbc_force_cache_ratio' [-Wmissing-prototypes]
     283 | int slbc_force_cache_ratio(enum slc_ach_uid uid, unsigned int ratio)
         |     ^
   drivers/misc/mediatek/slbc/slbc.c:283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     283 | int slbc_force_cache_ratio(enum slc_ach_uid uid, unsigned int ratio)
         | ^
         | static 
>> drivers/misc/mediatek/slbc/slbc.c:301:5: warning: no previous prototype for function 'slbc_total_ceil' [-Wmissing-prototypes]
     301 | int slbc_total_ceil(unsigned int ceil)
         |     ^
   drivers/misc/mediatek/slbc/slbc.c:301:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     301 | int slbc_total_ceil(unsigned int ceil)
         | ^
         | static 
>> drivers/misc/mediatek/slbc/slbc.c:319:5: warning: no previous prototype for function 'slbc_cg_priority' [-Wmissing-prototypes]
     319 | int slbc_cg_priority(bool gpu_first)
         |     ^
   drivers/misc/mediatek/slbc/slbc.c:319:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     319 | int slbc_cg_priority(bool gpu_first)
         | ^
         | static 
>> drivers/misc/mediatek/slbc/slbc.c:328:5: warning: no previous prototype for function 'slbc_disable_dcc' [-Wmissing-prototypes]
     328 | int slbc_disable_dcc(bool disable)
         |     ^
   drivers/misc/mediatek/slbc/slbc.c:328:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     328 | int slbc_disable_dcc(bool disable)
         | ^
         | static 
>> drivers/misc/mediatek/slbc/slbc.c:337:5: warning: no previous prototype for function 'slbc_disable_slc' [-Wmissing-prototypes]
     337 | int slbc_disable_slc(bool disable)
         |     ^
   drivers/misc/mediatek/slbc/slbc.c:337:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     337 | int slbc_disable_slc(bool disable)
         | ^
         | static 
>> drivers/misc/mediatek/slbc/slbc.c:394:12: warning: no previous prototype for function 'slbc_common_module_init' [-Wmissing-prototypes]
     394 | int __init slbc_common_module_init(void)
         |            ^
   drivers/misc/mediatek/slbc/slbc.c:394:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     394 | int __init slbc_common_module_init(void)
         | ^
         | static 
   6 warnings generated.
--
>> drivers/misc/mediatek/slbc/slbc_mt8196.c:186:6: warning: no previous prototype for function 'slbc_sram_init' [-Wmissing-prototypes]
     186 | void slbc_sram_init(struct mtk_slbc *slbc)
         |      ^
   drivers/misc/mediatek/slbc/slbc_mt8196.c:186:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     186 | void slbc_sram_init(struct mtk_slbc *slbc)
         | ^
         | static 
>> drivers/misc/mediatek/slbc/slbc_mt8196.c:251:6: warning: no previous prototype for function '_slbc_force_cmd' [-Wmissing-prototypes]
     251 | void _slbc_force_cmd(unsigned int force)
         |      ^
   drivers/misc/mediatek/slbc/slbc_mt8196.c:251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     251 | void _slbc_force_cmd(unsigned int force)
         | ^
         | static 
>> drivers/misc/mediatek/slbc/slbc_mt8196.c:377:6: warning: no previous prototype for function 'slbc_buffer_cb_notify' [-Wmissing-prototypes]
     377 | void slbc_buffer_cb_notify(u32 res, u32 sid, u32 sid_list)
         |      ^
   drivers/misc/mediatek/slbc/slbc_mt8196.c:377:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     377 | void slbc_buffer_cb_notify(u32 res, u32 sid, u32 sid_list)
         | ^
         | static 
   3 warnings generated.


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
