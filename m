Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7368E78C9C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 06:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769842253; cv=none; b=axtnKNAZ9zj+VPFovPWJ3it02FS//PpEdfFcMgiw+P9VGy4XxQzA0IlOaExVX4vz7gJy6l91jenFiG8m2WwMURFY8NyvS9BfJ/RU8ahpYo9rOc+URQ83T+Dn5kOij3OZk2RLL3Ipgb5FMg73jyy2q6BHAsXqNBUPfE8ffQ0Se3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769842253; c=relaxed/simple;
	bh=hq9bjMRNfleLaMa9JPCR4e9dq2fQ51oxVXA5NKwjDCQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F/2mT2E7M08kwxwE4IQgCMkEF5I+nqR6thPKUfqi8pVMOcsx+pHLjM1Wdgxq1+r+/cvYSAk/PNxOwsfTr+M4UIp38FqIdglJolE9UqmiZm9YUPeM/cMCZCk+QWg0S9xRGMWevBu6EyT5Bsf9sRkfoCykhmgCvqNlApYuB5ZRBA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEs8c5kl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEs8c5kl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769842251; x=1801378251;
  h=date:from:to:cc:subject:message-id;
  bh=hq9bjMRNfleLaMa9JPCR4e9dq2fQ51oxVXA5NKwjDCQ=;
  b=JEs8c5klGUtyi7wsJYMdBrLcPWJQi9lz87LJ/cWdqG8pTpYnQ0O69sCW
   ZwaSiog/MObd0x9wlZFNYLrNz8GVgparBcda1z5ENCGsFTmCoxLbM0Low
   amoN1YVvavFLbl5H2nDr/Tby/SzdqStJroWYPU3WM26ddWIuVABOqBRRs
   T9NiRKrlrixvM4252O7URoZtrhEIgi3k4de95TVQ0T3m8vYVw78M08/73
   AU+rbdkqdfWNLc0OzPZld+m250A5h4xLTZC0vigd7NhsHSxN1Q8v3b88v
   gGDq1gnVB0VdtX/E8X4kVXDv2CIMPF7FxPlDoNq53tWNGaBcZIsi/0xXV
   w==;
X-CSE-ConnectionGUID: NU9xehRmTru6vttSK2j66Q==
X-CSE-MsgGUID: +EpPnG0OQfWRvFB2MPs51A==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="93741580"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="93741580"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 22:50:51 -0800
X-CSE-ConnectionGUID: 8085+dSGT8a011FMly9yig==
X-CSE-MsgGUID: EcLM/iZURSmWSfutoEOtqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208830009"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Jan 2026 22:50:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm4oh-00000000dje-24xm;
	Sat, 31 Jan 2026 06:50:47 +0000
Date: Sat, 31 Jan 2026 14:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 1/1]
 mm/mprotect.c:450:23: sparse: sparse: cast to non-scalar
Message-ID: <202601311415.jQSMYGyc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   b0db7303999ab85299677bd8bb5c75853762e863
commit: cb0f01beb16669e91510fcdb2cea213931aee017 [1/1] mm/mprotect: fix dax pud handlings
config: arm64-randconfig-r132-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311415.jQSMYGyc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311415.jQSMYGyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311415.jQSMYGyc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mprotect.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/pagewalk.h):
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:869:25: sparse: sparse: context imbalance in 'change_pte_range' - unexpected unlock
>> mm/mprotect.c:450:23: sparse: sparse: cast to non-scalar
>> mm/mprotect.c:450:23: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:324:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:324:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/pagewalk.h):
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:315:16: sparse: sparse: cast from non-scalar

vim +450 mm/mprotect.c

   428	
   429	static inline long change_pud_range(struct mmu_gather *tlb,
   430			struct vm_area_struct *vma, p4d_t *p4d, unsigned long addr,
   431			unsigned long end, pgprot_t newprot, unsigned long cp_flags)
   432	{
   433		struct mmu_notifier_range range;
   434		pud_t *pudp, pud;
   435		unsigned long next;
   436		long pages = 0, ret;
   437	
   438		range.start = 0;
   439	
   440		pudp = pud_offset(p4d, addr);
   441		do {
   442	again:
   443			next = pud_addr_end(addr, end);
   444			ret = change_prepare(vma, pudp, pmd, addr, cp_flags);
   445			if (ret) {
   446				pages = ret;
   447				break;
   448			}
   449	
 > 450			pud = READ_ONCE(*pudp);
   451			if (pud_none(pud))
   452				continue;
   453	
   454			if (!range.start) {
   455				mmu_notifier_range_init(&range,
   456							MMU_NOTIFY_PROTECTION_VMA, 0,
   457							vma->vm_mm, addr, end);
   458				mmu_notifier_invalidate_range_start(&range);
   459			}
   460	
   461			if (pud_leaf(pud)) {
   462				if ((next - addr != PUD_SIZE) ||
   463				    pgtable_split_needed(vma, cp_flags)) {
   464					__split_huge_pud(vma, pudp, addr);
   465					goto again;
   466				} else {
   467					ret = change_huge_pud(tlb, vma, pudp,
   468							      addr, newprot, cp_flags);
   469					if (ret == 0)
   470						goto again;
   471					/* huge pud was handled */
   472					if (ret == HPAGE_PUD_NR)
   473						pages += HPAGE_PUD_NR;
   474					continue;
   475				}
   476			}
   477	
   478			pages += change_pmd_range(tlb, vma, pudp, addr, next, newprot,
   479						  cp_flags);
   480		} while (pudp++, addr = next, addr != end);
   481	
   482		if (range.start)
   483			mmu_notifier_invalidate_range_end(&range);
   484	
   485		return pages;
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
