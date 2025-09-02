Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A2F32F76C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 00:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756773244; cv=none; b=h3TokgFJt8xny5X6b2+T5HSoalOgWWwMEYxKd1p3hoyoP4VV3MjwmQ0uGwH/mZ2i98v6fQMWjOBeHClE1QJ90Nss0dEd9kmKiv+0HZBrzvuj0f6rp44IlpfOtdpIJEaG9fMZsSiuOuMmpElJR0O9ijP5VX0g1WZiESbzksqLPAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756773244; c=relaxed/simple;
	bh=WpoprjfT13W13fuuAK5xaOcmPJ/u5a4zyEl1AlylbPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VA9+rXoBFQ88Loq3RFTc6RMjYXIvMnrBdcXeMhRrpyEKQQuchCvXHADgUstKu7/Qwp0dUydcp4fOQ5nUBi7Zq5/Esa6Gfljf68Ix9szTPvpnww+V4cPa9HTlXKqvTYhpnd60gTnfb27DENrmeHLSZLjOlTV2iKu6R+u0PZQNiYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tt+1EEfU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tt+1EEfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756773240; x=1788309240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WpoprjfT13W13fuuAK5xaOcmPJ/u5a4zyEl1AlylbPs=;
  b=Tt+1EEfU0tJ0EeVs04zAAE5cyw5gzGAWp0tey8mOfReemeJ9amwMEDve
   LldWFzhebMnm9FzS0X084gPj3gnik31IOcPPJcyvmnQ3SvcHPrYjBJeyR
   IVLEmRGQnsZG0foQUiXTN5Uw2nzAgqgXphtOy5f0QFa9S/rxXXHr9WsoI
   Ag6tXopeBcLo+IHRCwrZ65GdTvtwGwDoNlkfaty0Fu5g76G0/FOUh1lyV
   Z7NnN/no6agwa1rS9ncuSTsymq6FZ/3sND5LGextXGBvBiV0PoSS8NpLD
   0z6hAp9ADhzcSg1NJsyMbsmdzlJLSkRgdSPlmm2yjZ/t36WCoC/zmYI8f
   w==;
X-CSE-ConnectionGUID: RSHypZI7T5aY87y/UloJMw==
X-CSE-MsgGUID: ZCknnCbXQi6KEurn1BMxXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62861216"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62861216"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 17:34:00 -0700
X-CSE-ConnectionGUID: DzfD9yXtSO+YLCSTabLUvg==
X-CSE-MsgGUID: RqYadIhhRw6Jjb31rCR5mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202048347"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2025 17:33:59 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utEwZ-0001Et-1z;
	Tue, 02 Sep 2025 00:32:25 +0000
Date: Tue, 2 Sep 2025 08:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2833/2833] mm/damon/core.c:116:5: warning: no
 previous prototype for function 'damon_target_init_kfifo'
Message-ID: <202509020837.kUUC5gs7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   79889009eb342a5b0ea9448c7b77e8ed8550a74b
commit: 2e9ef6c3ea086c85d489898471e527aeb3f7460b [2833/2833] mm/damon/vaddr: Support hardware-assisted memory access sampling
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250902/202509020837.kUUC5gs7-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020837.kUUC5gs7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020837.kUUC5gs7-lkp@intel.com/

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
