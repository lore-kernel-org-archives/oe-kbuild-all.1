Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A077813C918
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 14:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734876972; cv=none; b=aPHiTdEY+yJDAVVvoyzFauOfnpbqfZ3Co+mpwbjySXd68rzeVAqs3f500VHslTADtnPHMAYF9JrblJd18m8kKIlUF32u44lcT5X6fBvHEYL2YASx0ySIs0inFGmbYrtrANQpDVzpPcKh0PipznapJrQCHPWaI9BmxzUa1wFfzK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734876972; c=relaxed/simple;
	bh=ZDSgVxV5Eum28zsHd2MLCuxFgoO49/yUCHpk+Kgea08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpraJ1gKEb3zy19mQVComMieQmdZUwyLqzMpAbHdm4ak92rOCYpre3ParvSEKYuhz2ubgZnu+zQ1WTK/piGlViNk3cd9iC1DqU/fSfaqldCsr0RoT8ticJIzZ/8Xfpgvu1rr/O0vr9PWmoEO7yBqE4cJklo+b59mjwDm23lM1xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0afaegs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0afaegs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734876970; x=1766412970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZDSgVxV5Eum28zsHd2MLCuxFgoO49/yUCHpk+Kgea08=;
  b=D0afaegsEtijjOdaRm7Hxl1OhauyGd+g5Ll5Bqw+5UGCSoTyaF+BCBpV
   5XSlkHdnEvoGK0sYaYYDxPZ3xzTYoVhakrfNX4WZnw2glRtP06eAaEmKM
   hNN52a9dch7qcTTDlzdlZJ+NVO5a7K3fi248ZMJOCuvWLdkQMo5v0bo7v
   wwrc/pDVbGzTXPNXajRkvOrA/pv2XgFioyyLgKYTCaglSYtFo+mzTNCs6
   BIwK0S5nMAXRQglTw2prjcjiQWUePDifadm14zUwRTRuLF3jgcrmP1z1l
   vDBfMB+bhl5jCKvK0UzFC/RWcDMb5L2N+CxoKHJOctWHL3H6OHiCs5Kpp
   Q==;
X-CSE-ConnectionGUID: 8E5Tp4VURyOn4jkacdeGkQ==
X-CSE-MsgGUID: cmdgOcaoSXql7YXV3gB8CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39141377"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="39141377"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 06:16:10 -0800
X-CSE-ConnectionGUID: 6Fi78um/R9S4ULi3updDaA==
X-CSE-MsgGUID: Uth6bQZmSrC+JqnrEd5mIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="98745891"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2024 06:16:08 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPMkY-0002zz-2H;
	Sun, 22 Dec 2024 14:16:06 +0000
Date: Sun, 22 Dec 2024 22:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thangaraj Samynathan <thangaraj.s@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/spi/spi-pci1xxxx.c:373:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202412222214.8owfMbIo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 9538edeb72c989a4b90964ae4bba107eaf21a791 spi: mchp-pci1xxxx: DMA support for copying data to and from SPI Buf
date:   11 months ago
config: sh-randconfig-r133-20241222 (https://download.01.org/0day-ci/archive/20241222/202412222214.8owfMbIo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241222/202412222214.8owfMbIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412222214.8owfMbIo-lkp@intel.com/

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
   369			base = p->parent->dma_offset_bar + SPI_DMA_CH0_WR_BASE;
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
