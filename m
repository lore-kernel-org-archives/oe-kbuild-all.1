Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A193EA97
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 14:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dw/6VfIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701873385; x=1733409385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTe+1R3iU/RIpR+IGtalOGDm2jXpxCDW/IIx3ExWPF0=;
  b=Dw/6VfIEpWCuEGUBbA9yut6svXxjdNNlJHgSot436h/BPv146/jecyAJ
   ZimXTr/A6X0ysFdWj90iRV1QMLxJoRHYcrHS/uvvpYXp1h9vn8BrjZJcj
   uoN7BUhgMIGTfuHufuCTakburphWQW+gtn2taFGYa4PqW1A/MqJhvdd6B
   UBMeniIBovVbM7i+Rs5hJ0uk2TeArspfh4Z5k8d5oKsCt32KADCvUrv86
   iDLsCbNhy2NlLz2iWkng/gueN/LzwPq+GwXc1QjC4hQ+wG9nglwKu9qx8
   iGYHq3tBQNa1uX6asLhjhSPX5zYpBlj7+Uz55IZseMFKbWt6wo+U0qN1Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="955782"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="955782"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 06:36:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="894746790"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="894746790"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 06 Dec 2023 06:36:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAt0c-000Aw2-1S;
	Wed, 06 Dec 2023 14:36:19 +0000
Date: Wed, 6 Dec 2023 22:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <david@fromorbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dgc-xfs:vfs-scale 4/11] lib/dlock-list.c:67:30: sparse: sparse:
 incorrect type in assignment (different modifiers)
Message-ID: <202312062236.jbI5FgtU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git vfs-scale
head:   5e5e95a86ea3aa15d83654ec3752451959a689e6
commit: 7a215da6235ea23015452201ae78f1664c27ab8a [4/11] lib/dlock-list: Make sibling CPUs share the same linked list
config: x86_64-randconfig-121-20231206 (https://download.01.org/0day-ci/archive/20231206/202312062236.jbI5FgtU-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312062236.jbI5FgtU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062236.jbI5FgtU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dlock-list.c:67:30: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct cpumask *sibling_mask @@     got struct cpumask const * @@
   lib/dlock-list.c:67:30: sparse:     expected struct cpumask *sibling_mask
   lib/dlock-list.c:67:30: sparse:     got struct cpumask const *
   lib/dlock-list.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   lib/dlock-list.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/dlock-list.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   lib/dlock-list.c:248:28: sparse: sparse: context imbalance in '__dlock_list_next_list' - unexpected unlock

vim +67 lib/dlock-list.c

    36	
    37	/*
    38	 * Initialize cpu2idx mapping table & nr_dlock_lists.
    39	 *
    40	 * It is possible that a dlock-list can be allocated before the cpu2idx is
    41	 * initialized. In this case, all the cpus are mapped to the first entry
    42	 * before initialization.
    43	 *
    44	 * All the sibling CPUs of a sibling group will map to the same dlock list so
    45	 * as to reduce the number of dlock lists to be maintained while minimizing
    46	 * cacheline contention.
    47	 *
    48	 * As the sibling masks are set up in the core initcall phase, this function
    49	 * has to be done in the postcore phase to get the right data.
    50	 */
    51	static int __init cpu2idx_init(void)
    52	{
    53		int idx, cpu;
    54		struct cpumask *sibling_mask;
    55		static struct cpumask mask __initdata;
    56	
    57		cpumask_clear(&mask);
    58		idx = 0;
    59		for_each_possible_cpu(cpu) {
    60			int scpu;
    61	
    62			if (cpumask_test_cpu(cpu, &mask))
    63				continue;
    64			per_cpu(cpu2idx, cpu) = idx;
    65			cpumask_set_cpu(cpu, &mask);
    66	
  > 67			sibling_mask = topology_sibling_cpumask(cpu);
    68			if (sibling_mask) {
    69				for_each_cpu(scpu, sibling_mask) {
    70					per_cpu(cpu2idx, scpu) = idx;
    71					cpumask_set_cpu(scpu, &mask);
    72				}
    73			}
    74			idx++;
    75		}
    76	
    77		/*
    78		 * nr_dlock_lists can only be set after cpu2idx is properly
    79		 * initialized.
    80		 */
    81		smp_mb();
    82		nr_dlock_lists = idx;
    83		WARN_ON(nr_dlock_lists > nr_cpu_ids);
    84	
    85		pr_info("dlock-list: %d head entries per dlock list.\n",
    86			nr_dlock_lists);
    87		return 0;
    88	}
    89	postcore_initcall(cpu2idx_init);
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
