Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14656AB9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 22:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690930307; x=1722466307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVKY6Ady2P6RMwfTVSDp7R7IYY2k+G+VfXyFp+o5KJU=;
  b=I+Jjs107YVnzoA0lxytCqcR7gWtChMFqjvGjowHFGvBJPA2g2DUbTy67
   bMEbX03nvvytE9rBiUeZXtG3wfGkDoV5FfVaWEZyfRDGttBlBhtqKgggL
   iR5yAsvf5NRQeGm0/b4yjDbqLuof0JunVvaF3mRA+7EafxuNaPGFowdGY
   iLmMxVrRv5Fj62MAqDxHh5moNijfYtV5bfW3pY41paxhi2r4sFcHM0Gg8
   vSMr4JHl/wGUx2xlFht/Eq67bW+wwqaMNB3V0MY38EKBNDnU6gouUtP2K
   2dvx5xbfpSpU6xjWbYxiMkFaeEM/MFHXAgaV0+6jFnPvXqItZEvGxtT2o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400375941"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="400375941"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 15:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="798852102"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="798852102"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2023 15:51:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQyDQ-0000dr-0H;
	Tue, 01 Aug 2023 22:51:44 +0000
Date: Wed, 2 Aug 2023 06:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Phil Auld <pauld@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 6/6] kernel/sched/fair.c:6274:6: error:
 redefinition of 'cfs_task_bw_constrained'
Message-ID: <202308020619.VgTRqYwU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   e8d5ff8258bf73b585e921af5bd967057f17a738
commit: e8d5ff8258bf73b585e921af5bd967057f17a738 [6/6] sched/fair: Block nohz tick_stop when cfs bandwidth in use
config: i386-buildonly-randconfig-r005-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020619.VgTRqYwU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020619.VgTRqYwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020619.VgTRqYwU-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:6261:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6261 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
         |      ^~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:6274:6: error: redefinition of 'cfs_task_bw_constrained'
    6274 | bool cfs_task_bw_constrained(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/fair.c:55:
   kernel/sched/sched.h:498:20: note: previous definition of 'cfs_task_bw_constrained' with type 'bool(struct task_struct *)' {aka '_Bool(struct task_struct *)'}
     498 | static inline bool cfs_task_bw_constrained(struct task_struct *p) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12881:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   12881 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12883:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   12883 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12888:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   12888 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12890:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   12890 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cfs_task_bw_constrained +6274 kernel/sched/fair.c

  6266	
  6267	static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
  6268	{
  6269		return NULL;
  6270	}
  6271	static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
  6272	static inline void update_runtime_enabled(struct rq *rq) {}
  6273	static inline void unthrottle_offline_cfs_rqs(struct rq *rq) {}
> 6274	bool cfs_task_bw_constrained(struct task_struct *p)
  6275	{
  6276		return false;
  6277	}
  6278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
