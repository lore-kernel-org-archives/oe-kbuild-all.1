Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D810762D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 20:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723667322; cv=none; b=e9rH1MtMjzu6kvOKYfLgpi70RhkFqW7heIgSwy1bFHuBxDAHGQWBX13VyHNIlkLz3sPlEVFJgFde+NX8PGSojoTXN7UqQxfki6oN+Jc+KqK4JCFiynYRo1TkLYZ/rNREL2di6XZdtp1m8RSe1SEdSGbe0pUfxJdRolQ0rcy4GNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723667322; c=relaxed/simple;
	bh=/emNyOTeg1a4xskfXFuLfC/TRiMZNY3rDY/7mH0PFG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IW1kUxmeXmysaOCSm5moMHRKsk6a7+dfVBWQB8Y36xAxvsW1AUER4cwzrIQh9JAIJhbAboT0HX1zTCZ6E7G3pQN6GFvJi3vHdWnF7IqfRIAjCnin3S73wF18uUUwuvn6VHEIQmiGMRw3s09lItY5/hH+S8wtCMJSWkPe9TjAfvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3wSsidV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3wSsidV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723667320; x=1755203320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/emNyOTeg1a4xskfXFuLfC/TRiMZNY3rDY/7mH0PFG8=;
  b=h3wSsidVfT7ZBCTccE6QVKIyVyWLus86Zw/+Mj1rWEGEOHcNiTkBgMLZ
   ecrJwegCdsr8TBpBDkBrNIOwqZK1UxPZynZ8sTKDeXZfwXtdApQ8OgfpD
   aTtdu+mJkXfY3TDtnILFORSEp/lANwCMlDsADt9eyDrb7R9BiQt22jgHV
   SWATnTfYj2JODLHxb+D5LmmXk7X71VeFsSJGxZ24htIjpAC3RzGhaa08o
   ac+zX3RcMXaCKCJbvJeti6e6P3i28ZU+uV9Y+yN0zPl5NauPZjCsrEvlp
   RWFHLLwmmS85SP6YV6b7YLpzNkHIWHXSMeGljdvuQ68ztHKjB4Huz8BnQ
   w==;
X-CSE-ConnectionGUID: SBROK27SRKq6WqBRXEUj3w==
X-CSE-MsgGUID: wErIfhVwTTeE0fEgAz0Sgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22038243"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="22038243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 13:28:39 -0700
X-CSE-ConnectionGUID: rkGHlRd/RRG3pQ+8Jjj0cw==
X-CSE-MsgGUID: awN5UG8PQnGr1flnInK5PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="82337609"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2024 13:28:38 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seKbk-0002qw-11;
	Wed, 14 Aug 2024 20:28:36 +0000
Date: Thu, 15 Aug 2024 04:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: [linux-next:master 1554/4667] kernel/rcu/tree_exp.h:556: undefined
 reference to `csd_lock_is_stuck'
Message-ID: <202408150404.3k8APQJr-lkp@intel.com>
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
commit: 88ae4291a83a03811076b01fcd0b59d296c0176d [1554/4667] rcu: Summarize expedited RCU CPU stall warnings during CSD-lock stalls
config: x86_64-randconfig-013-20240814 (https://download.01.org/0day-ci/archive/20240815/202408150404.3k8APQJr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150404.3k8APQJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408150404.3k8APQJr-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `synchronize_rcu_expedited_stall':
>> kernel/rcu/tree_exp.h:556: undefined reference to `csd_lock_is_stuck'
   ld: vmlinux.o: in function `check_cpu_stall':
   kernel/rcu/tree_stall.h:798: undefined reference to `csd_lock_is_stuck'


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
