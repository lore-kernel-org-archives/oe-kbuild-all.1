Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12C217FE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693330185; x=1724866185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1dzQwmw8+dfgNKsSCT7CbsEL2Z+wOVPKIQ8cuylujvE=;
  b=FHWOshlOcFOipkZ4TD9awlrC4C6jEoq4t5yEtP7nw71YZvdkZqtu7wZg
   LmMXHpXJZ3HRvcsHb+F3kLCbzF5FGS/SlVAb2nm+/jhJYe0GwykEQ+9Gi
   Khh8jL+TRar1jjauUFmqts2IrZNnfAz5jpboSvod3Dgvqat7jdlfn18FL
   VRQZSSRjVGQlLI78FAs5SPcg0GBpw/Q6Z66VjHiKUbGRAmt/9gob+KGoZ
   ZuCjQ2Frzm8pCEmeUat9oDagLi6fflx5CXFnzpRll0p0KA5dhy8uo4yX4
   cJd3sJ+vF1eJma5GK8k7gPjiSkjNijKATgXax/rlzHp0emsVOOd9ow+oq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461812107"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="461812107"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 10:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="715623959"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="715623959"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Aug 2023 10:29:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb2X8-0008xM-1Q;
	Tue, 29 Aug 2023 17:29:42 +0000
Date: Wed, 30 Aug 2023 01:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:sched/cpu_capacity 2/2]
 include/linux/energy_model.h:244:20: error: implicit declaration of function
 'arch_scale_freq_ref'; did you mean 'arch_scale_freq_tick'?
Message-ID: <202308300141.sxHu3Z70-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git sched/cpu_capacity
head:   1e50757c35dd9dab6ccb07ddc4d4ac5b59022dcb
commit: 1e50757c35dd9dab6ccb07ddc4d4ac5b59022dcb [2/2] topology: add a new arch_scale_freq_reference
config: i386-randconfig-011-20230829 (https://download.01.org/0day-ci/archive/20230830/202308300141.sxHu3Z70-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300141.sxHu3Z70-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300141.sxHu3Z70-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:16,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
   include/linux/energy_model.h: In function 'em_cpu_energy':
>> include/linux/energy_model.h:244:20: error: implicit declaration of function 'arch_scale_freq_ref'; did you mean 'arch_scale_freq_tick'? [-Werror=implicit-function-declaration]
     244 |         ref_freq = arch_scale_freq_ref(cpu);
         |                    ^~~~~~~~~~~~~~~~~~~
         |                    arch_scale_freq_tick
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2820040985
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=2820040985
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2820040985
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2820040985
   make: Target 'prepare' not remade because of errors.


vim +244 include/linux/energy_model.h

   206	
   207	/**
   208	 * em_cpu_energy() - Estimates the energy consumed by the CPUs of a
   209	 *		performance domain
   210	 * @pd		: performance domain for which energy has to be estimated
   211	 * @max_util	: highest utilization among CPUs of the domain
   212	 * @sum_util	: sum of the utilization of all CPUs in the domain
   213	 * @allowed_cpu_cap	: maximum allowed CPU capacity for the @pd, which
   214	 *			  might reflect reduced frequency (due to thermal)
   215	 *
   216	 * This function must be used only for CPU devices. There is no validation,
   217	 * i.e. if the EM is a CPU type and has cpumask allocated. It is called from
   218	 * the scheduler code quite frequently and that is why there is not checks.
   219	 *
   220	 * Return: the sum of the energy consumed by the CPUs of the domain assuming
   221	 * a capacity state satisfying the max utilization of the domain.
   222	 */
   223	static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
   224					unsigned long max_util, unsigned long sum_util,
   225					unsigned long allowed_cpu_cap)
   226	{
   227		unsigned long freq, ref_freq, scale_cpu;
   228		struct em_perf_state *ps;
   229		int cpu;
   230	
   231		if (!sum_util)
   232			return 0;
   233	
   234		/*
   235		 * In order to predict the performance state, map the utilization of
   236		 * the most utilized CPU of the performance domain to a requested
   237		 * frequency, like schedutil. Take also into account that the real
   238		 * frequency might be set lower (due to thermal capping). Thus, clamp
   239		 * max utilization to the allowed CPU capacity before calculating
   240		 * effective frequency.
   241		 */
   242		cpu = cpumask_first(to_cpumask(pd->cpus));
   243		scale_cpu = arch_scale_cpu_capacity(cpu);
 > 244		ref_freq = arch_scale_freq_ref(cpu);
   245	
   246		max_util = map_util_perf(max_util);
   247		max_util = min(max_util, allowed_cpu_cap);
   248		freq = map_util_freq(max_util, ref_freq, scale_cpu);
   249	
   250		/*
   251		 * Find the lowest performance state of the Energy Model above the
   252		 * requested frequency.
   253		 */
   254		ps = em_pd_get_efficient_state(pd, freq);
   255	
   256		/*
   257		 * The capacity of a CPU in the domain at the performance state (ps)
   258		 * can be computed as:
   259		 *
   260		 *             ps->freq * scale_cpu
   261		 *   ps->cap = --------------------                          (1)
   262		 *                 cpu_max_freq
   263		 *
   264		 * So, ignoring the costs of idle states (which are not available in
   265		 * the EM), the energy consumed by this CPU at that performance state
   266		 * is estimated as:
   267		 *
   268		 *             ps->power * cpu_util
   269		 *   cpu_nrg = --------------------                          (2)
   270		 *                   ps->cap
   271		 *
   272		 * since 'cpu_util / ps->cap' represents its percentage of busy time.
   273		 *
   274		 *   NOTE: Although the result of this computation actually is in
   275		 *         units of power, it can be manipulated as an energy value
   276		 *         over a scheduling period, since it is assumed to be
   277		 *         constant during that interval.
   278		 *
   279		 * By injecting (1) in (2), 'cpu_nrg' can be re-expressed as a product
   280		 * of two terms:
   281		 *
   282		 *             ps->power * cpu_max_freq   cpu_util
   283		 *   cpu_nrg = ------------------------ * ---------          (3)
   284		 *                    ps->freq            scale_cpu
   285		 *
   286		 * The first term is static, and is stored in the em_perf_state struct
   287		 * as 'ps->cost'.
   288		 *
   289		 * Since all CPUs of the domain have the same micro-architecture, they
   290		 * share the same 'ps->cost', and the same CPU capacity. Hence, the
   291		 * total energy of the domain (which is the simple sum of the energy of
   292		 * all of its CPUs) can be factorized as:
   293		 *
   294		 *            ps->cost * \Sum cpu_util
   295		 *   pd_nrg = ------------------------                       (4)
   296		 *                  scale_cpu
   297		 */
   298		return em_estimate_energy(ps->cost, sum_util, scale_cpu);
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
