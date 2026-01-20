Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAD63A89BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 20:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768940156; cv=none; b=WE6FGjnK7GbHCuGf0NmwboS4ezLQ9sxgwLCSNgLXaaMo5J65I6t5EE1732Ua7TDU6GV1wZu+9FWiLlJUk0KM+pmj9NwlNCh8kvau9J3ZtH5HxdvvDswsZlvM+yo2xap2NvgD0glvo/VILeupzmLXRFfGAQSCa1F8LOVJyrKVp2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768940156; c=relaxed/simple;
	bh=9pzMT6jbbzlrQkZZFBbdtZpdRNHulRfsXZEpZgdNsOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnt7QNGGL6Di23+MlX0fnzzXQp5EshRYwilvFliGcoJgjFEYgBIxUCD4lk3fdXdT+SrusJsxt424Z0zFuinMSu76Nkma35+BuAlgxSmIejxV83dADhidfv+PI72+Pw3rmJkdBcZ3R9QnG36OW1bXrZMfbel4I79+paQKmlwga4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vq9Xo5nM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vq9Xo5nM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768940154; x=1800476154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9pzMT6jbbzlrQkZZFBbdtZpdRNHulRfsXZEpZgdNsOE=;
  b=Vq9Xo5nMNtmPjUP+zaV5BuyvRvKzd1Cp+OY1hCX77YRsdxvLx4aQOF7G
   p53GNJox2t4XUg9q08VfuOESAfbpJ1uZYohIcGbrSPchUie1/iY/9raJs
   6UYKDyTc0WK/EUGFYgh9yK2djPaOe3/oBspiF1z+DUxE1G+JXGRUG+7La
   qpQsCoxopO1aGDBeq5dEC8uKWD49cxMNmHjC8pBQsr/Xkpc0wH0JuJGEF
   cnVTCgfXflUImTpPh5t0LbgoCWwCLjylhhm6aU00Kq3eoVWYok9tH6xI8
   QPzVHPR82drW7+fX7LorjB9WdGGck2fJ3zMsGL5mC7/6IHqxV1UwUu3n+
   w==;
X-CSE-ConnectionGUID: zxN5wq7kQia/O47mGqU4zw==
X-CSE-MsgGUID: tn0n7vsCQRCb1P3R+Vwk7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70214567"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70214567"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 12:15:51 -0800
X-CSE-ConnectionGUID: /eEKhQN/Q++PsmO/0jxvHg==
X-CSE-MsgGUID: mFAHX4VQQVyUM49TLz8TSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205464812"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jan 2026 12:15:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viI8h-00000000PU5-14QK;
	Tue, 20 Jan 2026 20:15:47 +0000
Date: Wed, 21 Jan 2026 04:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/xe: Select CONFIG_DEVICE_PRIVATE when
 DRM_XE_GPUSVM is selected
Message-ID: <202601210441.tOGeZQTP-lkp@intel.com>
References: <20260120143459.9485-3-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120143459.9485-3-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm/drm-next drm-i915/for-linux-next drm-tip/drm-tip next-20260120]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm-i915/for-linux-next-fixes linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-drm-xe-Fix-xe-userptr-in-the-absence-of-CONFIG_DEVICE_PRIVATE/20260120-223858
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260120143459.9485-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2 2/2] drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210441.tOGeZQTP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210441.tOGeZQTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210441.tOGeZQTP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memremap.c: In function 'memremap_compat_align':
   mm/memremap.c:36:16: error: 'SUBSECTION_SIZE' undeclared (first use in this function); did you mean 'SECTOR_SIZE'?
      36 |         return SUBSECTION_SIZE;
         |                ^~~~~~~~~~~~~~~
         |                SECTOR_SIZE
   mm/memremap.c:36:16: note: each undeclared identifier is reported only once for each function it appears in
   mm/memremap.c: In function 'pageunmap_range':
   mm/memremap.c:96:9: error: implicit declaration of function 'remove_pfn_range_from_zone'; did you mean 'remap_pfn_range_complete'? [-Wimplicit-function-declaration]
      96 |         remove_pfn_range_from_zone(page_zone(first_page), PHYS_PFN(range->start),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         remap_pfn_range_complete
   mm/memremap.c:99:17: error: implicit declaration of function '__remove_pages'; did you mean 'move_pages'? [-Wimplicit-function-declaration]
      99 |                 __remove_pages(PHYS_PFN(range->start),
         |                 ^~~~~~~~~~~~~~
         |                 move_pages
   mm/memremap.c:102:17: error: implicit declaration of function 'arch_remove_memory'; did you mean 'remove_memory'? [-Wimplicit-function-declaration]
     102 |                 arch_remove_memory(range->start, range_len(range),
         |                 ^~~~~~~~~~~~~~~~~~
         |                 remove_memory
   mm/memremap.c: At top level:
   mm/memremap.c:144:60: warning: 'struct mhp_params' declared inside parameter list will not be visible outside of this definition or declaration
     144 | static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
         |                                                            ^~~~~~~~~~
   mm/memremap.c: In function 'pagemap_range':
   mm/memremap.c:189:37: error: invalid use of undefined type 'struct mhp_params'
     189 |                              &params->pgprot);
         |                                     ^~
   mm/memremap.c:193:14: error: implicit declaration of function 'mhp_range_allowed' [-Wimplicit-function-declaration]
     193 |         if (!mhp_range_allowed(range->start, range_len(range), !is_private)) {
         |              ^~~~~~~~~~~~~~~~~
   mm/memremap.c:212:25: error: implicit declaration of function 'add_pages'; did you mean 'dir_pages'? [-Wimplicit-function-declaration]
     212 |                 error = add_pages(nid, PHYS_PFN(range->start),
         |                         ^~~~~~~~~
         |                         dir_pages
   mm/memremap.c:221:25: error: implicit declaration of function 'arch_add_memory' [-Wimplicit-function-declaration]
     221 |                 error = arch_add_memory(nid, range->start, range_len(range),
         |                         ^~~~~~~~~~~~~~~
   mm/memremap.c:229:17: error: implicit declaration of function 'move_pfn_range_to_zone' [-Wimplicit-function-declaration]
     229 |                 move_pfn_range_to_zone(zone, PHYS_PFN(range->start),
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   mm/memremap.c:230:67: error: invalid use of undefined type 'struct mhp_params'
     230 |                                 PHYS_PFN(range_len(range)), params->altmap,
         |                                                                   ^~
   mm/memremap.c: In function 'memremap_pages':
   mm/memremap.c:268:16: error: variable 'params' has initializer but incomplete type
     268 |         struct mhp_params params = {
         |                ^~~~~~~~~~
   mm/memremap.c:269:18: error: 'struct mhp_params' has no member named 'altmap'
     269 |                 .altmap = pgmap_altmap(pgmap),
         |                  ^~~~~~
   mm/memremap.c:269:27: warning: excess elements in struct initializer
     269 |                 .altmap = pgmap_altmap(pgmap),
         |                           ^~~~~~~~~~~~
   mm/memremap.c:269:27: note: (near initialization for 'params')
   mm/memremap.c:270:18: error: 'struct mhp_params' has no member named 'pgmap'
     270 |                 .pgmap = pgmap,
         |                  ^~~~~
   mm/memremap.c:270:26: warning: excess elements in struct initializer
     270 |                 .pgmap = pgmap,
         |                          ^~~~~
   mm/memremap.c:270:26: note: (near initialization for 'params')
   mm/memremap.c:271:18: error: 'struct mhp_params' has no member named 'pgprot'
     271 |                 .pgprot = PAGE_KERNEL,
         |                  ^~~~~~
   In file included from arch/csky/include/asm/thread_info.h:9,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from mm/memremap.c:3:
>> arch/csky/include/asm/page.h:62:25: warning: excess elements in struct initializer
      62 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                         ^
   arch/csky/include/asm/pgtable.h:62:25: note: in expansion of macro '__pgprot'
      62 | #define PAGE_KERNEL     __pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_VALID | \
         |                         ^~~~~~~~
   mm/memremap.c:271:27: note: in expansion of macro 'PAGE_KERNEL'
     271 |                 .pgprot = PAGE_KERNEL,
         |                           ^~~~~~~~~~~
   arch/csky/include/asm/page.h:62:25: note: (near initialization for 'params')
      62 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                         ^
   arch/csky/include/asm/pgtable.h:62:25: note: in expansion of macro '__pgprot'
      62 | #define PAGE_KERNEL     __pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_VALID | \
         |                         ^~~~~~~~
   mm/memremap.c:271:27: note: in expansion of macro 'PAGE_KERNEL'
     271 |                 .pgprot = PAGE_KERNEL,
         |                           ^~~~~~~~~~~
   mm/memremap.c:268:27: error: storage size of 'params' isn't known
     268 |         struct mhp_params params = {
         |                           ^~~~~~
   mm/memremap.c:268:27: warning: unused variable 'params' [-Wunused-variable]

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ZONE_DEVICE
   Depends on [n]: MEMORY_HOTPLUG [=n] && MEMORY_HOTREMOVE [=n] && SPARSEMEM_VMEMMAP [=n]
   Selected by [m]:
   - DRM_XE_GPUSVM [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && !UML


vim +62 arch/csky/include/asm/page.h

013de2d6671d89 Guo Ren 2018-09-05  59  
013de2d6671d89 Guo Ren 2018-09-05  60  #define __pte(x)	((pte_t) { (x) })
013de2d6671d89 Guo Ren 2018-09-05  61  #define __pgd(x)	((pgd_t) { (x) })
013de2d6671d89 Guo Ren 2018-09-05 @62  #define __pgprot(x)	((pgprot_t) { (x) })
013de2d6671d89 Guo Ren 2018-09-05  63  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
