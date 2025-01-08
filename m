Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5701FE468
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736349095; cv=none; b=pFpP/lfDbdHybiDcmTAWO4/7TVop/bmEd1R/c+fEX+0mwALipS1GYbs69KM0+jtpraqRogWh0mzVV3ebQa7y/T/15JX0+1tahj2nnZyZaDgwwmTbOZiTs/XVMGWyvvfKc6DQXyy6oK2duQBRMGRGZoG+9Ih/FOp0R55itEyhTmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736349095; c=relaxed/simple;
	bh=66wDIrFV8SVf/YLLAkD3Cn02kWHP78hTO3i6bDLuJl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o2X6s1WUNmDcwA+QEMrh3Ddjxn1MSmgoMOeKAOM507uBDmNXjpMeTuRAsfPaZZAo2eWg7+OaHOJBjqtlrW/Ar5XxPotu4bt/C1zTXChqZKfIud49OY027vz1lW6kSkomlbxQvbNpuFezBmhySLFczCzBskciYsVEHnvpTz5DgiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhTD5Xwh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhTD5Xwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736349094; x=1767885094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66wDIrFV8SVf/YLLAkD3Cn02kWHP78hTO3i6bDLuJl0=;
  b=XhTD5XwhdS/hd4dZYsya3nqz3cNS1fTD4/KuBlbeYiChD1wBR/K55rj6
   mu7qSNEXF+GNfvjbl9Ps+dkdjX+1oJgMJMxoFKfIKx/N9G29FItw41x7Q
   3GRv9vgU/r+fJtwMtOW/vVuAQtnXKTkZBQdnJ5TKcMYRJwRlKrCVJMGFn
   TZb2Qehit1hy22O2j3S6iJ9jMqNAeCTggQg5VUn5IKGa+8CKbAdoWgc61
   x7sI2jzggMzhALKXIAFfPor7EU4Ht/aUCpfz53Gi9EHhh3lbeqSKeKl/Q
   k9JXhk8YqN9lhLLrS/wtFjF1UQW6y/sX7NgdsBnm851fwWk2TA4hqmpgB
   Q==;
X-CSE-ConnectionGUID: VV6DrRbjTQ+mQAo49ZeeZQ==
X-CSE-MsgGUID: mY8hlyzWScGe03faSWP7lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="24184885"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="24184885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 07:11:33 -0800
X-CSE-ConnectionGUID: slP2Ok4ZRYinFUwN8o2BhA==
X-CSE-MsgGUID: mdtTyVwiTUy8P942LWiwVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103627302"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2025 07:11:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVXiS-000GG3-2m;
	Wed, 08 Jan 2025 15:11:28 +0000
Date: Wed, 8 Jan 2025 23:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: drivers/dma/tegra20-apb-dma.c:1484:64: warning: '%d' directive
 output may be truncated writing between 1 and 8 bytes into a region of size
 5
Message-ID: <202501082311.xokGSZTf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
commit: 6c41ac96ad9217fe2a6f31c9dcc31b97365b21f6 dmaengine: tegra-apb: Support COMPILE_TEST
date:   4 years, 10 months ago
config: arm-randconfig-004-20230928 (https://download.01.org/0day-ci/archive/20250108/202501082311.xokGSZTf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501082311.xokGSZTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082311.xokGSZTf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/tegra20-apb-dma.c:1593:12: warning: 'tegra_dma_runtime_resume' defined but not used [-Wunused-function]
    1593 | static int tegra_dma_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/tegra20-apb-dma.c:1584:12: warning: 'tegra_dma_runtime_suspend' defined but not used [-Wunused-function]
    1584 | static int tegra_dma_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/tegra20-apb-dma.c: In function 'tegra_dma_probe':
>> drivers/dma/tegra20-apb-dma.c:1484:64: warning: '%d' directive output may be truncated writing between 1 and 8 bytes into a region of size 5 [-Wformat-truncation=]
    1484 |                 snprintf(tdc->name, sizeof(tdc->name), "apbdma.%d", i);
         |                                                                ^~
   drivers/dma/tegra20-apb-dma.c:1484:56: note: directive argument in the range [0, 16777215]
    1484 |                 snprintf(tdc->name, sizeof(tdc->name), "apbdma.%d", i);
         |                                                        ^~~~~~~~~~~
   drivers/dma/tegra20-apb-dma.c:1484:17: note: 'snprintf' output between 9 and 16 bytes into a destination of size 12
    1484 |                 snprintf(tdc->name, sizeof(tdc->name), "apbdma.%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1484 drivers/dma/tegra20-apb-dma.c

dcb394b6b5fb7f Dmitry Osipenko    2020-02-09  1419  
463a1f8b3ceebe Bill Pemberton     2012-11-19  1420  static int tegra_dma_probe(struct platform_device *pdev)
ec8a1586780cbb Laxman Dewangan    2012-06-06  1421  {
3964293aecf9c6 Dmitry Osipenko    2020-02-09  1422  	const struct tegra_dma_chip_data *cdata;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1423  	struct tegra_dma *tdma;
3964293aecf9c6 Dmitry Osipenko    2020-02-09  1424  	unsigned int i;
3964293aecf9c6 Dmitry Osipenko    2020-02-09  1425  	size_t size;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1426  	int ret;
dc7badba194227 Stephen Warren     2013-03-11  1427  
333f16ec68f6fc Laxman Dewangan    2016-03-01  1428  	cdata = of_device_get_match_data(&pdev->dev);
3964293aecf9c6 Dmitry Osipenko    2020-02-09  1429  	size = struct_size(tdma, channels, cdata->nr_channels);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1430  
3964293aecf9c6 Dmitry Osipenko    2020-02-09  1431  	tdma = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
aef94fea97eb77 Peter Griffin      2016-06-07  1432  	if (!tdma)
ec8a1586780cbb Laxman Dewangan    2012-06-06  1433  		return -ENOMEM;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1434  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1435  	tdma->dev = &pdev->dev;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1436  	tdma->chip_data = cdata;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1437  	platform_set_drvdata(pdev, tdma);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1438  
c55c745e6f2696 Dmitry Osipenko    2020-02-09  1439  	tdma->base_addr = devm_platform_ioremap_resource(pdev, 0);
7331205a9662a7 Thierry Reding     2013-01-21  1440  	if (IS_ERR(tdma->base_addr))
7331205a9662a7 Thierry Reding     2013-01-21  1441  		return PTR_ERR(tdma->base_addr);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1442  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1443  	tdma->dma_clk = devm_clk_get(&pdev->dev, NULL);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1444  	if (IS_ERR(tdma->dma_clk)) {
ec8a1586780cbb Laxman Dewangan    2012-06-06  1445  		dev_err(&pdev->dev, "Error: Missing controller clock\n");
ec8a1586780cbb Laxman Dewangan    2012-06-06  1446  		return PTR_ERR(tdma->dma_clk);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1447  	}
ec8a1586780cbb Laxman Dewangan    2012-06-06  1448  
9aa433d2a77220 Stephen Warren     2013-11-06  1449  	tdma->rst = devm_reset_control_get(&pdev->dev, "dma");
9aa433d2a77220 Stephen Warren     2013-11-06  1450  	if (IS_ERR(tdma->rst)) {
9aa433d2a77220 Stephen Warren     2013-11-06  1451  		dev_err(&pdev->dev, "Error: Missing reset\n");
9aa433d2a77220 Stephen Warren     2013-11-06  1452  		return PTR_ERR(tdma->rst);
9aa433d2a77220 Stephen Warren     2013-11-06  1453  	}
9aa433d2a77220 Stephen Warren     2013-11-06  1454  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1455  	spin_lock_init(&tdma->global_lock);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1456  
84a3f375eea984 Dmitry Osipenko    2020-02-09  1457  	ret = clk_prepare(tdma->dma_clk);
84a3f375eea984 Dmitry Osipenko    2020-02-09  1458  	if (ret)
84a3f375eea984 Dmitry Osipenko    2020-02-09  1459  		return ret;
84a3f375eea984 Dmitry Osipenko    2020-02-09  1460  
dcb394b6b5fb7f Dmitry Osipenko    2020-02-09  1461  	ret = tegra_dma_init_hw(tdma);
dcb394b6b5fb7f Dmitry Osipenko    2020-02-09  1462  	if (ret)
dcb394b6b5fb7f Dmitry Osipenko    2020-02-09  1463  		goto err_clk_unprepare;
dcb394b6b5fb7f Dmitry Osipenko    2020-02-09  1464  
84a3f375eea984 Dmitry Osipenko    2020-02-09  1465  	pm_runtime_irq_safe(&pdev->dev);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1466  	pm_runtime_enable(&pdev->dev);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1467  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1468  	INIT_LIST_HEAD(&tdma->dma_dev.channels);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1469  	for (i = 0; i < cdata->nr_channels; i++) {
ec8a1586780cbb Laxman Dewangan    2012-06-06  1470  		struct tegra_dma_channel *tdc = &tdma->channels[i];
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1471  		int irq;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1472  
13a3328638dd00 Jon Hunter         2015-08-06  1473  		tdc->chan_addr = tdma->base_addr +
13a3328638dd00 Jon Hunter         2015-08-06  1474  				 TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET +
13a3328638dd00 Jon Hunter         2015-08-06  1475  				 (i * cdata->channel_reg_size);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1476  
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1477  		irq = platform_get_irq(pdev, i);
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1478  		if (irq < 0) {
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1479  			ret = irq;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1480  			dev_err(&pdev->dev, "No irq resource for chan %d\n", i);
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1481  			goto err_pm_disable;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1482  		}
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1483  
d0fc905429f7f5 Laxman Dewangan    2012-10-03 @1484  		snprintf(tdc->name, sizeof(tdc->name), "apbdma.%d", i);
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1485  		ret = devm_request_irq(&pdev->dev, irq, tegra_dma_isr, 0,
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1486  				       tdc->name, tdc);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1487  		if (ret) {
ec8a1586780cbb Laxman Dewangan    2012-06-06  1488  			dev_err(&pdev->dev,
ec8a1586780cbb Laxman Dewangan    2012-06-06  1489  				"request_irq failed with err %d channel %d\n",
ac7ae754d59257 Dmitry Osipenko    2013-05-11  1490  				ret, i);
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1491  			goto err_pm_disable;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1492  		}
ec8a1586780cbb Laxman Dewangan    2012-06-06  1493  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1494  		tdc->dma_chan.device = &tdma->dma_dev;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1495  		dma_cookie_init(&tdc->dma_chan);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1496  		list_add_tail(&tdc->dma_chan.device_node,
ec8a1586780cbb Laxman Dewangan    2012-06-06  1497  			      &tdma->dma_dev.channels);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1498  		tdc->tdma = tdma;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1499  		tdc->id = i;
00ef4490ebfa41 Shardar Shariff Md 2016-04-23  1500  		tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1501  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1502  		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
ec8a1586780cbb Laxman Dewangan    2012-06-06  1503  			     (unsigned long)tdc);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1504  		spin_lock_init(&tdc->lock);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1505  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1506  		INIT_LIST_HEAD(&tdc->pending_sg_req);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1507  		INIT_LIST_HEAD(&tdc->free_sg_req);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1508  		INIT_LIST_HEAD(&tdc->free_dma_desc);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1509  		INIT_LIST_HEAD(&tdc->cb_desc);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1510  	}
ec8a1586780cbb Laxman Dewangan    2012-06-06  1511  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1512  	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1513  	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
46fb3f8ef5bde1 Laxman Dewangan    2012-06-22  1514  	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
46fb3f8ef5bde1 Laxman Dewangan    2012-06-22  1515  
23a1ec304ae8fd Jon Hunter         2015-08-06  1516  	tdma->global_pause_count = 0;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1517  	tdma->dma_dev.dev = &pdev->dev;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1518  	tdma->dma_dev.device_alloc_chan_resources =
ec8a1586780cbb Laxman Dewangan    2012-06-06  1519  					tegra_dma_alloc_chan_resources;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1520  	tdma->dma_dev.device_free_chan_resources =
ec8a1586780cbb Laxman Dewangan    2012-06-06  1521  					tegra_dma_free_chan_resources;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1522  	tdma->dma_dev.device_prep_slave_sg = tegra_dma_prep_slave_sg;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1523  	tdma->dma_dev.device_prep_dma_cyclic = tegra_dma_prep_dma_cyclic;
891653ab836d5a Paul Walmsley      2015-01-06  1524  	tdma->dma_dev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
891653ab836d5a Paul Walmsley      2015-01-06  1525  		BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
891653ab836d5a Paul Walmsley      2015-01-06  1526  		BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
891653ab836d5a Paul Walmsley      2015-01-06  1527  		BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
891653ab836d5a Paul Walmsley      2015-01-06  1528  	tdma->dma_dev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
891653ab836d5a Paul Walmsley      2015-01-06  1529  		BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
891653ab836d5a Paul Walmsley      2015-01-06  1530  		BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
891653ab836d5a Paul Walmsley      2015-01-06  1531  		BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
891653ab836d5a Paul Walmsley      2015-01-06  1532  	tdma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
156a599b0716ab Dmitry Osipenko    2019-07-05  1533  	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
662f1ac3125fc0 Maxime Ripard      2014-11-17  1534  	tdma->dma_dev.device_config = tegra_dma_slave_config;
662f1ac3125fc0 Maxime Ripard      2014-11-17  1535  	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
dda5e35a771043 Dmitry Osipenko    2020-02-09  1536  	tdma->dma_dev.device_synchronize = tegra_dma_synchronize;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1537  	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1538  	tdma->dma_dev.device_issue_pending = tegra_dma_issue_pending;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1539  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1540  	ret = dma_async_device_register(&tdma->dma_dev);
ec8a1586780cbb Laxman Dewangan    2012-06-06  1541  	if (ret < 0) {
ec8a1586780cbb Laxman Dewangan    2012-06-06  1542  		dev_err(&pdev->dev,
ec8a1586780cbb Laxman Dewangan    2012-06-06  1543  			"Tegra20 APB DMA driver registration failed %d\n", ret);
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1544  		goto err_pm_disable;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1545  	}
ec8a1586780cbb Laxman Dewangan    2012-06-06  1546  
996556c92a7060 Stephen Warren     2013-11-11  1547  	ret = of_dma_controller_register(pdev->dev.of_node,
996556c92a7060 Stephen Warren     2013-11-11  1548  					 tegra_dma_of_xlate, tdma);
996556c92a7060 Stephen Warren     2013-11-11  1549  	if (ret < 0) {
996556c92a7060 Stephen Warren     2013-11-11  1550  		dev_err(&pdev->dev,
996556c92a7060 Stephen Warren     2013-11-11  1551  			"Tegra20 APB DMA OF registration failed %d\n", ret);
996556c92a7060 Stephen Warren     2013-11-11  1552  		goto err_unregister_dma_dev;
996556c92a7060 Stephen Warren     2013-11-11  1553  	}
996556c92a7060 Stephen Warren     2013-11-11  1554  
3964293aecf9c6 Dmitry Osipenko    2020-02-09  1555  	dev_info(&pdev->dev, "Tegra20 APB DMA driver registered %u channels\n",
ec8a1586780cbb Laxman Dewangan    2012-06-06  1556  		 cdata->nr_channels);
3964293aecf9c6 Dmitry Osipenko    2020-02-09  1557  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1558  	return 0;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1559  
996556c92a7060 Stephen Warren     2013-11-11  1560  err_unregister_dma_dev:
996556c92a7060 Stephen Warren     2013-11-11  1561  	dma_async_device_unregister(&tdma->dma_dev);
3964293aecf9c6 Dmitry Osipenko    2020-02-09  1562  
2cd3d13cb4aa73 Dmitry Osipenko    2020-02-09  1563  err_pm_disable:
ec8a1586780cbb Laxman Dewangan    2012-06-06  1564  	pm_runtime_disable(&pdev->dev);
dcb394b6b5fb7f Dmitry Osipenko    2020-02-09  1565  
dcb394b6b5fb7f Dmitry Osipenko    2020-02-09  1566  err_clk_unprepare:
84a3f375eea984 Dmitry Osipenko    2020-02-09  1567  	clk_unprepare(tdma->dma_clk);
3964293aecf9c6 Dmitry Osipenko    2020-02-09  1568  
ec8a1586780cbb Laxman Dewangan    2012-06-06  1569  	return ret;
ec8a1586780cbb Laxman Dewangan    2012-06-06  1570  }
ec8a1586780cbb Laxman Dewangan    2012-06-06  1571  

:::::: The code at line 1484 was first introduced by commit
:::::: d0fc905429f7f5f3ad365466669c55b04b92c1e5 dma: tegra: fix interrupt name issue with apb dma.

:::::: TO: Laxman Dewangan <ldewangan@nvidia.com>
:::::: CC: Vinod Koul <vinod.koul@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
