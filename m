Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E431632CA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732344562; cv=none; b=ZjGW9nbnhy6DNU64mtBlNKsnfSIGZQC1+dG7ixdxN146vWUs6Ay5QuRHN4JLniwsLX71C4BP336tAmoUfmqduvBHzK57yPA9gpqWWId6AerQ+sNT+UnMBoV7tyU3XXUWwMCLQuOHeZtaUnEKhASDD2c4rM5eWfE+gNVkoFoFtZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732344562; c=relaxed/simple;
	bh=gW35Ha7gO4QWdWA4k6QSSsjT4xbUXw7Vsyy31OFPbaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcCqRkE7dLjbvipG+OuLSC5w7RN+prGU9imPvvWlAbAWP7k0r2hqGJ1rXNCPJAx5pG/68tjt+m+LS8nGylnz1eKDd4UQrPclRBCbPynPfk/lPYeFfpZlHBRxBWlsNFCNPkPlp0168ozg2Yk+encM/IBPGUY5yR152OVC/BBbWaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkRRlxyU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkRRlxyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732344559; x=1763880559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gW35Ha7gO4QWdWA4k6QSSsjT4xbUXw7Vsyy31OFPbaI=;
  b=fkRRlxyUFMWBWoA8wuckeu2zsnPQ9kWgCLqFHJWb4FtYdepKXM7GBS+b
   K9SHD/yknXiOp/sud9UzEob7vqaYiRKY/Hr+Zw5DWXTbNRsd+GpAjIwWN
   zp7owaMXBZFxjwkZWhGU7VIppkKkHkdBYUPrtgczrgQUf5C4Ahm4cy3cv
   hmSaFH0vuXVca1V6BeOjKahvQczIwnFwNsHmQN/a5Mrqlq4huuFZFLhib
   YkDzng+fNxLhUT3ZR5zKUI3H/C/358GLTAzc4Yr7fXT89NQymzwgFZtUV
   ubBbYmAOiBb/GTZXz6/PoFcoxJi2lXYKLXCAmIhzGckb1SCeBCKhcMy8O
   Q==;
X-CSE-ConnectionGUID: 24jKmKuRToSV/7THaY7O/Q==
X-CSE-MsgGUID: j65E/chmSa2NOFftkVMXSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43881144"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="43881144"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 22:49:17 -0800
X-CSE-ConnectionGUID: oek+gPJvRvSoSUqK/U46UA==
X-CSE-MsgGUID: 7Y+DKgPuTzuxS8XLpIdJcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="91210467"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Nov 2024 22:49:16 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEjxC-0004Tr-0p;
	Sat, 23 Nov 2024 06:49:14 +0000
Date: Sat, 23 Nov 2024 14:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thangaraj Samynathan <thangaraj.s@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/spi/spi-pci1xxxx.c:373:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202411231439.49BinLEA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a163a4cea153348172e260a0c5b5569103a66a3
commit: 9538edeb72c989a4b90964ae4bba107eaf21a791 spi: mchp-pci1xxxx: DMA support for copying data to and from SPI Buf
date:   10 months ago
config: sh-randconfig-r131-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231439.49BinLEA-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241123/202411231439.49BinLEA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231439.49BinLEA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/spi/spi-pci1xxxx.c:369:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/spi/spi-pci1xxxx.c:369:22: sparse:     expected void *base
   drivers/spi/spi-pci1xxxx.c:369:22: sparse:     got void [noderef] __iomem *
   drivers/spi/spi-pci1xxxx.c:371:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/spi/spi-pci1xxxx.c:371:22: sparse:     expected void *base
   drivers/spi/spi-pci1xxxx.c:371:22: sparse:     got void [noderef] __iomem *
>> drivers/spi/spi-pci1xxxx.c:373:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got void * @@
   drivers/spi/spi-pci1xxxx.c:373:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/spi/spi-pci1xxxx.c:373:9: sparse:     got void *
   drivers/spi/spi-pci1xxxx.c:374:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got void * @@
   drivers/spi/spi-pci1xxxx.c:374:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/spi/spi-pci1xxxx.c:374:9: sparse:     got void *
   drivers/spi/spi-pci1xxxx.c:375:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got void * @@
   drivers/spi/spi-pci1xxxx.c:375:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/spi/spi-pci1xxxx.c:375:9: sparse:     got void *
   drivers/spi/spi-pci1xxxx.c:376:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got void * @@
   drivers/spi/spi-pci1xxxx.c:376:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/spi/spi-pci1xxxx.c:376:9: sparse:     got void *
   drivers/spi/spi-pci1xxxx.c:377:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got void * @@
   drivers/spi/spi-pci1xxxx.c:377:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/spi/spi-pci1xxxx.c:377:9: sparse:     got void *
   drivers/spi/spi-pci1xxxx.c:379:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got void * @@
   drivers/spi/spi-pci1xxxx.c:379:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/spi/spi-pci1xxxx.c:379:9: sparse:     got void *

vim +373 drivers/spi/spi-pci1xxxx.c

   362	
   363	static void pci1xxxx_spi_setup_dma_from_io(struct pci1xxxx_spi_internal *p,
   364						   dma_addr_t dma_addr, u32 len)
   365	{
   366		void *base;
   367	
   368		if (!p->hw_inst)
 > 369			base = p->parent->dma_offset_bar + SPI_DMA_CH0_WR_BASE;
   370		else
   371			base = p->parent->dma_offset_bar + SPI_DMA_CH1_WR_BASE;
   372	
 > 373		writel(DMA_INTR_EN, base + SPI_DMA_CH_CTL1_OFFSET);
   374		writel(len, base + SPI_DMA_CH_XFER_LEN_OFFSET);
   375		writel(lower_32_bits(dma_addr), base + SPI_DMA_CH_DAR_LO_OFFSET);
   376		writel(upper_32_bits(dma_addr), base + SPI_DMA_CH_DAR_HI_OFFSET);
   377		writel(lower_32_bits(SPI_PERI_ADDR_BASE + SPI_MST_RSP_BUF_OFFSET(p->hw_inst)),
   378		       base + SPI_DMA_CH_SAR_LO_OFFSET);
   379		writel(upper_32_bits(SPI_PERI_ADDR_BASE + SPI_MST_RSP_BUF_OFFSET(p->hw_inst)),
   380		       base + SPI_DMA_CH_SAR_HI_OFFSET);
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
