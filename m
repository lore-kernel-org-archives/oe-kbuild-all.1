Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3ED187B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 04:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689482838; x=1721018838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XAGg7LIgOoD+qUtsh0j7uxTQh7pD0sQuZYbCxtmK20=;
  b=JAPkHWmIAtDpHSDVkRrraEyQ0bjmj/zvuA00cY1Gpw37QMYggz5MTjSN
   C1frm95IWCJcozp7oDVu6oU1oNkaeimc9zN2iBhBxqVuLS5esFmz3vPLp
   f+yW8W9YcKBNsUdqD3ne6bvpDcxBpxaM7IOk7pOI/aaSYHRfyCrnlO5q2
   U5OdhhiSt8+2JoPMwW3OeCLHJiU/7WqgN4mgqIiQjCe217qeuuChckoMA
   XcDe+X+gst970sKHTtlFNgoynB21IM2JvAHC9ulkjuPJIn3OjlWjqEsYi
   lPPT5qv2mQT6bIqZSVh+HWl5CKZid7y6L46lrDAe/1YGEN/WS2W8UY+rb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="365771396"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="365771396"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="1053512684"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="1053512684"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jul 2023 21:47:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKtf8-0008aJ-0O;
	Sun, 16 Jul 2023 04:47:14 +0000
Date: Sun, 16 Jul 2023 12:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 6/6] kernel/rcu/tree.c:4612:9:
 error: implicit declaration of function 'sched_setscheduler_nocheck'
Message-ID: <202307161247.RuzBG3ZC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   40f87f6acda90270ee3eb284cbd13a8751ac4e61
commit: 40f87f6acda90270ee3eb284cbd13a8751ac4e61 [6/6] sched: Make sched_set{scheduler, attr}() static
config: microblaze-randconfig-r016-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161247.RuzBG3ZC-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161247.RuzBG3ZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161247.RuzBG3ZC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/tree.c: In function 'rcu_start_exp_gp_kworkers':
>> kernel/rcu/tree.c:4612:9: error: implicit declaration of function 'sched_setscheduler_nocheck' [-Werror=implicit-function-declaration]
    4612 |         sched_setscheduler_nocheck(rcu_exp_gp_kworker->task, SCHED_FIFO, &param);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:5017:
   kernel/rcu/tree_plugin.h: In function 'rcu_spawn_one_boost_kthread':
   kernel/rcu/tree_plugin.h:1192:28: warning: unused variable 'sp' [-Wunused-variable]
    1192 |         struct sched_param sp;
         |                            ^~
   cc1: some warnings being treated as errors


vim +/sched_setscheduler_nocheck +4612 kernel/rcu/tree.c

9621fbee44df94 Kalesh Singh 2022-04-08  4592  
9621fbee44df94 Kalesh Singh 2022-04-08  4593  static void __init rcu_start_exp_gp_kworkers(void)
9621fbee44df94 Kalesh Singh 2022-04-08  4594  {
9621fbee44df94 Kalesh Singh 2022-04-08  4595  	const char *par_gp_kworker_name = "rcu_exp_par_gp_kthread_worker";
9621fbee44df94 Kalesh Singh 2022-04-08  4596  	const char *gp_kworker_name = "rcu_exp_gp_kthread_worker";
9621fbee44df94 Kalesh Singh 2022-04-08  4597  	struct sched_param param = { .sched_priority = kthread_prio };
9621fbee44df94 Kalesh Singh 2022-04-08  4598  
9621fbee44df94 Kalesh Singh 2022-04-08  4599  	rcu_exp_gp_kworker = kthread_create_worker(0, gp_kworker_name);
9621fbee44df94 Kalesh Singh 2022-04-08  4600  	if (IS_ERR_OR_NULL(rcu_exp_gp_kworker)) {
9621fbee44df94 Kalesh Singh 2022-04-08  4601  		pr_err("Failed to create %s!\n", gp_kworker_name);
9621fbee44df94 Kalesh Singh 2022-04-08  4602  		return;
9621fbee44df94 Kalesh Singh 2022-04-08  4603  	}
9621fbee44df94 Kalesh Singh 2022-04-08  4604  
9621fbee44df94 Kalesh Singh 2022-04-08  4605  	rcu_exp_par_gp_kworker = kthread_create_worker(0, par_gp_kworker_name);
9621fbee44df94 Kalesh Singh 2022-04-08  4606  	if (IS_ERR_OR_NULL(rcu_exp_par_gp_kworker)) {
9621fbee44df94 Kalesh Singh 2022-04-08  4607  		pr_err("Failed to create %s!\n", par_gp_kworker_name);
9621fbee44df94 Kalesh Singh 2022-04-08  4608  		kthread_destroy_worker(rcu_exp_gp_kworker);
9621fbee44df94 Kalesh Singh 2022-04-08  4609  		return;
9621fbee44df94 Kalesh Singh 2022-04-08  4610  	}
9621fbee44df94 Kalesh Singh 2022-04-08  4611  
9621fbee44df94 Kalesh Singh 2022-04-08 @4612  	sched_setscheduler_nocheck(rcu_exp_gp_kworker->task, SCHED_FIFO, &param);
9621fbee44df94 Kalesh Singh 2022-04-08  4613  	sched_setscheduler_nocheck(rcu_exp_par_gp_kworker->task, SCHED_FIFO,
9621fbee44df94 Kalesh Singh 2022-04-08  4614  				   &param);
9621fbee44df94 Kalesh Singh 2022-04-08  4615  }
9621fbee44df94 Kalesh Singh 2022-04-08  4616  

:::::: The code at line 4612 was first introduced by commit
:::::: 9621fbee44df940e2e1b94b0676460a538dffefa rcu: Move expedited grace period (GP) work to RT kthread_worker

:::::: TO: Kalesh Singh <kaleshsingh@google.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
