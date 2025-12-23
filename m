Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F136B31DD96
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479174; cv=none; b=ao4Y0tiVke3ldRRAGeBySj0LiN1V7TUGpTVrJqmwPFk9w1V9WOZAfSFalPFD3YQOzi4jz4pEVNn9P3cM0koXgXERR6fYbype8CUcMPK89cgHYE8wsa7n6xoC5skH5lvt/O5skZq9i6i2zna8E6KzZWD9tu8T1D4oAPOoqL0Sdig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479174; c=relaxed/simple;
	bh=rcXet9A8NFKfwk6dYLTvehPm2KwsYOYXtzPU9EwHUN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sw0PUblCOftUhOtpwCKqZQKjSlCFgxNPjYygVDVBWYPyDqk00n8+Q0U7Q0Zv72jfd5/L6aDRbeAVsjydsPuffSmQti8g8jJJSA0r7eSI3exy/JIqYcLNbalWiCIJGekrYzHWF2OXmguidI/NVC27Wu6et66095JLWa7+yTH4Tjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsxhgtTE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsxhgtTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766479172; x=1798015172;
  h=date:from:to:cc:subject:message-id;
  bh=rcXet9A8NFKfwk6dYLTvehPm2KwsYOYXtzPU9EwHUN4=;
  b=UsxhgtTETNothdHhnKA4agHHPBOeWZFTGoUrcPLZi4yR8/SK4g/pYnUh
   3PjxWK3shQLjpayIPtWP2Q7SMlK3q1hzqfDtQiScwA2pihkUD48xHDxOI
   yG9QfEnDrbM6LJ0/iTgiP0+AZQV3FkeVerkNL1DPJ+F2eH05cbW008X7d
   60lh6xNiyEco3YNykE2zrCZSCsio6610bl1jjyWz9+FdNXzlH1Omd4ZR0
   bIAFJlzduQnu+okbB3mi4VH/LZn1efWmiC8wqKSpFRxxQJZrmSIodHbOH
   aJiAJrHMiyjFGRd0l+2wHXzG4ANVBDm2P8ATggK7S/z13LzL9VQHSzrKB
   w==;
X-CSE-ConnectionGUID: A/P+AGMkTna/vS6dsuF4UQ==
X-CSE-MsgGUID: +fTIIzKxRnqyZqu7iEK+IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="78960640"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="78960640"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 00:39:26 -0800
X-CSE-ConnectionGUID: JQYX9G63SSaQWJfc/XGZug==
X-CSE-MsgGUID: CalaD/GXTViR0UjZIZ6gwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204255989"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2025 00:39:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXxvO-000000001eZ-0yST;
	Tue, 23 Dec 2025 08:39:22 +0000
Date: Tue, 23 Dec 2025 16:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core-v5 12/32]
 kernel/sched/isolation.c:200:80: sparse: sparse: incorrect type in argument 3
 (different address spaces)
Message-ID: <202512231635.XgSI0zIB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core-v5
head:   fcdc00137b51b2bfb81523f82122c1c8269c4c65
commit: 4b0dad35423bee840a84567c9c7d4140ef1faab8 [12/32] sched/isolation: Convert housekeeping cpumasks to rcu pointers
config: um-randconfig-r134-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231635.XgSI0zIB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231635.XgSI0zIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231635.XgSI0zIB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:624:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:624:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:624:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:952:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:952:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:952:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:952:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:952:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:952:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/topology.c:115:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:115:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:115:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:134:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:134:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:134:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:157:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:157:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:157:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:468:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:468:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:468:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:638:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:638:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:638:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:723:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:723:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:723:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:731:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:731:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:731:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:744:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:744:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:744:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:749:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:749:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:749:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:770:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:770:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:770:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:932:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:932:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:932:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:961:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:961:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:961:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1007:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1007:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1007:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1009:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1009:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1009:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1017:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1017:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1017:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1019:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1019:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1019:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1089:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1089:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1089:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1193:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1193:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1193:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1331:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1331:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1331:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1680:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1680:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1680:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2470:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2470:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2470:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2591:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2591:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2591:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2612:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:2612:56: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:2612:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:2611:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2611:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2611:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2666:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2666:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2666:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/isolation.c:200:80: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cpumask const *srcp3 @@     got struct cpumask [noderef] __rcu * @@
   kernel/sched/isolation.c:200:80: sparse:     expected struct cpumask const *srcp3
   kernel/sched/isolation.c:200:80: sparse:     got struct cpumask [noderef] __rcu *
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2294:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2294:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2294:25: sparse:    struct task_struct *

vim +200 kernel/sched/isolation.c

6f1982fedd59856 Frederic Weisbecker 2017-10-27  128  
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  129  static int __init housekeeping_setup(char *str, unsigned long flags)
6f1982fedd59856 Frederic Weisbecker 2017-10-27  130  {
6367b600e31c6b2 Frederic Weisbecker 2022-02-07  131  	cpumask_var_t non_housekeeping_mask, housekeeping_staging;
257bf89d8412128 Oleg Nesterov       2024-04-13  132  	unsigned int first_cpu;
0cd3e59de1f5397 Frederic Weisbecker 2022-02-07  133  	int err = 0;
6f1982fedd59856 Frederic Weisbecker 2017-10-27  134  
6010d245ddc9f46 Waiman Long         2024-10-30  135  	if ((flags & HK_FLAG_KERNEL_NOISE) && !(housekeeping.flags & HK_FLAG_KERNEL_NOISE)) {
65e53f869e9f92a Frederic Weisbecker 2022-02-07  136  		if (!IS_ENABLED(CONFIG_NO_HZ_FULL)) {
65e53f869e9f92a Frederic Weisbecker 2022-02-07  137  			pr_warn("Housekeeping: nohz unsupported."
65e53f869e9f92a Frederic Weisbecker 2022-02-07  138  				" Build with CONFIG_NO_HZ_FULL\n");
65e53f869e9f92a Frederic Weisbecker 2022-02-07  139  			return 0;
65e53f869e9f92a Frederic Weisbecker 2022-02-07  140  		}
65e53f869e9f92a Frederic Weisbecker 2022-02-07  141  	}
65e53f869e9f92a Frederic Weisbecker 2022-02-07  142  
6f1982fedd59856 Frederic Weisbecker 2017-10-27  143  	alloc_bootmem_cpumask_var(&non_housekeeping_mask);
915a2bc3c6b71e9 Paul Gortmaker      2021-04-19  144  	if (cpulist_parse(str, non_housekeeping_mask) < 0) {
edb9382175c3ebd Frederic Weisbecker 2017-10-27  145  		pr_warn("Housekeeping: nohz_full= or isolcpus= incorrect CPU range\n");
0cd3e59de1f5397 Frederic Weisbecker 2022-02-07  146  		goto free_non_housekeeping_mask;
7863406143d8bbb Frederic Weisbecker 2017-10-27  147  	}
7863406143d8bbb Frederic Weisbecker 2017-10-27  148  
6367b600e31c6b2 Frederic Weisbecker 2022-02-07  149  	alloc_bootmem_cpumask_var(&housekeeping_staging);
6367b600e31c6b2 Frederic Weisbecker 2022-02-07  150  	cpumask_andnot(housekeeping_staging,
edb9382175c3ebd Frederic Weisbecker 2017-10-27  151  		       cpu_possible_mask, non_housekeeping_mask);
9219565aa89033a Nicholas Piggin     2019-04-11  152  
257bf89d8412128 Oleg Nesterov       2024-04-13  153  	first_cpu = cpumask_first_and(cpu_present_mask, housekeeping_staging);
257bf89d8412128 Oleg Nesterov       2024-04-13  154  	if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
6367b600e31c6b2 Frederic Weisbecker 2022-02-07  155  		__cpumask_set_cpu(smp_processor_id(), housekeeping_staging);
6367b600e31c6b2 Frederic Weisbecker 2022-02-07  156  		__cpumask_clear_cpu(smp_processor_id(), non_housekeeping_mask);
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  157  		if (!housekeeping.flags) {
9219565aa89033a Nicholas Piggin     2019-04-11  158  			pr_warn("Housekeeping: must include one present CPU, "
9219565aa89033a Nicholas Piggin     2019-04-11  159  				"using boot CPU:%d\n", smp_processor_id());
9219565aa89033a Nicholas Piggin     2019-04-11  160  		}
6367b600e31c6b2 Frederic Weisbecker 2022-02-07  161  	}
6367b600e31c6b2 Frederic Weisbecker 2022-02-07  162  
257bf89d8412128 Oleg Nesterov       2024-04-13  163  	if (cpumask_empty(non_housekeeping_mask))
257bf89d8412128 Oleg Nesterov       2024-04-13  164  		goto free_housekeeping_staging;
257bf89d8412128 Oleg Nesterov       2024-04-13  165  
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  166  	if (!housekeeping.flags) {
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  167  		/* First setup call ("nohz_full=" or "isolcpus=") */
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  168  		enum hk_type type;
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  169  
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  170  		for_each_set_bit(type, &flags, HK_TYPE_MAX)
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  171  			housekeeping_setup_type(type, housekeeping_staging);
edb9382175c3ebd Frederic Weisbecker 2017-10-27  172  	} else {
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  173  		/* Second setup call ("nohz_full=" after "isolcpus=" or the reverse) */
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  174  		enum hk_type type;
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  175  		unsigned long iter_flags = flags & housekeeping.flags;
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  176  
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  177  		for_each_set_bit(type, &iter_flags, HK_TYPE_MAX) {
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  178  			if (!cpumask_equal(housekeeping_staging,
4b0dad35423bee8 Frederic Weisbecker 2025-05-27  179  					   housekeeping_cpumask(type))) {
edb9382175c3ebd Frederic Weisbecker 2017-10-27  180  				pr_warn("Housekeeping: nohz_full= must match isolcpus=\n");
0cd3e59de1f5397 Frederic Weisbecker 2022-02-07  181  				goto free_housekeeping_staging;
edb9382175c3ebd Frederic Weisbecker 2017-10-27  182  			}
edb9382175c3ebd Frederic Weisbecker 2017-10-27  183  		}
6367b600e31c6b2 Frederic Weisbecker 2022-02-07  184  
185bccc79797d71 Gabriele Monaco     2025-11-20  185  		/*
185bccc79797d71 Gabriele Monaco     2025-11-20  186  		 * Check the combination of nohz_full and isolcpus=domain,
185bccc79797d71 Gabriele Monaco     2025-11-20  187  		 * necessary to avoid problems with the timer migration
185bccc79797d71 Gabriele Monaco     2025-11-20  188  		 * hierarchy. managed_irq is ignored by this check since it
185bccc79797d71 Gabriele Monaco     2025-11-20  189  		 * isn't considered in the timer migration logic.
185bccc79797d71 Gabriele Monaco     2025-11-20  190  		 */
185bccc79797d71 Gabriele Monaco     2025-11-20  191  		iter_flags = housekeeping.flags & (HK_FLAG_KERNEL_NOISE | HK_FLAG_DOMAIN);
185bccc79797d71 Gabriele Monaco     2025-11-20  192  		type = find_first_bit(&iter_flags, HK_TYPE_MAX);
185bccc79797d71 Gabriele Monaco     2025-11-20  193  		/*
185bccc79797d71 Gabriele Monaco     2025-11-20  194  		 * Pass the check if none of these flags were previously set or
185bccc79797d71 Gabriele Monaco     2025-11-20  195  		 * are not in the current selection.
185bccc79797d71 Gabriele Monaco     2025-11-20  196  		 */
185bccc79797d71 Gabriele Monaco     2025-11-20  197  		iter_flags = flags & (HK_FLAG_KERNEL_NOISE | HK_FLAG_DOMAIN);
185bccc79797d71 Gabriele Monaco     2025-11-20  198  		first_cpu = (type == HK_TYPE_MAX || !iter_flags) ? 0 :
185bccc79797d71 Gabriele Monaco     2025-11-20  199  			    cpumask_first_and_and(cpu_present_mask,
185bccc79797d71 Gabriele Monaco     2025-11-20 @200  				    housekeeping_staging, housekeeping.cpumasks[type]);
185bccc79797d71 Gabriele Monaco     2025-11-20  201  		if (first_cpu >= min(nr_cpu_ids, setup_max_cpus)) {
185bccc79797d71 Gabriele Monaco     2025-11-20  202  			pr_warn("Housekeeping: must include one present CPU "
185bccc79797d71 Gabriele Monaco     2025-11-20  203  				"neither in nohz_full= nor in isolcpus=domain, "
185bccc79797d71 Gabriele Monaco     2025-11-20  204  				"ignoring setting %s\n", str);
185bccc79797d71 Gabriele Monaco     2025-11-20  205  			goto free_housekeeping_staging;
185bccc79797d71 Gabriele Monaco     2025-11-20  206  		}
185bccc79797d71 Gabriele Monaco     2025-11-20  207  
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  208  		iter_flags = flags & ~housekeeping.flags;
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  209  
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  210  		for_each_set_bit(type, &iter_flags, HK_TYPE_MAX)
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  211  			housekeeping_setup_type(type, housekeeping_staging);
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  212  	}
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  213  
6010d245ddc9f46 Waiman Long         2024-10-30  214  	if ((flags & HK_FLAG_KERNEL_NOISE) && !(housekeeping.flags & HK_FLAG_KERNEL_NOISE))
6f1982fedd59856 Frederic Weisbecker 2017-10-27  215  		tick_nohz_full_setup(non_housekeeping_mask);
edb9382175c3ebd Frederic Weisbecker 2017-10-27  216  
ed3b362d54f0038 Frederic Weisbecker 2022-02-07  217  	housekeeping.flags |= flags;
0cd3e59de1f5397 Frederic Weisbecker 2022-02-07  218  	err = 1;
6f1982fedd59856 Frederic Weisbecker 2017-10-27  219  
0cd3e59de1f5397 Frederic Weisbecker 2022-02-07  220  free_housekeeping_staging:
0cd3e59de1f5397 Frederic Weisbecker 2022-02-07  221  	free_bootmem_cpumask_var(housekeeping_staging);
0cd3e59de1f5397 Frederic Weisbecker 2022-02-07  222  free_non_housekeeping_mask:
6f1982fedd59856 Frederic Weisbecker 2017-10-27  223  	free_bootmem_cpumask_var(non_housekeeping_mask);
6f1982fedd59856 Frederic Weisbecker 2017-10-27  224  
0cd3e59de1f5397 Frederic Weisbecker 2022-02-07  225  	return err;
7863406143d8bbb Frederic Weisbecker 2017-10-27  226  }
edb9382175c3ebd Frederic Weisbecker 2017-10-27  227  

:::::: The code at line 200 was first introduced by commit
:::::: 185bccc79797d71477e672a1b2a2b7d0325044e7 sched/isolation: Force housekeeping if isolcpus and nohz_full don't leave any

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
