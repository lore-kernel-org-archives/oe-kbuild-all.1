Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF26F49649
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 04:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726288243; cv=none; b=ETVatxoVg5w1umCTQmhyU95A9LkknsJOU2W9ob06oPEjJpGm88zHzFBABeAdiMZNx5M375Z9QdcEbbn4TtYUZNliBRDqj988adnc8Wdw08seaeiRMV8RkaMHJ89yV2ZrDM6Ec9Q7qHlgudVRuZAkxL3LpXgMETjxnOwZhuMv0Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726288243; c=relaxed/simple;
	bh=GnAN52wmkIqgrDF2rspivXfu8pSzIBm58Pb552rdql4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q/5z3rgeIjEhyz1WNwrIvFforn2IFYutaVKL/XcpTYrKSy1JvvkfPDqDxiKEuoopFQfyrALMdiqQdCMzgOnZGGabRtdN3Oa9M3wP5VrgxPRtfrpnLak/LoPd1mQ9i6X0wcKmq1frAaR5hoC8OrqEO1zs6S3m6RRzpRGTXVWe5q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9FwmQVp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9FwmQVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726288242; x=1757824242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GnAN52wmkIqgrDF2rspivXfu8pSzIBm58Pb552rdql4=;
  b=I9FwmQVpvwHUgPD3y9FDE+Ap8cnwRtoho2IJcsKjIU+KrpopFhHxkuZk
   0flp6EfFgH+g8SWVJsXDQoalaQSEFwHBIajabQ9AZJbzLwyFdEeX3mHfn
   KM9P2UsRtHHoKb/UW7WnrotaaqnvbqP0qETkl5O81Wr9GHihJB4ydFDV8
   qN8jA4ITKDsCV8uD852TDn8vkG3nddVDkfPZzcB759YTTKkTBnVl8mKB/
   7XgdmCkoPKMBXp30ya1Xn0REUDPWGshu0Jdj0YlldWZqoJsrA4iSZRxwl
   DCQjmrtUGy73b+8dz0pm69y2EslkAghd3bYSp89m43NLlJcHDr8wUoGt8
   Q==;
X-CSE-ConnectionGUID: Uq80tW3cQoib/opYAT0sSQ==
X-CSE-MsgGUID: 9hrip6BlRS6nf6/+0nWcbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25322983"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25322983"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 21:30:40 -0700
X-CSE-ConnectionGUID: NFhN9F+CQPWO+YAgJs4PHw==
X-CSE-MsgGUID: e8iqQRzQTtGEfvVr/2bb0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="99156544"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Sep 2024 21:30:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spKQf-0007Me-0w;
	Sat, 14 Sep 2024 04:30:37 +0000
Date: Sat, 14 Sep 2024 12:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 4373/30000] mm/page_alloc.c:2741:29:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202409141216.o6yOmq6o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d62984adb112e9b02a3e754e0b5b3295d7501600
commit: b9d3d8f1e991052edb89b0537b8f2e8b2aa941ac [4373/30000] ANDROID: GKI: cma: redirect page allocation to CMA
config: x86_64-randconfig-121-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141216.o6yOmq6o-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141216.o6yOmq6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141216.o6yOmq6o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:106:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c:107:1: sparse: sparse: symbol '__pcpu_scope_pcpu_drain' was not declared. Should it be static?
>> mm/page_alloc.c:2741:29: sparse: sparse: Using plain integer as NULL pointer
   mm/page_alloc.c:3252:51: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected int cma @@     got restricted gfp_t @@
   mm/page_alloc.c:3252:51: sparse:     expected int cma
   mm/page_alloc.c:3252:51: sparse:     got restricted gfp_t
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:325:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:325:27: sparse: sparse: restricted gfp_t degrades to integer

vim +2741 mm/page_alloc.c

  2736	
  2737	static struct page *__rmqueue_cma(struct zone *zone, unsigned int order,
  2738						int migratetype,
  2739						unsigned int alloc_flags)
  2740	{
> 2741		struct page *page = 0;
  2742	
  2743	retry:
  2744	#ifdef CONFIG_CMA
  2745		if (migratetype == MIGRATE_MOVABLE && !zone->cma_alloc)
  2746			page = __rmqueue_cma_fallback(zone, order);
  2747		else
  2748	#endif
  2749			page = __rmqueue_smallest(zone, order, migratetype);
  2750	
  2751		if (unlikely(!page) && __rmqueue_fallback(zone, order, migratetype,
  2752							  alloc_flags))
  2753			goto retry;
  2754	
  2755		trace_mm_page_alloc_zone_locked(page, order, migratetype);
  2756		return page;
  2757	}
  2758	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
