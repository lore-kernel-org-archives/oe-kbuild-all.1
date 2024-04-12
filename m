Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEA11FA4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 00:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712882223; cv=none; b=Jieqs3yG+FAfYxxIDBmPwWo3A5DNIiNbXkeT4QmRMV4k20viXSnS+E1V6N5wDC6YZXuTDLF17WtiI1/LAcWpWwF5nC2o4sqj2Xbs1Fs1kdKisUEQSas5gMAyBqJJRDxD7AvcW/Y217kVtQRwcVuGpTcMbA177uSAfscH3NVV9ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712882223; c=relaxed/simple;
	bh=YLNsyyGDykd1nrfci0bRJ4+titndTwSxUlbIcL1ZBXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6r2FRQeldeq04ZHaoZ5KjluhfghYTMEQSTV/N3EaoZUS3o/ijJcgWFvRyn8dli5bnb91FWdOCoS7RRcERSIGz6GF6QltgaSETT0IHeT1niN+c31EiWHJ2ZpriE0u0Ca7Xgd9rt+SD4Gt8UmF179E9Tz4pT6i/C1B5aloHz/pkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJF1eePy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJF1eePy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712882221; x=1744418221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YLNsyyGDykd1nrfci0bRJ4+titndTwSxUlbIcL1ZBXE=;
  b=NJF1eePypnKUH7iQCHgDhM2LV/hY3UOzCPcmYksJkt/1fVI5DMqG4sTG
   eImFvcF5ROSwqyPuXUJ+ztQl+2c++4tYGrLKo+0X55pF7dd6Ve+hOXwq7
   b1EZSzHYsIpIistuW/p5s4ApK9KHQc6pBhW7LA7y4+HeLkBuZ7CzJvlTP
   zgMiAFZ4MlAq691KePjuEprUK2xM+6ZsjJ1d/Y1ZY/X75AXenkqgkBvGd
   4dGArII/jt/KKr92sBS+8DEbYhqNDJFaDOYQJOs6NAReAaOWnC/JN7gkI
   8+Ek4M/FCpX0aIws7vGX4em4ZLqJ1oucqKfm96yUC7fnMuD9kXpEWjYqw
   Q==;
X-CSE-ConnectionGUID: l1Qpf2UpRzeF/DRX1kggqw==
X-CSE-MsgGUID: BHge0qi/SjWyE5mgHVMd2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19478169"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19478169"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 17:37:01 -0700
X-CSE-ConnectionGUID: AJwDfauxQ2WY1hud0aaOYA==
X-CSE-MsgGUID: lTV3DLC8R5WH6S1dPDpWew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="25738678"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2024 17:36:59 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv4uW-00098H-2Z;
	Fri, 12 Apr 2024 00:36:56 +0000
Date: Fri, 12 Apr 2024 08:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 10/10] mm: Remove pXX_devmap
Message-ID: <202404120852.dCFQbBaU-lkp@intel.com>
References: <93e3772f172918a3c489d803f7580309c3a42fff.1712796818.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93e3772f172918a3c489d803f7580309c3a42fff.1712796818.git-series.apopple@nvidia.com>

Hi Alistair,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ffc253263a1375a65fa6c9f62a893e9767fbebfa]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-gup-c-Remove-redundant-check-for-PCI-P2PDMA-page/20240411-085933
base:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
patch link:    https://lore.kernel.org/r/93e3772f172918a3c489d803f7580309c3a42fff.1712796818.git-series.apopple%40nvidia.com
patch subject: [RFC 10/10] mm: Remove pXX_devmap
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240412/202404120852.dCFQbBaU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404120852.dCFQbBaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120852.dCFQbBaU-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'insert_pfn':
>> mm/memory.c:2161:25: error: implicit declaration of function 'pte_mkdevmap'; did you mean 'pfn_t_devmap'? [-Werror=implicit-function-declaration]
    2161 |                 entry = pte_mkdevmap(pfn_t_pte(pfn, prot));
         |                         ^~~~~~~~~~~~
         |                         pfn_t_devmap
   mm/memory.c:2161:25: error: incompatible types when assigning to type 'pte_t' from type 'int'
   cc1: some warnings being treated as errors


vim +2161 mm/memory.c

a667d7456f189e Souptick Joarder 2019-05-13  2123  
9b5a8e00d479bb Matthew Wilcox   2018-10-26  2124  static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
b2770da6425406 Ross Zwisler     2017-09-06  2125  			pfn_t pfn, pgprot_t prot, bool mkwrite)
423bad600443c5 Nicholas Piggin  2008-04-28  2126  {
423bad600443c5 Nicholas Piggin  2008-04-28  2127  	struct mm_struct *mm = vma->vm_mm;
423bad600443c5 Nicholas Piggin  2008-04-28  2128  	pte_t *pte, entry;
423bad600443c5 Nicholas Piggin  2008-04-28  2129  	spinlock_t *ptl;
423bad600443c5 Nicholas Piggin  2008-04-28  2130  
423bad600443c5 Nicholas Piggin  2008-04-28  2131  	pte = get_locked_pte(mm, addr, &ptl);
423bad600443c5 Nicholas Piggin  2008-04-28  2132  	if (!pte)
9b5a8e00d479bb Matthew Wilcox   2018-10-26  2133  		return VM_FAULT_OOM;
c33c794828f212 Ryan Roberts     2023-06-12  2134  	entry = ptep_get(pte);
c33c794828f212 Ryan Roberts     2023-06-12  2135  	if (!pte_none(entry)) {
b2770da6425406 Ross Zwisler     2017-09-06  2136  		if (mkwrite) {
b2770da6425406 Ross Zwisler     2017-09-06  2137  			/*
b2770da6425406 Ross Zwisler     2017-09-06  2138  			 * For read faults on private mappings the PFN passed
b2770da6425406 Ross Zwisler     2017-09-06  2139  			 * in may not match the PFN we have mapped if the
b2770da6425406 Ross Zwisler     2017-09-06  2140  			 * mapped PFN is a writeable COW page.  In the mkwrite
b2770da6425406 Ross Zwisler     2017-09-06  2141  			 * case we are creating a writable PTE for a shared
f2c57d91b0d96a Jan Kara         2018-10-30  2142  			 * mapping and we expect the PFNs to match. If they
f2c57d91b0d96a Jan Kara         2018-10-30  2143  			 * don't match, we are likely racing with block
f2c57d91b0d96a Jan Kara         2018-10-30  2144  			 * allocation and mapping invalidation so just skip the
f2c57d91b0d96a Jan Kara         2018-10-30  2145  			 * update.
b2770da6425406 Ross Zwisler     2017-09-06  2146  			 */
c33c794828f212 Ryan Roberts     2023-06-12  2147  			if (pte_pfn(entry) != pfn_t_to_pfn(pfn)) {
c33c794828f212 Ryan Roberts     2023-06-12  2148  				WARN_ON_ONCE(!is_zero_pfn(pte_pfn(entry)));
423bad600443c5 Nicholas Piggin  2008-04-28  2149  				goto out_unlock;
f2c57d91b0d96a Jan Kara         2018-10-30  2150  			}
c33c794828f212 Ryan Roberts     2023-06-12  2151  			entry = pte_mkyoung(entry);
cae85cb8add35f Jan Kara         2019-03-28  2152  			entry = maybe_mkwrite(pte_mkdirty(entry), vma);
cae85cb8add35f Jan Kara         2019-03-28  2153  			if (ptep_set_access_flags(vma, addr, pte, entry, 1))
cae85cb8add35f Jan Kara         2019-03-28  2154  				update_mmu_cache(vma, addr, pte);
cae85cb8add35f Jan Kara         2019-03-28  2155  		}
b2770da6425406 Ross Zwisler     2017-09-06  2156  		goto out_unlock;
b2770da6425406 Ross Zwisler     2017-09-06  2157  	}
423bad600443c5 Nicholas Piggin  2008-04-28  2158  
423bad600443c5 Nicholas Piggin  2008-04-28  2159  	/* Ok, finally just insert the thing.. */
01c8f1c44b83a0 Dan Williams     2016-01-15  2160  	if (pfn_t_devmap(pfn))
01c8f1c44b83a0 Dan Williams     2016-01-15 @2161  		entry = pte_mkdevmap(pfn_t_pte(pfn, prot));
01c8f1c44b83a0 Dan Williams     2016-01-15  2162  	else
01c8f1c44b83a0 Dan Williams     2016-01-15  2163  		entry = pte_mkspecial(pfn_t_pte(pfn, prot));
b2770da6425406 Ross Zwisler     2017-09-06  2164  
b2770da6425406 Ross Zwisler     2017-09-06  2165  	if (mkwrite) {
b2770da6425406 Ross Zwisler     2017-09-06  2166  		entry = pte_mkyoung(entry);
b2770da6425406 Ross Zwisler     2017-09-06  2167  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
b2770da6425406 Ross Zwisler     2017-09-06  2168  	}
b2770da6425406 Ross Zwisler     2017-09-06  2169  
423bad600443c5 Nicholas Piggin  2008-04-28  2170  	set_pte_at(mm, addr, pte, entry);
4b3073e1c53a25 Russell King     2009-12-18  2171  	update_mmu_cache(vma, addr, pte); /* XXX: why not for insert_page? */
423bad600443c5 Nicholas Piggin  2008-04-28  2172  
423bad600443c5 Nicholas Piggin  2008-04-28  2173  out_unlock:
423bad600443c5 Nicholas Piggin  2008-04-28  2174  	pte_unmap_unlock(pte, ptl);
9b5a8e00d479bb Matthew Wilcox   2018-10-26  2175  	return VM_FAULT_NOPAGE;
423bad600443c5 Nicholas Piggin  2008-04-28  2176  }
423bad600443c5 Nicholas Piggin  2008-04-28  2177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
