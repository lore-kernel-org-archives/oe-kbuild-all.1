Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EAA28507B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765751753; cv=none; b=IDIl0hzdLCnFtwdK+attNU38UWbQBz18FYPFGBdKfviwfzC64HbWABCfix7N95t9crNr7paLzV2QxZtLj85r3Yc3LJtowQ6fX+s+sibQqZMePcY3EnWL7AwqAu+T7BOCax6/myj51G66ptc5oFNY/LIpM4O5s94Eu68KwJRF/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765751753; c=relaxed/simple;
	bh=kRlH6z6+zwU6hPqahm99n58ODTS6JXsz0DoVvzxzXzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTG/+A+ZgvJ5vbhJ9HUc/t+NbgBRhcB8L60h2kv2npORPF+1jy91YAINJVJCuF/6CXW1fKxIni7Wh6reEgYN4/VKz3EBdR6E39YmigQoDPCpi88TR/Vib3vFGUwdCiUCM3+8OT/bBYBN3IZd5B/LqDb58nnB9qifK9TtWDFXe58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWI4DIm7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWI4DIm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765751752; x=1797287752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kRlH6z6+zwU6hPqahm99n58ODTS6JXsz0DoVvzxzXzQ=;
  b=AWI4DIm7oeL6J4vo12CqpyAKd1Yj3pUbu6rJVipM1z+HYsiAFIty0rzv
   VZAClt9y5UXuqx7X8deKCam8kJu2zmK9w5NCIkqcea8oQshkopyKOsxTZ
   tw76enYL5Yw2qSi2yrzOl/MfUxjhfG8RO0eudg1dkbbiFHFeI8/fszM+p
   dixtztD9vYmJYyN7SWvbKVgWEwPwbuNvf6KSaL7vveJCOizwvj6ETmzf3
   6rpIJ63VsHYzGgZK8A4YwU50I9eV4rkZvmhyioqr4DnaCM36HTDH2bLBV
   tGDJYEME9M25x1XnQVBN7iykNsXsZfRA9eFKsRXPzaTAi3TCt/6YPJMsG
   Q==;
X-CSE-ConnectionGUID: j17n+8zxRy2HtahoaoCAxw==
X-CSE-MsgGUID: tfU/Hp/iTNqs7pLvBPp23A==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78361565"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="78361565"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 14:35:51 -0800
X-CSE-ConnectionGUID: pGdLYAv+QEC5Mvs/iSkP+Q==
X-CSE-MsgGUID: LAItao4uSIaSxr2hS8aEMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197568892"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Dec 2025 14:35:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUugt-000000009SR-226S;
	Sun, 14 Dec 2025 22:35:47 +0000
Date: Mon, 15 Dec 2025 06:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: [tip:sched/core 9/16] kernel/sched/ext.c:2434:9: error: implicit
 declaration of function 'rq_modified_clear'
Message-ID: <202512150618.jilj8Vnl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   098f3900b035ab94fccd19d77b9ec2b13c300599
commit: 31ab17f00c810076333c26cb485ec4d778829a76 [9/16] sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20251215/202512150618.jilj8Vnl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150618.jilj8Vnl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150618.jilj8Vnl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c: In function 'do_pick_task_scx':
>> kernel/sched/ext.c:2434:9: error: implicit declaration of function 'rq_modified_clear' [-Wimplicit-function-declaration]
    2434 |         rq_modified_clear(rq);
         |         ^~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:2449:27: error: implicit declaration of function 'rq_modified_above' [-Wimplicit-function-declaration]
    2449 |         if (!force_scx && rq_modified_above(rq, &ext_sched_class))
         |                           ^~~~~~~~~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:4683:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    4683 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: In function '__bstr_format':
   kernel/sched/ext.c:6655:27: warning: function '__bstr_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    6655 |                           bprintf_data.bin_args);
         |                           ^~~~~~~~~~~~


vim +/rq_modified_clear +2434 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo      2024-06-18  2423  
67fa319f5fff52 Andrea Righi   2025-10-18  2424  static struct task_struct *
67fa319f5fff52 Andrea Righi   2025-10-18  2425  do_pick_task_scx(struct rq *rq, struct rq_flags *rf, bool force_scx)
f0e1a0643a59bf Tejun Heo      2024-06-18  2426  {
753e2836d139b4 Tejun Heo      2024-09-03  2427  	struct task_struct *prev = rq->curr;
4c95380701f58b Peter Zijlstra 2025-10-01  2428  	bool keep_prev, kick_idle = false;
f0e1a0643a59bf Tejun Heo      2024-06-18  2429  	struct task_struct *p;
f0e1a0643a59bf Tejun Heo      2024-06-18  2430  
a379fa1e2cae15 Tejun Heo      2025-10-22  2431  	/* see kick_cpus_irq_workfn() */
987e00035c0e68 Tejun Heo      2025-10-22  2432  	smp_store_release(&rq->scx.kick_sync, rq->scx.kick_sync + 1);
a379fa1e2cae15 Tejun Heo      2025-10-22  2433  
4c95380701f58b Peter Zijlstra 2025-10-01 @2434  	rq_modified_clear(rq);
70d837c3e017a0 Tejun Heo      2025-10-16  2435  
4c95380701f58b Peter Zijlstra 2025-10-01  2436  	rq_unpin_lock(rq, rf);
4c95380701f58b Peter Zijlstra 2025-10-01  2437  	balance_one(rq, prev);
4c95380701f58b Peter Zijlstra 2025-10-01  2438  	rq_repin_lock(rq, rf);
977b9a00541929 Peter Zijlstra 2025-10-28  2439  	maybe_queue_balance_callback(rq);
70d837c3e017a0 Tejun Heo      2025-10-16  2440  
67fa319f5fff52 Andrea Righi   2025-10-18  2441  	/*
67fa319f5fff52 Andrea Righi   2025-10-18  2442  	 * If any higher-priority sched class enqueued a runnable task on
67fa319f5fff52 Andrea Righi   2025-10-18  2443  	 * this rq during balance_one(), abort and return RETRY_TASK, so
67fa319f5fff52 Andrea Righi   2025-10-18  2444  	 * that the scheduler loop can restart.
67fa319f5fff52 Andrea Righi   2025-10-18  2445  	 *
67fa319f5fff52 Andrea Righi   2025-10-18  2446  	 * If @force_scx is true, always try to pick a SCHED_EXT task,
67fa319f5fff52 Andrea Righi   2025-10-18  2447  	 * regardless of any higher-priority sched classes activity.
67fa319f5fff52 Andrea Righi   2025-10-18  2448  	 */
67fa319f5fff52 Andrea Righi   2025-10-18 @2449  	if (!force_scx && rq_modified_above(rq, &ext_sched_class))
4c95380701f58b Peter Zijlstra 2025-10-01  2450  		return RETRY_TASK;
4c95380701f58b Peter Zijlstra 2025-10-01  2451  
4c95380701f58b Peter Zijlstra 2025-10-01  2452  	keep_prev = rq->scx.flags & SCX_RQ_BAL_KEEP;
4c95380701f58b Peter Zijlstra 2025-10-01  2453  	if (unlikely(keep_prev &&
8fef0a3b17bb25 Tejun Heo      2025-02-25  2454  		     prev->sched_class != &ext_sched_class)) {
1a7ff7216c8b4d Tejun Heo      2025-04-04  2455  		WARN_ON_ONCE(scx_enable_state() == SCX_ENABLED);
a6250aa251eaca Tejun Heo      2024-11-09  2456  		keep_prev = false;
a6250aa251eaca Tejun Heo      2024-11-09  2457  	}
a6250aa251eaca Tejun Heo      2024-11-09  2458  
a6250aa251eaca Tejun Heo      2024-11-09  2459  	/*
a6250aa251eaca Tejun Heo      2024-11-09  2460  	 * If balance_scx() is telling us to keep running @prev, replenish slice
a6250aa251eaca Tejun Heo      2024-11-09  2461  	 * if necessary and keep running @prev. Otherwise, pop the first one
a6250aa251eaca Tejun Heo      2024-11-09  2462  	 * from the local DSQ.
a6250aa251eaca Tejun Heo      2024-11-09  2463  	 */
a6250aa251eaca Tejun Heo      2024-11-09  2464  	if (keep_prev) {
7c65ae81ea86a6 Tejun Heo      2024-09-03  2465  		p = prev;
69120f82282977 Honglei Wang   2025-04-18  2466  		if (!p->scx.slice)
c0008a5632103e Tejun Heo      2025-09-23  2467  			refill_task_slice_dfl(rcu_dereference_sched(scx_root), p);
7c65ae81ea86a6 Tejun Heo      2024-09-03  2468  	} else {
f0e1a0643a59bf Tejun Heo      2024-06-18  2469  		p = first_local_task(rq);
a6250aa251eaca Tejun Heo      2024-11-09  2470  		if (!p) {
a6250aa251eaca Tejun Heo      2024-11-09  2471  			if (kick_idle)
9fc687edf205db Tejun Heo      2025-09-23  2472  				scx_kick_cpu(rcu_dereference_sched(scx_root),
9fc687edf205db Tejun Heo      2025-09-23  2473  					     cpu_of(rq), SCX_KICK_IDLE);
f0e1a0643a59bf Tejun Heo      2024-06-18  2474  			return NULL;
a6250aa251eaca Tejun Heo      2024-11-09  2475  		}
f0e1a0643a59bf Tejun Heo      2024-06-18  2476  
f0e1a0643a59bf Tejun Heo      2024-06-18  2477  		if (unlikely(!p->scx.slice)) {
c0008a5632103e Tejun Heo      2025-09-23  2478  			struct scx_sched *sch = rcu_dereference_sched(scx_root);
d310fb40096896 Tejun Heo      2025-05-14  2479  
d310fb40096896 Tejun Heo      2025-05-14  2480  			if (!scx_rq_bypassing(rq) && !sch->warned_zero_slice) {
c425180d888e7d Honglei Wang   2024-10-10  2481  				printk_deferred(KERN_WARNING "sched_ext: %s[%d] has zero slice in %s()\n",
c425180d888e7d Honglei Wang   2024-10-10  2482  						p->comm, p->pid, __func__);
d310fb40096896 Tejun Heo      2025-05-14  2483  				sch->warned_zero_slice = true;
f0e1a0643a59bf Tejun Heo      2024-06-18  2484  			}
c0008a5632103e Tejun Heo      2025-09-23  2485  			refill_task_slice_dfl(sch, p);
f0e1a0643a59bf Tejun Heo      2024-06-18  2486  		}
7c65ae81ea86a6 Tejun Heo      2024-09-03  2487  	}
7c65ae81ea86a6 Tejun Heo      2024-09-03  2488  
f0e1a0643a59bf Tejun Heo      2024-06-18  2489  	return p;
f0e1a0643a59bf Tejun Heo      2024-06-18  2490  }
f0e1a0643a59bf Tejun Heo      2024-06-18  2491  

:::::: The code at line 2434 was first introduced by commit
:::::: 4c95380701f58b8112f0b891de8d160e4199e19d sched/ext: Fold balance_scx() into pick_task_scx()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
