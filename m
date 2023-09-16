Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BE233DC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 05:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694842581; x=1726378581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZZr3H7PlEu57tR+7m2Ls86Yl2rxSvU0ckDCfE/PJM8Q=;
  b=h2BII5bMASspOPYxQjkwmNeKKjzI7XYhwdyrXTdwtbZ7zfigIBB40xVh
   nTvqLtJYj2BnetEvJFLYXKbozGrRYPGEwUn+Xz4FC1vuZKMK+RYsHGW/a
   66HtujzkEqcz6iA/jyxnP7QeZL5weAzCvPWVvX3ZKk54uLb/lELHI0p1c
   5cvlIGXrPQHMm+qUp4lebuhRAaAqUrXEFH+qhv4obDEKcXE3nxwFsECvU
   uhQhBKFQNPnTWvq1wEUOrlOBoAShqKV/RcsNhrMqkfWqcBeDNYpVemc9t
   GHXIxs7Z/GpaCzaAVhF+WuYsa8DNGOX1BMzhO7pphlMH++YZoUTFb0+mW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="443459955"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="443459955"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 22:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="694943983"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="694943983"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Sep 2023 22:36:19 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhNya-0003uu-2E;
	Sat, 16 Sep 2023 05:36:16 +0000
Date: Sat, 16 Sep 2023 13:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Thornber <ejt@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dm-devel@redhat.com,
	Mike Snitzer <snitzer@kernel.org>
Subject: [device-mapper-dm:for-next 3/5]
 drivers/md/persistent-data/dm-extent-allocator.c:204:57: sparse: sparse:
 incorrect type in argument 2 (different base types)
Message-ID: <202309161339.iy8ArDEF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
head:   526abb2e9c152c30d398d46e48fe8176640192c2
commit: 1c684a9c9a6efbcb28a4d00bc9b6d40a4a141921 [3/5] dm persistent data: Introduce extent allocator
config: i386-randconfig-062-20230916 (https://download.01.org/0day-ci/archive/20230916/202309161339.iy8ArDEF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161339.iy8ArDEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161339.iy8ArDEF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/persistent-data/dm-extent-allocator.c:204:57: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got int flags @@
   drivers/md/persistent-data/dm-extent-allocator.c:204:57: sparse:     expected restricted gfp_t [usertype] flags
   drivers/md/persistent-data/dm-extent-allocator.c:204:57: sparse:     got int flags
>> drivers/md/persistent-data/dm-extent-allocator.c:252:48: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int flags @@     got restricted gfp_t @@
   drivers/md/persistent-data/dm-extent-allocator.c:252:48: sparse:     expected int flags
   drivers/md/persistent-data/dm-extent-allocator.c:252:48: sparse:     got restricted gfp_t
>> drivers/md/persistent-data/dm-extent-allocator.c:532:41: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int flags @@     got restricted gfp_t [usertype] @@
   drivers/md/persistent-data/dm-extent-allocator.c:532:41: sparse:     expected int flags
   drivers/md/persistent-data/dm-extent-allocator.c:532:41: sparse:     got restricted gfp_t [usertype]

vim +204 drivers/md/persistent-data/dm-extent-allocator.c

   187	
   188	/**
   189	 * alloc_node_list - Allocates a list of nodes.
   190	 * @nr: Number of nodes to allocate.
   191	 * @flags: Flags to pass to kmalloc.
   192	 * @result: Pointer to the list head to store the allocated nodes.
   193	 *
   194	 * Used to initialise the free list of nodes.
   195	 * Returns: 0 on success, or -ENOMEM if allocation failed.
   196	 */
   197	static int alloc_node_list(unsigned nr, int flags, struct list_head *result)
   198	{
   199		int i;
   200	
   201		INIT_LIST_HEAD(result);
   202	
   203		for (i = 0; i < nr; i++) {
 > 204			struct ea_node *n = kmalloc(sizeof(*n), flags);
   205			struct list_head *l = (struct list_head *) n;
   206			if (!n) {
   207				free_node_list(result);
   208				return -ENOMEM;
   209			}
   210	
   211			list_add(l, result);
   212		}
   213	
   214		return 0;
   215	}
   216	
   217	/**
   218	 * __prealloc_nodes - Preallocates nodes for allocation contexts.
   219	 * @ea: Pointer to the extent allocator.
   220	 * @nr: Number of nodes to preallocate.
   221	 */
   222	static void __prealloc_nodes(struct dm_extent_allocator *ea, unsigned nr, int flags)
   223	{
   224		int r;
   225		struct list_head new_nodes;
   226	
   227		r = alloc_node_list(nr, flags, &new_nodes);
   228		if (!r) {
   229			struct list_head *e, *tmp;
   230			list_for_each_safe(e, tmp, &new_nodes) {
   231				list_del(e);
   232				__free_node(ea, (struct ea_node *)e);
   233			}
   234			ea->nr_preallocated_nodes += nr;
   235		}
   236	}
   237	
   238	struct dm_extent_allocator *dm_extent_allocator_create(uint64_t nr_blocks)
   239	{
   240		struct dm_extent_allocator *ea = kmalloc(sizeof(*ea), GFP_KERNEL);
   241	
   242		if (!ea)
   243			return NULL;
   244	
   245		spin_lock_init(&ea->lock);
   246		ea->nr_blocks = nr_blocks;
   247		ea->nr_preallocated_nodes = 0;
   248		ea->nr_free_nodes = 0;
   249		ea->nr_allocation_contexts = 0;
   250	
   251		INIT_LIST_HEAD(&ea->free_nodes);
 > 252		__prealloc_nodes(ea, INITIAL_NR_NODES, GFP_KERNEL);
   253		INIT_LIST_HEAD(&ea->allocation_contexts);
   254		__setup_initial_root(ea);
   255	
   256		return ea;
   257	}
   258	EXPORT_SYMBOL_GPL(dm_extent_allocator_create);
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
