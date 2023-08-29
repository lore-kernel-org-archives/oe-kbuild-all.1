Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D5368
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 00:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693268368; x=1724804368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7zvB1fFllOs/Y/WSreayJCIoqavFu6u7nedJQK7a/fI=;
  b=lvucm838jVLoTjNJKM9BYK9FKItbDq+YpMfc5Hr5xX10Y0SQ744bBVKN
   yfoDuOKwj10UZc3AMQLvnncIYyLkjlPuCt+Kp5cXXQg71PVKhMAe1U4U3
   elGF8LPjyRLC4sZ61DWDk85k2d8VavfdgF4TcCGNiP1SQuveQ/3XR/anv
   FDhVTNC0MF4+604FMlQ+6Nrk/+bRHqrOavNVjVy9TQ8wZv4YdxNV1cGuu
   bb9rKhL/kR3hDI7WM5SGpJCBJqjN4jzUZCZP+Guo/tVF58w9oP0zjSSTf
   UsCt0eapL9sLQm1u/kLxyXGoGXYZoIMInr102gaifE3WjYKQEX8YZQQsG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="406237581"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="406237581"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 17:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="862028016"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="862028016"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Aug 2023 17:19:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qamS5-0008Dz-35;
	Tue, 29 Aug 2023 00:19:25 +0000
Date: Tue, 29 Aug 2023 08:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:rt-thermal-pressure 2/2] kernel/sched/rt.c:2552:13:
 warning: no previous prototype for 'init_sched_rt_fitness_mask'
Message-ID: <202308290858.gz5EC501-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux rt-thermal-pressure
head:   f9adf589d645dfda6f820165dafbc0f9d11747b4
commit: f9adf589d645dfda6f820165dafbc0f9d11747b4 [2/2] sched/rt: Support multi-criterion fitness search for lowest_rq
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230829/202308290858.gz5EC501-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290858.gz5EC501-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290858.gz5EC501-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
>> kernel/sched/rt.c:2552:13: warning: no previous prototype for 'init_sched_rt_fitness_mask' [-Wmissing-prototypes]
    2552 | void __init init_sched_rt_fitness_mask(int cpu)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c: In function 'task_tick_rt':
   kernel/sched/rt.c:2705:37: error: 'push_task' undeclared (first use in this function); did you mean 'push_rt_task'?
    2705 |                                     push_task, &rq->push_work);
         |                                     ^~~~~~~~~
         |                                     push_rt_task
   kernel/sched/rt.c:2705:37: note: each undeclared identifier is reported only once for each function it appears in


vim +/init_sched_rt_fitness_mask +2552 kernel/sched/rt.c

  2551	
> 2552	void __init init_sched_rt_fitness_mask(int cpu)
  2553	{
  2554		cpumask_var_t *fitness_mask_array;
  2555		unsigned int i;
  2556	
  2557		if (!NUM_FITNESS_FN)
  2558			return;
  2559	
  2560		fitness_mask_array = kcalloc_node(NUM_FITNESS_FN, sizeof(cpumask_var_t),
  2561						  GFP_KERNEL, cpu_to_node(cpu));
  2562	
  2563		per_cpu(local_cpu_fitness_mask, cpu) = fitness_mask_array;
  2564	
  2565		for (i = 0; i < NUM_FITNESS_FN; i++) {
  2566			zalloc_cpumask_var_node(&fitness_mask_array[i], GFP_KERNEL,
  2567						cpu_to_node(cpu));
  2568		}
  2569	}
  2570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
