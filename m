Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD81C20FC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693391339; x=1724927339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rcCvP8aF17ohrrd5fI15HgY6f+ZPpnrrKrzyedPsP0g=;
  b=iDLokAK5StJxfpcb+Cg54ui0lL3PmkCs+uzNvPzPqiZJxB8+MUbjSeao
   aj/NEPTGCbJ03rm+wG1wTaftKfCRNduj5Ras8gb8iZAX8WBWz6mksqZFZ
   06Yr+TxW84tt9va6Vb6sERWekp96XOS0LLNxNztuYk96r7OZXUSlal9Bl
   c02IMi98wxEP7be1lr2u9QWtAFSVAzqcUoKYYihbdhXfGBP1IPLPYawNP
   QinVaZmihqa/zLbqqMpHCiJbbF10159qFtLdpb1ETFOob1R91CNbBZhJ1
   4xock8KTlsZ7nUoBGA18ZrK5umvDSfnMcGuHiDGNFYeSC1FddvA0NWVXR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374517981"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="374517981"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912739822"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="912739822"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Aug 2023 03:28:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbIRO-0009i7-2T;
	Wed, 30 Aug 2023 10:28:54 +0000
Date: Wed, 30 Aug 2023 18:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 12/22]
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1595:22: warning:
 unused variable 'reg'
Message-ID: <202308301826.53F4CKHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   12887ba38dafb36e03a9f5201493ce46f903f0d4
commit: 76993440d38f2d12fb7d8f0f6ec069f93eb6a648 [12/22] media: ti: j721e-csi2rx: Assert pixel reset before stopping last stream
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308301826.53F4CKHJ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301826.53F4CKHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301826.53F4CKHJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c: In function 'ti_csi2rx_probe':
>> drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1595:22: warning: unused variable 'reg' [-Wunused-variable]
    1595 |         unsigned int reg;
         |                      ^~~
   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c: At top level:
   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1353:45: warning: 'ti_csi2rx_video_entity_ops' defined but not used [-Wunused-const-variable=]
    1353 | static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/reg +1595 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c

ecd7c87edbb4d5 Jai Luthra     2023-04-21  1588  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1589  static int ti_csi2rx_probe(struct platform_device *pdev)
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1590  {
de841fe23ba791 Pratyush Yadav 2023-04-21  1591  	struct device_node *np = pdev->dev.of_node;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1592  	struct ti_csi2rx_dev *csi;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1593  	struct resource *res;
de841fe23ba791 Pratyush Yadav 2023-04-21  1594  	int ret, i, count;
107a37d07ee302 Pratyush Yadav 2023-04-21 @1595  	unsigned int reg;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1596  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1597  	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1598  	if (!csi)
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1599  		return -ENOMEM;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1600  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1601  	csi->dev = &pdev->dev;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1602  	platform_set_drvdata(pdev, csi);
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1603  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1604  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1605  	csi->shim = devm_ioremap_resource(&pdev->dev, res);
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1606  	if (IS_ERR(csi->shim)) {
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1607  		ret = PTR_ERR(csi->shim);
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1608  		return ret;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1609  	}
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1610  
de841fe23ba791 Pratyush Yadav 2023-04-21  1611  	/* Only use as many contexts as the number of DMA channels allocated. */
de841fe23ba791 Pratyush Yadav 2023-04-21  1612  	count = of_property_count_strings(np, "dma-names");
de841fe23ba791 Pratyush Yadav 2023-04-21  1613  	if (count < 0) {
de841fe23ba791 Pratyush Yadav 2023-04-21  1614  		dev_err(csi->dev, "Failed to get DMA channel count: %d\n",
de841fe23ba791 Pratyush Yadav 2023-04-21  1615  			count);
de841fe23ba791 Pratyush Yadav 2023-04-21  1616  		return count;
de841fe23ba791 Pratyush Yadav 2023-04-21  1617  	}
de841fe23ba791 Pratyush Yadav 2023-04-21  1618  
de841fe23ba791 Pratyush Yadav 2023-04-21  1619  	csi->num_ctx = count;
de841fe23ba791 Pratyush Yadav 2023-04-21  1620  	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
de841fe23ba791 Pratyush Yadav 2023-04-21  1621  		dev_warn(csi->dev,
de841fe23ba791 Pratyush Yadav 2023-04-21  1622  			 "%u DMA channels passed. Maximum is %u. Ignoring the rest.\n",
de841fe23ba791 Pratyush Yadav 2023-04-21  1623  			 csi->num_ctx, TI_CSI2RX_MAX_CTX);
de841fe23ba791 Pratyush Yadav 2023-04-21  1624  		csi->num_ctx = TI_CSI2RX_MAX_CTX;
de841fe23ba791 Pratyush Yadav 2023-04-21  1625  	}
de841fe23ba791 Pratyush Yadav 2023-04-21  1626  
6c0ca3d69b404a Pratyush Yadav 2023-04-21  1627  	mutex_init(&csi->mutex);
6c0ca3d69b404a Pratyush Yadav 2023-04-21  1628  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1629  	ret = ti_csi2rx_v4l2_init(csi);
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1630  	if (ret)
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1631  		return ret;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1632  
de841fe23ba791 Pratyush Yadav 2023-04-21  1633  	for (i = 0; i < csi->num_ctx; i++) {
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1634  		csi->ctx[i].idx = i;
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1635  		csi->ctx[i].csi = csi;
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1636  		ret = ti_csi2rx_init_ctx(&csi->ctx[i]);
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1637  		if (ret)
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1638  			goto cleanup_ctx;
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1639  	}
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1640  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1641  	ret = ti_csi2rx_init_subdev(csi);
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1642  	if (ret)
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1643  		goto cleanup_ctx;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1644  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1645  	ret = of_platform_populate(csi->dev->of_node, NULL, NULL, csi->dev);
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1646  	if (ret) {
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1647  		dev_err(csi->dev, "Failed to create children: %d\n", ret);
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1648  		goto cleanup_subdev;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1649  	}
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1650  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1651  	return 0;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1652  
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1653  cleanup_subdev:
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1654  	ti_csi2rx_cleanup_subdev(csi);
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1655  cleanup_ctx:
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1656  
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1657  	i--;
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1658  	for (; i >= 0; i--)
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1659  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
8d22a2769b4e64 Pratyush Yadav 2023-04-21  1660  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1661  	ti_csi2rx_cleanup_v4l2(csi);
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1662  	return ret;
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1663  }
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  1664  

:::::: The code at line 1595 was first introduced by commit
:::::: 107a37d07ee302b8b1673a3986e5e14ff423f47b media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts

:::::: TO: Pratyush Yadav <p.yadav@ti.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
