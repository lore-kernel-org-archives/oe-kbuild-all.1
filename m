Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6562EEB3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787636075; cv=none; b=GvD1z4XEJG0OoEBIex6clesZgpFizaZDa3wgzK4tZeO7nLx48EYPOCrZwJ6BDmtTeFvulepOK4H+TJl1NuEuRfNfylC1P+A4mKDg2/GInF4dAWMhAi5i6etFoAmjCBa+kGItdUrUeLPkHeOi9SQrZvbHudJx+Sdi4nnmYh1x/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787636075; c=relaxed/simple;
	bh=updYvxowtwN3mM8fMPA3lejK5dlTZzCw5iAixjL2/+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KIjGo4+DSf79L7b6i5omqrtsjhcEX5yBPBdhYlJ9v05KUGmkLLo9hNXyf35UTY2SmKjLiaoG7ApXZDlkFQZbUAmuguuBfMxUyHzr3RruRaQU72vL5yTeRhvWDGhpVkC/VrbNiRClFTRpCkDI6geUqedj87qM0hcPAlsndWMVqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8xXxWJR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8xXxWJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787636073; x=1819172073;
  h=date:from:to:cc:subject:message-id;
  bh=updYvxowtwN3mM8fMPA3lejK5dlTZzCw5iAixjL2/+o=;
  b=e8xXxWJRRnugvXEzYLuOgUwQWZ4diEDspEmx1gL0BqRnhizZIRlaAyvf
   ark/jR7HpchS1wJ8fzOyT1LJlf1M+vcrRj0p1iQGyWFBmqdFgEoDmJhm5
   DRtB/oGQRaccVjLKutECBB/vHis24Z3WOl9g4gNR71Ww6s7gOeMA7JKpN
   /ElRu+zWUEQ08PNoADk95tzQ1V9UWUtjSeVEesq2FGCOiMP8EiuqQgS/h
   PdH28R5JR8cQs9wRlHIRXeRXMHmjbq9SkTbWd87WfImgKztzpyy5xgYbd
   NkRkNivBsVgC11/8AdKPxZcigxQmkGAmW/NM3Yf2+4e7xB6VOLqY78ndr
   A==;
X-CSE-ConnectionGUID: fHp7n5DHTie/qGEL60Hiiw==
X-CSE-MsgGUID: Y/QXiWwVQBexIfdfeRMJqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87222638"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="87222638"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 22:34:31 -0700
X-CSE-ConnectionGUID: X34xj7isTLycg5wjD5H0rg==
X-CSE-MsgGUID: vXubZPsDRc2tO/6RI7f+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="262883585"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Aug 2026 22:34:30 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyjnn-0000000053L-39Gf;
	Tue, 25 Aug 2026 05:34:27 +0000
Date: Tue, 25 Aug 2026 13:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/020-dart 4/20]
 drivers/iommu/apple-dart.c:851:54: warning: left shift count >= width of type
Message-ID: <202608251306.uDBzdkWI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   45b2aa771c5241177bad6c3f1777bb34871aa5ef
commit: 679ee8da9f5f0497de57348d1c60a8a856f411b2 [4/20] iommu: apple-dart: Support specifying the DMA aperture in the DT
config: i386-buildonly-randconfig-006-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251306.uDBzdkWI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251306.uDBzdkWI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251306.uDBzdkWI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/apple-dart.c: In function 'apple_dart_of_xlate':
>> drivers/iommu/apple-dart.c:851:54: warning: left shift count >= width of type [-Wshift-count-overflow]
     851 |                 dma_min = ((dma_addr_t)args->args[1] << 32) | args->args[2];
         |                                                      ^~
   drivers/iommu/apple-dart.c:852:62: warning: left shift count >= width of type [-Wshift-count-overflow]
     852 |                 dma_addr_t size = ((dma_addr_t)args->args[3] << 32) | args->args[4];
         |                                                              ^~


vim +851 drivers/iommu/apple-dart.c

   831	
   832	static int apple_dart_of_xlate(struct device *dev,
   833				       const struct of_phandle_args *args)
   834	{
   835		struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
   836		struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
   837		struct apple_dart *dart = platform_get_drvdata(iommu_pdev);
   838		struct apple_dart *cfg_dart;
   839		dma_addr_t dma_max = DMA_BIT_MASK(dart->ias);
   840		dma_addr_t dma_min = 0;
   841		int i, sid;
   842	
   843		put_device(&iommu_pdev->dev);
   844	
   845		if (args->args_count != 1 && args->args_count != 5)
   846			return -EINVAL;
   847	
   848		sid = args->args[0];
   849	
   850		if (args->args_count == 5) {
 > 851			dma_min = ((dma_addr_t)args->args[1] << 32) | args->args[2];
   852			dma_addr_t size = ((dma_addr_t)args->args[3] << 32) | args->args[4];
   853			if (!(IS_ALIGNED(dma_min, dart->pgsize) || !IS_ALIGNED(size, dart->pgsize))) {
   854				dev_err(dev, "Unaligned DMA window %pad..%pad for page size 0x%x\n",
   855					&dma_min, &size, dart->pgsize);
   856				return -EINVAL;
   857			}
   858			dma_max = dma_min + size - 1;
   859			/*
   860			 * Ensure that the DMA window does not exceed the dart's ias.
   861			 */
   862			if ((dma_min ^ dma_max) & ~DMA_BIT_MASK(dart->ias)) {
   863				dev_err(dev, "Invalid DMA window for ias=%d\n",
   864					dart->ias);
   865				return -EINVAL;
   866			}
   867		}
   868	
   869		if (!cfg) {
   870			cfg = kzalloc_obj(*cfg);
   871			if (!cfg)
   872				return -ENOMEM;
   873			/* Will be ANDed with DART capabilities */
   874			cfg->supports_bypass = true;
   875			/* Will be merged with other DARTs to the to fully overlapping range. */
   876			cfg->dma_min = dma_min;
   877			cfg->dma_max = dma_max;
   878		} else {
   879			if (dma_min >= cfg->dma_max || cfg->dma_min >= dma_max) {
   880				dev_err(dev, "non-overlapping DMA windows: %pad..%pad, "
   881					"%pad..%pad\n", &dma_min, &dma_max,
   882					&cfg->dma_min, &cfg->dma_max);
   883				return -EINVAL;
   884			}
   885			cfg->dma_min = max(dma_min, cfg->dma_min);
   886			cfg->dma_max = min(dma_max, cfg->dma_max);
   887		}
   888		dev_iommu_priv_set(dev, cfg);
   889	
   890		cfg_dart = cfg->stream_maps[0].dart;
   891		if (cfg_dart) {
   892			if (cfg_dart->pgsize != dart->pgsize)
   893				return -EINVAL;
   894			if (cfg_dart->ias != dart->ias)
   895				return -EINVAL;
   896		}
   897	
   898		cfg->supports_bypass &= dart->supports_bypass;
   899	
   900		for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
   901			if (cfg->stream_maps[i].dart == dart) {
   902				set_bit(sid, cfg->stream_maps[i].sidmap);
   903				return 0;
   904			}
   905		}
   906		for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
   907			if (!cfg->stream_maps[i].dart) {
   908				cfg->stream_maps[i].dart = dart;
   909				set_bit(sid, cfg->stream_maps[i].sidmap);
   910				return 0;
   911			}
   912		}
   913	
   914		return -EINVAL;
   915	}
   916	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
