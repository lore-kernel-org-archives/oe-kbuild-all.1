Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3433241EC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZALmO7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702467185; x=1734003185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJJNId47MZlRZH6V7/ofz/FPzb166ydMRCAXOabIzzI=;
  b=PZALmO7EUWi3/B3CLa1G44liPzkGUDAlLO6a6N3Vp4stYp0dm6OiRwVW
   g8ItgPLJjXHG7nGsU3bYOFBl63yOqluSI97UahhZn6Byyc1Y4nezJnLLj
   zSp8HXYQ4lEuGvvkXvy/V/pM8aCMQK3JcJrQdXm0KzVWrfGFzEc4cB9+B
   2gzxZl/RQ3jh0vwnAWYIvAPovbATDIjGZCWyxOou52qq8oTYiQGWQ96R7
   vBWnPNfKNmuoDoOOS8WRqX29K990N9FmMTEnMdqqZvEt4k00ipAcKMaZx
   DNVXcFrBq6nEwMbIEob2UgG3BpyxL1kDMtdf3BapiCwgoa+bNEUNzSNMa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="394702309"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="394702309"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 03:33:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="897302956"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="897302956"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Dec 2023 03:33:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDNU5-000KUL-2t;
	Wed, 13 Dec 2023 11:33:01 +0000
Date: Wed, 13 Dec 2023 19:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:sched/system-pressure 11/11]
 drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202312131958.h69L2bgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git sched/system-pressure
head:   5844548bc216fd4d47bc8b20f0ff22ac4b14d48d
commit: 5844548bc216fd4d47bc8b20f0ff22ac4b14d48d [11/11] sched: Rename arch_update_thermal_pressure into arch_update_hw_pressure
config: parisc-randconfig-r122-20231213 (https://download.01.org/0day-ci/archive/20231213/202312131958.h69L2bgA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312131958.h69L2bgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131958.h69L2bgA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
>> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
>> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
>> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
>> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
>> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
>> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
   drivers/base/arch_topology.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +204 drivers/base/arch_topology.c

   164	
   165	/**
   166	 * topology_update_hw_pressure() - Update hw pressure for CPUs
   167	 * @cpus        : The related CPUs for which capacity has been reduced
   168	 * @capped_freq : The maximum allowed frequency that CPUs can run at
   169	 *
   170	 * Update the value of hw pressure for all @cpus in the mask. The
   171	 * cpumask should include all (online+offline) affected CPUs, to avoid
   172	 * operating on stale data when hot-plug is used for some CPUs. The
   173	 * @capped_freq reflects the currently allowed max CPUs frequency due to
   174	 * hw capping. It might be also a boost frequency value, which is bigger
   175	 * than the internal 'capacity_freq_ref' max frequency. In such case the
   176	 * pressure value should simply be removed, since this is an indication that
   177	 * there is no hw throttling. The @capped_freq must be provided in kHz.
   178	 */
   179	void topology_update_hw_pressure(const struct cpumask *cpus,
   180					      unsigned long capped_freq)
   181	{
   182		unsigned long max_capacity, capacity, hw_pressure;
   183		u32 max_freq;
   184		int cpu;
   185	
   186		cpu = cpumask_first(cpus);
   187		max_capacity = arch_scale_cpu_capacity(cpu);
   188		max_freq = arch_scale_freq_ref(cpu);
   189	
   190		/*
   191		 * Handle properly the boost frequencies, which should simply clean
   192		 * the hw pressure value.
   193		 */
   194		if (max_freq <= capped_freq)
   195			capacity = max_capacity;
   196		else
   197			capacity = mult_frac(max_capacity, capped_freq, max_freq);
   198	
   199		hw_pressure = max_capacity - capacity;
   200	
   201		trace_hw_pressure_update(cpu, hw_pressure);
   202	
   203		for_each_cpu(cpu, cpus)
 > 204			WRITE_ONCE(per_cpu(hw_pressure, cpu), hw_pressure);
   205	}
   206	EXPORT_SYMBOL_GPL(topology_update_hw_pressure);
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
