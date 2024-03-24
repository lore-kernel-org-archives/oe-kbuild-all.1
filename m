Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF201863F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711293703; cv=none; b=l9AvhceaZdaIH7addlWddp9pbhdsmNRxtNV2EkqreY+2gfbFJCDrlxky0u5lzs1yVSGsc5V4qGo8SzE1jrGkTVMzJt6mZ7JRucueuppNFCTZv7s3XTulyskKdVxdKBkhgi63NPl/fcFdi0/enKrDa9pgWDcYFdRnyQ/Y9EgtaGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711293703; c=relaxed/simple;
	bh=4TDhkJKOFH+0Sw+NGQtzezFs6l8/AaFG2Nj6beiFQPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h83GX+y0AGyOJLpkOKRxY4KmrtSuudsWCXxH8wIY7bXSfLjPjOJ2JOK8pFncwnuWdy5gd6C7scETnk6t5JPdCK6yqbqiDFjOqbjpgQWE4XfTlkes595hU+02HFNS/FkUhITmw6/HwsLZ3KFAgxbQ3g9A6FN/I1JV5bisByt5Yfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=id6eo0zl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="id6eo0zl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711293700; x=1742829700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4TDhkJKOFH+0Sw+NGQtzezFs6l8/AaFG2Nj6beiFQPM=;
  b=id6eo0zlFyrazetBX1i1sD2xE0wZwhjb5AzeorePiJDs50nivGJoaqBi
   heCCiDuV04ffzYfb4Ss4+QDDNhz18rLifuD1BQ/WB3q0GtNCNQYF7IAXF
   1SCzUY67VU3E8YcTkPqFUkCaMngjwokSuPqJ/QRqTrLctvSRYGyVdMs6O
   0VWxYG3fdirVbcdb2wSyV57iLdjizTU2TFGp/N2qKHTZvEhOI30sHwOwh
   WZk2szo5+JL/NJIgIGIlCc/99HZHWpsuzhFg4ajSiCMl1zPHRIzPxZN4S
   ar2rIiEgjRJ+IAi2cuikW0Vsd0SxCNoMHrmeJ+UxJaJ9fLsmLNaevayBB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6398608"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="6398608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 08:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="15455439"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Mar 2024 08:21:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roPfD-000Lst-2N;
	Sun, 24 Mar 2024 15:21:35 +0000
Date: Sun, 24 Mar 2024 23:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/main 339/3386] kernel/sched/alt_core.c:4421:17: error:
 implicit declaration of function 'hrtick_start'; did you mean
 'hrtimer_start'?
Message-ID: <202403242301.PdcKymie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.7/main
head:   56c7820d4581e633d4d3a9015a5c45d9f4f67b01
commit: ebaeb5047fbecd36cfc083ac68656600eb52e1d2 [339/3386] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240324/202403242301.PdcKymie-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403242301.PdcKymie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403242301.PdcKymie-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/alt_core.c:42:
   kernel/sched/alt_sched.h:481:42: warning: 'struct cpuidle_state' declared inside parameter list will not be visible outside of this definition or declaration
     481 |                                   struct cpuidle_state *idle_state)
         |                                          ^~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'update_rq_clock':
   kernel/sched/alt_core.c:578:21: error: implicit declaration of function 'sched_clock_cpu' [-Werror=implicit-function-declaration]
     578 |         s64 delta = sched_clock_cpu(cpu_of(rq)) - rq->clock;
         |                     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
     966 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
     989 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'scheduler_tick':
   kernel/sched/alt_core.c:3894:9: error: implicit declaration of function 'sched_clock_tick'; did you mean 'scheduler_tick'? [-Werror=implicit-function-declaration]
    3894 |         sched_clock_tick();
         |         ^~~~~~~~~~~~~~~~
         |         scheduler_tick
   kernel/sched/alt_core.c: In function 'choose_next_task':
>> kernel/sched/alt_core.c:4421:17: error: implicit declaration of function 'hrtick_start'; did you mean 'hrtimer_start'? [-Werror=implicit-function-declaration]
    4421 |                 hrtick_start(rq, next->time_slice);
         |                 ^~~~~~~~~~~~
         |                 hrtimer_start
   kernel/sched/alt_core.c: In function '__schedule':
   kernel/sched/alt_core.c:4558:49: error: 'PF_FROZEN' undeclared (first use in this function); did you mean 'PF_ROSE'?
    4558 |                                 !(prev->flags & PF_FROZEN);
         |                                                 ^~~~~~~~~
         |                                                 PF_ROSE
   kernel/sched/alt_core.c:4558:49: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/alt_core.c: In function 'sched_submit_work':
   kernel/sched/alt_core.c:4674:13: error: implicit declaration of function 'tsk_is_pi_blocked'; did you mean 'osq_is_locked'? [-Werror=implicit-function-declaration]
    4674 |         if (tsk_is_pi_blocked(tsk))
         |             ^~~~~~~~~~~~~~~~~
         |             osq_is_locked
   kernel/sched/alt_core.c: In function '__sched_setscheduler':
   kernel/sched/alt_core.c:5357:17: error: implicit declaration of function 'cpuset_read_lock'; did you mean 'cpus_read_lock'? [-Werror=implicit-function-declaration]
    5357 |                 cpuset_read_lock();
         |                 ^~~~~~~~~~~~~~~~
         |                 cpus_read_lock
   kernel/sched/alt_core.c:5405:25: error: implicit declaration of function 'cpuset_read_unlock'; did you mean 'cpus_read_unlock'? [-Werror=implicit-function-declaration]
    5405 |                         cpuset_read_unlock();
         |                         ^~~~~~~~~~~~~~~~~~
         |                         cpus_read_unlock
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:7238:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7238 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7278 | void __init sched_init(void)
         |             ^~~~~~~~~~
   kernel/sched/alt_core.c:7633:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7644:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7655:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    7655 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7661:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    7661 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7731:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    7731 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7800:27: warning: initialized field overwritten [-Woverride-init]
    7800 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7800:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
   cc1: some warnings being treated as errors


vim +4421 kernel/sched/alt_core.c

9f08fc0c802aa6 Alfred Chen 2019-08-19  4399  
9f08fc0c802aa6 Alfred Chen 2019-08-19  4400  static inline struct task_struct *
9f08fc0c802aa6 Alfred Chen 2019-08-19  4401  choose_next_task(struct rq *rq, int cpu, struct task_struct *prev)
9f08fc0c802aa6 Alfred Chen 2019-08-19  4402  {
9f08fc0c802aa6 Alfred Chen 2019-08-19  4403  	struct task_struct *next;
9f08fc0c802aa6 Alfred Chen 2019-08-19  4404  
9f08fc0c802aa6 Alfred Chen 2019-08-19  4405  	if (unlikely(rq->skip)) {
9f08fc0c802aa6 Alfred Chen 2019-08-19  4406  		next = rq_runnable_task(rq);
9f08fc0c802aa6 Alfred Chen 2019-08-19  4407  		if (next == rq->idle) {
9f08fc0c802aa6 Alfred Chen 2019-08-19  4408  #ifdef	CONFIG_SMP
9f08fc0c802aa6 Alfred Chen 2019-08-19  4409  			if (!take_other_rq_tasks(rq, cpu)) {
9f08fc0c802aa6 Alfred Chen 2019-08-19  4410  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19  4411  				rq->skip = NULL;
9f08fc0c802aa6 Alfred Chen 2019-08-19  4412  				schedstat_inc(rq->sched_goidle);
9f08fc0c802aa6 Alfred Chen 2019-08-19  4413  				return next;
9f08fc0c802aa6 Alfred Chen 2019-08-19  4414  #ifdef	CONFIG_SMP
9f08fc0c802aa6 Alfred Chen 2019-08-19  4415  			}
9f08fc0c802aa6 Alfred Chen 2019-08-19  4416  			next = rq_runnable_task(rq);
9f08fc0c802aa6 Alfred Chen 2019-08-19  4417  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19  4418  		}
9f08fc0c802aa6 Alfred Chen 2019-08-19  4419  		rq->skip = NULL;
9f08fc0c802aa6 Alfred Chen 2019-08-19  4420  #ifdef CONFIG_HIGH_RES_TIMERS
9f08fc0c802aa6 Alfred Chen 2019-08-19 @4421  		hrtick_start(rq, next->time_slice);
9f08fc0c802aa6 Alfred Chen 2019-08-19  4422  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19  4423  		return next;
9f08fc0c802aa6 Alfred Chen 2019-08-19  4424  	}
9f08fc0c802aa6 Alfred Chen 2019-08-19  4425  
9f08fc0c802aa6 Alfred Chen 2019-08-19  4426  	next = sched_rq_first_task(rq);
9f08fc0c802aa6 Alfred Chen 2019-08-19  4427  	if (next == rq->idle) {
9f08fc0c802aa6 Alfred Chen 2019-08-19  4428  #ifdef	CONFIG_SMP
9f08fc0c802aa6 Alfred Chen 2019-08-19  4429  		if (!take_other_rq_tasks(rq, cpu)) {
9f08fc0c802aa6 Alfred Chen 2019-08-19  4430  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19  4431  			schedstat_inc(rq->sched_goidle);
ea649f245b5cf1 Alfred Chen 2020-08-09  4432  			/*printk(KERN_INFO "sched: choose_next_task(%d) idle %px\n", cpu, next);*/
9f08fc0c802aa6 Alfred Chen 2019-08-19  4433  			return next;
9f08fc0c802aa6 Alfred Chen 2019-08-19  4434  #ifdef	CONFIG_SMP
9f08fc0c802aa6 Alfred Chen 2019-08-19  4435  		}
9f08fc0c802aa6 Alfred Chen 2019-08-19  4436  		next = sched_rq_first_task(rq);
9f08fc0c802aa6 Alfred Chen 2019-08-19  4437  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19  4438  	}
9f08fc0c802aa6 Alfred Chen 2019-08-19  4439  #ifdef CONFIG_HIGH_RES_TIMERS
9f08fc0c802aa6 Alfred Chen 2019-08-19  4440  	hrtick_start(rq, next->time_slice);
9f08fc0c802aa6 Alfred Chen 2019-08-19  4441  #endif
ea649f245b5cf1 Alfred Chen 2020-08-09  4442  	/*printk(KERN_INFO "sched: choose_next_task(%d) next %px\n", cpu,
ea649f245b5cf1 Alfred Chen 2020-08-09  4443  	 * next);*/
9f08fc0c802aa6 Alfred Chen 2019-08-19  4444  	return next;
9f08fc0c802aa6 Alfred Chen 2019-08-19  4445  }
9f08fc0c802aa6 Alfred Chen 2019-08-19  4446  

:::::: The code at line 4421 was first introduced by commit
:::::: 9f08fc0c802aa60b849cb326294a06f38abaa0b0 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
