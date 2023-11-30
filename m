Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6B34565
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjXirkeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701340137; x=1732876137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6kPUI4LpYiSlGdJCPdrrZhWxDBIwKAnW8cnPtMKh+eQ=;
  b=KjXirkeSXbqGvpeoulcEQvV+Hs/L/3U1CpPZ99D9w48kOwo0xPIBthln
   F2JaVist9tFdlxoTuO2Fi7/WXUHleH6ZBmCVfwaFvZfmULD7y81KqiV9A
   6XkJhRAZsNPRcMZExJTScx4UoH5yEDtqwmtcBXg0XsfPZCyXCTWDiZvak
   ul/MBVfQRB55xHVv0dvloq1i/8Ow3qhUvXnNxFRwcrTnaBYvcD6NKjR/k
   7brhc8OURXGLM+bYbx29YtNLCVzQcGUqjfAHUYXlQ8A4VW74Rs+/RXMFn
   dXl4yTQEaHlUHJkzpe0m/LWNBH/GH5/L6U0/WqTIkYz5s+fduRksdJFIP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14854854"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="14854854"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 02:28:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="860151899"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="860151899"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2023 02:28:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8eHn-0001hK-1H;
	Thu, 30 Nov 2023 10:28:47 +0000
Date: Thu, 30 Nov 2023 18:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:rcu/dev 2/5] kernel/rcu/tree.h:470:13: warning:
 'call_rcu_nocb' used but never defined
Message-ID: <202311301849.ZkcFTgNj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   747bcee76f689e850284b297c4174b9303445d1a
commit: cae6d648e4b784e345810ceb21dfdb9f9b5e7841 [2/5] rcu/nocb: Re-arrange call_rcu() NOCB specific code
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231130/202311301849.ZkcFTgNj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301849.ZkcFTgNj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301849.ZkcFTgNj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:69:
>> kernel/rcu/tree.h:470:13: warning: 'call_rcu_nocb' used but never defined
     470 | static void call_rcu_nocb(struct rcu_data *rdp, struct rcu_head *head,
         |             ^~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:5136:
>> kernel/rcu/tree_nocb.h:1780:13: warning: 'rcu_nocb_try_bypass' defined but not used [-Wunused-function]
    1780 | static bool rcu_nocb_try_bypass(struct rcu_data *rdp, struct rcu_head *rhp,
         |             ^~~~~~~~~~~~~~~~~~~


vim +/call_rcu_nocb +470 kernel/rcu/tree.h

   444	
   445	/* Forward declarations for tree_plugin.h */
   446	static void rcu_bootup_announce(void);
   447	static void rcu_qs(void);
   448	static int rcu_preempt_blocked_readers_cgp(struct rcu_node *rnp);
   449	#ifdef CONFIG_HOTPLUG_CPU
   450	static bool rcu_preempt_has_tasks(struct rcu_node *rnp);
   451	#endif /* #ifdef CONFIG_HOTPLUG_CPU */
   452	static int rcu_print_task_exp_stall(struct rcu_node *rnp);
   453	static void rcu_preempt_check_blocked_tasks(struct rcu_node *rnp);
   454	static void rcu_flavor_sched_clock_irq(int user);
   455	static void dump_blkd_tasks(struct rcu_node *rnp, int ncheck);
   456	static void rcu_initiate_boost(struct rcu_node *rnp, unsigned long flags);
   457	static void rcu_preempt_boost_start_gp(struct rcu_node *rnp);
   458	static bool rcu_is_callbacks_kthread(struct rcu_data *rdp);
   459	static void rcu_cpu_kthread_setup(unsigned int cpu);
   460	static void rcu_spawn_one_boost_kthread(struct rcu_node *rnp);
   461	static bool rcu_preempt_has_tasks(struct rcu_node *rnp);
   462	static bool rcu_preempt_need_deferred_qs(struct task_struct *t);
   463	static void zero_cpu_stall_ticks(struct rcu_data *rdp);
   464	static struct swait_queue_head *rcu_nocb_gp_get(struct rcu_node *rnp);
   465	static void rcu_nocb_gp_cleanup(struct swait_queue_head *sq);
   466	static void rcu_init_one_nocb(struct rcu_node *rnp);
   467	static bool wake_nocb_gp(struct rcu_data *rdp, bool force);
   468	static bool rcu_nocb_flush_bypass(struct rcu_data *rdp, struct rcu_head *rhp,
   469					  unsigned long j, bool lazy);
 > 470	static void call_rcu_nocb(struct rcu_data *rdp, struct rcu_head *head,
   471				  rcu_callback_t func, unsigned long flags, bool lazy);
   472	static void __call_rcu_nocb_wake(struct rcu_data *rdp, bool was_empty,
   473					 unsigned long flags);
   474	static int rcu_nocb_need_deferred_wakeup(struct rcu_data *rdp, int level);
   475	static bool do_nocb_deferred_wakeup(struct rcu_data *rdp);
   476	static void rcu_boot_init_nocb_percpu_data(struct rcu_data *rdp);
   477	static void rcu_spawn_cpu_nocb_kthread(int cpu);
   478	static void show_rcu_nocb_state(struct rcu_data *rdp);
   479	static void rcu_nocb_lock(struct rcu_data *rdp);
   480	static void rcu_nocb_unlock(struct rcu_data *rdp);
   481	static void rcu_nocb_unlock_irqrestore(struct rcu_data *rdp,
   482					       unsigned long flags);
   483	static void rcu_lockdep_assert_cblist_protected(struct rcu_data *rdp);
   484	#ifdef CONFIG_RCU_NOCB_CPU
   485	static void __init rcu_organize_nocb_kthreads(void);
   486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
