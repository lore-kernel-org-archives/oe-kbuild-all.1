Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B6418024
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 00:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788777; cv=none; b=FcbgytOi7HuMRTjdS+hhqzU5NtxX8bS1bVnZRM9FvJOV5hthAOZMgBzisrrq7+4PD9h6O12xAfTHMvLUf0irFBVfmq/OoNJRG4Sqw/trN61D3r+fZgcUB3EbRIL2yJ02wM8nSWfxfi8T5swCMPgM6bxuN/7WqWH0nGdQiNVlmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788777; c=relaxed/simple;
	bh=bJcoleECoiXMXC0HvgTiPMR+Lv3zd/OJzZ8lZ5yrIJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXNFrRah4Eb+9Eqz30wNMZOXFRn/FxYDK2xBLMzd+OTi7htWNDnW3TZJBsX0Q9A41X/GzuS1kWGUUogVCxyr/yCkP60PSmiX3BpS5g+mHKPTj2GjMSAA5DrCig5jMHbJze6g6xDHNlO+msGxQqEVngDfeXV+9ysTs4Mye+/iFBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gu1AaxwS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gu1AaxwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747788775; x=1779324775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bJcoleECoiXMXC0HvgTiPMR+Lv3zd/OJzZ8lZ5yrIJU=;
  b=gu1AaxwSF0wNpEbwJWuE7ue7R/vf6/ZOYPD4lKBck0bPzw2f5tf72qVJ
   nFWkpzze7WFIX4MbfUk9QKbyQD8NbNAW3M8hTSffBHvaRtNlmaSDxVD1A
   1Azbr/4WpdKZ9slmOkm/fOIUnsUQIxBFY8XvCEGtI59IRYY8Ad+zfsEix
   mPZkd/GUMJiP51EsyDtdNj0bC5adR8+XIYhfrQJ0v0J1BxUbuaIMIopcN
   osf6HYNjkixXcS1re+nxtvMtFsk+zyyJkZMVHRJCKIvkuNTLD2xG7oXL2
   +wGKNkg03RVtkdEi7nEhwAamh5dMypVowv+I+yIQxolFUMOu+MwOoSKiU
   A==;
X-CSE-ConnectionGUID: 12s2cF7IQTSX18qexNLZNw==
X-CSE-MsgGUID: IWro7P+8R+ebTnwAmDUBcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60403599"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60403599"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:52:54 -0700
X-CSE-ConnectionGUID: tDN/ed3+TRGKWBRLI0pYzw==
X-CSE-MsgGUID: E6K1SKLWS/+EPARNLmMO2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140273900"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2025 17:52:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHXhT-000NjM-21;
	Wed, 21 May 2025 00:52:51 +0000
Date: Wed, 21 May 2025 08:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 34/36] mmc: sunxi: Use devm_mmc_alloc_host() helper
Message-ID: <202505210851.GG2RNi84-lkp@intel.com>
References: <e6aa4f46c471bb0178ba9b8bdf285a38f2684d56.1747739323.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6aa4f46c471bb0178ba9b8bdf285a38f2684d56.1747739323.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on eb68ba4af6da720caaf752b5618220efd5cf31dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mmc-alcor-Use-devm_mmc_alloc_host-helper/20250520-194815
base:   eb68ba4af6da720caaf752b5618220efd5cf31dc
patch link:    https://lore.kernel.org/r/e6aa4f46c471bb0178ba9b8bdf285a38f2684d56.1747739323.git.zhoubinbin%40loongson.cn
patch subject: [PATCH 34/36] mmc: sunxi: Use devm_mmc_alloc_host() helper
config: x86_64-buildonly-randconfig-004-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210851.GG2RNi84-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210851.GG2RNi84-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210851.GG2RNi84-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/sunxi-mmc.c: In function 'sunxi_mmc_probe':
>> drivers/mmc/host/sunxi-mmc.c:1391:38: error: stray '`' in program
    1391 |                                      `"Failed to allocate DMA descriptor mem\n");
         |                                      ^


vim +1391 drivers/mmc/host/sunxi-mmc.c

  1365	
  1366	static int sunxi_mmc_probe(struct platform_device *pdev)
  1367	{
  1368		struct sunxi_mmc_host *host;
  1369		struct mmc_host *mmc;
  1370		int ret;
  1371	
  1372		mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(*host));
  1373		if (!mmc)
  1374			return dev_err_probe(&pdev->dev, -ENOMEM,
  1375					     "mmc alloc host failed\n");
  1376		platform_set_drvdata(pdev, mmc);
  1377	
  1378		host = mmc_priv(mmc);
  1379		host->dev = &pdev->dev;
  1380		host->mmc = mmc;
  1381		spin_lock_init(&host->lock);
  1382	
  1383		ret = sunxi_mmc_resource_request(host, pdev);
  1384		if (ret)
  1385			return ret;
  1386	
  1387		host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
  1388						  &host->sg_dma, GFP_KERNEL);
  1389		if (!host->sg_cpu)
  1390			return dev_err_probe(&pdev->dev, -ENOMEM,
> 1391					     `"Failed to allocate DMA descriptor mem\n");
  1392	
  1393		if (host->cfg->ccu_has_timings_switch) {
  1394			/*
  1395			 * Supports both old and new timing modes.
  1396			 * Try setting the clk to new timing mode.
  1397			 */
  1398			sunxi_ccu_set_mmc_timing_mode(host->clk_mmc, true);
  1399	
  1400			/* And check the result */
  1401			ret = sunxi_ccu_get_mmc_timing_mode(host->clk_mmc);
  1402			if (ret < 0) {
  1403				/*
  1404				 * For whatever reason we were not able to get
  1405				 * the current active mode. Default to old mode.
  1406				 */
  1407				dev_warn(&pdev->dev, "MMC clk timing mode unknown\n");
  1408				host->use_new_timings = false;
  1409			} else {
  1410				host->use_new_timings = !!ret;
  1411			}
  1412		} else if (host->cfg->needs_new_timings) {
  1413			/* Supports new timing mode only */
  1414			host->use_new_timings = true;
  1415		}
  1416	
  1417		mmc->ops		= &sunxi_mmc_ops;
  1418		mmc->max_blk_count	= 8192;
  1419		mmc->max_blk_size	= 4096;
  1420		mmc->max_segs		= PAGE_SIZE / sizeof(struct sunxi_idma_des);
  1421		mmc->max_seg_size	= (1 << host->cfg->idma_des_size_bits);
  1422		mmc->max_req_size	= mmc->max_seg_size * mmc->max_segs;
  1423		/* 400kHz ~ 52MHz */
  1424		mmc->f_min		=   400000;
  1425		mmc->f_max		= 52000000;
  1426		mmc->caps	       |= MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
  1427					  MMC_CAP_SDIO_IRQ;
  1428	
  1429		/*
  1430		 * Some H5 devices do not have signal traces precise enough to
  1431		 * use HS DDR mode for their eMMC chips.
  1432		 *
  1433		 * We still enable HS DDR modes for all the other controller
  1434		 * variants that support them.
  1435		 */
  1436		if ((host->cfg->clk_delays || host->use_new_timings) &&
  1437		    !of_device_is_compatible(pdev->dev.of_node,
  1438					     "allwinner,sun50i-h5-emmc"))
  1439			mmc->caps      |= MMC_CAP_1_8V_DDR | MMC_CAP_3_3V_DDR;
  1440	
  1441		ret = mmc_of_parse(mmc);
  1442		if (ret)
  1443			goto error_free_dma;
  1444	
  1445		/*
  1446		 * If we don't support delay chains in the SoC, we can't use any
  1447		 * of the higher speed modes. Mask them out in case the device
  1448		 * tree specifies the properties for them, which gets added to
  1449		 * the caps by mmc_of_parse() above.
  1450		 */
  1451		if (!(host->cfg->clk_delays || host->use_new_timings)) {
  1452			mmc->caps &= ~(MMC_CAP_3_3V_DDR | MMC_CAP_1_8V_DDR |
  1453				       MMC_CAP_1_2V_DDR | MMC_CAP_UHS);
  1454			mmc->caps2 &= ~MMC_CAP2_HS200;
  1455		}
  1456	
  1457		/* TODO: This driver doesn't support HS400 mode yet */
  1458		mmc->caps2 &= ~MMC_CAP2_HS400;
  1459	
  1460		ret = sunxi_mmc_init_host(host);
  1461		if (ret)
  1462			goto error_free_dma;
  1463	
  1464		pm_runtime_set_active(&pdev->dev);
  1465		pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
  1466		pm_runtime_use_autosuspend(&pdev->dev);
  1467		pm_runtime_enable(&pdev->dev);
  1468	
  1469		ret = mmc_add_host(mmc);
  1470		if (ret)
  1471			goto error_free_dma;
  1472	
  1473		dev_info(&pdev->dev, "initialized, max. request size: %u KB%s\n",
  1474			 mmc->max_req_size >> 10,
  1475			 host->use_new_timings ? ", uses new timings mode" : "");
  1476	
  1477		return 0;
  1478	
  1479	error_free_dma:
  1480		dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host->sg_dma);
  1481		return ret;
  1482	}
  1483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
