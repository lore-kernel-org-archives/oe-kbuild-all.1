Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AA91876
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 04:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689483499; x=1721019499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u61T4lLe154yGIGcqnO4Sd9cmws5wqoW0p/+rMGJg/U=;
  b=U6Ej0odZuFZvF/x5eMt9yaNR97cpeD7y4qTayMIqx1krqdvb3sdkOyt/
   lWLkuri7CnDBf5+yrf41dygb4EDIIGaC24Mdj7T48saxdYQpL8fkls9l7
   dMKJ4NXYkpusMauQhSm0IMrLpEdH5ZZCcKhesNrqgDaeytCokNlvWOUBF
   ECij4MV5Au5TzORx+SS6WSWPJyomSmkE3NBGuyRIXs+ho0DUMZi58VeJs
   EzKEVM+BGVSmwIpo27RkA+5Uzlowyx0p7qDhiu1D8Rf5vkO7KZJODav90
   XnlTYr/PpUM0C5/wokucyUsrz3O+KSO0a8gOSwb1kCIwxeTkkyt4XUyqT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368371599"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="368371599"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="722832799"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="722832799"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Jul 2023 21:58:15 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKtpm-0008b7-1e;
	Sun, 16 Jul 2023 04:58:14 +0000
Date: Sun, 16 Jul 2023 12:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 6/6]
 kernel/rcu/tree_nocb.h:1514:25: error: implicit declaration of function
 'sched_setscheduler_nocheck'
Message-ID: <202307161225.U4eGaNAx-lkp@intel.com>
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
config: csky-randconfig-r025-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161225.U4eGaNAx-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161225.U4eGaNAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161225.U4eGaNAx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5016:
   kernel/rcu/tree_nocb.h: In function 'rcu_spawn_cpu_nocb_kthread':
>> kernel/rcu/tree_nocb.h:1514:25: error: implicit declaration of function 'sched_setscheduler_nocheck' [-Werror=implicit-function-declaration]
    1514 |                         sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sched_setscheduler_nocheck +1514 kernel/rcu/tree_nocb.h

dfcb27540213e8 Frederic Weisbecker     2021-05-19  1481  
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1482  /*
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1483   * If the specified CPU is a no-CBs CPU that does not already have its
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1484   * rcuo CB kthread, spawn it.  Additionally, if the rcuo GP kthread
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1485   * for this CPU's group has not yet been created, spawn it as well.
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1486   */
10d4703154a72f Frederic Weisbecker     2021-11-23  1487  static void rcu_spawn_cpu_nocb_kthread(int cpu)
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1488  {
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1489  	struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1490  	struct rcu_data *rdp_gp;
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1491  	struct task_struct *t;
54577e23fa0791 Alison Chaiken          2022-01-11  1492  	struct sched_param sp;
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1493  
8d2aaa9b7c290e Frederic Weisbecker     2022-02-14  1494  	if (!rcu_scheduler_fully_active || !rcu_state.nocb_is_setup)
10d4703154a72f Frederic Weisbecker     2021-11-23  1495  		return;
10d4703154a72f Frederic Weisbecker     2021-11-23  1496  
2cf4528d6dd6f5 Frederic Weisbecker     2021-11-23  1497  	/* If there already is an rcuo kthread, then nothing to do. */
2cf4528d6dd6f5 Frederic Weisbecker     2021-11-23  1498  	if (rdp->nocb_cb_kthread)
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1499  		return;
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1500  
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1501  	/* If we didn't spawn the GP kthread first, reorganize! */
54577e23fa0791 Alison Chaiken          2022-01-11  1502  	sp.sched_priority = kthread_prio;
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1503  	rdp_gp = rdp->nocb_gp_rdp;
02e3024175274e Neeraj Upadhyay         2021-12-11  1504  	mutex_lock(&rdp_gp->nocb_gp_kthread_mutex);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1505  	if (!rdp_gp->nocb_gp_kthread) {
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1506  		t = kthread_run(rcu_nocb_gp_kthread, rdp_gp,
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1507  				"rcuog/%d", rdp_gp->cpu);
02e3024175274e Neeraj Upadhyay         2021-12-11  1508  		if (WARN_ONCE(IS_ERR(t), "%s: Could not start rcuo GP kthread, OOM is now expected behavior\n", __func__)) {
02e3024175274e Neeraj Upadhyay         2021-12-11  1509  			mutex_unlock(&rdp_gp->nocb_gp_kthread_mutex);
3a5761dc025da4 Zqiang                  2022-04-19  1510  			goto end;
02e3024175274e Neeraj Upadhyay         2021-12-11  1511  		}
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1512  		WRITE_ONCE(rdp_gp->nocb_gp_kthread, t);
54577e23fa0791 Alison Chaiken          2022-01-11  1513  		if (kthread_prio)
54577e23fa0791 Alison Chaiken          2022-01-11 @1514  			sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1515  	}
02e3024175274e Neeraj Upadhyay         2021-12-11  1516  	mutex_unlock(&rdp_gp->nocb_gp_kthread_mutex);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1517  
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1518  	/* Spawn the kthread for this CPU. */
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1519  	t = kthread_run(rcu_nocb_cb_kthread, rdp,
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1520  			"rcuo%c/%d", rcu_state.abbr, cpu);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1521  	if (WARN_ONCE(IS_ERR(t), "%s: Could not start rcuo CB kthread, OOM is now expected behavior\n", __func__))
3a5761dc025da4 Zqiang                  2022-04-19  1522  		goto end;
c8b16a65267e35 Alison Chaiken          2022-01-11  1523  
8f489b4da5278f Uladzislau Rezki (Sony  2022-05-11  1524) 	if (IS_ENABLED(CONFIG_RCU_NOCB_CPU_CB_BOOST) && kthread_prio)
c8b16a65267e35 Alison Chaiken          2022-01-11  1525  		sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
8f489b4da5278f Uladzislau Rezki (Sony  2022-05-11  1526) 
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1527  	WRITE_ONCE(rdp->nocb_cb_kthread, t);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1528  	WRITE_ONCE(rdp->nocb_gp_kthread, rdp_gp->nocb_gp_kthread);
3a5761dc025da4 Zqiang                  2022-04-19  1529  	return;
3a5761dc025da4 Zqiang                  2022-04-19  1530  end:
3a5761dc025da4 Zqiang                  2022-04-19  1531  	mutex_lock(&rcu_state.barrier_mutex);
3a5761dc025da4 Zqiang                  2022-04-19  1532  	if (rcu_rdp_is_offloaded(rdp)) {
3a5761dc025da4 Zqiang                  2022-04-19  1533  		rcu_nocb_rdp_deoffload(rdp);
3a5761dc025da4 Zqiang                  2022-04-19  1534  		cpumask_clear_cpu(cpu, rcu_nocb_mask);
3a5761dc025da4 Zqiang                  2022-04-19  1535  	}
3a5761dc025da4 Zqiang                  2022-04-19  1536  	mutex_unlock(&rcu_state.barrier_mutex);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1537  }
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1538  

:::::: The code at line 1514 was first introduced by commit
:::::: 54577e23fa0791599db1a3d86fc8e7a205d3da75 rcu: Make priority of grace-period thread consistent

:::::: TO: Alison Chaiken <achaiken@aurora.tech>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
