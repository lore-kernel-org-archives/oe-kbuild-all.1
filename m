Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6A813D600
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719998293; cv=none; b=SUuhRa9rON9NJYwKbgVqol/mOtcTTqWtcbpJlUks0FpqclpJ60ftBp6bQVm/vDass5f7Bozu8vpA2gUTQjV6YXm5sPwC4vreONfEPZZ9VVKsCet1jS8cj+b/lit39Kkjfs27STa1Zax46s/v42nAYF4xYWurGYYyim7HwAfI9ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719998293; c=relaxed/simple;
	bh=MusREK28ZLsKz0pbaeGtZuQVpIamelXv8STA0z23QSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tEvx7q1F8iPhFdOyDFjdeK7fWElqJ95bbxol4SdhFRY8luKZUFkHHIhdpNmy3oW8ng4VSFwQAy0pUFESoJ11JaiQtBG4qjTNxntIbMgrqwhrus1WlAEkWwCL5OwJeb9I9MO2xK+nzNM+UYasMLjmbTuFWR+fehlXI+25mfS1eGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkJeYDeE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkJeYDeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719998291; x=1751534291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MusREK28ZLsKz0pbaeGtZuQVpIamelXv8STA0z23QSY=;
  b=mkJeYDeEpsMLNJNckSXN1iSy3VDOiR0gtrFw7eFweLimx0Nk3BHm3nt9
   hTAb8OhHLpuzjuLswKqoZlF68lK8iiVb894+BKABgUqEJocbiVsyOvjiO
   JrWDaets5rdCnuyIbS45es4eZpN2KakwJB8UMHj6Dht0nfpZMInTfDLCf
   dIRcASchEPw8VdFoy4+UHihQrW9Ea4d4Ht3gX6/sTei/EJg6/9+pL50ia
   NNqQ3L21RnSUT9KGcndCZ9WHhOWDM0VEdT+Rzg0GU0JrAEEWjMqCjYDVG
   K3JBLjWmSDdp8riKLTTvjQPDyKQXDJAGzvhg5N4/2WXLlnRjLsmmPLlwg
   g==;
X-CSE-ConnectionGUID: Slnj6rU1Txi33dklvGy+gQ==
X-CSE-MsgGUID: X3fi6ha8Sn6lS5q2M6jMHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27889794"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="27889794"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 02:18:11 -0700
X-CSE-ConnectionGUID: 4whfEHsjRhqj/DwzVVs1pw==
X-CSE-MsgGUID: qig9yo1VQVWq4aM9FI3pJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="51142740"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2024 02:18:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOw7o-000PaA-1t;
	Wed, 03 Jul 2024 09:18:04 +0000
Date: Wed, 3 Jul 2024 17:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9885/10451] kernel/rcu/tree_stall.h:797:undefined
 reference to `csd_lock_is_stuck'
Message-ID: <202407031722.nBIh2u7x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 3be88389f46263f166973e80e528dcc9268e24cb [9885/10451] rcu: Summarize RCU CPU stall warnings during CSD-lock stalls
config: x86_64-randconfig-a014-20211016 (https://download.01.org/0day-ci/archive/20240703/202407031722.nBIh2u7x-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031722.nBIh2u7x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031722.nBIh2u7x-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `check_cpu_stall':
>> kernel/rcu/tree_stall.h:797:(.text+0x273b89): undefined reference to `csd_lock_is_stuck'


vim +797 kernel/rcu/tree_stall.h

   724	
   725	static void check_cpu_stall(struct rcu_data *rdp)
   726	{
   727		bool self_detected;
   728		unsigned long gs1;
   729		unsigned long gs2;
   730		unsigned long gps;
   731		unsigned long j;
   732		unsigned long jn;
   733		unsigned long js;
   734		struct rcu_node *rnp;
   735	
   736		lockdep_assert_irqs_disabled();
   737		if ((rcu_stall_is_suppressed() && !READ_ONCE(rcu_kick_kthreads)) ||
   738		    !rcu_gp_in_progress())
   739			return;
   740		rcu_stall_kick_kthreads();
   741	
   742		/*
   743		 * Check if it was requested (via rcu_cpu_stall_reset()) that the FQS
   744		 * loop has to set jiffies to ensure a non-stale jiffies value. This
   745		 * is required to have good jiffies value after coming out of long
   746		 * breaks of jiffies updates. Not doing so can cause false positives.
   747		 */
   748		if (READ_ONCE(rcu_state.nr_fqs_jiffies_stall) > 0)
   749			return;
   750	
   751		j = jiffies;
   752	
   753		/*
   754		 * Lots of memory barriers to reject false positives.
   755		 *
   756		 * The idea is to pick up rcu_state.gp_seq, then
   757		 * rcu_state.jiffies_stall, then rcu_state.gp_start, and finally
   758		 * another copy of rcu_state.gp_seq.  These values are updated in
   759		 * the opposite order with memory barriers (or equivalent) during
   760		 * grace-period initialization and cleanup.  Now, a false positive
   761		 * can occur if we get an new value of rcu_state.gp_start and a old
   762		 * value of rcu_state.jiffies_stall.  But given the memory barriers,
   763		 * the only way that this can happen is if one grace period ends
   764		 * and another starts between these two fetches.  This is detected
   765		 * by comparing the second fetch of rcu_state.gp_seq with the
   766		 * previous fetch from rcu_state.gp_seq.
   767		 *
   768		 * Given this check, comparisons of jiffies, rcu_state.jiffies_stall,
   769		 * and rcu_state.gp_start suffice to forestall false positives.
   770		 */
   771		gs1 = READ_ONCE(rcu_state.gp_seq);
   772		smp_rmb(); /* Pick up ->gp_seq first... */
   773		js = READ_ONCE(rcu_state.jiffies_stall);
   774		smp_rmb(); /* ...then ->jiffies_stall before the rest... */
   775		gps = READ_ONCE(rcu_state.gp_start);
   776		smp_rmb(); /* ...and finally ->gp_start before ->gp_seq again. */
   777		gs2 = READ_ONCE(rcu_state.gp_seq);
   778		if (gs1 != gs2 ||
   779		    ULONG_CMP_LT(j, js) ||
   780		    ULONG_CMP_GE(gps, js))
   781			return; /* No stall or GP completed since entering function. */
   782		rnp = rdp->mynode;
   783		jn = jiffies + ULONG_MAX / 2;
   784		self_detected = READ_ONCE(rnp->qsmask) & rdp->grpmask;
   785		if (rcu_gp_in_progress() &&
   786		    (self_detected || ULONG_CMP_GE(j, js + RCU_STALL_RAT_DELAY)) &&
   787		    cmpxchg(&rcu_state.jiffies_stall, js, jn) == js) {
   788			/*
   789			 * If a virtual machine is stopped by the host it can look to
   790			 * the watchdog like an RCU stall. Check to see if the host
   791			 * stopped the vm.
   792			 */
   793			if (kvm_check_and_clear_guest_paused())
   794				return;
   795	
   796			rcu_stall_notifier_call_chain(RCU_STALL_NOTIFY_NORM, (void *)j - gps);
 > 797			if (READ_ONCE(csd_lock_suppress_rcu_stall) && csd_lock_is_stuck()) {
   798				pr_err("INFO: %s detected stall, but suppressed full report due to a stuck CSD-lock.\n", rcu_state.name);
   799			} else if (self_detected) {
   800				/* We haven't checked in, so go dump stack. */
   801				print_cpu_stall(gps);
   802			} else {
   803				/* They had a few time units to dump stack, so complain. */
   804				print_other_cpu_stall(gs2, gps);
   805			}
   806	
   807			if (READ_ONCE(rcu_cpu_stall_ftrace_dump))
   808				rcu_ftrace_dump(DUMP_ALL);
   809	
   810			if (READ_ONCE(rcu_state.jiffies_stall) == jn) {
   811				jn = jiffies + 3 * rcu_jiffies_till_stall_check() + 3;
   812				WRITE_ONCE(rcu_state.jiffies_stall, jn);
   813			}
   814		}
   815	}
   816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
