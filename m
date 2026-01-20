Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B92E40F8DD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 23:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768951086; cv=none; b=ElsNNtQtFXH8sjLP3I9DzqLTyfYRM2S6FYtDW9ZFG5R/MKdLbP80KQ3GtHhVxY2ByD5jONcC3STcnTLp3C/9C9r2uOpJNbpX/ry2j+A2J/s8+EeYc5Qpg0JgHMCE2BPi4Xs3HMd8xMzrlU3nZ1gVi/lp7lDliFiIZcS3gPaOPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768951086; c=relaxed/simple;
	bh=jBYpgES2hFwb12RcJ80rWhuG3xT52zVyPrUU1RQcbB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKCdCs1i3CskTVIdVyNA1SIW2FlzlLRmDxPcB9mO06bPp0IFaP/XcYvyF7YZ3UBhqRCTFMX2BTARipvsX/b8dSnCLgN/O/Y4tQxKIQP0hoaAmSfeSIbbkMaGv2+JTlnDmTvbY8g8LhVT+9jHZ0f96qLtzjggbEF0tZyuK7NEmmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLPlWT2c; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLPlWT2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768951085; x=1800487085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jBYpgES2hFwb12RcJ80rWhuG3xT52zVyPrUU1RQcbB4=;
  b=ZLPlWT2cRUWtq5Wo/p/0HcTwqJoVC+2QJj8cZH4AkULIdCY1kBjcl8Mv
   co9rYSABmCoPgxGvtf3o4sAPfBkOhf+MSh7iblqp0ETQG9fESBu7OqXYu
   ZHJwDUW/vLewnW1oZuKPHtRkQLwotbTvA5yPHoeZGI7ldMSPE6ITavHsu
   0O5uKeo/Q8KQUQNO6SssA4PsCaVLz7cnfEqB/UYx/GsTpwoMwO+/4JsXD
   rv1USKa2QvLFoxCpTNTmj9oSeJdfYDxV28hTxMi1cOdYs1ks4XhrZg7Ea
   /abrawdL6xC+CpoWJIPhJoJCP7izVWG49EvBXoVkmf4k2JcQ+K1daPzqy
   A==;
X-CSE-ConnectionGUID: XPf2yvEJQx63qSN8UjVy4A==
X-CSE-MsgGUID: /R6m0qiGQPOLQ2ZbFtlgfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70146113"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70146113"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:18:04 -0800
X-CSE-ConnectionGUID: g5Yp8pHhTJahC2noAXV4pg==
X-CSE-MsgGUID: fFmOu8EhSNq73/F6vNwaWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="236926539"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 15:18:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viKz1-00000000PfJ-1Lkk;
	Tue, 20 Jan 2026 23:17:59 +0000
Date: Wed, 21 Jan 2026 07:16:59 +0800
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
Message-ID: <202601210629.wmt9lHUu-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-i915/for-linux-next drm-tip/drm-tip next-20260120]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm-i915/for-linux-next-fixes linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-drm-xe-Fix-xe-userptr-in-the-absence-of-CONFIG_DEVICE_PRIVATE/20260120-223858
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260120143459.9485-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2 2/2] drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210629.wmt9lHUu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210629.wmt9lHUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210629.wmt9lHUu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/dax.c: In function 'copy_cow_page_dax':
>> fs/dax.c:1018:9: error: implicit declaration of function 'copy_user_page'; did you mean 'copy_to_user_page'? [-Wimplicit-function-declaration]
    1018 |         copy_user_page(vto, kaddr, vmf->address, vmf->cow_page);
         |         ^~~~~~~~~~~~~~
         |         copy_to_user_page
--
   mm/memremap.c: In function 'memremap_compat_align':
>> mm/memremap.c:36:16: error: 'SUBSECTION_SIZE' undeclared (first use in this function); did you mean 'SECTOR_SIZE'?
      36 |         return SUBSECTION_SIZE;
         |                ^~~~~~~~~~~~~~~
         |                SECTOR_SIZE
   mm/memremap.c:36:16: note: each undeclared identifier is reported only once for each function it appears in
   mm/memremap.c: In function 'pageunmap_range':
>> mm/memremap.c:96:9: error: implicit declaration of function 'remove_pfn_range_from_zone'; did you mean 'remap_pfn_range_complete'? [-Wimplicit-function-declaration]
      96 |         remove_pfn_range_from_zone(page_zone(first_page), PHYS_PFN(range->start),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         remap_pfn_range_complete
>> mm/memremap.c:99:17: error: implicit declaration of function '__remove_pages'; did you mean 'move_pages'? [-Wimplicit-function-declaration]
      99 |                 __remove_pages(PHYS_PFN(range->start),
         |                 ^~~~~~~~~~~~~~
         |                 move_pages
>> mm/memremap.c:102:17: error: implicit declaration of function 'arch_remove_memory'; did you mean 'remove_memory'? [-Wimplicit-function-declaration]
     102 |                 arch_remove_memory(range->start, range_len(range),
         |                 ^~~~~~~~~~~~~~~~~~
         |                 remove_memory
   mm/memremap.c: At top level:
>> mm/memremap.c:144:60: warning: 'struct mhp_params' declared inside parameter list will not be visible outside of this definition or declaration
     144 | static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
         |                                                            ^~~~~~~~~~
   mm/memremap.c: In function 'pagemap_range':
>> mm/memremap.c:189:37: error: invalid use of undefined type 'struct mhp_params'
     189 |                              &params->pgprot);
         |                                     ^~
>> mm/memremap.c:193:14: error: implicit declaration of function 'mhp_range_allowed' [-Wimplicit-function-declaration]
     193 |         if (!mhp_range_allowed(range->start, range_len(range), !is_private)) {
         |              ^~~~~~~~~~~~~~~~~
>> mm/memremap.c:212:25: error: implicit declaration of function 'add_pages'; did you mean 'dir_pages'? [-Wimplicit-function-declaration]
     212 |                 error = add_pages(nid, PHYS_PFN(range->start),
         |                         ^~~~~~~~~
         |                         dir_pages
>> mm/memremap.c:221:25: error: implicit declaration of function 'arch_add_memory' [-Wimplicit-function-declaration]
     221 |                 error = arch_add_memory(nid, range->start, range_len(range),
         |                         ^~~~~~~~~~~~~~~
>> mm/memremap.c:229:17: error: implicit declaration of function 'move_pfn_range_to_zone' [-Wimplicit-function-declaration]
     229 |                 move_pfn_range_to_zone(zone, PHYS_PFN(range->start),
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   mm/memremap.c:230:67: error: invalid use of undefined type 'struct mhp_params'
     230 |                                 PHYS_PFN(range_len(range)), params->altmap,
         |                                                                   ^~
   mm/memremap.c: In function 'memremap_pages':
>> mm/memremap.c:268:16: error: variable 'params' has initializer but incomplete type
     268 |         struct mhp_params params = {
         |                ^~~~~~~~~~
>> mm/memremap.c:269:18: error: 'struct mhp_params' has no member named 'altmap'
     269 |                 .altmap = pgmap_altmap(pgmap),
         |                  ^~~~~~
>> mm/memremap.c:269:27: warning: excess elements in struct initializer
     269 |                 .altmap = pgmap_altmap(pgmap),
         |                           ^~~~~~~~~~~~
   mm/memremap.c:269:27: note: (near initialization for 'params')
>> mm/memremap.c:270:18: error: 'struct mhp_params' has no member named 'pgmap'
     270 |                 .pgmap = pgmap,
         |                  ^~~~~
   mm/memremap.c:270:26: warning: excess elements in struct initializer
     270 |                 .pgmap = pgmap,
         |                          ^~~~~
   mm/memremap.c:270:26: note: (near initialization for 'params')
>> mm/memremap.c:271:18: error: 'struct mhp_params' has no member named 'pgprot'
     271 |                 .pgprot = PAGE_KERNEL,
         |                  ^~~~~~
   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from mm/memremap.c:3:
>> arch/parisc/include/asm/page.h:54:25: warning: excess elements in struct initializer
      54 | #define __pgprot(x)     ((pgprot_t) { (x) } )
         |                         ^
   arch/parisc/include/asm/pgtable.h:241:25: note: in expansion of macro '__pgprot'
     241 | #define PAGE_KERNEL     __pgprot(_PAGE_KERNEL)
         |                         ^~~~~~~~
   mm/memremap.c:271:27: note: in expansion of macro 'PAGE_KERNEL'
     271 |                 .pgprot = PAGE_KERNEL,
         |                           ^~~~~~~~~~~
   arch/parisc/include/asm/page.h:54:25: note: (near initialization for 'params')
      54 | #define __pgprot(x)     ((pgprot_t) { (x) } )
         |                         ^
   arch/parisc/include/asm/pgtable.h:241:25: note: in expansion of macro '__pgprot'
     241 | #define PAGE_KERNEL     __pgprot(_PAGE_KERNEL)
         |                         ^~~~~~~~
   mm/memremap.c:271:27: note: in expansion of macro 'PAGE_KERNEL'
     271 |                 .pgprot = PAGE_KERNEL,
         |                           ^~~~~~~~~~~
>> mm/memremap.c:268:27: error: storage size of 'params' isn't known
     268 |         struct mhp_params params = {
         |                           ^~~~~~
>> mm/memremap.c:268:27: warning: unused variable 'params' [-Wunused-variable]

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ZONE_DEVICE
   Depends on [n]: MEMORY_HOTPLUG [=n] && MEMORY_HOTREMOVE [=n] && SPARSEMEM_VMEMMAP [=n]
   Selected by [m]:
   - DRM_XE_GPUSVM [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && !UML


vim +1018 fs/dax.c

429f8de70d9872 Christoph Hellwig 2021-11-29  1002  
429f8de70d9872 Christoph Hellwig 2021-11-29  1003  static int copy_cow_page_dax(struct vm_fault *vmf, const struct iomap_iter *iter)
429f8de70d9872 Christoph Hellwig 2021-11-29  1004  {
60696eb26a37ab Christoph Hellwig 2021-11-29  1005  	pgoff_t pgoff = dax_iomap_pgoff(&iter->iomap, iter->pos);
cccbce67158290 Dan Williams      2017-01-27  1006  	void *vto, *kaddr;
cccbce67158290 Dan Williams      2017-01-27  1007  	long rc;
cccbce67158290 Dan Williams      2017-01-27  1008  	int id;
cccbce67158290 Dan Williams      2017-01-27  1009  
cccbce67158290 Dan Williams      2017-01-27  1010  	id = dax_read_lock();
e511c4a3d2a1f6 Jane Chu          2022-05-13  1011  	rc = dax_direct_access(iter->iomap.dax_dev, pgoff, 1, DAX_ACCESS,
e511c4a3d2a1f6 Jane Chu          2022-05-13  1012  				&kaddr, NULL);
cccbce67158290 Dan Williams      2017-01-27  1013  	if (rc < 0) {
cccbce67158290 Dan Williams      2017-01-27  1014  		dax_read_unlock(id);
cccbce67158290 Dan Williams      2017-01-27  1015  		return rc;
cccbce67158290 Dan Williams      2017-01-27  1016  	}
429f8de70d9872 Christoph Hellwig 2021-11-29  1017  	vto = kmap_atomic(vmf->cow_page);
429f8de70d9872 Christoph Hellwig 2021-11-29 @1018  	copy_user_page(vto, kaddr, vmf->address, vmf->cow_page);
f7ca90b160307d Matthew Wilcox    2015-02-16  1019  	kunmap_atomic(vto);
cccbce67158290 Dan Williams      2017-01-27  1020  	dax_read_unlock(id);
f7ca90b160307d Matthew Wilcox    2015-02-16  1021  	return 0;
f7ca90b160307d Matthew Wilcox    2015-02-16  1022  }
f7ca90b160307d Matthew Wilcox    2015-02-16  1023  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
