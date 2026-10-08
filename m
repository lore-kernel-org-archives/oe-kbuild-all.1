Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB87B43CEDD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458789; cv=none; b=VbOurdBoY5uRAi17zEImRxVSNEcpNQ4aM5HTiLfLpfIoI5MrOqr55TVGy5LM3PPIr2VblFw8vXxtklb3OmNbrMI0Z0AJof+KHnsFrTKs8AmHi60Eq8r7YkuOkKOHxEo0GNCUEbVv9A09OCj5yChbdwNQzd+331M16XFsZJUcxrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458789; c=relaxed/simple;
	bh=cryzwMYaLODHXU77yoqHiDKAq4YlX8V7HOzFNj41P58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udtSSXVoy59KNkcFm4g22Pos6tI+2hj9eJkttyZEmLo10zjoLZL3O0/N0gH1+Lpdc2tR+DPZ+bsyHp4tckV7QR7i/RU5d//W0aiTAWtOeG9d6vZ9+ZBgBSqbUkRdiAjGGar3q68tCBGxFQpeOgRsKRi5DnaHFYv4IrgAgTl7K78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/A1uCRL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/A1uCRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791458788; x=1822994788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cryzwMYaLODHXU77yoqHiDKAq4YlX8V7HOzFNj41P58=;
  b=R/A1uCRLzjlv3/WgJ4paL43lpTXWlgcDU3zetkrmTpQyyjHJT8ZoUj+s
   A205spoLYOgzzObxgrSR0ZaAmNkSo8vXevDSTi9u2hVHYehUWw4gZtCmk
   lLFVkqoDFkS+LPCEwRB/AvJVo4GTOJlGG0TvUGqtWGgpZuLMkJKpnhKcy
   6iXKjEETv1PAQ5l8fgZ/CEAZMu1ReG/ASHESHjo7omlppOLqTe0t9Rirg
   ltt72jMKHsuEmxnqCq/2Jlvc4mHit449WqMvuBDAuEp3/HSPrrUozcWt3
   6kS1Lm5stmMoNXb1/XapRVmM58wkZaiIhk/34GnAGu55xen0IE6jGxvzc
   Q==;
X-CSE-ConnectionGUID: VCFq/BN3T9WEI+U9KpH4tA==
X-CSE-MsgGUID: 82en+VHkR7muQvO8MoqUug==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="137159"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="137159"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:26:03 -0700
X-CSE-ConnectionGUID: luzuQvZxSbuR9zV+BjtbmQ==
X-CSE-MsgGUID: ajwoo8F7RVi+P9AaMl9yEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="124819"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2026 04:26:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEmG7-000000004Jo-1fua;
	Thu, 08 Oct 2026 11:25:59 +0000
Date: Thu, 8 Oct 2026 19:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: Luigi Rizzo <lrizzo@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC: DMA_PMD 09/22] iommu/dma: Add DMA_PMD arena allocator
Message-ID: <202610081920.PAsvlocm-lkp@intel.com>
References: <20261003212241.3432303-10-lrizzo@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003212241.3432303-10-lrizzo@google.com>

Hi Luigi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tnguy-next-queue/dev-queue tnguy-net-queue/dev-queue linus/master v7.3-rc6 next-20261006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luigi-Rizzo/iommu-dma-introduce-CONFIG_DMA_PMD-and-metadata-table/20261003-212220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261003212241.3432303-10-lrizzo%40google.com
patch subject: [RFC: DMA_PMD 09/22] iommu/dma: Add DMA_PMD arena allocator
config: x86_64-randconfig-1007-20261008 (https://download.01.org/0day-ci/archive/20261008/202610081920.PAsvlocm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081920.PAsvlocm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081920.PAsvlocm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/dma-pmd-kunit.c: In function 'test_arena_alloc_and_free':
   drivers/iommu/dma-pmd-kunit.c:171:32: error: 'struct device' has no member named 'numa_node'
     171 |         struct device dev = { .numa_node = NUMA_NO_NODE };
         |                                ^~~~~~~~~
   In file included from include/linux/nodemask.h:93,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:100,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/kref.h:16,
                    from include/kunit/test.h:22,
                    from drivers/iommu/dma-pmd-kunit.c:5:
   include/linux/nodemask_types.h:15:25: error: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      15 | #define NUMA_NO_NODE    (-1)
         |                         ^
   drivers/iommu/dma-pmd-kunit.c:171:44: note: in expansion of macro 'NUMA_NO_NODE'
     171 |         struct device dev = { .numa_node = NUMA_NO_NODE };
         |                                            ^~~~~~~~~~~~
   include/linux/nodemask_types.h:15:25: note: (near initialization for 'dev.kobj.name')
      15 | #define NUMA_NO_NODE    (-1)
         |                         ^
   drivers/iommu/dma-pmd-kunit.c:171:44: note: in expansion of macro 'NUMA_NO_NODE'
     171 |         struct device dev = { .numa_node = NUMA_NO_NODE };
         |                                            ^~~~~~~~~~~~
>> drivers/iommu/dma-pmd-kunit.c:171:29: warning: missing braces around initializer [-Wmissing-braces]
     171 |         struct device dev = { .numa_node = NUMA_NO_NODE };
         |                             ^


vim +171 drivers/iommu/dma-pmd-kunit.c

   168	
   169	static void test_arena_alloc_and_free(struct kunit *test)
   170	{
 > 171		struct device dev = { .numa_node = NUMA_NO_NODE };
   172		void *v1, *v2, *v3, *vl1;
   173		dma_addr_t d1, d2, d3, dl1;
   174	
   175		KUNIT_EXPECT_NULL(test,
   176				  dma_pmd_arena_alloc(NULL, SZ_4K, &d1, NUMA_NO_NODE));
   177	
   178		v1 = dma_pmd_arena_alloc(&dev, SZ_64K, &d1, NUMA_NO_NODE);
   179		KUNIT_ASSERT_NOT_NULL(test, v1);
   180		v2 = dma_pmd_arena_alloc(&dev, SZ_64K, &d2, NUMA_NO_NODE);
   181		KUNIT_ASSERT_NOT_NULL(test, v2);
   182		KUNIT_EXPECT_PTR_EQ(test, v2, v1 + SZ_64K);
   183		KUNIT_EXPECT_EQ(test, d2, d1 + SZ_64K);
   184	
   185		/* Freeing v1 unreserves [0, 64K); next 64K alloc reuses it. */
   186		KUNIT_EXPECT_TRUE(test, dma_pmd_arena_free(&dev, SZ_64K, v1, d1));
   187		v3 = dma_pmd_arena_alloc(&dev, SZ_64K, &d3, NUMA_NO_NODE);
   188		KUNIT_EXPECT_PTR_EQ(test, v3, v1);
   189		KUNIT_EXPECT_EQ(test, d3, d1);
   190	
   191		/*
   192		 * Allocate 3MB (spans 2 contiguous fully_empty slots in ARENA_REGION);
   193		 * the trailing 1MB in the second slot is marked partial_empty and can
   194		 * satisfy a <= 1MB allocation before both are freed.
   195		 */
   196		vl1 = dma_pmd_arena_alloc(&dev, SZ_2M + SZ_1M, &dl1, NUMA_NO_NODE);
   197		KUNIT_ASSERT_NOT_NULL(test, vl1);
   198		KUNIT_EXPECT_TRUE(test, dma_pmd_arena_free(&dev, SZ_2M + SZ_1M, vl1, dl1));
   199		KUNIT_EXPECT_TRUE(test, dma_pmd_arena_free(&dev, SZ_64K, v2, d2));
   200		KUNIT_EXPECT_TRUE(test, dma_pmd_arena_free(&dev, SZ_64K, v3, d3));
   201	}
   202	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
