Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7778BF9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Dec 2023 03:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3Ld4n/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703043429; x=1734579429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4aB/N1q4GPCjtZ37MeLtx+uJ0f04S5iyKrS/Q5s6FA=;
  b=V3Ld4n/DIHdVQWAy4thLdPYT10q7QoKvHoujcpcDl+8rgN6eBd4rCKBx
   6ScqQ/nYzi6+Ttwra48oM1AYfhM+PBUgyp8AQ2ukj/kodhE13fCjxEtD3
   +ChoykH15qpVZvJv5CxI/ZFxQde6UoUWnoPqe5ArPoVFBNgbH40kYPab5
   qZRqm/SRcw17Pe8sNd1jEmBvM3ZCIuUEZiegkG7yUjY3IrtSa7R2ZVqIM
   jMXbQCuKFY+1DSOFRMV2HwC5e2X5ozpOfui8PxMTrBJS3NiZRfeo7X4eu
   AFXmhqhnmlYspapFH8/se4Uy9ya1JYSSo3lY46ADjyLwUtstlLw7ULez0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2610265"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="2610265"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 19:37:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="752406292"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="752406292"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Dec 2023 19:37:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFnOI-0006Ho-1x;
	Wed, 20 Dec 2023 03:37:02 +0000
Date: Wed, 20 Dec 2023 11:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:fork-batching 43/43] mm/memory.c:972:30: error:
 implicit declaration of function 'pte_next_pfn'
Message-ID: <202312201139.IKmpLyXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux fork-batching
head:   05bc057b414c5bd673e6a8dce1d195be1bfdac67
commit: 05bc057b414c5bd673e6a8dce1d195be1bfdac67 [43/43] mm/memory: optimize fork() with PTE-mapped THP
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20231220/202312201139.IKmpLyXC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312201139.IKmpLyXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312201139.IKmpLyXC-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'folio_pte_batch':
>> mm/memory.c:972:30: error: implicit declaration of function 'pte_next_pfn' [-Werror=implicit-function-declaration]
     972 |         pte_t expected_pte = pte_next_pfn(pte);
         |                              ^~~~~~~~~~~~
>> mm/memory.c:972:30: error: invalid initializer
>> mm/memory.c:990:32: error: incompatible types when assigning to type 'pte_t' from type 'int'
     990 |                 expected_pte = pte_next_pfn(expected_pte);
         |                                ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pte_next_pfn +972 mm/memory.c

   966	
   967	static inline int folio_pte_batch(struct folio *folio, pte_t *start_ptep,
   968			pte_t pte, unsigned long addr, int max_nr)
   969	{
   970		unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
   971		const pte_t *end_ptep = start_ptep + max_nr;
 > 972		pte_t expected_pte = pte_next_pfn(pte);
   973		pte_t *ptep = start_ptep + 1;
   974	
   975		while (ptep != end_ptep) {
   976			pte = ptep_get(ptep);
   977	
   978			/* Do all PTE bits match, and the PFN is consecutive? */
   979			if (!pte_same(pte, expected_pte))
   980				break;
   981	
   982			/*
   983			 * Stop immediately once we reached the end of the folio. In
   984			 * corner cases the next PFN might fall into a different
   985			 * folio.
   986			 */
   987			if (pte_pfn(pte) == folio_end_pfn - 1)
   988				break;
   989	
 > 990			expected_pte = pte_next_pfn(expected_pte);
   991			ptep++;
   992		}
   993	
   994		return ptep - start_ptep;
   995	}
   996	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
