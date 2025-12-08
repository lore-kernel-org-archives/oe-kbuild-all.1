Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C582E401
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 03:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765165675; cv=none; b=jjRywfLq4L+yFQtiWjM3XiKnjpZL3xHuBMPXLpLKGv9uxfhvWtZFS/0HjW0TtMDn2FxF+LFhtqTDoQNf744TVIx7YTF38bd97bM7g0FGiIvUSfnFm0FoP5ZYi563+ug50V1swJTCNd/th0k+JF8svPGaK2w/nXYSWDnNmBGyiV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765165675; c=relaxed/simple;
	bh=7u3KpgQ9fP9GZcXqYH4C1BAxiFmgJzYxDz3DdlJbz7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XC23DmE9GeLFGhGrH+nFjgwaq89E0sLHOiUDznNJtzZTp3i9mPpokzYrrnS6KLUbijRbacG9pdAomt189kAnB7mFoDc1bbqybRxwEWEMSNZWLDkdGf1SySa7IlvHqlcwVzlyBDJvXZ7dScI9SUcuL6u3I/rolZdd+JFY1z8dJxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4P2dTOa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4P2dTOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765165673; x=1796701673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7u3KpgQ9fP9GZcXqYH4C1BAxiFmgJzYxDz3DdlJbz7Q=;
  b=Q4P2dTOao35FA85fdSgt9xkzweO7Fm1GIusGPiEIL6oWbvrQ6JjWz6ca
   aMqDCExaOizZUhdDKT7Gdj5URNfbGUF/bCyZramMlRa4C4LGaYk+wtpb2
   IYNcIfxefsNy0bVm5vfUtGWms71c+jB71b5bsoECp3BCCcf995HbBKkvK
   P9C+0hDg4gXaecmCr8FwxR4aN2AQKBHjqQNYic2SOr3yjP2tQ6QlkHSZ4
   nWh8jZa4JSP28VDxNOkymqwwyEqwD1G6c7so+j3ZSOl5isgmd3lRm6qyw
   bL0p9Syje2wbsAbOGglbjuHbGCKmTkrFY7Sh1+ZrEx/Pr7tdFdt79kqDq
   A==;
X-CSE-ConnectionGUID: NyLUfKhgRayPTWyHN9GFuQ==
X-CSE-MsgGUID: D6meLC3IQw+oyWK4cSwVOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67153514"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="67153514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 19:47:53 -0800
X-CSE-ConnectionGUID: sNJ+JuKZTHmBzITZKbkqdw==
X-CSE-MsgGUID: UU8lOzHwQtempjbF9Zyfew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200958597"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Dec 2025 19:47:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSSE0-00000000Jv7-36h9;
	Mon, 08 Dec 2025 03:47:48 +0000
Date: Mon, 8 Dec 2025 11:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482] kernel/xsched/cfs.c:22:6: sparse:
 sparse: symbol 'xs_rq_add' was not declared. Should it be static?
Message-ID: <202512081156.izr1Nkua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 024b851138509252da4531dc2e69b1e8df50fd3b [3482/3482] xsched: Add xsched CFS class
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251208/202512081156.izr1Nkua-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081156.izr1Nkua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081156.izr1Nkua-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/xsched/cfs.c:22:6: sparse: sparse: symbol 'xs_rq_add' was not declared. Should it be static?
>> kernel/xsched/cfs.c:45:6: sparse: sparse: symbol 'xs_rq_remove' was not declared. Should it be static?
>> kernel/xsched/cfs.c:159:6: sparse: sparse: symbol 'rq_init_fair' was not declared. Should it be static?
>> kernel/xsched/cfs.c:164:6: sparse: sparse: symbol 'xse_init_fair' was not declared. Should it be static?
>> kernel/xsched/cfs.c:169:6: sparse: sparse: symbol 'xse_deinit_fair' was not declared. Should it be static?

vim +/xs_rq_add +22 kernel/xsched/cfs.c

    18	
    19	#define CFS_INNER_RQ_EMPTY(cfs_xse)                                            \
    20		((cfs_xse)->xruntime == XSCHED_TIME_INF)
    21	
  > 22	void xs_rq_add(struct xsched_entity_cfs *xse)
    23	{
    24		struct xsched_rq_cfs *cfs_rq = xse->cfs_rq;
    25		struct rb_node **link = &cfs_rq->ctx_timeline.rb_root.rb_node;
    26		struct rb_node *parent = NULL;
    27		struct xsched_entity_cfs *entry;
    28		bool leftmost = true;
    29	
    30		while (*link) {
    31			parent = *link;
    32			entry = rb_entry(parent, struct xsched_entity_cfs, run_node);
    33			if (xse->xruntime <= entry->xruntime) {
    34				link = &parent->rb_left;
    35			} else {
    36				link = &parent->rb_right;
    37				leftmost = false;
    38			}
    39		}
    40	
    41		rb_link_node(&xse->run_node, parent, link);
    42		rb_insert_color_cached(&xse->run_node, &cfs_rq->ctx_timeline, leftmost);
    43	}
    44	
  > 45	void xs_rq_remove(struct xsched_entity_cfs *xse)
    46	{
    47		struct xsched_rq_cfs *cfs_rq = xse->cfs_rq;
    48	
    49		rb_erase_cached(&xse->run_node, &cfs_rq->ctx_timeline);
    50	}
    51	
    52	/**
    53	 * xs_cfs_rq_update() - Update entity's runqueue position with new xruntime
    54	 */
    55	static void xs_cfs_rq_update(struct xsched_entity_cfs *xse_cfs, u64 new_xrt)
    56	{
    57		xs_rq_remove(xse_cfs);
    58		xse_cfs->xruntime = new_xrt;
    59		xs_rq_add(xse_cfs);
    60	}
    61	
    62	static inline struct xsched_entity_cfs *
    63	xs_pick_first(struct xsched_rq_cfs *cfs_rq)
    64	{
    65		struct xsched_entity_cfs *xse_cfs;
    66		struct rb_node *left = rb_first_cached(&cfs_rq->ctx_timeline);
    67	
    68		if (!left)
    69			return NULL;
    70	
    71		xse_cfs = rb_entry(left, struct xsched_entity_cfs, run_node);
    72		return xse_cfs;
    73	}
    74	
    75	/**
    76	 * xs_update() - Account xruntime and runtime metrics.
    77	 * @xse_cfs: Point to CFS scheduling entity.
    78	 * @delta: Execution time in last period
    79	 */
    80	static void xs_update(struct xsched_entity_cfs *xse_cfs, u64 delta)
    81	{
    82		u64 new_xrt = xse_cfs->xruntime + delta * xse_cfs->weight;
    83	
    84		xs_cfs_rq_update(xse_cfs, new_xrt);
    85		xse_cfs->sum_exec_runtime += delta;
    86	}
    87	
    88	/*
    89	 * Xsched Fair class methods
    90	 * For rq manipulation we rely on root runqueue lock already acquired in core.
    91	 * Access xsched_group_xcu_priv requires no locks because one thread per XCU.
    92	 */
    93	static void dequeue_ctx_fair(struct xsched_entity *xse)
    94	{
    95		struct xsched_cu *xcu = xse->xcu;
    96		struct xsched_entity_cfs *first;
    97		struct xsched_entity_cfs *xse_cfs = &xse->cfs;
    98	
    99		xs_rq_remove(xse_cfs);
   100	
   101		first = xs_pick_first(&xcu->xrq.cfs);
   102		xcu->xrq.cfs.min_xruntime = (first) ? first->xruntime : XSCHED_TIME_INF;
   103	}
   104	
   105	/**
   106	 * enqueue_ctx_fair() - Add context to the runqueue
   107	 * @xse: xsched entity of context
   108	 * @xcu: executor
   109	 *
   110	 * In contrary to enqueue_task it is called once on context init.
   111	 * Although groups reside in tree, their nodes not counted in nr_running.
   112	 * The xruntime of a group xsched entitry represented by min xruntime inside.
   113	 */
   114	static void enqueue_ctx_fair(struct xsched_entity *xse, struct xsched_cu *xcu)
   115	{
   116		struct xsched_entity_cfs *first;
   117		struct xsched_rq_cfs *rq;
   118		struct xsched_entity_cfs *xse_cfs = &xse->cfs;
   119	
   120		rq = xse_cfs->cfs_rq = &xcu->xrq.cfs;
   121	
   122		/* If no XSE of only empty groups */
   123		if (xs_pick_first(rq) == NULL || rq->min_xruntime == XSCHED_TIME_INF)
   124			rq->min_xruntime = xse_cfs->xruntime;
   125		else
   126			xse_cfs->xruntime = max(xse_cfs->xruntime, rq->min_xruntime);
   127	
   128		xs_rq_add(xse_cfs);
   129	
   130		first = xs_pick_first(&xcu->xrq.cfs);
   131		xcu->xrq.cfs.min_xruntime = (first) ? first->xruntime : XSCHED_TIME_INF;
   132	}
   133	
   134	static struct xsched_entity *pick_next_ctx_fair(struct xsched_cu *xcu)
   135	{
   136		struct xsched_entity_cfs *xse;
   137		struct xsched_rq_cfs *rq = &xcu->xrq.cfs;
   138	
   139		xse = xs_pick_first(rq);
   140		if (!xse)
   141			return NULL;
   142	
   143		return container_of(xse, struct xsched_entity, cfs);
   144	}
   145	
   146	static inline bool
   147	xs_should_preempt_fair(struct xsched_entity *xse)
   148	{
   149		return (atomic_read(&xse->submitted_one_kick) >= XSCHED_CFS_KICK_SLICE);
   150	}
   151	
   152	static void put_prev_ctx_fair(struct xsched_entity *xse)
   153	{
   154		struct xsched_entity_cfs *prev = &xse->cfs;
   155	
   156		xs_update(prev, xse->last_exec_runtime);
   157	}
   158	
 > 159	void rq_init_fair(struct xsched_cu *xcu)
   160	{
   161		xcu->xrq.cfs.ctx_timeline = RB_ROOT_CACHED;
   162	}
   163	
 > 164	void xse_init_fair(struct xsched_entity *xse)
   165	{
   166		xse->cfs.weight = XSCHED_CFS_WEIGHT_DFLT;
   167	}
   168	
 > 169	void xse_deinit_fair(struct xsched_entity *xse)
   170	{
   171		/* TODO Cgroup exit */
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
