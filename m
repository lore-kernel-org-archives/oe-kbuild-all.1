Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E715A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 04:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678596132; x=1710132132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rz8VLOdcb9qIeKqJjSh5L61VXiQcIcs1l8miVFLS1Ww=;
  b=NVIKf+1JzgvfdTwy/eDjHI1zMFzVirtt2eHNn4zYHV40otBWLQFZ3ZOM
   pt9agC8VMwxnJZW/JTdPl21TjezAq5ZgK6Ltk8OZHpWc3fkomXLYYqAtL
   OVyAScVWBJRUetKdetplccOaXcCiNKPjW84khNNQLHOfXRcCHvuUBy5os
   clcAdMMFHm37GRr4tyBMvQKbiN6b96dgSSR514FEAfpo6UFvT5ZjW6wUl
   R1hjtQ5KQf9ixeRNNHroA8jci53SBxiuGNeFZRZqFgLJIpFLxrqZyCWhM
   Hk+MXmcqCymEX2S+H1P67Ms3Jiq/mDiFbHzskFm0W4hPlse+iXHKMYCTZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="320813799"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="320813799"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 20:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="628253645"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="628253645"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Mar 2023 20:42:11 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbDX8-0004zA-1t;
	Sun, 12 Mar 2023 04:42:10 +0000
Date: Sun, 12 Mar 2023 12:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 295/371] kernel/sched/alt_core.c:1004:6: warning: no
 previous prototype for function 'select_nohz_load_balancer'
Message-ID: <202303121223.75kDUlJ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   66bb0e6d857d9b3bce5062779df9216e00986c6f
commit: 758c39a103c58a35cb772408e0ceb8ff65399e12 [295/371] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230312/202303121223.75kDUlJ5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/758c39a103c58a35cb772408e0ceb8ff65399e12
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 758c39a103c58a35cb772408e0ceb8ff65399e12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121223.75kDUlJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:632:15: error: conflicting types for 'sched_cpu_util'
   unsigned long sched_cpu_util(int cpu, unsigned long max)
                 ^
   include/linux/sched.h:2319:15: note: previous declaration is here
   unsigned long sched_cpu_util(int cpu);
                 ^
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for function 'resched_curr' [-Wmissing-prototypes]
   void resched_curr(struct rq *rq)
        ^
   kernel/sched/alt_core.c:966:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_curr(struct rq *rq)
   ^
   static 
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
   void resched_cpu(int cpu)
        ^
   kernel/sched/alt_core.c:989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_cpu(int cpu)
   ^
   static 
>> kernel/sched/alt_core.c:1004:6: warning: no previous prototype for function 'select_nohz_load_balancer' [-Wmissing-prototypes]
   void select_nohz_load_balancer(int stop_tick) {}
        ^
   kernel/sched/alt_core.c:1004:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void select_nohz_load_balancer(int stop_tick) {}
   ^
   static 
>> kernel/sched/alt_core.c:1006:6: warning: no previous prototype for function 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
   void set_cpu_sd_state_idle(void) {}
        ^
   kernel/sched/alt_core.c:1006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_cpu_sd_state_idle(void) {}
   ^
   static 
   kernel/sched/alt_core.c:1192:6: warning: no previous prototype for function 'hrtick_start' [-Wmissing-prototypes]
   void hrtick_start(struct rq *rq, u64 delay)
        ^
   kernel/sched/alt_core.c:1192:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void hrtick_start(struct rq *rq, u64 delay)
   ^
   static 
   kernel/sched/alt_core.c:2339:6: warning: no previous prototype for function 'sched_ttwu_pending' [-Wmissing-prototypes]
   void sched_ttwu_pending(void *arg)
        ^
   kernel/sched/alt_core.c:2339:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_ttwu_pending(void *arg)
   ^
   static 
   kernel/sched/alt_core.c:2372:6: warning: no previous prototype for function 'send_call_function_single_ipi' [-Wmissing-prototypes]
   void send_call_function_single_ipi(int cpu)
        ^
   kernel/sched/alt_core.c:2372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void send_call_function_single_ipi(int cpu)
   ^
   static 
   kernel/sched/alt_core.c:4558:21: error: use of undeclared identifier 'PF_FROZEN'
                                   !(prev->flags & PF_FROZEN);
                                                   ^
   kernel/sched/alt_core.c:4674:6: error: implicit declaration of function 'tsk_is_pi_blocked' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (tsk_is_pi_blocked(tsk))
               ^
   kernel/sched/alt_core.c:4734:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
   asmlinkage __visible void __sched schedule_user(void)
                                     ^
   kernel/sched/alt_core.c:4734:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage __visible void __sched schedule_user(void)
                        ^
                        static 
   kernel/sched/alt_core.c:6770:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
   void idle_task_exit(void)
        ^
   kernel/sched/alt_core.c:6770:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void idle_task_exit(void)
   ^
   static 
   kernel/sched/alt_core.c:6980:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
   int sched_cpu_activate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:6980:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_activate(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7019:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
   int sched_cpu_deactivate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7019:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_deactivate(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7083:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
   int sched_cpu_starting(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7083:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_starting(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7103:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
   int sched_cpu_wait_empty(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_wait_empty(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7145:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
   int sched_cpu_dying(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_dying(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7226:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
   void __init sched_init_smp(void)
               ^
   kernel/sched/alt_core.c:7226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init_smp(void)
   ^
   static 
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
   void __init sched_init(void)
               ^
   kernel/sched/alt_core.c:7278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init(void)
   ^
   static 
   16 warnings and 3 errors generated.


vim +/select_nohz_load_balancer +1004 kernel/sched/alt_core.c

8b025fc742d760 Alfred Chen 2019-08-19  1003  
56e0358e1d4dc0 Alfred Chen 2020-08-07 @1004  void select_nohz_load_balancer(int stop_tick) {}
8b025fc742d760 Alfred Chen 2019-08-19  1005  
8b025fc742d760 Alfred Chen 2019-08-19 @1006  void set_cpu_sd_state_idle(void) {}
8b025fc742d760 Alfred Chen 2019-08-19  1007  

:::::: The code at line 1004 was first introduced by commit
:::::: 56e0358e1d4dc0a857a1dabb35776bebf9862a7f sched/alt: Fix/Enabled nohz_csd_func(), but not used.

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
