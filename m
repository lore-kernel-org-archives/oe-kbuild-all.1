Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E836917FAD9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 11:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005489; cv=none; b=k/zKKWdwLjLFZDVS8Wk0c2RFuT4QytFEJIpNKRShaAsbo4vdAGciAnuJzbfEnmLKSFncgFwbYKcKrCnbWDv3UZ3EKVrHjo98zxJmLaeODi6mAVDudQQe3Yp6dS37ZDYce8oDl5wiRjaAqlRvBmAWX5Zixvt98Csx7BYG3xdGrNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005489; c=relaxed/simple;
	bh=iN6H8N4++0iwDpXPm2E7soXWLAPegClQSQ/AJq/tpGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nm0RID13dlhIU8XCfDI5s3bjiiXZOB45eKUYbnrG2ePAcycHXaaCVm0wXA/f65hoHj3wdZZvC7sz6HIWd9vY9XKlLzYjDJ8QJV/AOXkiLVF+FnG3QyE0U0wTBNJ8Z8Tb1qGpWkR4fDs/VUskgIo+uTb7/Q6tF+72tzzWN7faKrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvARdHGm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvARdHGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720005488; x=1751541488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iN6H8N4++0iwDpXPm2E7soXWLAPegClQSQ/AJq/tpGQ=;
  b=cvARdHGmUB62Fdhjpk7gm/0HzD8yFfqza3HjFnYBgERAzLvKaKWjGY2f
   xJVEsXpWh7ZQ9vILsifWFk58xVXHhOHxO5wMyJjnpUBfN60CLTomKbGEI
   unwmi9rJOi4C8kshwqcVisJw2FlGZ2ASv2N4qmw7p3RmimWsoUBvYGrt+
   exwGQX9f1szouRxiYp1xDkW4X7XJ3+5mifQ3H0ITyWkrW0VkZk0Vku1BT
   Xem13eK8xjoaL8Q7sgk0tQhmCpntvtn5ZUq7W7tiSiHQbYnrbhvlDA4zJ
   TxCjsppx5oMZ7W8O6+oBhopqi4SqVUByyprlELqXFIrrAh8v+47NhgkPv
   A==;
X-CSE-ConnectionGUID: gcqJyWKxS++20R2iPMxArQ==
X-CSE-MsgGUID: CWY8+ialT8Cm1C///rm8Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17437583"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="17437583"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 04:18:07 -0700
X-CSE-ConnectionGUID: hdrsgzS0SbWeFeLoJaKIbg==
X-CSE-MsgGUID: 9/CfHpvIRVOIHa79al/WQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="83776416"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Jul 2024 04:18:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOxzv-000PeO-1k;
	Wed, 03 Jul 2024 11:18:03 +0000
Date: Wed, 3 Jul 2024 19:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9887/10451] kernel/rcu/tree_exp.h:556:undefined
 reference to `csd_lock_is_stuck'
Message-ID: <202407031959.r1UufFHc-lkp@intel.com>
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
commit: 3d2660b7a83bf2d9ff0abb7485478d533b269b6d [9887/10451] rcu: Summarize expedited RCU CPU stall warnings during CSD-lock stalls
config: x86_64-randconfig-a014-20211016 (https://download.01.org/0day-ci/archive/20240703/202407031959.r1UufFHc-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031959.r1UufFHc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031959.r1UufFHc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `synchronize_rcu_expedited_stall':
>> kernel/rcu/tree_exp.h:556:(.text+0x26ed6c): undefined reference to `csd_lock_is_stuck'
   ld: vmlinux.o: in function `check_cpu_stall':
   kernel/rcu/tree_stall.h:797:(.text+0x273c24): undefined reference to `csd_lock_is_stuck'


vim +556 kernel/rcu/tree_exp.h

   544	
   545	/*
   546	 * Print out an expedited RCU CPU stall warning message.
   547	 */
   548	static void synchronize_rcu_expedited_stall(unsigned long jiffies_start, unsigned long j)
   549	{
   550		int cpu;
   551		unsigned long mask;
   552		int ndetected;
   553		struct rcu_node *rnp;
   554		struct rcu_node *rnp_root = rcu_get_root();
   555	
 > 556		if (READ_ONCE(csd_lock_suppress_rcu_stall) && csd_lock_is_stuck()) {
   557			pr_err("INFO: %s detected expedited stalls, but suppressed full report due to a stuck CSD-lock.\n", rcu_state.name);
   558			return;
   559		}
   560		pr_err("INFO: %s detected expedited stalls on CPUs/tasks: {", rcu_state.name);
   561		ndetected = 0;
   562		rcu_for_each_leaf_node(rnp) {
   563			ndetected += rcu_print_task_exp_stall(rnp);
   564			for_each_leaf_node_possible_cpu(rnp, cpu) {
   565				struct rcu_data *rdp;
   566	
   567				mask = leaf_node_cpu_bit(rnp, cpu);
   568				if (!(READ_ONCE(rnp->expmask) & mask))
   569					continue;
   570				ndetected++;
   571				rdp = per_cpu_ptr(&rcu_data, cpu);
   572				pr_cont(" %d-%c%c%c%c", cpu,
   573					"O."[!!cpu_online(cpu)],
   574					"o."[!!(rdp->grpmask & rnp->expmaskinit)],
   575					"N."[!!(rdp->grpmask & rnp->expmaskinitnext)],
   576					"D."[!!data_race(rdp->cpu_no_qs.b.exp)]);
   577			}
   578		}
   579		pr_cont(" } %lu jiffies s: %lu root: %#lx/%c\n",
   580			j - jiffies_start, rcu_state.expedited_sequence, data_race(rnp_root->expmask),
   581			".T"[!!data_race(rnp_root->exp_tasks)]);
   582		if (ndetected) {
   583			pr_err("blocking rcu_node structures (internal RCU debug):");
   584			rcu_for_each_node_breadth_first(rnp) {
   585				if (rnp == rnp_root)
   586					continue; /* printed unconditionally */
   587				if (sync_rcu_exp_done_unlocked(rnp))
   588					continue;
   589				pr_cont(" l=%u:%d-%d:%#lx/%c",
   590					rnp->level, rnp->grplo, rnp->grphi, data_race(rnp->expmask),
   591					".T"[!!data_race(rnp->exp_tasks)]);
   592			}
   593			pr_cont("\n");
   594		}
   595		rcu_for_each_leaf_node(rnp) {
   596			for_each_leaf_node_possible_cpu(rnp, cpu) {
   597				mask = leaf_node_cpu_bit(rnp, cpu);
   598				if (!(READ_ONCE(rnp->expmask) & mask))
   599					continue;
   600				preempt_disable(); // For smp_processor_id() in dump_cpu_task().
   601				dump_cpu_task(cpu);
   602				preempt_enable();
   603			}
   604			rcu_exp_print_detail_task_stall_rnp(rnp);
   605		}
   606	}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
