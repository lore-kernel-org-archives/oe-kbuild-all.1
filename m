Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4108E611E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 04:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761886045; cv=none; b=rIThaDcJ3RzsQ9qSoJv3RHUBR0eZzYZl+vvoZWq6mpv0nhpBuvrFYZJcKJs/kMArCdfEy18Wetk+aMcefmYkNO4oQ7ghmJbPy/0RT99QJrFcESSdF+qQ7ADKzHMR9jmj6epUoaGtoZrBGPH3iH414ltf0YPcWfKgld2VPpyCk7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761886045; c=relaxed/simple;
	bh=0TnXCs+ze0CYAJi9n4UGjz13+0q/6ybN6OV62TbKyiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XZ1K5uqXH2s0pEENdZCWKvkcS1EM9wE6HnLglLCA7ACPwblJ8e46jgrRLmTwtCr+W+fLlf7eqH3zi/v7V6afzkkGP3v0IMMv4+jZpG8IjO5GzsXZPs3YZoan7/Zw66f3yTkliShsYZC+sSriani8YjTwU8jpEoiJtt4FlflCnkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZOl/ATQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZOl/ATQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761886044; x=1793422044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0TnXCs+ze0CYAJi9n4UGjz13+0q/6ybN6OV62TbKyiI=;
  b=fZOl/ATQoP6RzbXrPzPs9op149yzLaZPSY8DEYhfOWNAf6y8ockHrfxW
   fIHC8YufMMN1RpWIzUsa9PBRHrfEVGL3TX30JvrZ2xIYvp+7BXNm5VJtd
   w8thlXo3ahw8rPVStGSRK7C8SbcwQ9fccKT5nybLLmHNnieYk86ecc8vC
   wnQYvW+rFJr34TRYPefOr0Eb1gnSeanzbOs9vwAW/ovagwbbPEx08RW6p
   0d7Z6s75yuXqh56PFF7jnc1VOBCgEcbPnnyd06jB47mlG36nJlqdy8Uov
   bC/2mhxNKrYvHXoV8Qe7+3gk4RjPJODLL1TPzwaRIeidzpRHX2xvRU1vI
   w==;
X-CSE-ConnectionGUID: Fpk6NJ2vTs2yOhCnEEQKtQ==
X-CSE-MsgGUID: hcQxf+QkSsyttkNaOFOpKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66653994"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="66653994"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 21:47:23 -0700
X-CSE-ConnectionGUID: M7J5AISgRhaEoFTxPvWOdQ==
X-CSE-MsgGUID: mACavQ3XT5O2RXWJ57cI3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="216793583"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Oct 2025 21:47:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEh2g-000MmS-2J;
	Fri, 31 Oct 2025 04:47:18 +0000
Date: Fri, 31 Oct 2025 12:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:next.2025.10.30c 17/43] kernel/rcu/rcutorture.c:1139:17:
 error: 'rcu_tasks_trace_expedite_current' undeclared here (not in a
 function); did you mean 'srcu_torture_expedite_current'?
Message-ID: <202510311250.LR97MjbU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux next.2025.10.30c
head:   1eee41590d30805ec4f5b4e96c615603b0d058d9
commit: f7cd407d56a0baf6fc9fe3e093253f6e30d61a95 [17/43] rcutorture: Test rcu_tasks_trace_expedite_current()
config: xtensa-randconfig-r053-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311250.LR97MjbU-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311250.LR97MjbU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311250.LR97MjbU-lkp@intel.com/

Note: the paulmckrcu/next.2025.10.30c HEAD 1eee41590d30805ec4f5b4e96c615603b0d058d9 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture.c:1139:17: error: 'rcu_tasks_trace_expedite_current' undeclared here (not in a function); did you mean 'srcu_torture_expedite_current'?
     .exp_current = rcu_tasks_trace_expedite_current,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    srcu_torture_expedite_current


vim +1139 kernel/rcu/rcutorture.c

  1127	
  1128	static struct rcu_torture_ops tasks_tracing_ops = {
  1129		.ttype		= RCU_TASKS_TRACING_FLAVOR,
  1130		.init		= rcu_sync_torture_init,
  1131		.readlock	= tasks_tracing_torture_read_lock,
  1132		.read_delay	= srcu_read_delay,  /* just reuse srcu's version. */
  1133		.readunlock	= tasks_tracing_torture_read_unlock,
  1134		.readlock_held	= rcu_read_lock_trace_held,
  1135		.get_gp_seq	= rcu_no_completed,
  1136		.deferred_free	= rcu_tasks_tracing_torture_deferred_free,
  1137		.sync		= synchronize_rcu_tasks_trace,
  1138		.exp_sync	= synchronize_rcu_tasks_trace,
> 1139		.exp_current	= rcu_tasks_trace_expedite_current,
  1140		.call		= call_rcu_tasks_trace,
  1141		.cb_barrier	= rcu_barrier_tasks_trace,
  1142		.gp_kthread_dbg	= show_rcu_tasks_trace_gp_kthread,
  1143		.get_gp_data    = rcu_tasks_trace_get_gp_data,
  1144		.cbflood_max	= 50000,
  1145		.irq_capable	= 1,
  1146		.slow_gps	= 1,
  1147		.name		= "tasks-tracing"
  1148	};
  1149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
