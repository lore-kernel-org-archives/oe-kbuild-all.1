Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647E2110E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 01:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731894226; cv=none; b=TYnbxWAhF9O01kH4ytOU+OgzwoIXx17ffc3nWXA9lOk93wwlmsYkTnB8m2tVnr16AXhAQq75kPa1y46yITO8ell+Q42wM+r+KMV8gcbh6eg571x7/5oMkCXFQF5h/g6S1nOk5+/cUcp8ATFSM4XwF8sdkhfBzVwjOtY4QWN4gIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731894226; c=relaxed/simple;
	bh=oEly5aS3JKZsGwDiNPUBC3yvDCxQziaRV1KPIMevBfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HW8d7sUK6hn+CoeiQzcVFXtqkhLxzDjkmIgQ2TuU3C0yTz2gKXOHcR7ZWSB7SgesA7NZWgsvccsB3WsEALcU95iAVBUIM5wUimZJTGEW6tZ5KEGO4N8RnFqeSnDwOu0NE14UG4lO+kdSmlZxtzDtM8BD5/eu+tzH7qXTzBha5Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=codksueQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="codksueQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731894225; x=1763430225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oEly5aS3JKZsGwDiNPUBC3yvDCxQziaRV1KPIMevBfo=;
  b=codksueQ1YHsrHQzZgPS/vGbdjnIyHozUCdkTcgPdhQFvYtND8xdamEr
   0Z+/1gd6JgxegISXvwYJQvPSsqpLN+hubE5E+GBZw4gLCP1Dv3tSb6+kv
   BP6k5PpFrvAkXazTpZkZIx51+3deKgsEI85oR3OSw4gghjxEJJ4GodfUN
   7zBaKhpKzanSpAqLlUi0o5zT2YiudIsNk7mPsPwaxOrGWDdR4TmVYhaO4
   /Q3GfN+B8JwKn7+jbLF1g/IY7KdK0GfDYO51ttb4EdMgVnIkRqGbxhQNs
   i52r3nJzl18PqUOxs7m5EYM6kCu11aqj43Gx4xJFMLWJfNyW7a7DVJ38Q
   A==;
X-CSE-ConnectionGUID: qxjsMPqfTWyAz7v67wb3vg==
X-CSE-MsgGUID: FfMF9tFJRYyNirT10z8UZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42465511"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="42465511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:43:42 -0800
X-CSE-ConnectionGUID: //B2SZMJRQGLwBzAAKSsVQ==
X-CSE-MsgGUID: n3tRNuZKRjOWWLWjMF81Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="94010379"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2024 17:43:41 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCqni-0002Bx-1W;
	Mon, 18 Nov 2024 01:43:38 +0000
Date: Mon, 18 Nov 2024 09:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 arch/x86/kernel/zhaoxin_kh40000.c:155:26: sparse: sparse: symbol
 'kh40000_dma_direct_ops' was not declared. Should it be static?
Message-ID: <202411180946.SYMUTUAQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: 11557c1ae4529f133483879b7ee00b7d8c653be7 [1474/1474] x86/cpu/zhaoxin: Encapsulate access to kh40000_dma_direct_ops within function
config: x86_64-randconfig-123-20241118 (https://download.01.org/0day-ci/archive/20241118/202411180946.SYMUTUAQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180946.SYMUTUAQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180946.SYMUTUAQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/zhaoxin_kh40000.c:33:15: sparse: sparse: symbol 'zhaoxin_patch_code' was not declared. Should it be static?
>> arch/x86/kernel/zhaoxin_kh40000.c:155:26: sparse: sparse: symbol 'kh40000_dma_direct_ops' was not declared. Should it be static?
   arch/x86/kernel/zhaoxin_kh40000.c:325:26: sparse: sparse: symbol 'kh40000_dma_iommu_ops' was not declared. Should it be static?

vim +/kh40000_dma_direct_ops +155 arch/x86/kernel/zhaoxin_kh40000.c

4332dbb0718135 leoliu-oc 2024-05-13  154  
4332dbb0718135 leoliu-oc 2024-05-13 @155  const struct dma_map_ops kh40000_dma_direct_ops = {
4332dbb0718135 leoliu-oc 2024-05-13  156  	.flags			= DMA_F_PCI_P2PDMA_SUPPORTED,
4332dbb0718135 leoliu-oc 2024-05-13  157  	.alloc			= kh40000_dma_direct_alloc,
4332dbb0718135 leoliu-oc 2024-05-13  158  	.sync_sg_for_cpu	= kh40000_dma_direct_sync_sg_for_cpu,
4332dbb0718135 leoliu-oc 2024-05-13  159  	.unmap_page		= kh40000_dma_direct_unmap_page,
4332dbb0718135 leoliu-oc 2024-05-13  160  	.sync_single_for_cpu	= kh40000_dma_direct_sync_single_for_cpu,
4332dbb0718135 leoliu-oc 2024-05-13  161  	.unmap_sg		= kh40000_dma_direct_unmap_sg,
4332dbb0718135 leoliu-oc 2024-05-13  162  	.unmap_resource		= kh40000_dma_direct_unmap_resource,
4332dbb0718135 leoliu-oc 2024-05-13  163  	.dma_supported		= dma_direct_supported,
4332dbb0718135 leoliu-oc 2024-05-13  164  	.free			= dma_direct_free,
4332dbb0718135 leoliu-oc 2024-05-13  165  	.alloc_pages		= dma_direct_alloc_pages,
4332dbb0718135 leoliu-oc 2024-05-13  166  	.free_pages		= dma_direct_free_pages,
4332dbb0718135 leoliu-oc 2024-05-13  167  	.sync_single_for_device	= dma_direct_sync_single_for_device,
4332dbb0718135 leoliu-oc 2024-05-13  168  	.sync_sg_for_device	= dma_direct_sync_sg_for_device,
4332dbb0718135 leoliu-oc 2024-05-13  169  	.get_required_mask	= dma_direct_get_required_mask,
4332dbb0718135 leoliu-oc 2024-05-13  170  	.max_mapping_size	= dma_direct_max_mapping_size,
4332dbb0718135 leoliu-oc 2024-05-13  171  	.mmap			= dma_direct_mmap,
4332dbb0718135 leoliu-oc 2024-05-13  172  	.get_sgtable		= dma_direct_get_sgtable,
4332dbb0718135 leoliu-oc 2024-05-13  173  	.map_page		= dma_direct_map_page,
4332dbb0718135 leoliu-oc 2024-05-13  174  	.map_sg			= dma_direct_map_sg,
4332dbb0718135 leoliu-oc 2024-05-13  175  	.map_resource		= dma_direct_map_resource,
4332dbb0718135 leoliu-oc 2024-05-13  176  };
ef20808db09987 leoliu-oc 2024-03-22  177  

:::::: The code at line 155 was first introduced by commit
:::::: 4332dbb07181359cccca3ba757ef54e434fb1296 Add kh40000_direct_dma_ops for KH-40000 platform

:::::: TO: leoliu-oc <leoliu-oc@zhaoxin.com>
:::::: CC: leoliu-oc <leoliu-oc@zhaoxin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
