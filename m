Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562130102C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Feb 2026 01:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770514144; cv=none; b=IVhUEqXS24xJQxgZUlqDiPtpzeFrjKBGtzHRP9adQPKvM7ic/DV1pqXcql6lfROomWPVx9eHgTWkpzj4o8V5NtN+N+j7+kNTUeeMiGzzr4d5c4ZcoXq6n6l0Jxi8sLipckILXwgvLgPsCn9lWdcd/DvtNcFxoxYLKWIaedVTmV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770514144; c=relaxed/simple;
	bh=IX0yebiLDSzipfjCve786lGXTLs1wN18ppTH+cAi4n0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i0LrWEcLRpcKvaHBYrOvBAZoPyP+2XNBgqPavlXlPICrr+rxSuB4qBBfnfHCuKNc/IsTcZuM35djWZvEmXGa+3v7J0z/1PhOmLoNONakmhydVubHmkCyUKIybkqXaiCc6JvunhW8FE1fGMD4EAN5hT1uanFjTY/z5sPdQ9R/7+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIBcDoGR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIBcDoGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770514145; x=1802050145;
  h=date:from:to:cc:subject:message-id;
  bh=IX0yebiLDSzipfjCve786lGXTLs1wN18ppTH+cAi4n0=;
  b=CIBcDoGRyot5EEkJEntnpJYorFHY/2SgYrHKlaLQldLdPXGjSE7oU/iA
   z7JYUq7zsWjdyCkNlISBkePkMlxVJCLzk035VLthYiSWxhwsifuhNmjZ4
   1aGt4BeVWfUr+W8z2iDMTxbWG1P7gNnRo5qNXdnOnSMUeIApXf4uPnbnd
   kpzIlmNVgvo373ICRE7g03bJ1vd+Wmy5Fh8pg5uSEMDcEsqhB0JqcYkYn
   /SWD2xa0s/Nr87iRd4Hx/7dZH8Iytsa+7cWV3i4KvD93hoYBVZT9S18OY
   hb0+lDerXiefW0dVYDi9EVaJc1Jfq5VU7j4muXnV4UIEg7PBcO4E81sBH
   g==;
X-CSE-ConnectionGUID: +mXB+aTFTAaoq/uvuRdfpQ==
X-CSE-MsgGUID: upWwl2n1SmC47SVdL2CRVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="71661179"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="71661179"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 17:29:04 -0800
X-CSE-ConnectionGUID: AmeZM++ZRta69b1KjGLLHg==
X-CSE-MsgGUID: 0qCPjS6DTd29a6I+JnbNAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="241877601"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Feb 2026 17:29:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1votbg-00000000m08-0Qcn;
	Sun, 08 Feb 2026 01:29:00 +0000
Date: Sun, 08 Feb 2026 09:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/6]
 drivers/iommu/intel/iommu.c:1717:57: sparse: sparse: incorrect type in
 argument 4 (different base types)
Message-ID: <202602080908.AfqtjNbx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: a50249ddd81d8447488e9ad265fe0a99880dcea0 [0/6] ANDROID: iommu/vt-d: Paravirtualize domain pagetable management
config: x86_64-randconfig-123-20260207 (https://download.01.org/0day-ci/archive/20260208/202602080908.AfqtjNbx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080908.AfqtjNbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080908.AfqtjNbx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/intel/iommu.c:1717:57: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got int gfp @@
   drivers/iommu/intel/iommu.c:1717:57: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/iommu/intel/iommu.c:1717:57: sparse:     got int gfp
>> drivers/iommu/intel/iommu.c:1764:85: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected int gfp @@     got restricted gfp_t [usertype] gfp @@
   drivers/iommu/intel/iommu.c:1764:85: sparse:     expected int gfp
   drivers/iommu/intel/iommu.c:1764:85: sparse:     got restricted gfp_t [usertype] gfp

vim +1717 drivers/iommu/intel/iommu.c

  1701	
  1702	static int pv_domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
  1703				     unsigned long phys_pfn, unsigned long nr_pages, int prot, int gfp)
  1704	{
  1705		struct pkvm_iommu_map_param param = {
  1706			.pgd_gpa = virt_to_phys(domain->pgd),
  1707			.iov_pfn = iov_pfn,
  1708			.phys_pfn = phys_pfn,
  1709			.nr_pages = nr_pages,
  1710			.prot = prot,
  1711		};
  1712		int ret;
  1713	
  1714		ret = pkvm_hc_iommu_map_pages(&param);
  1715		if (ret == -ENOMEM) {
  1716			ret = fill_domain_memcache(&param.mc, __pkvm_pgtable_max_pages(nr_pages),
> 1717						   domain->nid, gfp);
  1718			if (ret) {
  1719				pr_err("%s: failed to allocate memcache pages(err=%d)\n",
  1720				       __func__, ret);
  1721				return ret;
  1722			}
  1723			ret = pkvm_hc_iommu_map_pages(&param);
  1724		}
  1725		if (ret) {
  1726			pr_err("%s: domain map[iov_pfn: %lx, pfn: %lx, nr_pages: %lu] failed (err=%d)\n",
  1727			       __func__, iov_pfn, phys_pfn, nr_pages, ret);
  1728	
  1729			/*
  1730			 * pKVM would not have drained the memcache on
  1731			 * hypercall failure. Free it if not empty.
  1732			 */
  1733			free_domain_memcache(&param.mc);
  1734		}
  1735	
  1736		return ret;
  1737	}
  1738	
  1739	static int
  1740	__domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
  1741			 unsigned long phys_pfn, unsigned long nr_pages, int prot,
  1742			 gfp_t gfp)
  1743	{
  1744		struct dma_pte *first_pte = NULL, *pte = NULL;
  1745		unsigned int largepage_lvl = 0;
  1746		unsigned long lvl_pages = 0;
  1747		phys_addr_t pteval;
  1748		u64 attr;
  1749	
  1750		if (unlikely(!domain_pfn_supported(domain, iov_pfn + nr_pages - 1)))
  1751			return -EINVAL;
  1752	
  1753		if ((prot & (DMA_PTE_READ|DMA_PTE_WRITE)) == 0)
  1754			return -EINVAL;
  1755	
  1756		if (!(prot & DMA_PTE_WRITE) && domain->nested_parent) {
  1757			pr_err_ratelimited("Read-only mapping is disallowed on the domain which serves as the parent in a nested configuration, due to HW errata (ERRATA_772415_SPR17)\n");
  1758			return -EINVAL;
  1759		}
  1760	
  1761		domain->has_mappings = true;
  1762	
  1763		if (pkvm_pviommu_enabled()) {
> 1764			return pv_domain_mapping(domain, iov_pfn, phys_pfn, nr_pages, prot, gfp);
  1765		}
  1766	
  1767		attr = prot & (DMA_PTE_READ | DMA_PTE_WRITE | DMA_PTE_SNP);
  1768		attr |= DMA_FL_PTE_PRESENT;
  1769		if (domain->use_first_level) {
  1770			attr |= DMA_FL_PTE_US | DMA_FL_PTE_ACCESS;
  1771			if (prot & DMA_PTE_WRITE)
  1772				attr |= DMA_FL_PTE_DIRTY;
  1773		}
  1774	
  1775		pteval = ((phys_addr_t)phys_pfn << VTD_PAGE_SHIFT) | attr;
  1776	
  1777		while (nr_pages > 0) {
  1778			uint64_t tmp;
  1779	
  1780			if (!pte) {
  1781				largepage_lvl = hardware_largepage_caps(domain, iov_pfn,
  1782						phys_pfn, nr_pages);
  1783	
  1784				pte = pfn_to_dma_pte(domain, iov_pfn, &largepage_lvl,
  1785						     gfp);
  1786				if (!pte)
  1787					return -ENOMEM;
  1788				first_pte = pte;
  1789	
  1790				lvl_pages = lvl_to_nr_pages(largepage_lvl);
  1791	
  1792				/* It is large page*/
  1793				if (largepage_lvl > 1) {
  1794					unsigned long end_pfn;
  1795					unsigned long pages_to_remove;
  1796	
  1797					pteval |= DMA_PTE_LARGE_PAGE;
  1798					pages_to_remove = min_t(unsigned long,
  1799								round_down(nr_pages, lvl_pages),
  1800								nr_pte_to_next_page(pte) * lvl_pages);
  1801					end_pfn = iov_pfn + pages_to_remove - 1;
  1802					switch_to_super_page(domain, iov_pfn, end_pfn, largepage_lvl);
  1803				} else {
  1804					pteval &= ~(uint64_t)DMA_PTE_LARGE_PAGE;
  1805				}
  1806	
  1807			}
  1808			/* We don't need lock here, nobody else
  1809			 * touches the iova range
  1810			 */
  1811			tmp = 0ULL;
  1812			if (!try_cmpxchg64_local(&pte->val, &tmp, pteval)) {
  1813				static int dumps = 5;
  1814				pr_crit("ERROR: DMA PTE for vPFN 0x%lx already set (to %llx not %llx)\n",
  1815					iov_pfn, tmp, (unsigned long long)pteval);
  1816				if (dumps) {
  1817					dumps--;
  1818					debug_dma_dump_mappings(NULL);
  1819				}
  1820				WARN_ON(1);
  1821			}
  1822	
  1823			nr_pages -= lvl_pages;
  1824			iov_pfn += lvl_pages;
  1825			phys_pfn += lvl_pages;
  1826			pteval += lvl_pages * VTD_PAGE_SIZE;
  1827	
  1828			/* If the next PTE would be the first in a new page, then we
  1829			 * need to flush the cache on the entries we've just written.
  1830			 * And then we'll need to recalculate 'pte', so clear it and
  1831			 * let it get set again in the if (!pte) block above.
  1832			 *
  1833			 * If we're done (!nr_pages) we need to flush the cache too.
  1834			 *
  1835			 * Also if we've been setting superpages, we may need to
  1836			 * recalculate 'pte' and switch back to smaller pages for the
  1837			 * end of the mapping, if the trailing size is not enough to
  1838			 * use another superpage (i.e. nr_pages < lvl_pages).
  1839			 */
  1840			pte++;
  1841			if (!nr_pages || first_pte_in_page(pte) ||
  1842			    (largepage_lvl > 1 && nr_pages < lvl_pages)) {
  1843				domain_flush_cache(domain, first_pte,
  1844						   (void *)pte - (void *)first_pte);
  1845				pte = NULL;
  1846			}
  1847		}
  1848	
  1849		return 0;
  1850	}
  1851	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
