Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EFF2746F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723645868; cv=none; b=eMxPblfF0hop5ZBRhPzqVv48XqHwCWtasB6r9E5zWk0v1fnRgpO+UFtVVpKSlqA0/oZYVmnjBl8t57KWhHIoM/DTYRlFjFSPa3GHcOyJmkM+NLdmMSz/sxPA8KiVK1L7NHmLN+U1sUFJEIOUNSNbHBNSKkhn8s6yAme8LG8odFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723645868; c=relaxed/simple;
	bh=A3t0GbH9oIckv4t2b4hvvcsonA6X7rrbLueASpQzVxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kspCQe6H3XFXuUpjf4XK18YPWHEdcPHI0VjuLdKqkUioLgP4ONOoZGgfXDbDz97j3Wy1/oo56bUQPQhvKeIZxKpcS6Hn72J576jRmGtIAky3+1aE0u33z9XrgygD4w070ch1w9ET70xiAojGs80kGUMePOeOMa40FjCFstAGAUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPoZBgNr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPoZBgNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723645867; x=1755181867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A3t0GbH9oIckv4t2b4hvvcsonA6X7rrbLueASpQzVxk=;
  b=XPoZBgNr/h7a35XuO6+bJdcjNAScuLDs/u24VV6durvYIlwaAKh7QXx5
   SYulqoMjVQ5lPHwQ6Co+8Oc0NTTK4ViQ/m/QdiEQfG97m3ui5O4+TEYQ/
   6yYETEMafuSk5cgQqPu9p/SCmviZkcz6iX44ztd3yPsMniD0C6lBCVWAg
   bqhsGYWvZFR/dxbApkv+XvfwKf5sfUSroWUOE7GIYHwwxE32gQ5uEhgJZ
   hQa0avR4sHvL1eioy7h0AC86Z5/W5nqPloAeq7r21yZTrBET7ByIZbYee
   xzXFS8b0tcpwdXpWUBhRZ3BYUZJ/cuwavjCW/Eja9pk+U+TJ/Gqs9bIfx
   g==;
X-CSE-ConnectionGUID: 5ZEKSzJgQuO6NaXe+Iru1Q==
X-CSE-MsgGUID: t8cM6CiTShGgf5JPVYkbOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39320979"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="39320979"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:31:05 -0700
X-CSE-ConnectionGUID: 4PbzAicvSt61rc0iyvbpow==
X-CSE-MsgGUID: ZkHA/ZIGRyuLro8K/82ILA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="59169764"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2024 07:31:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seF1g-000218-20;
	Wed, 14 Aug 2024 14:31:00 +0000
Date: Wed, 14 Aug 2024 22:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: [linux-next:master 1552/4667] kernel/rcu/tree_stall.h:798: undefined
 reference to `csd_lock_is_stuck'
Message-ID: <202408142217.iUA6mot8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   320eb81df4f6c1a1814fd02ebb4ba41eb80a3c7e
commit: dc836adde581f0d755d58926912bf489bda7e4f5 [1552/4667] rcu: Summarize RCU CPU stall warnings during CSD-lock stalls
config: x86_64-randconfig-013-20240814 (https://download.01.org/0day-ci/archive/20240814/202408142217.iUA6mot8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408142217.iUA6mot8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408142217.iUA6mot8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `check_cpu_stall':
>> kernel/rcu/tree_stall.h:798: undefined reference to `csd_lock_is_stuck'


vim +798 kernel/rcu/tree_stall.h

   725	
   726	static void check_cpu_stall(struct rcu_data *rdp)
   727	{
   728		bool self_detected;
   729		unsigned long gs1;
   730		unsigned long gs2;
   731		unsigned long gps;
   732		unsigned long j;
   733		unsigned long jn;
   734		unsigned long js;
   735		struct rcu_node *rnp;
   736	
   737		lockdep_assert_irqs_disabled();
   738		if ((rcu_stall_is_suppressed() && !READ_ONCE(rcu_kick_kthreads)) ||
   739		    !rcu_gp_in_progress())
   740			return;
   741		rcu_stall_kick_kthreads();
   742	
   743		/*
   744		 * Check if it was requested (via rcu_cpu_stall_reset()) that the FQS
   745		 * loop has to set jiffies to ensure a non-stale jiffies value. This
   746		 * is required to have good jiffies value after coming out of long
   747		 * breaks of jiffies updates. Not doing so can cause false positives.
   748		 */
   749		if (READ_ONCE(rcu_state.nr_fqs_jiffies_stall) > 0)
   750			return;
   751	
   752		j = jiffies;
   753	
   754		/*
   755		 * Lots of memory barriers to reject false positives.
   756		 *
   757		 * The idea is to pick up rcu_state.gp_seq, then
   758		 * rcu_state.jiffies_stall, then rcu_state.gp_start, and finally
   759		 * another copy of rcu_state.gp_seq.  These values are updated in
   760		 * the opposite order with memory barriers (or equivalent) during
   761		 * grace-period initialization and cleanup.  Now, a false positive
   762		 * can occur if we get an new value of rcu_state.gp_start and a old
   763		 * value of rcu_state.jiffies_stall.  But given the memory barriers,
   764		 * the only way that this can happen is if one grace period ends
   765		 * and another starts between these two fetches.  This is detected
   766		 * by comparing the second fetch of rcu_state.gp_seq with the
   767		 * previous fetch from rcu_state.gp_seq.
   768		 *
   769		 * Given this check, comparisons of jiffies, rcu_state.jiffies_stall,
   770		 * and rcu_state.gp_start suffice to forestall false positives.
   771		 */
   772		gs1 = READ_ONCE(rcu_state.gp_seq);
   773		smp_rmb(); /* Pick up ->gp_seq first... */
   774		js = READ_ONCE(rcu_state.jiffies_stall);
   775		smp_rmb(); /* ...then ->jiffies_stall before the rest... */
   776		gps = READ_ONCE(rcu_state.gp_start);
   777		smp_rmb(); /* ...and finally ->gp_start before ->gp_seq again. */
   778		gs2 = READ_ONCE(rcu_state.gp_seq);
   779		if (gs1 != gs2 ||
   780		    ULONG_CMP_LT(j, js) ||
   781		    ULONG_CMP_GE(gps, js))
   782			return; /* No stall or GP completed since entering function. */
   783		rnp = rdp->mynode;
   784		jn = jiffies + ULONG_MAX / 2;
   785		self_detected = READ_ONCE(rnp->qsmask) & rdp->grpmask;
   786		if (rcu_gp_in_progress() &&
   787		    (self_detected || ULONG_CMP_GE(j, js + RCU_STALL_RAT_DELAY)) &&
   788		    cmpxchg(&rcu_state.jiffies_stall, js, jn) == js) {
   789			/*
   790			 * If a virtual machine is stopped by the host it can look to
   791			 * the watchdog like an RCU stall. Check to see if the host
   792			 * stopped the vm.
   793			 */
   794			if (kvm_check_and_clear_guest_paused())
   795				return;
   796	
   797			rcu_stall_notifier_call_chain(RCU_STALL_NOTIFY_NORM, (void *)j - gps);
 > 798			if (READ_ONCE(csd_lock_suppress_rcu_stall) && csd_lock_is_stuck()) {
   799				pr_err("INFO: %s detected stall, but suppressed full report due to a stuck CSD-lock.\n", rcu_state.name);
   800			} else if (self_detected) {
   801				/* We haven't checked in, so go dump stack. */
   802				print_cpu_stall(gps);
   803			} else {
   804				/* They had a few time units to dump stack, so complain. */
   805				print_other_cpu_stall(gs2, gps);
   806			}
   807	
   808			if (READ_ONCE(rcu_cpu_stall_ftrace_dump))
   809				rcu_ftrace_dump(DUMP_ALL);
   810	
   811			if (READ_ONCE(rcu_state.jiffies_stall) == jn) {
   812				jn = jiffies + 3 * rcu_jiffies_till_stall_check() + 3;
   813				WRITE_ONCE(rcu_state.jiffies_stall, jn);
   814			}
   815		}
   816	}
   817	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
