Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557DB48035F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 22:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844202; cv=none; b=pb4UF88PiPLV5b6VNSTsjKSHxz3HYx5GFs9ALKst+LOiDzd6gS9roX0QZUyEMevYNXXU9KCDLtlYZvn913By0hFHgJ8cqZzS205WoYC7gYyYRn66VtadwdAHePUNcgh2s2pvQRRz/T47No7m+xCTQLKToKhJWQLFKO9tePgIdYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844202; c=relaxed/simple;
	bh=2FTkbND3Dt/OHN1pkMQmd5qQr47OeIQv07P3ZA+x4Io=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ROuAHgQXtfHesWWHWjo2puVAo15qI2occBQiuRrYP57d+N6XNavgjZiddiNmaatUOGyQl6WlmccrIkPrhNGUgxiDh3hmqoyDVnv9y6P5VTtdpX0dvw7eYrzbrCvfx/qtRN/RIzGQ63OpKz6W6MpurQWFQHfCWmwvLkJqrAACXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KT6Je5qt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KT6Je5qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791844201; x=1823380201;
  h=date:from:to:cc:subject:message-id;
  bh=2FTkbND3Dt/OHN1pkMQmd5qQr47OeIQv07P3ZA+x4Io=;
  b=KT6Je5qt3pQmheTs4bvszajPulpGPt2Ai0pa+hpfiO3EG9QbtuL+TbD6
   qdizQParrPQuJMaSctcqdKwWltuvHfbEXg5Tah4oM1lxBG3ADOCcLqEaY
   rQICUaeKFnZto9JXva/vY/PLcVEgHQ23ynpAb/xd6KxFqPcoBD/ykfUn3
   7mTaWjGW+zN7dqcOZyN8AAmUILaZfCS3Up/jD04pwCqhuOgNKmfFRoYWY
   X8XZKGSdoTV5UBeFZZeSOWkvLBzQn5o9XCGkV+Id6BCu1vBGOD4ad1HZ0
   R9DLUvZOIEhP6kxAhYUyo9lIPFTd6SKtb2Bqf49Lcw5R7yOSHi4mUT6SQ
   Q==;
X-CSE-ConnectionGUID: W1hLoNQuRUGjjtpsK0qZ/A==
X-CSE-MsgGUID: iWT9TqNHQvuRTDDwKBxbxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="459443"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="459443"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 15:30:01 -0700
X-CSE-ConnectionGUID: QahGzmKySN+TpnLi0pchIQ==
X-CSE-MsgGUID: sN3fVMGASASSDCVDX39NfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2851274"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 12 Oct 2026 15:30:00 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGOWr-00000000AFL-1kox;
	Mon, 12 Oct 2026 22:29:57 +0000
Date: Tue, 13 Oct 2026 00:29:31 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3] mm/huge_memory.c:587:43:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202610130032.PFgyutM6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5d2084fcd40490bcc3ca6b739d13a91f75791991
commit: 8a9183c5070d253367df1933eb6e6b30da7d91ba [0/3] ANDROID: mm: Export several symbols
config: i386-randconfig-2302-20261012 (https://download.01.org/0day-ci/archive/20261013/202610130032.PFgyutM6-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130032.PFgyutM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130032.PFgyutM6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/huge_memory.c:587:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct mthp_stat * @@
   mm/huge_memory.c:587:43: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/huge_memory.c:587:43: sparse:     got struct mthp_stat *
   mm/huge_memory.c:2033:20: sparse: sparse: context imbalance in 'madvise_free_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2071:28: sparse: sparse: context imbalance in 'zap_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2194:28: sparse: sparse: context imbalance in 'move_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2334:20: sparse: sparse: context imbalance in 'change_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2531:12: sparse: sparse: context imbalance in '__pmd_trans_huge_lock' - wrong count at exit
   mm/huge_memory.c:2659:18: sparse: sparse: context imbalance in '__split_huge_zero_page_pmd' - unexpected unlock
   mm/huge_memory.c:2873:18: sparse: sparse: context imbalance in '__split_huge_pmd_locked' - unexpected unlock
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
