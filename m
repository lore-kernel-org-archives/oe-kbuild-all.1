Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4727175D53
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767421706; cv=none; b=dp+Am3L3y69xo7P0wQIU3jvpuMhG384lMFGUUctMpAKLL8FqITwb+ZMG8xkIqUdN8jYWKmExUWgd4rmDGq9DovytJaZg5EpaY+nEXl5YradfLX2XsHMh/xMAyCcq9hxaRjwqDHPwAhNJRE4OrUQAaNqzPwOgiDM5EhjLLrmRL04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767421706; c=relaxed/simple;
	bh=UZZzaTH1B+kwFLVioQ2LqZ5InjQZJmYcyWMuiiGMkqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gWwoEggnL+gqPZrBOY9lUoVg4+Y9lV3fjFT/Ne9MSoSBslJ12TIlwo//0MBw9RmbAWTW7lmbLbIUQXOQOzYjFdqMPADa7cBFwj9g6GVB/j+Z32oT4KFtByHVpYotcJpWPpRoFlzfwCVWD+6ERBpaUg0I/140ZUIyaTYpPk0CqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZpdqSzx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZpdqSzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767421704; x=1798957704;
  h=date:from:to:cc:subject:message-id;
  bh=UZZzaTH1B+kwFLVioQ2LqZ5InjQZJmYcyWMuiiGMkqo=;
  b=SZpdqSzxv/HPXqFmczQMY7QSSiA+SZbhVK9TrI45HleOl09tgMm4ZbF2
   9y6FkIBuVaPmQB8mBbcUYyjRflEEWpMP2PV+Qg9ORtzbCXanwWSfpbjpj
   MPyBa/OsIRVZOjlqhROWuU12fJGIto/LZ5ff07TJfpik3o1oNNmGQ1xlC
   4nH01aVdnSkRbAjn68fw3QwYt9Dc3B8GBZkfFYnNL05en7nSyYe0ib28n
   mUBQ/Bbh8KO6/LJYGxNobIVUnVLphV8zZKP/Orifwn1F6hPOeCoe0Bgu/
   S1MX2chB+dUsX7/3upZqmiA1tGQV64KT5eAF0mESdmpI4VBNitwS/9wuF
   A==;
X-CSE-ConnectionGUID: wnfpSOsKSTaFYkAA7VameQ==
X-CSE-MsgGUID: 8zdRt8FcTwys+2D36yofrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68799525"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68799525"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 22:28:23 -0800
X-CSE-ConnectionGUID: pTeL7JA7RvWCXcS64CYuZw==
X-CSE-MsgGUID: icb7pnuUSoSuTY5EhAWtAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="232642980"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jan 2026 22:28:21 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbv7b-000000002b7-2EZ0;
	Sat, 03 Jan 2026 06:28:19 +0000
Date: Sat, 03 Jan 2026 14:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 arch/arm64/mm/fault.c:492:31: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <202601031423.1gEU7yKe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a0f93b828ee5433c5b427d8122a6dda0b514d985
commit: 2fd69fa6bcab984b56ccfd4860b10f11f1966bed [1/1] FROMLIST: arm64/mm: add speculative page fault
config: arm64-randconfig-r122-20251224 (https://download.01.org/0day-ci/archive/20260103/202601031423.1gEU7yKe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601031423.1gEU7yKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601031423.1gEU7yKe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/mm/fault.c:492:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted vm_fault_t @@
   arch/arm64/mm/fault.c:492:31: sparse:     expected int
   arch/arm64/mm/fault.c:492:31: sparse:     got restricted vm_fault_t
   arch/arm64/mm/fault.c:561:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] fault @@     got int @@
   arch/arm64/mm/fault.c:561:15: sparse:     expected restricted vm_fault_t [usertype] fault
   arch/arm64/mm/fault.c:561:15: sparse:     got int
   arch/arm64/mm/fault.c:591:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] fault @@     got int @@
   arch/arm64/mm/fault.c:591:15: sparse:     expected restricted vm_fault_t [usertype] fault
   arch/arm64/mm/fault.c:591:15: sparse:     got int
   arch/arm64/mm/fault.c:620:13: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/arm64/mm/fault.c:620:13: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/arm64/mm/fault.c:665:39: sparse: sparse: restricted vm_fault_t degrades to integer

vim +492 arch/arm64/mm/fault.c

1d18c47c735e8a Catalin Marinas   2012-03-05  471  
1d18c47c735e8a Catalin Marinas   2012-03-05  472  	if (unlikely(!vma))
4745224b45097d Anshuman Khandual 2019-06-07  473  		return VM_FAULT_BADMAP;
1d18c47c735e8a Catalin Marinas   2012-03-05  474  
1d18c47c735e8a Catalin Marinas   2012-03-05  475  	/*
1d18c47c735e8a Catalin Marinas   2012-03-05  476  	 * Ok, we have a good vm_area for this memory access, so we can handle
1d18c47c735e8a Catalin Marinas   2012-03-05  477  	 * it.
1d18c47c735e8a Catalin Marinas   2012-03-05  478  	 */
4745224b45097d Anshuman Khandual 2019-06-07  479  	if (unlikely(vma->vm_start > addr)) {
4745224b45097d Anshuman Khandual 2019-06-07  480  		if (!(vma->vm_flags & VM_GROWSDOWN))
4745224b45097d Anshuman Khandual 2019-06-07  481  			return VM_FAULT_BADMAP;
4745224b45097d Anshuman Khandual 2019-06-07  482  		if (expand_stack(vma, addr))
4745224b45097d Anshuman Khandual 2019-06-07  483  			return VM_FAULT_BADMAP;
4745224b45097d Anshuman Khandual 2019-06-07  484  	}
4745224b45097d Anshuman Khandual 2019-06-07  485  
db6f41063cbdb5 Will Deacon       2013-07-19  486  	/*
db6f41063cbdb5 Will Deacon       2013-07-19  487  	 * Check that the permissions on the VMA allow for the fault which
cab15ce604e550 Catalin Marinas   2016-08-11  488  	 * occurred.
db6f41063cbdb5 Will Deacon       2013-07-19  489  	 */
4745224b45097d Anshuman Khandual 2019-06-07  490  	if (!(vma->vm_flags & vm_flags))
4745224b45097d Anshuman Khandual 2019-06-07  491  		return VM_FAULT_BADACCESS;
6a1bb025d28e10 Peter Xu          2020-08-11 @492  	return handle_mm_fault(vma, addr & PAGE_MASK, mm_flags, regs);
1d18c47c735e8a Catalin Marinas   2012-03-05  493  }
1d18c47c735e8a Catalin Marinas   2012-03-05  494  

:::::: The code at line 492 was first introduced by commit
:::::: 6a1bb025d28e1026fead73b7b33e2dfccba3f4d2 mm/arm64: use general page fault accounting

:::::: TO: Peter Xu <peterx@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
