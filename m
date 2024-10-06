Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA4D4C91
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728212596; cv=none; b=nnSo5YctxWPX3F3euoCSAl39xsP5HzBoeSO1AXn5lL7ao22UXEdBXbRqYjnJ0YH8+hNtnaF1DvyPrmigFmsHPyybhvzWtJsxBzR7bBZrLE2UKfuh5ZJLrh2Y8SIpqaLWu3J7bGc1MF96luL8ONMt3lc7hj0bFbSUipfkE3Bm1yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728212596; c=relaxed/simple;
	bh=JVVhcUFuusLj+2qv5VKrK7GHi7y2gtXuxOpzq8IhGv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I6h2+1GA+Ka8kYvX3pnZ1XEFZCkaIX+sDUJRZoeZ+QVgqJ75U4G2X4Hu0iR7kpCnlSObPBnokw85Yiu+D06cIN88x60wddIfTiS8dNgBo9/yN3F8wW5LATPliP6NN2lY7gjbLd4RTuB8aWwXDDp0aegPQ4Z/xhRTbJxZBY/67NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rh3KLb4t; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rh3KLb4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728212595; x=1759748595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JVVhcUFuusLj+2qv5VKrK7GHi7y2gtXuxOpzq8IhGv4=;
  b=Rh3KLb4tYjtgV/m2aCHnk8oZgvh/rRO732b1ELg9WYgxzxEyumKikuHn
   ETXSSU15bbs//MLZbKtsBQLIBchNlfJAbSMHcBH0wVHPPK7idpylhXmZk
   LorFQsCvyt9DiQrMxyUdIFVnycLyUcPRtCMPAmHQPpkMq5rUU0sRDMUmv
   qD32+3rDUwmmu30u2/ow1pyvE7p1p6BzQk15JBh0KNCMjtEDcnK3diXdP
   cjtL8T0PSnLTWSA0nBHsbLDcTjB7hq6xvovLVKNx0UQyIxgEF/cLSovST
   VP4qMVVmocHr0VlPv+CVrTg0ow6fN0vHvqVXL9PmRt+6PmOXYhdZdHTUL
   Q==;
X-CSE-ConnectionGUID: xUbgUDiNT9+101eIraKJVg==
X-CSE-MsgGUID: H4/eJKJ2T9OELPGnPB8hPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27509538"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="27509538"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 04:03:14 -0700
X-CSE-ConnectionGUID: HX0GWvddQmm8QkS9NpqZkg==
X-CSE-MsgGUID: v9nmu7I7SwGRANJKfDNEOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="79160691"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Oct 2024 04:03:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxP2c-0003ng-14;
	Sun, 06 Oct 2024 11:03:10 +0000
Date: Sun, 6 Oct 2024 19:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:nvme-dma 5/10] drivers/infiniband/core/umem_odp.c:90:41:
 error: use of undeclared identifier 'addr'
Message-ID: <202410061901.3uDxXErF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git nvme-dma
head:   080c3a9ad1b0163ed2b4f9f9fba9a9fd8fe8919f
commit: 4efd58fca48c18675130589882ca529988ede443 [5/10] dma-mapping: change the dma_alloc_iova / dma_link_range API
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241006/202410061901.3uDxXErF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061901.3uDxXErF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061901.3uDxXErF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/core/umem_odp.c:90:41: error: use of undeclared identifier 'addr'
      90 |         if (dma_mapping_error(dev->dma_device, addr)) {
         |                                                ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/addr +90 drivers/infiniband/core/umem_odp.c

    49	
    50	static inline int ib_init_umem_odp(struct ib_umem_odp *umem_odp,
    51					   const struct mmu_interval_notifier_ops *ops)
    52	{
    53		struct ib_device *dev = umem_odp->umem.ibdev;
    54		size_t page_size = 1UL << umem_odp->page_shift;
    55		unsigned long start, end;
    56		size_t ndmas, npfns;
    57		dma_addr_t dma_addr;
    58		int ret;
    59	
    60		umem_odp->umem.is_odp = 1;
    61		mutex_init(&umem_odp->umem_mutex);
    62		if (umem_odp->is_implicit_odp)
    63			return 0;
    64	
    65		if (!iommu_can_use_iova(dev->dma_device, NULL, page_size,
    66					DMA_BIDIRECTIONAL))
    67			return -EOPNOTSUPP;
    68	
    69		start = ALIGN_DOWN(umem_odp->umem.address, page_size);
    70		if (check_add_overflow(umem_odp->umem.address,
    71				       (unsigned long)umem_odp->umem.length, &end))
    72			return -EOVERFLOW;
    73		end = ALIGN(end, page_size);
    74		if (unlikely(end < page_size))
    75			return -EOVERFLOW;
    76	
    77		ndmas = (end - start) >> umem_odp->page_shift;
    78		if (!ndmas)
    79			return -EINVAL;
    80	
    81		npfns = (end - start) >> PAGE_SHIFT;
    82		umem_odp->pfn_list =
    83			kvcalloc(npfns, sizeof(*umem_odp->pfn_list), GFP_KERNEL);
    84		if (!umem_odp->pfn_list)
    85			return -ENOMEM;
    86	
    87		dma_init_iova_state(&umem_odp->state, dev->dma_device,
    88				    DMA_BIDIRECTIONAL);
    89		dma_addr = dma_alloc_iova(&umem_odp->state, 0, end - start);
  > 90		if (dma_mapping_error(dev->dma_device, addr)) {
    91			ret = -ENOMEM;
    92			goto out_pfn_list;
    93		}
    94	
    95		ret = mmu_interval_notifier_insert(&umem_odp->notifier,
    96						   umem_odp->umem.owning_mm, start,
    97						   end - start, ops);
    98		if (ret)
    99			goto out_free_iova;
   100	
   101		return 0;
   102	
   103	out_free_iova:
   104		dma_free_iova(&umem_odp->state);
   105	out_pfn_list:
   106		kvfree(umem_odp->pfn_list);
   107		return ret;
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
