Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CFD110A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 01:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwbXFt7W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701220291; x=1732756291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TFskQClNvK4IqfaUj+SJS792O+7svaOc8ChLEYIuKnQ=;
  b=RwbXFt7W3j7jubXsWbL1QcRIomZB+2j4Q6700/nW7s/oe6D+HxclJ/rA
   GLLRNzy9fe++p9kpUVzsrKbzZJvAB8RQ4LLXv/+LPq13mtq55jPPB+iYY
   QLeQ5IsvIqIIfLLpjwvYu/psoET7nEgnP/vZV5SG+sYewkbGHh+ByxOy+
   VZExNqQ+m1Xm0BPJKLEcA8qwUFNaoDYNXmWPveeWtsWU1hDNhBPxWXHUb
   G5jYVZwnOhKbe2H2huvSh1jVsz27lu5NMmzQX6VJ4I2l1nY1Blgf2K4RF
   7OsCxnM9HRRF3oMiE3BZQsyOeU689U4/1eQYzEMUUYU/nQGwYN2FPE6CZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="378092508"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="378092508"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="942134504"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="942134504"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Nov 2023 17:11:26 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r896q-0008NU-0M;
	Wed, 29 Nov 2023 01:11:24 +0000
Date: Wed, 29 Nov 2023 09:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2023-08 1795/23561]
 kernel/sched/cpupri.c:55:44: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202311290645.ulQkg5hT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15-2023-08
head:   6f8ac662e148ff3ec5ec23f275478b17995edea1
commit: 3adfd8e344ac32845eb3c15743f90a7e3b49dcf3 [1795/23561] ANDROID: sched: avoid placing RT threads on cores handling softirqs
config: arm64-randconfig-r123-20231129 (https://download.01.org/0day-ci/archive/20231129/202311290645.ulQkg5hT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311290645.ulQkg5hT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290645.ulQkg5hT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/cpupri.c:55:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/cpupri.c:55:44: sparse:     expected struct task_struct *task
   kernel/sched/cpupri.c:55:44: sparse:     got struct task_struct [noderef] __rcu *

vim +55 kernel/sched/cpupri.c

    43	
    44	#ifdef CONFIG_RT_SOFTINT_OPTIMIZATION
    45	/**
    46	 * drop_nopreempt_cpus - remove likely nonpreemptible cpus from the mask
    47	 * @lowest_mask: mask with selected CPUs (non-NULL)
    48	 */
    49	static void
    50	drop_nopreempt_cpus(struct cpumask *lowest_mask)
    51	{
    52		unsigned cpu = cpumask_first(lowest_mask);
    53		while (cpu < nr_cpu_ids) {
    54			/* unlocked access */
  > 55			struct task_struct *task = READ_ONCE(cpu_rq(cpu)->curr);
    56			if (task_may_not_preempt(task, cpu)) {
    57				cpumask_clear_cpu(cpu, lowest_mask);
    58			}
    59			cpu = cpumask_next(cpu, lowest_mask);
    60		}
    61	}
    62	#endif
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
