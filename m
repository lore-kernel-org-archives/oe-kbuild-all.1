Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5413CCA05
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660619; cv=none; b=hvQvUfk6Updk9fONjjqjvW72pfN7IS86BtEL1qvc5gG0XRCQbNnRTfgAdumDVMv6LL3vL0NsifkTROevSdXRzZxHtVVe8/od1xvtuEnU53GBKjaBMEZalaBcutdqpPsdIXeiXsaSUASL1rL5T5U+imF/YVwb0uAl65zJsu0EGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660619; c=relaxed/simple;
	bh=kY3OFgLidG8Ev0zOyhZTXiGS992XQUHi5kuYNVLY57Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=embbZUbtHMybBkGlOPgNIEVob8qq+BLlanlOazdgWn2VfYg4Sa2T1RNOulzJRW2Nw5YLC52fNIn3lfQUYEvxvs/c4sR+p9o3QCvuX893gwo2rOrNbov97weiOgpNtpxCdX4igsJbEbcM8Te1vYgsvUkfVcuxLoenCopgs6HtcAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVtg5Hgr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVtg5Hgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772660617; x=1804196617;
  h=date:from:to:cc:subject:message-id;
  bh=kY3OFgLidG8Ev0zOyhZTXiGS992XQUHi5kuYNVLY57Y=;
  b=BVtg5HgrpxsFN6WFFR1eBQWkmo5lnrJ1Tl406+ba3oICdz1oyTNnkFWm
   w8udP5CdozdzcMcDw7elmWs6AG6VHGlpXTvmWFPvyqHLR4MCfUv+LfkKN
   rfCENazN4N8Z0zZjtORpQtAaueh26HkGaCCSOAaitN7EtiGcrm5I7fzYA
   Sy8jklErtMUXSB4T0MEEkz9Yp0vzjbt3iTsncPcsf80uAYoCHuMNSkmI/
   2SOUhC8O/XnRAhZM2GKEkJiB5q4TOCp5ZowYGot7YsF+lEWaLdfiSV+Ag
   k40DjsdzDsmrDkH4CTPFb6PR0UTkS/l6v5ckjZ3p92Pl1cpVwhUIuAmFD
   A==;
X-CSE-ConnectionGUID: 8nbfUKO9Q72ktvs9PxbgQA==
X-CSE-MsgGUID: u6yxumC1SjCk6nfDIqsvrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73648863"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73648863"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 13:43:37 -0800
X-CSE-ConnectionGUID: Z9yyZ/4bTqiBh7Xvb3ohqg==
X-CSE-MsgGUID: Z626tdp/TWu6VTK712uT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="256350557"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Mar 2026 13:43:36 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxu0C-000000004Z3-1zfn;
	Wed, 04 Mar 2026 21:43:32 +0000
Date: Thu, 05 Mar 2026 05:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 6/6]
 arch/arm64/kvm/perf.c:58:36: error: implicit declaration of function
 'perf_num_counters'; did you mean 'dec_mm_counter'?
Message-ID: <202603050502.j5F77tiV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Marc,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   8426c769398ef6f4ac3f61df3f3ec10bd11b0e50
commit: 13dbdc0759fd4b89417f64d399ffa6a86fdc7caf [6/6] FROMGIT: KVM: arm64: Turn kvm_arm_support_pmu_v3() into a static key
config: arm64-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050502.j5F77tiV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050502.j5F77tiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050502.j5F77tiV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/perf.c: In function 'kvm_perf_init':
>> arch/arm64/kvm/perf.c:58:36: error: implicit declaration of function 'perf_num_counters'; did you mean 'dec_mm_counter'? [-Werror=implicit-function-declaration]
      58 |  if (IS_ENABLED(CONFIG_ARM_PMU) && perf_num_counters() > 0)
         |                                    ^~~~~~~~~~~~~~~~~
         |                                    dec_mm_counter
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
