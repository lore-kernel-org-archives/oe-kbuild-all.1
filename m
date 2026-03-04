Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729463A6EEF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633698; cv=none; b=bQ/8bFohAu/LUw2UKy6I00Z9LL3EUqRynPAPOyvzhfGTmp0MACXoGAXFfnUOTxIr1QLVXYsPwHFG/km6v+/DWyxXvmYmALX7YppY5aSi7M1kvpo7R4q8MHvFEhX0sdLn9I09QfTAJRbirfHns39CIg9KT/mXbc1MdBDTdJYWCMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633698; c=relaxed/simple;
	bh=Iz3J4zbFCa8o2vl0dKPuCEoE8IrRuHIWSUaNtCwZoyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uw62NYEoJzFQ1DFGpOe2Wj1xueLlngfo5ugD8DILJIUif/ZyBFB/2rPbj02EmAjPz7fpTQmGrmESNo5Nc/DNoL2BOcjFpZVSmr4oQHuEzxkivPPSKZBt1w0xSuYKPPkQV0HnTeo6zsi6YiJ44/HCIMXzUniEQDEEHXfg5VJsedA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKYkqWt1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKYkqWt1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772633697; x=1804169697;
  h=date:from:to:cc:subject:message-id;
  bh=Iz3J4zbFCa8o2vl0dKPuCEoE8IrRuHIWSUaNtCwZoyI=;
  b=YKYkqWt1MCgJi942wnEtUAjkD0lwNmf1Tdia5PW7Ze6Cc16DZKkkqiRh
   HoHRmqQCZiGvaMrJtUMrnUZwr9qfOsphCJ9DPDdxzTEH8FkV+rQW9kTKp
   jef6mp4Y6Tat2P8VwoBZs5FxvWU0QFbNyuFPVi8zBvsaRGayOzKtkhHE1
   JnDH/dE/+K/Jahq6T5J/CpskIUsV1Egd2OTLQXHEVpSfqHS+FUAheNMot
   NXzWf50wfMuu/ocBdgOAbn4f17Qpk+QEqqot7w1U9ncx6poX9/Ljs3gOK
   hmsxW23IV2XY5pPmxMvf8G3IePq1SAlhh1/fsAoMdIP9aBlRJFTQyt2qN
   w==;
X-CSE-ConnectionGUID: pG9WLghOSdKGsoII0bLTLg==
X-CSE-MsgGUID: dCPn7HasTP61kbh9lmUaAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73391406"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73391406"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 06:14:54 -0800
X-CSE-ConnectionGUID: YK1lP23WSGWXZFb29cSGKQ==
X-CSE-MsgGUID: vOLnIlAOT/Kj8lv+if3URA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="245005891"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2026 06:14:52 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmzy-000000003of-02x4;
	Wed, 04 Mar 2026 14:14:50 +0000
Date: Wed, 04 Mar 2026 22:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 mm/huge_memory.c:587:43: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202603042205.0OY8Zg4l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   8e5209e3b2974d51db2fd44a262f0d2bc2b7798d
commit: 8a9183c5070d253367df1933eb6e6b30da7d91ba [1/1] ANDROID: mm: Export several symbols
config: x86_64-randconfig-r122-20260304 (https://download.01.org/0day-ci/archive/20260304/202603042205.0OY8Zg4l-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603042205.0OY8Zg4l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603042205.0OY8Zg4l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/huge_memory.c:587:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct mthp_stat * @@
   mm/huge_memory.c:587:43: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/huge_memory.c:587:43: sparse:     got struct mthp_stat *
   mm/huge_memory.c:2033:20: sparse: sparse: context imbalance in 'madvise_free_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2071:28: sparse: sparse: context imbalance in 'zap_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2194:28: sparse: sparse: context imbalance in 'move_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2334:20: sparse: sparse: context imbalance in 'change_huge_pmd' - unexpected unlock
   mm/huge_memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/x86/include/asm/pgtable.h:898:9: sparse: sparse: context imbalance in 'change_huge_pud' - unexpected unlock
   mm/huge_memory.c:2416:28: sparse: sparse: context imbalance in 'move_pages_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2531:12: sparse: sparse: context imbalance in '__pmd_trans_huge_lock' - wrong count at exit
   mm/huge_memory.c:2549:12: sparse: sparse: context imbalance in '__pud_trans_huge_lock' - wrong count at exit
   mm/huge_memory.c:2575:28: sparse: sparse: context imbalance in 'zap_huge_pud' - unexpected unlock
   mm/huge_memory.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in '__split_huge_zero_page_pmd' - unexpected unlock
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in '__split_huge_pmd_locked' - unexpected unlock
   mm/huge_memory.c:3271:30: sparse: sparse: context imbalance in '__split_huge_page' - unexpected unlock
   mm/huge_memory.c:3574:17: sparse: sparse: context imbalance in 'split_huge_page_to_list_to_order' - different lock contexts for basic block
   mm/huge_memory.c:4012:17: sparse: sparse: context imbalance in 'split_huge_pages_pid' - unexpected unlock

vim +587 mm/huge_memory.c

ec33687c674934d Barry Song 2024-04-12  580  
ec33687c674934d Barry Song 2024-04-12  581  static unsigned long sum_mthp_stat(int order, enum mthp_stat_item item)
ec33687c674934d Barry Song 2024-04-12  582  {
ec33687c674934d Barry Song 2024-04-12  583  	unsigned long sum = 0;
ec33687c674934d Barry Song 2024-04-12  584  	int cpu;
ec33687c674934d Barry Song 2024-04-12  585  
ec33687c674934d Barry Song 2024-04-12  586  	for_each_possible_cpu(cpu) {
ec33687c674934d Barry Song 2024-04-12 @587  		struct mthp_stat *this = &per_cpu(mthp_stats, cpu);
ec33687c674934d Barry Song 2024-04-12  588  
ec33687c674934d Barry Song 2024-04-12  589  		sum += this->stats[order][item];
ec33687c674934d Barry Song 2024-04-12  590  	}
ec33687c674934d Barry Song 2024-04-12  591  
ec33687c674934d Barry Song 2024-04-12  592  	return sum;
ec33687c674934d Barry Song 2024-04-12  593  }
ec33687c674934d Barry Song 2024-04-12  594  

:::::: The code at line 587 was first introduced by commit
:::::: ec33687c674934dfefd782a8ffd58370b080b503 mm: add per-order mTHP anon_fault_alloc and anon_fault_fallback counters

:::::: TO: Barry Song <v-songbaohua@oppo.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
