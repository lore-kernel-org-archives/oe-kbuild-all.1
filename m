Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B29322A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 06:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751697150; cv=none; b=X1Xi0obmJPMdFNh5IgLnoPiXHKBAbtUAzchTOutxJDJPCuKGPj47fsl0weveZ7wdWCwjzSOUqUl14ljZUq4nEc/+MWBSi88k3D0dfBgT/ahlEAnPV67PPX3JXpxGdVM5cbowvHgDa35X5k3Gi/+ti+16gwIPBiushyR+tR7mx0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751697150; c=relaxed/simple;
	bh=iqmfAUbL3sjTUo5BZRLZAsVC72kvXVtoVdIRpKPMMVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8BLcPB3yQUeOmeYdx8rzOI6ib9wQkpztKlqyNFKto3sM7/1N3YiomHL6lAYKTNiHAR3VyzGJ8/RRTyjH5iWvg6++KTCE47q4WYvSGWmMUztmLOv85VV8ZmHWbYfvY0slioiuWNHbJCgrjlBDG9nZ72vYvpeV+y4sG/u18US3Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqxdpcHN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqxdpcHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751697150; x=1783233150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iqmfAUbL3sjTUo5BZRLZAsVC72kvXVtoVdIRpKPMMVA=;
  b=FqxdpcHNsdYCTxtUmet28aSDOlPIDVZeLrYIczKHrn52nKpCsS1BHGxK
   Uk/y+YatQFqJ5+3ZLIkCAZjs0vSYxQqg9aSx9p5+bXKdD4lc8POBXfuHZ
   ZS2TU5eRgQiWmk1PIaOMYIHmTChgpBg3sDbh1DCX6QgNe6bSL69trqpZJ
   FjnXumfICDcByTUnQrDGhjMjU8OWIEnVXW7T79zKuA/kBvt+XEeH4Z+Fo
   NIJDrXofaSU1uTjEP4sdDq2ae4i9TvGHVcab4rD1j2bxWZrrVtnTU/C4K
   emKB2q/Q07DnDFl/EC7pFzZUAsS+RVspe8neViUB1opGJN7xFrrIgXDpE
   A==;
X-CSE-ConnectionGUID: Jqw6SBeVQLaWyRWd7Eh9dw==
X-CSE-MsgGUID: yc/rqK6/SxCXTCDNlEEA5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65062966"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="65062966"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 23:32:29 -0700
X-CSE-ConnectionGUID: SW71EuAQTluQujnlI7fQ3A==
X-CSE-MsgGUID: Co1e6HC2Rd6RYdP0sd3LgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="154865856"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jul 2025 23:32:28 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXwRl-0004LX-29;
	Sat, 05 Jul 2025 06:32:25 +0000
Date: Sat, 5 Jul 2025 14:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/irq-exit-v2-no-task 3/4] kernel/rcu/tree_plugin.h:493:14:
 error: 'struct task_struct' has no member named 'rcu_defer_qs_iw_pending'
Message-ID: <202507051448.O1MsGRko-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/irq-exit-v2-no-task
head:   720e9973f06adae235ae751d9b2ee1acf81fe98a
commit: 8819d80f6f450d6e21212edc91d44554e4506df6 [3/4] rcu: Wire up irq_work state machine
config: i386-buildonly-randconfig-004-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051448.O1MsGRko-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051448.O1MsGRko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051448.O1MsGRko-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:4879:
   kernel/rcu/tree_plugin.h: In function 'rcu_preempt_deferred_qs_irqrestore':
>> kernel/rcu/tree_plugin.h:493:14: error: 'struct task_struct' has no member named 'rcu_defer_qs_iw_pending'
     493 |         if (t->rcu_defer_qs_iw_pending == DEFER_QS_PENDING)
         |              ^~
   kernel/rcu/tree_plugin.h:494:18: error: 'struct task_struct' has no member named 'rcu_defer_qs_iw_pending'
     494 |                 t->rcu_defer_qs_iw_pending = DEFER_QS_IDLE;
         |                  ^~


vim +493 kernel/rcu/tree_plugin.h

   471	
   472	/*
   473	 * Report deferred quiescent states.  The deferral time can
   474	 * be quite short, for example, in the case of the call from
   475	 * rcu_read_unlock_special().
   476	 */
   477	static notrace void
   478	rcu_preempt_deferred_qs_irqrestore(struct task_struct *t, unsigned long flags)
   479	{
   480		bool empty_exp;
   481		bool empty_norm;
   482		bool empty_exp_now;
   483		struct list_head *np;
   484		bool drop_boost_mutex = false;
   485		struct rcu_data *rdp;
   486		struct rcu_node *rnp;
   487		union rcu_special special;
   488	
   489		rdp = this_cpu_ptr(&rcu_data);
   490		if (rdp->defer_qs_iw_pending == DEFER_QS_PENDING)
   491			rdp->defer_qs_iw_pending = DEFER_QS_IDLE;
   492	
 > 493		if (t->rcu_defer_qs_iw_pending == DEFER_QS_PENDING)
   494			t->rcu_defer_qs_iw_pending = DEFER_QS_IDLE;
   495	
   496		/*
   497		 * If RCU core is waiting for this CPU to exit its critical section,
   498		 * report the fact that it has exited.  Because irqs are disabled,
   499		 * t->rcu_read_unlock_special cannot change.
   500		 */
   501		special = t->rcu_read_unlock_special;
   502		if (!special.s && !rdp->cpu_no_qs.b.exp) {
   503			local_irq_restore(flags);
   504			return;
   505		}
   506		t->rcu_read_unlock_special.s = 0;
   507		if (special.b.need_qs) {
   508			if (IS_ENABLED(CONFIG_RCU_STRICT_GRACE_PERIOD)) {
   509				rdp->cpu_no_qs.b.norm = false;
   510				rcu_report_qs_rdp(rdp);
   511				udelay(rcu_unlock_delay);
   512			} else {
   513				rcu_qs();
   514			}
   515		}
   516	
   517		/*
   518		 * Respond to a request by an expedited grace period for a
   519		 * quiescent state from this CPU.  Note that requests from
   520		 * tasks are handled when removing the task from the
   521		 * blocked-tasks list below.
   522		 */
   523		if (rdp->cpu_no_qs.b.exp)
   524			rcu_report_exp_rdp(rdp);
   525	
   526		/* Clean up if blocked during RCU read-side critical section. */
   527		if (special.b.blocked) {
   528	
   529			/*
   530			 * Remove this task from the list it blocked on.  The task
   531			 * now remains queued on the rcu_node corresponding to the
   532			 * CPU it first blocked on, so there is no longer any need
   533			 * to loop.  Retain a WARN_ON_ONCE() out of sheer paranoia.
   534			 */
   535			rnp = t->rcu_blocked_node;
   536			raw_spin_lock_rcu_node(rnp); /* irqs already disabled. */
   537			WARN_ON_ONCE(rnp != t->rcu_blocked_node);
   538			WARN_ON_ONCE(!rcu_is_leaf_node(rnp));
   539			empty_norm = !rcu_preempt_blocked_readers_cgp(rnp);
   540			WARN_ON_ONCE(rnp->completedqs == rnp->gp_seq &&
   541				     (!empty_norm || rnp->qsmask));
   542			empty_exp = sync_rcu_exp_done(rnp);
   543			np = rcu_next_node_entry(t, rnp);
   544			list_del_init(&t->rcu_node_entry);
   545			t->rcu_blocked_node = NULL;
   546			trace_rcu_unlock_preempted_task(TPS("rcu_preempt"),
   547							rnp->gp_seq, t->pid);
   548			if (&t->rcu_node_entry == rnp->gp_tasks)
   549				WRITE_ONCE(rnp->gp_tasks, np);
   550			if (&t->rcu_node_entry == rnp->exp_tasks)
   551				WRITE_ONCE(rnp->exp_tasks, np);
   552			if (IS_ENABLED(CONFIG_RCU_BOOST)) {
   553				/* Snapshot ->boost_mtx ownership w/rnp->lock held. */
   554				drop_boost_mutex = rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t;
   555				if (&t->rcu_node_entry == rnp->boost_tasks)
   556					WRITE_ONCE(rnp->boost_tasks, np);
   557			}
   558	
   559			/*
   560			 * If this was the last task on the current list, and if
   561			 * we aren't waiting on any CPUs, report the quiescent state.
   562			 * Note that rcu_report_unblock_qs_rnp() releases rnp->lock,
   563			 * so we must take a snapshot of the expedited state.
   564			 */
   565			empty_exp_now = sync_rcu_exp_done(rnp);
   566			if (!empty_norm && !rcu_preempt_blocked_readers_cgp(rnp)) {
   567				trace_rcu_quiescent_state_report(TPS("preempt_rcu"),
   568								 rnp->gp_seq,
   569								 0, rnp->qsmask,
   570								 rnp->level,
   571								 rnp->grplo,
   572								 rnp->grphi,
   573								 !!rnp->gp_tasks);
   574				rcu_report_unblock_qs_rnp(rnp, flags);
   575			} else {
   576				raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
   577			}
   578	
   579			/*
   580			 * If this was the last task on the expedited lists,
   581			 * then we need to report up the rcu_node hierarchy.
   582			 */
   583			if (!empty_exp && empty_exp_now)
   584				rcu_report_exp_rnp(rnp, true);
   585	
   586			/* Unboost if we were boosted. */
   587			if (IS_ENABLED(CONFIG_RCU_BOOST) && drop_boost_mutex)
   588				rt_mutex_futex_unlock(&rnp->boost_mtx.rtmutex);
   589		} else {
   590			local_irq_restore(flags);
   591		}
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
