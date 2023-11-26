Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C5FD277
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q600Q1C3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701038414; x=1732574414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eTFZJQ0rdrGYtk7zHl2o7n10JppWeTHF+HNzYhocN7k=;
  b=Q600Q1C3qoIaSjqQplYYTbnd3ARuk6fw55jxxPvvktZ25ZZ/jqPDqgKP
   zhZngg6kTvSfxl1pYhaGi9ejgUvYMrT19mZjnuj8AlFxBwx5z3Xz2LWvl
   hXNWv3HxxVCrkjjgxUMYNC9HLDGLk9zo3YCNFXox2ZN4k4G+sN3tHiz1b
   iQnmLLc5eFqUEM/CbmAIW8ALHHDo6cufXu306wXV94HOw9Ui3EQt9VCkM
   ObCM98TchRoDXXSyQG2BOJ1QETbp+FrdcPct6iPtGd5vdG6HLJxwcOsl2
   UAqIjNW2c9J9gtjVtGj8kuiZN3z2KDM+wX4RNk/H2becG0Xyy3zP6fEjE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="478802399"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="478802399"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 14:40:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="16123243"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2023 14:40:13 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7NnN-0005aM-36;
	Sun, 26 Nov 2023 22:40:09 +0000
Date: Mon, 27 Nov 2023 06:39:42 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 5/11] kernel/sched/core.c:119:1:
 sparse: sparse: symbol '__pcpu_scope_dvfs_update_delay' was not declared.
 Should it be static?
Message-ID: <202311270339.T4C7I57a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   08e786e9ed2872cba5830c16cd1bf55b475feb22
commit: 4731a8a2ea2c9990ef7f4d1fddbfed17d219aadf [5/11] sched: cpufreq: Remove magic 1.25 headroom from apply_dvfs_headroom()
config: i386-randconfig-063-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270339.T4C7I57a-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270339.T4C7I57a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270339.T4C7I57a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/core.c:119:1: sparse: sparse: symbol '__pcpu_scope_dvfs_update_delay' was not declared. Should it be static?
   kernel/sched/core.c:1043:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1043:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1043:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2250:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2250:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2250:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2250:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2250:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2250:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5660:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5660:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5660:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6618:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6618:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6618:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7179:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7179:17: sparse:    struct task_struct *
   kernel/sched/core.c:7179:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7394:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7394:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7394:22: sparse:    struct task_struct *
   kernel/sched/core.c:11482:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11482:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11482:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1342:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:552:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/sched.h:1342:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:577:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:601:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:638:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:639:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:679:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:680:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c:2241:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2242:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2243:18: sparse: sparse: dereference of noderef expression
   kernel/sched/sched.h:2142:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2142:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2142:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2142:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2142:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2142:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2142:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/core.c:8415:9: sparse: sparse: context imbalance in 'sched_setaffinity' - different lock contexts for basic block
   kernel/sched/core.c:8477:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/core.c:8640:28: sparse: sparse: context imbalance in '__cond_resched_lock' - unexpected unlock
   kernel/sched/core.c:8658:17: sparse: sparse: context imbalance in '__cond_resched_rwlock_read' - unexpected unlock
   kernel/sched/core.c:8676:17: sparse: sparse: context imbalance in '__cond_resched_rwlock_write' - unexpected unlock
   kernel/sched/sched.h:2142:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2142:25: sparse:    struct task_struct *

vim +/__pcpu_scope_dvfs_update_delay +119 kernel/sched/core.c

   117	
   118	DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 > 119	DEFINE_PER_CPU_READ_MOSTLY(u64, dvfs_update_delay);
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
