Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1858374C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695166298; x=1726702298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pwViZbguo4nhMEu1V2aOKGTLkgUT5jRe0pi7fjSQmm0=;
  b=Pz2xAPMn4C6rZsr5zZ+J6C5/vRGbpCtrr3LFDsnn+COZ/wyVdu7vKrHv
   6kAwPgCx5PSu6WyKxnTGF0aW+syDXUcjtWAM5l7d+SPHNaMP6fru9nAzL
   vm89gMrlFm2/FIbaFksd80wgBaL3XcV46a4ILV8GGzloWCRSAvCRJSa7x
   jj86Uk+4uIZKqCMoe4Mpe3Iyob61uOIboeOHI6aAS3I9lXbkMqHZCiJ36
   jR0QUzrztMGMl50jWKsoNWxRPV1pHMcpFcu417YKv3w1ckH7tc/g63biP
   cVUkJSNRRY6DaZ7Wh+BjCA4x2Yb5DO/8zqbQIOcHvAT758/vHpQKG48JA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446554158"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="446554158"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781481810"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="781481810"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Sep 2023 16:31:32 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qikBm-000848-0x;
	Tue, 19 Sep 2023 23:31:30 +0000
Date: Wed, 20 Sep 2023 07:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, sudeep.holla@arm.com,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	rafael@kernel.org, jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com, linuxarm@huawei.com,
	yangyicong@hisilicon.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch_topology: Support SMT control on arm64
Message-ID: <202309200727.CtYl75aH-lkp@intel.com>
References: <20230919123319.23785-1-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919123319.23785-1-yangyicong@huawei.com>

Hi Yicong,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.6-rc2 next-20230919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yicong-Yang/arch_topology-Support-SMT-control-on-arm64/20230919-223458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230919123319.23785-1-yangyicong%40huawei.com
patch subject: [PATCH] arch_topology: Support SMT control on arm64
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20230920/202309200727.CtYl75aH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200727.CtYl75aH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200727.CtYl75aH-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cpu.c: In function 'cpuhp_get_primary_thread_mask':
   kernel/cpu.c:660:16: error: 'cpu_primary_thread_mask' undeclared (first use in this function); did you mean 'cpuhp_get_primary_thread_mask'?
     660 |         return cpu_primary_thread_mask;
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                cpuhp_get_primary_thread_mask
   kernel/cpu.c:660:16: note: each undeclared identifier is reported only once for each function it appears in
   kernel/cpu.c: In function 'cpuhp_smt_disable':
>> kernel/cpu.c:2629:23: error: implicit declaration of function 'cpu_down_maps_locked' [-Werror=implicit-function-declaration]
    2629 |                 ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
         |                       ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpu_down_maps_locked +2629 kernel/cpu.c

dc8d37ed304eee Arnd Bergmann 2019-12-10  2620  
dc8d37ed304eee Arnd Bergmann 2019-12-10  2621  int cpuhp_smt_disable(enum cpuhp_smt_control ctrlval)
dc8d37ed304eee Arnd Bergmann 2019-12-10  2622  {
dc8d37ed304eee Arnd Bergmann 2019-12-10  2623  	int cpu, ret = 0;
dc8d37ed304eee Arnd Bergmann 2019-12-10  2624  
dc8d37ed304eee Arnd Bergmann 2019-12-10  2625  	cpu_maps_update_begin();
dc8d37ed304eee Arnd Bergmann 2019-12-10  2626  	for_each_online_cpu(cpu) {
dc8d37ed304eee Arnd Bergmann 2019-12-10  2627  		if (topology_is_primary_thread(cpu))
dc8d37ed304eee Arnd Bergmann 2019-12-10  2628  			continue;
dc8d37ed304eee Arnd Bergmann 2019-12-10 @2629  		ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
dc8d37ed304eee Arnd Bergmann 2019-12-10  2630  		if (ret)
dc8d37ed304eee Arnd Bergmann 2019-12-10  2631  			break;
dc8d37ed304eee Arnd Bergmann 2019-12-10  2632  		/*
dc8d37ed304eee Arnd Bergmann 2019-12-10  2633  		 * As this needs to hold the cpu maps lock it's impossible
dc8d37ed304eee Arnd Bergmann 2019-12-10  2634  		 * to call device_offline() because that ends up calling
dc8d37ed304eee Arnd Bergmann 2019-12-10  2635  		 * cpu_down() which takes cpu maps lock. cpu maps lock
dc8d37ed304eee Arnd Bergmann 2019-12-10  2636  		 * needs to be held as this might race against in kernel
dc8d37ed304eee Arnd Bergmann 2019-12-10  2637  		 * abusers of the hotplug machinery (thermal management).
dc8d37ed304eee Arnd Bergmann 2019-12-10  2638  		 *
dc8d37ed304eee Arnd Bergmann 2019-12-10  2639  		 * So nothing would update device:offline state. That would
dc8d37ed304eee Arnd Bergmann 2019-12-10  2640  		 * leave the sysfs entry stale and prevent onlining after
dc8d37ed304eee Arnd Bergmann 2019-12-10  2641  		 * smt control has been changed to 'off' again. This is
dc8d37ed304eee Arnd Bergmann 2019-12-10  2642  		 * called under the sysfs hotplug lock, so it is properly
dc8d37ed304eee Arnd Bergmann 2019-12-10  2643  		 * serialized against the regular offline usage.
dc8d37ed304eee Arnd Bergmann 2019-12-10  2644  		 */
dc8d37ed304eee Arnd Bergmann 2019-12-10  2645  		cpuhp_offline_cpu_device(cpu);
dc8d37ed304eee Arnd Bergmann 2019-12-10  2646  	}
dc8d37ed304eee Arnd Bergmann 2019-12-10  2647  	if (!ret)
dc8d37ed304eee Arnd Bergmann 2019-12-10  2648  		cpu_smt_control = ctrlval;
dc8d37ed304eee Arnd Bergmann 2019-12-10  2649  	cpu_maps_update_done();
dc8d37ed304eee Arnd Bergmann 2019-12-10  2650  	return ret;
dc8d37ed304eee Arnd Bergmann 2019-12-10  2651  }
dc8d37ed304eee Arnd Bergmann 2019-12-10  2652  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
