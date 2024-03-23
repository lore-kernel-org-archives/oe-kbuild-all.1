Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22C23BF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711177975; cv=none; b=kdmPSSiNA0bXy+rNEdYpyfLOpvbBXvKqzRbHiWbuR3homB4TgcocHDDwCoGrfF1Q9+cNuihZVU4uLdWyWhEAM+EO1CZQTOQAj5Qhvq0e8984VhepoHEkbKPD642UFgf6ronMVBPSFA9ABl+ehnaKaf7e44A6acSvq0aoM4Pk1G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711177975; c=relaxed/simple;
	bh=cSWgzeObFxPAgbblskyGZUiGuE1cbDz3Kn/2uNbQNd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJyhhxLzxjaoLc6ogAirgcssfLsi8+jGVMUqfACi+Fh77z2/4vVvNWuewH4RY1zxa8VOrQZVXEwkYjnnhGM3ELOy0KrrAKhvBml/KVmJ65CcHsj+SyEN1LvkEHYSSF7odiJVKGK7MPhsR9yAnUoGYXjzMX2qlIJDS6sKKFkSxaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXj3c3wC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXj3c3wC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711177974; x=1742713974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSWgzeObFxPAgbblskyGZUiGuE1cbDz3Kn/2uNbQNd4=;
  b=XXj3c3wCXzfNcj08RxiPXqdrDJYS+qPHLVvSSnk/2DbuQRH5bn7sdLJv
   P6d/X4DogqyL6/YdlNTSY0NkXf5HIfgYg4IbeTROR+fniifWVICKqi6te
   q8+YtPi6AWcViXhSnlRaACsNRaX8v5Sz1VY+p9361udT8DGz40JTNde28
   MY3M8jXTE7+fSmXtQcScPZz6dy9L4xbZkVeTyCpZMgKMhFOCAHVEIN+Ej
   jlmh5rKknBebTbM3esVNSJjUFnS5cCZ13voqdyukum1XjOFnw4VfN77Wd
   gsC5Y1tFCryQ9GtdTA7wEi7cZpl6CR//Ynmsp2wnaOTdFFzi/mXEaQufi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6345647"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="6345647"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 00:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="46262885"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Mar 2024 00:12:51 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnvYf-000KxH-0v;
	Sat, 23 Mar 2024 07:12:49 +0000
Date: Sat, 23 Mar 2024 15:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [akpm-mm:mm-unstable 115/141] mm/gup.c:536:29: error: implicit
 declaration of function 'pud_pfn'; did you mean 'pmd_pfn'?
Message-ID: <202403231529.HRev1zcD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   af520f81c51001f7ccdf0579fc73df282b26292d
commit: 529f3b89b7333564792458ca7be06f5bff258d23 [115/141] mm/gup: handle huge pud for follow_pud_mask()
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240323/202403231529.HRev1zcD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231529.HRev1zcD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231529.HRev1zcD-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/gup.c: In function 'follow_huge_pud':
>> mm/gup.c:536:29: error: implicit declaration of function 'pud_pfn'; did you mean 'pmd_pfn'? [-Werror=implicit-function-declaration]
     536 |         unsigned long pfn = pud_pfn(pud);
         |                             ^~~~~~~
         |                             pmd_pfn
   cc1: some warnings being treated as errors


vim +536 mm/gup.c

   527	
   528	#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
   529	static struct page *follow_huge_pud(struct vm_area_struct *vma,
   530					    unsigned long addr, pud_t *pudp,
   531					    int flags, struct follow_page_context *ctx)
   532	{
   533		struct mm_struct *mm = vma->vm_mm;
   534		struct page *page;
   535		pud_t pud = *pudp;
 > 536		unsigned long pfn = pud_pfn(pud);
   537		int ret;
   538	
   539		assert_spin_locked(pud_lockptr(mm, pudp));
   540	
   541		if ((flags & FOLL_WRITE) && !pud_write(pud))
   542			return NULL;
   543	
   544		if (!pud_present(pud))
   545			return NULL;
   546	
   547		pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
   548	
   549		if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
   550		    pud_devmap(pud)) {
   551			/*
   552			 * device mapped pages can only be returned if the caller
   553			 * will manage the page reference count.
   554			 *
   555			 * At least one of FOLL_GET | FOLL_PIN must be set, so
   556			 * assert that here:
   557			 */
   558			if (!(flags & (FOLL_GET | FOLL_PIN)))
   559				return ERR_PTR(-EEXIST);
   560	
   561			if (flags & FOLL_TOUCH)
   562				touch_pud(vma, addr, pudp, flags & FOLL_WRITE);
   563	
   564			ctx->pgmap = get_dev_pagemap(pfn, ctx->pgmap);
   565			if (!ctx->pgmap)
   566				return ERR_PTR(-EFAULT);
   567		}
   568	
   569		page = pfn_to_page(pfn);
   570	
   571		if (!pud_devmap(pud) && !pud_write(pud) &&
   572		    gup_must_unshare(vma, flags, page))
   573			return ERR_PTR(-EMLINK);
   574	
   575		ret = try_grab_page(page, flags);
   576		if (ret)
   577			page = ERR_PTR(ret);
   578		else
   579			ctx->page_mask = HPAGE_PUD_NR - 1;
   580	
   581		return page;
   582	}
   583	#else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
   584	static struct page *follow_huge_pud(struct vm_area_struct *vma,
   585					    unsigned long addr, pud_t *pudp,
   586					    int flags, struct follow_page_context *ctx)
   587	{
   588		return NULL;
   589	}
   590	#endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
