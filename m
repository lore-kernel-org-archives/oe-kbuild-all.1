Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7119BC0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 23:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+nT6iFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700435937; x=1731971937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0KYi+qrXMfSB5Y+CJdsHrlVC4e9Iaud4OpcIqvfSmK8=;
  b=V+nT6iFIapE5BTH8JdtVz+54dX/CAQKSfusshrP2lb4sTWpDNGcH9KTg
   RKz18JiGDuxgecYkxCw5fSnjXcMhj0aR7X4IArxApSnpFVN1ft+gSW+2s
   4EDE8bODTDPLgKzznZDhW5WoxIP7vfU/732kfKfhLe0QevyReOlWRfDTu
   idEQrfQO2DZo27wGjSnPaRXElIxkmTt1QENWShU2kspG5wNjEi5w3i0vx
   dDEXwSq6xfkPVRu9Tjt46iJR2SuIhRwfO5CyPRbdfBZbIH4NsRyODSbUV
   nMfKcFaTG+NEjiRkjHj5Bi7aMhE//yHfgoyJVFJ0qi/AdA2rZPLxrqvaq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="376561458"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="376561458"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 15:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1097592265"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="1097592265"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Nov 2023 15:18:54 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4r3u-0005gG-0r;
	Sun, 19 Nov 2023 23:18:47 +0000
Date: Mon, 20 Nov 2023 07:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/prjc 435/449] kernel/sched/alt_core.c:2078:19: warning:
 stack frame size (2096) exceeds limit (2048) in 'select_task_rq'
Message-ID: <202311200734.zeycJglw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/prjc
head:   a343b008e1bf155cdcfe9a46e38336032adeb65a
commit: a3d80748dd6e5dc2746d1013edb5f46475e3bc01 [435/449] sched/alt: [Sync] 2ef269ef1ac0 cgroup/cpuset: Free DL BW in case can_attach() fails
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231120/202311200734.zeycJglw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200734.zeycJglw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200734.zeycJglw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:7185:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
   void idle_task_exit(void)
        ^
   kernel/sched/alt_core.c:7185:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void idle_task_exit(void)
   ^
   static 
   kernel/sched/alt_core.c:7397:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
   int sched_cpu_activate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7397:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_activate(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7436:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
   int sched_cpu_deactivate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7436:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_deactivate(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7499:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
   int sched_cpu_starting(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7499:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_starting(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7519:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
   int sched_cpu_wait_empty(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7519:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_wait_empty(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7561:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
   int sched_cpu_dying(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7561:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_dying(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7644:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
   void __init sched_init_smp(void)
               ^
   kernel/sched/alt_core.c:7644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init_smp(void)
   ^
   static 
   kernel/sched/alt_core.c:7704:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
   void __init sched_init(void)
               ^
   kernel/sched/alt_core.c:7704:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init(void)
   ^
   static 
   kernel/sched/alt_core.c:8060:20: warning: no previous prototype for function 'sched_create_group' [-Wmissing-prototypes]
   struct task_group *sched_create_group(struct task_group *parent)
                      ^
   kernel/sched/alt_core.c:8060:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct task_group *sched_create_group(struct task_group *parent)
   ^
   static 
   kernel/sched/alt_core.c:8071:6: warning: no previous prototype for function 'sched_online_group' [-Wmissing-prototypes]
   void sched_online_group(struct task_group *tg, struct task_group *parent)
        ^
   kernel/sched/alt_core.c:8071:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_online_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/alt_core.c:8082:6: warning: no previous prototype for function 'sched_destroy_group' [-Wmissing-prototypes]
   void sched_destroy_group(struct task_group *tg)
        ^
   kernel/sched/alt_core.c:8082:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_destroy_group(struct task_group *tg)
   ^
   static 
   kernel/sched/alt_core.c:8088:6: warning: no previous prototype for function 'sched_release_group' [-Wmissing-prototypes]
   void sched_release_group(struct task_group *tg)
        ^
   kernel/sched/alt_core.c:8088:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_release_group(struct task_group *tg)
   ^
   static 
   kernel/sched/alt_core.c:8156:5: warning: no previous prototype for function 'sched_group_set_shares' [-Wmissing-prototypes]
   int sched_group_set_shares(struct task_group *tg, unsigned long shares)
       ^
   kernel/sched/alt_core.c:8156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_group_set_shares(struct task_group *tg, unsigned long shares)
   ^
   static 
   kernel/sched/alt_core.c:8226:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           .legacy_cftypes = cpu_legacy_files,
                             ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8225:20: note: previous initialization is here
           .legacy_cftypes = cpu_files,
                             ^~~~~~~~~
   kernel/sched/alt_core.c:1337:19: warning: unused function 'hrtick_enabled' [-Wunused-function]
   static inline int hrtick_enabled(struct rq *rq)
                     ^
>> kernel/sched/alt_core.c:2078:19: warning: stack frame size (2096) exceeds limit (2048) in 'select_task_rq' [-Wframe-larger-than]
   static inline int select_task_rq(struct task_struct *p)
                     ^
   40/2096 (1.91%) spills, 2056/2096 (98.09%) variables
   23 warnings generated.


vim +/select_task_rq +2078 kernel/sched/alt_core.c

59c66ddd9fe885 Alfred Chen 2022-12-21  2077  
ebcc729f56f5f9 Alfred Chen 2021-05-24 @2078  static inline int select_task_rq(struct task_struct *p)
9f08fc0c802aa6 Alfred Chen 2019-08-19  2079  {
59c66ddd9fe885 Alfred Chen 2022-12-21  2080  	cpumask_t allow_mask, mask;
9f08fc0c802aa6 Alfred Chen 2019-08-19  2081  
59c66ddd9fe885 Alfred Chen 2022-12-21  2082  	if (unlikely(!cpumask_and(&allow_mask, p->cpus_ptr, cpu_active_mask)))
9f08fc0c802aa6 Alfred Chen 2019-08-19  2083  		return select_fallback_rq(task_cpu(p), p);
9f08fc0c802aa6 Alfred Chen 2019-08-19  2084  
9f08fc0c802aa6 Alfred Chen 2019-08-19  2085  	if (
9f08fc0c802aa6 Alfred Chen 2019-08-19  2086  #ifdef CONFIG_SCHED_SMT
59c66ddd9fe885 Alfred Chen 2022-12-21  2087  	    cpumask_and(&mask, &allow_mask, &sched_sg_idle_mask) ||
9f08fc0c802aa6 Alfred Chen 2019-08-19  2088  #endif
59c66ddd9fe885 Alfred Chen 2022-12-21  2089  	    cpumask_and(&mask, &allow_mask, sched_idle_mask) ||
59c66ddd9fe885 Alfred Chen 2022-12-21  2090  	    preempt_mask_check(p, &allow_mask, &mask))
59c66ddd9fe885 Alfred Chen 2022-12-21  2091  		return best_mask_cpu(task_cpu(p), &mask);
9f08fc0c802aa6 Alfred Chen 2019-08-19  2092  
59c66ddd9fe885 Alfred Chen 2022-12-21  2093  	return best_mask_cpu(task_cpu(p), &allow_mask);
9f08fc0c802aa6 Alfred Chen 2019-08-19  2094  }
9f08fc0c802aa6 Alfred Chen 2019-08-19  2095  

:::::: The code at line 2078 was first introduced by commit
:::::: ebcc729f56f5f9adc82c8ddf45c70618a833c694 sched/pds: Fix unexpected larger delta in task_sched_prio_normal()

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
