Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A9AEED7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 01:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747789979; cv=none; b=ke4oVtLL1+y3P6DUkNJfhf/WZHQZuRh3zPrLEzNxBZs4jNgJNQx33yt02ch+RulfS79obcr06FgoZcAq+EZIyaGQWESa5LJxT5oeZqmCgLD/thOhQSxJ12FUyOCBLUMQVjl46Y6UaRcSG3Flf/nRVZ1qY4KytgdnxYBFvSX88f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747789979; c=relaxed/simple;
	bh=ThPmOzApklqeOt47H26W8WK4Z//DicCiZ2aRKCNZDbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LzRAYiv8VrIZcRLR4fQhGK21DpvLT8zvFdvNd+pC5XrBemdDvrzO422FNq4RL6C24uHtdoiKtw9JLZs0PMN3/ndkiCRDRlGPEeVlgAs0+GNoL3kYOyPAoHb7x90iYCjb3lZTN581WyD69PGaQeRA7qlqD4SwpcozEU+Ps2ceZ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHeqAnT6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHeqAnT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747789977; x=1779325977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ThPmOzApklqeOt47H26W8WK4Z//DicCiZ2aRKCNZDbQ=;
  b=MHeqAnT6rJEDd9lupgFNDCcSVwsJSyZd2B9h3QBHMVzoT1txA52opWVW
   eGfz2OmO35ZDIkWRx0h0dlkwEUkTZ7OuSrXigbIXP+aKcbgoP4L+UF+70
   IC1jnF3iSEU14MP2hVR0r2TwTTHKMOEZHsc7t3B8qBKnzcWCL362cZ3kO
   F6zRW2e9j0W3MJF8cvqrxZzHc+o9zcdsJtXyrrDXHYm4gHoV2+inPmVDE
   YRxdZSbdCMwN4Ep/4fHEDfxFVn65cLZ/lSdgQpWSBe5+yDPzc4Ssb6H2v
   g7WDEAUE/CKOf6cyZUfY+wBDEJJoxnEe7OyXuBTTDsHBDMyewoUsyfud7
   A==;
X-CSE-ConnectionGUID: gwT3qv9gRhyGp8b/pWgl3Q==
X-CSE-MsgGUID: LxKmPTwwRB+eG01WCJ0HnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49649754"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49649754"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 18:12:57 -0700
X-CSE-ConnectionGUID: 2lyd0/wtQ6q9nTua59RtBg==
X-CSE-MsgGUID: u2Bj35g5QN6wqS7Ar4gPgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170733130"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2025 18:12:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHY0r-000Njq-0f;
	Wed, 21 May 2025 01:12:53 +0000
Date: Wed, 21 May 2025 09:12:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2263/2263] mm/damon/core.c:116:5: warning: no
 previous prototype for function 'damon_target_init_kfifo'
Message-ID: <202505210904.LgTxS8rg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dea1e68d661266b45b33cc596c34b451de95000c
commit: 2e9ef6c3ea086c85d489898471e527aeb3f7460b [2263/2263] mm/damon/vaddr: Support hardware-assisted memory access sampling
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250521/202505210904.LgTxS8rg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210904.LgTxS8rg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210904.LgTxS8rg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:116:5: warning: no previous prototype for function 'damon_target_init_kfifo' [-Wmissing-prototypes]
     116 | int damon_target_init_kfifo(struct damon_target *t)
         |     ^
   mm/damon/core.c:116:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     116 | int damon_target_init_kfifo(struct damon_target *t)
         | ^
         | static 
>> mm/damon/core.c:132:6: warning: no previous prototype for function 'damon_target_deinit_kfifo' [-Wmissing-prototypes]
     132 | void damon_target_deinit_kfifo(struct damon_target *t)
         |      ^
   mm/damon/core.c:132:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     132 | void damon_target_deinit_kfifo(struct damon_target *t)
         | ^
         | static 
   2 warnings generated.


vim +/damon_target_init_kfifo +116 mm/damon/core.c

   114	
   115	#if IS_ENABLED(CONFIG_DAMON_MEM_SAMPLING)
 > 116	int damon_target_init_kfifo(struct damon_target *t)
   117	{
   118		struct damon_mem_sampling_fifo *damon_fifo;
   119		int ret = 0;
   120		unsigned int fifo_size = sizeof(struct damon_mem_sampling_record) * DAMOS_FIFO_MAX_RECORD;
   121	
   122		damon_fifo = &t->damon_fifo;
   123	
   124		ret = kfifo_alloc(&damon_fifo->rx_kfifo, fifo_size, GFP_KERNEL);
   125		if (ret)
   126			return -ENOMEM;
   127	
   128		spin_lock_init(&damon_fifo->rx_kfifo_lock);
   129		return 0;
   130	}
   131	
 > 132	void damon_target_deinit_kfifo(struct damon_target *t)
   133	{
   134		kfifo_free(&t->damon_fifo.rx_kfifo);
   135	}
   136	#else
   137	static inline int damon_target_init_kfifo(struct damon_target *t) {return 0; }
   138	static inline void damon_target_deinit_kfifo(struct damon_target *t) { }
   139	#endif /* CONFIG_DAMON_MEM_SAMPLING */
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
