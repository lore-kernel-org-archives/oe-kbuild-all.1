Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8251AA3E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 23:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722380707; cv=none; b=aewTpL0L55w15iHzvqItmCWZbg20zNqzkN3+sPqlSL06fTuQVqPr/9VVgGxnvTcF6zTJ2mM6VYjFGWi5bdFptshk8IezEX8cMdWhN490A/XWgqaijBM3qUZIeD6qCSXpB+bymUmVkyWg14DOAZbb3sOHhVMN1w3VgUkTPlSYQcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722380707; c=relaxed/simple;
	bh=haNb2WEHs49SmxQJJrwRnSB0McMR+i9lfsy0bdhSxOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ffjxelKMi7wiAa6n2Lof0OgqR1WsCISAH0X+hJoOX8o5rMsUPiavUybBTIZIMdq0nc7FDT2lmieSDOy7Rj6GwYX9g82VlUQkqWxaUnzFKHMYhYvYKtam2kis+F5InWYAT50x+RFtTpmcLcVQ6GGCZS/1DzDb7KDrFQ/I+rCg2fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnYSc98n; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnYSc98n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722380705; x=1753916705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=haNb2WEHs49SmxQJJrwRnSB0McMR+i9lfsy0bdhSxOY=;
  b=AnYSc98nGg8qWZ1pSV5mVF10+upYElvhw9w9a88iSwU9/zjughAYjYLx
   ofwlKlA8pyYHhIeMirM3mwZaD4Qb0uKLXmTz2o+l7/k2dRC0VFuPDESvn
   qawGwqGCbNSDSMK+etV2zOeEzc76Kw9WE6SowkVeL2PPgw/8TF+0aoHpK
   seHJ+5+TDz+BO9fCazqX/0akCSiAmjSOZVy/kDvJ4l2Z615E9L4K/XvBI
   5ysWuvAgZ90crVr+pTI2pIug5bmeSimiJQbpnzqERdp/iRGlC0G+484yQ
   uh3g/G+I3MBhBr21vvyVehDeGSfS7mfFC8MimPV1c6Be/TImD7NT+Tlo/
   A==;
X-CSE-ConnectionGUID: x/sXUQIsTgySD4DS3h5nyA==
X-CSE-MsgGUID: GG2JnOV/T5OZWYt4wl+d9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20038816"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20038816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 16:05:04 -0700
X-CSE-ConnectionGUID: 2ldjJmxsS7+DhMQW9RnCVA==
X-CSE-MsgGUID: HTU44qoRQUespgRxVaMatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="59575372"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jul 2024 16:05:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYvtt-000tTA-26;
	Tue, 30 Jul 2024 23:05:01 +0000
Date: Wed, 31 Jul 2024 07:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 9/17] mm/memory.c:448:33: error: initialization of
 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'}
Message-ID: <202407310911.XJKXzVhQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   e9eb6331a5abf0a71cf90c2d7d349fc32e12ae2e
commit: 9a8dc8f79c872ccb821178a11f3f29574769763a [9/17] mm/pgtable: fully use ptdesc in pte_alloc_one series functions
config: m68k-mvme147_defconfig (https://download.01.org/0day-ci/archive/20240731/202407310911.XJKXzVhQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310911.XJKXzVhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407310911.XJKXzVhQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function '__pte_alloc':
>> mm/memory.c:448:33: error: initialization of 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Werror=incompatible-pointer-types]
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                                 ^~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from mm/memory.c:43:
   include/linux/mm_types.h:509:41: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Werror=incompatible-pointer-types]
     507 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     508 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     509 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/memory.c:454:30: note: in expansion of macro 'ptdesc_page'
     454 |                 pte_free(mm, ptdesc_page(ptdesc));
         |                              ^~~~~~~~~~~
   In file included from arch/m68k/include/asm/pgalloc.h:16,
                    from mm/memory.c:86:
   arch/m68k/include/asm/motorola_pgalloc.h:42:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
      42 | static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/memory.c: In function '__do_fault':
   include/linux/mm_types.h:507:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     507 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:4650:37: note: in expansion of macro 'ptdesc_page'
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ^~~~~~~~~~~
   mm/memory.c: In function 'do_fault_around':
   include/linux/mm_types.h:507:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     507 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:5013:37: note: in expansion of macro 'ptdesc_page'
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                     ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +448 mm/memory.c

   445	
   446	int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
   447	{
 > 448		struct ptdesc *ptdesc = pte_alloc_one(mm);
   449		if (!ptdesc)
   450			return -ENOMEM;
   451	
   452		pmd_install(mm, pmd, (pgtable_t *)&ptdesc);
   453		if (ptdesc)
   454			pte_free(mm, ptdesc_page(ptdesc));
   455		return 0;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
