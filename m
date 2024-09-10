Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E591CAB9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 00:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725927553; cv=none; b=Xfg6XHZV/6AuBMfznT21VrIM4JvANT5ZbDbyMAj1uO2TSieRyPxIG97sP+WgXM28xaHEgnuEuMZPn36rf40v5UGM2rmlb1KLv7kzwpSl+tqVO7g5tI05IBdlGAkn348VHM/QPQmwe2wpXHEcpXiIBnUBt6Sb9Gh6v4LROLg/ICg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725927553; c=relaxed/simple;
	bh=enVFUikH3z7HxbzlYHSRqjWg5ymoPNonfQKoStsXJj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rJt119yUBAztA3Eo1hwwEUcxSg69e6pw813+a2pmAfbSFFVIRS8EOf0J+At89MVBX5Q3VSy/Nvhpxlligj/tmZXNTbQfcrZ2aUMdm1pY0MeUXD6eXdhh93gxedpHGh7XHvPsGvImNFIl8HoluwoLseRklS6cLjA1QeWshj2oYcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B96FO78G; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B96FO78G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725927551; x=1757463551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=enVFUikH3z7HxbzlYHSRqjWg5ymoPNonfQKoStsXJj4=;
  b=B96FO78GTkhC9cojG6X+LfWtpmfxtZL4IDtVoemtXQy5EaYOSLfh0C4/
   7G0MH6iafRiYxIMuinWm8jdApiuL1AwQkjazq1EzciWQyre2Lm8GHSr4k
   Y0vGPiBxTFCK+m0z8aQnCs4ExR/c/cD283zOSY5ZEI4QefeC+g3utjwEx
   u8ugGtcG8fRWaduU7XiWyz3DI3bBwBygX4x7xHV5uzyLqYuzFEaxcLV3a
   di1HGOtuN0glU3GegTCAzcdLbLyubyTtTnGseiZeOfYgliPmVjxBYMvlz
   nFnXZJrVMGoQeTKMHjK1rAEm2QqsHFqSsE1yB/zrvczezvHeaXpdi4xR2
   w==;
X-CSE-ConnectionGUID: OlE4GeXbSi+yO51vunn4Nw==
X-CSE-MsgGUID: Pe7cBezHRw+sP90TQgdnzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35247605"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="35247605"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 17:19:11 -0700
X-CSE-ConnectionGUID: CVNHas+QT2+ynGcbrpIrbA==
X-CSE-MsgGUID: /KAsmE57QhyYNCDUpg2R5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67100145"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2024 17:19:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snob5-000FNa-2U;
	Tue, 10 Sep 2024 00:19:07 +0000
Date: Tue, 10 Sep 2024 08:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rebase 814/1087]
 drivers/cache/ax45mp_cache.c:141:6: warning: no previous prototype for
 function 'arch_sync_dma_for_device'
Message-ID: <202409100820.fv9yNzHt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rebase
head:   1a87c1b75e38aa1407f0b0d1b1d9b57bed4ae652
commit: 7cf15c8a5f74e1a61f26884a20e9b08798ae5898 [814/1087] cache: ax45mp_cache: Add non coherent support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240910/202409100820.fv9yNzHt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100820.fv9yNzHt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100820.fv9yNzHt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cache/ax45mp_cache.c:141:6: warning: no previous prototype for function 'arch_sync_dma_for_device' [-Wmissing-prototypes]
     141 | void arch_sync_dma_for_device(phys_addr_t paddr,
         |      ^
   drivers/cache/ax45mp_cache.c:141:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     141 | void arch_sync_dma_for_device(phys_addr_t paddr,
         | ^
         | static 
>> drivers/cache/ax45mp_cache.c:165:6: warning: no previous prototype for function 'arch_sync_dma_for_cpu' [-Wmissing-prototypes]
     165 | void arch_sync_dma_for_cpu(phys_addr_t paddr,
         |      ^
   drivers/cache/ax45mp_cache.c:165:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     165 | void arch_sync_dma_for_cpu(phys_addr_t paddr,
         | ^
         | static 
>> drivers/cache/ax45mp_cache.c:183:6: warning: no previous prototype for function 'arch_setup_dma_ops' [-Wmissing-prototypes]
     183 | void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
         |      ^
   drivers/cache/ax45mp_cache.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     183 | void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
         | ^
         | static 
   3 warnings generated.


vim +/arch_sync_dma_for_device +141 drivers/cache/ax45mp_cache.c

   140	
 > 141	void arch_sync_dma_for_device(phys_addr_t paddr,
   142				      size_t size, enum dma_data_direction dir)
   143	{
   144		switch (dir) {
   145		case DMA_TO_DEVICE:
   146			ax45mp_dma_cache_wback(paddr, size);
   147			break;
   148	
   149		case DMA_FROM_DEVICE:
   150			fallthrough;
   151	
   152		case DMA_BIDIRECTIONAL:
   153			/* Skip the invalidate here if it's done later */
   154			if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU))
   155				ax45mp_dma_cache_wback(paddr, size);
   156			else
   157				ax45mp_dma_cache_wback_inv(paddr, size);
   158			break;
   159	
   160		default:
   161			break;
   162		}
   163	}
   164	
 > 165	void arch_sync_dma_for_cpu(phys_addr_t paddr,
   166				   size_t size, enum dma_data_direction dir)
   167	{
   168		switch (dir) {
   169		case DMA_TO_DEVICE:
   170			break;
   171	
   172		case DMA_FROM_DEVICE:
   173		case DMA_BIDIRECTIONAL:
   174			/* FROM_DEVICE invalidate needed if speculative CPU prefetch only */
   175			ax45mp_dma_cache_inv(paddr, size);
   176			break;
   177	
   178		default:
   179			break;
   180		}
   181	}
   182	
 > 183	void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
   184				const struct iommu_ops *iommu, bool coherent)
   185	{
   186		dev->dma_coherent = coherent;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
