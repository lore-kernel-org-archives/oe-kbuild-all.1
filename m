Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA61946DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 01:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766106163; cv=none; b=TjmYhI5tXyKu6256THdyvQviH+6Xa8lh48tVaBCrhn5kdqW2Uktuc/pslY7dpJqGyQfIiJMUmOST+9Ihaa6L9hQRtO72r9RgDzPH+MsExo3QPuqVSHgIWo8yobjMChviH3OLWzPXBpu/ycyYgleLrv+k5OMQbq9KTnrjAZO2yhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766106163; c=relaxed/simple;
	bh=a6Z9HYnJ5qr7pLKTZnaZzjuB5ejt95ATz5XOIb7CIvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYfDINUghAvA1ETjj8PWVXBvCyAnbb7Zs9fJg2YpKx5QrKgpnTD308ga1zpbU/W+pkwx8jNIE0JbXMmnTNTNkTyb6IQ4Gc8MZN7PXrlNNIXtC/ceF4zqhaNaXdSVV4BlF22wt9T21YwnmaWcOMBHSb2vjb/wW1qh4msFR/gi4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpJ9zBLW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpJ9zBLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766106161; x=1797642161;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a6Z9HYnJ5qr7pLKTZnaZzjuB5ejt95ATz5XOIb7CIvw=;
  b=MpJ9zBLWPAn2kcGNcZBKOQ3kpnTLe6WJcj87NRffQDe4o+x+Jo1TOsMf
   NoY2LP76XNYwOeji3Vu3Fl+j38bZTEU+A0g28Arye5D7li98m7CUXInRj
   bry0+sV6wl6X8EazzTyAtpqv7ZEPS4OND7beuarqJHXYMQfDrV5DT5ZMt
   t5K6bv9ZipBHemakIyuULD8wyb5ZTaVq1IwwGGdBddyQ7E0CrzgNCVEUu
   /r0ODxsohpJEHyRuhwre6rHzYzXGQl1oasFBYnO/0UwvPD0UrpMoNnqJG
   mcJ7sv48vTIbBrM0EPxaJsMsbmWZxP8cD/dK0Vpcm7lDC0TJmZrTOxCjh
   Q==;
X-CSE-ConnectionGUID: S1nZRxVqT/iV7EOm1Pm6yw==
X-CSE-MsgGUID: Pc6N0BqfTcis6uUoFA4Q/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78385916"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78385916"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 17:02:40 -0800
X-CSE-ConnectionGUID: cNQHXd9vQtajPuEyOlFGrA==
X-CSE-MsgGUID: +ieTQ77WS2G5axCbdXfmuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="202906791"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Dec 2025 17:02:40 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWOtA-000000002p1-3hMK;
	Fri, 19 Dec 2025 01:02:36 +0000
Date: Fri, 19 Dec 2025 09:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpib/eastwood/fluke_gpib.c:1002:28: warning: assignment to
 'void *' from 'int' makes pointer from integer without a cast
Message-ID: <202512190834.UN1eHu38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   3 weeks ago
config: s390-randconfig-001-20251219 (https://download.01.org/0day-ci/archive/20251219/202512190834.UN1eHu38-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190834.UN1eHu38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190834.UN1eHu38-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpib/eastwood/fluke_gpib.c: In function 'fluke_attach_impl':
   drivers/gpib/eastwood/fluke_gpib.c:1002:30: error: implicit declaration of function 'ioremap'; did you mean 'iounmap'? [-Werror=implicit-function-declaration]
    1002 |         nec_priv->mmiobase = ioremap(e_priv->gpib_iomem_res->start,
         |                              ^~~~~~~
         |                              iounmap
>> drivers/gpib/eastwood/fluke_gpib.c:1002:28: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1002 |         nec_priv->mmiobase = ioremap(e_priv->gpib_iomem_res->start,
         |                            ^
   drivers/gpib/eastwood/fluke_gpib.c:1036:40: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1036 |         e_priv->write_transfer_counter = ioremap(e_priv->write_transfer_counter_res->start,
         |                                        ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]


vim +1002 drivers/gpib/eastwood/fluke_gpib.c

55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   962  
4800ec89999049 drivers/staging/gpib/eastwood/fluke_gpib.c Michael Rubin 2025-04-08   963  static int fluke_attach_impl(struct gpib_board *board, const struct gpib_board_config *config,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   964  			     unsigned int handshake_mode)
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   965  {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   966  	struct fluke_priv *e_priv;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   967  	struct nec7210_priv *nec_priv;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   968  	int isr_flags = 0;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   969  	int retval;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   970  	int irq;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   971  	struct resource *res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   972  	dma_cap_mask_t dma_cap;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   973  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   974  	if (!fluke_gpib_pdev) {
f2bda0b660bd37 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2025-02-14   975  		dev_err(board->gpib_dev, "No fluke device was found, attach failed.\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   976  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   977  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   978  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   979  	retval = fluke_generic_attach(board);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   980  	if (retval)
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   981  		return retval;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   982  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   983  	e_priv = board->private_data;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   984  	nec_priv = &e_priv->nec7210_priv;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   985  	nec_priv->offset = fluke_reg_offset;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   986  	board->dev = &fluke_gpib_pdev->dev;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   987  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   988  	res = platform_get_resource(fluke_gpib_pdev, IORESOURCE_MEM, 0);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   989  	if (!res) {
f2bda0b660bd37 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2025-02-14   990  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio resource\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   991  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   992  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   993  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   994  	if (request_mem_region(res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   995  			       resource_size(res),
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   996  			       fluke_gpib_pdev->name) == NULL) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   997  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   998  		return -ENXIO;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   999  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1000  	e_priv->gpib_iomem_res = res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1001  
baf8855c916007 drivers/staging/gpib/eastwood/fluke_gpib.c Arnd Bergmann 2024-12-13 @1002  	nec_priv->mmiobase = ioremap(e_priv->gpib_iomem_res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1003  				     resource_size(e_priv->gpib_iomem_res));
baf8855c916007 drivers/staging/gpib/eastwood/fluke_gpib.c Arnd Bergmann 2024-12-13  1004  	if (!nec_priv->mmiobase) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1005  		dev_err(&fluke_gpib_pdev->dev, "Could not map I/O memory\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1006  		return -ENOMEM;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1007  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1008  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1009  	res = platform_get_resource(fluke_gpib_pdev, IORESOURCE_MEM, 1);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1010  	if (!res) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1011  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio resource for gpib dma port\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1012  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1013  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1014  	if (request_mem_region(res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1015  			       resource_size(res),
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1016  			       fluke_gpib_pdev->name) == NULL) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1017  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1018  		return -ENXIO;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1019  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1020  	e_priv->dma_port_res = res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1021  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1022  	res = platform_get_resource(fluke_gpib_pdev, IORESOURCE_MEM, 2);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1023  	if (!res) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1024  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio resource for write transfer counter\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1025  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1026  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1027  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1028  	if (request_mem_region(res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1029  			       resource_size(res),
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1030  			       fluke_gpib_pdev->name) == NULL) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1031  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1032  		return -ENXIO;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1033  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1034  	e_priv->write_transfer_counter_res = res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1035  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1036  	e_priv->write_transfer_counter = ioremap(e_priv->write_transfer_counter_res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1037  						 resource_size(e_priv->write_transfer_counter_res));
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1038  	if (!e_priv->write_transfer_counter) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1039  		dev_err(&fluke_gpib_pdev->dev, "Could not map I/O memory\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1040  		return -ENOMEM;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1041  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1042  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1043  	irq = platform_get_irq(fluke_gpib_pdev, 0);
51ab134daf5b9b drivers/staging/gpib/eastwood/fluke_gpib.c Chen Ni       2025-04-07  1044  	if (irq < 0)
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1045  		return -EBUSY;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1046  	retval = request_irq(irq, fluke_gpib_interrupt, isr_flags, fluke_gpib_pdev->name, board);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1047  	if (retval) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1048  		dev_err(&fluke_gpib_pdev->dev,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1049  			"cannot register interrupt handler err=%d\n",
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1050  			retval);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1051  		return retval;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1052  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1053  	e_priv->irq = irq;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1054  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1055  	dma_cap_zero(dma_cap);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1056  	dma_cap_set(DMA_SLAVE, dma_cap);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1057  	e_priv->dma_channel = dma_request_channel(dma_cap, gpib_dma_channel_filter, NULL);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1058  	if (!e_priv->dma_channel) {
f2bda0b660bd37 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2025-02-14  1059  		dev_err(board->gpib_dev, "failed to allocate a dma channel.\n");
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourné 2025-04-11  1060  		/*
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourné 2025-04-11  1061  		 * we don't error out here because unaccel interface will still
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourné 2025-04-11  1062  		 * work without dma
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourné 2025-04-11  1063  		 */
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1064  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1065  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1066  	return fluke_init(e_priv, board, handshake_mode);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1067  }
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1068  

:::::: The code at line 1002 was first introduced by commit
:::::: baf8855c916007a8a372576b65492316f43ed60b staging: gpib: fix address space mixup

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
