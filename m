Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB0C51C3B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710430298; cv=none; b=W5ce8z9tbsvdY6pxjQmZSJLPLUosT4JHrdEHjJ0D2jI5VBSlPh9M0fWtJ2ex5glfFUovGlREOgKfcw6hHjc1KlXSsh2bf0ECTbl22wEQyAZhvHNQQLdu/xpbd3pydzKWgRZ4Afn4jn19oEXbB89QxUzH0U2ZycjgHAdgmOvYwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710430298; c=relaxed/simple;
	bh=4keAEObqxaMvol29SUk16ePUSx9kK52SSmlujmFYmY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WOfW72nYenmVrlMFYHVs3enN9sDMXJRugPnQyb2CM60sgVW/10UbOM2pWWCVo67LHfsVh3Ln4pQjjWV3QDArhUb4nvxfx9X2MF/dT33Ba1e2xtdUOBZ7N0zitYT/wMzYeYUUJS9D8GIiDc0bYfpN4uUywulkxiJs/52Ou5gVujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VM7DzZxr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VM7DzZxr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710430295; x=1741966295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4keAEObqxaMvol29SUk16ePUSx9kK52SSmlujmFYmY4=;
  b=VM7DzZxrvxPruK2oZEcZVCz7bmYEkvvK8hwE8af7ueE5ItUjaXM/cqyx
   sQIVOzeYmh2iVhkoFfjocWOULURVwuVXd4NUgC3wsYWVoLZKkLvIz/BjF
   VLfB6uo907LiHSFlFWuRPjp+ZR9yB/j/l+jNwnr/+F2TNbJbKcXIcQeKU
   +PTalTm9dWsTgww5ISPSzr+Ql7DD8UdSVw1h2Cy0YG8ewMz6OyiYWm5W5
   BCA0IdUcN+AoShDgA739feVor9IT4WLcP5rmfCow/VozLa0HHj4cmbQAp
   0JfNQHMKpaSR7bRfrIQXz27b+L9gpMxILqBxiBudCv9EkjoEytjksWFMa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5106038"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5106038"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:31:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="16986036"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Mar 2024 08:31:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkn3L-000DYF-00;
	Thu, 14 Mar 2024 15:31:31 +0000
Date: Thu, 14 Mar 2024 23:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 154/29558]
 kernel/rcu/srcutree.c:762:30: warning: 'sp_llock' defined but not used
Message-ID: <202403142318.W02KpUsr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: d1303754c9d835d8b5a221e1caa479f20e522380 [154/29558] srcu: replace local_irqsave() with a locallock
config: arc-randconfig-001-20240303 (https://download.01.org/0day-ci/archive/20240314/202403142318.W02KpUsr-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403142318.W02KpUsr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403142318.W02KpUsr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/rcu/srcutree.c:839:6: warning: no previous prototype for '__call_srcu' [-Wmissing-prototypes]
     839 | void __call_srcu(struct srcu_struct *sp, struct rcu_head *rhp,
         |      ^~~~~~~~~~~
   In file included from kernel/rcu/srcutree.c:42:
>> kernel/rcu/srcutree.c:762:30: warning: 'sp_llock' defined but not used [-Wunused-const-variable=]
     762 | static DEFINE_LOCAL_IRQ_LOCK(sp_llock);
         |                              ^~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/sp_llock +762 kernel/rcu/srcutree.c

   740	
   741	/*
   742	 * If SRCU is likely idle, return true, otherwise return false.
   743	 *
   744	 * Note that it is OK for several current from-idle requests for a new
   745	 * grace period from idle to specify expediting because they will all end
   746	 * up requesting the same grace period anyhow.  So no loss.
   747	 *
   748	 * Note also that if any CPU (including the current one) is still invoking
   749	 * callbacks, this function will nevertheless say "idle".  This is not
   750	 * ideal, but the overhead of checking all CPUs' callback lists is even
   751	 * less ideal, especially on large systems.  Furthermore, the wakeup
   752	 * can happen before the callback is fully removed, so we have no choice
   753	 * but to accept this type of error.
   754	 *
   755	 * This function is also subject to counter-wrap errors, but let's face
   756	 * it, if this function was preempted for enough time for the counters
   757	 * to wrap, it really doesn't matter whether or not we expedite the grace
   758	 * period.  The extra overhead of a needlessly expedited grace period is
   759	 * negligible when amoritized over that time period, and the extra latency
   760	 * of a needlessly non-expedited grace period is similarly negligible.
   761	 */
 > 762	static DEFINE_LOCAL_IRQ_LOCK(sp_llock);
   763	
   764	static bool srcu_might_be_idle(struct srcu_struct *sp)
   765	{
   766		unsigned long curseq;
   767		unsigned long flags;
   768		struct srcu_data *sdp;
   769		unsigned long t;
   770	
   771		/* If the local srcu_data structure has callbacks, not idle.  */
   772		local_lock_irqsave(sp_llock, flags);
   773		sdp = this_cpu_ptr(sp->sda);
   774		if (rcu_segcblist_pend_cbs(&sdp->srcu_cblist)) {
   775			local_unlock_irqrestore(sp_llock, flags);
   776			return false; /* Callbacks already present, so not idle. */
   777		}
   778		local_unlock_irqrestore(sp_llock, flags);
   779	
   780		/*
   781		 * No local callbacks, so probabalistically probe global state.
   782		 * Exact information would require acquiring locks, which would
   783		 * kill scalability, hence the probabalistic nature of the probe.
   784		 */
   785	
   786		/* First, see if enough time has passed since the last GP. */
   787		t = ktime_get_mono_fast_ns();
   788		if (exp_holdoff == 0 ||
   789		    time_in_range_open(t, sp->srcu_last_gp_end,
   790				       sp->srcu_last_gp_end + exp_holdoff))
   791			return false; /* Too soon after last GP. */
   792	
   793		/* Next, check for probable idleness. */
   794		curseq = rcu_seq_current(&sp->srcu_gp_seq);
   795		smp_mb(); /* Order ->srcu_gp_seq with ->srcu_gp_seq_needed. */
   796		if (ULONG_CMP_LT(curseq, READ_ONCE(sp->srcu_gp_seq_needed)))
   797			return false; /* Grace period in progress, so not idle. */
   798		smp_mb(); /* Order ->srcu_gp_seq with prior access. */
   799		if (curseq != rcu_seq_current(&sp->srcu_gp_seq))
   800			return false; /* GP # changed, so not idle. */
   801		return true; /* With reasonable probability, idle! */
   802	}
   803	
   804	/*
   805	 * SRCU callback function to leak a callback.
   806	 */
   807	static void srcu_leak_callback(struct rcu_head *rhp)
   808	{
   809	}
   810	
   811	/*
   812	 * Enqueue an SRCU callback on the srcu_data structure associated with
   813	 * the current CPU and the specified srcu_struct structure, initiating
   814	 * grace-period processing if it is not already running.
   815	 *
   816	 * Note that all CPUs must agree that the grace period extended beyond
   817	 * all pre-existing SRCU read-side critical section.  On systems with
   818	 * more than one CPU, this means that when "func()" is invoked, each CPU
   819	 * is guaranteed to have executed a full memory barrier since the end of
   820	 * its last corresponding SRCU read-side critical section whose beginning
   821	 * preceded the call to call_srcu().  It also means that each CPU executing
   822	 * an SRCU read-side critical section that continues beyond the start of
   823	 * "func()" must have executed a memory barrier after the call_srcu()
   824	 * but before the beginning of that SRCU read-side critical section.
   825	 * Note that these guarantees include CPUs that are offline, idle, or
   826	 * executing in user mode, as well as CPUs that are executing in the kernel.
   827	 *
   828	 * Furthermore, if CPU A invoked call_srcu() and CPU B invoked the
   829	 * resulting SRCU callback function "func()", then both CPU A and CPU
   830	 * B are guaranteed to execute a full memory barrier during the time
   831	 * interval between the call to call_srcu() and the invocation of "func()".
   832	 * This guarantee applies even if CPU A and CPU B are the same CPU (but
   833	 * again only if the system has more than one CPU).
   834	 *
   835	 * Of course, these guarantees apply only for invocations of call_srcu(),
   836	 * srcu_read_lock(), and srcu_read_unlock() that are all passed the same
   837	 * srcu_struct structure.
   838	 */
 > 839	void __call_srcu(struct srcu_struct *sp, struct rcu_head *rhp,
   840			 rcu_callback_t func, bool do_norm)
   841	{
   842		unsigned long flags;
   843		bool needexp = false;
   844		bool needgp = false;
   845		unsigned long s;
   846		struct srcu_data *sdp;
   847	
   848		check_init_srcu_struct(sp);
   849		if (debug_rcu_head_queue(rhp)) {
   850			/* Probable double call_srcu(), so leak the callback. */
   851			WRITE_ONCE(rhp->func, srcu_leak_callback);
   852			WARN_ONCE(1, "call_srcu(): Leaked duplicate callback\n");
   853			return;
   854		}
   855		rhp->func = func;
   856		local_lock_irqsave(sp_llock, flags);
   857		sdp = this_cpu_ptr(sp->sda);
   858		spin_lock_rcu_node(sdp);
   859		rcu_segcblist_enqueue(&sdp->srcu_cblist, rhp, false);
   860		rcu_segcblist_advance(&sdp->srcu_cblist,
   861				      rcu_seq_current(&sp->srcu_gp_seq));
   862		s = rcu_seq_snap(&sp->srcu_gp_seq);
   863		(void)rcu_segcblist_accelerate(&sdp->srcu_cblist, s);
   864		if (ULONG_CMP_LT(sdp->srcu_gp_seq_needed, s)) {
   865			sdp->srcu_gp_seq_needed = s;
   866			needgp = true;
   867		}
   868		if (!do_norm && ULONG_CMP_LT(sdp->srcu_gp_seq_needed_exp, s)) {
   869			sdp->srcu_gp_seq_needed_exp = s;
   870			needexp = true;
   871		}
   872		spin_unlock_rcu_node(sdp);
   873		local_unlock_irqrestore(sp_llock, flags);
   874		if (needgp)
   875			srcu_funnel_gp_start(sp, sdp, s, do_norm);
   876		else if (needexp)
   877			srcu_funnel_exp_start(sp, sdp->mynode, s);
   878	}
   879	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
