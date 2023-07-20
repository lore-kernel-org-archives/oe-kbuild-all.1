Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A71772A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 15:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689868353; x=1721404353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a8KzHVzHlfAE3jRB/qmyccZfKuSj8mWTiG+VoMkuv0k=;
  b=H9OIISe/PQS6ijlOO5HOdLf1qbtsbK0ZnwgwXsYZcjeZnExGs1T07vkZ
   QJRXNQff4wUxHCLhiEveoZvLX3iVUsCotOGNJnHNdfAXYS2CVxYxxV7H8
   VSNapcvHzaSs0ii3uZysLNfOiG/+s/RvonXgl83sHZPrDNhDeU/MijpT3
   UOH2HeBhIczvDCHkJ6wDHfCGKNik49aIMccaRcymBSg7akH1ePPIUxTJa
   iiIj79vPbqdTpTJgiVuTYFTkc794SghRNsxOg/f/RRQ8nAwOa7Hx+8kbq
   +TK56HllrIb1n3BAfSpg5RT1ARMMhbvwJIRUz1GHECogTtjaG5urwMFhF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433000840"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="433000840"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 08:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814587119"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="814587119"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2023 08:52:31 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMVx8-0006DL-1G;
	Thu, 20 Jul 2023 15:52:30 +0000
Date: Thu, 20 Jul 2023 23:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Kenan.Liu" <Kenan.Liu@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] sched/fair: Adjust CFS loadbalance for machine
 with qemu native CPU topology.
Message-ID: <202307202351.4B6UXPqh-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kenan-Liu/sched-fair-Adjust-CFS-loadbalance-for-machine-with-qemu-native-CPU-topology/20230720-170238
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/1689842053-5291-2-git-send-email-Kenan.Liu%40linux.alibaba.com
patch subject: [RFC PATCH 1/2] sched/fair: Adjust CFS loadbalance for machine with qemu native CPU topology.
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307202351.4B6UXPqh-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307202351.4B6UXPqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307202351.4B6UXPqh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/smp.h:113,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/energy_model.h:5,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'explore_core_smp_topology':
>> arch/powerpc/include/asm/smp.h:139:22: error: implicit declaration of function 'cpu_smt_mask'; did you mean 'cpu_cpu_mask'? [-Werror=implicit-function-declaration]
     139 | #define cpu_smt_mask cpu_smt_mask
         |                      ^~~~~~~~~~~~
   kernel/sched/fair.c:149:42: note: in expansion of macro 'cpu_smt_mask'
     149 |         const struct cpumask *smt_mask = cpu_smt_mask(cpu);
         |                                          ^~~~~~~~~~~~
   arch/powerpc/include/asm/smp.h:139:22: warning: initialization of 'const struct cpumask *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     139 | #define cpu_smt_mask cpu_smt_mask
         |                      ^~~~~~~~~~~~
   kernel/sched/fair.c:149:42: note: in expansion of macro 'cpu_smt_mask'
     149 |         const struct cpumask *smt_mask = cpu_smt_mask(cpu);
         |                                          ^~~~~~~~~~~~
   In file included from include/linux/bitmap.h:9,
                    from include/linux/cpumask.h:12,
                    from include/linux/energy_model.h:4:
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


vim +139 arch/powerpc/include/asm/smp.h

f3232321db5848 Srikar Dronamraju 2020-08-07  138  
f3232321db5848 Srikar Dronamraju 2020-08-07 @139  #define cpu_smt_mask cpu_smt_mask
f3232321db5848 Srikar Dronamraju 2020-08-07  140  #ifdef CONFIG_SCHED_SMT
f3232321db5848 Srikar Dronamraju 2020-08-07  141  static inline const struct cpumask *cpu_smt_mask(int cpu)
f3232321db5848 Srikar Dronamraju 2020-08-07  142  {
f3232321db5848 Srikar Dronamraju 2020-08-07  143  	if (has_big_cores)
f3232321db5848 Srikar Dronamraju 2020-08-07  144  		return per_cpu(cpu_smallcore_map, cpu);
f3232321db5848 Srikar Dronamraju 2020-08-07  145  
f3232321db5848 Srikar Dronamraju 2020-08-07  146  	return per_cpu(cpu_sibling_map, cpu);
f3232321db5848 Srikar Dronamraju 2020-08-07  147  }
f3232321db5848 Srikar Dronamraju 2020-08-07  148  #endif /* CONFIG_SCHED_SMT */
f3232321db5848 Srikar Dronamraju 2020-08-07  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
