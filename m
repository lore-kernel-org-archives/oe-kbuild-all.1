Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27E817B4FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Aug 2024 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724512511; cv=none; b=P4KnR4QK7cBsMbsznWXpS09nzaQxfy+8a4ugoYhuKaN0HC6bch4CtHrEOXk5otzkwuhFvssJRsIBuoMCGbuxZSNPLzYKNFGyKBcv5JbmqPwHN8nTAJVODKJKLcCgYwLivIP7noOaxoojDggv5On+zSq/tonPHNtM8qLl07RXyao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724512511; c=relaxed/simple;
	bh=CeZa9vSR5SwJYVUZMzInWjMp5f//bjkpQ8YBSIzGI5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1ZrWcekQKNd4TQpBz3IB8/7ZWNrlFn7Ugv41i8Zbx9RKvIS6p/Wyji1rH4PKO0EQzKHNz8jKg3M9/yj1EjvnuncIY+oWh5eMj9NyBraerjOq+nJzeOsYBXXmKz9XLjUK/1+uWVzzKy1J3LODei9rPuHTF621aeqEfML1REQtCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvm79B5h; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvm79B5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724512509; x=1756048509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CeZa9vSR5SwJYVUZMzInWjMp5f//bjkpQ8YBSIzGI5o=;
  b=cvm79B5hE9uZvJ4mT5bXExVO3Lm2prL1pcHkcgKFLrUfFkcSTahOUF6j
   CgFHfQlX/bT3Yyj18kdxFEo3cYn1oy4xOvn74X3JhsjWbQkunIIYxt1b4
   7eLihhtKeLG3XbMS5XFBAUXTswlsg1MiyzWIGsXNGrHysd3FlwecDYW9q
   ibqVC2fspqJBQ61qEmm7I+lx70KEJjvaOLBDMsrsKpGcH9zFB3YMvx1gh
   mnybHTcQHDnAXCupck8tyZzHTpIP2gHJw8FEbXadFvG6NeklWGfh3Czw4
   /vGhKh7f5OsCy9MPOUI4bzL5KosKBEL1lbIO1xlf1FWo8mHiMyXS+poC+
   g==;
X-CSE-ConnectionGUID: qNUV5Z9TSmyNLghd+PDevA==
X-CSE-MsgGUID: 3tpg+FMsTKm7aj1Y6xDjzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34395858"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="34395858"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 08:15:08 -0700
X-CSE-ConnectionGUID: ZM/+bhfpR8WbTnzX6WTW2A==
X-CSE-MsgGUID: 8+5rnZfjQzepHVKjRAWO8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="67022625"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Aug 2024 08:15:07 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shsTo-000EYV-0m;
	Sat, 24 Aug 2024 15:15:04 +0000
Date: Sat, 24 Aug 2024 23:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [akpm-mm:mm-unstable 357/379] mm/vma.h:113:28: error:
 'FIRST_USER_ADDRESS' undeclared
Message-ID: <202408242304.1A1fXTgE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   b659edec079c90012cf8d05624e312d1062b8b87
commit: ca39aca8db2d78ff82356defba75d14ce78a67b9 [357/379] mm/vma: track start and end for munmap in vma_munmap_struct
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20240824/202408242304.1A1fXTgE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408242304.1A1fXTgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408242304.1A1fXTgE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/internal.h:22,
                    from mm/filemap.c:52:
   mm/vma.h: In function 'init_vma_munmap':
>> mm/vma.h:113:28: error: 'FIRST_USER_ADDRESS' undeclared (first use in this function)
     113 |         vms->unmap_start = FIRST_USER_ADDRESS;
         |                            ^~~~~~~~~~~~~~~~~~
   mm/vma.h:113:28: note: each undeclared identifier is reported only once for each function it appears in
>> mm/vma.h:114:26: error: 'USER_PGTABLES_CEILING' undeclared (first use in this function)
     114 |         vms->unmap_end = USER_PGTABLES_CEILING;
         |                          ^~~~~~~~~~~~~~~~~~~~~


vim +/FIRST_USER_ADDRESS +113 mm/vma.h

    67	
    68	/* Required for do_brk_flags(). */
    69	void init_vma_prep(struct vma_prepare *vp,
    70			   struct vm_area_struct *vma);
    71	
    72	/* Required for do_brk_flags(). */
    73	void vma_complete(struct vma_prepare *vp,
    74			  struct vma_iterator *vmi, struct mm_struct *mm);
    75	
    76	int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
    77		       unsigned long start, unsigned long end, pgoff_t pgoff,
    78		       struct vm_area_struct *next);
    79	
    80	int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
    81		       unsigned long start, unsigned long end, pgoff_t pgoff);
    82	
    83	/*
    84	 * init_vma_munmap() - Initializer wrapper for vma_munmap_struct
    85	 * @vms: The vma munmap struct
    86	 * @vmi: The vma iterator
    87	 * @vma: The first vm_area_struct to munmap
    88	 * @start: The aligned start address to munmap
    89	 * @end: The aligned end address to munmap
    90	 * @uf: The userfaultfd list_head
    91	 * @unlock: Unlock after the operation.  Only unlocked on success
    92	 */
    93	static inline void init_vma_munmap(struct vma_munmap_struct *vms,
    94			struct vma_iterator *vmi, struct vm_area_struct *vma,
    95			unsigned long start, unsigned long end, struct list_head *uf,
    96			bool unlock)
    97	{
    98		vms->vmi = vmi;
    99		vms->vma = vma;
   100		if (vma) {
   101			vms->mm = vma->vm_mm;
   102			vms->start = start;
   103			vms->end = end;
   104		} else {
   105			vms->mm = NULL;
   106			vms->start = vms->end = 0;
   107		}
   108		vms->unlock = unlock;
   109		vms->uf = uf;
   110		vms->vma_count = 0;
   111		vms->nr_pages = vms->locked_vm = vms->nr_accounted = 0;
   112		vms->exec_vm = vms->stack_vm = vms->data_vm = 0;
 > 113		vms->unmap_start = FIRST_USER_ADDRESS;
 > 114		vms->unmap_end = USER_PGTABLES_CEILING;
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
