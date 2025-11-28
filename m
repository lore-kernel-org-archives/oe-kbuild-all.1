Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4924C06A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764343703; cv=none; b=EmIzTbeuaBhZhpT60K3vkyy+tHJDRuBRFMBKcCuxqWgl9up6EaqrjsotOTBZIR29CLAj2zGXBD7fIC2aotZg/ATkLuvikJ7OTObiL1LZISL7ppK2F01EGpyyLebXx6M3LI4iWaO8/FdLem/lbqoy9A8soJ3vuLa5oWk2zRXk9+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764343703; c=relaxed/simple;
	bh=Imlm7nfXP92XNsjpq6qB0AFDu0Baq0iCI0YvHFSe8m4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8TdW4nHsUtxNPTBE9vqmkj5nJfT0+1COBsR6vNzjHbCtD6o4jXJPpUZgP6w2rMckAZWU7h2g8OhKyWUk5eqjn1x+jtUxrK2cFx9oApEx41X1K/fyu+wemHMror8pEEwHtp/3fm+uVR4SSDS/GClHISSUgwLKnEemAi//+oaAf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ne85P0Jx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ne85P0Jx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764343701; x=1795879701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Imlm7nfXP92XNsjpq6qB0AFDu0Baq0iCI0YvHFSe8m4=;
  b=Ne85P0JxvIpbq20lOrY0V2Eti1JROsn5NtqCFpDBgyLThJPS9iq2YCR6
   wwyQp97e/i1aWXKah/ZwynCuXcmzzSEo3AZoFHGCsCvpM+6gJMZJAdRvD
   03nUjfeLWtBorYlU1ovW2VITSVJqfz8pTIIDgwoCqATWxqgKKxNS6Rm/n
   EWPaoVKMICw7me0MVzbP+o2KnGvftoydDrRh7PzIBCBzQo5wmK7mJGtSU
   OtAIstR2skV6Q+jrzNFKA0+wy2awgLVlMxOrLmPNWEHXYo5Lctq3lhuRm
   /n6LOag1rUI54zI673Pjxu4u0MqJf6pqxjrcX9fPeFWPVVlzifqtXpYAH
   A==;
X-CSE-ConnectionGUID: yjWr7j9lQpu4p000Vu+oew==
X-CSE-MsgGUID: mB+wI9/bQCuaeApw7e+JbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66093225"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="66093225"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 07:28:21 -0800
X-CSE-ConnectionGUID: qxY50bOJSH6AADukjvuTeQ==
X-CSE-MsgGUID: R3UFS/reQX+XB+Hd/FhokA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="230771395"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2025 07:28:20 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP0OP-000000006V7-19jG;
	Fri, 28 Nov 2025 15:28:17 +0000
Date: Fri, 28 Nov 2025 23:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3355/3355] kernel/xsched/cfs.c:22:6: warning: no
 previous prototype for function 'xs_rq_add'
Message-ID: <202511282349.cceTk3rf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ae3faae9efa6dabe1e7613b5e5d3758ffaefb86a
commit: 024b851138509252da4531dc2e69b1e8df50fd3b [3355/3355] xsched: Add xsched CFS class
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251128/202511282349.cceTk3rf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511282349.cceTk3rf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511282349.cceTk3rf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/xsched/cfs.c:22:6: warning: no previous prototype for function 'xs_rq_add' [-Wmissing-prototypes]
      22 | void xs_rq_add(struct xsched_entity_cfs *xse)
         |      ^
   kernel/xsched/cfs.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      22 | void xs_rq_add(struct xsched_entity_cfs *xse)
         | ^
         | static 
>> kernel/xsched/cfs.c:45:6: warning: no previous prototype for function 'xs_rq_remove' [-Wmissing-prototypes]
      45 | void xs_rq_remove(struct xsched_entity_cfs *xse)
         |      ^
   kernel/xsched/cfs.c:45:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      45 | void xs_rq_remove(struct xsched_entity_cfs *xse)
         | ^
         | static 
>> kernel/xsched/cfs.c:159:6: warning: no previous prototype for function 'rq_init_fair' [-Wmissing-prototypes]
     159 | void rq_init_fair(struct xsched_cu *xcu)
         |      ^
   kernel/xsched/cfs.c:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     159 | void rq_init_fair(struct xsched_cu *xcu)
         | ^
         | static 
>> kernel/xsched/cfs.c:164:6: warning: no previous prototype for function 'xse_init_fair' [-Wmissing-prototypes]
     164 | void xse_init_fair(struct xsched_entity *xse)
         |      ^
   kernel/xsched/cfs.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     164 | void xse_init_fair(struct xsched_entity *xse)
         | ^
         | static 
>> kernel/xsched/cfs.c:169:6: warning: no previous prototype for function 'xse_deinit_fair' [-Wmissing-prototypes]
     169 | void xse_deinit_fair(struct xsched_entity *xse)
         |      ^
   kernel/xsched/cfs.c:169:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     169 | void xse_deinit_fair(struct xsched_entity *xse)
         | ^
         | static 
   5 warnings generated.


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
