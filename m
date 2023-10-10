Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5227A2FE07
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zw98j6cQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696956585; x=1728492585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZCR1L3AJ3Z6ar760r1zgulXqDs8jmos/BvDrDUvaFaA=;
  b=Zw98j6cQPb9DOlEvb99ba85JRUJ25yplFk2wtlf0ozz88j1jQGy/oHo9
   qTTfEgjHEmkoQLGt7OTlZVYBKf0b2s03AwhFAd1LENjANqbgVjtehpolB
   LUB62Rtk/u8u6q9ZA4HspC/BSDfdjigHFCOIHNrAwl3dxqzBHWB0CeK2w
   u9HWFym1MEydbjoUfUjhYeRMlMBXdev1sx0Mi97Cx9KKnfudAP96LBh/H
   9MDFI853++kKWUauhTrfqhISew2VocMT34p9rmYXQ0/IY5zBIWIBA1sTr
   bukFWqUq5ebl5c8qEYmhBSFgULPkKPy4jQd2Ha0jk2ELjGszx4UrSfiFu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374796993"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="374796993"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 09:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747118626"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="747118626"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Oct 2023 09:48:20 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqFu5-0000m8-2w;
	Tue, 10 Oct 2023 16:48:17 +0000
Date: Wed, 11 Oct 2023 00:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 2/2] mm: swap: Swap-out small-sized THP without
 splitting
Message-ID: <202310110043.KQnTuX1q-lkp@intel.com>
References: <20231010142111.3997780-3-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010142111.3997780-3-ryan.roberts@arm.com>

Hi Ryan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc5 next-20231010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/mm-swap-Remove-CLUSTER_FLAG_HUGE-from-swap_cluster_info-flags/20231010-222442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231010142111.3997780-3-ryan.roberts%40arm.com
patch subject: [RFC PATCH v1 2/2] mm: swap: Swap-out small-sized THP without splitting
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231011/202310110043.KQnTuX1q-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110043.KQnTuX1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110043.KQnTuX1q-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:21:
>> include/linux/swap.h:323:22: error: variably modified 'large_next' at file scope
     323 |         unsigned int large_next[PMD_ORDER]; /*
         |                      ^~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/large_next +323 include/linux/swap.h

   277	
   278	/*
   279	 * The in-memory structure used to track swap areas.
   280	 */
   281	struct swap_info_struct {
   282		struct percpu_ref users;	/* indicate and keep swap device valid. */
   283		unsigned long	flags;		/* SWP_USED etc: see above */
   284		signed short	prio;		/* swap priority of this type */
   285		struct plist_node list;		/* entry in swap_active_head */
   286		signed char	type;		/* strange name for an index */
   287		unsigned int	max;		/* extent of the swap_map */
   288		unsigned char *swap_map;	/* vmalloc'ed array of usage counts */
   289		struct swap_cluster_info *cluster_info; /* cluster info. Only for SSD */
   290		struct swap_cluster_list free_clusters; /* free clusters list */
   291		unsigned int lowest_bit;	/* index of first free in swap_map */
   292		unsigned int highest_bit;	/* index of last free in swap_map */
   293		unsigned int pages;		/* total of usable pages of swap */
   294		unsigned int inuse_pages;	/* number of those currently in use */
   295		unsigned int cluster_next;	/* likely index for next allocation */
   296		unsigned int cluster_nr;	/* countdown to next cluster search */
   297		unsigned int __percpu *cluster_next_cpu; /*percpu index for next allocation */
   298		struct percpu_cluster __percpu *percpu_cluster; /* per cpu's swap location */
   299		struct rb_root swap_extent_root;/* root of the swap extent rbtree */
   300		struct block_device *bdev;	/* swap device or bdev of swap file */
   301		struct file *swap_file;		/* seldom referenced */
   302		unsigned int old_block_size;	/* seldom referenced */
   303		struct completion comp;		/* seldom referenced */
   304		spinlock_t lock;		/*
   305						 * protect map scan related fields like
   306						 * swap_map, lowest_bit, highest_bit,
   307						 * inuse_pages, cluster_next,
   308						 * cluster_nr, lowest_alloc,
   309						 * highest_alloc, free/discard cluster
   310						 * list. other fields are only changed
   311						 * at swapon/swapoff, so are protected
   312						 * by swap_lock. changing flags need
   313						 * hold this lock and swap_lock. If
   314						 * both locks need hold, hold swap_lock
   315						 * first.
   316						 */
   317		spinlock_t cont_lock;		/*
   318						 * protect swap count continuation page
   319						 * list.
   320						 */
   321		struct work_struct discard_work; /* discard worker */
   322		struct swap_cluster_list discard_clusters; /* discard clusters list */
 > 323		unsigned int large_next[PMD_ORDER]; /*
   324						     * next free offset within current
   325						     * allocation cluster for large
   326						     * folios, or UINT_MAX if no current
   327						     * cluster. Index is (order - 1).
   328						     * Only when cluster_info is used.
   329						     */
   330		struct plist_node avail_lists[]; /*
   331						   * entries in swap_avail_heads, one
   332						   * entry per node.
   333						   * Must be last as the number of the
   334						   * array is nr_node_ids, which is not
   335						   * a fixed value so have to allocate
   336						   * dynamically.
   337						   * And it has to be an array so that
   338						   * plist_for_each_* can work.
   339						   */
   340	};
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
