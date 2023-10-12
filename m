Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990231A61
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 16:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpMvRQ4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697127050; x=1728663050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rUIqZNtAabQKBDuJXS2VUBqGOWhmWzfuxhDcYhaypzM=;
  b=hpMvRQ4qTbcQ8tTjHRvU33gxas1U01gBgVV/+qxetGo81ys06vbkzwDK
   26duKxx2hFuOKwe01ULop3p7/8paKsCqwGBq2m1dOc30ET+XdRxiHxZNi
   c5rFGOdvKEQ3m6ZdtB9ZUKhaO/tzXuaN6mMCQqp6mGAq8kxmDoAvn1BeJ
   mI+E2HzG5nof4s07+LpizEr+1//UErO/7KE/PjTKllIXlDPvZrOt6vD41
   GopUfp6/GAa0OE9SK8CA04EbqltvibJxV1aK3EyxYs7a3F1jv8kOXsceG
   XaGF2SGDXMA1bUtUCAq4VAFq1/eHjD7Rv4SLgbRUaQ+4SwN8f/nC9cBX2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3564373"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="3564373"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758088083"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="758088083"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 09:10:43 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqyGn-0003cF-1Y;
	Thu, 12 Oct 2023 16:10:41 +0000
Date: Fri, 13 Oct 2023 00:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, sudeep.holla@arm.com,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, dietmar.eggemann@arm.com,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	linuxarm@huawei.com, yangyicong@hisilicon.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arch_topology: Support SMT control on arm64
Message-ID: <202310122334.INC9SFga-lkp@intel.com>
References: <20231010115335.13862-1-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010115335.13862-1-yangyicong@huawei.com>

Hi Yicong,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus soc/for-next linus/master v6.6-rc5 next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yicong-Yang/arch_topology-Support-SMT-control-on-arm64/20231010-195926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231010115335.13862-1-yangyicong%40huawei.com
patch subject: [PATCH v2] arch_topology: Support SMT control on arm64
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20231012/202310122334.INC9SFga-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310122334.INC9SFga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122334.INC9SFga-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cpu.c: In function 'cpuhp_smt_disable':
>> kernel/cpu.c:2687:23: error: implicit declaration of function 'cpu_down_maps_locked' [-Werror=implicit-function-declaration]
    2687 |                 ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
         |                       ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpu_down_maps_locked +2687 kernel/cpu.c

dc8d37ed304eee Arnd Bergmann    2019-12-10  2672  
dc8d37ed304eee Arnd Bergmann    2019-12-10  2673  int cpuhp_smt_disable(enum cpuhp_smt_control ctrlval)
dc8d37ed304eee Arnd Bergmann    2019-12-10  2674  {
dc8d37ed304eee Arnd Bergmann    2019-12-10  2675  	int cpu, ret = 0;
dc8d37ed304eee Arnd Bergmann    2019-12-10  2676  
dc8d37ed304eee Arnd Bergmann    2019-12-10  2677  	cpu_maps_update_begin();
dc8d37ed304eee Arnd Bergmann    2019-12-10  2678  	for_each_online_cpu(cpu) {
dc8d37ed304eee Arnd Bergmann    2019-12-10  2679  		if (topology_is_primary_thread(cpu))
dc8d37ed304eee Arnd Bergmann    2019-12-10  2680  			continue;
38253464bc821d Michael Ellerman 2023-07-05  2681  		/*
38253464bc821d Michael Ellerman 2023-07-05  2682  		 * Disable can be called with CPU_SMT_ENABLED when changing
38253464bc821d Michael Ellerman 2023-07-05  2683  		 * from a higher to lower number of SMT threads per core.
38253464bc821d Michael Ellerman 2023-07-05  2684  		 */
38253464bc821d Michael Ellerman 2023-07-05  2685  		if (ctrlval == CPU_SMT_ENABLED && cpu_smt_thread_allowed(cpu))
38253464bc821d Michael Ellerman 2023-07-05  2686  			continue;
dc8d37ed304eee Arnd Bergmann    2019-12-10 @2687  		ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
dc8d37ed304eee Arnd Bergmann    2019-12-10  2688  		if (ret)
dc8d37ed304eee Arnd Bergmann    2019-12-10  2689  			break;
dc8d37ed304eee Arnd Bergmann    2019-12-10  2690  		/*
dc8d37ed304eee Arnd Bergmann    2019-12-10  2691  		 * As this needs to hold the cpu maps lock it's impossible
dc8d37ed304eee Arnd Bergmann    2019-12-10  2692  		 * to call device_offline() because that ends up calling
dc8d37ed304eee Arnd Bergmann    2019-12-10  2693  		 * cpu_down() which takes cpu maps lock. cpu maps lock
dc8d37ed304eee Arnd Bergmann    2019-12-10  2694  		 * needs to be held as this might race against in kernel
dc8d37ed304eee Arnd Bergmann    2019-12-10  2695  		 * abusers of the hotplug machinery (thermal management).
dc8d37ed304eee Arnd Bergmann    2019-12-10  2696  		 *
dc8d37ed304eee Arnd Bergmann    2019-12-10  2697  		 * So nothing would update device:offline state. That would
dc8d37ed304eee Arnd Bergmann    2019-12-10  2698  		 * leave the sysfs entry stale and prevent onlining after
dc8d37ed304eee Arnd Bergmann    2019-12-10  2699  		 * smt control has been changed to 'off' again. This is
dc8d37ed304eee Arnd Bergmann    2019-12-10  2700  		 * called under the sysfs hotplug lock, so it is properly
dc8d37ed304eee Arnd Bergmann    2019-12-10  2701  		 * serialized against the regular offline usage.
dc8d37ed304eee Arnd Bergmann    2019-12-10  2702  		 */
dc8d37ed304eee Arnd Bergmann    2019-12-10  2703  		cpuhp_offline_cpu_device(cpu);
dc8d37ed304eee Arnd Bergmann    2019-12-10  2704  	}
dc8d37ed304eee Arnd Bergmann    2019-12-10  2705  	if (!ret)
dc8d37ed304eee Arnd Bergmann    2019-12-10  2706  		cpu_smt_control = ctrlval;
dc8d37ed304eee Arnd Bergmann    2019-12-10  2707  	cpu_maps_update_done();
dc8d37ed304eee Arnd Bergmann    2019-12-10  2708  	return ret;
dc8d37ed304eee Arnd Bergmann    2019-12-10  2709  }
dc8d37ed304eee Arnd Bergmann    2019-12-10  2710  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
