Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFACA137A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693140092; x=1724676092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U8ZIad6wTSeEvPchMfFATqBwkryuD+yAzA92o4Qn8AQ=;
  b=jaVigiw+Y5FOWFE+AKrxBqKk81vxsxVE6/oPFa1eld5+RmjWR2WuAa+q
   EHqQtdubUQ69Y+UO5/QDT0wD1MSYD2EHhFDKgOc+8z/SBAD53BQB8Izr9
   Ec/A+XqAIwrWRglQnYRYTlO+s+l69B3/P4GVZ8qSS7mm4iZ4DDUA6Q79H
   D5MVnHNllJAdLLZzJV5OFST3lspwouDitjmePrT1FkWyS2pVpAH/5wboY
   N3wz3EgzSvm/N2p1nWLhh5x/TsYsISUN1PHqJrTzmXm0cb6qB6UkhmMDY
   X78DsraEJ9h79EUyPbzeZGSEw+PLYfWqn0bHNhhC5U7NrKFyGJrI6Ugh8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="461306859"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="461306859"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 05:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="741094182"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="741094182"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Aug 2023 05:41:30 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaF51-0005mt-1T;
	Sun, 27 Aug 2023 12:41:25 +0000
Date: Sun, 27 Aug 2023 20:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 2/11]
 kernel/rcu/tree_plugin.h:1192:28: warning: unused variable 'sp'
Message-ID: <202308272028.Pnq6w3Mg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   2fb1bbc283d33b7edd57b0279c54d0250d91e9f3
commit: 029b407f286d7bc9a7ace79c65483efa8ead8671 [2/11] rcu: Use a new sched_set_rcu_fifo() to set gp kthread prio
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230827/202308272028.Pnq6w3Mg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308272028.Pnq6w3Mg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308272028.Pnq6w3Mg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5017:
   kernel/rcu/tree_plugin.h: In function 'rcu_spawn_one_boost_kthread':
>> kernel/rcu/tree_plugin.h:1192:28: warning: unused variable 'sp' [-Wunused-variable]
    1192 |         struct sched_param sp;
         |                            ^~


vim +/sp +1192 kernel/rcu/tree_plugin.h

27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1183  
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1184  /*
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1185   * Create an RCU-boost kthread for the specified node if one does not
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1186   * already exist.  We only create this kthread for preemptible RCU.
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1187   */
3545832fc22e23 kernel/rcu/tree_plugin.h Byungchul Park   2019-07-01  1188  static void rcu_spawn_one_boost_kthread(struct rcu_node *rnp)
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1189  {
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1190  	unsigned long flags;
3ef5a1c3821ab6 kernel/rcu/tree_plugin.h Paul E. McKenney 2021-04-05  1191  	int rnp_index = rnp - rcu_get_root();
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07 @1192  	struct sched_param sp;
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1193  	struct task_struct *t;
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1194  
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1195  	mutex_lock(&rnp->boost_kthread_mutex);
3ef5a1c3821ab6 kernel/rcu/tree_plugin.h Paul E. McKenney 2021-04-05  1196  	if (rnp->boost_kthread_task || !rcu_scheduler_fully_active)
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1197  		goto out;
3545832fc22e23 kernel/rcu/tree_plugin.h Byungchul Park   2019-07-01  1198  
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1199  	t = kthread_create(rcu_boost_kthread, (void *)rnp,
5b61b0baa9e802 kernel/rcutree_plugin.h  Mike Galbraith   2011-08-19  1200  			   "rcub/%d", rnp_index);
3545832fc22e23 kernel/rcu/tree_plugin.h Byungchul Park   2019-07-01  1201  	if (WARN_ON_ONCE(IS_ERR(t)))
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1202  		goto out;
3545832fc22e23 kernel/rcu/tree_plugin.h Byungchul Park   2019-07-01  1203  
2a67e741bbbc02 kernel/rcu/tree_plugin.h Peter Zijlstra   2015-10-08  1204  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1205  	rnp->boost_kthread_task = t;
67c583a7de3433 kernel/rcu/tree_plugin.h Boqun Feng       2015-12-29  1206  	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
029b407f286d7b kernel/rcu/tree_plugin.h Qais Yousef      2020-07-23  1207  	rcu_set_gp_prio(t);
9a432736904d38 kernel/rcutree_plugin.h  Paul E. McKenney 2011-05-30  1208  	wake_up_process(t); /* get to TASK_INTERRUPTIBLE quickly. */
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1209  
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1210   out:
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1211  	mutex_unlock(&rnp->boost_kthread_mutex);
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1212  }
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1213  

:::::: The code at line 1192 was first introduced by commit
:::::: 27f4d28057adf98750cf863c40baefb12f5b6d21 rcu: priority boosting for TREE_PREEMPT_RCU

:::::: TO: Paul E. McKenney <paul.mckenney@linaro.org>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
