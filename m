Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA71017FF7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689853973; x=1721389973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=90Yq9/dbHi2Coge4uArxn/4RVnpTpqliuqQB7SP7hXU=;
  b=YIxNLLYe8BW/D+Kc6S7nSrbVDOi55sLnDtPes+9q4ebrCJVMKZkE0snt
   dAhEjZxpbxdZnhk/uGcS2QU8vwMqWx76lnksCp7bK83HqImkmgrMDHGFu
   OzG8qFy7Foe3EHDApe56GbL8Db04vjFHQQGOfKYFTEs98Kp/BHxLTz2z7
   wwL+H4naljaVGKUXFO8inSxO+xe1ODqLMv243qB6B1NQA0XmKyJljX2S/
   nLPSxwoSWybC4kuTnhJ8pGVwvz2BLfnO7YwZzbxC0QIiN82z158QJQNdw
   hEXtLg+BuexpolSrlWT9XqmMryMYXn0IsLR/+zqbzf5tWzPpuXDLoVUWL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="351572543"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="351572543"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 04:52:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="718365490"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="718365490"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Jul 2023 04:52:51 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMSDD-000637-0I;
	Thu, 20 Jul 2023 11:52:51 +0000
Date: Thu, 20 Jul 2023 19:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Kenan.Liu" <Kenan.Liu@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] sched/fair: Adjust CFS loadbalance for machine
 with qemu native CPU topology.
Message-ID: <202307201947.uwCIl577-lkp@intel.com>
References: <1689842053-5291-2-git-send-email-Kenan.Liu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689842053-5291-2-git-send-email-Kenan.Liu@linux.alibaba.com>

Hi Kenan.Liu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kenan-Liu/sched-fair-Adjust-CFS-loadbalance-for-machine-with-qemu-native-CPU-topology/20230720-170238
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/1689842053-5291-2-git-send-email-Kenan.Liu%40linux.alibaba.com
patch subject: [RFC PATCH 1/2] sched/fair: Adjust CFS loadbalance for machine with qemu native CPU topology.
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307201947.uwCIl577-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307201947.uwCIl577-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307201947.uwCIl577-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'explore_core_smp_topology':
   kernel/sched/fair.c:149:42: error: implicit declaration of function 'cpu_smt_mask'; did you mean 'cpu_cpu_mask'? [-Werror=implicit-function-declaration]
     149 |         const struct cpumask *smt_mask = cpu_smt_mask(cpu);
         |                                          ^~~~~~~~~~~~
         |                                          cpu_cpu_mask
>> kernel/sched/fair.c:149:42: warning: initialization of 'const struct cpumask *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   In file included from include/linux/bitmap.h:9,
                    from include/linux/cpumask.h:12,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   include/linux/cpumask.h:28:37: error: invalid type argument of '->' (have 'int')
      28 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:559:48: note: in definition of macro 'for_each_set_bit'
     559 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:282:31: note: in expansion of macro 'cpumask_bits'
     282 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/fair.c:158:9: note: in expansion of macro 'for_each_cpu'
     158 |         for_each_cpu(sibling, cpu_smt_mask(cpu)) {
         |         ^~~~~~~~~~~~
   include/linux/find.h:559:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     559 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   include/linux/cpumask.h:282:9: note: in expansion of macro 'for_each_set_bit'
     282 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:158:9: note: in expansion of macro 'for_each_cpu'
     158 |         for_each_cpu(sibling, cpu_smt_mask(cpu)) {
         |         ^~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:146:13: warning: 'explore_core_smp_topology' defined but not used [-Wunused-function]
     146 | static void explore_core_smp_topology(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:129:13: warning: 'core_smt_topo_detect' defined but not used [-Wunused-variable]
     129 | static bool core_smt_topo_detect;
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +149 kernel/sched/fair.c

   144	
   145	#ifdef CONFIG_SMP
   146	static void explore_core_smp_topology(void)
   147	{
   148		int cpu = smp_processor_id(), sibling;
 > 149		const struct cpumask *smt_mask = cpu_smt_mask(cpu);
   150	
   151		if (nr_cpu_ids <= 2)
   152			return;
   153	
   154		smt_nr_cpu = cpumask_weight(smt_mask);
   155		if (smt_nr_cpu < 2)
   156			return;
   157	
   158		for_each_cpu(sibling, cpu_smt_mask(cpu)) {
   159			if (cpu == sibling)
   160				continue;
   161			if (abs(cpu - sibling) == 1)
   162				smt_neighbour_topo = true;
   163		}
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
