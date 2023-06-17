Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4BAA28
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 03:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686973935; x=1718509935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LVgqraNInfgmC3J4BjFWm1PXnvA7sFX9BeYuDNIczIw=;
  b=hrLk1Sip37sa1UAoABuIF39b6abap0CxgnrddkdHP6tBI7+24+ZopY0t
   vZloM9D5qAGMVN4P8Yuf0nFvAtnGHbhLB7f0UQlWbhTouEviBEgufCsK1
   v7fy4MIc6rmbIO2Jso5XhUGe87DYNaj5HlYjDb7xniYMhXcJOyPNj5yfx
   P+D6tOY8BtEGcWoX/32oXLlpc8iijh8gHBReES1SdDYfbhaeWic02xHCV
   hM13lajp387Mk0Yb5sJQIIq0gyTsjJM7OfpWlFfY+oI2yApRhWpH/Uoqp
   z5iDCtP6wXMKZi1gAuSoQKUYS6Nb4JCHhUJjWGjWAFHcenNmT5x1P9mT9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="425298923"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="425298923"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 20:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="887324025"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="887324025"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Jun 2023 20:52:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAMyy-0002EM-2p;
	Sat, 17 Jun 2023 03:52:12 +0000
Date: Sat, 17 Jun 2023 11:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10 6053/27680]
 arch/arm64/kvm/perf.c:58:43: error: implicit declaration of function
 'perf_num_counters'; did you mean 'dec_mm_counter'?
Message-ID: <202306171100.MwNAZZ81-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10
head:   1d52f82a5a291f35847b6d4ddae50955aad91a50
commit: 13dbdc0759fd4b89417f64d399ffa6a86fdc7caf [6053/27680] FROMGIT: KVM: arm64: Turn kvm_arm_support_pmu_v3() into a static key
config: arm64-randconfig-r016-20230616 (https://download.01.org/0day-ci/archive/20230617/202306171100.MwNAZZ81-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171100.MwNAZZ81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171100.MwNAZZ81-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/perf.c: In function 'kvm_perf_init':
>> arch/arm64/kvm/perf.c:58:43: error: implicit declaration of function 'perf_num_counters'; did you mean 'dec_mm_counter'? [-Werror=implicit-function-declaration]
      58 |         if (IS_ENABLED(CONFIG_ARM_PMU) && perf_num_counters() > 0)
         |                                           ^~~~~~~~~~~~~~~~~
         |                                           dec_mm_counter
   cc1: some warnings being treated as errors


vim +58 arch/arm64/kvm/perf.c

    50	
    51	int kvm_perf_init(void)
    52	{
    53		/*
    54		 * Check if HW_PERF_EVENTS are supported by checking the number of
    55		 * hardware performance counters. This could ensure the presence of
    56		 * a physical PMU and CONFIG_PERF_EVENT is selected.
    57		 */
  > 58		if (IS_ENABLED(CONFIG_ARM_PMU) && perf_num_counters() > 0)
    59			static_branch_enable(&kvm_arm_pmu_available);
    60	
    61		return perf_register_guest_info_callbacks(&kvm_guest_cbs);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
