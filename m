Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133461FDB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 23:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688514667; x=1720050667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XwyDnOtFH4o7Prir7kb3Eeg48CIo2D47Odr9rbcky98=;
  b=krz/YyuYX4RKGFi+DhyLskOn+ke6flyilJk1Ju6KXbNDfgG28374dncA
   DkFzAd7wtf2YuK/+875OXgemFs2ck4Xtfp4K0Ux0R4SCVMGqbHc/8v1IL
   lJqc6TqJCdm7dpoRSZyhY0oYG6BAosSB13fhMxzFeLAZL49Z4lpvBJ/bB
   3xk5mFPpop8JlpdLrPgDj5gQ/kLFV2ukA1Esox4WPP0pRXmYSMTBnDpwc
   wVBYNcG2z9r4yyuyJCIj15dasutNacB3cFh5NCkPlnJhPbaMB+NAgzsEF
   lzC0xuUqrUMzWG8uRgrm243pypPB3nLjD6BxWAdCl8tu3DVZnzZ6ihGnL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="348001252"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="348001252"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 16:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="722197931"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="722197931"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Jul 2023 16:51:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGpnV-000IeN-1A;
	Tue, 04 Jul 2023 23:51:05 +0000
Date: Wed, 5 Jul 2023 07:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 381/386] kernel/sched/alt_core.c:2037:19: warning:
 stack frame size (2096) exceeds limit (2048) in 'select_task_rq'
Message-ID: <202307050743.r5mNhIIb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   ea6d5107f9aa76407998568ad4cbcf54879ee0c0
commit: 4facf7f6e34125d06a1fc94cbc716e2cb1e09f82 [381/386] sched/alt: [Sync] 223baf9d17f2 sched: Fix performance regression introduced by mm_cid
config: x86_64-randconfig-x001-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050743.r5mNhIIb-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050743.r5mNhIIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050743.r5mNhIIb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   void resched_curr(struct rq *rq)
        ^
   kernel/sched/alt_core.c:1007:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_curr(struct rq *rq)
   ^
   static 
   kernel/sched/alt_core.c:1030:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
   void resched_cpu(int cpu)
        ^
   kernel/sched/alt_core.c:1030:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_cpu(int cpu)
   ^
   static 
   kernel/sched/alt_core.c:1045:6: warning: no previous prototype for function 'select_nohz_load_balancer' [-Wmissing-prototypes]
   void select_nohz_load_balancer(int stop_tick) {}
        ^
   kernel/sched/alt_core.c:1045:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void select_nohz_load_balancer(int stop_tick) {}
   ^
   static 
   kernel/sched/alt_core.c:1047:6: warning: no previous prototype for function 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
   void set_cpu_sd_state_idle(void) {}
        ^
   kernel/sched/alt_core.c:1047:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_cpu_sd_state_idle(void) {}
   ^
   static 
   kernel/sched/alt_core.c:2480:6: warning: no previous prototype for function 'sched_ttwu_pending' [-Wmissing-prototypes]
   void sched_ttwu_pending(void *arg)
        ^
   kernel/sched/alt_core.c:2480:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_ttwu_pending(void *arg)
   ^
   static 
   kernel/sched/alt_core.c:2523:6: warning: no previous prototype for function 'call_function_single_prep_ipi' [-Wmissing-prototypes]
   bool call_function_single_prep_ipi(int cpu)
        ^
   kernel/sched/alt_core.c:2523:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool call_function_single_prep_ipi(int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7153:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
   void idle_task_exit(void)
        ^
   kernel/sched/alt_core.c:7153:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void idle_task_exit(void)
   ^
   static 
   kernel/sched/alt_core.c:7363:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
   int sched_cpu_activate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7363:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_activate(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7402:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
   int sched_cpu_deactivate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7402:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_deactivate(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7466:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
   int sched_cpu_starting(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7466:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_starting(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7486:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
   int sched_cpu_wait_empty(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7486:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_wait_empty(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7528:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
   int sched_cpu_dying(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7528:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_dying(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7611:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
   void __init sched_init_smp(void)
               ^
   kernel/sched/alt_core.c:7611:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init_smp(void)
   ^
   static 
   kernel/sched/alt_core.c:7671:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
   void __init sched_init(void)
               ^
   kernel/sched/alt_core.c:7671:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init(void)
   ^
   static 
   kernel/sched/alt_core.c:1280:19: warning: unused function 'hrtick_enabled' [-Wunused-function]
   static inline int hrtick_enabled(struct rq *rq)
                     ^
>> kernel/sched/alt_core.c:2037:19: warning: stack frame size (2096) exceeds limit (2048) in 'select_task_rq' [-Wframe-larger-than]
   static inline int select_task_rq(struct task_struct *p)
                     ^
   16 warnings generated.


vim +/select_task_rq +2037 kernel/sched/alt_core.c

81ccd7b280225f Alfred Chen 2022-12-21  2036  
5a8c0773fcc551 Alfred Chen 2021-05-24 @2037  static inline int select_task_rq(struct task_struct *p)
cedcd3e67433b3 Alfred Chen 2019-08-19  2038  {
81ccd7b280225f Alfred Chen 2022-12-21  2039  	cpumask_t allow_mask, mask;
cedcd3e67433b3 Alfred Chen 2019-08-19  2040  
81ccd7b280225f Alfred Chen 2022-12-21  2041  	if (unlikely(!cpumask_and(&allow_mask, p->cpus_ptr, cpu_active_mask)))
cedcd3e67433b3 Alfred Chen 2019-08-19  2042  		return select_fallback_rq(task_cpu(p), p);
cedcd3e67433b3 Alfred Chen 2019-08-19  2043  
cedcd3e67433b3 Alfred Chen 2019-08-19  2044  	if (
cedcd3e67433b3 Alfred Chen 2019-08-19  2045  #ifdef CONFIG_SCHED_SMT
81ccd7b280225f Alfred Chen 2022-12-21  2046  	    cpumask_and(&mask, &allow_mask, &sched_sg_idle_mask) ||
cedcd3e67433b3 Alfred Chen 2019-08-19  2047  #endif
81ccd7b280225f Alfred Chen 2022-12-21  2048  	    cpumask_and(&mask, &allow_mask, sched_idle_mask) ||
81ccd7b280225f Alfred Chen 2022-12-21  2049  	    preempt_mask_check(p, &allow_mask, &mask))
81ccd7b280225f Alfred Chen 2022-12-21  2050  		return best_mask_cpu(task_cpu(p), &mask);
cedcd3e67433b3 Alfred Chen 2019-08-19  2051  
81ccd7b280225f Alfred Chen 2022-12-21  2052  	return best_mask_cpu(task_cpu(p), &allow_mask);
cedcd3e67433b3 Alfred Chen 2019-08-19  2053  }
cedcd3e67433b3 Alfred Chen 2019-08-19  2054  

:::::: The code at line 2037 was first introduced by commit
:::::: 5a8c0773fcc551e165cd58f80c4d91faa4b353db sched/pds: Fix unexpected larger delta in task_sched_prio_normal()

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
