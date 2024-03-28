Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB74B225A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 23:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711668811; cv=none; b=XdXYDyHu0XrejpC+H1pjLNBBI9ZJtv5CKhJNGRhmmPhFys6SEODnqo+ScfyASdOdpIWO5F9pjT6VPu5Bp6FVKFbjSeT0b8aQ2PPLiwSZt/xreg/X7AgmaZSY6K2gUrYpK7ZsXetv7wvRf+6FBUbYLGvRQa/+RcVJDTTKilBwKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711668811; c=relaxed/simple;
	bh=NyFbDF2ZYmf+7yoO1K2AnWVd1/ktbIvxs0yWVt8dpu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lg6maDswqIQOCyB0nFd7tQBXLhOHP5LuzKFuplpGZbbLMMgFEO+1OZfPVzXsN3DqmvtNpiHxSXP61i7aegTmCsgGDOHOCjWwN65AuLhBxPL8GK6MUFNb+mXVB5nTe3MlVxOZpt4V3ZhVNZvsrp769xpuMjCqWjD8wi8DgmEqEYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFN+T0+Q; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFN+T0+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711668809; x=1743204809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NyFbDF2ZYmf+7yoO1K2AnWVd1/ktbIvxs0yWVt8dpu8=;
  b=KFN+T0+Q8xabDZxM9W3z69o8ho5Qxjsa7ETfYW2y91YhlsTUD1AndyBM
   HNOVz783lTG+vYdBflYEPMNc0VzdNdpaoSAEXHLlBNMLEyPfxF9vlklOu
   b4LYgYi4hMHDegu7591w1hMVZgrgEcZalJMzRA+CKlGdNObmGkYIp7oMW
   MD1SOpXpFvnUafWpZ7Y/QsR8z4x/3Bu9U0eiwumX5ubq1TbCGXy8b8iVC
   w4Y6ABxUm8fiudwImiF1mHv0ea+lEUgKNEYuVz7gbem/9m5//aBBmyc8/
   5pHchckM1hweAPXvkA6P/9lM6gxp48lMWEuxyoD/VIX3f0IyJ7cHHOTyV
   w==;
X-CSE-ConnectionGUID: lncH3ijySSO0pK5SFOHBNQ==
X-CSE-MsgGUID: rrPKPHECS0yw0dz6LqZ/sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17407762"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17407762"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 16:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16632176"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2024 16:33:26 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpzFL-0002cU-3A;
	Thu, 28 Mar 2024 23:33:23 +0000
Date: Fri, 29 Mar 2024 07:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [linux-next:master 2064/2532] mm/vmalloc.c:3724: warning: expecting
 prototype for __vmalloc_node_range_noprof(). Prototype was for
 __vmalloc_node_range() instead
Message-ID: <202403290754.Kzntd5yH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: 9aa556ae32f93a3d72747460903fdd229be19d54 [2064/2532] mm: vmalloc: enable memory allocation profiling
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403290754.Kzntd5yH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290754.Kzntd5yH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290754.Kzntd5yH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:3724: warning: expecting prototype for __vmalloc_node_range_noprof(). Prototype was for __vmalloc_node_range() instead
>> mm/vmalloc.c:3869: warning: expecting prototype for __vmalloc_node_noprof(). Prototype was for __vmalloc_node() instead
>> mm/vmalloc.c:3942: warning: expecting prototype for vzalloc_noprof(). Prototype was for vzalloc() instead
>> mm/vmalloc.c:3980: warning: expecting prototype for vmalloc_node_noprof(). Prototype was for vmalloc_node() instead
>> mm/vmalloc.c:3998: warning: expecting prototype for vzalloc_node_noprof(). Prototype was for vzalloc_node() instead
>> mm/vmalloc.c:4026: warning: expecting prototype for vmalloc_32_noprof(). Prototype was for vmalloc_32() instead
>> mm/vmalloc.c:4042: warning: expecting prototype for vmalloc_32_user_noprof(). Prototype was for vmalloc_32_user() instead


vim +3724 mm/vmalloc.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  3691  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3692  /**
9aa556ae32f93a Kent Overstreet         2024-03-21  3693   * __vmalloc_node_range_noprof - allocate virtually contiguous memory
^1da177e4c3f41 Linus Torvalds          2005-04-16  3694   * @size:		  allocation size
2dca6999eed58d David Miller            2009-09-21  3695   * @align:		  desired alignment
d0a21265dfb5fa David Rientjes          2011-01-13  3696   * @start:		  vm area range start
d0a21265dfb5fa David Rientjes          2011-01-13  3697   * @end:		  vm area range end
^1da177e4c3f41 Linus Torvalds          2005-04-16  3698   * @gfp_mask:		  flags for the page level allocator
^1da177e4c3f41 Linus Torvalds          2005-04-16  3699   * @prot:		  protection mask for the allocated pages
cb9e3c292d0115 Andrey Ryabinin         2015-02-13  3700   * @vm_flags:		  additional vm area flags (e.g. %VM_NO_GUARD)
00ef2d2f84babb David Rientjes          2013-02-22  3701   * @node:		  node to use for allocation or NUMA_NO_NODE
c85d194bfd2e36 Randy Dunlap            2008-05-01  3702   * @caller:		  caller's return address
^1da177e4c3f41 Linus Torvalds          2005-04-16  3703   *
^1da177e4c3f41 Linus Torvalds          2005-04-16  3704   * Allocate enough pages to cover @size from the page level
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3705   * allocator with @gfp_mask flags. Please note that the full set of gfp
30d3f01191d305 Michal Hocko            2022-01-14  3706   * flags are not supported. GFP_KERNEL, GFP_NOFS and GFP_NOIO are all
30d3f01191d305 Michal Hocko            2022-01-14  3707   * supported.
30d3f01191d305 Michal Hocko            2022-01-14  3708   * Zone modifiers are not supported. From the reclaim modifiers
30d3f01191d305 Michal Hocko            2022-01-14  3709   * __GFP_DIRECT_RECLAIM is required (aka GFP_NOWAIT is not supported)
30d3f01191d305 Michal Hocko            2022-01-14  3710   * and only __GFP_NOFAIL is supported (i.e. __GFP_NORETRY and
30d3f01191d305 Michal Hocko            2022-01-14  3711   * __GFP_RETRY_MAYFAIL are not supported).
30d3f01191d305 Michal Hocko            2022-01-14  3712   *
30d3f01191d305 Michal Hocko            2022-01-14  3713   * __GFP_NOWARN can be used to suppress failures messages.
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3714   *
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3715   * Map them into contiguous kernel virtual space, using a pagetable
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3716   * protection of @prot.
a862f68a8b3600 Mike Rapoport           2019-03-05  3717   *
a862f68a8b3600 Mike Rapoport           2019-03-05  3718   * Return: the address of the area or %NULL on failure
^1da177e4c3f41 Linus Torvalds          2005-04-16  3719   */
9aa556ae32f93a Kent Overstreet         2024-03-21  3720  void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
d0a21265dfb5fa David Rientjes          2011-01-13  3721  			unsigned long start, unsigned long end, gfp_t gfp_mask,
cb9e3c292d0115 Andrey Ryabinin         2015-02-13  3722  			pgprot_t prot, unsigned long vm_flags, int node,
cb9e3c292d0115 Andrey Ryabinin         2015-02-13  3723  			const void *caller)
^1da177e4c3f41 Linus Torvalds          2005-04-16 @3724  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3725  	struct vm_struct *area;
19f1c3acf8f443 Andrey Konovalov        2022-03-24  3726  	void *ret;
f6e39794f4b6da Andrey Konovalov        2022-03-24  3727  	kasan_vmalloc_flags_t kasan_flags = KASAN_VMALLOC_NONE;
89219d37a2377c Catalin Marinas         2009-06-11  3728  	unsigned long real_size = size;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3729  	unsigned long real_align = align;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3730  	unsigned int shift = PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3731  
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3732  	if (WARN_ON_ONCE(!size))
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3733  		return NULL;
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3734  
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3735  	if ((size >> PAGE_SHIFT) > totalram_pages()) {
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3736  		warn_alloc(gfp_mask, NULL,
f4bdfeaf18a44b Uladzislau Rezki (Sony  2021-06-28  3737) 			"vmalloc error: size %lu, exceeds total pages",
f4bdfeaf18a44b Uladzislau Rezki (Sony  2021-06-28  3738) 			real_size);
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3739  		return NULL;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3740  	}
121e6f3258fe39 Nicholas Piggin         2021-04-29  3741  
559089e0a93d44 Song Liu                2022-04-15  3742  	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
121e6f3258fe39 Nicholas Piggin         2021-04-29  3743  		unsigned long size_per_node;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3744  
121e6f3258fe39 Nicholas Piggin         2021-04-29  3745  		/*
121e6f3258fe39 Nicholas Piggin         2021-04-29  3746  		 * Try huge pages. Only try for PAGE_KERNEL allocations,
121e6f3258fe39 Nicholas Piggin         2021-04-29  3747  		 * others like modules don't yet expect huge pages in
121e6f3258fe39 Nicholas Piggin         2021-04-29  3748  		 * their allocations due to apply_to_page_range not
121e6f3258fe39 Nicholas Piggin         2021-04-29  3749  		 * supporting them.
121e6f3258fe39 Nicholas Piggin         2021-04-29  3750  		 */
121e6f3258fe39 Nicholas Piggin         2021-04-29  3751  
121e6f3258fe39 Nicholas Piggin         2021-04-29  3752  		size_per_node = size;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3753  		if (node == NUMA_NO_NODE)
121e6f3258fe39 Nicholas Piggin         2021-04-29  3754  			size_per_node /= num_online_nodes();
3382bbee0464bf Christophe Leroy        2021-06-30  3755  		if (arch_vmap_pmd_supported(prot) && size_per_node >= PMD_SIZE)
121e6f3258fe39 Nicholas Piggin         2021-04-29  3756  			shift = PMD_SHIFT;
3382bbee0464bf Christophe Leroy        2021-06-30  3757  		else
3382bbee0464bf Christophe Leroy        2021-06-30  3758  			shift = arch_vmap_pte_supported_shift(size_per_node);
3382bbee0464bf Christophe Leroy        2021-06-30  3759  
121e6f3258fe39 Nicholas Piggin         2021-04-29  3760  		align = max(real_align, 1UL << shift);
121e6f3258fe39 Nicholas Piggin         2021-04-29  3761  		size = ALIGN(real_size, 1UL << shift);
121e6f3258fe39 Nicholas Piggin         2021-04-29  3762  	}
121e6f3258fe39 Nicholas Piggin         2021-04-29  3763  
121e6f3258fe39 Nicholas Piggin         2021-04-29  3764  again:
7ca3027b726be6 Daniel Axtens           2021-06-24  3765  	area = __get_vm_area_node(real_size, align, shift, VM_ALLOC |
7ca3027b726be6 Daniel Axtens           2021-06-24  3766  				  VM_UNINITIALIZED | vm_flags, start, end, node,
7ca3027b726be6 Daniel Axtens           2021-06-24  3767  				  gfp_mask, caller);
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3768  	if (!area) {
9376130c390a76 Michal Hocko            2022-01-14  3769  		bool nofail = gfp_mask & __GFP_NOFAIL;
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3770  		warn_alloc(gfp_mask, NULL,
9376130c390a76 Michal Hocko            2022-01-14  3771  			"vmalloc error: size %lu, vm_struct allocation failed%s",
9376130c390a76 Michal Hocko            2022-01-14  3772  			real_size, (nofail) ? ". Retrying." : "");
9376130c390a76 Michal Hocko            2022-01-14  3773  		if (nofail) {
9376130c390a76 Michal Hocko            2022-01-14  3774  			schedule_timeout_uninterruptible(1);
9376130c390a76 Michal Hocko            2022-01-14  3775  			goto again;
9376130c390a76 Michal Hocko            2022-01-14  3776  		}
de7d2b567d040e Joe Perches             2011-10-31  3777  		goto fail;
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3778  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3779  
f6e39794f4b6da Andrey Konovalov        2022-03-24  3780  	/*
f6e39794f4b6da Andrey Konovalov        2022-03-24  3781  	 * Prepare arguments for __vmalloc_area_node() and
f6e39794f4b6da Andrey Konovalov        2022-03-24  3782  	 * kasan_unpoison_vmalloc().
f6e39794f4b6da Andrey Konovalov        2022-03-24  3783  	 */
f6e39794f4b6da Andrey Konovalov        2022-03-24  3784  	if (pgprot_val(prot) == pgprot_val(PAGE_KERNEL)) {
f6e39794f4b6da Andrey Konovalov        2022-03-24  3785  		if (kasan_hw_tags_enabled()) {
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3786  			/*
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3787  			 * Modify protection bits to allow tagging.
f6e39794f4b6da Andrey Konovalov        2022-03-24  3788  			 * This must be done before mapping.
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3789  			 */
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3790  			prot = arch_vmap_pgprot_tagged(prot);
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3791  
23689e91fb22c1 Andrey Konovalov        2022-03-24  3792  			/*
f6e39794f4b6da Andrey Konovalov        2022-03-24  3793  			 * Skip page_alloc poisoning and zeroing for physical
f6e39794f4b6da Andrey Konovalov        2022-03-24  3794  			 * pages backing VM_ALLOC mapping. Memory is instead
f6e39794f4b6da Andrey Konovalov        2022-03-24  3795  			 * poisoned and zeroed by kasan_unpoison_vmalloc().
23689e91fb22c1 Andrey Konovalov        2022-03-24  3796  			 */
0a54864f8dfb64 Peter Collingbourne     2023-03-09  3797  			gfp_mask |= __GFP_SKIP_KASAN | __GFP_SKIP_ZERO;
23689e91fb22c1 Andrey Konovalov        2022-03-24  3798  		}
23689e91fb22c1 Andrey Konovalov        2022-03-24  3799  
f6e39794f4b6da Andrey Konovalov        2022-03-24  3800  		/* Take note that the mapping is PAGE_KERNEL. */
f6e39794f4b6da Andrey Konovalov        2022-03-24  3801  		kasan_flags |= KASAN_VMALLOC_PROT_NORMAL;
f6e39794f4b6da Andrey Konovalov        2022-03-24  3802  	}
f6e39794f4b6da Andrey Konovalov        2022-03-24  3803  
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3804  	/* Allocate physical pages and map them into vmalloc space. */
19f1c3acf8f443 Andrey Konovalov        2022-03-24  3805  	ret = __vmalloc_area_node(area, gfp_mask, prot, shift, node);
19f1c3acf8f443 Andrey Konovalov        2022-03-24  3806  	if (!ret)
121e6f3258fe39 Nicholas Piggin         2021-04-29  3807  		goto fail;
89219d37a2377c Catalin Marinas         2009-06-11  3808  
23689e91fb22c1 Andrey Konovalov        2022-03-24  3809  	/*
23689e91fb22c1 Andrey Konovalov        2022-03-24  3810  	 * Mark the pages as accessible, now that they are mapped.
6c2f761dad7851 Andrey Konovalov        2022-06-09  3811  	 * The condition for setting KASAN_VMALLOC_INIT should complement the
6c2f761dad7851 Andrey Konovalov        2022-06-09  3812  	 * one in post_alloc_hook() with regards to the __GFP_SKIP_ZERO check
6c2f761dad7851 Andrey Konovalov        2022-06-09  3813  	 * to make sure that memory is initialized under the same conditions.
f6e39794f4b6da Andrey Konovalov        2022-03-24  3814  	 * Tag-based KASAN modes only assign tags to normal non-executable
f6e39794f4b6da Andrey Konovalov        2022-03-24  3815  	 * allocations, see __kasan_unpoison_vmalloc().
23689e91fb22c1 Andrey Konovalov        2022-03-24  3816  	 */
f6e39794f4b6da Andrey Konovalov        2022-03-24  3817  	kasan_flags |= KASAN_VMALLOC_VM_ALLOC;
6c2f761dad7851 Andrey Konovalov        2022-06-09  3818  	if (!want_init_on_free() && want_init_on_alloc(gfp_mask) &&
6c2f761dad7851 Andrey Konovalov        2022-06-09  3819  	    (gfp_mask & __GFP_SKIP_ZERO))
23689e91fb22c1 Andrey Konovalov        2022-03-24  3820  		kasan_flags |= KASAN_VMALLOC_INIT;
f6e39794f4b6da Andrey Konovalov        2022-03-24  3821  	/* KASAN_VMALLOC_PROT_NORMAL already set if required. */
23689e91fb22c1 Andrey Konovalov        2022-03-24  3822  	area->addr = kasan_unpoison_vmalloc(area->addr, real_size, kasan_flags);
19f1c3acf8f443 Andrey Konovalov        2022-03-24  3823  
f5252e009d5b87 Mitsuo Hayasaka         2011-10-31  3824  	/*
20fc02b477c526 Zhang Yanfei            2013-07-08  3825  	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
20fc02b477c526 Zhang Yanfei            2013-07-08  3826  	 * flag. It means that vm_struct is not fully initialized.
4341fa454796b8 Joonsoo Kim             2013-04-29  3827  	 * Now, it is fully initialized, so remove this flag here.
f5252e009d5b87 Mitsuo Hayasaka         2011-10-31  3828  	 */
20fc02b477c526 Zhang Yanfei            2013-07-08  3829  	clear_vm_uninitialized_flag(area);
f5252e009d5b87 Mitsuo Hayasaka         2011-10-31  3830  
7ca3027b726be6 Daniel Axtens           2021-06-24  3831  	size = PAGE_ALIGN(size);
60115fa54ad7b9 Kefeng Wang             2022-01-14  3832  	if (!(vm_flags & VM_DEFER_KMEMLEAK))
94f4a1618b4c2b Catalin Marinas         2017-07-06  3833  		kmemleak_vmalloc(area, size, gfp_mask);
89219d37a2377c Catalin Marinas         2009-06-11  3834  
19f1c3acf8f443 Andrey Konovalov        2022-03-24  3835  	return area->addr;
de7d2b567d040e Joe Perches             2011-10-31  3836  
de7d2b567d040e Joe Perches             2011-10-31  3837  fail:
121e6f3258fe39 Nicholas Piggin         2021-04-29  3838  	if (shift > PAGE_SHIFT) {
121e6f3258fe39 Nicholas Piggin         2021-04-29  3839  		shift = PAGE_SHIFT;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3840  		align = real_align;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3841  		size = real_size;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3842  		goto again;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3843  	}
121e6f3258fe39 Nicholas Piggin         2021-04-29  3844  
de7d2b567d040e Joe Perches             2011-10-31  3845  	return NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3846  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  3847  
d0a21265dfb5fa David Rientjes          2011-01-13  3848  /**
9aa556ae32f93a Kent Overstreet         2024-03-21  3849   * __vmalloc_node_noprof - allocate virtually contiguous memory
d0a21265dfb5fa David Rientjes          2011-01-13  3850   * @size:	    allocation size
d0a21265dfb5fa David Rientjes          2011-01-13  3851   * @align:	    desired alignment
d0a21265dfb5fa David Rientjes          2011-01-13  3852   * @gfp_mask:	    flags for the page level allocator
00ef2d2f84babb David Rientjes          2013-02-22  3853   * @node:	    node to use for allocation or NUMA_NO_NODE
d0a21265dfb5fa David Rientjes          2011-01-13  3854   * @caller:	    caller's return address
d0a21265dfb5fa David Rientjes          2011-01-13  3855   *
f38fcb9c1c5e9d Christoph Hellwig       2020-06-01  3856   * Allocate enough pages to cover @size from the page level allocator with
f38fcb9c1c5e9d Christoph Hellwig       2020-06-01  3857   * @gfp_mask flags.  Map them into contiguous kernel virtual space.
a7c3e901a46ff5 Michal Hocko            2017-05-08  3858   *
dcda9b04713c3f Michal Hocko            2017-07-12  3859   * Reclaim modifiers in @gfp_mask - __GFP_NORETRY, __GFP_RETRY_MAYFAIL
a7c3e901a46ff5 Michal Hocko            2017-05-08  3860   * and __GFP_NOFAIL are not supported
a7c3e901a46ff5 Michal Hocko            2017-05-08  3861   *
a7c3e901a46ff5 Michal Hocko            2017-05-08  3862   * Any use of gfp flags outside of GFP_KERNEL should be consulted
a7c3e901a46ff5 Michal Hocko            2017-05-08  3863   * with mm people.
a862f68a8b3600 Mike Rapoport           2019-03-05  3864   *
a862f68a8b3600 Mike Rapoport           2019-03-05  3865   * Return: pointer to the allocated memory or %NULL on error
d0a21265dfb5fa David Rientjes          2011-01-13  3866   */
9aa556ae32f93a Kent Overstreet         2024-03-21  3867  void *__vmalloc_node_noprof(unsigned long size, unsigned long align,
f38fcb9c1c5e9d Christoph Hellwig       2020-06-01  3868  			    gfp_t gfp_mask, int node, const void *caller)
d0a21265dfb5fa David Rientjes          2011-01-13 @3869  {
9aa556ae32f93a Kent Overstreet         2024-03-21  3870  	return __vmalloc_node_range_noprof(size, align, VMALLOC_START, VMALLOC_END,
f38fcb9c1c5e9d Christoph Hellwig       2020-06-01  3871  				gfp_mask, PAGE_KERNEL, 0, node, caller);
d0a21265dfb5fa David Rientjes          2011-01-13  3872  }
c3f896dcf1e479 Christoph Hellwig       2020-06-01  3873  /*
c3f896dcf1e479 Christoph Hellwig       2020-06-01  3874   * This is only for performance analysis of vmalloc and stress purpose.
c3f896dcf1e479 Christoph Hellwig       2020-06-01  3875   * It is required by vmalloc test module, therefore do not use it other
c3f896dcf1e479 Christoph Hellwig       2020-06-01  3876   * than that.
c3f896dcf1e479 Christoph Hellwig       2020-06-01  3877   */
c3f896dcf1e479 Christoph Hellwig       2020-06-01  3878  #ifdef CONFIG_TEST_VMALLOC_MODULE
9aa556ae32f93a Kent Overstreet         2024-03-21  3879  EXPORT_SYMBOL_GPL(__vmalloc_node_noprof);
c3f896dcf1e479 Christoph Hellwig       2020-06-01  3880  #endif
d0a21265dfb5fa David Rientjes          2011-01-13  3881  

:::::: The code at line 3724 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
