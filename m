Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDF5221DB6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078172; cv=none; b=AJF+WcvnsoXqi8NM8V8IkvHK0Aj9QU4ufnddNw6GeT35TSShTnvOQpW4/1CNZ1Oy8OH2fEKqH4KESGjFSu+PKH/3a2l1ysD6rjPTqHYWIjQdQuljm8sdcWaF8pxgHYVZqwjIoivfU4Gf0qKvWPnc4MaXoDkxWLHPWBxZagVyk0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078172; c=relaxed/simple;
	bh=mB1cPaF0ZZf+III8v7Q6qHKDQq79PcT2x0J1NrKrDdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVHzeRyiMg6mnsotf0tt+M7ZU9gItkKmQvPy3NXDC955GITiEMqMFTvnnb0ih/AgSHLvwXYDcrc2keuJ1ztn/X7kN6Cf0KMXHcqWsVoT76dyr6r3qZAOhxKPMCGo2+2AgDoDgRg0LuNRqCgxoE8/avMSE0COgPYfjxbu6ylKmDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIljueMY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIljueMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764078168; x=1795614168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mB1cPaF0ZZf+III8v7Q6qHKDQq79PcT2x0J1NrKrDdo=;
  b=YIljueMYxdOXm2y8KUsQU2zm69lAv0wPKQ4AqHPffLpHHw1ghipFAi7u
   HEqM4LU+74QcYIZirxclkf2uY4s5SnlL1rnny3ZU4MVhlW6CkLqBeT20M
   rIURDpkgagTngfG4SEJhij/0SPK8OhA5ZhyIxbnegmJEnY2DbO7CLvOXK
   O7zgg2zt/eGnRZhOP5g7cPFRjYEFDPKsrXZ5pUUf49qTdFk8XffCPxkOy
   ZKnjM+NkkOThPN1xC5eBiSvX0kUGYfe5kfYkZb+MfDpD6VMr3VWJ9pOXn
   bZnvO3zfKOnpBVLa/I0vFiDW/SqoV0OhHoWqC34lvfZbDuT4sBAXJNM3o
   A==;
X-CSE-ConnectionGUID: kXitwpUXSfu88G4CyB5zPg==
X-CSE-MsgGUID: OkJrb4A+SkqX/FUZhu9GJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="88746595"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="88746595"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:42:46 -0800
X-CSE-ConnectionGUID: 2NDGiZn5Rfafa73GzsaRLA==
X-CSE-MsgGUID: gSCzMCYRTP67fH2PXFR4gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="223318850"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2025 05:42:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNtJc-000000001pV-1ZI8;
	Tue, 25 Nov 2025 13:42:44 +0000
Date: Tue, 25 Nov 2025 21:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3316/3316] kernel/xsched/cfs.c:22:6: warning: no
 previous prototype for 'xs_rq_add'
Message-ID: <202511252147.paqMgpCw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0fa9557473e665984ed5e97515969035324b2ec5
commit: 024b851138509252da4531dc2e69b1e8df50fd3b [3316/3316] xsched: Add xsched CFS class
config: x86_64-buildonly-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511252147.paqMgpCw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511252147.paqMgpCw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511252147.paqMgpCw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/xsched/cfs.c:22:6: warning: no previous prototype for 'xs_rq_add' [-Wmissing-prototypes]
      22 | void xs_rq_add(struct xsched_entity_cfs *xse)
         |      ^~~~~~~~~
>> kernel/xsched/cfs.c:45:6: warning: no previous prototype for 'xs_rq_remove' [-Wmissing-prototypes]
      45 | void xs_rq_remove(struct xsched_entity_cfs *xse)
         |      ^~~~~~~~~~~~
>> kernel/xsched/cfs.c:159:6: warning: no previous prototype for 'rq_init_fair' [-Wmissing-prototypes]
     159 | void rq_init_fair(struct xsched_cu *xcu)
         |      ^~~~~~~~~~~~
>> kernel/xsched/cfs.c:164:6: warning: no previous prototype for 'xse_init_fair' [-Wmissing-prototypes]
     164 | void xse_init_fair(struct xsched_entity *xse)
         |      ^~~~~~~~~~~~~
>> kernel/xsched/cfs.c:169:6: warning: no previous prototype for 'xse_deinit_fair' [-Wmissing-prototypes]
     169 | void xse_deinit_fair(struct xsched_entity *xse)
         |      ^~~~~~~~~~~~~~~
--
>> kernel/xsched/cfs.c:56: warning: Function parameter or member 'xse_cfs' not described in 'xs_cfs_rq_update'
>> kernel/xsched/cfs.c:56: warning: Function parameter or member 'new_xrt' not described in 'xs_cfs_rq_update'


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
  > 56	{
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
