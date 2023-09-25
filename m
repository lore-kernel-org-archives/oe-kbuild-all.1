Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5663A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 19:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695668862; x=1727204862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4n9tJxqvfDh2pEo1KksGuxaeCofA0Sz/CQVuw33sJhk=;
  b=Zp/aJ6jAvQO/bPTrV1Twqyvg4EGAhrXH4yG6ufxsfurIvkGa41WQRCky
   +JR2YTmLa/5eVBdlvWwZpcClhEHE3indZDJChF8rejy++BlNxsLF1+Sza
   8EVnUaHuajfwLBkwKuZBcR77ZStHIG3457xX+kw41A/7oh+Y+fvx1qO9F
   Jp6gp5ppawoDXdG+dORcBuU3y9SgbHV1Ea4wPmSd9/zPJPW1Wra4IcCD8
   0qHxwnbSr7VBdNqxyBs0iav8r/RbdvY46wZZRXhZygu6BIhUMpqUDA598
   cbXh8jYBZ4Rz1R4gNsHlYXOPOBBnqdDSgslPFkk5uxpc4tSIayieawsF8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360727751"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="360727751"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 12:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748450429"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="748450429"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Sep 2023 12:07:40 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkqvi-0001wB-1F;
	Mon, 25 Sep 2023 19:07:38 +0000
Date: Tue, 26 Sep 2023 03:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 6053/29452]
 arch/arm64/kvm/perf.c:58:43: error: implicit declaration of function
 'perf_num_counters'; did you mean 'dec_mm_counter'?
Message-ID: <202309260331.M5esHuwL-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   78a7b2c814b120e7f0822ae5ae486bc2f8cd722d
commit: 13dbdc0759fd4b89417f64d399ffa6a86fdc7caf [6053/29452] FROMGIT: KVM: arm64: Turn kvm_arm_support_pmu_v3() into a static key
config: arm64-randconfig-002-20230925 (https://download.01.org/0day-ci/archive/20230926/202309260331.M5esHuwL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260331.M5esHuwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260331.M5esHuwL-lkp@intel.com/

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
