Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98401FC7EC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733322504; cv=none; b=QFJVUqJ3WPiQlBT7ikbgtuNv1rVGZjLIo7l1uFr5IkMMVqHgW6O1HhsP8c4G/ewRgoR87PIXyjbSQwNZ2Kl9XlL6vvh8TliLLtzRi+In1Z8be1p/OFq19PnnI1pGd8sfYBaT94nUCt8y8asQzgLp35KCfG7EjWUwg1Q9y9Vrusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733322504; c=relaxed/simple;
	bh=F13nZ3+NJ27uT2x+zXIOB9CiwmK5mIc/BG14QgtKYGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7FpzkdqklgEU+oXky/BWwWkvYSV8NEbEXXEyk+5K/UTCJxObG88koNgQATMEHvhsB+gU3q88QJPyrREmieXopvyyTskD2/wDi+Z8EPowBdziV5fK5x2K4lxua+kMO4Z4mbQ7Toh/CQYYvpX8QDpW+g52EoqABKV0svGy8rMwR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXkZ9fuy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXkZ9fuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733322502; x=1764858502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F13nZ3+NJ27uT2x+zXIOB9CiwmK5mIc/BG14QgtKYGA=;
  b=GXkZ9fuyivF/ZkKfIn47gVvxNPGpQsFGzjooc2MEMe33HpE6/zL4GBiS
   Xkdls0M5JpdIcqAzdNItfeg1N/CrfG8YNsXb/Vy6C1t4B9cnhPvCw2t6Z
   MFfmiKWDRHanBIGlTc/SMZ2PXUk+NnhXr0WnFrRc28jCq++YEGwZB9KZe
   41LT1vpHn2CsMUoodH5325s7L8tlFxmBKZXDgF0Y6U+jbbCBbzP0nKrJw
   etR7i1lHAiEkxL6R/gaSBMi3j1QcMKskYfg8CDVBR6ssN63E2o5V0BvSZ
   dOnDbVI1wU+uWpS/3nWpsvYUaklHkf6N4uAKvrXK7cqdncVh0wB5shULW
   A==;
X-CSE-ConnectionGUID: T0hKOOK2SK2arhnbQNljvA==
X-CSE-MsgGUID: edqckcwlQ4KGGIoMReRo6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51121253"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="51121253"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:28:21 -0800
X-CSE-ConnectionGUID: KdGfnANiRCeMbODFWffEMg==
X-CSE-MsgGUID: 3kBpGGubR++PsMrbpr3tYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="117029579"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2024 06:28:17 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIqMR-00036h-19;
	Wed, 04 Dec 2024 14:28:15 +0000
Date: Wed, 4 Dec 2024 22:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 kernel/dma/mapping.c:557:72: error: macro "alloc_pages" passed 5 arguments,
 but takes just 2
Message-ID: <202412042250.KmH1Nsq2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 0764432a5ada7a09ce36b0e980ec40340fae2a30 [1/1] dma-mapping: add a new dma_alloc_pages API
config: arm64-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412042250.KmH1Nsq2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042250.KmH1Nsq2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042250.KmH1Nsq2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/dma/mapping.c:10:
   include/linux/dma-direct.h:87:7: error: conflicting types for 'dma_direct_alloc_pages'; have 'void *(struct device *, size_t,  dma_addr_t *, gfp_t,  long unsigned int)' {aka 'void *(struct device *, long unsigned int,  long long unsigned int *, unsigned int,  long unsigned int)'}
      87 | void *dma_direct_alloc_pages(struct device *dev, size_t size,
         |       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-direct.h:82:14: note: previous declaration of 'dma_direct_alloc_pages' with type 'struct page *(struct device *, size_t,  dma_addr_t *, enum dma_data_direction,  gfp_t)' {aka 'struct page *(struct device *, long unsigned int,  long long unsigned int *, enum dma_data_direction,  unsigned int)'}
      82 | struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
         |              ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-direct.h:89:6: error: conflicting types for 'dma_direct_free_pages'; have 'void(struct device *, size_t,  void *, dma_addr_t,  long unsigned int)' {aka 'void(struct device *, long unsigned int,  void *, long long unsigned int,  long unsigned int)'}
      89 | void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-direct.h:84:6: note: previous declaration of 'dma_direct_free_pages' with type 'void(struct device *, size_t,  struct page *, dma_addr_t,  enum dma_data_direction)' {aka 'void(struct device *, long unsigned int,  struct page *, long long unsigned int,  enum dma_data_direction)'}
      84 | void dma_direct_free_pages(struct device *dev, size_t size,
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/dma/mapping.c: In function 'dma_alloc_pages':
>> kernel/dma/mapping.c:557:72: error: macro "alloc_pages" passed 5 arguments, but takes just 2
     557 |                 page = ops->alloc_pages(dev, size, dma_handle, dir, gfp);
         |                                                                        ^
   In file included from include/linux/mm.h:10,
                    from include/linux/memblock.h:13,
                    from kernel/dma/mapping.c:8:
   include/linux/gfp.h:540:9: note: macro "alloc_pages" defined here
     540 | #define alloc_pages(gfp_mask, order) \
         |         ^~~~~~~~~~~
>> kernel/dma/mapping.c:557:22: error: assignment to 'struct page *' from incompatible pointer type 'struct page * (*)(struct device *, size_t,  dma_addr_t *, enum dma_data_direction,  gfp_t)' {aka 'struct page * (*)(struct device *, long unsigned int,  long long unsigned int *, enum dma_data_direction,  unsigned int)'} [-Werror=incompatible-pointer-types]
     557 |                 page = ops->alloc_pages(dev, size, dma_handle, dir, gfp);
         |                      ^
   cc1: some warnings being treated as errors


vim +/alloc_pages +557 kernel/dma/mapping.c

   541	
   542	struct page *dma_alloc_pages(struct device *dev, size_t size,
   543			dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
   544	{
   545		const struct dma_map_ops *ops = get_dma_ops(dev);
   546		struct page *page;
   547	
   548		if (WARN_ON_ONCE(!dev->coherent_dma_mask))
   549			return NULL;
   550		if (WARN_ON_ONCE(gfp & (__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM)))
   551			return NULL;
   552	
   553		size = PAGE_ALIGN(size);
   554		if (dma_alloc_direct(dev, ops))
   555			page = dma_direct_alloc_pages(dev, size, dma_handle, dir, gfp);
   556		else if (ops->alloc_pages)
 > 557			page = ops->alloc_pages(dev, size, dma_handle, dir, gfp);
   558		else
   559			return NULL;
   560	
   561		debug_dma_map_page(dev, page, 0, size, dir, *dma_handle);
   562	
   563		return page;
   564	}
   565	EXPORT_SYMBOL_GPL(dma_alloc_pages);
   566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
