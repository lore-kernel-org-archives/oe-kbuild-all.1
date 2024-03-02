Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6AA12B83
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 08:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709366947; cv=none; b=MbPOuJ+JVou4xnm7d5y6M3yQLlCq5VroxRhgjp52JrQ8SOG/exBWPuAkxLrE5RjWw6AbU0Ce3pQlaNjVAA1/ihcIH2dAByM2LRYUatXjcv9VHhdxLed1taAukweemPdvnviuUToyRLie1axzf8IGyCyjwtFhCaiAu79Fc82Eksc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709366947; c=relaxed/simple;
	bh=Cqq23E4Fp6Uewhupjgib4lLdgnH1Ko3044JxGsmJHFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWvikgTJI5t8tB/o6iKJsKcmKnlG3nJF3tss6oN5C5ZqkF0tGqEesSPFHjNxt+Kaw4uCF6rKf5xEv1/AE1TDqofDfkbHGlzhXDPOdjUiMLxWnIt8hInba7OHA62JPfUVso/nQuh3iRPXaMQvlBHfySQHZMBl5IaHZWwxhqps6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXfMHk3s; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXfMHk3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709366945; x=1740902945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cqq23E4Fp6Uewhupjgib4lLdgnH1Ko3044JxGsmJHFc=;
  b=ZXfMHk3su35xJ9DCSIswZk5Ei2kLKODh6ZF1rhiqBg+c+FBur9jlRpUM
   LCU8lswcnVg7fbY6RgppsuyYM3BVHZSaX3JWYHWQbOrpE6zWdGa2oGd2P
   M04zbTxZpBgpWSEEvydTZd4ZwbgUUSvwDfzNoSc2XIdf6ElCMvYh8vG2C
   62CU9VCldRbwfekG2hnCZCedH+EM7taON8yPXjB479+rMIFI6OO/xcgXS
   y2fyZgV6tTj3xdV1UGHU6qxGAdd2ytjyk4qYH3G/y1yZ8V5+BxiDf7WhM
   0QSvldYN7CIAUfFJHOnK0kfvwX0ldcEGEmSL5OnaVjds0GPgXt3nk35H5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7727281"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="7727281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 00:09:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="13129381"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2024 00:09:03 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgKQX-000ERd-0F;
	Sat, 02 Mar 2024 08:09:01 +0000
Date: Sat, 2 Mar 2024 16:08:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 780/3767] arch/loongarch/kernel/dma.c:37:42:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202403021652.crccT6al-lkp@intel.com>
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
commit: 90d2bbc1ade2216bda17fb582a1aaabf7567478f [780/3767] LoongArch: use arch specific phys_to_dma
config: loongarch-randconfig-r112-20240302 (https://download.01.org/0day-ci/archive/20240302/202403021652.crccT6al-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240302/202403021652.crccT6al-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021652.crccT6al-lkp@intel.com/

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
