Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F571D6DDB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 23:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725407983; cv=none; b=ZIsMDZmTYxCZQ/iTGmdLsSUPPT3inyf+gmSMr/G/QI5QoM3VlPL2lcWV+ZUv1tb65HsRO+oQX3pYLXqFgglKUYAuEFiwZvzOr3nsay73INQdTuOQK89zy6uyNvqO9rLEUTGadfTXRnebLltSybniefKBObaj1jdl8WM21yIWG4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725407983; c=relaxed/simple;
	bh=oaLcChjDXY5eZrKRyZzo4oiiCbs+66+GS8sJkmx+8jU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lm5oEIxQDz8wGtOELYJ8u6uGHpD2cP9mF/6V1RIz3hpwBeI6P3EYSqfKa2NyLVMrT6YlgT41PzfGJs0LvsUALw18gx2V2F9/aKxNkb/zxvFA2+EBwPXVjmvbaFyl85CxBjnssrOrcM3/4ELFlycY8tkVOsm7LwNrO+g0TL5dDAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6Bje4yZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6Bje4yZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725407982; x=1756943982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oaLcChjDXY5eZrKRyZzo4oiiCbs+66+GS8sJkmx+8jU=;
  b=b6Bje4yZfn/Nop5L0jPvnlu7ozvnjW0xtUhMs39J1CgVPJXmWbzUJMk/
   HR/PG7fub9mQ8LUwpq2gj6kAD81avMCJS4GVgpjeMFXFsbmLgqKC7iRrM
   SYuNQESCA46A24y0iv2kYc8wq1yxu6DT0iiTde/4GPFL6LKD4Rj0EoAIA
   7j2XGjJses62TouO4Ylh/ROJbjQFd5PWgHEJAltzYSEh4eMIvIiH2Y9R0
   7SmSVXdl+yhQJW0o+OpWr6RGOOM574vZpOhmdidN2YM/o3lqgEF2qLZQf
   DaoYjjBWiR6eXraj9Kky7OZllL4dhozmfPi0FiNutPEdBfNaPqW1iUoWg
   g==;
X-CSE-ConnectionGUID: hBfL/DSxRKK4T1Mk2BkX6g==
X-CSE-MsgGUID: 1C6+U7i6Rk2Qkpp8xM3msQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46567703"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="46567703"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 16:59:41 -0700
X-CSE-ConnectionGUID: VNDKcA0OT7Gxj31d7OZQiQ==
X-CSE-MsgGUID: q8ZdTsoBSeG0CB4UMJRUGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="88322505"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2024 16:59:40 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sldQw-0007M6-0N;
	Tue, 03 Sep 2024 23:59:38 +0000
Date: Wed, 4 Sep 2024 07:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2024-05 4177/30000]
 arch/arm64/kvm/perf.c:58:43: error: implicit declaration of function
 'perf_num_counters'; did you mean 'dec_mm_counter'?
Message-ID: <202409040753.jFltpYsd-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.10-2024-05
head:   591df1b051947b5739a144969afb0fbfb2fc611d
commit: 13dbdc0759fd4b89417f64d399ffa6a86fdc7caf [4177/30000] FROMGIT: KVM: arm64: Turn kvm_arm_support_pmu_v3() into a static key
config: arm64-randconfig-003-20240904 (https://download.01.org/0day-ci/archive/20240904/202409040753.jFltpYsd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040753.jFltpYsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040753.jFltpYsd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/perf.c: In function 'kvm_perf_init':
>> arch/arm64/kvm/perf.c:58:43: error: implicit declaration of function 'perf_num_counters'; did you mean 'dec_mm_counter'? [-Werror=implicit-function-declaration]
      58 |         if (IS_ENABLED(CONFIG_ARM_PMU) && perf_num_counters() > 0)
         |                                           ^~~~~~~~~~~~~~~~~
         |                                           dec_mm_counter
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


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
