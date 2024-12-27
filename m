Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB9B13C807
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 21:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735336010; cv=none; b=FJguNUbrSc0cukdpOIPn4JmWHmd/TPi482zL9j1RE5kN2K4XkS1yzDfFfdQ5Re1yx+gHhnjeoHNHjOivulAHYXKG1Y8LLXN9n+T1me2VbRTxF7kzXnmKbSiQOD8rAfzOmHMkHDsYh0H/f4/7/EGDYPKO6nFELSkspDLhFdpl6HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735336010; c=relaxed/simple;
	bh=luOgGwpW/x5POE9qZJbkC2PLVxkXrV3gOL18yuiaX7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AMqxmgLb8/sCoTNfeKX4yTCyNNdMPjDO3FfU3a7rVT85buliYI5yz0kmgcHUy9Asu62Ng6qbsHpnmlrQSPjVgGcNZC/Ch+e7bkU4+3ZcoNGMZszt97VsA5qbbK3wAwAeSqUXt0fCPoDD4uEg4/2PvSx7oFsWlaD26AibzNETDLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0Cf3y2C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0Cf3y2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735336009; x=1766872009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=luOgGwpW/x5POE9qZJbkC2PLVxkXrV3gOL18yuiaX7U=;
  b=H0Cf3y2CiKuQDLD4JDUSgLw4CUBvWWfR31ZdsaNDz/+RDvcHPZzIOxox
   XRxVH3kxht4RzIaNo3KzU9VMHFyKflN/UjWSkqU0NumNLGBr0NbamR9Om
   n0siCQLmparXzWV4TeL714v9PyNGKz+KBqTJPznYZJreU78E6fX9u+mqF
   fSBRZnhGX5LNfNgcvpMEJi2mbDpyHyElBWuDagIvQNPpYpu7+jAN981lS
   bWlOM1H8JD29Kau5Mb+ZZcF/hDiuNa4a18iF8djdb+i6w2/DHdsjITpVT
   u9+mNfQUKribB6l150w+7bt9skyl3q+6ejB/DrT0y3Uo8x5fBR9SC2nG+
   w==;
X-CSE-ConnectionGUID: kFkXefLRT0yZw0u7oiwp/Q==
X-CSE-MsgGUID: wMGgb1p9S4iPUnlYmcipfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39417693"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="39417693"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 13:46:49 -0800
X-CSE-ConnectionGUID: ye0R11zpQCW45djz69JhUA==
X-CSE-MsgGUID: kaXCJ84BSBWQiwY9J2WZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="105217382"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Dec 2024 13:46:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRIAP-0003ec-0P;
	Fri, 27 Dec 2024 21:46:45 +0000
Date: Sat, 28 Dec 2024 05:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1662/1662]
 arch/x86/kernel/zhaoxin_kh40000.c:155:26: sparse: sparse: symbol
 'kh40000_dma_direct_ops' was not declared. Should it be static?
Message-ID: <202412280553.DYoAL68M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e53a23ef21aa9859c864e7c4bb6ecde5269f54b6
commit: 11557c1ae4529f133483879b7ee00b7d8c653be7 [1662/1662] x86/cpu/zhaoxin: Encapsulate access to kh40000_dma_direct_ops within function
config: x86_64-randconfig-123-20241226 (https://download.01.org/0day-ci/archive/20241228/202412280553.DYoAL68M-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280553.DYoAL68M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280553.DYoAL68M-lkp@intel.com/

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
