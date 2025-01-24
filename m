Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316FC1D63FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 04:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737692506; cv=none; b=mFzCMT+1L92zLyrRbazzRS7F1AERKpJrqyfu4J+X+zVKAmI6OGUjcl5Tk0N8opViHEN0Kyh6A6wJkF47OnQIVslpnmHO/+1oLgbo+0OoPwH6GRkvhE14mVmd5afX26i0OXlnFgvStpUQZCuu5dbNsZqUI42rZw0eiSjdGluH5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737692506; c=relaxed/simple;
	bh=Nh4MKb4W6YzJrBWNF8tpyj3aXmaFYL3VY6KYKMstGQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d4mKMx0iVuHG7/FGX9tPb4xldf8XNNJfyCvFaC4dKgDHoMfGv+WNR7Fa2PkIIPRPw6k83NvR4S94EhsHDQGXpBdNfo173+oMRESlRcl4bvjlFL9+H0MEwOVq3F9kTUmh068QX7Vyox5y0GoZ2kGHNtoP3wPVFvsN0tkPGaMX6lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eByBzclv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eByBzclv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737692505; x=1769228505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nh4MKb4W6YzJrBWNF8tpyj3aXmaFYL3VY6KYKMstGQ4=;
  b=eByBzclvZ38Z4H6BcslP3kTrUNnOOPJKo0Oq3LdUjDxl51EiWk9FJIkU
   tAQ2K5BQ8o0LaBc8NpdN4cgnTaBil3p8OCrZ7qAau5QIiObcgLSb1ltKk
   Unaf/YFHUakSLd7cltWREblgQZzqZBlag4b7KvkqaieWzZkH42KoqRm9T
   fAIRomI2mPXM2tQv38u8Xw4s2Cat4Ug7eaO8+RCZtExe/afCEg87dtTg9
   8JCeBbxJJvmyfE6vHEyKEUSkOb5KYE4ka8a2GHZrPynqXVeIc1smJbucQ
   UP6UNfJL1//cmC2jRI3LEEPz5QhLbHnl9JLkeBtt3lBOWE9neZGxkQVCw
   w==;
X-CSE-ConnectionGUID: 9jtviDkNQrWAl5RExkVs1Q==
X-CSE-MsgGUID: pjTwICWIRzyoxynZv2fxJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="42147990"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="42147990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 20:21:43 -0800
X-CSE-ConnectionGUID: VxvuWHt4Rmep9z1VjR+dQg==
X-CSE-MsgGUID: dNVD0RNETdW+Lr9FiLzh/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107479076"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2025 20:21:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbBCN-000c8j-20;
	Fri, 24 Jan 2025 04:21:39 +0000
Date: Fri, 24 Jan 2025 12:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/mprotect.c:450:23: sparse: sparse: cast to non-scalar
Message-ID: <202501241212.q9AAshQc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc8198dc7ebc492ec3e9fa1617dcdfbe98e73b17
commit: cb0f01beb16669e91510fcdb2cea213931aee017 mm/mprotect: fix dax pud handlings
date:   5 months ago
config: alpha-randconfig-r112-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241212.q9AAshQc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241212.q9AAshQc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241212.q9AAshQc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:317:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c:291:9: sparse: sparse: context imbalance in 'change_pte_range' - unexpected unlock
>> mm/mprotect.c:450:23: sparse: sparse: cast to non-scalar
>> mm/mprotect.c:450:23: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:324:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:324:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c:480:47: sparse: sparse: self-comparison always evaluates to false
   mm/mprotect.c:506:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/pgtable.h:317:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast from non-scalar

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
