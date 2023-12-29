Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9A1125CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9eSiXmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703867804; x=1735403804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EAm58x/upm7CGL5xQRXmoaiqrSFo+zSxgJqASelb4YM=;
  b=M9eSiXmgZ/3Ob8w+62F7oWGiHrjpf6jOCzL+vPPAfx8Cirw2uoSkWB6+
   sTaZ5BbOqXILy+aEK8I0nRVa4UOvaet6PueH1EMNTjOCuelHjmM+rMguB
   6jjxi5eNInV87pj/3+WNMv4yWeJmR7ZC4yEOuAfvy/9SbI/GUjAObyXxO
   aJQOx19SoeEAgdU/nkYS2mJuQkmEx7/zCrD+mxCrKfZEHcmFF8/0IwBwz
   un4cLBDugdqACb0pmfOJxyzmDSye80JZtEdqzk/sudtY1FPefW9FNHvsb
   lBaEhdvHTIG/F1/wMukkWSot6s6zR8d1udwby6pIF4+bWEPzVxp+mnBsw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="395547492"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="395547492"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 08:36:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="952112198"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="952112198"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Dec 2023 08:36:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJFqT-000HbM-3D;
	Fri, 29 Dec 2023 16:36:26 +0000
Date: Sat, 30 Dec 2023 00:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: Patrick Bellasi <patrick.bellasi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Quentin Perret <quentin.perret@arm.com>,
	Chris Redpath <chris.redpath@arm.com>
Subject: kernel/sched/tune.c:81:36: error: field 'css' has incomplete type
Message-ID: <202312300012.Rrm5JsU8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux linux-5.10-gen-rkr3.4
head:   39141d792534c5703bb834861c47718008c85001
commit: 68dbff9ce92ae2f923321d150fb72a6d8b05e640 ANDROID: sched: fair/tune: Add schedtune with cgroups interface
date:   5 years ago
config: powerpc-randconfig-r053-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300012.Rrm5JsU8-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300012.Rrm5JsU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300012.Rrm5JsU8-lkp@intel.com/

Note: the steev/linux-5.10-gen-rkr3.4 HEAD 39141d792534c5703bb834861c47718008c85001 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

>> kernel/sched/tune.c:81:36: error: field 'css' has incomplete type
      81 |         struct cgroup_subsys_state css;
         |                                    ^~~
   kernel/sched/tune.c: In function 'task_schedtune':
>> kernel/sched/tune.c:101:23: error: implicit declaration of function 'task_css'; did you mean 'task_cpu'? [-Werror=implicit-function-declaration]
     101 |         return css_st(task_css(tsk, schedtune_cgrp_id));
         |                       ^~~~~~~~
         |                       task_cpu
>> kernel/sched/tune.c:101:37: error: 'schedtune_cgrp_id' undeclared (first use in this function); did you mean 'schedtune_spc_rdiv'?
     101 |         return css_st(task_css(tsk, schedtune_cgrp_id));
         |                                     ^~~~~~~~~~~~~~~~~
         |                                     schedtune_spc_rdiv
   kernel/sched/tune.c:101:37: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/tune.c: At top level:
>> kernel/sched/tune.c:290:33: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
     290 | int schedtune_can_attach(struct cgroup_taskset *tset)
         |                                 ^~~~~~~~~~~~~~
   kernel/sched/tune.c:290:5: warning: no previous prototype for 'schedtune_can_attach' [-Wmissing-prototypes]
     290 | int schedtune_can_attach(struct cgroup_taskset *tset)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/tune.c: In function 'schedtune_can_attach':
>> kernel/sched/tune.c:306:9: error: implicit declaration of function 'cgroup_taskset_for_each' [-Werror=implicit-function-declaration]
     306 |         cgroup_taskset_for_each(task, css, tset) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/tune.c:306:49: error: expected ';' before '{' token
     306 |         cgroup_taskset_for_each(task, css, tset) {
         |                                                 ^~
         |                                                 ;
   kernel/sched/tune.c:300:13: warning: unused variable 'tasks' [-Wunused-variable]
     300 |         int tasks;
         |             ^~~~~
   kernel/sched/tune.c:299:13: warning: unused variable 'dst_bg' [-Wunused-variable]
     299 |         int dst_bg; /* Destination boost group index */
         |             ^~~~~~
   kernel/sched/tune.c:298:13: warning: unused variable 'src_bg' [-Wunused-variable]
     298 |         int src_bg; /* Source boost group index */
         |             ^~~~~~
   kernel/sched/tune.c:297:20: warning: unused variable 'rq' [-Wunused-variable]
     297 |         struct rq *rq;
         |                    ^~
   kernel/sched/tune.c:296:22: warning: unused variable 'cpu' [-Wunused-variable]
     296 |         unsigned int cpu;
         |                      ^~~
   kernel/sched/tune.c:295:25: warning: unused variable 'rq_flags' [-Wunused-variable]
     295 |         struct rq_flags rq_flags;
         |                         ^~~~~~~~
   kernel/sched/tune.c:294:30: warning: unused variable 'bg' [-Wunused-variable]
     294 |         struct boost_groups *bg;
         |                              ^~
   kernel/sched/tune.c: At top level:
   kernel/sched/tune.c:363:37: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
     363 | void schedtune_cancel_attach(struct cgroup_taskset *tset)
         |                                     ^~~~~~~~~~~~~~
   kernel/sched/tune.c:363:6: warning: no previous prototype for 'schedtune_cancel_attach' [-Wmissing-prototypes]
     363 | void schedtune_cancel_attach(struct cgroup_taskset *tset)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/tune.c:444:58: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
     444 | prefer_idle_read(struct cgroup_subsys_state *css, struct cftype *cft)
         |                                                          ^~~~~~
   kernel/sched/tune.c:452:59: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
     452 | prefer_idle_write(struct cgroup_subsys_state *css, struct cftype *cft,
         |                                                           ^~~~~~
   kernel/sched/tune.c:462:52: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
     462 | boost_read(struct cgroup_subsys_state *css, struct cftype *cft)
         |                                                    ^~~~~~
   kernel/sched/tune.c:470:53: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
     470 | boost_write(struct cgroup_subsys_state *css, struct cftype *cft,
         |                                                     ^~~~~~
>> kernel/sched/tune.c:486:22: error: array type has incomplete element type 'struct cftype'
     486 | static struct cftype files[] = {
         |                      ^~~~~
>> kernel/sched/tune.c:583:8: error: variable 'schedtune_cgrp_subsys' has initializer but incomplete type
     583 | struct cgroup_subsys schedtune_cgrp_subsys = {
         |        ^~~~~~~~~~~~~
>> kernel/sched/tune.c:584:10: error: 'struct cgroup_subsys' has no member named 'css_alloc'
     584 |         .css_alloc      = schedtune_css_alloc,
         |          ^~~~~~~~~
>> kernel/sched/tune.c:584:27: warning: excess elements in struct initializer
     584 |         .css_alloc      = schedtune_css_alloc,
         |                           ^~~~~~~~~~~~~~~~~~~
   kernel/sched/tune.c:584:27: note: (near initialization for 'schedtune_cgrp_subsys')
>> kernel/sched/tune.c:585:10: error: 'struct cgroup_subsys' has no member named 'css_free'
     585 |         .css_free       = schedtune_css_free,
         |          ^~~~~~~~
   kernel/sched/tune.c:585:27: warning: excess elements in struct initializer
     585 |         .css_free       = schedtune_css_free,
         |                           ^~~~~~~~~~~~~~~~~~
   kernel/sched/tune.c:585:27: note: (near initialization for 'schedtune_cgrp_subsys')
>> kernel/sched/tune.c:586:10: error: 'struct cgroup_subsys' has no member named 'can_attach'
     586 |         .can_attach     = schedtune_can_attach,
         |          ^~~~~~~~~~
   kernel/sched/tune.c:586:27: warning: excess elements in struct initializer
     586 |         .can_attach     = schedtune_can_attach,
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/tune.c:586:27: note: (near initialization for 'schedtune_cgrp_subsys')
>> kernel/sched/tune.c:587:10: error: 'struct cgroup_subsys' has no member named 'cancel_attach'
     587 |         .cancel_attach  = schedtune_cancel_attach,
         |          ^~~~~~~~~~~~~
   kernel/sched/tune.c:587:27: warning: excess elements in struct initializer
     587 |         .cancel_attach  = schedtune_cancel_attach,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/tune.c:587:27: note: (near initialization for 'schedtune_cgrp_subsys')
>> kernel/sched/tune.c:588:10: error: 'struct cgroup_subsys' has no member named 'legacy_cftypes'
     588 |         .legacy_cftypes = files,
         |          ^~~~~~~~~~~~~~
   kernel/sched/tune.c:588:27: warning: excess elements in struct initializer
     588 |         .legacy_cftypes = files,
         |                           ^~~~~
   kernel/sched/tune.c:588:27: note: (near initialization for 'schedtune_cgrp_subsys')
>> kernel/sched/tune.c:589:10: error: 'struct cgroup_subsys' has no member named 'early_init'
     589 |         .early_init     = 1,
         |          ^~~~~~~~~~
   kernel/sched/tune.c:589:27: warning: excess elements in struct initializer
     589 |         .early_init     = 1,
         |                           ^
   kernel/sched/tune.c:589:27: note: (near initialization for 'schedtune_cgrp_subsys')
>> kernel/sched/tune.c:583:22: error: storage size of 'schedtune_cgrp_subsys' isn't known
     583 | struct cgroup_subsys schedtune_cgrp_subsys = {
         |                      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/tune.c: In function 'task_schedtune':
>> kernel/sched/tune.c:102:1: warning: control reaches end of non-void function [-Wreturn-type]
     102 | }
         | ^
   kernel/sched/tune.c: In function 'schedtune_can_attach':
   kernel/sched/tune.c:361:1: warning: control reaches end of non-void function [-Wreturn-type]
     361 | }
         | ^
   kernel/sched/tune.c: At top level:
>> kernel/sched/tune.c:486:22: warning: 'files' defined but not used [-Wunused-variable]
     486 | static struct cftype files[] = {
         |                      ^~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/css +81 kernel/sched/tune.c

    15	
    16	/*
    17	 * EAS scheduler tunables for task groups.
    18	 *
    19	 * When CGroup support is enabled, we have to synchronize two different
    20	 * paths:
    21	 *  - slow path: where CGroups are created/updated/removed
    22	 *  - fast path: where tasks in a CGroups are accounted
    23	 *
    24	 * The slow path tracks (a limited number of) CGroups and maps each on a
    25	 * "boost_group" index. The fastpath accounts tasks currently RUNNABLE on each
    26	 * "boost_group".
    27	 *
    28	 * Once a new CGroup is created, a boost group idx is assigned and the
    29	 * corresponding "boost_group" marked as valid on each CPU.
    30	 * Once a CGroup is release, the corresponding "boost_group" is marked as
    31	 * invalid on each CPU. The CPU boost value (boost_max) is aggregated by
    32	 * considering only valid boost_groups with a non null tasks counter.
    33	 *
    34	 * .:: Locking strategy
    35	 *
    36	 * The fast path uses a spin lock for each CPU boost_group which protects the
    37	 * tasks counter.
    38	 *
    39	 * The "valid" and "boost" values of each CPU boost_group is instead
    40	 * protected by the RCU lock provided by the CGroups callbacks. Thus, only the
    41	 * slow path can access and modify the boost_group attribtues of each CPU.
    42	 * The fast path will catch up the most updated values at the next scheduling
    43	 * event (i.e. enqueue/dequeue).
    44	 *
    45	 *                                                        |
    46	 *                                             SLOW PATH  |   FAST PATH
    47	 *                              CGroup add/update/remove  |   Scheduler enqueue/dequeue events
    48	 *                                                        |
    49	 *                                                        |
    50	 *                                                        |     DEFINE_PER_CPU(struct boost_groups)
    51	 *                                                        |     +--------------+----+---+----+----+
    52	 *                                                        |     |  idle        |    |   |    |    |
    53	 *                                                        |     |  boost_max   |    |   |    |    |
    54	 *                                                        |  +---->lock        |    |   |    |    |
    55	 *  struct schedtune                  allocated_groups    |  |  |  group[    ] |    |   |    |    |
    56	 *  +------------------------------+         +-------+    |  |  +--+---------+-+----+---+----+----+
    57	 *  | idx                          |         |       |    |  |     |  valid  |
    58	 *  | boots / prefer_idle          |         |       |    |  |     |  boost  |
    59	 *  | perf_{boost/constraints}_idx | <---------+(*)  |    |  |     |  tasks  | <------------+
    60	 *  | css                          |         +-------+    |  |     +---------+              |
    61	 *  +-+----------------------------+         |       |    |  |     |         |              |
    62	 *    ^                                      |       |    |  |     |         |              |
    63	 *    |                                      +-------+    |  |     +---------+              |
    64	 *    |                                      |       |    |  |     |         |              |
    65	 *    |                                      |       |    |  |     |         |              |
    66	 *    |                                      +-------+    |  |     +---------+              |
    67	 *    | zmalloc                              |       |    |  |     |         |              |
    68	 *    |                                      |       |    |  |     |         |              |
    69	 *    |                                      +-------+    |  |     +---------+              |
    70	 *    +                              BOOSTGROUPS_COUNT    |  |     BOOSTGROUPS_COUNT        |
    71	 *  schedtune_boostgroup_init()                           |  +                              |
    72	 *                                                        |  schedtune_{en,de}queue_task()  |
    73	 *                                                        |                                 +
    74	 *                                                        |          schedtune_tasks_update()
    75	 *                                                        |
    76	 */
    77	
    78	/* SchdTune tunables for a group of tasks */
    79	struct schedtune {
    80		/* SchedTune CGroup subsystem */
  > 81		struct cgroup_subsys_state css;
    82	
    83		/* Boost group allocated ID */
    84		int idx;
    85	
    86		/* Boost value for tasks on that SchedTune CGroup */
    87		int boost;
    88	
    89		/* Hint to bias scheduling of tasks on that SchedTune CGroup
    90		 * towards idle CPUs */
    91		int prefer_idle;
    92	};
    93	
    94	static inline struct schedtune *css_st(struct cgroup_subsys_state *css)
    95	{
    96		return css ? container_of(css, struct schedtune, css) : NULL;
    97	}
    98	
    99	static inline struct schedtune *task_schedtune(struct task_struct *tsk)
   100	{
 > 101		return css_st(task_css(tsk, schedtune_cgrp_id));
 > 102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
