Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914A23B9D98
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458801; cv=none; b=aYvn3m+Iq0HsOAWhH9AkhPi/ViPmbpz7SYYHtBD+zPo4Yu8zH6JB61xWFBd3PUszvnqUC1ew6W1QaPgTTq5ben9XSxnkDYBEtgOfpInLeETgC0eN6fKsWBPF+rsyI4t7cNMmmA4tvAgnHfSF9WWVL9HUsthVcAzBoyS1/Qv7Sl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458801; c=relaxed/simple;
	bh=rZfYRq/s78OaSA2WUw1dkfAnfXjh39+sSGD4UCVktkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sgjGWBGwd5B9ZOM9CXAivEARSeloaW1/PSEE6O+M//oaGf6r9CzxC0ELsVWMx7Jqr/KdA7NsB2h3nC5/031rFlxeDggWx7BjHO8jbkFgfVEqBOwmVzUvncG2q4/iYAFMwtwvZ4/qd6eacF07qCkiquwQm0rw8H5tPUCR1L0IIeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAMsn7lh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAMsn7lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791458798; x=1822994798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rZfYRq/s78OaSA2WUw1dkfAnfXjh39+sSGD4UCVktkw=;
  b=FAMsn7lhqB1zzXth0KcuPY7uhFU7LuRtrWaAoNV6oeCbizdAeeXFL5rS
   Q/yhqVEC79dUPIfj9IuBdvs3m9gzUo/RqTS6bvTVN+bGnJ2ctQuDugoBT
   tqcPvN0BVAizjYsQII3UkMK9yzz1xXr/MwLayLyUDXmmkqjCe3jIdiljc
   ZIoUN1I+eq8Rj2VVmZDivGj5PI50NzcLLSN61z3y4ghE7Q899IQ4v0tgP
   6tGFz0XR9wli4C48r01PDyfW5bxuPY62uFeJeq1pbWkOXJI4LK03JjTHX
   MozDecnuqS0aXxWvefTIMo0GEnDZ0H72RhpS6PeC+FzB22/+xs545iYhR
   A==;
X-CSE-ConnectionGUID: gt/VuyDfT76T8gn3cUWVHA==
X-CSE-MsgGUID: pCbgK63VQQqJfdDHBqadbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="137160"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="137160"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:26:03 -0700
X-CSE-ConnectionGUID: sSGmdZk6RMSS2omeQSROqA==
X-CSE-MsgGUID: NmxXaPyXRDONwurx2gJHHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="124822"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2026 04:26:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEmG7-000000004Js-22vv;
	Thu, 08 Oct 2026 11:25:59 +0000
Date: Thu, 08 Oct 2026 19:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 78/142]
 drivers/spi/spi-zx.c:426:119: warning: cast from pointer to integer of
 different size
Message-ID: <202610081950.beCw0Lsu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: 67ada9eae8a8fddee5c1bf5b8ea134c1fe873d9b [78/142] QSPI DMA somewhat working
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261008/202610081950.beCw0Lsu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081950.beCw0Lsu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081950.beCw0Lsu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:620,
                    from include/linux/kernel.h:30,
                    from include/linux/clk.h:13,
                    from drivers/spi/spi-zx.c:14:
   drivers/spi/spi-zx.c: In function 'zx_qspi_exec_op':
>> drivers/spi/spi-zx.c:426:119: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     426 |                 dev_dbg(dev, "Attempting DMA %x %s qspi 0x%08x...\n", ctrl0, ctrl0 & ZX_QSPI_TX_DMA_EN ? "tx" : "rx", (unsigned int)qspi);
         |                                                                                                                       ^
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/spi/spi-zx.c:426:17: note: in expansion of macro 'dev_dbg'
     426 |                 dev_dbg(dev, "Attempting DMA %x %s qspi 0x%08x...\n", ctrl0, ctrl0 & ZX_QSPI_TX_DMA_EN ? "tx" : "rx", (unsigned int)qspi);
         |                 ^~~~~~~
   drivers/spi/spi-zx.c: In function 'zx_qspi_remove':
   drivers/spi/spi-zx.c:615:24: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551614' to '4294967294' [-Woverflow]
     615 |         writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);


vim +426 drivers/spi/spi-zx.c

   341	
   342	static int zx_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
   343	{
   344		struct zx_qspi *qspi = spi_controller_get_devdata(mem->spi->controller);
   345		u32 ctrl0, ctrl1 = 0, ctrl2 = 0, txstatus;
   346		struct device *dev = &qspi->ctrl->dev;
   347		dma_cookie_t cookie;
   348		int ret = 0;
   349	
   350		dev_dbg(dev, "zx_qspi_exec_op cmd:%#x buswidth:%d.%d.%d.%d addr:%#llx nbytes:%#x\n",
   351			op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
   352			op->dummy.buswidth, op->data.buswidth,
   353			op->addr.val, op->data.nbytes);
   354	
   355		ctrl0 = readl_relaxed(qspi->io_base + ZX_QSPI_CTRL0_REG);
   356		dev_dbg(dev, "ZX_QSPI_CTRL0_REG = 0x%08x\n", ctrl0);
   357		ctrl0 &= ~(ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN);
   358		ctrl0 |= (ZX_QSPI_RXFIFO_CLR | ZX_QSPI_TXFIFO_CLR);
   359		/* What are these for? I don't know, the ZTE driver sets them. Removing them here makes it
   360		 * possible to operate with a smaller burst size but presumably comes at a performance cost.
   361		 * In simple benchmarking I have not found an impact though.
   362		 */
   363		ctrl0 |= ZX_QSPI_TXFIFO_THRES | ZX_QSPI_RXFIFO_THRES;
   364	
   365		if (op->addr.nbytes && op->addr.buswidth) {
   366			ctrl1 |= ZX_QSPI_ADDR_TX_EN;
   367			switch (op->addr.buswidth * op->addr.nbytes) {
   368				case 1: ctrl2 |= (ADDR_BYTE_WIDTH_8 << ZX_QSPI_ADDR_BYTE_NUM); break;
   369				case 2: ctrl2 |= (ADDR_BYTE_WIDTH_16 << ZX_QSPI_ADDR_BYTE_NUM); break;
   370				case 3: ctrl2 |= (ADDR_BYTE_WIDTH_24 << ZX_QSPI_ADDR_BYTE_NUM); break;
   371				case 4: ctrl2 |= (ADDR_BYTE_WIDTH_32 << ZX_QSPI_ADDR_BYTE_NUM); break;
   372				default:
   373					dev_err(dev, "Unexpected addr.buswidth %u\n",
   374						op->addr.buswidth * op->addr.nbytes);	
   375					return -EIO;
   376			}	
   377		}
   378	
   379		ctrl0 |= zx_qspi_setup_dma(qspi, op);
   380	
   381		/* dummy config */
   382		if (op->dummy.nbytes && op->dummy.buswidth) {
   383			ctrl1 |= ZX_QSPI_DUMMY_TX_EN;
   384			ctrl2 |= (0x1 << ZX_QSPI_DUMMY_BYTE_NUM);
   385		}
   386	
   387		/* data config */
   388		if (op->data.nbytes) {
   389			if (op->data.dir == SPI_MEM_DATA_IN) {
   390				ctrl1 |= ZX_QSPI_READ_DATA_EN;
   391			} else {
   392				ctrl1 |= ZX_QSPI_WRITE_DATA_EN;
   393			}
   394	
   395			if (op->data.buswidth == 0x4) {
   396				ctrl2 |= ZX_QSPI_DATA_MULTI_LINE_EN | ZX_QSPI_TRANS_MOD;
   397			} else if (op->data.buswidth == 0x2) {
   398				ctrl2 |= ZX_QSPI_DATA_MULTI_LINE_EN;
   399			}
   400		}
   401	
   402		writel_relaxed(ctrl0, qspi->io_base + ZX_QSPI_CTRL0_REG);
   403		writel_relaxed(ctrl1, qspi->io_base + ZX_QSPI_CTRL1_REG);
   404		writel_relaxed(ctrl2, qspi->io_base + ZX_QSPI_CTRL2_REG);
   405	
   406		/* clear int */
   407		writel_relaxed(ZX_QSPI_INT_ALL_MASK, qspi->io_base + ZX_QSPI_INT_SW_CLR_REG);
   408	
   409		/* data len */
   410		if (op->data.nbytes) {
   411			writel_relaxed(op->data.nbytes - 1, qspi->io_base + ZX_QSPI_BYTE_NUM_REG);
   412		}
   413	
   414		/* addr */
   415		if (op->addr.nbytes && op->addr.buswidth) {
   416			writel_relaxed(op->addr.val, qspi->io_base + ZX_QSPI_ADDR_REG);
   417		}
   418	
   419		/* cmd */
   420		writel_relaxed(op->cmd.opcode, qspi->io_base + ZX_QSPI_INS_REG);
   421	
   422		/* spifc start */
   423		writel_relaxed(ZX_QSPI_START, qspi->io_base + ZX_QSPI_START_REG);
   424	
   425		if (op->data.nbytes && ctrl0 & (ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN)) {
 > 426			dev_dbg(dev, "Attempting DMA %x %s qspi 0x%08x...\n", ctrl0, ctrl0 & ZX_QSPI_TX_DMA_EN ? "tx" : "rx", (unsigned int)qspi);
   427			// qspi->dma_desc->callback = zx_qspi_dma_callback;
   428			qspi->dma_desc->callback_result = zx_qspi_callback_result;
   429			qspi->dma_desc->callback_param = qspi;
   430			cookie = dmaengine_submit(qspi->dma_desc);
   431			ret = dma_submit_error(cookie);
   432			if (ret) {
   433				/* FIXME: Does this kind of fallback to PIO work? How do I provoke it to
   434				 * test it?
   435				 */
   436				dev_err(dev, "dmaengine_submit = %d, falling back to PIO\n", ret);
   437				ctrl0 &= ~(ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN);
   438				writel_relaxed(ctrl0, qspi->io_base + ZX_QSPI_CTRL0_REG);
   439			} else {
   440				dma_async_issue_pending(qspi->cur_dma_ch);
   441	
   442				if (!wait_for_completion_io_timeout(&qspi->dma_completion,
   443						 msecs_to_jiffies(2000))) {
   444					dev_err(dev, "DMA timed out\n");
   445					spi_controller_dma_unmap_mem_op_data(qspi->ctrl, op, &qspi->sgt);
   446					return -EIO;
   447				}
   448			}
   449			qspi->dma_desc = NULL;
   450	
   451			spi_controller_dma_unmap_mem_op_data(qspi->ctrl, op, &qspi->sgt);
   452			writel_relaxed(ctrl0 & ~(ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN), qspi->io_base + ZX_QSPI_CTRL0_REG);
   453		}
   454	
   455		if (op->data.nbytes && !(ctrl0 & (ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN))) {
   456			ret = zx_qspi_tx(qspi, op);
   457			if (ret) 
   458			{
   459				pr_err("zx_qspi_tx error %d.\n", ret);
   460				return ret;	
   461			}
   462		}
   463	
   464		/* With DMA the result is ready by the time we receive the DMA complete callback. With PIO,
   465		 * the highest wait time I have seen was 1 us.
   466		 */
   467		ret = readl_relaxed_poll_timeout_atomic(qspi->io_base + ZX_QSPI_INT_RAW_REG,
   468							txstatus, txstatus & ZX_QSPI_INT_CMD_END, 1,
   469							1000);
   470		if (ret) {
   471			dev_err(dev, "Wait for transfer end failed: %u.\n", ret);
   472			return ret;
   473		}
   474	
   475		if (txstatus & ZX_QSPI_INT_FMT_ERR) {
   476			dev_err(dev, "SPI controller reported an error, status 0x%08x\n", txstatus);
   477			return -EIO;
   478		}
   479		if (txstatus & ZX_QSPI_INT_CMD_END) {
   480			return 0;
   481		}
   482		dev_err(dev, "Unexpected status 0x%08x\n", txstatus);
   483		return -EIO;
   484	}
   485	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
