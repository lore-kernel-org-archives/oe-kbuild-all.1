Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1B01848
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 04:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyNhvnDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700369206; x=1731905206;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=v+5NR7GUnsfljLkveaTij8o80NQzHy81xLJzTyklRGc=;
  b=eyNhvnDybKJJ8TnjMvDg1gFQRBYOjJlr6fmemgWKs9H+nP7EPWOCIyc7
   KSXlbaqTo/8B7xDr+xd5x0rXf/l/MJQqMbIuap/65AhTsVLKXYIBzSXSU
   w6Ca23GLQ3ociHk5ZLZkMR7DrUNlVStAuOQj27DJJlRDXD4Dk41wbM1kz
   ezXlsRlzpIclaDrYPFeJ3LM41tJMyrpwTyl8bismKODBrIDW3cWN9xkCG
   6xO2gGwE/ZpQeQxOz20JhI78oHBx+DI3U0ymUaT98gP4DOXMEeFPiDPVq
   ifGqP9jeEoOLW0zFHdOMY1eouPi+aDEpbqjcQewxHJX9/5oy+45ZIW0WT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="457972653"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="457972653"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 20:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="836437808"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="836437808"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Nov 2023 20:46:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Zhi-0004eX-19;
	Sun, 19 Nov 2023 04:46:42 +0000
Date: Sun, 19 Nov 2023 12:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/ttm/ttm_bo_util.c:427:28: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202311191230.koBEsMLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f1fa2419c19c81bc386a6b350879ba54a573e1
commit: e3912d09bf8ddd8e274118d4c9cc550d9665115d drm/ttm: Introduce KUnit test
date:   3 months ago
config: nios2-randconfig-r133-20231119 (https://download.01.org/0day-ci/archive/20231119/202311191230.koBEsMLv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191230.koBEsMLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191230.koBEsMLv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/ttm/ttm_bo_util.c:318:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *virtual @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/ttm/ttm_bo_util.c:318:38: sparse:     expected void *virtual
   drivers/gpu/drm/ttm/ttm_bo_util.c:318:38: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/ttm/ttm_bo_util.c:324:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *virtual @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/ttm/ttm_bo_util.c:324:38: sparse:     expected void *virtual
   drivers/gpu/drm/ttm/ttm_bo_util.c:324:38: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/ttm/ttm_bo_util.c:427:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *virtual @@
   drivers/gpu/drm/ttm/ttm_bo_util.c:427:28: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/ttm/ttm_bo_util.c:427:28: sparse:     got void *virtual

vim +427 drivers/gpu/drm/ttm/ttm_bo_util.c

ba4e7d973dd09b Thomas Hellstrom 2009-06-10  413  
a3185f91d0579b Christian König  2022-05-09  414  /**
a3185f91d0579b Christian König  2022-05-09  415   * ttm_bo_kunmap
a3185f91d0579b Christian König  2022-05-09  416   *
a3185f91d0579b Christian König  2022-05-09  417   * @map: Object describing the map to unmap.
a3185f91d0579b Christian König  2022-05-09  418   *
a3185f91d0579b Christian König  2022-05-09  419   * Unmaps a kernel map set up by ttm_bo_kmap.
a3185f91d0579b Christian König  2022-05-09  420   */
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  421  void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  422  {
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  423  	if (!map->virtual)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  424  		return;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  425  	switch (map->bo_kmap_type) {
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  426  	case ttm_bo_map_iomap:
ba4e7d973dd09b Thomas Hellstrom 2009-06-10 @427  		iounmap(map->virtual);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  428  		break;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  429  	case ttm_bo_map_vmap:
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  430  		vunmap(map->virtual);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  431  		break;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  432  	case ttm_bo_map_kmap:
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  433  		kunmap(map->page);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  434  		break;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  435  	case ttm_bo_map_premapped:
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  436  		break;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  437  	default:
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  438  		BUG();
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  439  	}
d3116756a710e3 Christian König  2021-04-12  440  	ttm_mem_io_free(map->bo->bdev, map->bo->resource);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  441  	map->virtual = NULL;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  442  	map->page = NULL;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  443  }
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  444  EXPORT_SYMBOL(ttm_bo_kunmap);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  445  

:::::: The code at line 427 was first introduced by commit
:::::: ba4e7d973dd09b66912ac4c0856add8b0703a997 drm: Add the TTM GPU memory manager subsystem.

:::::: TO: Thomas Hellstrom <thellstrom@vmware.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
