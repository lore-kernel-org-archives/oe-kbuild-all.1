Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF09278276
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 16:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726245732; cv=none; b=gBBPxmZTJdgOYBer8A9RLjwi0RlsGpwKuAQUrn1ClVyNXeX4gM4CIdctjCmLXSBqiHrrlv4Qpu2BWnf+tYIxMXGNqo8GZVLPcjA3aeIQ6Wk4ioPp4oXRqzHjLZS+nKGDmc3FYuOTQQWis3DDHOC2yuDjb6QeGPKyS1ZoVNtEY5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726245732; c=relaxed/simple;
	bh=4t0titKI9POlDTLVEPmiQct5YkoPSTyXdu9AwtChQMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pQuojsmyNbJiRFvX6um+WzzhWzFHgRDyXYaWjGiHe0gtpbjgc13jzRejPqlzP1OJTpiQeAEHMbVHvMrdMFlx1fD2nyfmfqkSs/mSLMsj7gAbjwFdgGF/qtFYVSBhvufCdk1tTaVYWwKOUevd1zd0Q1oOD+NQdDLXqioXqX3R6Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghHI//Zt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghHI//Zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726245731; x=1757781731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4t0titKI9POlDTLVEPmiQct5YkoPSTyXdu9AwtChQMc=;
  b=ghHI//Zt5PvI6GCumMPSP/WDf6r+vhHRXCK8Xzs1ttR8G71LRYSUKi5Q
   ed6ufbpPdfS930qYGfed0pTQ4Uzpycqx9w2Sr4PurIrfUtxY4KVXXeqYk
   8Mc+/XyC4j7uAT0+i3XpbpDxFPDPMBQncRI6uEJkD+Hp17jabdWrVzs6+
   X/7WecMdvlw5qK8x8I318aptOMoURZZpwDwc+Q/7h8zjkdweJ+4J2j3uq
   Lq0UtcYkkMmfTMhY6ux3rizMZbgpKmgmWQ98WUH07mm3XRsNJ7jyIMPaV
   l+zrAGKZ0luhmMiEYomqH1xIDqqPuIruFa07rFPUntFwVY2qMC70w4NBv
   g==;
X-CSE-ConnectionGUID: UomPKoVyTnOzV6yYh4nk3Q==
X-CSE-MsgGUID: KXlTB+4ZQ0GI1jdJ+4yyew==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25034504"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25034504"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 09:42:08 -0700
X-CSE-ConnectionGUID: Kh5ylPfHTi+w04GlIPb2rw==
X-CSE-MsgGUID: YZ1B8DqPTVyuxVsBWY+gYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68368389"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Sep 2024 09:42:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp9Mz-0006hU-0B;
	Fri, 13 Sep 2024 16:42:05 +0000
Date: Sat, 14 Sep 2024 00:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 11451/30000] mm/mem_reliable.c:430:9: error:
 implicit declaration of function 'mem_reliable_ctrl_bit_disable'; did you
 mean 'mem_reliable_ctrl_bit_disabled'?
Message-ID: <202409140014.U3Yy9wN5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5a1d9701155c6908c76c68951170f10279685143
commit: 2525d04c6308006b789564ed955081602727f38f [11451/30000] mm: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-001-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140014.U3Yy9wN5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140014.U3Yy9wN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140014.U3Yy9wN5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/mem_reliable.c: In function 'mem_reliable_feature_disable':
>> mm/mem_reliable.c:430:9: error: implicit declaration of function 'mem_reliable_ctrl_bit_disable'; did you mean 'mem_reliable_ctrl_bit_disabled'? [-Werror=implicit-function-declaration]
     430 |         mem_reliable_ctrl_bit_disable(idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mem_reliable_ctrl_bit_disabled
   mm/mem_reliable.c: At top level:
>> mm/mem_reliable.c:405:13: warning: 'mem_reliable_ctrl_bit_disabled' defined but not used [-Wunused-function]
     405 | static void mem_reliable_ctrl_bit_disabled(int idx) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +430 mm/mem_reliable.c

   387	
   388	static int __init reliable_sysctl_init(void)
   389	{
   390		if (!mem_reliable_is_enabled())
   391			return 0;
   392	
   393		if (!register_sysctl_table(reliable_dir_table)) {
   394			pr_err("register sysctl failed.");
   395			return -ENOMEM;
   396		}
   397	
   398		percpu_counter_init(&pagecache_reliable_pages, 0, GFP_KERNEL);
   399		percpu_counter_init(&anon_reliable_pages, 0, GFP_KERNEL);
   400	
   401		return 0;
   402	}
   403	arch_initcall(reliable_sysctl_init);
   404	#else
 > 405	static void mem_reliable_ctrl_bit_disabled(int idx) {}
   406	#endif
   407	
   408	static void mem_reliable_feature_disable(int idx)
   409	{
   410		char *str = NULL;
   411	
   412		switch (idx) {
   413		case MEM_RELIABLE_FALLBACK:
   414			reliable_allow_fallback = false;
   415			str = "fallback";
   416			break;
   417		case MEM_RELIABLE_SHMEM:
   418			shmem_reliable = false;
   419			str = "shmem";
   420			break;
   421		case MEM_RELIABLE_PAGECACHE:
   422			pagecache_use_reliable_mem = false;
   423			str = "pagecache";
   424			break;
   425		default:
   426			pr_err("unknown index: %d", idx);
   427			return;
   428		}
   429	
 > 430		mem_reliable_ctrl_bit_disable(idx);
   431		pr_info("%s is disabled\n", str);
   432	}
   433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
