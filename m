Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03114C5B5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728203954; cv=none; b=Of8GRsbkwzGwmCDHxSvWyWOTj0erYD0w/yJpouLsC8sSJl/R4UhYX6BHK5JUfqBoNZVeZ5rX6eVZnA4HM/27GZrz0KNc27gmkLh95C9kALT3CIinGMs/nGIFDXtZCTy4BIHxJaJnUTgYxsTyeu7d7KQIPC5HFRdv3f5vgZ3MiJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728203954; c=relaxed/simple;
	bh=RNCJvj2dLPH0yGXwOe7gnatu0R6FJFvGJtiqyJVNdG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZK27qZqLKg4hav4UM6uqC2AZrCahvslIXa3irbnLfrBogRFL2XxyvfJhupox+jgI+8+jhKda8n0Sj1ra44dpSYMDHPgXUXgBmgjfuH8upYjIPM4tb72GgSsc+DP42PhwPbYk/Vo0WhypRCA0hfSnPqz81b4WP0AymYMnZkvons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+9X33GB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+9X33GB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728203952; x=1759739952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RNCJvj2dLPH0yGXwOe7gnatu0R6FJFvGJtiqyJVNdG0=;
  b=a+9X33GBo5EoJ4WgOHmkQ0EkRx9uCr9sNN3/3CYRgnXcjqR7XoTj6Y1X
   VpzfLeoc5a5EfHQMc+yZBNfBwRS4xrZW/P62KPqlmYYIhyuT5uKVDR+fu
   yvOvT2hxRXcLOuIoRQibqIkNy1Ypl4bH1xsfaVXe/7pFqwAHn+aumgo/e
   1js/Lk0+uhO6sIGNz16eTFh1uQ5rL9ADlfKmKJtlp9aBm57y9kB4i/Mwk
   cxmbEaf2YMGC1GeC0XNuuPpYxBUhJFEQIThH2ETxE2ePmIUYqMY7flBYQ
   Hzd/mncOs3M/9P3EvXKAOEk3FOTg11kiICw2HN0Otnrx0Cey8XBpZnsKW
   w==;
X-CSE-ConnectionGUID: bGc2cRnlRaqA107QSXUgLQ==
X-CSE-MsgGUID: IrsuDAPXRrCYAKE+QE6dEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27514294"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="27514294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 01:39:11 -0700
X-CSE-ConnectionGUID: ucBZfRnQTweKiUhfubmrlA==
X-CSE-MsgGUID: GmuhsYNsSA6ImEeo0ZH4QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="75126312"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Oct 2024 01:39:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxMnE-0003k8-0k;
	Sun, 06 Oct 2024 08:39:08 +0000
Date: Sun, 6 Oct 2024 16:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:nvme-dma 5/10] drivers/infiniband/core/umem_odp.c:90:48:
 error: 'addr' undeclared
Message-ID: <202410061615.FnMBdqin-lkp@intel.com>
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
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241006/202410061615.FnMBdqin-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061615.FnMBdqin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061615.FnMBdqin-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/infiniband/core/umem_odp.c: In function 'ib_init_umem_odp':
>> drivers/infiniband/core/umem_odp.c:90:48: error: 'addr' undeclared (first use in this function)
      90 |         if (dma_mapping_error(dev->dma_device, addr)) {
         |                                                ^~~~
   drivers/infiniband/core/umem_odp.c:90:48: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/infiniband/core/umem_odp.c:57:20: warning: variable 'dma_addr' set but not used [-Wunused-but-set-variable]
      57 |         dma_addr_t dma_addr;
         |                    ^~~~~~~~


vim +/addr +90 drivers/infiniband/core/umem_odp.c

    49	
    50	static inline int ib_init_umem_odp(struct ib_umem_odp *umem_odp,
    51					   const struct mmu_interval_notifier_ops *ops)
    52	{
    53		struct ib_device *dev = umem_odp->umem.ibdev;
    54		size_t page_size = 1UL << umem_odp->page_shift;
    55		unsigned long start, end;
    56		size_t ndmas, npfns;
  > 57		dma_addr_t dma_addr;
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
