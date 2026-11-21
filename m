Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795242803;
	b=wAJQjxt+zSPhC/tp/GEh5fdgKhgiuaaBI+HYq9+yjbLzMUtawGhcuCXcx2zFEFDwtosO
	 xDw4MDBRHDwolaUQIbAbLrCTpTQrgTaVSFkPPszXehknHlGk8ZQNRpctPISkAJGw/kHv4
	 OLLo0CTQ3dNQUwAFpMVrfBY2aKTTIVrysWbsPS8/Zkm3DQYAdle3sroUAOeGB/gUmb3ft
	 heU46aOgsWZ7tpKSlk2iIk29e8OcZ8xtIrx3v1uh0qk60wjgFFTUOCwwBNPvbC+4tmb4T
	 w/25L7hRo64RFZuAr0l7c+M7fihllyzHkWXY+TBg6ledJAZysHoEw3LbIXmMPecbC9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795242803;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=olbuyFLxUcO8qo42nAdJn8YGIPiouNuBR1IGT3yNCRw=;
	b=LCbaggB1+8PiH7FhbXXl/hdRCq1YyKlgqMy/Zad3Ejs/d3uLMok3UVxQVyvl8uTgNyQD
	 dMHJCUA9881sZKRjc7DmoQSZq7Aq6A8qqrLi767ikIHf0ksBx7uEGwbCWzXzXm86OCzyJ
	 5Q7BsZZEOW2M+ECXMV7LsHD+JamHLQQx+6XBT9WKrVR35JrRBVUkZkhCcmkzETVZYgrnA
	 w53wLzt45rhjnc/tvXwXaCgZbktIkYlz6HAh+SthFLx3+gUDWjaf56SbmVknSTgv1pqNk
	 tzWjH+v364EjPjO9JW8wmOU5ZSSg4gir9/Iqn+ofrb3JK4crL0j4MMas3fnIykum+6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EguaONdE;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14676606A333
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 06:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14676606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EguaONdE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795242803; x=1826778803;
  h=date:from:to:cc:subject:message-id;
  bh=lcQ0vgeTVcLqQccjUMj2/LMEI4HuYaNjjUIUY1DOiLg=;
  b=EguaONdE4MZCecsUnlBpvDUOPD3r6F2pIQxBik3B90alOrN42sVyYeV1
   KxluITtZ6deaBjJ+LtH/tB4ehhvjOat2tNHfT/6Frj4BY1eefbNzOFdvD
   kI9enprT4jH6kBCnPkTrnUzRvwpU+J1nBzCNYxzt+Yk7ER4enf6I+h4R/
   BROCRr3Apwct90z3nFvlMnobUQ+W1zxUDhvFH+I7SJyugdmGX1F4c/kJl
   7S2709rbbCi30tJBbHrab6IHP5ve1IIV90Ydc81bB3h14DKNbri8wLQ9A
   zfs6RTJvDOfhpD2OGKPdYIRfZV8cdl4PpPaNAGrQhL+7EQBXuaaav/WX/
   g==;
X-CSE-ConnectionGUID: BP4RLrKrSi+59acpEQHgbQ==
X-CSE-MsgGUID: rlJDKry0RzKpWJj8SJpYCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4017919"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4017919"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 22:33:22 -0800
X-CSE-ConnectionGUID: BaOY5VxaTyq6dZUKFwFrzw==
X-CSE-MsgGUID: VGx0njTqRYu6kImp2rcN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11440398"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 Nov 2026 22:33:21 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUef0-000000004Fp-2sRv;
	Sat, 21 Nov 2026 06:33:18 +0000
Date: Sat, 21 Nov 2026 07:33:07 +0100
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 36/36] kernel/rcu/tree_stall.h:326:22:
 warning: unused variable 'th'
Message-ID: <20261121073022.6xaJ1aeC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/paulmckrcu/linux dev
head:   b08fb2b41824a539bc858f6733c0f5622a4751f0
commit: b08fb2b41824a539bc858f6733c0f5622a4751f0 [36/36] rcu: Fixup for "rcu: Print CPU that preempted stalled reader wants to run on"
config: sh-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121073022.6xaJ1aeC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121073022.6xaJ1aeC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121073022.6xaJ1aeC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5126:
   kernel/rcu/tree_stall.h: In function 'check_slow_task':
>> kernel/rcu/tree_stall.h:326:22: warning: unused variable 'th' [-Wunused-variable]
     326 |  struct task_struct *th;
         |                      ^~


vim +/th +326 kernel/rcu/tree_stall.h

5bef8da66a9c45 Paul E. McKenney 2020-03-11  316  
5bef8da66a9c45 Paul E. McKenney 2020-03-11  317  /*
5bef8da66a9c45 Paul E. McKenney 2020-03-11  318   * Report out the state of a not-running task that is stalling the
5bef8da66a9c45 Paul E. McKenney 2020-03-11  319   * current RCU grace period.
5bef8da66a9c45 Paul E. McKenney 2020-03-11  320   */
9b3c4ab3045e95 Peter Zijlstra   2021-09-21  321  static int check_slow_task(struct task_struct *t, void *arg)
5bef8da66a9c45 Paul E. McKenney 2020-03-11  322  {
fd5121d99c8648 Paul E. McKenney 2026-11-09  323  	int cpu;
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  324  	struct rcu_node *rnp;
5bef8da66a9c45 Paul E. McKenney 2020-03-11  325  	struct rcu_stall_chk_rdr *rscrp = arg;
fd5121d99c8648 Paul E. McKenney 2026-11-09 @326  	struct task_struct *th;
5bef8da66a9c45 Paul E. McKenney 2020-03-11  327  
5bef8da66a9c45 Paul E. McKenney 2020-03-11  328  	if (task_curr(t))
9b3c4ab3045e95 Peter Zijlstra   2021-09-21  329  		return -EBUSY; // It is running, so decline to inspect it.
5bef8da66a9c45 Paul E. McKenney 2020-03-11  330  	rscrp->nesting = t->rcu_read_lock_nesting;
5bef8da66a9c45 Paul E. McKenney 2020-03-11  331  	rscrp->rs = t->rcu_read_unlock_special;
5bef8da66a9c45 Paul E. McKenney 2020-03-11  332  	rscrp->on_blkd_list = !list_empty(&t->rcu_node_entry);
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  333  	rscrp->rcu_rdr_running = task_curr(t);
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  334  	rscrp->rcu_rdr_boosted = 0;
fd5121d99c8648 Paul E. McKenney 2026-11-09  335  	rscrp->rcu_rdr_cpu = cpu = task_cpu(t);
fd5121d99c8648 Paul E. McKenney 2026-11-09  336  	rscrp->rcu_rdr_cpu_offline = cpu_is_offline(cpu);
fd5121d99c8648 Paul E. McKenney 2026-11-09  337  	lockdep_assert_irqs_disabled();
b08fb2b41824a5 Paul E. McKenney 2026-11-20  338  	rscrp->rcu_rdr_cpu_task = cpu_curr_snapshot_rcu(cpu);
fd5121d99c8648 Paul E. McKenney 2026-11-09  339  	// There is no need for get_task_struct(t) because we are in
fd5121d99c8648 Paul E. McKenney 2026-11-09  340  	// an implicit RCU read-side critical section due to interrupts
fd5121d99c8648 Paul E. McKenney 2026-11-09  341  	// being disabled.
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  342  	if (rscrp->on_blkd_list) {
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  343  		rnp = READ_ONCE(t->rcu_blocked_node);
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  344  		raw_spin_lock_rcu_node(rnp); /* irqs already disabled. */
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  345  		if (rnp == READ_ONCE(t->rcu_blocked_node)) {
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  346  			if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  347  				rscrp->rcu_rdr_boosted = 1;
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  348  		} else {
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  349  			rscrp->rcu_rdr_boosted = 2;
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  350  		}
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  351  		raw_spin_unlock_rcu_node(rnp); /* irqs remain disabled. */
49be2ba9f0fa25 Paul E. McKenney 2026-09-03  352  	}
9b3c4ab3045e95 Peter Zijlstra   2021-09-21  353  	return 0;
5bef8da66a9c45 Paul E. McKenney 2020-03-11  354  }
5bef8da66a9c45 Paul E. McKenney 2020-03-11  355  

:::::: The code at line 326 was first introduced by commit
:::::: fd5121d99c864841cfea8f6ba115075491447a96 rcu: Print CPU that preempted stalled reader wants to run on

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Joel Fernandes <jfern@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
