Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E730DEDE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 21:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765833168; cv=none; b=iO2GdTx1EBHN/2b4hK5HvEI0NhtpXSrPhhPeHxpYkeioM7WkgKPYsfwEqbw8SfFSHElk+tDbD0Q7h1mMpGg8viRs/7iS01XgBZaCiWOhsMRCKJPcwfwdTONf+Epk5AM0GMJZ7yYzig+MtTUs6Ll5eb5OPXnCCJzkK+MGK22DP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765833168; c=relaxed/simple;
	bh=gmz5sebIS4/mbIHs/2L/cB/qwRD8A8HBxtWUTIQaBYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCvnv0Slpfo6yySCOWfMK5yHPsk8WcbGauhrB7jbqnfECcJstrY7wzRlmahqm4CyYvgG8xXKwJ9s8wK7nOI4pM+glHPhU7KRePfQN1Gxi5NzFycMmT/YRlqPWM4+Xo2M9HIFeL+Cygwz/t9pkZWVqpMcvEQlOtf1h+QcHipapYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9xx309Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9xx309Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765833167; x=1797369167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gmz5sebIS4/mbIHs/2L/cB/qwRD8A8HBxtWUTIQaBYQ=;
  b=k9xx309QjDv+osXvtZJM+IyChXPdnA163+x7P7tac9gXfsKb+PmHUP61
   M3NQcmm9Q8iS49LxKBlkcHGXwhRbaw5m244mgeOVCt9OyGMBD1n5RmqQY
   J3nfI+/JMFVUqtqltWBwRHPuW57yiBJmzrJergZMNwKhSCR0q2Rc9Suu1
   LVrROm+gubPzyvI+TPAQfBSVXvjWd8RBfPOkSTjSurOlAKeb1pfgTHj6D
   cQBmlWgBUaVNuASiUK/ZhOvpDkbni6EiO4yTVd+fcj8R2JGbzd4GzYrfs
   RMsHtEcMgg1tva6Q5eqp/FYMW4xpcyQLNdf2cXJ3HlcQkw2dAU71OwzEB
   g==;
X-CSE-ConnectionGUID: XVL0dLJHRFyiRWRSS3+pqQ==
X-CSE-MsgGUID: lDCFYwbtSjKLiZeqtFQi/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67687997"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67687997"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 13:12:46 -0800
X-CSE-ConnectionGUID: fJ01Gs0pSjCdMMW8DsXsPg==
X-CSE-MsgGUID: +0ui6J9KTYquXH0qhk6wRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="228482533"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2025 13:12:44 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVFs1-000000000mT-0ThQ;
	Mon, 15 Dec 2025 21:12:41 +0000
Date: Tue, 16 Dec 2025 05:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vernon Yang <vernon2gm@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, lorenzo.stoakes@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, ziy@nvidia.com, npache@redhat.com,
	baohua@kernel.org, lance.yang@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vernon Yang <yanglincheng@kylinos.cn>
Subject: Re: [PATCH 3/4] mm: khugepaged: move mm to list tail when
 MADV_COLD/MADV_FREE
Message-ID: <202512160400.pTmarqg6-lkp@intel.com>
References: <20251215090419.174418-4-yanglincheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215090419.174418-4-yanglincheng@kylinos.cn>

Hi Vernon,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.19-rc1 next-20251215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/mm-khugepaged-add-trace_mm_khugepaged_scan-event/20251215-171046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251215090419.174418-4-yanglincheng%40kylinos.cn
patch subject: [PATCH 3/4] mm: khugepaged: move mm to list tail when MADV_COLD/MADV_FREE
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20251216/202512160400.pTmarqg6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160400.pTmarqg6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160400.pTmarqg6-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/madvise.c: In function 'madvise_cold':
>> mm/madvise.c:609:9: error: implicit declaration of function 'khugepaged_move_tail'; did you mean 'khugepaged_exit'? [-Wimplicit-function-declaration]
     609 |         khugepaged_move_tail(vma->vm_mm);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         khugepaged_exit


vim +609 mm/madvise.c

   595	
   596	static long madvise_cold(struct madvise_behavior *madv_behavior)
   597	{
   598		struct vm_area_struct *vma = madv_behavior->vma;
   599		struct mmu_gather tlb;
   600	
   601		if (!can_madv_lru_vma(vma))
   602			return -EINVAL;
   603	
   604		lru_add_drain();
   605		tlb_gather_mmu(&tlb, madv_behavior->mm);
   606		madvise_cold_page_range(&tlb, madv_behavior);
   607		tlb_finish_mmu(&tlb);
   608	
 > 609		khugepaged_move_tail(vma->vm_mm);
   610	
   611		return 0;
   612	}
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
