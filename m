Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB230E0C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768402678; cv=none; b=OM5AZZxAo+6LlT9fqCISRvWA41fX+maHw74OTiTcEXMH4sR9hmrrG8BWK3XUOH50YhNo6evPajRMs7l4SgOjcjok+1HM6IYNiUVovMUATBmVmbFYkwpXbGzcUMqLQSSQ3mB+7Y6q7a95J+ba5pHcwY+Dd23ivmZL5r3itPZoRz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768402678; c=relaxed/simple;
	bh=FslN2L09yYFbdDNdXcQIOdZUN9q5mwNNHyvbq2eRO9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmllNTS6PsKsxAv7peG4I02/UzbfQG9eDIsrnDD3+ktonUMiLO3rYnspMVebI8I8wHht/pR5hy7LDtrht4thLnoo7KbUUOs37muSE9XDIjfYcz1bqjA1bDqa66GQ9eL9GT+4pquAECu4TKgsfFO3VDrLxSxpwwBtv6hm9k8aUOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVFuJZle; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVFuJZle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768402677; x=1799938677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FslN2L09yYFbdDNdXcQIOdZUN9q5mwNNHyvbq2eRO9o=;
  b=gVFuJZleoUq6Myl/Y1ObApAI24ZZa1Dh6pccAoTQHHB01UsfgJr37Rlj
   tZZQ3KInrql5u5XVg3gHQjI3JkDWOcX5D2Rob7s1aOfOlxefb6dX+/01d
   hYQsBXuWo0KfK1Mcg20f4rDqssDYcEpTIlCCmNPGiqAjP9cLRERy4KFvY
   Xw4bpb475DNhnW/Re4NvM9a3PULQdAwIgdfxq+xaeOThPgxTkIuRQxtJm
   2YsnMYcfYkuAhrTasYv0sErDjkv/uNWFJb0eKQx2w/MbCjmdKUKC8Bgr6
   eJ0cqedjadp8fCicL2MKsNr2l3IOgIh9Cxu+C3lEBMHBm8PfVESG0vWri
   A==;
X-CSE-ConnectionGUID: mnL7XeeES9OqckKZEygbUw==
X-CSE-MsgGUID: ZPlT3SG/QcS4rKaPuxtJjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69622450"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69622450"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 06:57:56 -0800
X-CSE-ConnectionGUID: s1J9TIOqSo6jHPDZE2Z4JA==
X-CSE-MsgGUID: +l7YJBXmRZSVvVtkW6Wg2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204723017"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 06:57:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg2Ji-00000000GW8-2mSy;
	Wed, 14 Jan 2026 14:57:50 +0000
Date: Wed, 14 Jan 2026 22:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: mpenttil@redhat.com, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/3] mm: unified hmm fault and migrate device pagewalk
 paths
Message-ID: <202601142231.LW22PqTJ-lkp@intel.com>
References: <20260114091923.3950465-2-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114091923.3950465-2-mpenttil@redhat.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v6.19-rc5 next-20260114]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-unified-hmm-fault-and-migrate-device-pagewalk-paths/20260114-172232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260114091923.3950465-2-mpenttil%40redhat.com
patch subject: [PATCH 1/3] mm: unified hmm fault and migrate device pagewalk paths
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260114/202601142231.LW22PqTJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142231.LW22PqTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142231.LW22PqTJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_vma_handle_absent_pmd':
>> mm/hmm.c:423:27: warning: unused variable 'range' [-Wunused-variable]
     423 |         struct hmm_range *range = hmm_vma_walk->range;
         |                           ^~~~~


vim +/range +423 mm/hmm.c

53f5c3f489ecddc Jérôme Glisse   2018-04-10  369  
10b9feee2d0dc81 Francois Dugast 2025-09-08  370  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
10b9feee2d0dc81 Francois Dugast 2025-09-08  371  static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
10b9feee2d0dc81 Francois Dugast 2025-09-08  372  				     unsigned long end, unsigned long *hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  373  				     pmd_t pmd)
10b9feee2d0dc81 Francois Dugast 2025-09-08  374  {
10b9feee2d0dc81 Francois Dugast 2025-09-08  375  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
10b9feee2d0dc81 Francois Dugast 2025-09-08  376  	struct hmm_range *range = hmm_vma_walk->range;
10b9feee2d0dc81 Francois Dugast 2025-09-08  377  	unsigned long npages = (end - start) >> PAGE_SHIFT;
0ac881efe164685 Lorenzo Stoakes 2025-11-10  378  	const softleaf_t entry = softleaf_from_pmd(pmd);
10b9feee2d0dc81 Francois Dugast 2025-09-08  379  	unsigned long addr = start;
10b9feee2d0dc81 Francois Dugast 2025-09-08  380  	unsigned int required_fault;
10b9feee2d0dc81 Francois Dugast 2025-09-08  381  
0ac881efe164685 Lorenzo Stoakes 2025-11-10  382  	if (softleaf_is_device_private(entry) &&
0ac881efe164685 Lorenzo Stoakes 2025-11-10  383  	    softleaf_to_folio(entry)->pgmap->owner ==
10b9feee2d0dc81 Francois Dugast 2025-09-08  384  	    range->dev_private_owner) {
10b9feee2d0dc81 Francois Dugast 2025-09-08  385  		unsigned long cpu_flags = HMM_PFN_VALID |
10b9feee2d0dc81 Francois Dugast 2025-09-08  386  			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
0ac881efe164685 Lorenzo Stoakes 2025-11-10  387  		unsigned long pfn = softleaf_to_pfn(entry);
10b9feee2d0dc81 Francois Dugast 2025-09-08  388  		unsigned long i;
10b9feee2d0dc81 Francois Dugast 2025-09-08  389  
0ac881efe164685 Lorenzo Stoakes 2025-11-10  390  		if (softleaf_is_device_private_write(entry))
10b9feee2d0dc81 Francois Dugast 2025-09-08  391  			cpu_flags |= HMM_PFN_WRITE;
10b9feee2d0dc81 Francois Dugast 2025-09-08  392  
10b9feee2d0dc81 Francois Dugast 2025-09-08  393  		/*
10b9feee2d0dc81 Francois Dugast 2025-09-08  394  		 * Fully populate the PFN list though subsequent PFNs could be
10b9feee2d0dc81 Francois Dugast 2025-09-08  395  		 * inferred, because drivers which are not yet aware of large
10b9feee2d0dc81 Francois Dugast 2025-09-08  396  		 * folios probably do not support sparsely populated PFN lists.
10b9feee2d0dc81 Francois Dugast 2025-09-08  397  		 */
10b9feee2d0dc81 Francois Dugast 2025-09-08  398  		for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
10b9feee2d0dc81 Francois Dugast 2025-09-08  399  			hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
10b9feee2d0dc81 Francois Dugast 2025-09-08  400  			hmm_pfns[i] |= pfn | cpu_flags;
10b9feee2d0dc81 Francois Dugast 2025-09-08  401  		}
10b9feee2d0dc81 Francois Dugast 2025-09-08  402  
10b9feee2d0dc81 Francois Dugast 2025-09-08  403  		return 0;
10b9feee2d0dc81 Francois Dugast 2025-09-08  404  	}
10b9feee2d0dc81 Francois Dugast 2025-09-08  405  
10b9feee2d0dc81 Francois Dugast 2025-09-08  406  	required_fault = hmm_range_need_fault(hmm_vma_walk, hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  407  					      npages, 0);
10b9feee2d0dc81 Francois Dugast 2025-09-08  408  	if (required_fault) {
0ac881efe164685 Lorenzo Stoakes 2025-11-10  409  		if (softleaf_is_device_private(entry))
10b9feee2d0dc81 Francois Dugast 2025-09-08  410  			return hmm_vma_fault(addr, end, required_fault, walk);
10b9feee2d0dc81 Francois Dugast 2025-09-08  411  		else
10b9feee2d0dc81 Francois Dugast 2025-09-08  412  			return -EFAULT;
10b9feee2d0dc81 Francois Dugast 2025-09-08  413  	}
10b9feee2d0dc81 Francois Dugast 2025-09-08  414  
70d15e6adfafc3e Mika Penttilä   2026-01-14  415  	return hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
10b9feee2d0dc81 Francois Dugast 2025-09-08  416  }
10b9feee2d0dc81 Francois Dugast 2025-09-08  417  #else
10b9feee2d0dc81 Francois Dugast 2025-09-08  418  static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
10b9feee2d0dc81 Francois Dugast 2025-09-08  419  				     unsigned long end, unsigned long *hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  420  				     pmd_t pmd)
10b9feee2d0dc81 Francois Dugast 2025-09-08  421  {
10b9feee2d0dc81 Francois Dugast 2025-09-08  422  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
10b9feee2d0dc81 Francois Dugast 2025-09-08 @423  	struct hmm_range *range = hmm_vma_walk->range;
10b9feee2d0dc81 Francois Dugast 2025-09-08  424  	unsigned long npages = (end - start) >> PAGE_SHIFT;
10b9feee2d0dc81 Francois Dugast 2025-09-08  425  
10b9feee2d0dc81 Francois Dugast 2025-09-08  426  	if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
10b9feee2d0dc81 Francois Dugast 2025-09-08  427  		return -EFAULT;
70d15e6adfafc3e Mika Penttilä   2026-01-14  428  	return hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
10b9feee2d0dc81 Francois Dugast 2025-09-08  429  }
10b9feee2d0dc81 Francois Dugast 2025-09-08  430  #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
10b9feee2d0dc81 Francois Dugast 2025-09-08  431  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
