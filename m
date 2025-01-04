Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FBA17A5BD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735979970; cv=none; b=KfQck/9B4TiWXuj38iYe1edf/HsvFWMP11d9zIzP2wlGalKRQufcoO5sRHcO9yStn5ocJQlim68fKMIpGyJoJQCG6KILPQy12kBG600LNbdNHVBph5EHYoOdKfXe0bAwwc3HYbLzXV0B6mZY5dPb35tpU57IMayWBjeIY9d5UC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735979970; c=relaxed/simple;
	bh=rmqQdecFejEbhZ/B74PHXS3uLUnT/6Cud/GhwTPE+Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3nh7JpvkiQHXrQrKfcdl4WEpXdB+l3iEQpO0/AaA4/iW8j3L6zgO6Pfz59tDWbZZsbk76A3ToGRSsA1mfryEBT7mPvL99GwvQtPYudKaKyO0UkLCnVJfAVecjMkElVod7xf9p6R3dqTD5ZFPZ3qLm8cQ3Fsvs6ezMZooaKDa6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Og6pbTdh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Og6pbTdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735979968; x=1767515968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rmqQdecFejEbhZ/B74PHXS3uLUnT/6Cud/GhwTPE+Is=;
  b=Og6pbTdh1dmv5CQ77TjK9CaSnYGo/pj1k7Ih58OQG4EDZDW1ymr161QG
   jEg4X3/bUha1Vw33UB6dNZUXQg0qww/PWEOuHf/xuqULZGtIBuVLphwHA
   U5Qmyfa+Kp7AEw5FHY+PjW0UBO03OwHpNzbbxBXZQiUHS50eDAZwwXR4w
   SX++Y7/MjExTr6cF1ZTxQbJV2o7QY+CmwlHyX4qfKUaq6uCk3Smexxxcs
   LlSiHcMTk+hgTHBsLTQOuHCyNxmH1Asch5pTB/ZtaoGiUNvzB1Rp8gk7L
   rSMoeCYzWfGezQTiZt2jiu91ablwgUofRK78nMtXSwauaNgSGhZXhTZfd
   g==;
X-CSE-ConnectionGUID: NT/M7uciT8K4RVQQ1kQktA==
X-CSE-MsgGUID: NAoteiS6SuSxU/ozSHHEIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47622209"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="47622209"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 00:39:20 -0800
X-CSE-ConnectionGUID: /GWteRrLTjeB5nR8ryUMGg==
X-CSE-MsgGUID: jQ2yae2jSl6OBZGIwIcqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="102452129"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jan 2025 00:39:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTzgi-000Alx-0j;
	Sat, 04 Jan 2025 08:39:16 +0000
Date: Sat, 4 Jan 2025 16:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Weikang <guoweikang.kernel@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org,
	Guo Weikang <guoweikang.kernel@gmail.com>
Subject: Re: [PATCH 3/3] mm/memblock: Modify the default failure behavior of
 memblock_alloc_low(from)
Message-ID: <202501041603.0c8v8Wbr-lkp@intel.com>
References: <20250103105158.1350689-3-guoweikang.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103105158.1350689-3-guoweikang.kernel@gmail.com>

Hi Guo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Weikang/mm-memblock-Modify-the-default-failure-behavior-of-memblock_alloc_raw-to-panic/20250103-185401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250103105158.1350689-3-guoweikang.kernel%40gmail.com
patch subject: [PATCH 3/3] mm/memblock: Modify the default failure behavior of memblock_alloc_low(from)
config: sparc-randconfig-001-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041603.0c8v8Wbr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041603.0c8v8Wbr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041603.0c8v8Wbr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/mm/init_64.c: In function 'arch_hugetlb_valid_size':
   arch/sparc/mm/init_64.c:361:24: warning: variable 'hv_pgsz_idx' set but not used [-Wunused-but-set-variable]
     361 |         unsigned short hv_pgsz_idx;
         |                        ^~~~~~~~~~~
   arch/sparc/mm/init_64.c: In function 'kernel_map_range':
>> arch/sparc/mm/init_64.c:1788:32: warning: variable 'new' set but not used [-Wunused-but-set-variable]
    1788 |                         pud_t *new;
         |                                ^~~
   arch/sparc/mm/init_64.c: In function 'sun4v_linear_pte_xor_finalize':
   arch/sparc/mm/init_64.c:2200:23: warning: variable 'pagecv_flag' set but not used [-Wunused-but-set-variable]
    2200 |         unsigned long pagecv_flag;
         |                       ^~~~~~~~~~~


vim +/new +1788 arch/sparc/mm/init_64.c

0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1764  
896aef430e5afb arch/sparc64/mm/init.c  Sam Ravnborg    2008-02-24  1765  static unsigned long __ref kernel_map_range(unsigned long pstart,
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1766  					    unsigned long pend, pgprot_t prot,
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1767  					    bool use_huge)
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1768  {
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1769  	unsigned long vstart = PAGE_OFFSET + pstart;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1770  	unsigned long vend = PAGE_OFFSET + pend;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1771  	unsigned long alloc_bytes = 0UL;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1772  
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1773  	if ((vstart & ~PAGE_MASK) || (vend & ~PAGE_MASK)) {
13edad7a5cef1c arch/sparc64/mm/init.c  David S. Miller 2005-09-29  1774  		prom_printf("kernel_map: Unaligned physmem[%lx:%lx]\n",
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1775  			    vstart, vend);
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1776  		prom_halt();
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1777  	}
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1778  
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1779  	while (vstart < vend) {
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1780  		unsigned long this_end, paddr = __pa(vstart);
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1781  		pgd_t *pgd = pgd_offset_k(vstart);
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1782  		p4d_t *p4d;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1783  		pud_t *pud;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1784  		pmd_t *pmd;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1785  		pte_t *pte;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1786  
ac55c768143aa3 arch/sparc/mm/init_64.c David S. Miller 2014-09-26  1787  		if (pgd_none(*pgd)) {
ac55c768143aa3 arch/sparc/mm/init_64.c David S. Miller 2014-09-26 @1788  			pud_t *new;
ac55c768143aa3 arch/sparc/mm/init_64.c David S. Miller 2014-09-26  1789  
4fc4a09e4cc112 arch/sparc/mm/init_64.c Mike Rapoport   2018-10-30  1790  			new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE,
4fc4a09e4cc112 arch/sparc/mm/init_64.c Mike Rapoport   2018-10-30  1791  						  PAGE_SIZE);
ac55c768143aa3 arch/sparc/mm/init_64.c David S. Miller 2014-09-26  1792  			alloc_bytes += PAGE_SIZE;
ac55c768143aa3 arch/sparc/mm/init_64.c David S. Miller 2014-09-26  1793  			pgd_populate(&init_mm, pgd, new);
ac55c768143aa3 arch/sparc/mm/init_64.c David S. Miller 2014-09-26  1794  		}
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1795  
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1796  		p4d = p4d_offset(pgd, vstart);
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1797  		if (p4d_none(*p4d)) {
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1798  			pud_t *new;
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1799  
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1800  			new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE,
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1801  						  PAGE_SIZE);
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1802  			alloc_bytes += PAGE_SIZE;
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1803  			p4d_populate(&init_mm, p4d, new);
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1804  		}
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1805  
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport   2019-11-24  1806  		pud = pud_offset(p4d, vstart);
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1807  		if (pud_none(*pud)) {
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1808  			pmd_t *new;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1809  
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1810  			if (kernel_can_map_hugepud(vstart, vend, use_huge)) {
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1811  				vstart = kernel_map_hugepud(vstart, vend, pud);
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1812  				continue;
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1813  			}
4fc4a09e4cc112 arch/sparc/mm/init_64.c Mike Rapoport   2018-10-30  1814  			new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE,
4fc4a09e4cc112 arch/sparc/mm/init_64.c Mike Rapoport   2018-10-30  1815  						  PAGE_SIZE);
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1816  			alloc_bytes += PAGE_SIZE;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1817  			pud_populate(&init_mm, pud, new);
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1818  		}
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1819  
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1820  		pmd = pmd_offset(pud, vstart);
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1821  		if (pmd_none(*pmd)) {
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1822  			pte_t *new;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1823  
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1824  			if (kernel_can_map_hugepmd(vstart, vend, use_huge)) {
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1825  				vstart = kernel_map_hugepmd(vstart, vend, pmd);
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1826  				continue;
0dd5b7b09e13da arch/sparc/mm/init_64.c David S. Miller 2014-09-24  1827  			}
4fc4a09e4cc112 arch/sparc/mm/init_64.c Mike Rapoport   2018-10-30  1828  			new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE,
4fc4a09e4cc112 arch/sparc/mm/init_64.c Mike Rapoport   2018-10-30  1829  						  PAGE_SIZE);
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1830  			alloc_bytes += PAGE_SIZE;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1831  			pmd_populate_kernel(&init_mm, pmd, new);
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1832  		}
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1833  
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1834  		pte = pte_offset_kernel(pmd, vstart);
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1835  		this_end = (vstart + PMD_SIZE) & PMD_MASK;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1836  		if (this_end > vend)
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1837  			this_end = vend;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1838  
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1839  		while (vstart < this_end) {
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1840  			pte_val(*pte) = (paddr | pgprot_val(prot));
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1841  
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1842  			vstart += PAGE_SIZE;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1843  			paddr += PAGE_SIZE;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1844  			pte++;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1845  		}
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1846  	}
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1847  
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1848  	return alloc_bytes;
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1849  }
56425306517ef2 arch/sparc64/mm/init.c  David S. Miller 2005-09-25  1850  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
