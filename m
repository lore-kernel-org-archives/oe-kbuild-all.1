Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9F1FCF78
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731532599; cv=none; b=rJlI9v0x6xo6k+ASQ8vsTRPF9aLCVg46PodpkirKuSgukGZD5dwQdS+kL2MHKcOfvtxIX56Niy7lfsx1bPJt5XyiTcWuTFUeFfGcpPSD1LVoUg4KC6o60LCoviIjCXzKrDQwy/H673oMipGi4FOIBw3MMz9nZhuafX5Ys+m7oRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731532599; c=relaxed/simple;
	bh=qacnE+IBDNGC7FAhhAAQKWfQUnVIlEvBXtBk27jmbic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YaCEpFCN/ywroB5iA+dzwyrYipTQxSMVBXz4GNdTOdQ9HhdA9kXn8pJ7lz+RWwhnNQV3xw3FwWJs1zvbupp+S7Sb955LpMEuI/JtlXQFfC86ZtDrzGblBkzG+zVaLIZSFH1SPiM1icR/744FxZ4hHx2FL1iEH6cTqbo5welYWgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8DY9f5l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8DY9f5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731532598; x=1763068598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qacnE+IBDNGC7FAhhAAQKWfQUnVIlEvBXtBk27jmbic=;
  b=g8DY9f5lYmfeKZg/2QgB3PCp/PZxN/lMUwLJVmr/7lhc7Sj90iF/XaNQ
   ZMtHa3j9oUHutTD3ozAHrlrbiT9hgPIsRAJgpQsjPbmFSkmaB3IgaUYlN
   dwgj6YUbo2uKK9TO04qAl+5isBXq+WT7RYzvf/ybfLA3MYlF2QuZj1vMM
   eN49D00filzIBvDvqtGUtzZymAC66MNaiflp35vIyKmSoqyYvEkgVGW8r
   OFFuZ81IbcVe7rbaXy+v6QfqWxaRUPQXbxNT+r4H3Ey0kE9IddMybH2p0
   gGXLTDifD/2/LsDJJC3nWrENvIzhIbpy8RxscgVzpgA6NPnFCqY7XuHWD
   w==;
X-CSE-ConnectionGUID: XhspVb8yTLWqtyFvGtGkXQ==
X-CSE-MsgGUID: jZFWTYJJQd2x1PGIqE7OwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53990742"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53990742"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 13:16:37 -0800
X-CSE-ConnectionGUID: FuTvtVUhTYmuSrO7sONG8g==
X-CSE-MsgGUID: iZ+jY1tkSGSjbYR+M0kz3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="93056462"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2024 13:16:37 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBKj4-0000j1-0D;
	Wed, 13 Nov 2024 21:16:34 +0000
Date: Thu, 14 Nov 2024 05:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 392/30000]
 arch/arm64/kvm/perf.c:58:43: error: implicit declaration of function
 'perf_num_counters'; did you mean 'dec_mm_counter'?
Message-ID: <202411140550.zKuad3HV-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   e733b347fbf8a8a5149461d848bf4e726141afaf
commit: 13dbdc0759fd4b89417f64d399ffa6a86fdc7caf [392/30000] FROMGIT: KVM: arm64: Turn kvm_arm_support_pmu_v3() into a static key
config: arm64-randconfig-004-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140550.zKuad3HV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140550.zKuad3HV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140550.zKuad3HV-lkp@intel.com/

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
