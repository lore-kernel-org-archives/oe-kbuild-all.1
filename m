Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6173A41C72
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765613905; cv=none; b=giy1T0I5RpVLQyKV/14TwMLeua/Z+U7zq89Hqt5zMCujuq+K9hAGSCXZEyVFxu3mlTGhE8OiV9pYR0Wd/RSwcZd037z0N1+Sg3YCOuqOOmjylfm8kYAp81iPtTTXlwGq9qp+FfItWaeWbnqotyD8Xzx8mBtiCU13lb3hgz2n7l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765613905; c=relaxed/simple;
	bh=zhcXmNfGvh7hlL0VYEbt8qPZcDQSoczOV+fyQi2lS54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWNMoHyhI12LsylCm2cRUTy80TAzKNIUqwKk0uVUqwZ+gj8L/0iyXnPa32xwdaaUmFN+rQcdhrSkJkNE05jMzv4ZMNqz2IlQm7Jr0wfWpm0BaFTZ9VVgu77oTFXmBMKZaoUop+1Jmx4283EpAMPURRBcdxzUwKKEvNEMcVJqkVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgmASEgv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgmASEgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765613904; x=1797149904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zhcXmNfGvh7hlL0VYEbt8qPZcDQSoczOV+fyQi2lS54=;
  b=dgmASEgvptI1R7pRDWONRHvCbjI4e/xQbL+s3IZvbKIs7tfQ+7bLC/+W
   qDN1NvrtKuwYW4K0uT6vxyBkjBB1uQ8e9MpWf50UqRjgwpXSiiCHcuu+N
   hHscpPOcVPvMxLNhKVgKp0FjqJ9RhyQ1MHpqZMrGroT5chomzusS3KvOE
   m2JPDB+T33srb4X1hEqqnlkJiFASrgBd866WluQMQt+71GI/fSMMp/kIl
   jrU9mVXUu81SFGbIzEuD0YJcaVBxS/OdaQPTmTrYEpnvAkaQ0QOGop9nt
   ESnDMfrEbhQ+JhdQenL9uzLInY8MABDGdcX3VSBjZ2uw0Kof6XkXk4X/b
   A==;
X-CSE-ConnectionGUID: N9Dfu3rVT+uHR1Dkc8uWFA==
X-CSE-MsgGUID: Ie0ENy4dT32G7q7G+6sQQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="90255750"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="90255750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:18:18 -0800
X-CSE-ConnectionGUID: 3IT1tDBlQJivwy3EStBsUA==
X-CSE-MsgGUID: rrLgabvDRjel25dlCbXYXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="202201986"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 00:18:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKpS-000000007IF-0fgd;
	Sat, 13 Dec 2025 08:18:14 +0000
Date: Sat, 13 Dec 2025 16:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pgtable20251212 1/2]
 arch/powerpc/include/asm/book3s/64/pgtable.h:1326:54: error: call to
 undeclared function 'ptdesc_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202512131620.roYd2KL4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git pgtable20251212
head:   e5288cc28febf288d2453ca3b4895a0bfd53f28a
commit: f0d01cac9f10dfe6f6cd671dca7d02581c67587a [1/2] mm/pgtable: use ptdesc for pgtable pointer
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20251213/202512131620.roYd2KL4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131620.roYd2KL4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131620.roYd2KL4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
   In file included from arch/powerpc/include/asm/preempt.h:5:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:23:
   In file included from arch/powerpc/include/asm/current.h:13:
   In file included from arch/powerpc/include/asm/paca.h:18:
   In file included from arch/powerpc/include/asm/mmu.h:377:
   In file included from arch/powerpc/include/asm/book3s/64/mmu.h:32:
   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1323:32: warning: declaration of 'struct ptdesc' will not be visible outside of this function [-Wvisibility]
    1323 |                                               pmd_t *pmdp, struct ptdesc *pgtable)
         |                                                                   ^
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1326:54: error: call to undeclared function 'ptdesc_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1326 |                 return radix__pgtable_trans_huge_deposit(mm, pmdp, ptdesc_page(pgtable));
         |                                                                    ^
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1326:54: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Wint-conversion]
    1326 |                 return radix__pgtable_trans_huge_deposit(mm, pmdp, ptdesc_page(pgtable));
         |                                                                    ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/radix.h:294:16: note: passing argument to parameter 'pgtable' here
     294 |                                         pgtable_t pgtable);
         |                                                   ^
   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
   In file included from arch/powerpc/include/asm/preempt.h:5:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:23:
   In file included from arch/powerpc/include/asm/current.h:13:
   In file included from arch/powerpc/include/asm/paca.h:18:
   In file included from arch/powerpc/include/asm/mmu.h:377:
   In file included from arch/powerpc/include/asm/book3s/64/mmu.h:32:
   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:
   arch/powerpc/include/asm/book3s/64/pgtable.h:1327:52: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Wint-conversion]
    1327 |         return hash__pgtable_trans_huge_deposit(mm, pmdp, ptdesc_page(pgtable));
         |                                                           ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/hash-64k.h:277:17: note: passing argument to parameter 'pgtable' here
     277 |                                          pgtable_t pgtable);
         |                                                    ^
   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:13:


vim +/ptdesc_page +1326 arch/powerpc/include/asm/book3s/64/pgtable.h

  1310	
  1311	#define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
  1312	pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
  1313					   unsigned long addr,
  1314					   pmd_t *pmdp, int full);
  1315	
  1316	#define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR_FULL
  1317	pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
  1318					   unsigned long addr,
  1319					   pud_t *pudp, int full);
  1320	
  1321	#define __HAVE_ARCH_PGTABLE_DEPOSIT
  1322	static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
> 1323						      pmd_t *pmdp, struct ptdesc *pgtable)
  1324	{
  1325		if (radix_enabled())
> 1326			return radix__pgtable_trans_huge_deposit(mm, pmdp, ptdesc_page(pgtable));
  1327		return hash__pgtable_trans_huge_deposit(mm, pmdp, ptdesc_page(pgtable));
  1328	}
  1329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
