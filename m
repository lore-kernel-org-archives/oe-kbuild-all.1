Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583784A35
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766828622; cv=none; b=bNUA+wu4crOTQQoNKKE6CyKOEy5WFqyT8whztBj7XEDay+SeyXdw4wiV4ZF1/X8WyrT+1BnXyLyymMJPu/URE9R+GB7qxpRlLMtNtBT745mv+bfvnGQu7ItrMemczcuP4qVbUPcwnp0H5AfN3UD/aSQRWc7l5bdW0FQuDT4HqR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766828622; c=relaxed/simple;
	bh=bKknMKwrjhqiWF0dpjz9rEP3NawFIxANjBEQTdgJgwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L2WCBZ52+9Wzr3WY/F3OYc2R6NrINPfiuXhhbUxbiktXlmFojDvprRrzXIJEHV1H/Mk8yTlgjuwbLqXwFqPIdntyKCzesRYvGhuu8nhC/GS8UQRLUMLgtItyZ0BMn/mUS3e3HuPcIAEsVkzSlRm5LoO4vujG+RE7H2McrnIrv9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPidpG2g; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPidpG2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766828621; x=1798364621;
  h=date:from:to:cc:subject:message-id;
  bh=bKknMKwrjhqiWF0dpjz9rEP3NawFIxANjBEQTdgJgwM=;
  b=KPidpG2ge6p3kOD9upBpd7J2NvxhfsN1b51XEg8kPvbS/ScJmfsSwC5M
   74vYwR8l3PRgcSmPMP1rWO7FlCx2xT9yASnFAFF85NZ/fui16/rZranri
   6hst60TWQXvC1jZ5eAXFnI+8RlnEswupxiUfhMMS+3y2nJK/M8Njmyy0P
   3XCvwG0DqKtPwqrT5NKOv0deAXRUTR3n78LbNNkcpno9RzbD7HGkLDGSP
   TjNOdoFPrX0Or3P09zikOcFiUSTkaQd0Clr35oCxhbikKX+5dyr6wMAFl
   KJDK3vuSVVa5/360nmJf4+8dFQ+JO8efuwD/0/GckmC81vWk1wd24cegO
   Q==;
X-CSE-ConnectionGUID: 5MY8xTGySY6SqSqEG817XA==
X-CSE-MsgGUID: Fijn60Z3Qa2+LymvE2wRDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="85958966"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="85958966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 01:43:41 -0800
X-CSE-ConnectionGUID: 2h53QLWzSmGtU59P9BV4Tw==
X-CSE-MsgGUID: igUi5wdhSfK4txhcCa3aTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="201004216"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Dec 2025 01:43:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZQpj-000000005ib-3mgS;
	Sat, 27 Dec 2025 09:43:35 +0000
Date: Sat, 27 Dec 2025 17:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pmdunify 4/6] arch/x86/xen/mmu_pv.c:1792:51: error:
 'pud_t' {aka 'pmld_t'} has no member named 'pud'
Message-ID: <202512271718.nnyP7kOK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/alexshi/linux.git pmdunify
head:   694b5dc7bcd7ba28db0bc95b24a78861bdffefc7
commit: 38905b0328f66722c250710e81d754e5d07f069a [4/6] use pmld_t for pmd_t pud_t p4d_t
config: x86_64-randconfig-r073-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271718.nnyP7kOK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271718.nnyP7kOK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271718.nnyP7kOK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/xen/mmu_pv.c: In function 'xen_setup_kernel_pagetable':
>> arch/x86/xen/mmu_pv.c:1792:51: error: 'pud_t' {aka 'pmld_t'} has no member named 'pud'
    1792 |         l2 = m2v(l3[pud_index(__START_KERNEL_map)].pud);
         |                                                   ^


vim +1792 arch/x86/xen/mmu_pv.c

7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1718  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1719  static void __init convert_pfn_mfn(void *v)
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1720  {
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1721  	pte_t *pte = v;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1722  	int i;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1723  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1724  	/* All levels are converted the same way, so just treat them
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1725  	   as ptes. */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1726  	for (i = 0; i < PTRS_PER_PTE; i++)
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1727  		pte[i] = xen_make_pte(pte[i].pte);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1728  }
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1729  static void __init check_pt_base(unsigned long *pt_base, unsigned long *pt_end,
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1730  				 unsigned long addr)
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1731  {
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1732  	if (*pt_base == PFN_DOWN(__pa(addr))) {
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1733  		set_page_prot_flags((void *)addr, PAGE_KERNEL, UVMF_INVLPG);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1734  		clear_page((void *)addr);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1735  		(*pt_base)++;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1736  	}
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1737  	if (*pt_end == PFN_DOWN(__pa(addr))) {
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1738  		set_page_prot_flags((void *)addr, PAGE_KERNEL, UVMF_INVLPG);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1739  		clear_page((void *)addr);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1740  		(*pt_end)--;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1741  	}
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1742  }
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1743  /*
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1744   * Set up the initial kernel pagetable.
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1745   *
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1746   * We can construct this by grafting the Xen provided pagetable into
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1747   * head_64.S's preconstructed pagetables.  We copy the Xen L2's into
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1748   * level2_ident_pgt, and level2_kernel_pgt.  This means that only the
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1749   * kernel has a physical mapping to start with - but that's enough to
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1750   * get __va working.  We need to fill in the rest of the physical
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1751   * mapping once some sort of allocator has been set up.
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1752   */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1753  void __init xen_setup_kernel_pagetable(pgd_t *pgd, unsigned long max_pfn)
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1754  {
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1755  	pud_t *l3;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1756  	pmd_t *l2;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1757  	unsigned long addr[3];
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1758  	unsigned long pt_base, pt_end;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1759  	unsigned i;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1760  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1761  	/* max_pfn_mapped is the last pfn mapped in the initial memory
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1762  	 * mappings. Considering that on Xen after the kernel mappings we
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1763  	 * have the mappings of some pages that don't exist in pfn space, we
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1764  	 * set max_pfn_mapped to the last real pfn mapped. */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1765  	if (xen_start_info->mfn_list < __START_KERNEL_map)
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1766  		max_pfn_mapped = xen_start_info->first_p2m_pfn;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1767  	else
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1768  		max_pfn_mapped = PFN_DOWN(__pa(xen_start_info->mfn_list));
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1769  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1770  	pt_base = PFN_DOWN(__pa(xen_start_info->pt_base));
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1771  	pt_end = pt_base + xen_start_info->nr_pt_frames;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1772  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1773  	/* Zap identity mapping */
65ade2f872b474 Kiryl Shutsemau  2017-06-06  1774  	init_top_pgt[0] = __pgd(0);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1775  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1776  	/* Pre-constructed entries are in pfn, so convert to mfn */
d52888aa2753e3 Kiryl Shutsemau  2018-10-26  1777  	/* L4[273] -> level3_ident_pgt  */
989513a735f514 Juergen Gross    2017-05-16  1778  	/* L4[511] -> level3_kernel_pgt */
65ade2f872b474 Kiryl Shutsemau  2017-06-06  1779  	convert_pfn_mfn(init_top_pgt);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1780  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1781  	/* L3_i[0] -> level2_ident_pgt */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1782  	convert_pfn_mfn(level3_ident_pgt);
989513a735f514 Juergen Gross    2017-05-16  1783  	/* L3_k[510] -> level2_kernel_pgt */
989513a735f514 Juergen Gross    2017-05-16  1784  	/* L3_k[511] -> level2_fixmap_pgt */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1785  	convert_pfn_mfn(level3_kernel_pgt);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1786  
05ab1d8a4b36ee Feng Tang        2018-09-20  1787  	/* L3_k[511][508-FIXMAP_PMD_NUM ... 507] -> level1_fixmap_pgt */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1788  	convert_pfn_mfn(level2_fixmap_pgt);
989513a735f514 Juergen Gross    2017-05-16  1789  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1790  	/* We get [511][511] and have Xen's version of level2_kernel_pgt */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1791  	l3 = m2v(pgd[pgd_index(__START_KERNEL_map)].pgd);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04 @1792  	l2 = m2v(l3[pud_index(__START_KERNEL_map)].pud);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1793  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1794  	addr[0] = (unsigned long)pgd;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1795  	addr[1] = (unsigned long)l3;
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1796  	addr[2] = (unsigned long)l2;
d52888aa2753e3 Kiryl Shutsemau  2018-10-26  1797  	/* Graft it onto L4[273][0]. Note that we creating an aliasing problem:
d52888aa2753e3 Kiryl Shutsemau  2018-10-26  1798  	 * Both L4[273][0] and L4[511][510] have entries that point to the same
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1799  	 * L2 (PMD) tables. Meaning that if you modify it in __va space
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1800  	 * it will be also modified in the __ka space! (But if you just
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1801  	 * modify the PMD table to point to other PTE's or none, then you
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1802  	 * are OK - which is what cleanup_highmap does) */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1803  	copy_page(level2_ident_pgt, l2);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1804  	/* Graft it onto L4[511][510] */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1805  	copy_page(level2_kernel_pgt, l2);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1806  
2cc42bac1c795f Jan Beulich      2017-12-18  1807  	/*
2cc42bac1c795f Jan Beulich      2017-12-18  1808  	 * Zap execute permission from the ident map. Due to the sharing of
2cc42bac1c795f Jan Beulich      2017-12-18  1809  	 * L1 entries we need to do this in the L2.
2cc42bac1c795f Jan Beulich      2017-12-18  1810  	 */
2cc42bac1c795f Jan Beulich      2017-12-18  1811  	if (__supported_pte_mask & _PAGE_NX) {
2cc42bac1c795f Jan Beulich      2017-12-18  1812  		for (i = 0; i < PTRS_PER_PMD; ++i) {
2cc42bac1c795f Jan Beulich      2017-12-18  1813  			if (pmd_none(level2_ident_pgt[i]))
2cc42bac1c795f Jan Beulich      2017-12-18  1814  				continue;
2cc42bac1c795f Jan Beulich      2017-12-18  1815  			level2_ident_pgt[i] = pmd_set_flags(level2_ident_pgt[i], _PAGE_NX);
2cc42bac1c795f Jan Beulich      2017-12-18  1816  		}
2cc42bac1c795f Jan Beulich      2017-12-18  1817  	}
2cc42bac1c795f Jan Beulich      2017-12-18  1818  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1819  	/* Copy the initial P->M table mappings if necessary. */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1820  	i = pgd_index(xen_start_info->mfn_list);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1821  	if (i && i < pgd_index(__START_KERNEL_map))
65ade2f872b474 Kiryl Shutsemau  2017-06-06  1822  		init_top_pgt[i] = ((pgd_t *)xen_start_info->pt_base)[i];
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1823  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1824  	/* Make pagetable pieces RO */
65ade2f872b474 Kiryl Shutsemau  2017-06-06  1825  	set_page_prot(init_top_pgt, PAGE_KERNEL_RO);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1826  	set_page_prot(level3_ident_pgt, PAGE_KERNEL_RO);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1827  	set_page_prot(level3_kernel_pgt, PAGE_KERNEL_RO);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1828  	set_page_prot(level2_ident_pgt, PAGE_KERNEL_RO);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1829  	set_page_prot(level2_kernel_pgt, PAGE_KERNEL_RO);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1830  	set_page_prot(level2_fixmap_pgt, PAGE_KERNEL_RO);
05ab1d8a4b36ee Feng Tang        2018-09-20  1831  
05ab1d8a4b36ee Feng Tang        2018-09-20  1832  	for (i = 0; i < FIXMAP_PMD_NUM; i++) {
05ab1d8a4b36ee Feng Tang        2018-09-20  1833  		set_page_prot(level1_fixmap_pgt + i * PTRS_PER_PTE,
05ab1d8a4b36ee Feng Tang        2018-09-20  1834  			      PAGE_KERNEL_RO);
05ab1d8a4b36ee Feng Tang        2018-09-20  1835  	}
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1836  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1837  	/* Pin down new L4 */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1838  	pin_pagetable_pfn(MMUEXT_PIN_L4_TABLE,
65ade2f872b474 Kiryl Shutsemau  2017-06-06  1839  			  PFN_DOWN(__pa_symbol(init_top_pgt)));
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1840  
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1841  	/* Unpin Xen-provided one */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1842  	pin_pagetable_pfn(MMUEXT_UNPIN_TABLE, PFN_DOWN(__pa(pgd)));
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1843  

:::::: The code at line 1792 was first introduced by commit
:::::: 7e0563dea9c4e62297846359186c597e7231912d x86/xen: split off mmu_pv.c

:::::: TO: Vitaly Kuznetsov <vkuznets@redhat.com>
:::::: CC: Juergen Gross <jgross@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
