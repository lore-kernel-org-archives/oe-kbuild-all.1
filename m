Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540AA8BEC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 01:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737337112; cv=none; b=eu5lQ9yoamFlwgwfu/ZSn0j1eJ57/93wsYMQepGH5ZKy46/LoM2Tl1GoNjVf0S01cyCCkA+UlxxnG97y2NFIUuBmZTyxPeWS84+6rjcsG0b6AqwkVFCURKDXgXTF5OYBGk+tHRZ1mIpT/Q1zM4WQeHsSwFv9ZJi5YNQs06Sk1DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737337112; c=relaxed/simple;
	bh=MkRjEbuembR7kYWDqJjEBUNJDdnhoKQeXC6vHhgfNys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jrgy/3oKgKsUB0VDjy6ZtBDLNEou/CcwiT0qg/pa4BrSPmSXt9vpzzdBa/mw2/no3nNpxwbeeMeIO8Kiuo5NNuWN595aDTvGtk1af/9Ebz9OWv0t9g3O+jq8RVPkzyGSgyq+LJHTROHKOXIOn+xZd6VKuOwGI3gVuiXCMrltmTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqkkO8tr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqkkO8tr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737337111; x=1768873111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MkRjEbuembR7kYWDqJjEBUNJDdnhoKQeXC6vHhgfNys=;
  b=eqkkO8trPnQTldg6nkmf8CDLesdHrMN61BjEpxvgo8edG7ABxqjWojrC
   x5xj4g4JD/OWNnTnX4T1VTUUhEcRTW+P5Z6qzxh1WGYgDTYYcRCWQyRbU
   QvAIQFDkz0PHirI/7xZKeLlbLXqjxEuuvSZBUVPvUu9eJPEG//JQQoTtD
   CTkeuIQBKWgxnlSDrBWsV3bQi0lsW29Dc0tfhIgr/8DH67Kh3wqjfwKcI
   auZBETN1jIzxaCeZ589v0EnGAju65YvbCVLOM+ebsKIgh/Xn32axsDwKH
   OAPAKP+F2KS/fbaCExdcaTouhXwc5FJS7elxOvMVPflh9kz9imnoWDDex
   g==;
X-CSE-ConnectionGUID: 9LgU12EiSJSwkbj9MAKSGQ==
X-CSE-MsgGUID: f/OMUHbnSBuYrzeK9JJ6tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41365403"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="41365403"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 17:38:29 -0800
X-CSE-ConnectionGUID: t8gaRFDOR9u6gw2bJigvOw==
X-CSE-MsgGUID: EuiplYBkRm6isXdbEknGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="111319567"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2025 17:38:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZgkB-000W1s-0Z;
	Mon, 20 Jan 2025 01:38:23 +0000
Date: Mon, 20 Jan 2025 09:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2441/2441]
 drivers/gpu/drm/exynos/exynos_drm_gem.c:51:24: error:
 'DMA_ATTR_NON_CONSISTENT' undeclared
Message-ID: <202501200947.UDgyqcGY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 0764432a5ada7a09ce36b0e980ec40340fae2a30 [2441/2441] dma-mapping: add a new dma_alloc_pages API
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250120/202501200947.UDgyqcGY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501200947.UDgyqcGY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200947.UDgyqcGY-lkp@intel.com/

Note: the opencloudos/linux-5.4/lts/5.4.119-20.0009.spr HEAD f1811f6442501fe34d2339158aed4f85a64f0398 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from include/linux/dma-buf.h:18,
                    from drivers/gpu/drm/exynos/exynos_drm_gem.c:9:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/file.h:9,
                    from include/linux/dma-buf.h:16:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_buf':
>> drivers/gpu/drm/exynos/exynos_drm_gem.c:51:24: error: 'DMA_ATTR_NON_CONSISTENT' undeclared (first use in this function)
      51 |                 attr = DMA_ATTR_NON_CONSISTENT;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_gem.c:51:24: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/scsi/53c700.c:108:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from drivers/scsi/53c700.c:105:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/scsi/53c700.c: In function 'NCR_700_detect':
>> drivers/scsi/53c700.c:287:46: error: 'DMA_ATTR_NON_CONSISTENT' undeclared (first use in this function)
     287 |                                  GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/53c700.c:287:46: note: each undeclared identifier is reported only once for each function it appears in
   drivers/scsi/53c700.c: In function 'NCR_700_release':
   drivers/scsi/53c700.c:399:43: error: 'DMA_ATTR_NON_CONSISTENT' undeclared (first use in this function)
     399 |                        hostdata->pScript, DMA_ATTR_NON_CONSISTENT);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/53c700.c: In function 'NCR_700_intr':
   drivers/scsi/53c700.c:1488:41: warning: variable 'state' set but not used [-Wunused-but-set-variable]
    1488 |                 enum NCR_700_Host_State state;
         |                                         ^~~~~
   drivers/scsi/53c700.c: In function 'NCR_700_queuecommand_lck':
   drivers/scsi/53c700.c:1742:33: warning: variable 'direction' set but not used [-Wunused-but-set-variable]
    1742 |         enum dma_data_direction direction;
         |                                 ^~~~~~~~~


vim +/DMA_ATTR_NON_CONSISTENT +51 drivers/gpu/drm/exynos/exynos_drm_gem.c

1c248b7d2960fa Inki Dae            2011-10-04   19  
813fd67b57ffca Joonyoung Shim      2015-10-02   20  static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
2a8cb489454089 Joonyoung Shim      2015-08-16   21  {
813fd67b57ffca Joonyoung Shim      2015-10-02   22  	struct drm_device *dev = exynos_gem->base.dev;
00085f1efa387a Krzysztof Kozlowski 2016-08-03   23  	unsigned long attr;
2a8cb489454089 Joonyoung Shim      2015-08-16   24  	unsigned int nr_pages;
df547bf7735a62 Marek Szyprowski    2015-10-13   25  	struct sg_table sgt;
df547bf7735a62 Marek Szyprowski    2015-10-13   26  	int ret = -ENOMEM;
2a8cb489454089 Joonyoung Shim      2015-08-16   27  
813fd67b57ffca Joonyoung Shim      2015-10-02   28  	if (exynos_gem->dma_addr) {
6be900563a9e74 Inki Dae            2019-04-15   29  		DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "already allocated.\n");
2a8cb489454089 Joonyoung Shim      2015-08-16   30  		return 0;
2a8cb489454089 Joonyoung Shim      2015-08-16   31  	}
2a8cb489454089 Joonyoung Shim      2015-08-16   32  
00085f1efa387a Krzysztof Kozlowski 2016-08-03   33  	exynos_gem->dma_attrs = 0;
2a8cb489454089 Joonyoung Shim      2015-08-16   34  
2a8cb489454089 Joonyoung Shim      2015-08-16   35  	/*
2a8cb489454089 Joonyoung Shim      2015-08-16   36  	 * if EXYNOS_BO_CONTIG, fully physically contiguous memory
2a8cb489454089 Joonyoung Shim      2015-08-16   37  	 * region will be allocated else physically contiguous
2a8cb489454089 Joonyoung Shim      2015-08-16   38  	 * as possible.
2a8cb489454089 Joonyoung Shim      2015-08-16   39  	 */
813fd67b57ffca Joonyoung Shim      2015-10-02   40  	if (!(exynos_gem->flags & EXYNOS_BO_NONCONTIG))
00085f1efa387a Krzysztof Kozlowski 2016-08-03   41  		exynos_gem->dma_attrs |= DMA_ATTR_FORCE_CONTIGUOUS;
2a8cb489454089 Joonyoung Shim      2015-08-16   42  
2a8cb489454089 Joonyoung Shim      2015-08-16   43  	/*
2a8cb489454089 Joonyoung Shim      2015-08-16   44  	 * if EXYNOS_BO_WC or EXYNOS_BO_NONCACHABLE, writecombine mapping
2a8cb489454089 Joonyoung Shim      2015-08-16   45  	 * else cachable mapping.
2a8cb489454089 Joonyoung Shim      2015-08-16   46  	 */
813fd67b57ffca Joonyoung Shim      2015-10-02   47  	if (exynos_gem->flags & EXYNOS_BO_WC ||
813fd67b57ffca Joonyoung Shim      2015-10-02   48  			!(exynos_gem->flags & EXYNOS_BO_CACHABLE))
2a8cb489454089 Joonyoung Shim      2015-08-16   49  		attr = DMA_ATTR_WRITE_COMBINE;
2a8cb489454089 Joonyoung Shim      2015-08-16   50  	else
2a8cb489454089 Joonyoung Shim      2015-08-16  @51  		attr = DMA_ATTR_NON_CONSISTENT;
2a8cb489454089 Joonyoung Shim      2015-08-16   52  
00085f1efa387a Krzysztof Kozlowski 2016-08-03   53  	exynos_gem->dma_attrs |= attr;
00085f1efa387a Krzysztof Kozlowski 2016-08-03   54  	exynos_gem->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
2a8cb489454089 Joonyoung Shim      2015-08-16   55  
813fd67b57ffca Joonyoung Shim      2015-10-02   56  	nr_pages = exynos_gem->size >> PAGE_SHIFT;
2a8cb489454089 Joonyoung Shim      2015-08-16   57  
2098105ec65cb3 Michal Hocko        2017-05-17   58  	exynos_gem->pages = kvmalloc_array(nr_pages, sizeof(struct page *),
2098105ec65cb3 Michal Hocko        2017-05-17   59  			GFP_KERNEL | __GFP_ZERO);
813fd67b57ffca Joonyoung Shim      2015-10-02   60  	if (!exynos_gem->pages) {
6f83d20838c099 Inki Dae            2019-04-15   61  		DRM_DEV_ERROR(to_dma_dev(dev), "failed to allocate pages.\n");
2a8cb489454089 Joonyoung Shim      2015-08-16   62  		return -ENOMEM;
2a8cb489454089 Joonyoung Shim      2015-08-16   63  	}
2a8cb489454089 Joonyoung Shim      2015-08-16   64  
f43c35966a5ac6 Marek Szyprowski    2016-02-29   65  	exynos_gem->cookie = dma_alloc_attrs(to_dma_dev(dev), exynos_gem->size,
813fd67b57ffca Joonyoung Shim      2015-10-02   66  					     &exynos_gem->dma_addr, GFP_KERNEL,
00085f1efa387a Krzysztof Kozlowski 2016-08-03   67  					     exynos_gem->dma_attrs);
813fd67b57ffca Joonyoung Shim      2015-10-02   68  	if (!exynos_gem->cookie) {
6f83d20838c099 Inki Dae            2019-04-15   69  		DRM_DEV_ERROR(to_dma_dev(dev), "failed to allocate buffer.\n");
df547bf7735a62 Marek Szyprowski    2015-10-13   70  		goto err_free;
2a8cb489454089 Joonyoung Shim      2015-08-16   71  	}
2a8cb489454089 Joonyoung Shim      2015-08-16   72  
f43c35966a5ac6 Marek Szyprowski    2016-02-29   73  	ret = dma_get_sgtable_attrs(to_dma_dev(dev), &sgt, exynos_gem->cookie,
df547bf7735a62 Marek Szyprowski    2015-10-13   74  				    exynos_gem->dma_addr, exynos_gem->size,
00085f1efa387a Krzysztof Kozlowski 2016-08-03   75  				    exynos_gem->dma_attrs);
df547bf7735a62 Marek Szyprowski    2015-10-13   76  	if (ret < 0) {
6f83d20838c099 Inki Dae            2019-04-15   77  		DRM_DEV_ERROR(to_dma_dev(dev), "failed to get sgtable.\n");
df547bf7735a62 Marek Szyprowski    2015-10-13   78  		goto err_dma_free;
2a8cb489454089 Joonyoung Shim      2015-08-16   79  	}
df547bf7735a62 Marek Szyprowski    2015-10-13   80  
df547bf7735a62 Marek Szyprowski    2015-10-13   81  	if (drm_prime_sg_to_page_addr_arrays(&sgt, exynos_gem->pages, NULL,
df547bf7735a62 Marek Szyprowski    2015-10-13   82  					     nr_pages)) {
6f83d20838c099 Inki Dae            2019-04-15   83  		DRM_DEV_ERROR(to_dma_dev(dev), "invalid sgtable.\n");
df547bf7735a62 Marek Szyprowski    2015-10-13   84  		ret = -EINVAL;
df547bf7735a62 Marek Szyprowski    2015-10-13   85  		goto err_sgt_free;
2a8cb489454089 Joonyoung Shim      2015-08-16   86  	}
2a8cb489454089 Joonyoung Shim      2015-08-16   87  
df547bf7735a62 Marek Szyprowski    2015-10-13   88  	sg_free_table(&sgt);
df547bf7735a62 Marek Szyprowski    2015-10-13   89  
6be900563a9e74 Inki Dae            2019-04-15   90  	DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
813fd67b57ffca Joonyoung Shim      2015-10-02   91  			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
2a8cb489454089 Joonyoung Shim      2015-08-16   92  
2a8cb489454089 Joonyoung Shim      2015-08-16   93  	return 0;
df547bf7735a62 Marek Szyprowski    2015-10-13   94  
df547bf7735a62 Marek Szyprowski    2015-10-13   95  err_sgt_free:
df547bf7735a62 Marek Szyprowski    2015-10-13   96  	sg_free_table(&sgt);
df547bf7735a62 Marek Szyprowski    2015-10-13   97  err_dma_free:
f43c35966a5ac6 Marek Szyprowski    2016-02-29   98  	dma_free_attrs(to_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
00085f1efa387a Krzysztof Kozlowski 2016-08-03   99  		       exynos_gem->dma_addr, exynos_gem->dma_attrs);
df547bf7735a62 Marek Szyprowski    2015-10-13  100  err_free:
2098105ec65cb3 Michal Hocko        2017-05-17  101  	kvfree(exynos_gem->pages);
df547bf7735a62 Marek Szyprowski    2015-10-13  102  
df547bf7735a62 Marek Szyprowski    2015-10-13  103  	return ret;
2a8cb489454089 Joonyoung Shim      2015-08-16  104  }
2a8cb489454089 Joonyoung Shim      2015-08-16  105  

:::::: The code at line 51 was first introduced by commit
:::::: 2a8cb48945408984cd04c850b293f467b32ec5af drm/exynos: merge exynos_drm_buf.c to exynos_drm_gem.c

:::::: TO: Joonyoung Shim <jy0922.shim@samsung.com>
:::::: CC: Inki Dae <inki.dae@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
