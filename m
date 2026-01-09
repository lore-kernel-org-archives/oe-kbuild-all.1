Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251FA274B26
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 02:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767924693; cv=none; b=nTPaWmvKQGV43ho7N8QAAEESFSRhsfe8O6r38C//Tk8IpEic5pNAJYiDn9wTyOcgOj4+zscKzfCev1eFAfxyavVOPRCVQrNapUiGeWs4ldwfogQG494UEuakbj9n5x2QcOQyFM1sxa7hpQjia4xwfUVl7U0u2wEfeuFYpa6ceEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767924693; c=relaxed/simple;
	bh=js08W/gcwGY+AsvM1e0W61pE7i0B0uS9kQTu1k0iXLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p6j122fmKiHKEZWfq0XfWNpWEu5kZCVVTwf5DoI+q7IQfmFgi5NRZBGvHOT0yUrSEZe6/ZW8onFVseBYiyAQf2vz5vCZAjKqFLW8L/9vksZdPXqs/3hVJm7i1fIGIhXu6y6TsD4eGagQmDOvhQOj7yPLKWtMlwTwEBna1BtyL2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAwPuK8+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAwPuK8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767924691; x=1799460691;
  h=date:from:to:cc:subject:message-id;
  bh=js08W/gcwGY+AsvM1e0W61pE7i0B0uS9kQTu1k0iXLk=;
  b=ZAwPuK8+gpbkH5TA8Z2tQKHXU2nL2fY0+sLy1pVirydPXUY5Uv63UZyw
   8BxXCcBcMoUIM6JUYCTNA+YcwtHbsKhZGV1SZVN5+e21tvgsfaDQqsqWa
   1vLF1RknTsthURXqxYn/qfe1CWp6hJqn7w+aygMCzbCfcLn/4iUVOdla1
   W3fT/02EIFMVhl1c9Dpqt5iT6uQECydPDL11GcPVnes+/CqPrz77GDvyc
   6sKl4MUZqqXhF9l16QrSjVS0aCpNEl/7eCfpK3HElhnusXq5q65O4N65Z
   W1/TwA2SvmkPOVrBpJ7ZZib1jDhUZEsk0ovUchzc8GgyBQ9U+EZEFHamd
   w==;
X-CSE-ConnectionGUID: P0anfL31Q5uQs+ldAq2UTg==
X-CSE-MsgGUID: iaSQpcRXSH+UUUWr9hR2MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69045893"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69045893"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 18:11:30 -0800
X-CSE-ConnectionGUID: NA6XevqIS1iONeIKNHz3hw==
X-CSE-MsgGUID: 7SUYpoybReG4F2Y+2voDbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203636871"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jan 2026 18:11:16 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve1y5-000000001vY-3lrh;
	Fri, 09 Jan 2026 02:11:13 +0000
Date: Fri, 09 Jan 2026 03:11:07 +0100
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pgtable20260106 5/5]
 ./arch/arm64/include/asm/tlb.h:78:26: error: controlling expression type
 'pgtable_t' (aka 'struct ptdesc *') not compatible with any generic
 association type
Message-ID: <202601090335.Y6huXUc1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/alexshi/linux.git pgtable20260106
head:   f05a003afdd36f111f484e715d286cc31e3dbd59
commit: f05a003afdd36f111f484e715d286cc31e3dbd59 [5/5] mm/pgtable: convert pgtable_t to ptdesc pointer
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260109/202601090335.Y6huXUc1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090335.Y6huXUc1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090335.Y6huXUc1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/oom_kill.c:49:
>> ./arch/arm64/include/asm/tlb.h:78:26: error: controlling expression type 'pgtable_t' (aka 'struct ptdesc *') not compatible with any generic association type
      78 |         struct ptdesc *ptdesc = page_ptdesc(pte);
         |                                 ^~~~~~~~~~~~~~~~
   ./include/linux/mm_types.h:633:36: note: expanded from macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
   1 error generated.
--
   In file included from kernel/sched/core.c:83:
>> ./arch/arm64/include/asm/tlb.h:78:26: error: controlling expression type 'pgtable_t' (aka 'struct ptdesc *') not compatible with any generic association type
      78 |         struct ptdesc *ptdesc = page_ptdesc(pte);
         |                                 ^~~~~~~~~~~~~~~~
   ./include/linux/mm_types.h:633:36: note: expanded from macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
   kernel/sched/core.c:7733:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7733 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7708:1: note: array 'preempt_modes' declared here
    7708 | const char *preempt_modes[] = {
         | ^
   1 warning and 1 error generated.


vim +78 ./arch/arm64/include/asm/tlb.h

58d0ba578bc3b7 Catalin Marinas       2012-03-05  74  
58d0ba578bc3b7 Catalin Marinas       2012-03-05  75  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
58d0ba578bc3b7 Catalin Marinas       2012-03-05  76  				  unsigned long addr)
58d0ba578bc3b7 Catalin Marinas       2012-03-05  77  {
11b4fa8b2a56c0 Vishal Moola (Oracle  2023-08-07 @78) 	struct ptdesc *ptdesc = page_ptdesc(pte);
11b4fa8b2a56c0 Vishal Moola (Oracle  2023-08-07  79) 
11b4fa8b2a56c0 Vishal Moola (Oracle  2023-08-07  80) 	tlb_remove_ptdesc(tlb, ptdesc);
58d0ba578bc3b7 Catalin Marinas       2012-03-05  81  }
58d0ba578bc3b7 Catalin Marinas       2012-03-05  82  

:::::: The code at line 78 was first introduced by commit
:::::: 11b4fa8b2a56c0e7b9db4fe21c134a4cba414657 arm64: convert various functions to use ptdescs

:::::: TO: Vishal Moola (Oracle) <vishal.moola@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
