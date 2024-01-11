Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF1E23CD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 02:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYLFnZRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704939806; x=1736475806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Op67Bmdg+vMic7cj3YrkqZJlrIqxWf4lxQWh4oZleFU=;
  b=mYLFnZRgF6beJ5nNm2z7o2+ECI9SnjTOtyzcqXqk5yH9XyHGmh4an91k
   k4Mrl7SEkjra0PiGVerk7FbEBd4VRlZ8YHgIRFOLNWL6o8c4F/r+Bb65s
   6GoNhm0VSLAFhOJaat2+ymmTrk2ktcYICmuUsRIQqiaHecacXaesm3NQZ
   Yqzq8QQyZbGJAA0G64sUpX3b6Odb+AX7phGl3XBKOlL2evR0Qxh3nMFPl
   4k6WywsrTzN8JSSXJqTF/zaA+EWtdLC8ZBHfUd1eRbQ62sD9A+rOze/09
   rwRZ0FvMjB/cPzdU250rUu9PE3vUDbE2DUSJRib7BmrUPAUM8KOkmG4bl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="6076927"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="6076927"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 18:23:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="852799187"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="852799187"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jan 2024 18:23:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNkj2-0007iA-2w;
	Thu, 11 Jan 2024 02:23:20 +0000
Date: Thu, 11 Jan 2024 10:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/prjc 6/18] kernel/sched/alt_core.c:6031:3: error: cannot
 jump from this goto statement to its label
Message-ID: <202401111053.gc5prf8U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.7/prjc
head:   aacd4e2738ddc4e9c1a6df3f71954ce97922156d
commit: 951d9e192d389437b1f5a3e9504e893e196153e1 [6/18] sched/alt: [Sync] febe162d4d91 sched: Simplify syscalls
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240111/202401111053.gc5prf8U-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111053.gc5prf8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111053.gc5prf8U-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c:997:6: warning: no previous prototype for function 'resched_curr' [-Wmissing-prototypes]
     997 | void resched_curr(struct rq *rq)
         |      ^
   kernel/sched/alt_core.c:997:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     997 | void resched_curr(struct rq *rq)
         | ^
         | static 
   kernel/sched/alt_core.c:1020:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
    1020 | void resched_cpu(int cpu)
         |      ^
   kernel/sched/alt_core.c:1020:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1020 | void resched_cpu(int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:1035:6: warning: no previous prototype for function 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1035 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^
   kernel/sched/alt_core.c:1035:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1035 | void select_nohz_load_balancer(int stop_tick) {}
         | ^
         | static 
   kernel/sched/alt_core.c:1037:6: warning: no previous prototype for function 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1037 | void set_cpu_sd_state_idle(void) {}
         |      ^
   kernel/sched/alt_core.c:1037:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1037 | void set_cpu_sd_state_idle(void) {}
         | ^
         | static 
   kernel/sched/alt_core.c:1367:6: warning: no previous prototype for function 'hrtick_start' [-Wmissing-prototypes]
    1367 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^
   kernel/sched/alt_core.c:1367:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1367 | void hrtick_start(struct rq *rq, u64 delay)
         | ^
         | static 
   kernel/sched/alt_core.c:2516:6: warning: no previous prototype for function 'sched_ttwu_pending' [-Wmissing-prototypes]
    2516 | void sched_ttwu_pending(void *arg)
         |      ^
   kernel/sched/alt_core.c:2516:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2516 | void sched_ttwu_pending(void *arg)
         | ^
         | static 
   kernel/sched/alt_core.c:2559:6: warning: no previous prototype for function 'call_function_single_prep_ipi' [-Wmissing-prototypes]
    2559 | bool call_function_single_prep_ipi(int cpu)
         |      ^
   kernel/sched/alt_core.c:2559:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2559 | bool call_function_single_prep_ipi(int cpu)
         | ^
         | static 
>> kernel/sched/alt_core.c:6031:3: error: cannot jump from this goto statement to its label
    6031 |                 goto out_nounlock;
         |                 ^
   kernel/sched/alt_core.c:6033:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    6033 |         guard(rcu)();
         |         ^
   include/linux/cleanup.h:142:15: note: expanded from macro 'guard'
     142 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:63:1: note: expanded from here
      63 | __UNIQUE_ID_guard984
         | ^
   kernel/sched/alt_core.c:7189:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
    7189 | void idle_task_exit(void)
         |      ^
   kernel/sched/alt_core.c:7189:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7189 | void idle_task_exit(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7403:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
    7403 | int sched_cpu_activate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7403:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7403 | int sched_cpu_activate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7442:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7442 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7442:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7442 | int sched_cpu_deactivate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7505:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
    7505 | int sched_cpu_starting(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7505:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7505 | int sched_cpu_starting(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7525:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7525 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7525:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7525 | int sched_cpu_wait_empty(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7567:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
    7567 | int sched_cpu_dying(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7567:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7567 | int sched_cpu_dying(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7650:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
    7650 | void __init sched_init_smp(void)
         |             ^
   kernel/sched/alt_core.c:7650:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7650 | void __init sched_init_smp(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7710:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
    7710 | void __init sched_init(void)
         |             ^
   kernel/sched/alt_core.c:7710:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7710 | void __init sched_init(void)
         | ^
         | static 
   kernel/sched/alt_core.c:8066:20: warning: no previous prototype for function 'sched_create_group' [-Wmissing-prototypes]
    8066 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^
   kernel/sched/alt_core.c:8066:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    8066 | struct task_group *sched_create_group(struct task_group *parent)
         | ^
         | static 
   kernel/sched/alt_core.c:8077:6: warning: no previous prototype for function 'sched_online_group' [-Wmissing-prototypes]
    8077 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^
   kernel/sched/alt_core.c:8077:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    8077 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         | ^
         | static 
   kernel/sched/alt_core.c:8088:6: warning: no previous prototype for function 'sched_destroy_group' [-Wmissing-prototypes]
    8088 | void sched_destroy_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:8088:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    8088 | void sched_destroy_group(struct task_group *tg)
         | ^
         | static 
   kernel/sched/alt_core.c:8094:6: warning: no previous prototype for function 'sched_release_group' [-Wmissing-prototypes]
    8094 | void sched_release_group(struct task_group *tg)
         |      ^


vim +6031 kernel/sched/alt_core.c

9f08fc0c802aa6 Alfred Chen    2019-08-19  6017  
9f08fc0c802aa6 Alfred Chen    2019-08-19  6018  /**
9f08fc0c802aa6 Alfred Chen    2019-08-19  6019   * sys_sched_getscheduler - get the policy (scheduling class) of a thread
9f08fc0c802aa6 Alfred Chen    2019-08-19  6020   * @pid: the pid in question.
9f08fc0c802aa6 Alfred Chen    2019-08-19  6021   *
9f08fc0c802aa6 Alfred Chen    2019-08-19  6022   * Return: On success, the policy of the thread. Otherwise, a negative error
9f08fc0c802aa6 Alfred Chen    2019-08-19  6023   * code.
9f08fc0c802aa6 Alfred Chen    2019-08-19  6024   */
9f08fc0c802aa6 Alfred Chen    2019-08-19  6025  SYSCALL_DEFINE1(sched_getscheduler, pid_t, pid)
9f08fc0c802aa6 Alfred Chen    2019-08-19  6026  {
9f08fc0c802aa6 Alfred Chen    2019-08-19  6027  	struct task_struct *p;
9f08fc0c802aa6 Alfred Chen    2019-08-19  6028  	int retval = -EINVAL;
9f08fc0c802aa6 Alfred Chen    2019-08-19  6029  
9f08fc0c802aa6 Alfred Chen    2019-08-19  6030  	if (pid < 0)
9f08fc0c802aa6 Alfred Chen    2019-08-19 @6031  		goto out_nounlock;
9f08fc0c802aa6 Alfred Chen    2019-08-19  6032  
951d9e192d3894 Steven Barrett 2024-01-07  6033  	guard(rcu)();
9f08fc0c802aa6 Alfred Chen    2019-08-19  6034  	p = find_process_by_pid(pid);
951d9e192d3894 Steven Barrett 2024-01-07  6035  	if (!p)
951d9e192d3894 Steven Barrett 2024-01-07  6036  		return -ESRCH;
951d9e192d3894 Steven Barrett 2024-01-07  6037  
9f08fc0c802aa6 Alfred Chen    2019-08-19  6038  	retval = security_task_getscheduler(p);
951d9e192d3894 Steven Barrett 2024-01-07  6039  	if (!retval) {
9f08fc0c802aa6 Alfred Chen    2019-08-19  6040  		retval = p->policy;
9f08fc0c802aa6 Alfred Chen    2019-08-19  6041  	}
9f08fc0c802aa6 Alfred Chen    2019-08-19  6042  
9f08fc0c802aa6 Alfred Chen    2019-08-19  6043  out_nounlock:
9f08fc0c802aa6 Alfred Chen    2019-08-19  6044  	return retval;
9f08fc0c802aa6 Alfred Chen    2019-08-19  6045  }
9f08fc0c802aa6 Alfred Chen    2019-08-19  6046  

:::::: The code at line 6031 was first introduced by commit
:::::: 9f08fc0c802aa60b849cb326294a06f38abaa0b0 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
