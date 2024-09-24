Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769F818D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 01:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727140198; cv=none; b=ZRpYp5myyGUe9p9Gv/zwV0FdYRtajY1uRa0M0HKoW65HLGjt14RXBbGt1xhqeenyI5cKHY4o5yv7wDRGDIqA6Yxb3No3FdcTt042loHj3ElZQuPbe70faDbhTYSHErZioVjlZZ2HauY+ijbTPsrCJ4AuEMedLTGabu5gbiG/vZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727140198; c=relaxed/simple;
	bh=zGYvZljthCA1qnUBKZqpkFlUowWVQ0Ujn9tZalVnIcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P+nLvuWUMdvbQvYimvHvMwmkK7ECmHJzb7HgkZGUJcVG1vwZam19vJEK0qiX80SP3LvZxPQJV4m78b0/NZYRA5b7MwApcbmilh34/XiNNjkiXFnE9ytlbo7pYi3AeLBJdeOHLkCQEvy561UKc9zbxf5ZmqGlEJ/z5j3WJrch/v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWX/RV/8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWX/RV/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727140196; x=1758676196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGYvZljthCA1qnUBKZqpkFlUowWVQ0Ujn9tZalVnIcw=;
  b=WWX/RV/8TTO4Yu9I1cAt7K07D8hnOYoZ39jqJVnjLDW+gY7GaCOsgHtr
   kYYjtzNaDeQloQIQeQfVndqdXwpEVGYTqzJCz+i1DMvWqqzuCbBbZWihU
   Dqm8Uc2j7c0HhXH0L1ZI/puk2+mTabJFLdZUwOJi3KgW4Yhgie7V8+NTQ
   s1ZgisIW/X8vy2uHsDXnYsSBTNe6JP8XouRUUn9nkbfAKeXnEnsU4u/6f
   l/AHy2JgF2GCDg/IPyBjiDgz10mqYWxpo57XNPW6MRfFwUjnF3G3m5jnC
   bRMVMn1XWdigGGezCXkUjfvFRYefa2XlaVBc+3X1IrLdOnuOxcl6lIgmU
   g==;
X-CSE-ConnectionGUID: Kz7GwO11QU2/eZkQ5LoyHQ==
X-CSE-MsgGUID: S/Ma1Lh4Q5OwKgLvPvvJBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37479255"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="37479255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 18:09:55 -0700
X-CSE-ConnectionGUID: XjHB3NmhTieToZcTSTFTwQ==
X-CSE-MsgGUID: Rm1qnDEoTZG4elkNjdWbVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="71292998"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Sep 2024 18:09:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssu3p-000HlR-2j;
	Tue, 24 Sep 2024 01:09:49 +0000
Date: Tue, 24 Sep 2024 09:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1010/2441]
 kernel/dma/mapping.c:557:72: error: macro "alloc_pages" passed 5 arguments,
 but takes just 2
Message-ID: <202409240901.O2by61Zq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 0764432a5ada7a09ce36b0e980ec40340fae2a30 [1010/2441] dma-mapping: add a new dma_alloc_pages API
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240924/202409240901.O2by61Zq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240901.O2by61Zq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240901.O2by61Zq-lkp@intel.com/

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
