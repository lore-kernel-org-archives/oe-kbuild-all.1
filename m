Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B6715D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 03:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760067954; cv=none; b=dmn4zvj+tNJMt/q9SfoPcK/4pTrzA3rtgi097GSuEw507zBhdgsp76ABn7+ZGoYKzr+w3RmBYVtIWHDKwGNPW2GI2WG3+a8KhHClxONcNO5komABqQczNqzu9WdL0lIsl1oLtBKitYgbCIpHu0d76wbyBhnOtSgGTzmjBp2W638=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760067954; c=relaxed/simple;
	bh=wMFZYk/gGqHo+no3XIMi9bTsSHpvAVyL2FE2Hnvqg2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=obW1ozfcmCtLvB5zDL3vaArMxGvfMSZX1bW6M7vcn7OXBTrhlDLBPDNaqvye5bhV8mEA9/Yg0hNoso9lVm9VkXttTDqTMFISG7lKsz6joLdFWMTAQdVHAbedZiHQ1MaLuKt+6OTcA/GioFWcxPask/18NEHHWSwT2W4gOKvxqG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k61g3Krp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k61g3Krp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760067953; x=1791603953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wMFZYk/gGqHo+no3XIMi9bTsSHpvAVyL2FE2Hnvqg2M=;
  b=k61g3Krp8PDEUicfeXqcod5XZzXQ6YHtpJE1dtwlHQStxPRg4Yjrx+Ey
   VJZVIgnhDNEi+oUIAYAqqtEamR5ePHC5uyIm0OPdFnPDSQujSC2l7Del/
   Mlep9mHFv3hUz30dHLXyD9vBu8TODh8ExTeKmHLnJQeYp2OpHgizojvd6
   LV28POrVw3h0QPE/TINmgozi0G8tBWhrEo65m+z5hhwRyBeQLKBjLEizb
   bfR9Hx5rXzW8QdqoKqWRQDEOzbvcBqm2iuTT0GlgTzmYjkVKDKpUWk8fO
   48FS3aH5D8uHC54nyW8MeDvICnNCFfUS4sucpScKB8XG+6Te8JIBzES1o
   Q==;
X-CSE-ConnectionGUID: 02u5YBwWRl2qNl3u5TRLNQ==
X-CSE-MsgGUID: X+GFFc0GSs+6/LPHL8kcmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="49849098"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="49849098"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 20:45:52 -0700
X-CSE-ConnectionGUID: J7Zr50LbSYKKMUPTvzPMZA==
X-CSE-MsgGUID: AIMoa/LkSm+k+Og0A4aZYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180126656"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Oct 2025 20:45:52 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v744j-00023l-06;
	Fri, 10 Oct 2025 03:45:49 +0000
Date: Fri, 10 Oct 2025 11:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/sheaves-for-all 8/13] mm/slub.c:2579:10: error:
 'OBJCGS_CLEAR_MASK' undeclared
Message-ID: <202510101112.0MTiSV2q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/sheaves-for-all
head:   575f4b1ed517f1734ff0d2d8889a16074e297056
commit: 641201ced247f033ebf9e6899ea90b1ca89e1244 [8/13] slab: prevent recursive kmalloc() in alloc_empty_sheaf()
config: riscv-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101112.0MTiSV2q-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101112.0MTiSV2q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101112.0MTiSV2q-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'alloc_empty_sheaf':
>> mm/slub.c:2579:10: error: 'OBJCGS_CLEAR_MASK' undeclared (first use in this function)
    2579 |  gfp &= ~OBJCGS_CLEAR_MASK;
         |          ^~~~~~~~~~~~~~~~~
   mm/slub.c:2579:10: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/OBJCGS_CLEAR_MASK +2579 mm/slub.c

  2570	
  2571	static struct slab_sheaf *alloc_empty_sheaf(struct kmem_cache *s, gfp_t gfp)
  2572	{
  2573		struct slab_sheaf *sheaf;
  2574		size_t sheaf_size;
  2575	
  2576		if (gfp & __GFP_NO_OBJ_EXT)
  2577			return NULL;
  2578	
> 2579		gfp &= ~OBJCGS_CLEAR_MASK;
  2580	
  2581		/*
  2582		 * Prevent recursion to the same cache, or a deep stack of kmallocs of
  2583		 * varying sizes (sheaf capacity might differ for each kmalloc size
  2584		 * bucket)
  2585		 */
  2586		if (s->flags & SLAB_KMALLOC)
  2587			gfp |= __GFP_NO_OBJ_EXT;
  2588	
  2589		sheaf_size = struct_size(sheaf, objects, s->sheaf_capacity);
  2590		sheaf = kzalloc(sheaf_size, gfp);
  2591	
  2592		if (unlikely(!sheaf))
  2593			return NULL;
  2594	
  2595		sheaf->cache = s;
  2596	
  2597		stat(s, SHEAF_ALLOC);
  2598	
  2599		return sheaf;
  2600	}
  2601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
