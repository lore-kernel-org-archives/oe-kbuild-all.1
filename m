Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A905D15CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 05:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705729533; cv=none; b=JP6wjgOjf4yAGkkad+VDzdKxWs2xwQ6uRHsoEykgQVaJ2sTH6Rxfb78EFG8tyrHA0duHfcC3iFBJLeXBar6K2k3eF0xOoYAFtMwpTRVCuB1zlLTf5IDPc/9GTU7WUvwKMpb1D/R1menQZ+tcHV5E5NfPNQZwVber0Sf3/De8GeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705729533; c=relaxed/simple;
	bh=M2jj8gKpNzRbPodN+dpix5IE+qWYYc6DaFjPFdb24bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOFd3F9Jv1v42pAg1hqYzCWnvbYOb/K7EadR2bt1nqx8CDWvOa52pEJP5ox5VJFyLrj2EZvSbhkpTWQSyqj2VkMp4eMmYkXk8/YT32TCdksBIsq7i2H1aDOs0sIN9N5+pBzf1OuRZ+uCPlAuJPHsDqnCrnnngjuVL2KAbX1qdFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpF5/31H; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpF5/31H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705729531; x=1737265531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2jj8gKpNzRbPodN+dpix5IE+qWYYc6DaFjPFdb24bc=;
  b=cpF5/31H+XsZmFwdCnZI6S5NDe9wcjULWWx20gTKw1CCWN4VYwNpM3kS
   OpBASRbLJ3y7SuERfyLURjUST7X+adU3zDBv7gHvukIUZr3Wh5n9YzRPU
   HSKczSExfSfchlkSgTpTy+U2H5VpqAoZxlvLGSuiaT7aF1BQIAsQKN5u+
   2KdX11iW5lvqhYP0bXHzYdrrGJ+36FYfd8beBz5j5GOhtkABiSMMAt8JO
   O3FjYgdmd846dUs7USLGRO/qlxrtO9qcO2sQjfjbxhNc4vqvLUHvUkDPh
   8ITHBpQfny2sRiHWpy6xq5Zba4uX7BD5nfkeQQqNDr/Tw17LATk+Aq9iU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14264991"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="14264991"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 21:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="734718144"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="734718144"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Jan 2024 21:45:28 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR4AX-0004n0-2L;
	Sat, 20 Jan 2024 05:45:25 +0000
Date: Sat, 20 Jan 2024 13:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 5/15] arch/x86/kernel/head64.c:204:26: error: no
 member named 'p4d' in 'p4d_t'
Message-ID: <202401201332.4jmtJEQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   29ffb3695f4c4dbeaf110a752cee0d918e3b6519
commit: ba3aea73d69bd8a9df0bc2584476be6a51ce4d33 [5/15] x86/head64: Replace pointer fixups with PIE codegen
config: x86_64-randconfig-104-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201332.4jmtJEQT-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201332.4jmtJEQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201332.4jmtJEQT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/head64.c:204:26: error: no member named 'p4d' in 'p4d_t'
     204 |                 level4_kernel_pgt[511].p4d += load_delta;
         |                 ~~~~~~~~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +204 arch/x86/kernel/head64.c

   161	
   162	unsigned long __init __startup_64(unsigned long physaddr,
   163					  struct boot_params *bp)
   164	{
   165		unsigned long load_delta, *p;
   166		unsigned long pgtable_flags;
   167		pgdval_t *pgd;
   168		p4dval_t *p4d;
   169		pudval_t *pud;
   170		pmdval_t *pmd, pmd_entry;
   171		bool la57;
   172		int i;
   173	
   174		la57 = check_la57_support();
   175	
   176		/* Is the address too large? */
   177		if (physaddr >> MAX_PHYSMEM_BITS)
   178			for (;;);
   179	
   180		/*
   181		 * Compute the delta between the address I am compiled to run at
   182		 * and the address I am actually running at.
   183		 */
   184		load_delta = physaddr - (__va_symbol(_text) - __START_KERNEL_map);
   185	
   186		/* Is the address not 2M aligned? */
   187		if (load_delta & ~PMD_MASK)
   188			for (;;);
   189	
   190		/* Include the SME encryption mask in the fixup value */
   191		load_delta += sme_get_me_mask();
   192	
   193		/* Fixup the physical addresses in the page table */
   194	
   195		pgd = (pgdval_t *)early_top_pgt;
   196		p = pgd + pgd_index(__START_KERNEL_map);
   197		if (la57)
   198			*p = (unsigned long)level4_kernel_pgt;
   199		else
   200			*p = (unsigned long)level3_kernel_pgt;
   201		*p += _PAGE_TABLE_NOENC + sme_get_me_mask();
   202	
   203		if (la57)
 > 204			level4_kernel_pgt[511].p4d += load_delta;
   205	
   206		level3_kernel_pgt[510].pud += load_delta;
   207		level3_kernel_pgt[511].pud += load_delta;
   208	
   209		for (i = FIXMAP_PMD_TOP; i > FIXMAP_PMD_TOP - FIXMAP_PMD_NUM; i--)
   210			level2_fixmap_pgt[i].pmd += load_delta;
   211	
   212		/*
   213		 * Set up the identity mapping for the switchover.  These
   214		 * entries should *NOT* have the global bit set!  This also
   215		 * creates a bunch of nonsense entries but that is fine --
   216		 * it avoids problems around wraparound.
   217		 */
   218	
   219		pud = (pudval_t *)early_dynamic_pgts[next_early_pgt++];
   220		pmd = (pmdval_t *)early_dynamic_pgts[next_early_pgt++];
   221	
   222		pgtable_flags = _KERNPG_TABLE_NOENC + sme_get_me_mask();
   223	
   224		if (la57) {
   225			p4d = (p4dval_t *)early_dynamic_pgts[next_early_pgt++];
   226	
   227			i = (physaddr >> PGDIR_SHIFT) % PTRS_PER_PGD;
   228			pgd[i + 0] = (pgdval_t)p4d + pgtable_flags;
   229			pgd[i + 1] = (pgdval_t)p4d + pgtable_flags;
   230	
   231			i = physaddr >> P4D_SHIFT;
   232			p4d[(i + 0) % PTRS_PER_P4D] = (pgdval_t)pud + pgtable_flags;
   233			p4d[(i + 1) % PTRS_PER_P4D] = (pgdval_t)pud + pgtable_flags;
   234		} else {
   235			i = (physaddr >> PGDIR_SHIFT) % PTRS_PER_PGD;
   236			pgd[i + 0] = (pgdval_t)pud + pgtable_flags;
   237			pgd[i + 1] = (pgdval_t)pud + pgtable_flags;
   238		}
   239	
   240		i = physaddr >> PUD_SHIFT;
   241		pud[(i + 0) % PTRS_PER_PUD] = (pudval_t)pmd + pgtable_flags;
   242		pud[(i + 1) % PTRS_PER_PUD] = (pudval_t)pmd + pgtable_flags;
   243	
   244		pmd_entry = __PAGE_KERNEL_LARGE_EXEC & ~_PAGE_GLOBAL;
   245		/* Filter out unsupported __PAGE_KERNEL_* bits: */
   246		pmd_entry &= __supported_pte_mask;
   247		pmd_entry += sme_get_me_mask();
   248		pmd_entry +=  physaddr;
   249	
   250		for (i = 0; i < DIV_ROUND_UP(_end - _text, PMD_SIZE); i++) {
   251			int idx = i + (physaddr >> PMD_SHIFT);
   252	
   253			pmd[idx % PTRS_PER_PMD] = pmd_entry + i * PMD_SIZE;
   254		}
   255	
   256		/*
   257		 * Fixup the kernel text+data virtual addresses. Note that
   258		 * we might write invalid pmds, when the kernel is relocated
   259		 * cleanup_highmap() fixes this up along with the mappings
   260		 * beyond _end.
   261		 *
   262		 * Only the region occupied by the kernel image has so far
   263		 * been checked against the table of usable memory regions
   264		 * provided by the firmware, so invalidate pages outside that
   265		 * region. A page table entry that maps to a reserved area of
   266		 * memory would allow processor speculation into that area,
   267		 * and on some hardware (particularly the UV platform) even
   268		 * speculative access to some reserved areas is caught as an
   269		 * error, causing the BIOS to halt the system.
   270		 */
   271	
   272		pmd = (pmdval_t *)level2_kernel_pgt;
   273	
   274		/* invalidate pages before the kernel image */
   275		for (i = 0; i < pmd_index(__va_symbol(_text)); i++)
   276			pmd[i] &= ~_PAGE_PRESENT;
   277	
   278		/* fixup pages that are part of the kernel image */
   279		for (; i <= pmd_index(__va_symbol(_end)); i++)
   280			if (pmd[i] & _PAGE_PRESENT)
   281				pmd[i] += load_delta;
   282	
   283		/* invalidate pages after the kernel image */
   284		for (; i < PTRS_PER_PMD; i++)
   285			pmd[i] &= ~_PAGE_PRESENT;
   286	
   287		/*
   288		 * Fixup phys_base - remove the memory encryption mask to obtain
   289		 * the true physical address.
   290		 */
   291		phys_base += load_delta - sme_get_me_mask();
   292	
   293		return sme_postprocess_startup(bp, pmd);
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
