Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C7246444
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727631362; cv=none; b=bcP+sCU3rlIoo/yTNCTU3wierkGHy/jlsXxyAeReVDvR50MOyrIpJsXnFxv7RBHRQ40dd2Ac1ocpqfnArxdSC48pAPYUS5w3PQIOW6z+6JyisIz7KtrQQWf0NzRd2m/hbeA9Wg0KdMfy3/bCb2cF3CQ1UbZC+NtN4zkJJ3TgEIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727631362; c=relaxed/simple;
	bh=JHxHjPtKvQLBfc0pJRcpueIgf6saleEfEH8mMI5n2k8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qy6V6s9VGberOKkLrcHcRbV/0O5PPIS7DKcWAK4NsNhJc79p2pKiO3eYkF+BHp7u0CAF8BtLcC2mCJPD3EP4JK1HNrC6JkHC64RVLWJEEqmFPuVX0ZWbeigLfkOmp4S+rwO2cCgO7rhwzqtaplouCNNc5S7l2h4rhhZW2rmBIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2NZD34w; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2NZD34w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727631360; x=1759167360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JHxHjPtKvQLBfc0pJRcpueIgf6saleEfEH8mMI5n2k8=;
  b=h2NZD34w6kvhseJ/1IMpzi72QH6FU/RdqVnqwo4bEcdsVw8SB6mnJuVH
   MnHVqOrePHOyhUaJ37SoI94OYpYEghY8nEIkTP5zC16ebOUGxeIKlIBST
   QbbK6bMDa8L6TOiYh7mIgq9uceOv8TJMqyi+Hx9BPAhLjtrhBWnRjYSGC
   NieKEbdDDFYXgia5tZIUi84zm3eLpu9CfMdJd3rjBnZueGqF2qtpGwTM7
   fbXK4wC94hyaaTEXxmokCOmXwHVhTZXTxOh4BYyAISEOx7LCi9PCB1H4D
   l9712FZHIXgsT31A4ulNqXJ2x4CDJSNdcdH93f3Yzlqb4FRvqenwD+gkS
   w==;
X-CSE-ConnectionGUID: /UeRNgEjReSTq/dI7745Dg==
X-CSE-MsgGUID: fsRYBIAtQaurek8NKv6/Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="52132967"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="52132967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:35:59 -0700
X-CSE-ConnectionGUID: niMAs2/KR7uE96zQ2FBsLQ==
X-CSE-MsgGUID: jxweQAAJQEGAgptP95SYeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="78014677"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Sep 2024 10:35:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suxpa-000OVr-2Z;
	Sun, 29 Sep 2024 17:35:38 +0000
Date: Mon, 30 Sep 2024 01:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.11/prjc 389/496] kernel/sched/alt_core.c:2094:1: warning: the
 frame size of 2072 bytes is larger than 2048 bytes
Message-ID: <202409300137.AE1LfEQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.11/prjc
head:   c99096535f5f9bbfdb0eb6bdd57d0634fc12e385
commit: 4ee84fe8dba57cecd4942e2c847405bd52a12133 [389/496] sched/alt: [Sync] 2ef269ef1ac0 cgroup/cpuset: Free DL BW in case can_attach() fails
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240930/202409300137.AE1LfEQS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300137.AE1LfEQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300137.AE1LfEQS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1007:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
    1007 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:1030:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
    1030 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1045:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1045 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1047:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1047 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1376:6: warning: no previous prototype for 'hrtick_start' [-Wmissing-prototypes]
    1376 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'set_task_cpu':
   kernel/sched/alt_core.c:1565:17: error: implicit declaration of function 'rseq_migrate'; did you mean 'cant_migrate'? [-Werror=implicit-function-declaration]
    1565 |                 rseq_migrate(p);
         |                 ^~~~~~~~~~~~
         |                 cant_migrate
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:2521:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2521 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2564:6: warning: no previous prototype for 'call_function_single_prep_ipi' [-Wmissing-prototypes]
    2564 | bool call_function_single_prep_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:3349:35: error: initialization of 'int (*)(const struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(const struct ctl_table *, int,  void *, long unsigned int *, long long int *)'} from incompatible pointer type 'int (*)(struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(struct ctl_table *, int,  void *, long unsigned int *, long long int *)'} [-Werror=incompatible-pointer-types]
    3349 |                 .proc_handler   = sysctl_schedstats,
         |                                   ^~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:3349:35: note: (near initialization for 'sched_core_sysctls[0].proc_handler')
   kernel/sched/alt_core.c: In function 'prepare_task_switch':
   kernel/sched/alt_core.c:3697:9: error: implicit declaration of function 'rseq_preempt' [-Werror=implicit-function-declaration]
    3697 |         rseq_preempt(prev);
         |         ^~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:4147:6: warning: no previous prototype for 'scheduler_tick' [-Wmissing-prototypes]
    4147 | void scheduler_tick(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7185:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
    7185 | void idle_task_exit(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7397:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    7397 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7436:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7436 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7499:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7499 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7519:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7519 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7561:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7561 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7644:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7644 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7704:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7704 | void __init sched_init(void)
         |             ^~~~~~~~~~
   kernel/sched/alt_core.c:8060:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    8060 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8071:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    8071 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8082:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    8082 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8088:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    8088 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8156:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    8156 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8226:27: warning: initialized field overwritten [-Woverride-init]
    8226 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8226:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
   kernel/sched/alt_core.c: In function 'sched_mm_cid_after_execve':
   kernel/sched/alt_core.c:8754:9: error: implicit declaration of function 'rseq_set_notify_resume'; did you mean 'uprobe_notify_resume'? [-Werror=implicit-function-declaration]
    8754 |         rseq_set_notify_resume(t);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         uprobe_notify_resume
   kernel/sched/alt_core.c: In function 'select_task_rq':
>> kernel/sched/alt_core.c:2094:1: warning: the frame size of 2072 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    2094 | }
         | ^
   cc1: some warnings being treated as errors


vim +2094 kernel/sched/alt_core.c

2a2a9e3f81ca79 Alfred Chen 2022-12-21  2077  
f970f460ea5f1e Alfred Chen 2021-05-24  2078  static inline int select_task_rq(struct task_struct *p)
ce5a2e79cb434d Alfred Chen 2019-08-19  2079  {
2a2a9e3f81ca79 Alfred Chen 2022-12-21  2080  	cpumask_t allow_mask, mask;
ce5a2e79cb434d Alfred Chen 2019-08-19  2081  
2a2a9e3f81ca79 Alfred Chen 2022-12-21  2082  	if (unlikely(!cpumask_and(&allow_mask, p->cpus_ptr, cpu_active_mask)))
ce5a2e79cb434d Alfred Chen 2019-08-19  2083  		return select_fallback_rq(task_cpu(p), p);
ce5a2e79cb434d Alfred Chen 2019-08-19  2084  
ce5a2e79cb434d Alfred Chen 2019-08-19  2085  	if (
ce5a2e79cb434d Alfred Chen 2019-08-19  2086  #ifdef CONFIG_SCHED_SMT
2a2a9e3f81ca79 Alfred Chen 2022-12-21  2087  	    cpumask_and(&mask, &allow_mask, &sched_sg_idle_mask) ||
ce5a2e79cb434d Alfred Chen 2019-08-19  2088  #endif
2a2a9e3f81ca79 Alfred Chen 2022-12-21  2089  	    cpumask_and(&mask, &allow_mask, sched_idle_mask) ||
2a2a9e3f81ca79 Alfred Chen 2022-12-21  2090  	    preempt_mask_check(p, &allow_mask, &mask))
2a2a9e3f81ca79 Alfred Chen 2022-12-21  2091  		return best_mask_cpu(task_cpu(p), &mask);
ce5a2e79cb434d Alfred Chen 2019-08-19  2092  
2a2a9e3f81ca79 Alfred Chen 2022-12-21  2093  	return best_mask_cpu(task_cpu(p), &allow_mask);
ce5a2e79cb434d Alfred Chen 2019-08-19 @2094  }
ce5a2e79cb434d Alfred Chen 2019-08-19  2095  

:::::: The code at line 2094 was first introduced by commit
:::::: ce5a2e79cb434dd19c9e68f22d13090d097e8731 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
