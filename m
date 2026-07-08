Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C19372B25
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522290; cv=none; b=N9x9tf7J6BIrMT6Kuy0jU7xPCyA1+J5E3RMEzDKvLu8UU1AT4navEAneN/lsWCnR5zy9DJOcPWDKiaIUGeH08K51FrqnCeogZCzqGwp9H6Xyamezk2tsj0D2HbqKNgEDyH+yNt/hsYNFC8tLZq54yGDwc0UUHODnshU/qD+/Ltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522290; c=relaxed/simple;
	bh=+Sr7STkRDd5EB/IQuksLGdBXEJYxRc8xquMWJYPyKAg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OOrMIGFBqhGS1jJRLMbopNJdC4GbZZaKp7EQY2m3XRqTpm2XzVvBwaswC3c/DTGYQBr3Ji5Yia7z9okcYtgz4Zy+sTT5bRkZVERVtE9YTDWod1OdKyE+p86vaHlO4TMcQaVeUSQ4DvsscerxCGwJ+rX/ZVeA4DvDoes6ph1djqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hd7VEMWN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hd7VEMWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783522289; x=1815058289;
  h=date:from:to:cc:subject:message-id;
  bh=+Sr7STkRDd5EB/IQuksLGdBXEJYxRc8xquMWJYPyKAg=;
  b=Hd7VEMWNLXOibIxEvx/hljgy57XN0BdZBpbRpu3eyJmXEVbmc8KMxrrA
   elO9cBlR6BD7AriipnlZuyPDGSXucijumeAbiw84pRfv2flyyfNc+73uI
   rI6ojgEMZwb9AUwPpWc2Jb2LRgG/qGMyzp6jM4Ce0XpIcUW/0Jdo7vZwb
   Umbs5qdhLdPuf7LDxybMhm/5Q5qmc5Cx/5hqnHJWyo2FzBO7CDrIdDM5X
   PvEliNN6USrofrgyx2gwbmG+u784Mlsju1jgDo0mvbc5RBScv166/GXnp
   CuiE/+PJj8m4QlHUJRDWTj5giIcKtujHNXrh0WCdCDpd3O5znF4dATdxP
   g==;
X-CSE-ConnectionGUID: CSTCFfVgTxCeWw2L97PncA==
X-CSE-MsgGUID: ufk2vG+MQemcQTSq6fGpiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101732895"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101732895"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 07:51:28 -0700
X-CSE-ConnectionGUID: r+hZ8lfxSKuru948vu3mSA==
X-CSE-MsgGUID: ix/z/f5bR1mz/wSfxh2tUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="257897049"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Jul 2026 07:51:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whTcS-00000000GXN-00N4;
	Wed, 08 Jul 2026 14:51:24 +0000
Date: Wed, 08 Jul 2026 22:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 21/21] kernel/sched/psi.c:871:13: sparse:
 sparse: dereference of noderef expression
Message-ID: <202607082228.uU1oG5oc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Steven,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   e19a2fd1a698f9cef6627172cf26123993ec3774
commit: 554af5ca804c16da84a47b49a517697a9b81bb54 [21/21] sched/alt: Reintroduce psi support
config: mips-randconfig-r131-20260708 (https://download.01.org/0day-ci/archive/20260708/202607082228.uU1oG5oc-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607082228.uU1oG5oc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607082228.uU1oG5oc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/psi.c:871:13: sparse: sparse: dereference of noderef expression

vim +871 kernel/sched/psi.c

eb414681d5a07d Johannes Weiner    2018-10-26  792  
570c8efd5eb79c Peter Zijlstra     2025-05-23  793  #define for_each_group(iter, group) \
570c8efd5eb79c Peter Zijlstra     2025-05-23  794  	for (typeof(group) iter = group; iter; iter = iter->parent)
570c8efd5eb79c Peter Zijlstra     2025-05-23  795  
36b238d5717279 Johannes Weiner    2020-03-16  796  static void psi_group_change(struct psi_group *group, int cpu,
3840cbe24cf060 Johannes Weiner    2024-10-03  797  			     unsigned int clear, unsigned int set,
570c8efd5eb79c Peter Zijlstra     2025-05-23  798  			     u64 now, bool wake_clock)
eb414681d5a07d Johannes Weiner    2018-10-26  799  {
eb414681d5a07d Johannes Weiner    2018-10-26  800  	struct psi_group_cpu *groupc;
eb414681d5a07d Johannes Weiner    2018-10-26  801  	unsigned int t, m;
71dbdde7914d32 Johannes Weiner    2022-08-26  802  	u32 state_mask;
eb414681d5a07d Johannes Weiner    2018-10-26  803  
ddae0ca2a8fe12 John Stultz        2024-06-18  804  	lockdep_assert_rq_held(cpu_rq(cpu));
eb414681d5a07d Johannes Weiner    2018-10-26  805  	groupc = per_cpu_ptr(group->pcpu, cpu);
eb414681d5a07d Johannes Weiner    2018-10-26  806  
71dbdde7914d32 Johannes Weiner    2022-08-26  807  	/*
71dbdde7914d32 Johannes Weiner    2022-08-26  808  	 * Start with TSK_ONCPU, which doesn't have a corresponding
71dbdde7914d32 Johannes Weiner    2022-08-26  809  	 * task count - it's just a boolean flag directly encoded in
71dbdde7914d32 Johannes Weiner    2022-08-26  810  	 * the state mask. Clear, set, or carry the current state if
71dbdde7914d32 Johannes Weiner    2022-08-26  811  	 * no changes are requested.
71dbdde7914d32 Johannes Weiner    2022-08-26  812  	 */
71dbdde7914d32 Johannes Weiner    2022-08-26  813  	if (unlikely(clear & TSK_ONCPU)) {
71dbdde7914d32 Johannes Weiner    2022-08-26  814  		state_mask = 0;
71dbdde7914d32 Johannes Weiner    2022-08-26  815  		clear &= ~TSK_ONCPU;
71dbdde7914d32 Johannes Weiner    2022-08-26  816  	} else if (unlikely(set & TSK_ONCPU)) {
71dbdde7914d32 Johannes Weiner    2022-08-26  817  		state_mask = PSI_ONCPU;
71dbdde7914d32 Johannes Weiner    2022-08-26  818  		set &= ~TSK_ONCPU;
71dbdde7914d32 Johannes Weiner    2022-08-26  819  	} else {
71dbdde7914d32 Johannes Weiner    2022-08-26  820  		state_mask = groupc->state_mask & PSI_ONCPU;
71dbdde7914d32 Johannes Weiner    2022-08-26  821  	}
eb414681d5a07d Johannes Weiner    2018-10-26  822  
71dbdde7914d32 Johannes Weiner    2022-08-26  823  	/*
71dbdde7914d32 Johannes Weiner    2022-08-26  824  	 * The rest of the state mask is calculated based on the task
71dbdde7914d32 Johannes Weiner    2022-08-26  825  	 * counts. Update those first, then construct the mask.
71dbdde7914d32 Johannes Weiner    2022-08-26  826  	 */
eb414681d5a07d Johannes Weiner    2018-10-26  827  	for (t = 0, m = clear; m; m &= ~(1 << t), t++) {
eb414681d5a07d Johannes Weiner    2018-10-26  828  		if (!(m & (1 << t)))
eb414681d5a07d Johannes Weiner    2018-10-26  829  			continue;
9d10a13d1e4c34 Charan Teja Reddy  2021-04-16  830  		if (groupc->tasks[t]) {
9d10a13d1e4c34 Charan Teja Reddy  2021-04-16  831  			groupc->tasks[t]--;
9d10a13d1e4c34 Charan Teja Reddy  2021-04-16  832  		} else if (!psi_bug) {
71dbdde7914d32 Johannes Weiner    2022-08-26  833  			printk_deferred(KERN_ERR "psi: task underflow! cpu=%d t=%d tasks=[%u %u %u %u] clear=%x set=%x\n",
eb414681d5a07d Johannes Weiner    2018-10-26  834  					cpu, t, groupc->tasks[0],
eb414681d5a07d Johannes Weiner    2018-10-26  835  					groupc->tasks[1], groupc->tasks[2],
71dbdde7914d32 Johannes Weiner    2022-08-26  836  					groupc->tasks[3], clear, set);
eb414681d5a07d Johannes Weiner    2018-10-26  837  			psi_bug = 1;
eb414681d5a07d Johannes Weiner    2018-10-26  838  		}
eb414681d5a07d Johannes Weiner    2018-10-26  839  	}
eb414681d5a07d Johannes Weiner    2018-10-26  840  
eb414681d5a07d Johannes Weiner    2018-10-26  841  	for (t = 0; set; set &= ~(1 << t), t++)
eb414681d5a07d Johannes Weiner    2018-10-26  842  		if (set & (1 << t))
eb414681d5a07d Johannes Weiner    2018-10-26  843  			groupc->tasks[t]++;
eb414681d5a07d Johannes Weiner    2018-10-26  844  
34f26a15611afb Chengming Zhou     2022-09-07  845  	if (!group->enabled) {
34f26a15611afb Chengming Zhou     2022-09-07  846  		/*
34f26a15611afb Chengming Zhou     2022-09-07  847  		 * On the first group change after disabling PSI, conclude
34f26a15611afb Chengming Zhou     2022-09-07  848  		 * the current state and flush its time. This is unlikely
34f26a15611afb Chengming Zhou     2022-09-07  849  		 * to matter to the user, but aggregation (get_recent_times)
34f26a15611afb Chengming Zhou     2022-09-07  850  		 * may have already incorporated the live state into times_prev;
34f26a15611afb Chengming Zhou     2022-09-07  851  		 * avoid a delta sample underflow when PSI is later re-enabled.
34f26a15611afb Chengming Zhou     2022-09-07  852  		 */
34f26a15611afb Chengming Zhou     2022-09-07  853  		if (unlikely(groupc->state_mask & (1 << PSI_NONIDLE)))
34f26a15611afb Chengming Zhou     2022-09-07  854  			record_times(groupc, now);
34f26a15611afb Chengming Zhou     2022-09-07  855  
34f26a15611afb Chengming Zhou     2022-09-07  856  		groupc->state_mask = state_mask;
34f26a15611afb Chengming Zhou     2022-09-07  857  
34f26a15611afb Chengming Zhou     2022-09-07  858  		return;
34f26a15611afb Chengming Zhou     2022-09-07  859  	}
34f26a15611afb Chengming Zhou     2022-09-07  860  
0ec208ce983492 Tvrtko Ursulin     2024-06-25  861  	state_mask = test_states(groupc->tasks, state_mask);
7fae6c8171d20a Chengming Zhou     2021-03-03  862  
7fae6c8171d20a Chengming Zhou     2021-03-03  863  	/*
7fae6c8171d20a Chengming Zhou     2021-03-03  864  	 * Since we care about lost potential, a memstall is FULL
7fae6c8171d20a Chengming Zhou     2021-03-03  865  	 * when there are no other working tasks, but also when
7fae6c8171d20a Chengming Zhou     2021-03-03  866  	 * the CPU is actively reclaiming and nothing productive
7fae6c8171d20a Chengming Zhou     2021-03-03  867  	 * could run even if it were runnable. So when the current
7fae6c8171d20a Chengming Zhou     2021-03-03  868  	 * task in a cgroup is in_memstall, the corresponding groupc
7fae6c8171d20a Chengming Zhou     2021-03-03  869  	 * on that cpu is in PSI_MEM_FULL state.
7fae6c8171d20a Chengming Zhou     2021-03-03  870  	 */
71dbdde7914d32 Johannes Weiner    2022-08-26 @871  	if (unlikely((state_mask & PSI_ONCPU) && cpu_curr(cpu)->in_memstall))
7fae6c8171d20a Chengming Zhou     2021-03-03  872  		state_mask |= (1 << PSI_MEM_FULL);
7fae6c8171d20a Chengming Zhou     2021-03-03  873  
34f26a15611afb Chengming Zhou     2022-09-07  874  	record_times(groupc, now);
34f26a15611afb Chengming Zhou     2022-09-07  875  
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  876  	groupc->state_mask = state_mask;
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  877  
65457b74aa9437 Domenico Cerasuolo 2023-03-30  878  	if (state_mask & group->rtpoll_states)
65457b74aa9437 Domenico Cerasuolo 2023-03-30  879  		psi_schedule_rtpoll_work(group, 1, false);
36b238d5717279 Johannes Weiner    2020-03-16  880  
36b238d5717279 Johannes Weiner    2020-03-16  881  	if (wake_clock && !delayed_work_pending(&group->avgs_work))
36b238d5717279 Johannes Weiner    2020-03-16  882  		schedule_delayed_work(&group->avgs_work, PSI_FREQ);
eb414681d5a07d Johannes Weiner    2018-10-26  883  }
eb414681d5a07d Johannes Weiner    2018-10-26  884  

:::::: The code at line 871 was first introduced by commit
:::::: 71dbdde7914d32e86f01ac1f6e54e964c9dfdbd9 sched/psi: Remove NR_ONCPU task accounting

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
