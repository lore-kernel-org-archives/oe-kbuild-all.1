Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144D2BA38
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729358388; cv=none; b=hU3VdVWu4qR+rrPsy1Pqj6t96D2bV8xCX8Ehdj/WrXwER3CE026NUmMp/OCOUfyYOwrH9Am6xr5vk7TBcEsAorkVGMbfFN24HP77vbepKHw1I0cxNyMBAx+Z0eih5q/DAv53JlNBKGqxTg8xbp1DqW3b5UqnzNtd/AFJIWDLOWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729358388; c=relaxed/simple;
	bh=i+boQFjfrl1TUJPbTr864LGrd56reyOnS7wkbVO5s1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kENk1Nv9d69cUpxalHzSeaZ6gnixwmX3k9cLLX3BveTfKvRVzXdkMtjewWRGmMY9S731ciIln6sxdIYjNu20hQYMJNcfYelfaHUKC/vdNKBaKnZDsOBk86pYuyaOfHQRGjHZUn+EzvDi+lPwGMFfVtkT2XIn+hvIofpsMtn9ZGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V624nmMY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V624nmMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729358385; x=1760894385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i+boQFjfrl1TUJPbTr864LGrd56reyOnS7wkbVO5s1c=;
  b=V624nmMYC/5p0Kj6LgZSASvCoGJUC6DivPDWeI0zKkw556xDQJqCp+Qa
   jQAmcQfc5c5WMWC0fm0nIxSa2i57ScetnqdKctXkIKJGN8i4UiVP6/IAY
   vR9A5fgguJoWT8I+1d+l2mPbvaQiz++SpD0eUZ+gAkhQuzps+LQg8zrKD
   dJ1+6Zw0w/I5M+VYxm9vcS5kIi/+X4yAM1wLObjqAdwIeJpdFn8wQdDwq
   waqzB2EjfNoKuV5aqJCJaGEgM86ztbqmJHi0jwFI7Ej4y7P3OKbEXBgy9
   GbHmV7S347QsXV0AKl+ovzNldjSK8kJcX/8JfUuwIJr/7teAIvgY8k/hP
   w==;
X-CSE-ConnectionGUID: jO84Mm5PQgmnMCPiCwXyrA==
X-CSE-MsgGUID: ngT44h6iRAakJjPGQWc0yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="29008574"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="29008574"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 10:19:44 -0700
X-CSE-ConnectionGUID: ngfGQgxKTe+blBpFSx+6+w==
X-CSE-MsgGUID: ttKJmoF+REOoAuJFngrGCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79546923"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Oct 2024 10:19:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2D76-000PH3-35;
	Sat, 19 Oct 2024 17:19:40 +0000
Date: Sun, 20 Oct 2024 01:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:v6.12-rc3-acpm-v2 2/2]
 drivers/firmware/samsung/exynos-acpm.c:493:54: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202410200132.ppRvum62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day v6.12-rc3-acpm-v2
head:   7ae3e681354fe887656fe3bc659c697b4e27006a
commit: 7ae3e681354fe887656fe3bc659c697b4e27006a [2/2] firmware: add exynos acpm driver
config: x86_64-randconfig-122-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200132.ppRvum62-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200132.ppRvum62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200132.ppRvum62-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/samsung/exynos-acpm.c:493:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:493:54: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:493:54: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:494:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:494:55: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:494:55: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:495:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:495:54: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:495:54: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:504:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:504:54: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:504:54: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:505:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:505:55: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:505:55: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:506:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:506:54: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:506:54: sparse:     got unsigned int *
>> drivers/firmware/samsung/exynos-acpm.c:537:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:537:34: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:537:34: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:550:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:550:51: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:550:51: sparse:     got unsigned int *
>> drivers/firmware/samsung/exynos-acpm.c:549:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct exynos_acpm_shmem_chan *shmem_chans @@     got void [noderef] __iomem * @@
   drivers/firmware/samsung/exynos-acpm.c:549:21: sparse:     expected struct exynos_acpm_shmem_chan *shmem_chans
   drivers/firmware/samsung/exynos-acpm.c:549:21: sparse:     got void [noderef] __iomem *
   drivers/firmware/samsung/exynos-acpm.c:562:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:562:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:562:30: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:568:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:568:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:568:33: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:569:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:569:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:569:28: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:570:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:570:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:570:30: sparse:     got unsigned int *
>> drivers/firmware/samsung/exynos-acpm.c:658:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct exynos_acpm_shmem *shmem @@     got void [noderef] __iomem * @@
   drivers/firmware/samsung/exynos-acpm.c:658:28: sparse:     expected struct exynos_acpm_shmem *shmem
   drivers/firmware/samsung/exynos-acpm.c:658:28: sparse:     got void [noderef] __iomem *

vim +493 drivers/firmware/samsung/exynos-acpm.c

   486	
   487	static void exynos_acpm_rx_queue_init(struct exynos_acpm *exynos_acpm,
   488					      struct exynos_acpm_shmem_chan *shmem_chan,
   489					      struct exynos_acpm_queue *rx)
   490	{
   491		void __iomem *base = exynos_acpm->sram_base;
   492	
 > 493		rx->base = exynos_acpm_get_iomem_addr(base, &shmem_chan->tx_base);
   494		rx->front = exynos_acpm_get_iomem_addr(base, &shmem_chan->tx_front);
   495		rx->rear = exynos_acpm_get_iomem_addr(base, &shmem_chan->tx_rear);
   496	}
   497	
   498	static void exynos_acpm_tx_queue_init(struct exynos_acpm *exynos_acpm,
   499					      struct exynos_acpm_shmem_chan *shmem_chan,
   500					      struct exynos_acpm_queue *tx)
   501	{
   502		void __iomem *base = exynos_acpm->sram_base;
   503	
   504		tx->base = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_base);
   505		tx->front = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_front);
   506		tx->rear = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_rear);
   507	}
   508	
   509	static int exynos_acpm_alloc_cmds(struct exynos_acpm *exynos_acpm,
   510					  struct exynos_acpm_chan *chan)
   511	{
   512		struct device *dev = exynos_acpm->dev;
   513		struct exynos_acpm_rx_data *rx_data;
   514		unsigned int mlen = chan->mlen;
   515		int i;
   516	
   517		for (i = 0; i < EXYNOS_ACPM_SEQNUM_MAX; i++) {
   518			rx_data = &chan->rx_data[i];
   519			rx_data->cmd = devm_kcalloc(dev, mlen, sizeof(*(rx_data->cmd)),
   520						    GFP_KERNEL);
   521			if (!rx_data->cmd)
   522				return -ENOMEM;
   523		}
   524	
   525		return 0;
   526	}
   527	
   528	static int exynos_acpm_chans_init(struct exynos_acpm *exynos_acpm)
   529	{
   530		struct exynos_acpm_shmem_chan *shmem_chans, *shmem_chan;
   531		struct exynos_acpm_shmem *shmem = exynos_acpm->shmem;
   532		struct mbox_chan *mbox_chan, *mbox_chans;
   533		struct exynos_acpm_chan *chan, *chans;
   534		struct device *dev = exynos_acpm->dev;
   535		int i, ret;
   536	
 > 537		exynos_acpm->num_chans = readl_relaxed(&shmem->num_chans);
   538	
   539		mbox_chans = devm_kcalloc(dev, exynos_acpm->num_chans,
   540					  sizeof(*mbox_chans), GFP_KERNEL);
   541		if (!mbox_chans)
   542			return -ENOMEM;
   543	
   544		chans = devm_kcalloc(dev, exynos_acpm->num_chans, sizeof(*chans),
   545				     GFP_KERNEL);
   546		if (!chans)
   547			return -ENOMEM;
   548	
 > 549		shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
   550							 &shmem->chans);
   551	
   552		for (i = 0; i < exynos_acpm->num_chans; i++) {
   553			shmem_chan = &shmem_chans[i];
   554			mbox_chan = &mbox_chans[i];
   555			chan = &chans[i];
   556	
   557			/* Set parameters for the mailbox channel. */
   558			mbox_chan->con_priv = chan;
   559			mbox_chan->mbox = exynos_acpm->mbox;
   560	
   561			/* Set parameters for the ACPM channel. */
   562			chan->mlen = readl_relaxed(&shmem_chan->mlen);
   563	
   564			ret = exynos_acpm_alloc_cmds(exynos_acpm, chan);
   565			if (ret)
   566				return ret;
   567	
   568			chan->polling = readl_relaxed(&shmem_chan->polling);
   569			chan->id = readl_relaxed(&shmem_chan->id);
   570			chan->qlen = readl_relaxed(&shmem_chan->qlen);
   571	
   572			exynos_acpm_rx_queue_init(exynos_acpm, shmem_chan, &chan->rx);
   573			exynos_acpm_tx_queue_init(exynos_acpm, shmem_chan, &chan->tx);
   574	
   575			mutex_init(&chan->rx_lock);
   576			spin_lock_init(&chan->tx_lock);
   577	
   578			dev_vdbg(dev, "ID = %d poll = %d, mlen = %d, qlen = %d\n",
   579				 chan->id, chan->polling, chan->mlen, chan->qlen);
   580		}
   581	
   582		/* Save pointers to the ACPM and mailbox channels. */
   583		exynos_acpm->mbox->chans = mbox_chans;
   584		exynos_acpm->chans = chans;
   585	
   586		return 0;
   587	}
   588	
   589	static const struct of_device_id exynos_acpm_match[] = {
   590		{ .compatible = "google,gs101-acpm" },
   591		{},
   592	};
   593	MODULE_DEVICE_TABLE(of, exynos_acpm_match);
   594	
   595	static int exynos_acpm_probe(struct platform_device *pdev)
   596	{
   597		struct device_node *node = pdev->dev.of_node;
   598		struct device *dev = &pdev->dev;
   599		struct exynos_acpm *exynos_acpm;
   600		struct mbox_controller *mbox;
   601		struct device_node *shmem;
   602		resource_size_t size;
   603		struct resource res;
   604		const __be32 *prop;
   605		int ret;
   606	
   607		exynos_acpm = devm_kzalloc(dev, sizeof(*exynos_acpm), GFP_KERNEL);
   608		if (!exynos_acpm)
   609			return -ENOMEM;
   610	
   611		mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
   612		if (!mbox)
   613			return -ENOMEM;
   614	
   615		exynos_acpm->regs = devm_platform_ioremap_resource(pdev, 0);
   616		if (IS_ERR(exynos_acpm->regs))
   617			return PTR_ERR(exynos_acpm->regs);
   618	
   619		shmem = of_parse_phandle(node, "shmem", 0);
   620		ret = of_address_to_resource(shmem, 0, &res);
   621		of_node_put(shmem);
   622		if (ret) {
   623			dev_err(dev, "Failed to get shared memory.\n");
   624			return ret;
   625		}
   626	
   627		size = resource_size(&res);
   628		exynos_acpm->sram_base = devm_ioremap(dev, res.start, size);
   629		if (!exynos_acpm->sram_base) {
   630			dev_err(dev, "Failed to ioremap shared memory.\n");
   631			return -ENOMEM;
   632		}
   633	
   634		prop = of_get_property(node, "initdata-base", NULL);
   635		if (!prop) {
   636			dev_err(dev, "Parsing initdata_base failed.\n");
   637			return -EINVAL;
   638		}
   639	
   640		exynos_acpm->pclk = devm_clk_get(dev, "pclk");
   641		if (IS_ERR(exynos_acpm->pclk)) {
   642			dev_err(dev, "Missing peripheral clock.\n");
   643			return PTR_ERR(exynos_acpm->pclk);
   644		}
   645	
   646		ret = clk_prepare_enable(exynos_acpm->pclk);
   647		if (ret) {
   648			dev_err(dev, "Failed to enable the peripheral clock.\n");
   649			return ret;
   650		}
   651	
   652		exynos_acpm->wq = alloc_workqueue("exynos-acpm-wq", 0, 0);
   653		if (!exynos_acpm->wq)
   654			return -ENOMEM;
   655	
   656		exynos_acpm->dev = dev;
   657		exynos_acpm->mbox = mbox;
 > 658		exynos_acpm->shmem = exynos_acpm->sram_base + be32_to_cpup(prop);
   659	
   660		ret = exynos_acpm_chans_init(exynos_acpm);
   661		if (ret)
   662			return ret;
   663	
   664		mbox->num_chans = exynos_acpm->num_chans;
   665		mbox->dev = dev;
   666		mbox->ops = &exynos_acpm_chan_ops;
   667	
   668		platform_set_drvdata(pdev, exynos_acpm);
   669	
   670		/* Mask out all interrupts. We support just polling channels for now. */
   671		writel_relaxed(EXYNOS_ACPM_INTMR0_MASK,
   672			       exynos_acpm->regs + EXYNOS_ACPM_INTMR0);
   673	
   674		ret = devm_mbox_controller_register(dev, mbox);
   675		if (ret)
   676			dev_err(dev, "Failed to register mbox_controller(%d).\n", ret);
   677	
   678		return ret;
   679	}
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
