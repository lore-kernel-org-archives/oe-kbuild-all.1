Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DC1184E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jun 2025 00:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748737985; cv=none; b=BwIGbELfovimHS3HSQsLxitHV5MOua3WqVFkAVGfyHQmS0uln4Lwx/a5seSyVPgNYGhu8pHKJiJ3JM1po2QfsZ39jAF3vzmtZwpCHY44G8BClrVNPCsh+dCszJ8ddo+vaRPTp2NYMdqWX2tkEq407gNT/dC1J6qNDe3yAbAhEII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748737985; c=relaxed/simple;
	bh=8holS/4+8ylv0xUqhUg/jxLy8oSl/hdgexVsXC/2qLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mtL89G8RRFeeblLm+kePml7OfGAsiuSid0M4SJpzwhm7jCMT6PgiL3g0bvFXgSloiuYXv1+uYztViNqN32QVVTjOHYNc/IO5Ylb9OQWTQNy/KVfn6TAFZ9F9qOJzv4NWsOmrmzuz/iOkL0r9VmI2p9Kryc48+O7XIIgCDDJTBgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/sJHnQI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/sJHnQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748737984; x=1780273984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8holS/4+8ylv0xUqhUg/jxLy8oSl/hdgexVsXC/2qLM=;
  b=l/sJHnQIn7R9VjONNM6ZY354bb3kgFPeHujwvInVzcRy7FkQkk/Oi/7H
   Q60qJkGc/L380Ng+o9VTW1tVkbqM/E8lyfN5nZz4hlMxoj8jNuTz/UsIV
   JmYCUUEiOGhtaPaBwkICi2wKvx1+r/NgkMc3DCoj9FiDbF7TNA3bECLTy
   MxYU07j0RJeZivgzq60NJbOmlMkJY3j5hquOWU/xPrwdMO/+dHzVPdH8+
   fVMHIKtav3hxQCdkvxVJVE75P2q8Umc1feY8bUuOqIt07giwJWx3jHfPL
   +WiHEtGBDNgsBlAOVqjK7Tu6mk/ZkMUXhNdsHMQhTpFBrBdywPRlhRwD7
   A==;
X-CSE-ConnectionGUID: wjbylYmsTWi2Hm6BOyG51g==
X-CSE-MsgGUID: YQj3tDORQHCPk3MgI9Cmww==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50797165"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="50797165"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 17:33:03 -0700
X-CSE-ConnectionGUID: 4/02CD07S4ezMCkK6tKKjg==
X-CSE-MsgGUID: bkiLbJIDSWu3h6Fd8s5SSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="149363645"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2025 17:33:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLWdH-000YiS-1G;
	Sun, 01 Jun 2025 00:32:59 +0000
Date: Sun, 1 Jun 2025 08:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-05 49/49] mm/page_alloc.c:327:15:
 sparse: sparse: symbol 'nr_free_highatomic' was not declared. Should it be
 static?
Message-ID: <202506010846.j7PjjJAs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-05
head:   7b1f522c80c811c59e056b899b26c684780442fd
commit: 7b1f522c80c811c59e056b899b26c684780442fd [49/49] ANDROID: GKI: deferred split queue corruption - ABI fixup
config: i386-randconfig-062-20250531 (https://download.01.org/0day-ci/archive/20250601/202506010846.j7PjjJAs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010846.j7PjjJAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010846.j7PjjJAs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:195:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c:1384:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1384:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1384:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c:1392:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1392:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1392:25: sparse:     got restricted fpi_t [usertype] fpi_flags
>> mm/page_alloc.c:327:15: sparse: sparse: symbol 'nr_free_highatomic' was not declared. Should it be static?
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:2782:9: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2835:33: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3137:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4887:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block

vim +/nr_free_highatomic +327 mm/page_alloc.c

7281201922a006 Lee Schermerhorn       2010-05-26  183  
4518085e127dff Kemi Wang              2017-11-15 @184  DEFINE_STATIC_KEY_TRUE(vm_numa_stat_key);
4518085e127dff Kemi Wang              2017-11-15  185  
1c8aebe4c072bf Heesub Shin            2024-02-12  186  /*
ce561872e6fe1c Suren Baghdasaryan     2025-02-28  187   * By default, restrict_cma_redirect is set to true, so only MOVABLE allocations
ce561872e6fe1c Suren Baghdasaryan     2025-02-28  188   * marked __GFP_CMA are eligible to be redirected to CMA region. These allocations
ce561872e6fe1c Suren Baghdasaryan     2025-02-28  189   * are redirected if *any* free space is available in the CMA region.
ce561872e6fe1c Suren Baghdasaryan     2025-02-28  190   * When restrict_cma_redirect is false, all movable allocations
1c8aebe4c072bf Heesub Shin            2024-02-12  191   * are eligible for redirection to CMA region (i.e movable allocations are
1c8aebe4c072bf Heesub Shin            2024-02-12  192   * not restricted from CMA region), when there is sufficient space there.
1c8aebe4c072bf Heesub Shin            2024-02-12  193   * (see __rmqueue()).
1c8aebe4c072bf Heesub Shin            2024-02-12  194   */
ce561872e6fe1c Suren Baghdasaryan     2025-02-28  195  DEFINE_STATIC_KEY_TRUE(restrict_cma_redirect);
1c8aebe4c072bf Heesub Shin            2024-02-12  196  
1c8aebe4c072bf Heesub Shin            2024-02-12  197  static int __init restrict_cma_redirect_setup(char *str)
1c8aebe4c072bf Heesub Shin            2024-02-12  198  {
1c8aebe4c072bf Heesub Shin            2024-02-12  199  #ifdef CONFIG_CMA
ce561872e6fe1c Suren Baghdasaryan     2025-02-28  200  	bool res;
ce561872e6fe1c Suren Baghdasaryan     2025-02-28  201  
ce561872e6fe1c Suren Baghdasaryan     2025-02-28  202  	if (!kstrtobool(str, &res) && !res)
ce561872e6fe1c Suren Baghdasaryan     2025-02-28  203  		static_branch_disable(&restrict_cma_redirect);
1c8aebe4c072bf Heesub Shin            2024-02-12  204  #else
1c8aebe4c072bf Heesub Shin            2024-02-12  205  	pr_warn("CONFIG_CMA not set. Ignoring restrict_cma_redirect option\n");
1c8aebe4c072bf Heesub Shin            2024-02-12  206  #endif
1c8aebe4c072bf Heesub Shin            2024-02-12  207  	return 1;
1c8aebe4c072bf Heesub Shin            2024-02-12  208  }
ce561872e6fe1c Suren Baghdasaryan     2025-02-28  209  __setup("restrict_cma_redirect=", restrict_cma_redirect_setup);
1c8aebe4c072bf Heesub Shin            2024-02-12  210  
1c8aebe4c072bf Heesub Shin            2024-02-12  211  static inline bool cma_redirect_restricted(void)
1c8aebe4c072bf Heesub Shin            2024-02-12  212  {
1c8aebe4c072bf Heesub Shin            2024-02-12  213  	return static_key_enabled(&restrict_cma_redirect);
1c8aebe4c072bf Heesub Shin            2024-02-12  214  }
1c8aebe4c072bf Heesub Shin            2024-02-12  215  
634c33ee9d167b Chris Goldsworthy      2024-02-12  216  /*
634c33ee9d167b Chris Goldsworthy      2024-02-12  217   * Return true if CMA has pcplist. We use the PCP list for CMA only if
634c33ee9d167b Chris Goldsworthy      2024-02-12  218   * this returns true. For now, rather than define a new flag, reuse the
634c33ee9d167b Chris Goldsworthy      2024-02-12  219   * restrict_cma_redirect flag itself to select this behavior.
634c33ee9d167b Chris Goldsworthy      2024-02-12  220   */
634c33ee9d167b Chris Goldsworthy      2024-02-12  221  static inline bool cma_has_pcplist(void)
634c33ee9d167b Chris Goldsworthy      2024-02-12  222  {
634c33ee9d167b Chris Goldsworthy      2024-02-12  223  	return static_key_enabled(&restrict_cma_redirect);
634c33ee9d167b Chris Goldsworthy      2024-02-12  224  }
634c33ee9d167b Chris Goldsworthy      2024-02-12  225  
7aac7898855123 Lee Schermerhorn       2010-05-26  226  #ifdef CONFIG_HAVE_MEMORYLESS_NODES
7aac7898855123 Lee Schermerhorn       2010-05-26  227  /*
7aac7898855123 Lee Schermerhorn       2010-05-26  228   * N.B., Do NOT reference the '_numa_mem_' per cpu variable directly.
7aac7898855123 Lee Schermerhorn       2010-05-26  229   * It will not be defined when CONFIG_HAVE_MEMORYLESS_NODES is not defined.
7aac7898855123 Lee Schermerhorn       2010-05-26  230   * Use the accessor functions set_numa_mem(), numa_mem_id() and cpu_to_mem()
7aac7898855123 Lee Schermerhorn       2010-05-26  231   * defined in <linux/topology.h>.
7aac7898855123 Lee Schermerhorn       2010-05-26  232   */
7aac7898855123 Lee Schermerhorn       2010-05-26  233  DEFINE_PER_CPU(int, _numa_mem_);		/* Kernel "local memory" node */
7aac7898855123 Lee Schermerhorn       2010-05-26  234  EXPORT_PER_CPU_SYMBOL(_numa_mem_);
7aac7898855123 Lee Schermerhorn       2010-05-26  235  #endif
7aac7898855123 Lee Schermerhorn       2010-05-26  236  
8b885f53b03e3b Jason Yan              2020-04-10  237  static DEFINE_MUTEX(pcpu_drain_mutex);
bd233f538d51c2 Mel Gorman             2017-02-24  238  
38addce8b600ca Emese Revfy            2016-06-20  239  #ifdef CONFIG_GCC_PLUGIN_LATENT_ENTROPY
58bea4144d235c Kees Cook              2016-10-19  240  volatile unsigned long latent_entropy __latent_entropy;
38addce8b600ca Emese Revfy            2016-06-20  241  EXPORT_SYMBOL(latent_entropy);
38addce8b600ca Emese Revfy            2016-06-20  242  #endif
38addce8b600ca Emese Revfy            2016-06-20  243  
^1da177e4c3f41 Linus Torvalds         2005-04-16  244  /*
13808910713a98 Christoph Lameter      2007-10-16  245   * Array of node states.
^1da177e4c3f41 Linus Torvalds         2005-04-16  246   */
13808910713a98 Christoph Lameter      2007-10-16  247  nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
13808910713a98 Christoph Lameter      2007-10-16  248  	[N_POSSIBLE] = NODE_MASK_ALL,
13808910713a98 Christoph Lameter      2007-10-16  249  	[N_ONLINE] = { { [0] = 1UL } },
13808910713a98 Christoph Lameter      2007-10-16  250  #ifndef CONFIG_NUMA
13808910713a98 Christoph Lameter      2007-10-16  251  	[N_NORMAL_MEMORY] = { { [0] = 1UL } },
13808910713a98 Christoph Lameter      2007-10-16  252  #ifdef CONFIG_HIGHMEM
13808910713a98 Christoph Lameter      2007-10-16  253  	[N_HIGH_MEMORY] = { { [0] = 1UL } },
20b2f52b73febc Lai Jiangshan          2012-12-12  254  #endif
20b2f52b73febc Lai Jiangshan          2012-12-12  255  	[N_MEMORY] = { { [0] = 1UL } },
13808910713a98 Christoph Lameter      2007-10-16  256  	[N_CPU] = { { [0] = 1UL } },
13808910713a98 Christoph Lameter      2007-10-16  257  #endif	/* NUMA */
13808910713a98 Christoph Lameter      2007-10-16  258  };
13808910713a98 Christoph Lameter      2007-10-16  259  EXPORT_SYMBOL(node_states);
13808910713a98 Christoph Lameter      2007-10-16  260  
dcce284a259373 Benjamin Herrenschmidt 2009-06-18  261  gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
6471384af2a653 Alexander Potapenko    2019-07-11  262  
d9c2340052278d Mel Gorman             2007-10-16  263  #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
d00181b96eb86c Kirill A. Shutemov     2015-11-06  264  unsigned int pageblock_order __read_mostly;
d9c2340052278d Mel Gorman             2007-10-16  265  #endif
d9c2340052278d Mel Gorman             2007-10-16  266  
7fef431be9c9ac David Hildenbrand      2020-10-15  267  static void __free_pages_ok(struct page *page, unsigned int order,
7fef431be9c9ac David Hildenbrand      2020-10-15  268  			    fpi_t fpi_flags);
a226f6c899799f David Howells          2006-01-06  269  
^1da177e4c3f41 Linus Torvalds         2005-04-16  270  /*
^1da177e4c3f41 Linus Torvalds         2005-04-16  271   * results with 256, 32 in the lowmem_reserve sysctl:
^1da177e4c3f41 Linus Torvalds         2005-04-16  272   *	1G machine -> (16M dma, 800M-16M normal, 1G-800M high)
^1da177e4c3f41 Linus Torvalds         2005-04-16  273   *	1G machine -> (16M dma, 784M normal, 224M high)
^1da177e4c3f41 Linus Torvalds         2005-04-16  274   *	NORMAL allocation will leave 784M/256 of ram reserved in the ZONE_DMA
^1da177e4c3f41 Linus Torvalds         2005-04-16  275   *	HIGHMEM allocation will leave 224M/32 of ram reserved in ZONE_NORMAL
84109e15ddc8fe Yaowei Bai             2015-02-12  276   *	HIGHMEM allocation will leave (224M+784M)/256 of ram reserved in ZONE_DMA
a2f1b424900715 Andi Kleen             2005-11-05  277   *
a2f1b424900715 Andi Kleen             2005-11-05  278   * TBD: should special case ZONE_DMA32 machines here - in those we normally
a2f1b424900715 Andi Kleen             2005-11-05  279   * don't need any ZONE_NORMAL reservation
^1da177e4c3f41 Linus Torvalds         2005-04-16  280   */
62069aace14565 Tom Rix                2023-05-18  281  static int sysctl_lowmem_reserve_ratio[MAX_NR_ZONES] = {
4b51d66989218a Christoph Lameter      2007-02-10  282  #ifdef CONFIG_ZONE_DMA
d3cda2337bbc9e Joonsoo Kim            2018-04-10  283  	[ZONE_DMA] = 256,
4b51d66989218a Christoph Lameter      2007-02-10  284  #endif
fb0e7942bdcbbd Christoph Lameter      2006-09-25  285  #ifdef CONFIG_ZONE_DMA32
d3cda2337bbc9e Joonsoo Kim            2018-04-10  286  	[ZONE_DMA32] = 256,
fb0e7942bdcbbd Christoph Lameter      2006-09-25  287  #endif
d3cda2337bbc9e Joonsoo Kim            2018-04-10  288  	[ZONE_NORMAL] = 32,
e53ef38d05dd59 Christoph Lameter      2006-09-25  289  #ifdef CONFIG_HIGHMEM
d3cda2337bbc9e Joonsoo Kim            2018-04-10  290  	[ZONE_HIGHMEM] = 0,
e53ef38d05dd59 Christoph Lameter      2006-09-25  291  #endif
d3cda2337bbc9e Joonsoo Kim            2018-04-10  292  	[ZONE_MOVABLE] = 0,
2f1b6248682f8b Christoph Lameter      2006-09-25  293  };
^1da177e4c3f41 Linus Torvalds         2005-04-16  294  
9420f89db2dd61 Mike Rapoport (IBM     2023-03-21  295) char * const zone_names[MAX_NR_ZONES] = {
4b51d66989218a Christoph Lameter      2007-02-10  296  #ifdef CONFIG_ZONE_DMA
2f1b6248682f8b Christoph Lameter      2006-09-25  297  	 "DMA",
4b51d66989218a Christoph Lameter      2007-02-10  298  #endif
fb0e7942bdcbbd Christoph Lameter      2006-09-25  299  #ifdef CONFIG_ZONE_DMA32
2f1b6248682f8b Christoph Lameter      2006-09-25  300  	 "DMA32",
fb0e7942bdcbbd Christoph Lameter      2006-09-25  301  #endif
2f1b6248682f8b Christoph Lameter      2006-09-25  302  	 "Normal",
e53ef38d05dd59 Christoph Lameter      2006-09-25  303  #ifdef CONFIG_HIGHMEM
2a1e274acf0b1c Mel Gorman             2007-07-17  304  	 "HighMem",
e53ef38d05dd59 Christoph Lameter      2006-09-25  305  #endif
2a1e274acf0b1c Mel Gorman             2007-07-17  306  	 "Movable",
c1ff6dcf209e4a Yu Zhao                2024-01-31  307  	 "NoSplit",
c1ff6dcf209e4a Yu Zhao                2024-01-31  308  	 "NoMerge",
033fbae988fcb6 Dan Williams           2015-08-09  309  #ifdef CONFIG_ZONE_DEVICE
033fbae988fcb6 Dan Williams           2015-08-09  310  	 "Device",
033fbae988fcb6 Dan Williams           2015-08-09  311  #endif
2f1b6248682f8b Christoph Lameter      2006-09-25  312  };
2f1b6248682f8b Christoph Lameter      2006-09-25  313  
c999fbd3dcc653 Alexey Dobriyan        2018-12-28  314  const char * const migratetype_names[MIGRATE_TYPES] = {
60f30350fd69a3 Vlastimil Babka        2016-03-15  315  	"Unmovable",
60f30350fd69a3 Vlastimil Babka        2016-03-15  316  	"Movable",
60f30350fd69a3 Vlastimil Babka        2016-03-15  317  	"Reclaimable",
60f30350fd69a3 Vlastimil Babka        2016-03-15  318  #ifdef CONFIG_CMA
60f30350fd69a3 Vlastimil Babka        2016-03-15  319  	"CMA",
60f30350fd69a3 Vlastimil Babka        2016-03-15  320  #endif
634c33ee9d167b Chris Goldsworthy      2024-02-12  321  	"HighAtomic",
60f30350fd69a3 Vlastimil Babka        2016-03-15  322  #ifdef CONFIG_MEMORY_ISOLATION
60f30350fd69a3 Vlastimil Babka        2016-03-15  323  	"Isolate",
60f30350fd69a3 Vlastimil Babka        2016-03-15  324  #endif
60f30350fd69a3 Vlastimil Babka        2016-03-15  325  };
60f30350fd69a3 Vlastimil Babka        2016-03-15  326  
d5ace9d4dd020b Kalesh Singh           2025-05-28 @327  unsigned long nr_free_highatomic[MAX_NR_ZONES] = {0};
d5ace9d4dd020b Kalesh Singh           2025-05-28  328  

:::::: The code at line 327 was first introduced by commit
:::::: d5ace9d4dd020b31be684cfd095e876fe59ae65f ANDROID: GKI: page_alloc ABI fixup

:::::: TO: Kalesh Singh <kaleshsingh@google.com>
:::::: CC: Kalesh Singh <kaleshsingh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
