Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D16738BDA9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 20:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768942798; cv=none; b=p+jjy0mlP+t48gGO766p7zkRcNX7aEALG3xJeKcT+vUCxhkokeo12hQDcTdQ3n1c+I7JynuPKJsnPoGhuoIr8hVY9/OIBBrxU5n0w8zMAEeUSBIA425PLjtwWV9s8Ih33xDAiIWRL5o7NOX4IvG1v/dbaIkQIWxY96JSGKG4Pzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768942798; c=relaxed/simple;
	bh=jNCyAX6cfBXVdeTHVx19aKTD0xqKyCL8Y0erw3bjd+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0rnOh+BDtTKO5abwNeQUn7OiywO/hpU38Y0Qzr1QgVv8yunCWHAn/944nF8TjO/DsGwhIHT5aeLKOJ27qj7BPrF4AU4RTIRviaLSi8J1dkH0B0ye4MVVGYQyJCaHzatjo3RRqTVpoe8KTfrjBHfislh3nnEqc1XlVhUNGN1vCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U05xofnf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U05xofnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768942796; x=1800478796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jNCyAX6cfBXVdeTHVx19aKTD0xqKyCL8Y0erw3bjd+Q=;
  b=U05xofnfz4DNWd6qV12cF41BLwGsc4t/dnzpvJ+b4e6VQtD2nIHXKRcp
   pg5hu8VXwkXj7dTmvyqzGRHKV02UmVQrusrl7pS8vmFnAnDg9sgZ7SyxB
   gZQ6vET+EZ9hIZ27Og53+26i4eJOrrhV2SmVjoPVo6hzAftqKLOq3nl+n
   fpy+ZIEnEk787j9S17P0KDor5d4POtwq/bZJQ72gE4GUXlfhNwuSSKQYo
   S0eZLysd9oDsJI5fzqurw+hK/aCnZEpNm48A0XNNvMt2svyv9jnis2eO6
   DU5+sP9yBcJcRqX//NWG32W0vIomgHWyPIcKWta5ks1SNCPaQfIqri5/v
   A==;
X-CSE-ConnectionGUID: ffcCZYEXSI6HvResxYRoEA==
X-CSE-MsgGUID: A1X48u+bTNqRyqpqBWVmKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70068866"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70068866"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 12:59:56 -0800
X-CSE-ConnectionGUID: pM5A9BmlTVidxfP4vilX1Q==
X-CSE-MsgGUID: 9P3HCU9NRKOfxZgpMA9SbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206277061"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jan 2026 12:59:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viIpK-00000000PWT-2u3F;
	Tue, 20 Jan 2026 20:59:50 +0000
Date: Wed, 21 Jan 2026 04:59:24 +0800
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
Message-ID: <202601210419.6HhGDdqP-lkp@intel.com>
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
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260121/202601210419.6HhGDdqP-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210419.6HhGDdqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210419.6HhGDdqP-lkp@intel.com/

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
   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from mm/memremap.c:3:
>> arch/mips/include/asm/page.h:137:25: warning: excess elements in struct initializer
     137 | #define __pgprot(x)     ((pgprot_t) { (x) } )
         |                         ^
   arch/mips/include/asm/pgtable.h:30:25: note: in expansion of macro '__pgprot'
      30 | #define PAGE_KERNEL     __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
         |                         ^~~~~~~~
   mm/memremap.c:271:27: note: in expansion of macro 'PAGE_KERNEL'
     271 |                 .pgprot = PAGE_KERNEL,
         |                           ^~~~~~~~~~~
   arch/mips/include/asm/page.h:137:25: note: (near initialization for 'params')
     137 | #define __pgprot(x)     ((pgprot_t) { (x) } )
         |                         ^
   arch/mips/include/asm/pgtable.h:30:25: note: in expansion of macro '__pgprot'
      30 | #define PAGE_KERNEL     __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
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
   Selected by [y]:
   - DRM_XE_GPUSVM [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=y] && !UML


vim +137 arch/mips/include/asm/page.h

c6e8b587718c486 include/asm-mips/page.h      Ralf Baechle   2005-02-10  131  
c6e8b587718c486 include/asm-mips/page.h      Ralf Baechle   2005-02-10  132  /*
c6e8b587718c486 include/asm-mips/page.h      Ralf Baechle   2005-02-10  133   * Manipulate page protection bits
c6e8b587718c486 include/asm-mips/page.h      Ralf Baechle   2005-02-10  134   */
c6e8b587718c486 include/asm-mips/page.h      Ralf Baechle   2005-02-10  135  typedef struct { unsigned long pgprot; } pgprot_t;
c6e8b587718c486 include/asm-mips/page.h      Ralf Baechle   2005-02-10  136  #define pgprot_val(x)	((x).pgprot)
^1da177e4c3f415 include/asm-mips/page.h      Linus Torvalds 2005-04-16 @137  #define __pgprot(x)	((pgprot_t) { (x) } )
b3a428b4b18d495 arch/mips/include/asm/page.h Hassan Naveed  2018-10-29  138  #define pte_pgprot(x)	__pgprot(pte_val(x) & ~_PFN_MASK)
^1da177e4c3f415 include/asm-mips/page.h      Linus Torvalds 2005-04-16  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
