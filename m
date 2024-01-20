Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A46120E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705736014; cv=none; b=dcqiB+rqbuzBlTTm/pMypT8ctTEt+pPDKUM+z3AFxA/LwcNUBkPVeCbkGaIxJ9cD+Tl/P4eb+cM/WrS75vr2avrofsUa58nJWXM75Qq8x3ELgXmbFPPNmKxBqn5rRLehW9ymEPNVmFDj+A86F/LbB/6H++EpdJ+uglDmx6QdwKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705736014; c=relaxed/simple;
	bh=rZaXNYZcQEsC0OSCMWCMH+Adwa6UqR8ykhJuZ7d3si0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5fWX9pT18MVmkPUrtq8qR6/ROnQJjBbIboJYz0fMW0IA6I8IMkfJitR30DOsj6VuCNKcnh48UZWMcV/Jah05LD+pJXiF1vekJZLcDlB6AuAa7AleZddQ3D4jGR64LiEBvUl/eICdGcy43c2vyEJtv7wdicJnWxQkh9nldyHwGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXrQpU2+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXrQpU2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705736012; x=1737272012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rZaXNYZcQEsC0OSCMWCMH+Adwa6UqR8ykhJuZ7d3si0=;
  b=FXrQpU2+Bk5plmRhMwRoKs3HoVURjzZuivICkter/jGzpBRlW/ND5QPb
   1+V5MfnNQOmgCQliuznuVZmtQi7qCR5GSS67VS8SmKiFe6e+4yuoa14zf
   bPgbz8SZiVHNybYb5sWImI95GErFN9Gx0Lu3rRFGodOaDbgyLMtwvUSJe
   JGT9dbDvKVZrKEN0Eyjk/HA0XvpQBtGhiNhGSvanxhNyCZz6KBpSvL8UK
   5FbXMYnOAmiYo+4yTeZJSfPMGNnWBll55wwwIkghAuquu8NFUm6r9+SDU
   7OK3skNWIg5G2EmPgNKTt+YfgWo7tjedWSwbRiYzx24HOrGJoMBwHy28E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14436934"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="14436934"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 23:33:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="855513343"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="855513343"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2024 23:33:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR5r6-0004rG-1F;
	Sat, 20 Jan 2024 07:33:28 +0000
Date: Sat, 20 Jan 2024 15:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 5/15] arch/x86/kernel/head64.c:204:26: error:
 'p4d_t' {aka 'struct <anonymous>'} has no member named 'p4d'; did you mean
 'pgd'?
Message-ID: <202401201527.NqVK5gqh-lkp@intel.com>
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
config: x86_64-randconfig-005-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201527.NqVK5gqh-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201527.NqVK5gqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201527.NqVK5gqh-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/head64.c: In function '__startup_64':
>> arch/x86/kernel/head64.c:204:26: error: 'p4d_t' {aka 'struct <anonymous>'} has no member named 'p4d'; did you mean 'pgd'?
     204 |   level4_kernel_pgt[511].p4d += load_delta;
         |                          ^~~
         |                          pgd


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
