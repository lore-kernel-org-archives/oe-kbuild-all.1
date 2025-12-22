Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A6E1F151C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 16:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421206; cv=none; b=qCdM0cEdQklHybQN1Vl+by7rtsNI0pQj19IABctssF5VY10K5/Wpf0FWgvLZzImfxexyVwlPFV8ynsVyeeGl4tzW30E0qnCkNuyJqS8HOTEpPmZI2kDBDjQYWHK7hPtSclmo/qcvcetwCbRRt73ICzYvNpVIUf/JunBHPTXLoNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421206; c=relaxed/simple;
	bh=Od44s3rALHG0gHjq28dUWHgUWeod9b1zesMPGVeEGdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQJTNm3pb3kkgwKVNOvsenemzGZSPpJ7uTyC8BAFPEzya3dtTPBgCNhHYbqULdPrAShw5LzvTuHO5cBGl0nYQbYTyRKdZC0VPw1aobq8S2aHku7mONrBAn4i1JJw3XEVZdOuNgSIdB6o6uKNwVVAWW1QU7pY0YiASdpC1SeugmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsIoXLww; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsIoXLww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766421205; x=1797957205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Od44s3rALHG0gHjq28dUWHgUWeod9b1zesMPGVeEGdU=;
  b=jsIoXLww+m5/mfJSwpTid37um60mrmpU/NRL8czGbUJVCxnrukw2FyQX
   ba474O5wvZQh+VmDyRCz2/64nVsa/tDcR5XC7cfBvmXcaX7Nq2yftBafK
   33wqMMg1+wOzeVOEMvCz06FNmb3vpYxTNgge8AESkRQNyC7BRZ67l0F+3
   KDY/802eczmsR5oa6JaxfnCSs+zO6Kr24YqkjjHzz7QhpkuSgpSe2vATV
   9cvMRaU2jHzADYpNv6t95hgPwnqWqkG/jZabdhYpxr8zZuDv0OR/WwGqj
   kSFzEGpJ86D+2AgmeUg4yjbtJtYIz44D7Po2Pis2hpKGGqn2rKu/tIR+f
   g==;
X-CSE-ConnectionGUID: e6A0OnOOQVK67v1c2J7MDw==
X-CSE-MsgGUID: /7H/a+L3RAyzEAEd6O7yiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93748331"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="93748331"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:33:23 -0800
X-CSE-ConnectionGUID: O1Orh5fQSkmT+fXBYYOCCA==
X-CSE-MsgGUID: 7F355vvTRrG8v9QVo5oPBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="230221418"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2025 08:33:23 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXiqW-000000005YW-0jxw;
	Mon, 22 Dec 2025 16:33:20 +0000
Date: Mon, 22 Dec 2025 17:33:00 +0100
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pgtable14 1/2]
 ./arch/powerpc/include/asm/book3s/64/pgtable.h:1326:68: error: implicit
 declaration of function 'page_ptdesc'
Message-ID: <202512221734.A8ZOnZEK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git pgtable14
head:   d9bb8deea009b236ba354e09f922bfa97741bced
commit: 75736837bf306bf5c2a2d52cc5ac9e74f187a116 [1/2] mm/pgtable: use ptdesc for pgtable pointer-6.19
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512221734.A8ZOnZEK-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221734.A8ZOnZEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221734.A8ZOnZEK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                    from ./arch/powerpc/include/asm/book3s/64/mmu.h:32,
                    from ./arch/powerpc/include/asm/mmu.h:377,
                    from ./arch/powerpc/include/asm/paca.h:18,
                    from ./arch/powerpc/include/asm/current.h:13,
                    from ./include/linux/thread_info.h:23,
                    from ./include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/asm/preempt.h:5,
                    from ./include/linux/preempt.h:79,
                    from ./include/linux/alloc_tag.h:11,
                    from ./include/linux/rhashtable-types.h:12,
                    from ./include/linux/ipc.h:7,
                    from ./include/uapi/linux/sem.h:5,
                    from ./include/linux/sem.h:5,
                    from ./include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:13:
>> ./arch/powerpc/include/asm/book3s/64/pgtable.h:1323:67: warning: 'struct ptdesc' declared inside parameter list will not be visible outside of this definition or declaration
    1323 |                                               pmd_t *pmdp, struct ptdesc *pgtable)
         |                                                                   ^~~~~~
   ./arch/powerpc/include/asm/book3s/64/pgtable.h: In function 'pgtable_trans_huge_deposit':
>> ./arch/powerpc/include/asm/book3s/64/pgtable.h:1326:68: error: implicit declaration of function 'page_ptdesc' [-Wimplicit-function-declaration]
    1326 |                 return radix__pgtable_trans_huge_deposit(mm, pmdp, page_ptdesc(pgtable));
         |                                                                    ^~~~~~~~~~~
>> ./arch/powerpc/include/asm/book3s/64/pgtable.h:1326:68: error: passing argument 3 of 'radix__pgtable_trans_huge_deposit' makes pointer from integer without a cast [-Wint-conversion]
    1326 |                 return radix__pgtable_trans_huge_deposit(mm, pmdp, page_ptdesc(pgtable));
         |                                                                    ^~~~~~~~~~~~~~~~~~~~
         |                                                                    |
         |                                                                    int
   In file included from ./arch/powerpc/include/asm/book3s/64/pgtable.h:297:
   ./arch/powerpc/include/asm/book3s/64/radix.h:294:51: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'int'
     294 |                                         pgtable_t pgtable);
         |                                         ~~~~~~~~~~^~~~~~~
>> ./arch/powerpc/include/asm/book3s/64/pgtable.h:1327:59: error: passing argument 3 of 'hash__pgtable_trans_huge_deposit' makes pointer from integer without a cast [-Wint-conversion]
    1327 |         return hash__pgtable_trans_huge_deposit(mm, pmdp, page_ptdesc(pgtable));
         |                                                           ^~~~~~~~~~~~~~~~~~~~
         |                                                           |
         |                                                           int
   In file included from ./arch/powerpc/include/asm/book3s/64/hash.h:19,
                    from ./arch/powerpc/include/asm/book3s/64/pgtable.h:296:
   ./arch/powerpc/include/asm/book3s/64/hash-4k.h:164:52: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'int'
     164 |                                          pgtable_t pgtable);
         |                                          ~~~~~~~~~~^~~~~~~


vim +/page_ptdesc +1326 ./arch/powerpc/include/asm/book3s/64/pgtable.h

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
> 1326			return radix__pgtable_trans_huge_deposit(mm, pmdp, page_ptdesc(pgtable));
> 1327		return hash__pgtable_trans_huge_deposit(mm, pmdp, page_ptdesc(pgtable));
  1328	}
  1329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
