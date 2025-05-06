Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7227A449
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536372; cv=none; b=S1ZQONtj6nI+m7juxoB1uvsUqVcJ7+RrOeWmJu2Qv3oXjlk0KW4FSIGGoQJl5q7Wtb8lwMyKjiUNFEznqEw747CsiPv94EtR1ZxwrbhUugQFlDIdotFObn6iwCcZ3hbt3qAsaFTR6RayoEjYW4zhbesCznytBr23WG78ZJCfDRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536372; c=relaxed/simple;
	bh=e4IVw7vYUwh7tdOVgDxp1nb0/BU5WMa432al40+2xPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LKArvMTkoL+MVjJm4+WuuFDsXaqNCjU6koJHDMIXGVCKeyOgwY5B4ZNd6EJrGMUTmyvnx5eBLaLOW7QWZ9BEZNFm3I20ja5Rz784v4h6nsjkMyXK3DUq9p/6EEniVhMF73lbYEcv1j5AXyu3TcLIEQKyKMg1+rhpZ3cqc0YXX/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcqDq55c; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcqDq55c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746536370; x=1778072370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4IVw7vYUwh7tdOVgDxp1nb0/BU5WMa432al40+2xPM=;
  b=BcqDq55c/nlPY7ESKRJtWIkVH+TQFa6bIAJ8Oam5HbnXcwxHROvWRX5e
   TrBQtZBPoWKAYR1PSuKF/M9SSbR8ZT5uR/+qG4cs08u4sgTKQS9zimYSS
   JJlmT7+EOupmffD9BAP0/FTQWDTK/g//vpQ9prua3dEqjbG63q/i0rS6t
   bi68OSMpibzV0C4/5LbliR2Q8wdygiw/8qOgK2hmIN9maP8wzBCvIFq2C
   0r/V3vf1nt8kTX1YY0FCaBAHeNM8ELPj6JYzdzkrgHlEmpxwZARIPIh7T
   dhxG7dSg2tBWFjltaXj8aUrT+1hcDM6I2Ij7dAiovjpkte0QoYuZXRvrB
   g==;
X-CSE-ConnectionGUID: d6v2nb1SRGCSCEiFpRIfsQ==
X-CSE-MsgGUID: brFoulNBQyiBurOnaJ4w0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="51851537"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="51851537"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 05:59:30 -0700
X-CSE-ConnectionGUID: cXaQPKkDRd+BDoyF8p4RgQ==
X-CSE-MsgGUID: P7mu/tKEQgOD/Kl/1l2Jng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136000986"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 May 2025 05:59:28 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCHtO-00003i-1K;
	Tue, 06 May 2025 12:59:26 +0000
Date: Tue, 6 May 2025 20:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 21/21] drivers/spi/spi-stm32-ospi.c:828:67:
 error: passing argument 3 of 'of_reserved_mem_region_to_resource' from
 incompatible pointer type
Message-ID: <202505062023.qlrf8VZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   3474fc53f28d0824c7020ddffc8559e8302f7415
commit: 3474fc53f28d0824c7020ddffc8559e8302f7415 [21/21] spi: Use of_reserved_mem_region_to_resource() for "memory-region"
config: i386-buildonly-randconfig-2004-20250506 (https://download.01.org/0day-ci/archive/20250506/202505062023.qlrf8VZc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505062023.qlrf8VZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505062023.qlrf8VZc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/spi/spi-stm32-ospi.c: In function 'stm32_ospi_get_resources':
>> drivers/spi/spi-stm32-ospi.c:828:67: error: passing argument 3 of 'of_reserved_mem_region_to_resource' from incompatible pointer type [-Werror=incompatible-pointer-types]
     828 |         ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
         |                                                                   ^~~~
         |                                                                   |
         |                                                                   struct resource **
   In file included from drivers/spi/spi-stm32-ospi.c:23:
   include/linux/of_reserved_mem.h:44:75: note: expected 'struct resource *' but argument is of type 'struct resource **'
      44 |                                        unsigned int idx, struct resource *res);
         |                                                          ~~~~~~~~~~~~~~~~~^~~
>> drivers/spi/spi-stm32-ospi.c:830:47: error: passing argument 1 of 'resource_size' from incompatible pointer type [-Werror=incompatible-pointer-types]
     830 |                 ospi->mm_size = resource_size(&res);
         |                                               ^~~~
         |                                               |
         |                                               struct resource **
   In file included from include/linux/device.h:17,
                    from include/linux/dma-mapping.h:5,
                    from drivers/spi/spi-stm32-ospi.c:9:
   include/linux/ioport.h:289:68: note: expected 'const struct resource *' but argument is of type 'struct resource **'
     289 | static inline resource_size_t resource_size(const struct resource *res)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/spi/spi-stm32-ospi.c:831:60: error: passing argument 2 of 'devm_ioremap_resource' from incompatible pointer type [-Werror=incompatible-pointer-types]
     831 |                 ospi->mm_base = devm_ioremap_resource(dev, &res);
         |                                                            ^~~~
         |                                                            |
         |                                                            struct resource **
   In file included from include/linux/device.h:31:
   include/linux/device/devres.h:101:80: note: expected 'const struct resource *' but argument is of type 'struct resource **'
     101 | void __iomem *devm_ioremap_resource(struct device *dev, const struct resource *res);
         |                                                         ~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/spi/spi-stm32-ospi.c:776:29: warning: unused variable 'node' [-Wunused-variable]
     776 |         struct device_node *node;
         |                             ^~~~
>> drivers/spi/spi-stm32-ospi.c:775:30: warning: unused variable 'rmem' [-Wunused-variable]
     775 |         struct reserved_mem *rmem = NULL;
         |                              ^~~~
   cc1: some warnings being treated as errors


vim +/of_reserved_mem_region_to_resource +828 drivers/spi/spi-stm32-ospi.c

   769	
   770	static int stm32_ospi_get_resources(struct platform_device *pdev)
   771	{
   772		struct device *dev = &pdev->dev;
   773		struct stm32_ospi *ospi = platform_get_drvdata(pdev);
   774		struct resource *res;
 > 775		struct reserved_mem *rmem = NULL;
 > 776		struct device_node *node;
   777		int ret;
   778	
   779		ospi->regs_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   780		if (IS_ERR(ospi->regs_base))
   781			return PTR_ERR(ospi->regs_base);
   782	
   783		ospi->regs_phys_base = res->start;
   784	
   785		ospi->clk = devm_clk_get(dev, NULL);
   786		if (IS_ERR(ospi->clk))
   787			return dev_err_probe(dev, PTR_ERR(ospi->clk),
   788					     "Can't get clock\n");
   789	
   790		ospi->clk_rate = clk_get_rate(ospi->clk);
   791		if (!ospi->clk_rate) {
   792			dev_err(dev, "Invalid clock rate\n");
   793			return -EINVAL;
   794		}
   795	
   796		ospi->irq = platform_get_irq(pdev, 0);
   797		if (ospi->irq < 0)
   798			return ospi->irq;
   799	
   800		ret = devm_request_irq(dev, ospi->irq, stm32_ospi_irq, 0,
   801				       dev_name(dev), ospi);
   802		if (ret) {
   803			dev_err(dev, "Failed to request irq\n");
   804			return ret;
   805		}
   806	
   807		ospi->rstc = devm_reset_control_array_get_optional_exclusive(dev);
   808		if (IS_ERR(ospi->rstc))
   809			return dev_err_probe(dev, PTR_ERR(ospi->rstc),
   810					     "Can't get reset\n");
   811	
   812		ospi->dma_chrx = dma_request_chan(dev, "rx");
   813		if (IS_ERR(ospi->dma_chrx)) {
   814			ret = PTR_ERR(ospi->dma_chrx);
   815			ospi->dma_chrx = NULL;
   816			if (ret == -EPROBE_DEFER)
   817				goto err_dma;
   818		}
   819	
   820		ospi->dma_chtx = dma_request_chan(dev, "tx");
   821		if (IS_ERR(ospi->dma_chtx)) {
   822			ret = PTR_ERR(ospi->dma_chtx);
   823			ospi->dma_chtx = NULL;
   824			if (ret == -EPROBE_DEFER)
   825				goto err_dma;
   826		}
   827	
 > 828		ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
   829		if (!ret) {
 > 830			ospi->mm_size = resource_size(&res);
 > 831			ospi->mm_base = devm_ioremap_resource(dev, &res);
   832			if (!ospi->mm_base) {
   833				dev_err(dev, "unable to map memory region: %pR\n", &res);
   834				ret = -ENOMEM;
   835				goto err_dma;
   836			}
   837	
   838			if (ospi->mm_size > STM32_OSPI_MAX_MMAP_SZ) {
   839				dev_err(dev, "Memory map size outsize bounds\n");
   840				ret = -EINVAL;
   841				goto err_dma;
   842			}
   843		} else {
   844			dev_info(dev, "No memory-map region found\n");
   845		}
   846	
   847		init_completion(&ospi->data_completion);
   848		init_completion(&ospi->match_completion);
   849	
   850		return 0;
   851	
   852	err_dma:
   853		dev_info(dev, "Can't get all resources (%d)\n", ret);
   854	
   855		if (ospi->dma_chtx)
   856			dma_release_channel(ospi->dma_chtx);
   857		if (ospi->dma_chrx)
   858			dma_release_channel(ospi->dma_chrx);
   859	
   860		return ret;
   861	};
   862	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
