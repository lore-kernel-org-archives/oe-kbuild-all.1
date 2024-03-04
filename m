Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8D78B65
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 19:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709580750; cv=none; b=YK0m0zhp1KwOrUS2Zix7Iic1YgELjhnYUdhZfP/lCFzYfD5crGWlPRuSEh8O5GUdCtgJM8q7SqgCxnq/WPsoGbwixCnmzHZlQ9mz/c3yyeLVUQ8YL0+8QPF3RO8cY1YWypd6Tn1bywXpw5ITFEm0aOw//yswcwTbHFOafeukC7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709580750; c=relaxed/simple;
	bh=YxiS70sYrKl/Iq2UYvIPLKwc7eBjA9Fuj9yTL4liZDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVEzAq4iE5sag/6cC8JoYaVmzJTZc2hVVw9N4k+hDUUye4mNgA6IgRV+3O2QidPFf7u/fdVXvnBpDM07z8aXpUpU8WebbeSMk4VH7xCftWTQ8BbKFt6e8j1LT30UulgeV+c1DQ+ug1DSyWZacg50N1L8qzHS057HT40Q6EJAd44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnTcypkn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnTcypkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709580748; x=1741116748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxiS70sYrKl/Iq2UYvIPLKwc7eBjA9Fuj9yTL4liZDg=;
  b=LnTcypknSsFRdd6O8TTZ+b/uPRCn8RH6q2qBggsC4SjdNXJO7faFqLeS
   3k9R79gEvWJVgIMdXWDvYMDAVNJLwIYMbbiQIqdmSCRNIf6l5ZaH6d7se
   MCPfey55b5XBv4/EJqiDW8b4pFPFxrYcceIeHz18HHVx+aiDa1WT1oLZw
   Wzoo6cP8XENRVvCLqnWMOBFCsjQf2jmW2tnI4DgQ1g5JAT5vzY59XoeZg
   9ZrKk6gEfivVwchkr+9jFSbmxpSZDmzPeWj0vAPnSZVlW7mBQyBrclmgq
   kAee/mZbRrfp5TQyARgsmPtnGtZ23GvvDrs51GpwHvWNlG06ZYCPfLr3G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3955621"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3955621"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:32:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9171385"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2024 11:32:20 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhE2r-0002ij-1j;
	Mon, 04 Mar 2024 19:32:17 +0000
Date: Tue, 5 Mar 2024 03:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/dma/mapping.c:557:72: error: macro "alloc_pages" passed 5
 arguments, but takes just 2
Message-ID: <202403050319.7PDSeiav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 7bf38ec8bc7226fa384ae9f39ed8e1e2465b7b1a dma-mapping: add a new dma_alloc_pages API
date:   9 months ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240305/202403050319.7PDSeiav-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050319.7PDSeiav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050319.7PDSeiav-lkp@intel.com/

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
   include/linux/gfp.h:540: note: macro "alloc_pages" defined here
     540 | #define alloc_pages(gfp_mask, order) \
         | 
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
