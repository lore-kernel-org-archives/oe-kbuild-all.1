Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0517345CC0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 23:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791218; cv=none; b=mt+AdOpAWVmRpJ351TUh4i0cEn6jdjlVPN76gX5RkZlkoLiXfWF13jIPWsj3QNx7EFzTE8GpnbAnok7Q/dF9OVPYMaebPUPjdD2DiLH7vzKDuMGubgU/S2WukreJO1XGV7hlRoSZMwRVtQ2um/pPesTlyN/P8uONhB4NMAhJ+W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791218; c=relaxed/simple;
	bh=q/nkSMbLjr9unDc1UgUFaSb3IkiB4iY04e/hfsMmMEQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J6YXOpnEaXybNdxYOnaHSAPCuzvMygAYEsBWlD3V1oey9aCEd+7PCu2XXFRonuxbzH7c9rRwRdEYkZRq3aaE0huFLzCWgaudo0XNPXEn+hhDzn5OL0xyl3NRXuMmqAWy3mp4PoGCZI8BvE/NDZhV2hOq9fVo6MhKPrBWCpeIMFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d46bW03z; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d46bW03z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773791216; x=1805327216;
  h=date:from:to:cc:subject:message-id;
  bh=q/nkSMbLjr9unDc1UgUFaSb3IkiB4iY04e/hfsMmMEQ=;
  b=d46bW03zg7GjtvJ+o6j82vxVpqpy+IvaaL9gNBZcwTsRSYsUnJrip23w
   RhdmWavCFXy67JNjBmG9VEiyxc8xGFq/zNVSUBA2vSqJ0QJjsYsgGbGqR
   bDx2iQKY3I2YDCJxSYiZZGRYmu+DX0pfBLL0a9jVW8stct3silPjMzOPA
   B4fKUwD7gqLSCyvdSufLRLCDwrfQOtvLrOaW2mC3ScwhW+dO+5DR3Fda7
   dETbgmHc1CE6jOxyD3SLyHr0D34OvG0YLwPsY2Rd4U8NfVm+N8GYZbJlu
   9kKud1is6qOM5y3kcDauXijt61GwUfXn8QUAIN2jxytVOOFAp8iLoi3pp
   Q==;
X-CSE-ConnectionGUID: ghR1xSxqSHydGINJX0xILQ==
X-CSE-MsgGUID: z5DrXDNnQSeHkT94U9rc3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="73857994"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="73857994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 16:46:55 -0700
X-CSE-ConnectionGUID: WKcel/76RLCOgCX1FrDI9w==
X-CSE-MsgGUID: oKp71fguQsm2PXOk1SX30w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="227103863"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 16:46:54 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2e7f-000000002BL-0MNV;
	Tue, 17 Mar 2026 23:46:51 +0000
Date: Wed, 18 Mar 2026 07:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Clapinski <mclapinski@google.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new /419] mm/page_alloc.c:557:31: error:
 'MIGRATE_CMA' undeclared; did you mean 'MIGRATE_SYNC'?
Message-ID: <202603180720.1BYScGIj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   c31e58126afa2665dc5b7f78c60e5fb25218d7e5
commit: 1e1dab36a7f3e06700a97696f62e7691ce4ea85a [/419] kho: fix deferred init of kho scratch
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260318/202603180720.1BYScGIj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180720.1BYScGIj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180720.1BYScGIj-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'init_pageblock_migratetype':
>> mm/page_alloc.c:557:31: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
     557 |                 migratetype = MIGRATE_CMA;
         |                               ^~~~~~~~~~~
         |                               MIGRATE_SYNC
   mm/page_alloc.c:557:31: note: each undeclared identifier is reported only once for each function it appears in


vim +557 mm/page_alloc.c

   542	
   543	void __meminit init_pageblock_migratetype(struct page *page,
   544						  enum migratetype migratetype,
   545						  bool isolate)
   546	{
   547		unsigned long flags;
   548	
   549		if (unlikely(page_group_by_mobility_disabled &&
   550			     migratetype < MIGRATE_PCPTYPES))
   551			migratetype = MIGRATE_UNMOVABLE;
   552	
   553		/*
   554		 * Mark KHO scratch as CMA so no unmovable allocations are made there.
   555		 */
   556		if (unlikely(kho_scratch_overlap(page_to_phys(page), PAGE_SIZE)))
 > 557			migratetype = MIGRATE_CMA;
   558	
   559		flags = migratetype;
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
