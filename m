Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E58197A9F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736604618; cv=none; b=Kr+3MAe9Wxl4bx7kfbpiL4QHduKeEgRzPKiHlpHi6aGSEEKpYavJHQ23ZoAnAUfswzRuJdjx+TJ8mJArfZBTg9YlZsKdjv1bHcO5mAlHymr/UMSu/4ag3KGfhMX3PgcvcnusXho0quzMkgjgv5byyWzlvmRi2Py90JtPa/DS/FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736604618; c=relaxed/simple;
	bh=ezi7sPYAzG8zxnCfXrc9X5oxdyIhS8APrwogyjekILs=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=eZlNW3+Nov+9i+vX9rniGKYoYu2aWnri1zLX97rja+FkJUUH2VhYOfADmv/5VP7kzhXTzN3iq9q+Iy0WpOyPLM0LgCaLXrKV8w3ccuFoOKK1dv0MlKrP1tw/+wgDuAvBzFpiWaDQ4yVQK5cCYPLkEOSebdb9kdo4QO+wrA4YQPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=u4vGw7xH; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="u4vGw7xH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=anqz2Kgcf04grS8DZNJ0AajuJT9du18HbrCA5bKu0T4=;
  b=u4vGw7xHISyhd3bk3BCiymAQ2R1h51bqX8itGu9RX/D/TRlLZ+uissFu
   cP25NqOTR/Kv8L1IYaQM49VgAUFk6wTHUJaBTpJbHzUQbxIXI+Mejnv8R
   xjQZW4IBePgH23G51ysFI51g7yPPcLRVFw+sQHtiVCSDxK3FNpnEt9YIg
   g=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,307,1728943200"; 
   d="scan'208";a="106085748"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 15:09:02 +0100
Date: Sat, 11 Jan 2025 15:09:01 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
    Michal Simek <monstr@monstr.eu>, 
    Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, 
    Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
    Tejas Prajapati Rameshchandra <tejaspra@xilinx.com>, 
    Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, 
    Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, 
    Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
cc: oe-kbuild-all@lists.linux.dev, git@amd.com
Subject: [xilinx-xlnx:lkp_test 436/504] drivers/spi/spi-xilinx.c:678:1-33:
 WARNING: Function "for_each_available_child_of_node" should have of_node_put()
 before return around line 683. (fwd)
Message-ID: <alpine.DEB.2.22.394.2501111506470.11532@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-271381475-1736604542=:11532"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-271381475-1736604542=:11532
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

Please check whethre some of_node_puts are missing in the loop starting om
line 678.

julia

---------- Forwarded message ----------
Date: Sat, 11 Jan 2025 21:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [xilinx-xlnx:lkp_test 436/504] drivers/spi/spi-xilinx.c:678:1-33:
    WARNING: Function "for_each_available_child_of_node" should have
    of_node_put() before return around line 683.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
CC: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
CC: Tejas Prajapati Rameshchandra <tejaspra@xilinx.com>
CC: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 9ba98444ace4ce0cdef4aff15853a8961510016c [436/504] spi: spi-xilinx: Updated axi-qspi controller driver
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: riscv-randconfig-r063-20250111 (https://download.01.org/0day-ci/archive/20250111/202501112131.VmQqJf8q-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501112131.VmQqJf8q-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-xilinx.c:678:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 683.
>> drivers/spi/spi-xilinx.c:678:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before break around line 689.

vim +/for_each_available_child_of_node +678 drivers/spi/spi-xilinx.c

ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  582
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  583  /* This driver supports single master mode only. Hence Tx FIFO Empty
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  584   * is the only interrupt we care about.
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  585   * Receive FIFO Overrun, Transmit FIFO Underrun, Mode Fault, and Slave Mode
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  586   * Fault are not to happen.
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  587   */
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  588  static irqreturn_t xilinx_spi_irq(int irq, void *dev_id)
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  589  {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  590  	struct spi_controller *ctlr = dev_id;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  591  	struct xilinx_spi *xspi = spi_controller_get_devdata(dev_id);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  592  	u32 ipif_isr;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  593  	u32 cr;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  594  	irqreturn_t status = IRQ_NONE;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  595
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  596  	/* Get the IPIF interrupts, and clear them immediately */
86fc593599c11b drivers/spi/xilinx_spi.c Richard Röjfors      2009-11-13  597  	ipif_isr = xspi->read_fn(xspi->regs + XIPIF_V123B_IISR_OFFSET);
86fc593599c11b drivers/spi/xilinx_spi.c Richard Röjfors      2009-11-13  598  	xspi->write_fn(ipif_isr, xspi->regs + XIPIF_V123B_IISR_OFFSET);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  599
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  600  	cr = xspi->read_fn(xspi->regs + XSPI_CR_OFFSET);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  601  	/* Enable master transaction inhibit */
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  602  	cr |= XSPI_CR_TRANS_INHIBIT;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  603  	xspi->write_fn(cr, xspi->regs + XSPI_CR_OFFSET);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  604
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  605  	if (ipif_isr & XSPI_INTR_TX_EMPTY)  {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  606  		/* Transmission completed */
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  607  		xspi->rx_fifo(xspi);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  608  		if (xspi->bytes_to_transfer) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  609  			/* There is more data to send */
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  610  			xspi->tx_fifo(xspi);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  611  		}
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  612  		status = IRQ_HANDLED;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  613  	}
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  614
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  615  	if (!xspi->bytes_to_receive && !xspi->bytes_to_transfer) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  616  		/* Disable the interrupts here. */
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  617  		xspi->write_fn(0x0, xspi->regs + XIPIF_V123B_DGIER_OFFSET);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  618  		spi_finalize_current_transfer(ctlr);
4c9a761402d780 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  619  	}
4c9a761402d780 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  620
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  621  	/* Disable master transaction inhibit */
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  622  	cr &= ~XSPI_CR_TRANS_INHIBIT;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  623  	xspi->write_fn(cr, xspi->regs + XSPI_CR_OFFSET);
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  624
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  625  	return status;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  626  }
7cb2abd05fe1f9 drivers/spi/spi-xilinx.c Mark Brown           2013-07-05  627  static int xilinx_spi_probe(struct platform_device *pdev)
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  628  {
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  629  	struct xilinx_spi *xspi;
ad3fdbcaf98dc1 drivers/spi/spi-xilinx.c Michal Simek         2013-07-08  630  	struct resource *res;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  631  	int ret;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  632  	u32 num_cs = 0, bits_per_word = 8;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  633  	u32 cs_num;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  634  	struct spi_controller *ctlr;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  635  	struct device_node *nc;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  636  	u32 tmp, rx_bus_width, fifo_size;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  637  	bool startup_block;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  638
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  639  	if (of_property_read_u32(pdev->dev.of_node, "num-cs", &num_cs))
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  640  		dev_info(&pdev->dev,
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  641  			 "Missing num-cs optional property, assuming default as <1>\n");
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  642  	if (!num_cs)
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  643  		num_cs = 1;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  644
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  645  	if (num_cs > XILINX_SPI_MAX_CS) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  646  		dev_err(&pdev->dev, "Invalid number of spi slaves\n");
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  647  		return -EINVAL;
d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown           2013-07-03  648  	}
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  649
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  650  	startup_block = of_property_read_bool(pdev->dev.of_node,
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  651  					      "xlnx,startup-block");
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  652  	ctlr = spi_alloc_master(&pdev->dev, sizeof(struct xilinx_spi));
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  653  	if (!ctlr)
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  654  		return -ENODEV;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  655
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  656  	xspi = spi_controller_get_devdata(ctlr);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  657  	ctlr->dev.of_node = pdev->dev.of_node;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  658  	platform_set_drvdata(pdev, ctlr);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  659  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  660  	xspi->regs = devm_ioremap_resource(&pdev->dev, res);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  661  	if (IS_ERR(xspi->regs)) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  662  		ret = PTR_ERR(xspi->regs);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  663  		goto put_controller;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  664  	}
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  665  	ret = of_property_read_u32(pdev->dev.of_node, "fifo-size",
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  666  				   &fifo_size);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  667  	if (ret < 0) {
7cb2abd05fe1f9 drivers/spi/spi-xilinx.c Mark Brown           2013-07-05  668  		dev_err(&pdev->dev,
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  669  			"Missing fifo size\n");
d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown           2013-07-03  670  		return -EINVAL;
d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown           2013-07-03  671  	}
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  672  	if (of_property_read_u32(pdev->dev.of_node, "bits-per-word",
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  673  				 &bits_per_word))
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  674  		dev_info(&pdev->dev,
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  675  			 "Missing bits-per-word optional property, assuming default as <8>\n");
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  676
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  677  	xspi->rx_bus_width = XSPI_ONE_BITS_PER_WORD;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05 @678  	for_each_available_child_of_node(pdev->dev.of_node, nc) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  679  		if (startup_block) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  680  			ret = of_property_read_u32(nc, "reg",
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  681  						   &cs_num);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  682  			if (ret < 0)
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28 @683  				return -EINVAL;
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  684  		}
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  685  		ret = of_property_read_u32(nc, "spi-rx-bus-width",
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  686  					   &rx_bus_width);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  687  		if (!ret) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  688  			xspi->rx_bus_width = rx_bus_width;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05 @689  			break;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  690  		}
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  691  	}
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  692
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  693  	ret = devm_clk_bulk_get_all(&pdev->dev, &xspi->clks);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  694  	if (ret < 0)
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  695  		return ret;
e7db06b5d5afce drivers/spi/xilinx_spi.c David Brownell       2009-06-17  696
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  697  	xspi->num_clocks = ret;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  698
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  699  	pm_runtime_set_autosuspend_delay(&pdev->dev, SPI_AUTOSUSPEND_TIMEOUT);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  700  	pm_runtime_use_autosuspend(&pdev->dev);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  701  	pm_runtime_enable(&pdev->dev);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  702  	ret = pm_runtime_get_sync(&pdev->dev);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  703  	if (ret < 0)
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  704  		goto runtime_disable;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  705
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  706  	xspi->dev = &pdev->dev;
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  707
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  708  	/*
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  709  	 * Detect endianess on the IP via loop bit in CR. Detection
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  710  	 * must be done before reset is sent because incorrect reset
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  711  	 * value generates error interrupt.
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  712  	 * Setup little endian helper functions first and try to use them
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  713  	 * and check if bit was correctly setup or not.
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  714  	 */
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown           2015-01-30  715  	xspi->read_fn = xspi_read32;
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown           2015-01-30  716  	xspi->write_fn = xspi_write32;
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  717
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  718  	xspi->write_fn(XSPI_CR_LOOP, xspi->regs + XSPI_CR_OFFSET);
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  719  	tmp = xspi->read_fn(xspi->regs + XSPI_CR_OFFSET);
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  720  	tmp &= XSPI_CR_LOOP;
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  721  	if (tmp != XSPI_CR_LOOP) {
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown           2015-01-30  722  		xspi->read_fn = xspi_read32_be;
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown           2015-01-30  723  		xspi->write_fn = xspi_write32_be;
86fc593599c11b drivers/spi/xilinx_spi.c Richard Röjfors      2009-11-13  724  	}
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  725
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  726  	xspi->buffer_size = fifo_size;
7b3b7432ae7848 drivers/spi/spi-xilinx.c Michal Simek         2013-07-09  727  	xspi->irq = platform_get_irq(pdev, 0);
4db9bf548bb00d drivers/spi/spi-xilinx.c Lars-Peter Clausen   2016-07-15  728  	if (xspi->irq < 0 && xspi->irq != -ENXIO) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  729  		ret = xspi->irq;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  730  		goto clk_unprepare_all;
4db9bf548bb00d drivers/spi/spi-xilinx.c Lars-Peter Clausen   2016-07-15  731  	} else if (xspi->irq >= 0) {
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  732  		/* Register for SPI Interrupt */
7b3b7432ae7848 drivers/spi/spi-xilinx.c Michal Simek         2013-07-09  733  		ret = devm_request_irq(&pdev->dev, xspi->irq, xilinx_spi_irq, 0,
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  734  				       dev_name(&pdev->dev), ctlr);
d5af91a1faca68 drivers/spi/xilinx_spi.c Richard Röjfors      2009-11-13  735  		if (ret)
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  736  			goto clk_unprepare_all;
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  737  	}
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  738
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  739  	/* SPI controller initializations */
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  740  	xspi_init_hw(xspi);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  741
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  742  	pm_runtime_put(&pdev->dev);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  743
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  744  	ctlr->bus_num = pdev->id;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  745  	ctlr->num_chipselect = num_cs;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  746  	ctlr->setup = xspi_setup;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  747  	ctlr->set_cs = xspi_chipselect;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  748  	ctlr->transfer_one = xspi_start_transfer;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  749  	ctlr->prepare_transfer_hardware = xspi_prepare_transfer_hardware;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  750  	ctlr->unprepare_transfer_hardware = xspi_unprepare_transfer_hardware;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  751  	ctlr->bits_per_word_mask = SPI_BPW_MASK(bits_per_word);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  752  	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  753
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  754  	xspi->bytes_per_word = bits_per_word / 8;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  755  	xspi->tx_fifo = xspi_fill_tx_fifo_8;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  756  	xspi->rx_fifo = xspi_read_rx_fifo_8;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  757  	if (xspi->rx_bus_width == XSPI_RX_ONE_WIRE) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  758  		if (xspi->bytes_per_word == XSPI_TWO_BITS_PER_WORD) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  759  			xspi->tx_fifo = xspi_fill_tx_fifo_16;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  760  			xspi->rx_fifo = xspi_read_rx_fifo_16;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  761  		} else if (xspi->bytes_per_word == XSPI_FOUR_BITS_PER_WORD) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  762  			xspi->tx_fifo = xspi_fill_tx_fifo_32;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  763  			xspi->rx_fifo = xspi_read_rx_fifo_32;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  764  		}
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  765  	} else if (xspi->rx_bus_width == XSPI_RX_FOUR_WIRE) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  766  		ctlr->mode_bits |= SPI_TX_QUAD | SPI_RX_QUAD;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  767  	} else {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  768  		dev_err(&pdev->dev, "Dual Mode not supported\n");
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  769  		goto clk_unprepare_all;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  770  	}
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  771  	xspi->cs_inactive = 0xffffffff;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  772
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  773  	/*
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  774  	 * This is the work around for the startup block issue in
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  775  	 * the spi controller. SPI clock is passing through STARTUP
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  776  	 * block to FLASH. STARTUP block don't provide clock as soon
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  777  	 * as QSPI provides command. So first command fails.
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  778  	 */
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  779  	if (startup_block)
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  780  		xilinx_spi_startup_block(xspi, cs_num);
8fd8821b62397f drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  781
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  782  	ret = spi_register_controller(ctlr);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  783  	if (ret) {
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  784  		dev_err(&pdev->dev, "spi_register_controller failed\n");
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  785  		goto clk_unprepare_all;
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  786  	}
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  787
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  788  	return ret;
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  789
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  790  clk_unprepare_all:
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  791  	pm_runtime_put_sync(&pdev->dev);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  792  runtime_disable:
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  793  	pm_runtime_disable(&pdev->dev);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  794  	pm_runtime_set_suspended(&pdev->dev);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  795  put_controller:
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  796  	spi_controller_put(ctlr);
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  797
9ba98444ace4ce drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2024-12-05  798  	return ret;
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  799  }
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  800

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
--8323329-271381475-1736604542=:11532--
