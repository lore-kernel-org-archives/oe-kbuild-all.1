Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856E2BB12
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709402759; cv=none; b=aE3AbA8tO086In5P6bJuvwDujQwmKOYSAYKwwdzcihUbQd16MvjeZ08J81RujI+EQ1pVhuRXVbmFzn0qalkNijADF97sXBLJtjyB2TmOp9q1dngOph7aRId6Ho+f+baH6zqf+88JhELh5iBm1AnuA24duf/WDion52WlJmqJgK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709402759; c=relaxed/simple;
	bh=FItxO4Gzn9C4zkOxZ8RUqQLHe3bEGYUL4by8AAL31lU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F+OwJ5uelt0yVkgIDpd18Nfy8OiwtZ8gJji645/GANSN7e3MDkOiIZ9iuXk3vo65Lxdan0OolrOGGRjN5GMIaMWHd8si3wk4Wo/SZ1mqOvMVnfL2gyj2znwdPySvfKtLPxDVR3fjbNyQXvCc0JwwTbRs73Mu09A7tKjTXMizyX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZzZxM4e; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZzZxM4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709402758; x=1740938758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FItxO4Gzn9C4zkOxZ8RUqQLHe3bEGYUL4by8AAL31lU=;
  b=kZzZxM4eDnJWBgJV8UtcMW29X2hWQagwQg4dEc/CxwDpUhF0bTKeDAat
   4RhTXUK13ALE4nq3ZB6DW32Ithx1WpqMW79hI57ye6lcywzV2xUHP7N1L
   0NqebB40Fgx714q8cnqz/2/YoJ/UfsFoXnENOlconlUcar5tSVFbS3lH2
   7pL5COH1R/mqPjy8R7hJkvCfc+sZ6vvDpHTOdUrIqt3qPiVCdmJXLZgxY
   LXLj10YilPWZmd6KKasNkFiJZP5wKy1QL8PSyuAnGPdoI3+94JB0u1cRP
   8pu6KqLq1XWd7whbmV2Hu0nOPrJzH9X54ijNN5ipB1bSyTGSZMhcfCqIz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14642546"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="14642546"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 10:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8753780"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Mar 2024 10:05:56 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgTk9-0000D5-2t;
	Sat, 02 Mar 2024 18:05:53 +0000
Date: Sun, 3 Mar 2024 02:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 780/3769] arch/loongarch/kernel/dma.c:37:42:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202403030238.Vu4FjlZ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fbcd4a3032a53350f6d182c9daeaa4c46e65d964
commit: 90d2bbc1ade2216bda17fb582a1aaabf7567478f [780/3769] LoongArch: use arch specific phys_to_dma
config: loongarch-randconfig-r112-20240302 (https://download.01.org/0day-ci/archive/20240303/202403030238.Vu4FjlZ9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240303/202403030238.Vu4FjlZ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030238.Vu4FjlZ9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/dma.c:37:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void volatile * @@
   arch/loongarch/kernel/dma.c:37:42: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/loongarch/kernel/dma.c:37:42: sparse:     got void volatile *

vim +37 arch/loongarch/kernel/dma.c

    29	
    30	void acpi_arch_dma_setup(struct device *dev)
    31	{
    32		int ret;
    33		u64 mask, end = 0;
    34		const struct bus_dma_region *map = NULL;
    35	
    36		if (node_id_offset == 0) {
  > 37			node_id_offset = ((readl(LS7A_DMA_CFG) & LS7A_DMA_NODE_MASK) >> LS7A_DMA_NODE_SHF);
    38			node_id_offset += 36;
    39		}
    40	
    41		ret = acpi_dma_get_range(dev, &map);
    42		if (!ret && map) {
    43			const struct bus_dma_region *r = map;
    44	
    45			for (end = 0; r->size; r++) {
    46				if (r->dma_start + r->size - 1 > end)
    47					end = r->dma_start + r->size - 1;
    48			}
    49	
    50			mask = DMA_BIT_MASK(ilog2(end) + 1);
    51			dev->bus_dma_limit = end;
    52			dev->dma_range_map = map;
    53			dev->coherent_dma_mask = min(dev->coherent_dma_mask, mask);
    54			*dev->dma_mask = min(*dev->dma_mask, mask);
    55		}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
