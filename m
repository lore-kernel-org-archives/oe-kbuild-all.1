Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E800E25A620
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737892470; cv=none; b=AIFMitWQ9imdgUWDaAUFu5J0q4cJiUeL6S9lm5Rodz4CAaNwBOifmyj6t+oZW4ZkZdfOHaAofNJqMAdpLeobg/f18ZLumBqxlmRcB1WqxQUusHLENMvjfcpR0J+cg7pheGRYbjHCtvOsFeytl3/QxH/MwmVgwuJcRJte6myzAws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737892470; c=relaxed/simple;
	bh=S2l6Cs1lklJgGxq4gYorM9AVIYV0dHPcEF+S1rAeKwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qvp55vusIDUd0IdA6jhcPLNUnvaAwJbeqz74r6P4lG9HSLDgvL3bClTOWIQNXeniIq+ICINl9q8X6AJ4ZIGnBE4vXPDPR2WoVCdJaDzJk1Jsx6a29i3WSqv+k27MBkqMQKkOFbd6qRsDqTGgw63g7MPYp/RhuLtyi6p7nostJyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3cxFir3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3cxFir3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737892468; x=1769428468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S2l6Cs1lklJgGxq4gYorM9AVIYV0dHPcEF+S1rAeKwY=;
  b=B3cxFir33xhcfQVozeMVIw9xy4xAnq7qtOkop5rumIhad0HOFSXxllYo
   1QVOb/mXKJyXPJGtXGsDA6Ux/Pw1DRFGhNWc8iNwwE63jMLitU/NEQ0x2
   JEQyhudk/VTccJctaIyBCbAcQ6fh+PCvvI5HX1Kd5J+vn2ELxsPp4C7Gf
   DTPD/pLyhuU3jP6k7HCPdLw5XHaZiNrKJbS54r19Ffqoy6XLdP6q0f9SK
   97rtYjDf3V6FKFB3QDi8nfz0HZOyaz7qzW1eSnwWwR1/qWat0ytoikjdP
   GCUW/F63sbzkzNI2cCeV0ESREVuZABATRJJZt2kOHrgCRBLXDSf6f7jIg
   w==;
X-CSE-ConnectionGUID: 1DI0g3WxT6u8MYujMcjGPg==
X-CSE-MsgGUID: FsBnFU+pSsaUHYKBuJxkFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38071871"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="38071871"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 03:54:27 -0800
X-CSE-ConnectionGUID: 0Q+KOHJiRPyzs0l0TFxNXQ==
X-CSE-MsgGUID: P5yQPFqFTIeagiYI3mileQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113125914"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Jan 2025 03:54:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc1Dc-000fJz-1Y;
	Sun, 26 Jan 2025 11:54:24 +0000
Date: Sun, 26 Jan 2025 19:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 0/1] mm/page_alloc.c:2741:29: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202501261915.soYts120-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   49530c73f82d0377a960e70d167621ca922d4d59
commit: b9d3d8f1e991052edb89b0537b8f2e8b2aa941ac [0/1] ANDROID: GKI: cma: redirect page allocation to CMA
config: i386-randconfig-061-20250126 (https://download.01.org/0day-ci/archive/20250126/202501261915.soYts120-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261915.soYts120-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501261915.soYts120-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:106:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
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
