Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFAB8475
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 02:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727404377; cv=none; b=fMA6e9IJCKIGt5VucW0Lt1OhAvf7SVzjNf5+EjwdP720gbAHVqCgM4FfDVKiXrkbTjjV6xp25S+NuKEhNVJecRRBzYqOVPzBNF7vAtD6cg/xmXaDeADbMnkJ315zLjDYIE5QfVJ5u9jHUblAiVlxXz5mszl9nBj1wkmKgBE6FpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727404377; c=relaxed/simple;
	bh=yZwi0MclQpaaKnMSC1BvMMFKsCDDpIMiiQzGO6CuH0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+vNjy/9VwnVn6d2cY6A4lNhC2i3ntkM79lFqyKxtbi6nXSKVBrB76H1aWL998IsUBk6YfD+a8fcAPELEKB4Ue8q+3XTGR6UNtGaHh6fUhebBgNVh+w47ctOd6skjK1ViSh/qtp81g7KxollOG8gJPS8dbY8u7a8bxqC/O8Ouq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgTodtpO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgTodtpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727404376; x=1758940376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZwi0MclQpaaKnMSC1BvMMFKsCDDpIMiiQzGO6CuH0U=;
  b=IgTodtpO59stUWyl64A2NByGj4gUNU4SC/hTdCeoUONDWphtIVI0v+GI
   8fGjc0652cnFGl2VpZi8r5XJepQlm4QvEaHHSiSNxqh5FN4vrVSZbD02b
   UtpI0SeHmAU2nV00U3TC1h6YlX1y2P4t19cazKFlOTEe6qBC5orethGXm
   ar+wYD0mdVJYqpilvHtU1R8jEYqwACh7gL+uoZ4gO7myBqsZIxiCKH1Yl
   J0FCp5WyXYjDIrAVYnRRD7u1O0uqXqGol/+XnqCQATGRt/QEF3iO/opFB
   sTKPjLN6FqihTmOpKnWfamvxQ064RJftwgoBQ6VV/TRNNqHjCcKbsP8hD
   w==;
X-CSE-ConnectionGUID: /Sn+vEeARQCxSXfmsWUKcA==
X-CSE-MsgGUID: 15xxjkWCS6yu8jb3mF11rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30251177"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="30251177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 19:32:55 -0700
X-CSE-ConnectionGUID: LDp6Yu3CQZWa+d9JLLtJqA==
X-CSE-MsgGUID: FD1US528RT6bPC7N2XPIXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72797691"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Sep 2024 19:32:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su0mn-000LOF-2H;
	Fri, 27 Sep 2024 02:32:49 +0000
Date: Fri, 27 Sep 2024 10:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1010/2443]
 kernel/dma/mapping.c:557:29: sparse: sparse: macro "alloc_pages" passed 5
 arguments, but takes just 2
Message-ID: <202409271048.s3ChTLGD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   9d665359e14c559b74a94a55057e9c0fbd31a81a
commit: 0764432a5ada7a09ce36b0e980ec40340fae2a30 [1010/2443] dma-mapping: add a new dma_alloc_pages API
config: x86_64-randconfig-122-20240925 (https://download.01.org/0day-ci/archive/20240927/202409271048.s3ChTLGD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271048.s3ChTLGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271048.s3ChTLGD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/dma/mapping.c:557:29: sparse: sparse: macro "alloc_pages" passed 5 arguments, but takes just 2

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
