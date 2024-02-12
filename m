Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A647EC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 02:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707706463; cv=none; b=V1zHrUDbCpumumcipIfXYwg1yN3RyeMBxbWbrLIIhAS/pdWb+glTZbcWo+d4950t5U2/6ZwmtEB+ewQy9+XGkmhDMDZbftiwQNOEaF5XE/Vz0Z/x+uqcyO0SUpIN6CyumI16V6A8Z54L/KdRzLE6E/KROH2mUDlr8GHqzdfnahs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707706463; c=relaxed/simple;
	bh=axnsQcwubxWSnyZpWMmPC9dOY8flGCO87RImk1FHALI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SgFWE5wP2KIjDq9LrNxdOXMA9uUbWvXcL98n0kbB9mQ8bdLK1K6iBYJvxnCAtZHSRtLXb3oqidLnGAaA3pS0xx1zRYw+Hto8maXCiNq6UDNaRzTKQnGe2fllaipR+aMqPWd1xMjSy/LCGVJtP28f4fje8msod3P3cKdaHvv1vpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXEzGc1V; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXEzGc1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707706461; x=1739242461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axnsQcwubxWSnyZpWMmPC9dOY8flGCO87RImk1FHALI=;
  b=CXEzGc1Vd8xJHYX4xQah9es0+Y1IKsF/ruMGKQlLFfpsw13uottgl0DX
   QR0ulPb+F+2FuOrTI8pB1a4xWFt26kkkIyxleM4aw57qCqCgThgAnaJN2
   1TRZNwDV9YSGJ+NCVV4/FsWVlV5We15dz+vLRF8txEDU8kxrV7uwG7Ada
   bOIFAPFBdb/NPunq+VhyvfxOxWunNZ2qRDXKT9tO8Wdq3uu4O/bYkbaPb
   nDgjk/mMI1+EcUnCYYvw+VbXqXUlo5PAhliqgEuA5+Nxbn9NL/qFIsa0a
   9xV1gr5zDRlDBck82Afxm+pic/TYNX8gD6iqGLI4Os1YUSrC8aJwqNnUn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="12305744"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="12305744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 18:54:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="33255213"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2024 18:54:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZMSW-0006sc-1L;
	Mon, 12 Feb 2024 02:54:16 +0000
Date: Mon, 12 Feb 2024 10:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap-split 1/2] kernel/dma/coherent.c:155:11: error: call
 to undeclared function 'bitmap_find_free_region'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202402121043.RLyXtb0u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bitmap-split
head:   66ecb308874cc02d98589cc983af0ac5a5f9f7e4
commit: 23228578687634d7bb126bd87e3750780f409e66 [1/2] aaa
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240212/202402121043.RLyXtb0u-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402121043.RLyXtb0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402121043.RLyXtb0u-lkp@intel.com/

Note: the norov/bitmap-split HEAD 66ecb308874cc02d98589cc983af0ac5a5f9f7e4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/dma/coherent.c:155:11: error: call to undeclared function 'bitmap_find_free_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     155 |         pageno = bitmap_find_free_region(mem->bitmap, mem->size, order);
         |                  ^
>> kernel/dma/coherent.c:208:3: error: call to undeclared function 'bitmap_release_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     208 |                 bitmap_release_region(mem->bitmap, page, order);
         |                 ^
   2 errors generated.


vim +/bitmap_find_free_region +155 kernel/dma/coherent.c

e61c451476e614 kernel/dma/coherent.c       Mark-PK Tsai      2022-04-22  140  
a445e940ea686f kernel/dma/coherent.c       Vladimir Murzin   2019-10-30  141  static void *__dma_alloc_from_coherent(struct device *dev,
a445e940ea686f kernel/dma/coherent.c       Vladimir Murzin   2019-10-30  142  				       struct dma_coherent_mem *mem,
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  143  				       ssize_t size, dma_addr_t *dma_handle)
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  144  {
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  145  	int order = get_order(size);
7bfa5ab6fa1b18 drivers/base/dma-coherent.c Marek Szyprowski  2014-10-13  146  	unsigned long flags;
eccd83e116e7f4 kernel/dma-coherent.c       Andrew Morton     2009-01-06  147  	int pageno;
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  148  	void *ret;
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  149  
7bfa5ab6fa1b18 drivers/base/dma-coherent.c Marek Szyprowski  2014-10-13  150  	spin_lock_irqsave(&mem->spinlock, flags);
0609697eab9775 kernel/dma-coherent.c       Paul Mundt        2009-01-21  151  
286c21de32b904 kernel/dma/coherent.c       Kevin Grandemange 2020-03-12  152  	if (unlikely(size > ((dma_addr_t)mem->size << PAGE_SHIFT)))
0609697eab9775 kernel/dma-coherent.c       Paul Mundt        2009-01-21  153  		goto err;
eccd83e116e7f4 kernel/dma-coherent.c       Andrew Morton     2009-01-06  154  
eccd83e116e7f4 kernel/dma-coherent.c       Andrew Morton     2009-01-06 @155  	pageno = bitmap_find_free_region(mem->bitmap, mem->size, order);
0609697eab9775 kernel/dma-coherent.c       Paul Mundt        2009-01-21  156  	if (unlikely(pageno < 0))
0609697eab9775 kernel/dma-coherent.c       Paul Mundt        2009-01-21  157  		goto err;
0609697eab9775 kernel/dma-coherent.c       Paul Mundt        2009-01-21  158  
0bef3c2dc7d0c8 kernel/dma-coherent.c       Andrew Morton     2009-01-06  159  	/*
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  160  	 * Memory was found in the coherent area.
0bef3c2dc7d0c8 kernel/dma-coherent.c       Andrew Morton     2009-01-06  161  	 */
286c21de32b904 kernel/dma/coherent.c       Kevin Grandemange 2020-03-12  162  	*dma_handle = dma_get_device_base(dev, mem) +
286c21de32b904 kernel/dma/coherent.c       Kevin Grandemange 2020-03-12  163  			((dma_addr_t)pageno << PAGE_SHIFT);
286c21de32b904 kernel/dma/coherent.c       Kevin Grandemange 2020-03-12  164  	ret = mem->virt_base + ((dma_addr_t)pageno << PAGE_SHIFT);
dd01c75f1df311 drivers/base/dma-coherent.c Bastian Hecht     2016-09-28  165  	spin_unlock_irqrestore(&mem->spinlock, flags);
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  166  	memset(ret, 0, size);
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  167  	return ret;
0609697eab9775 kernel/dma-coherent.c       Paul Mundt        2009-01-21  168  err:
7bfa5ab6fa1b18 drivers/base/dma-coherent.c Marek Szyprowski  2014-10-13  169  	spin_unlock_irqrestore(&mem->spinlock, flags);
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  170  	return NULL;
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  171  }
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  172  
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  173  /**
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  174   * dma_alloc_from_dev_coherent() - allocate memory from device coherent pool
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  175   * @dev:	device from which we allocate memory
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  176   * @size:	size of requested memory area
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  177   * @dma_handle:	This will be filled with the correct dma handle
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  178   * @ret:	This pointer will be filled with the virtual address
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  179   *		to allocated area.
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  180   *
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  181   * This function should be only called from per-arch dma_alloc_coherent()
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  182   * to support allocation from per-device coherent memory pools.
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  183   *
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  184   * Returns 0 if dma_alloc_coherent should continue with allocating from
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  185   * generic memory areas, or !0 if dma_alloc_coherent should return @ret.
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  186   */
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  187  int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  188  		dma_addr_t *dma_handle, void **ret)
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  189  {
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  190  	struct dma_coherent_mem *mem = dev_get_coherent_memory(dev);
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  191  
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  192  	if (!mem)
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  193  		return 0;
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  194  
a445e940ea686f kernel/dma/coherent.c       Vladimir Murzin   2019-10-30  195  	*ret = __dma_alloc_from_coherent(dev, mem, size, dma_handle);
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  196  	return 1;
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  197  }
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  198  
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  199  static int __dma_release_from_coherent(struct dma_coherent_mem *mem,
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  200  				       int order, void *vaddr)
43fc509c3efb5c drivers/base/dma-coherent.c Vladimir Murzin   2017-07-20  201  {
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  202  	if (mem && vaddr >= mem->virt_base && vaddr <
286c21de32b904 kernel/dma/coherent.c       Kevin Grandemange 2020-03-12  203  		   (mem->virt_base + ((dma_addr_t)mem->size << PAGE_SHIFT))) {
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  204  		int page = (vaddr - mem->virt_base) >> PAGE_SHIFT;
7bfa5ab6fa1b18 drivers/base/dma-coherent.c Marek Szyprowski  2014-10-13  205  		unsigned long flags;
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  206  
7bfa5ab6fa1b18 drivers/base/dma-coherent.c Marek Szyprowski  2014-10-13  207  		spin_lock_irqsave(&mem->spinlock, flags);
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29 @208  		bitmap_release_region(mem->bitmap, page, order);
7bfa5ab6fa1b18 drivers/base/dma-coherent.c Marek Szyprowski  2014-10-13  209  		spin_unlock_irqrestore(&mem->spinlock, flags);
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  210  		return 1;
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  211  	}
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  212  	return 0;
ee7e5516be4f21 kernel/dma-coherent.c       Dmitry Baryshkov  2008-06-29  213  }
bca0fa5f12a674 drivers/base/dma-coherent.c Marek Szyprowski  2012-03-23  214  

:::::: The code at line 155 was first introduced by commit
:::::: eccd83e116e7f414a1da3aae3745384b7b171883 dma_alloc_coherent: clean it up

:::::: TO: Andrew Morton <akpm@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
