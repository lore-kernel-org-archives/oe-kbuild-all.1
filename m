Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33452664AC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707471443; cv=none; b=AFG4Zd0jehAnfQQMeHgAXGyXtn1gX0VEdm6STOsEkD5m+jr/56xd0SZohjFBCfdSXG1yFhhKyeeb43wSXz/ermhtn2kYrCNxTmmzc/sm18K71HQemG0DW/B3o8PxajQO33P1rlpr7UyttBuA+NsY/yzqbnwq0zrDK/ws/jcl+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707471443; c=relaxed/simple;
	bh=86X+YQanQRtY1qrTrPdfsmcrbqwPpoGkDTBBzQUT+io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZVkXdUqeA5GHsdzNmmDK3rK95htkoFIXxrmZiniVCw+ksCiK94bkcAwxy/IuQIrhLz2nX6WpxBbuzzhQB32NZ5Qy/XzKqHuUymbAeGxkWUMqrBLihD6S9vWz/vVUV7jf05QB73La/+InPZ57N7A0D+Zm/+W5YG/CEZpMxSpJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPLqMckO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPLqMckO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707471441; x=1739007441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=86X+YQanQRtY1qrTrPdfsmcrbqwPpoGkDTBBzQUT+io=;
  b=EPLqMckOM6YkblezUHkXlMSMi/Yp2zjKTFs26TA+JsdlG6zRGotIG/EQ
   6nQSUAnX5EXYATqllOiJeoVf/p+Guf66fI6z3TiDZoTYvogTjVRlkeBFL
   LTmfHKxbpnqv/60wZJPH3KqxAz9FjDNBOR+kectS9K3UyYgz4cc/hrdA9
   jntPwgIga8JCXdbMU8UMphJ7s5b8/6zeh/+rIzxvBgHLpqXDHGMEs8Mzv
   jN4hAQf6vNRBK9RYmvZBVpvvQ2dvS63+IUS/h+5nXnUiYNmam1hHBo1af
   f3kwKlClY7trau6fCvlJvBUT6tSauf1CESs5DM1484mP3MYCDwRMV8fdC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1552318"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1552318"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 01:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1875170"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2024 01:37:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYNJt-0004Zu-1U;
	Fri, 09 Feb 2024 09:37:17 +0000
Date: Fri, 9 Feb 2024 17:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:dma-buf/ecc-heap 2/2]
 drivers/dma-buf/heaps/ecc_heap.c:250:14: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202402091740.UVnTJNBf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git dma-buf/ecc-heap
head:   ada01bd9fd36129c6e15a17aec5b20844ee1bad7
commit: ada01bd9fd36129c6e15a17aec5b20844ee1bad7 [2/2] dma-buf: heap: Introduce a new ECC Heap
config: arm-randconfig-r111-20240209 (https://download.01.org/0day-ci/archive/20240209/202402091740.UVnTJNBf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240209/202402091740.UVnTJNBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091740.UVnTJNBf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/ecc_heap.c:250:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void * @@
   drivers/dma-buf/heaps/ecc_heap.c:250:14: sparse:     expected void [noderef] __iomem *base
   drivers/dma-buf/heaps/ecc_heap.c:250:14: sparse:     got void *
>> drivers/dma-buf/heaps/ecc_heap.c:278:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *base @@
   drivers/dma-buf/heaps/ecc_heap.c:278:18: sparse:     expected void *addr
   drivers/dma-buf/heaps/ecc_heap.c:278:18: sparse:     got void [noderef] __iomem *base
   drivers/dma-buf/heaps/ecc_heap.c: note: in included file (through include/linux/fwnode.h, include/linux/logic_pio.h, include/asm-generic/io.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +250 drivers/dma-buf/heaps/ecc_heap.c

   229	
   230	static int __init ecc_heap_setup(const struct reserved_mem *rmem)
   231	{
   232		struct dma_heap_export_info exp_info = {};
   233		struct ecc_heap_priv *priv;
   234		struct dma_heap *heap;
   235		struct gen_pool *pool;
   236		void __iomem *base;
   237		int ret;
   238	
   239		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
   240		if (!priv)
   241			return -ENOMEM;
   242	
   243		pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
   244		if (!pool) {
   245			ret = -ENOMEM;
   246			goto err_cleanup_heap;
   247		}
   248		priv->pool = pool;
   249	
 > 250		base = memremap(rmem->base, rmem->size, MEMREMAP_WB);
   251		if (!base) {
   252			ret = -ENOMEM;
   253			goto err_release_mem_region;
   254		}
   255	
   256		ret = gen_pool_add_virt(pool, (unsigned long)base,
   257					rmem->base, rmem->size,
   258					NUMA_NO_NODE);
   259		if (ret)
   260			goto err_unmap;
   261	
   262		exp_info.name = "ecc";
   263		exp_info.ops = &ecc_heap_ops;
   264		exp_info.priv = priv;
   265	
   266		heap = dma_heap_add(&exp_info);
   267		if (IS_ERR(heap)) {
   268			ret = PTR_ERR(heap);
   269			goto err_cleanup_pool_region;
   270		}
   271		priv->heap = heap;
   272	
   273		return 0;
   274	
   275	err_cleanup_pool_region:
   276		gen_pool_free(pool, (unsigned long)base, rmem->size);
   277	err_unmap:
 > 278		memunmap(base);
   279	err_release_mem_region:
   280		gen_pool_destroy(pool);
   281	err_cleanup_heap:
   282		kfree(priv);
   283		return ret;
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
