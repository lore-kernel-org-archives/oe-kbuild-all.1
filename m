Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B331C2309
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730743955; cv=none; b=WfABSjqLeunIyeP8PDPw2rjl/qG+WFxHYc/1y4H5pCvcvB/MSBXMaYQy2YJY78yNlReqCO5fnHQJXa15kHZoA8c2fiY/18J/3DXqhxkVhqzKfEmukquHaTy7qE3Io+5WhV2xuWTgJiM0i2KZEUC3YvVnkTiBVN9hXkB3snsEjBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730743955; c=relaxed/simple;
	bh=HgmLtpoaraIg2BsEfE/hXotFrAKmh8DqvByjzkRG7EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bvHlibpVN5KWFpYSeHoxL+1hr5v4P44CmckETS1Tmhib8T1q3Y8KkprN4semgNxACGiPlcsaIRBRzsse6EmnTCraIoDn7OMIzsOZwFxWhOXheWZacMlLlXK6yY/Al7PRkOBP8gcLvsf5MdBFYnL6OQ0rWflgDuIIMHBc9RWQuOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXjYTxNj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXjYTxNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730743955; x=1762279955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HgmLtpoaraIg2BsEfE/hXotFrAKmh8DqvByjzkRG7EQ=;
  b=IXjYTxNjqGW8dDf4BGwW5fSZLhZrDeUqb+EOunKUcwUf17srUuPhNrKY
   Ne91+N7Pobm91H8BKxro8C8j8E8ttRbmyEf7mZjjg55I2FoWFPgOtk7Ck
   nZT+Pv1gYJGxrqoWpJfyx87Ie9zLQhB9GDlycgKiFJZxuLsevIGqEgWPM
   zTxV0eC0M02ZZJ2qtJrurz1YN1XgQJEDScJFfy8UjAcqMgnjm/dnYGMkN
   /aG48aa7zHn62FN/CwFhrGYzB+0aLSAgjIShCoUEfQse9/AzeZ7bZc3Yr
   8Urphz8ef0XA96hgJK/KXaKBohyuAuFBXF/zaxkPlukTjQXk1pAdMLaUS
   A==;
X-CSE-ConnectionGUID: rAr6CffkStKyxbseCzrlVg==
X-CSE-MsgGUID: uouHrhwtQ3KUJfIRAn+nFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30309147"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30309147"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 10:12:33 -0800
X-CSE-ConnectionGUID: Kk9qomXqT3W0AWkosjq07w==
X-CSE-MsgGUID: dA4sPxxYThmYggLBQUCtkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="87670861"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 10:12:29 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t81Yx-000l6p-0V;
	Mon, 04 Nov 2024 18:12:27 +0000
Date: Tue, 5 Nov 2024 02:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 kernel/dma/mapping.c:557:29: sparse: sparse: macro "alloc_pages" passed 5
 arguments, but takes just 2
Message-ID: <202411050256.EOjqyl5Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 0764432a5ada7a09ce36b0e980ec40340fae2a30 [1/1] dma-mapping: add a new dma_alloc_pages API
config: x86_64-randconfig-121-20241028 (https://download.01.org/0day-ci/archive/20241105/202411050256.EOjqyl5Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050256.EOjqyl5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050256.EOjqyl5Z-lkp@intel.com/

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
