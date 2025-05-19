Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299021AAA1E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640101; cv=none; b=K2ZXPEhposOW46O/pNVrDbpIw45MINBAO5R9ytF+KXkbZRwQRBQkiIXN5j6ThmYCv5GT1sgBU467XmOCHhG7FJkAyQUfSdUZAY+x8H3idotk6Az7z5fEc1U2MpPPYK9fRWmbY0YfBxQZAHWKyoposbDjgoSUyLEhCuXVdioPebk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640101; c=relaxed/simple;
	bh=LaBP5GDqr99j3ZTkPuJjXr1RLEErnA6DZ7lPo9h/F8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OWrrYkyw2rMOAqw2GDQyUMvgXviyjiJ23RsCbC8e5HRv7RN6ccK5act6BMdOPsyPTIgtU/TwWp8AAK0xm6EKsvBRvgiXQK0xQ6ATfH3y5D5v4iqpktAAQHHUU4ipBowTNtXbS6kzRq+FtQzPYec6ozNBCq1kYQZPpoGFrgLC+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EI0WmIMo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EI0WmIMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747640100; x=1779176100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LaBP5GDqr99j3ZTkPuJjXr1RLEErnA6DZ7lPo9h/F8I=;
  b=EI0WmIMoFRm46J03bylRnbYUhl4/Ae/71laVQ3XRr+3zapQpyQDizF4j
   ZM+VTpFx6bi4lHDuR8ugJVuZaWYFdlybwSFZbOBliSl3tzctQ4iq6I2Oy
   EH0C2GShtiXzMXrJ9BvrksMlahTdv31btNrvdXTuHgAomXRipW4Qp5/ck
   /49xvjPa0K/jcgV4d8Cri9gCJwztjtF40j3ZRZ0W71IsU7k0grf8RepBD
   nwjFWBAik/yT2bTdRYJNFklve+49DDcN0sFMBH6ife/fFnTuE9WGmBg5O
   nZx4z/9psZ9NQRJ58HDtreK0r3uIOHu76bNsr8gQs3oeRzXXFE175HEVq
   w==;
X-CSE-ConnectionGUID: UXBFB14ZQ8m1b0wOm25Tig==
X-CSE-MsgGUID: O21DkxWeQL+LsWoYUzbPjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="48780483"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="48780483"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 00:34:59 -0700
X-CSE-ConnectionGUID: sOhhaZhxSrWz/zyzkLPz/w==
X-CSE-MsgGUID: ilRB8x4ASN2QPZJJvtVsCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="143294960"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 May 2025 00:34:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGv1T-000LG7-2e;
	Mon, 19 May 2025 07:34:55 +0000
Date: Mon, 19 May 2025 15:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:ackerley-1g-master 52/75] mm/hugetlb_vmemmap.c:542:17:
 error: implicit declaration of function 'flush_tlb_all'; did you mean
 'flush_tlb_page'?
Message-ID: <202505191553.AMCEpROA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ackerley,

First bad commit (maybe != root cause):

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: 4f9ec797adddb85edd77bc785348b440d8025dc9 [52/75] mm: guestmem_hugetlb: Wrap HugeTLB as an allocator for guest_memfd
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250519/202505191553.AMCEpROA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191553.AMCEpROA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191553.AMCEpROA-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb_vmemmap.c: In function 'hugetlb_vmemmap_restore_folios':
>> mm/hugetlb_vmemmap.c:542:17: error: implicit declaration of function 'flush_tlb_all'; did you mean 'flush_tlb_page'? [-Wimplicit-function-declaration]
     542 |                 flush_tlb_all();
         |                 ^~~~~~~~~~~~~
         |                 flush_tlb_page

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HUGETLB_PAGE_OPTIMIZE_VMEMMAP
   Depends on [n]: ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP [=n] && SPARSEMEM_VMEMMAP [=y]
   Selected by [y]:
   - GUESTMEM_HUGETLB [=y]


vim +542 mm/hugetlb_vmemmap.c

c24f188b228929 Mike Kravetz 2023-10-18  503  
cfb8c75099dbf1 Mike Kravetz 2023-10-18  504  /**
cfb8c75099dbf1 Mike Kravetz 2023-10-18  505   * hugetlb_vmemmap_restore_folios - restore vmemmap for every folio on the list.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  506   * @h:			hstate.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  507   * @folio_list:		list of folios.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  508   * @non_hvo_folios:	Output list of folios for which vmemmap exists.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  509   *
cfb8c75099dbf1 Mike Kravetz 2023-10-18  510   * Return: number of folios for which vmemmap was restored, or an error code
cfb8c75099dbf1 Mike Kravetz 2023-10-18  511   *		if an error was encountered restoring vmemmap for a folio.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  512   *		Folios that have vmemmap are moved to the non_hvo_folios
cfb8c75099dbf1 Mike Kravetz 2023-10-18  513   *		list.  Processing of entries stops when the first error is
cfb8c75099dbf1 Mike Kravetz 2023-10-18  514   *		encountered. The folio that experienced the error and all
cfb8c75099dbf1 Mike Kravetz 2023-10-18  515   *		non-processed folios will remain on folio_list.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  516   */
cfb8c75099dbf1 Mike Kravetz 2023-10-18  517  long hugetlb_vmemmap_restore_folios(const struct hstate *h,
cfb8c75099dbf1 Mike Kravetz 2023-10-18  518  					struct list_head *folio_list,
cfb8c75099dbf1 Mike Kravetz 2023-10-18  519  					struct list_head *non_hvo_folios)
cfb8c75099dbf1 Mike Kravetz 2023-10-18  520  {
cfb8c75099dbf1 Mike Kravetz 2023-10-18  521  	struct folio *folio, *t_folio;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  522  	long restored = 0;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  523  	long ret = 0;
c2a967f6ab0ec8 Yu Zhao      2024-07-18  524  	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
bd225530a4c717 Yu Zhao      2024-06-27  525  
cfb8c75099dbf1 Mike Kravetz 2023-10-18  526  	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
cfb8c75099dbf1 Mike Kravetz 2023-10-18  527  		if (folio_test_hugetlb_vmemmap_optimized(folio)) {
c2a967f6ab0ec8 Yu Zhao      2024-07-18  528  			ret = __hugetlb_vmemmap_restore_folio(h, folio, flags);
c2a967f6ab0ec8 Yu Zhao      2024-07-18  529  			/* only need to synchronize_rcu() once for each batch */
c2a967f6ab0ec8 Yu Zhao      2024-07-18  530  			flags &= ~VMEMMAP_SYNCHRONIZE_RCU;
c2a967f6ab0ec8 Yu Zhao      2024-07-18  531  
cfb8c75099dbf1 Mike Kravetz 2023-10-18  532  			if (ret)
cfb8c75099dbf1 Mike Kravetz 2023-10-18  533  				break;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  534  			restored++;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  535  		}
cfb8c75099dbf1 Mike Kravetz 2023-10-18  536  
cfb8c75099dbf1 Mike Kravetz 2023-10-18  537  		/* Add non-optimized folios to output list */
cfb8c75099dbf1 Mike Kravetz 2023-10-18  538  		list_move(&folio->lru, non_hvo_folios);
cfb8c75099dbf1 Mike Kravetz 2023-10-18  539  	}
cfb8c75099dbf1 Mike Kravetz 2023-10-18  540  
c24f188b228929 Mike Kravetz 2023-10-18  541  	if (restored)
c24f188b228929 Mike Kravetz 2023-10-18 @542  		flush_tlb_all();
cfb8c75099dbf1 Mike Kravetz 2023-10-18  543  	if (!ret)
cfb8c75099dbf1 Mike Kravetz 2023-10-18  544  		ret = restored;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  545  	return ret;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  546  }
cfb8c75099dbf1 Mike Kravetz 2023-10-18  547  

:::::: The code at line 542 was first introduced by commit
:::::: c24f188b22892908a2a3bb2de0ce7d121dd72989 hugetlb: batch TLB flushes when restoring vmemmap

:::::: TO: Mike Kravetz <mike.kravetz@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
