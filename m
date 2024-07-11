Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E312EBC2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720681455; cv=none; b=cOMX5Rax1HwOdz7FRyIQi18/kQeg0ythWuIWNHWyvljjhBdxHEKSZ8MJ2TJG0S4KY7qHALSSxzhdx+c712siExLychyC48VcEMXhN6nhL4g2P1ZzznljYxxc6wrQWPyqq1YVFTcemb8oswDgnyQw47XG2WBfFKO1L4FkSRmYEEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720681455; c=relaxed/simple;
	bh=v+0naZUTisEFpVjmTi9c/KQYN76fCdjGYrj8FCYXBs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J98C/XjTZARbdjv8g7HOeqHJbp+/VWLEe76cbhu2h9JkSjAki58JPD3mUfuk2y0j+QX+UJNWtqbGTU6xS0snjm4JYvn1H21t82HfWve0m3OzeRdY2pLkVTcj61OnSyavWA410DtqnzGyhoc4Pkm6d+W9IkZoCst20+ZIpi2rVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C99vVOzA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C99vVOzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720681453; x=1752217453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+0naZUTisEFpVjmTi9c/KQYN76fCdjGYrj8FCYXBs8=;
  b=C99vVOzAWAEXykj3JOuubt9H+nocloezntjvgpl6EyFOqTrxH1HmvB4a
   rdbprIj7/ORWq20HjGjRpdFEohx5sToDRe6PGcVfo4wqHloMK9ojgId9/
   4ppjQ3nZoy0DWz5xdZBRsHe6lc2vzYnptXDZbFHPU3frHC3p6wMasQ7WL
   KR3L3FcR56k2NkuhQjkj11kqcvnq7yUmXU3FLB1e9jlAFT5r9pUC/kODo
   ox6U0vi4ZL87xC471aiJxuGTaX79D6bvJkt/O07A7KcYEbdXFoIJe3e8y
   +QZ7cZfPCg7/nVhgVjbBy52vLNiUp3CoGMv3AQeAWhqxnbbLMRar7G4IU
   A==;
X-CSE-ConnectionGUID: iOwAKW6/RDOLLeZ7EPnquw==
X-CSE-MsgGUID: HgSIIIu4QxSLq+HRKzgEPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18183336"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="18183336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 00:04:12 -0700
X-CSE-ConnectionGUID: 4XU8MpdeQ3G0YRyyTp3gCg==
X-CSE-MsgGUID: sKcCsLA6Tfi2CNu8IhTLrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="53642542"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jul 2024 00:04:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRnqa-000YvI-1k;
	Thu, 11 Jul 2024 07:04:08 +0000
Date: Thu, 11 Jul 2024 15:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 1/4] include/linux/page_counter.h:71:28:
 error: 'MCT_NR_WITH_GUARANTEES' undeclared here (not in a function)
Message-ID: <202407111454.rT4FiZj1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   34c52c20ddd81cc0cbd01d6f60cdf686704c59a4
commit: 705fdb35274011a225cba5d0e488c3e29e6c3120 [1/4] mm: memcg: merge multiple page_counters into a single structure
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240711/202407111454.rT4FiZj1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111454.rT4FiZj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111454.rT4FiZj1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/memcontrol.h:18,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/riscv/kernel/asm-offsets.c:13:
>> include/linux/page_counter.h:71:28: error: 'MCT_NR_WITH_GUARANTEES' undeclared here (not in a function)
      71 |         unsigned long emin[MCT_NR_WITH_GUARANTEES];
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/MCT_NR_WITH_GUARANTEES +71 include/linux/page_counter.h

    61	
    62	struct page_counter {
    63		/*
    64		 * Make sure 'usage' does not share cacheline with any other field. The
    65		 * memcg->memory.usage is a hot member of struct mem_cgroup.
    66		 */
    67		atomic_long_t usage[MCT_NR_ITEMS];
    68		CACHELINE_PADDING(_pad1_);
    69	
    70		/* effective memory.min and memory.min usage tracking */
  > 71		unsigned long emin[MCT_NR_WITH_GUARANTEES];
    72		atomic_long_t min_usage[MCT_NR_WITH_GUARANTEES];
    73		atomic_long_t children_min_usage[MCT_NR_WITH_GUARANTEES];
    74	
    75		/* effective memory.low and memory.low usage tracking */
    76		unsigned long elow[MCT_NR_WITH_GUARANTEES];
    77		atomic_long_t low_usage[MCT_NR_WITH_GUARANTEES];
    78		atomic_long_t children_low_usage[MCT_NR_WITH_GUARANTEES];
    79	
    80		unsigned long watermark[MCT_NR_ITEMS];
    81		unsigned long failcnt[MCT_NR_ITEMS];
    82	
    83		/* Keep all the read most fields in a separete cacheline. */
    84		CACHELINE_PADDING(_pad2_);
    85	
    86		unsigned long min[MCT_NR_WITH_GUARANTEES];
    87		unsigned long low[MCT_NR_WITH_GUARANTEES];
    88		unsigned long high[MCT_NR_ITEMS];
    89		unsigned long max[MCT_NR_ITEMS];
    90	
    91		struct page_counter *parent;
    92	} ____cacheline_internodealigned_in_smp;
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
