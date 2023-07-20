Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D2E18000
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 12:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689854668; x=1721390668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8fgjngH2DoFzALhKwL4tTFF2Kg+Xvel5CQR2t5xBSWs=;
  b=bArPwJ9dQzwvc7BRNgC3mrZ7z6f2uMhIpn9YZ4TfP35nBRxBnZ4w19lA
   9/ZfXFPqdnwgNjADr9N6t+bw4DzAWf0O/mQNlRCHg1n9+MyCz9GK9bS3g
   zeECFxAe2YBVN+GU32wLOriNLBU1JeEc/uyx1Qbe3tpqfhfYi+kYonyfu
   fHbOBJr9YQNCCxU3e/xudQRc9KcXk/ihVoNjY3n4YXPvYboSS9BnWntVr
   ot1ubVJ6xWrAVjcWsHb3wqLR7AVE4mCqf1Ii4LNr/25z+5VvTGPbHy0ix
   aOB7cWxLHL6IF6aX/1vrKJMMUyyUuOPRkorY6QZ7wIdCEaZqa5jnjDunF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365596887"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="365596887"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 05:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="759536862"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="759536862"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Jul 2023 05:04:26 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMSOF-000649-1I;
	Thu, 20 Jul 2023 12:04:18 +0000
Date: Thu, 20 Jul 2023 20:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Kenan.Liu" <Kenan.Liu@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] sched/fair: Adjust CFS loadbalance for machine
 with qemu native CPU topology.
Message-ID: <202307201914.hf51jhUk-lkp@intel.com>
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
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307201914.hf51jhUk-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307201914.hf51jhUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307201914.hf51jhUk-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   arch/powerpc/include/asm/smp.h:139:22: error: implicit declaration of function 'cpu_smt_mask'; did you mean 'cpu_cpu_mask'? [-Werror=implicit-function-declaration]
     139 | #define cpu_smt_mask cpu_smt_mask
         |                      ^~~~~~~~~~~~
   kernel/sched/fair.c:149:42: note: in expansion of macro 'cpu_smt_mask'
     149 |         const struct cpumask *smt_mask = cpu_smt_mask(cpu);
         |                                          ^~~~~~~~~~~~
>> arch/powerpc/include/asm/smp.h:139:22: warning: initialization of 'const struct cpumask *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
