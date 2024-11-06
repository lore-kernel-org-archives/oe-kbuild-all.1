Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BB420BB41
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 20:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730923779; cv=none; b=Heq7tgdv6JkfAqmqQqa6FgKL2IcsXq2RSEB19qx/1r4hQj6c6cZsSssT0/TjLMlM8GaZ0Bqj1m7aca0BuN414EJnl3QIcEhmHazjV0WI2HyScBK7hqJqDY6h0mM3S0b7bayz0fesk7nJLDVIgTCsgQibAgh49i2QIxiDaELI/8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730923779; c=relaxed/simple;
	bh=My6LltXBOBfvaZ2lkBky0b77j/MGuGGyCGSdMvkIg7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aR1H/0XoFyNzPrE4TiUzFFMMlsTzAjCobqJ7Y4E3XeRgAUPjek+AhgUV4uzlJMU3ykT6QZrDLAiAvobu8ehob9eQPUedw3UAZM2159cr3+bpVMP/iaGxEsl23RUugOvdR6p7qy087H80JuW4F2hxbmtYW+G5zmz0te9sZgdwjm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCA6/Sgm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCA6/Sgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730923778; x=1762459778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=My6LltXBOBfvaZ2lkBky0b77j/MGuGGyCGSdMvkIg7A=;
  b=iCA6/SgmTL9zXsNqUMs1oB+Y6/eX6y08h7vb7nAJtXyeL52nsP+RscQV
   3+b8pxbikVg1tudxbUueak8umWlON5+YETB+IQnLj/qAn1sycmAfZleV/
   f5OuRsY11CTxwXjeYzJYeLzd2pBFNyDsV2CnaPkeP8xeZfuYcD5WNtVjZ
   aYhykRi0J2BeKHNut6IyLnJMcEEw/crYZX1EUHrwzxOeEef+wMkKR/t2x
   AejAvYYRfjaK0iSciPVDll+iYK9L0QybNQrn5/P03WR59jYSFawOeWDyr
   4rt4jgdj6kjHI0/e2XobJPf2RhTMj6ur5+BHBPYyqDTllM+zUoDdCCY6o
   w==;
X-CSE-ConnectionGUID: DkTc7UyCRn+6gfaT1t11fQ==
X-CSE-MsgGUID: c7R/+DKHTkS9JK6q1RUOKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="56144156"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="56144156"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 12:09:37 -0800
X-CSE-ConnectionGUID: kgnR/VJ1RAypCVpIt/9Vrg==
X-CSE-MsgGUID: o+8EWDW7QO6kwg7S9Y1F9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="84663693"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2024 12:09:35 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8mLN-000pNv-0Q;
	Wed, 06 Nov 2024 20:09:33 +0000
Date: Thu, 7 Nov 2024 04:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Janne Grunau <j@jannau.net>
Subject: [broonie-ci:v4_20241105_j_apple_spi_controller_driver 23/24]
 drivers/spi/spi-apple.c:463:16: error: implicit declaration of function
 'devm_spi_alloc_master'; did you mean 'devm_spi_alloc_target'?
Message-ID: <202411070327.65jUtrJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v4_20241105_j_apple_spi_controller_driver
head:   afe8c02f24d5ebd2c0c715ef3e18fd912b8404a5
commit: f801ef613dd708cfc4ad5523254ead4798cb5699 [23/24] spi: apple: Add driver for Apple SPI controller
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20241107/202411070327.65jUtrJ9-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070327.65jUtrJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070327.65jUtrJ9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-apple.c: In function 'apple_spi_probe':
>> drivers/spi/spi-apple.c:463:16: error: implicit declaration of function 'devm_spi_alloc_master'; did you mean 'devm_spi_alloc_target'? [-Wimplicit-function-declaration]
     463 |         ctlr = devm_spi_alloc_master(&pdev->dev, sizeof(struct apple_spi));
         |                ^~~~~~~~~~~~~~~~~~~~~
         |                devm_spi_alloc_target
>> drivers/spi/spi-apple.c:463:14: error: assignment to 'struct spi_controller *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     463 |         ctlr = devm_spi_alloc_master(&pdev->dev, sizeof(struct apple_spi));
         |              ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +463 drivers/spi/spi-apple.c

   456	
   457	static int apple_spi_probe(struct platform_device *pdev)
   458	{
   459		struct apple_spi *spi;
   460		int ret, irq;
   461		struct spi_controller *ctlr;
   462	
 > 463		ctlr = devm_spi_alloc_master(&pdev->dev, sizeof(struct apple_spi));
   464		if (!ctlr)
   465			return -ENOMEM;
   466	
   467		spi = spi_controller_get_devdata(ctlr);
   468		init_completion(&spi->done);
   469	
   470		spi->regs = devm_platform_ioremap_resource(pdev, 0);
   471		if (IS_ERR(spi->regs))
   472			return PTR_ERR(spi->regs);
   473	
   474		spi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
   475		if (IS_ERR(spi->clk))
   476			return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk),
   477					     "Unable to find or enable bus clock\n");
   478	
   479		irq = platform_get_irq(pdev, 0);
   480		if (irq < 0)
   481			return irq;
   482	
   483		ret = devm_request_irq(&pdev->dev, irq, apple_spi_irq, 0,
   484				       dev_name(&pdev->dev), spi);
   485		if (ret)
   486			return dev_err_probe(&pdev->dev, ret, "Unable to bind to interrupt\n");
   487	
   488		ctlr->dev.of_node = pdev->dev.of_node;
   489		ctlr->bus_num = pdev->id;
   490		ctlr->num_chipselect = 1;
   491		ctlr->mode_bits = SPI_CPHA | SPI_CPOL | SPI_LSB_FIRST;
   492		ctlr->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 32);
   493		ctlr->prepare_message = apple_spi_prepare_message;
   494		ctlr->set_cs = apple_spi_set_cs;
   495		ctlr->transfer_one = apple_spi_transfer_one;
   496		ctlr->auto_runtime_pm = true;
   497	
   498		pm_runtime_set_active(&pdev->dev);
   499		ret = devm_pm_runtime_enable(&pdev->dev);
   500		if (ret < 0)
   501			return ret;
   502	
   503		apple_spi_init(spi);
   504	
   505		ret = devm_spi_register_controller(&pdev->dev, ctlr);
   506		if (ret < 0)
   507			return dev_err_probe(&pdev->dev, ret, "devm_spi_register_controller failed\n");
   508	
   509		return 0;
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
