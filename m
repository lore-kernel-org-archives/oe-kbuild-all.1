Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC06F1A680F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jun 2026 00:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782348439; cv=none; b=jJ2SCaHI9bygBXmKuuRUBL7FokzuBpXkc3u716aB0sFQn+s0qujmoJ/p2FHIx4U+GF2w0PpUwBR2YjemvQAhV1gSOcxPamMN1lSyIDvDxeZeV5wGlUzZYrgOFL2UR2hNWOvRKVdhsxCLmipGExTJ46KB2zfAaJPuka9t1ZIYg00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782348439; c=relaxed/simple;
	bh=aaID5JN3v0hLluX+qUq04dar17QACZPrn478g1n7uiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UxNUEU3RzzZYIYlFC3xBeyuOuMpl3yxa9OiWzsTU4+3Hi+hsAzb8XAWmvuQ6hUsNZ1WCxs21+HlqMGhcjlSxq0HRYo4CiptacOOi593SfmnLmA1SxD7XeyFbLf3KoOG79Bbaw8JSzM0Ca4yjBVEAX2eCfLEJB34LxMCN94oQQh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+Ur2Dvz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+Ur2Dvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782348438; x=1813884438;
  h=date:from:to:cc:subject:message-id;
  bh=aaID5JN3v0hLluX+qUq04dar17QACZPrn478g1n7uiY=;
  b=A+Ur2DvzPsQ7PMot8clfHF0GCvm9AKxRXSHlVNt/vsg79IfY4HEGNm8K
   lQaiyqvmvfQcO2L+Joo6T8hTJwluWpJXgNgnEXqHZnzaUTLVWqnxdD9rY
   b2SVAkyVaAKeikZjT12INWolTOpz9zB61L8JLjJkSdBpySjFCugXy9+Oy
   3NvLLOXcr1s1hePtO4zHzthOvclDxHuQlrjAOiQJSN1TI8QejMZsVuNgD
   r88tAnEmXto46Mxg7SqhGrnF9tkIDCHMBDMnA83His08UagEy+E/sd159
   SwsF+wfmlPhLeskymGc7ZKBTDbvN54Y4lAk51MvrcHsrbzLDCFQwEh73M
   g==;
X-CSE-ConnectionGUID: bS9qxnkIQR2PvdgfUB5keA==
X-CSE-MsgGUID: KQyXyGcFREGRqODF0EmcCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83122432"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83122432"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 17:47:18 -0700
X-CSE-ConnectionGUID: WjfnjMEKRTe7tEcdAluQYw==
X-CSE-MsgGUID: oCABceCrRYGok1pT1FQdPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="248881315"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 24 Jun 2026 17:47:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcYFO-000000006Rl-0CZr;
	Thu, 25 Jun 2026 00:47:14 +0000
Date: Thu, 25 Jun 2026 02:46:54 +0200
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 54/55] kernel/rcu/tree.h:498:12: warning:
 'rcu_preempt_blocked_readers_cgp_ndqs' used but never defined
Message-ID: <202606250212.HSjhPk8b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev
head:   7c6c1219be4d12b6f13c8c4648f5ab50286da01a
commit: ab15f8d23a687736b674b3b8669a744dd709d97f [54/55] rcu: Make rcu_gp_cleanup() account for ->dqs_blkd_tasks
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260625/202606250212.HSjhPk8b-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250212.HSjhPk8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250212.HSjhPk8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:69:
>> kernel/rcu/tree.h:498:12: warning: 'rcu_preempt_blocked_readers_cgp_ndqs' used but never defined
     498 | static int rcu_preempt_blocked_readers_cgp_ndqs(struct rcu_node *rnp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rcu_preempt_blocked_readers_cgp_ndqs +498 kernel/rcu/tree.h

   493	
   494	/* Forward declarations for tree_plugin.h */
   495	static void rcu_bootup_announce(void);
   496	static void rcu_qs(void);
   497	static int rcu_preempt_blocked_readers_cgp(struct rcu_node *rnp);
 > 498	static int rcu_preempt_blocked_readers_cgp_ndqs(struct rcu_node *rnp);
   499	static int rcu_print_task_exp_stall(struct rcu_node *rnp);
   500	static void rcu_preempt_check_blocked_tasks(struct rcu_node *rnp);
   501	static void rcu_flavor_sched_clock_irq(int user);
   502	static void dump_blkd_tasks(struct rcu_node *rnp, int ncheck);
   503	static void rcu_preempt_deferred_qs_init(struct rcu_data *rdp);
   504	static void rcu_initiate_boost(struct rcu_node *rnp, unsigned long flags);
   505	static void rcu_preempt_boost_start_gp(struct rcu_node *rnp);
   506	static bool rcu_is_callbacks_kthread(struct rcu_data *rdp);
   507	static void rcu_cpu_kthread_setup(unsigned int cpu);
   508	static void rcu_spawn_one_boost_kthread(struct rcu_node *rnp);
   509	static bool rcu_preempt_has_tasks(struct rcu_node *rnp);
   510	static bool rcu_preempt_has_tasks_ndqs(struct rcu_node *rnp);
   511	static bool rcu_preempt_need_deferred_qs(struct task_struct *t);
   512	static void zero_cpu_stall_ticks(struct rcu_data *rdp);
   513	static struct swait_queue_head *rcu_nocb_gp_get(struct rcu_node *rnp);
   514	static void rcu_nocb_gp_cleanup(struct swait_queue_head *sq);
   515	static void rcu_init_one_nocb(struct rcu_node *rnp);
   516	static bool wake_nocb_gp(struct rcu_data *rdp);
   517	static bool rcu_nocb_flush_bypass(struct rcu_data *rdp, struct rcu_head *rhp,
   518					  unsigned long j, bool lazy);
   519	static void call_rcu_nocb(struct rcu_data *rdp, struct rcu_head *head,
   520				  rcu_callback_t func, unsigned long flags, bool lazy);
   521	static void __maybe_unused __call_rcu_nocb_wake(struct rcu_data *rdp, bool was_empty,
   522							unsigned long flags);
   523	static int rcu_nocb_need_deferred_wakeup(struct rcu_data *rdp, int level);
   524	static bool do_nocb_deferred_wakeup(struct rcu_data *rdp);
   525	static void rcu_boot_init_nocb_percpu_data(struct rcu_data *rdp);
   526	static void rcu_spawn_cpu_nocb_kthread(int cpu);
   527	static void show_rcu_nocb_state(struct rcu_data *rdp);
   528	static void rcu_nocb_lock(struct rcu_data *rdp);
   529	static void rcu_nocb_unlock(struct rcu_data *rdp);
   530	static void rcu_nocb_unlock_irqrestore(struct rcu_data *rdp,
   531					       unsigned long flags);
   532	static void rcu_lockdep_assert_cblist_protected(struct rcu_data *rdp);
   533	#ifdef CONFIG_RCU_NOCB_CPU
   534	static void __init rcu_organize_nocb_kthreads(void);
   535	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
