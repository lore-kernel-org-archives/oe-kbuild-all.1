Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16212E4A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 22:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725922605; cv=none; b=fZLMGZOTJhR9xLXi9zcA251PQttQDMmWx1jV0Ah+sZ1sTYTTeV4Njx+UFXcgogPOhRo3Si0wwkB22EEasmkKRzMg8sI4piOwGTtT6n/NHqYb81/NxtCvsZWI+Xq7zePUI9RgcTJOm0vh1abOr4U9YNQ0sFAIaOJ3POLXa7JTZRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725922605; c=relaxed/simple;
	bh=2D2T+HCkW2kyp0jMFoLAdAXUUoGkb5rWY2RI3fzg77U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEcvzcIpxh1jggpxiiSZxupUgA8YU7io69OUQ1A/QUZaYKc9mB9TgPuBNdy06c7FGyAC6+VtiiTbLCl5AHQj9C6eMD9QoGG01XDdkGyS7/2tOJl2E2k/d3kin3CM/4gE5ykYmFi9152Mhn9g46s/OcaAKvpM3lOU3j5knhuz1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Heg2lxBe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Heg2lxBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725922603; x=1757458603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2D2T+HCkW2kyp0jMFoLAdAXUUoGkb5rWY2RI3fzg77U=;
  b=Heg2lxBeedb3V0XbJDt28LEoawsUp3C9ULIamfUf2PsYmsdevvHjfn03
   TAweSpplgeFe/X1nDMUcHhm9G/VkfDzGmYSMkAPeDIL0QWzZ/cwdtjCzK
   GHskD1n59pqM0zv0OEG3aDImIYu8OI+zRoX2Pr1/qwpiV+jH0kT+UCCO0
   NhP6AbxXp1vvc9OlMo3bMzttnbZmwiRlqRyL2hPvo4eY7yloTF4cieb7P
   tP9MiWrhssBMRiZg8SYdoftUQeSICzTrOeA311XfWhikAmO+mC4bSinVZ
   UP4OfFIhJuqk3E4zPsygAkcKGJ8ZAV3666VRMVe7lNNcSiqTdCvy7nTNA
   A==;
X-CSE-ConnectionGUID: 445k8fCtSe+L/R6DDaZdQg==
X-CSE-MsgGUID: CkcpxP7zR5SSDIB2i1rhiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24145052"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24145052"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 15:56:42 -0700
X-CSE-ConnectionGUID: 2XYmZDRASgKKWam5oAY0JA==
X-CSE-MsgGUID: oLsP14tvSbeD5MyAAIMMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67077145"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2024 15:56:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snnJH-000FJc-0Z;
	Mon, 09 Sep 2024 22:56:39 +0000
Date: Tue, 10 Sep 2024 06:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 190/258]
 kernel/dma/direct.c:147:20: warning: shift count >= width of type
Message-ID: <202409100649.44JPTmEG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: a2a5fdffbb42082064006597ddabecccdb746d39 [190/258] vmalloc: is_vmalloc_addr_inlined()
config: i386-randconfig-053-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100649.44JPTmEG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100649.44JPTmEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100649.44JPTmEG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/dma/direct.c:7:
   In file included from include/linux/memblock.h:12:
   include/linux/mm.h:1200:17: error: use of undeclared identifier 'VMALLOC_START'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/slab.h:408:2: note: 'KMALLOC_DMA' declared here
     408 |         KMALLOC_DMA = KMALLOC_NORMAL,
         |         ^
   In file included from kernel/dma/direct.c:7:
   In file included from include/linux/memblock.h:12:
   include/linux/mm.h:1200:41: error: use of undeclared identifier 'VMALLOC_END'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
         |                                                KMALLOC_DMA
   include/linux/slab.h:408:2: note: 'KMALLOC_DMA' declared here
     408 |         KMALLOC_DMA = KMALLOC_NORMAL,
         |         ^
>> kernel/dma/direct.c:147:20: warning: shift count >= width of type [-Wshift-count-overflow]
     146 |                 if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     147 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                     ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
     148 |                     !(gfp & (GFP_DMA32 | GFP_DMA))) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> kernel/dma/direct.c:147:20: warning: shift count >= width of type [-Wshift-count-overflow]
     146 |                 if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     147 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                     ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
     148 |                     !(gfp & (GFP_DMA32 | GFP_DMA))) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
>> kernel/dma/direct.c:147:20: warning: shift count >= width of type [-Wshift-count-overflow]
     146 |                 if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     147 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                     ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
     148 |                     !(gfp & (GFP_DMA32 | GFP_DMA))) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   3 warnings and 2 errors generated.


vim +147 kernel/dma/direct.c

aea7e2a86a94b2 kernel/dma/direct.c Christoph Hellwig      2021-10-21  117  
26749b3201ab05 kernel/dma/direct.c Christoph Hellwig      2020-06-15  118  static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
92826e967535db kernel/dma/direct.c Christoph Hellwig      2022-04-23  119  		gfp_t gfp, bool allow_highmem)
a8463d4b0e47d1 lib/dma-noop.c      Christian Borntraeger  2016-02-02  120  {
90ae409f9eb3bc kernel/dma/direct.c Christoph Hellwig      2019-08-20  121  	int node = dev_to_node(dev);
080321d3b3139b lib/dma-direct.c    Christoph Hellwig      2017-12-22  122  	struct page *page = NULL;
a7ba70f1787f97 kernel/dma/direct.c Nicolas Saenz Julienne 2019-11-21  123  	u64 phys_limit;
a8463d4b0e47d1 lib/dma-noop.c      Christian Borntraeger  2016-02-02  124  
633d5fce78a61e kernel/dma/direct.c David Rientjes         2020-06-11  125  	WARN_ON_ONCE(!PAGE_ALIGNED(size));
633d5fce78a61e kernel/dma/direct.c David Rientjes         2020-06-11  126  
aea7e2a86a94b2 kernel/dma/direct.c Christoph Hellwig      2021-10-21  127  	if (is_swiotlb_for_alloc(dev))
aea7e2a86a94b2 kernel/dma/direct.c Christoph Hellwig      2021-10-21  128  		return dma_direct_alloc_swiotlb(dev, size);
aea7e2a86a94b2 kernel/dma/direct.c Christoph Hellwig      2021-10-21  129  
25a4ce564921db kernel/dma/direct.c Petr Tesarik           2023-02-20  130  	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
633d5fce78a61e kernel/dma/direct.c David Rientjes         2020-06-11  131  	page = dma_alloc_contiguous(dev, size, gfp);
92826e967535db kernel/dma/direct.c Christoph Hellwig      2022-04-23  132  	if (page) {
92826e967535db kernel/dma/direct.c Christoph Hellwig      2022-04-23  133  		if (!dma_coherent_ok(dev, page_to_phys(page), size) ||
92826e967535db kernel/dma/direct.c Christoph Hellwig      2022-04-23  134  		    (!allow_highmem && PageHighMem(page))) {
633d5fce78a61e kernel/dma/direct.c David Rientjes         2020-06-11  135  			dma_free_contiguous(dev, page, size);
90ae409f9eb3bc kernel/dma/direct.c Christoph Hellwig      2019-08-20  136  			page = NULL;
90ae409f9eb3bc kernel/dma/direct.c Christoph Hellwig      2019-08-20  137  		}
92826e967535db kernel/dma/direct.c Christoph Hellwig      2022-04-23  138  	}
95f183916d4b0b lib/dma-direct.c    Christoph Hellwig      2018-01-09  139  again:
90ae409f9eb3bc kernel/dma/direct.c Christoph Hellwig      2019-08-20  140  	if (!page)
633d5fce78a61e kernel/dma/direct.c David Rientjes         2020-06-11  141  		page = alloc_pages_node(node, gfp, get_order(size));
95f183916d4b0b lib/dma-direct.c    Christoph Hellwig      2018-01-09  142  	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
b1d2dc009dece4 kernel/dma/direct.c Nicolin Chen           2019-05-23  143  		dma_free_contiguous(dev, page, size);
95f183916d4b0b lib/dma-direct.c    Christoph Hellwig      2018-01-09  144  		page = NULL;
95f183916d4b0b lib/dma-direct.c    Christoph Hellwig      2018-01-09  145  
de7eab301de788 lib/dma-direct.c    Takashi Iwai           2018-04-16  146  		if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
a7ba70f1787f97 kernel/dma/direct.c Nicolas Saenz Julienne 2019-11-21 @147  		    phys_limit < DMA_BIT_MASK(64) &&
de7eab301de788 lib/dma-direct.c    Takashi Iwai           2018-04-16  148  		    !(gfp & (GFP_DMA32 | GFP_DMA))) {
de7eab301de788 lib/dma-direct.c    Takashi Iwai           2018-04-16  149  			gfp |= GFP_DMA32;
de7eab301de788 lib/dma-direct.c    Takashi Iwai           2018-04-16  150  			goto again;
de7eab301de788 lib/dma-direct.c    Takashi Iwai           2018-04-16  151  		}
de7eab301de788 lib/dma-direct.c    Takashi Iwai           2018-04-16  152  
fbce251baa6e35 kernel/dma/direct.c Christoph Hellwig      2019-02-13  153  		if (IS_ENABLED(CONFIG_ZONE_DMA) && !(gfp & GFP_DMA)) {
95f183916d4b0b lib/dma-direct.c    Christoph Hellwig      2018-01-09  154  			gfp = (gfp & ~GFP_DMA32) | GFP_DMA;
95f183916d4b0b lib/dma-direct.c    Christoph Hellwig      2018-01-09  155  			goto again;
95f183916d4b0b lib/dma-direct.c    Christoph Hellwig      2018-01-09  156  		}
95f183916d4b0b lib/dma-direct.c    Christoph Hellwig      2018-01-09  157  	}
95f183916d4b0b lib/dma-direct.c    Christoph Hellwig      2018-01-09  158  
b18814e767a445 kernel/dma/direct.c Christoph Hellwig      2018-11-04  159  	return page;
b18814e767a445 kernel/dma/direct.c Christoph Hellwig      2018-11-04  160  }
b18814e767a445 kernel/dma/direct.c Christoph Hellwig      2018-11-04  161  

:::::: The code at line 147 was first introduced by commit
:::::: a7ba70f1787f977f970cd116076c6fce4b9e01cc dma-mapping: treat dev->bus_dma_mask as a DMA limit

:::::: TO: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
