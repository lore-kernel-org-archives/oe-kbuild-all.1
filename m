Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD3A19F12D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 01:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778894772; cv=none; b=u3LFgD8DFfCNrqLnu/LzrzAXhriupGuzY+O+S/f/0QS/uecMdt9zzi2R82FqozbgyUryI5AXThNOveXe+CzDl1rd9WWdf3rKg+kIy9Im4kFRYm7HoknR87kBwZW331vkdTTppcA6oRB9DVQ7J/OfA4COEY340/C+dPlLLKgoNwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778894772; c=relaxed/simple;
	bh=zW1mRm0rugOepbJM7GQ+sZJt5/8nuNG1djMWO5xNk78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tHmdP429m9WoIfWCgMjXJLIy2YBdrpq0etn/llAWohstbd/6XI/Bgi/fCQnty8Axr0pX9mXIoEJIEnwAZs/fEbDBuHLh/jKKbG1spnfRUYNJVZwxbcJVAGfh4YDZqsUqEo1Fwb4m3UlPuYDbSzk/00rS8K3Lzl0UqgdGtke/9Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaWiB+Mq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaWiB+Mq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778894769; x=1810430769;
  h=date:from:to:cc:subject:message-id;
  bh=zW1mRm0rugOepbJM7GQ+sZJt5/8nuNG1djMWO5xNk78=;
  b=DaWiB+MqHHPnL9R/pj5cr2DtpxssQRYgLcU9gKEFZEZAhsXl4wVyD50l
   n/i4rteQPniTLvN5tIHGUd1wxAmB/2b4BAzB/cgjMGp4/W1OIzQY4Hcju
   aZxOO5iMsBxg28k4C3bLcjFBvfJCrDKkLJqfuttfAC1QrI/feFKC7P+zn
   Yn9AvU1biPAQox4hdpB2sCh6Tt9/+wXV6KdUWBMvQHHvGu0GV48SpGnos
   oUPOLLLP5aK0FBYNOhprpjESDF+yUFp4S23JRZuIfpgB8+MWlkqYAIK3L
   3Rf4AzhLgEwtVjvDXB2ZYvQM7SqLfOWXM0rwvA4RFRR6uM9FKnt7jUGh2
   g==;
X-CSE-ConnectionGUID: RT94tL+4Qa2tUnJESjnfZw==
X-CSE-MsgGUID: W3cPiSLvQjmFjjdClIuHyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="67379939"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="67379939"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 18:26:08 -0700
X-CSE-ConnectionGUID: 9ofD76U5Q6SjNg0w/n4Dvg==
X-CSE-MsgGUID: KZvv/VG2TiSWwEkv37M+2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="235809914"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 May 2026 18:26:07 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO3n2-000000000Kp-3zUH;
	Sat, 16 May 2026 01:26:04 +0000
Date: Sat, 16 May 2026 09:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wens@csie.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:sunxi-wip 21/29] drivers/mmc/host/sunxi-mmc.c:1517:25:
 error: implicit declaration of function 'FIELD_GET'
Message-ID: <202605160908.HBqwvqzZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   1cdb4d4846ffaddce6d648dbbfcdcca78f8a0bcc
commit: 2abb9ce9741414211f8e0a2e94cfbedc4f08e613 [21/29] WIP: mmc: sunxi: tuning
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605160908.HBqwvqzZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160908.HBqwvqzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160908.HBqwvqzZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/mmc/host/sunxi-mmc.c:15:
   drivers/mmc/host/sunxi-mmc.c: In function 'sunxi_mmc_probe':
>> drivers/mmc/host/sunxi-mmc.c:1517:25: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
    1517 |                         FIELD_GET(GENMASK(23, 16), val),
         |                         ^~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/mmc/host/sunxi-mmc.c:1516:17: note: in expansion of macro 'dev_info'
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                 ^~~~~~~~
>> drivers/mmc/host/sunxi-mmc.c:1516:38: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/mmc/host/sunxi-mmc.c:1516:17: note: in expansion of macro 'dev_info'
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                 ^~~~~~~~
   drivers/mmc/host/sunxi-mmc.c:1516:55: note: format string is defined here
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                                                     ~~^
         |                                                       |
         |                                                       long unsigned int
         |                                                     %u
   drivers/mmc/host/sunxi-mmc.c:1516:38: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'int' [-Wformat=]
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/mmc/host/sunxi-mmc.c:1516:17: note: in expansion of macro 'dev_info'
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                 ^~~~~~~~
   drivers/mmc/host/sunxi-mmc.c:1516:59: note: format string is defined here
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                                                         ~~^
         |                                                           |
         |                                                           long unsigned int
         |                                                         %u
   drivers/mmc/host/sunxi-mmc.c:1516:38: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'int' [-Wformat=]
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/mmc/host/sunxi-mmc.c:1516:17: note: in expansion of macro 'dev_info'
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                 ^~~~~~~~
   drivers/mmc/host/sunxi-mmc.c:1516:63: note: format string is defined here
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                                                             ~~^
         |                                                               |
         |                                                               long unsigned int
         |                                                             %u


vim +/FIELD_GET +1517 drivers/mmc/host/sunxi-mmc.c

  1414	
  1415	static int sunxi_mmc_probe(struct platform_device *pdev)
  1416	{
  1417		struct sunxi_mmc_host *host;
  1418		struct mmc_host *mmc;
  1419		u32 val;
  1420		int ret;
  1421	
  1422		mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(*host));
  1423		if (!mmc)
  1424			return dev_err_probe(&pdev->dev, -ENOMEM,
  1425					     "mmc alloc host failed\n");
  1426		platform_set_drvdata(pdev, mmc);
  1427	
  1428		host = mmc_priv(mmc);
  1429		host->dev = &pdev->dev;
  1430		host->mmc = mmc;
  1431		spin_lock_init(&host->lock);
  1432	
  1433		ret = sunxi_mmc_resource_request(host, pdev);
  1434		if (ret)
  1435			return ret;
  1436	
  1437		host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
  1438						  &host->sg_dma, GFP_KERNEL);
  1439		if (!host->sg_cpu)
  1440			return dev_err_probe(&pdev->dev, -ENOMEM,
  1441					     "Failed to allocate DMA descriptor mem\n");
  1442	
  1443		if (host->cfg->ccu_has_timings_switch) {
  1444			/*
  1445			 * Supports both old and new timing modes.
  1446			 * Try setting the clk to new timing mode.
  1447			 */
  1448			sunxi_ccu_set_mmc_timing_mode(host->clk_mmc, true);
  1449	
  1450			/* And check the result */
  1451			ret = sunxi_ccu_get_mmc_timing_mode(host->clk_mmc);
  1452			if (ret < 0) {
  1453				/*
  1454				 * For whatever reason we were not able to get
  1455				 * the current active mode. Default to old mode.
  1456				 */
  1457				dev_warn(&pdev->dev, "MMC clk timing mode unknown\n");
  1458				host->use_new_timings = false;
  1459			} else {
  1460				host->use_new_timings = !!ret;
  1461			}
  1462		} else if (host->cfg->needs_new_timings) {
  1463			/* Supports new timing mode only */
  1464			host->use_new_timings = true;
  1465		}
  1466	
  1467		mmc->ops		= &sunxi_mmc_ops;
  1468		mmc->max_blk_count	= 8192;
  1469		mmc->max_blk_size	= 4096;
  1470		mmc->max_segs		= PAGE_SIZE / sizeof(struct sunxi_idma_des);
  1471		mmc->max_seg_size	= (1 << host->cfg->idma_des_size_bits);
  1472		mmc->max_req_size	= mmc->max_seg_size * mmc->max_segs;
  1473		/* 400kHz ~ 52MHz */
  1474		mmc->f_min		=   400000;
  1475		mmc->f_max		= 52000000;
  1476		mmc->caps	       |= MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
  1477					  MMC_CAP_SDIO_IRQ;
  1478	
  1479		/*
  1480		 * Some H5 devices do not have signal traces precise enough to
  1481		 * use HS DDR mode for their eMMC chips.
  1482		 *
  1483		 * We still enable HS DDR modes for all the other controller
  1484		 * variants that support them.
  1485		 */
  1486		if ((host->cfg->clk_delays || host->use_new_timings) &&
  1487		    !of_device_is_compatible(pdev->dev.of_node,
  1488					     "allwinner,sun50i-h5-emmc"))
  1489			mmc->caps      |= MMC_CAP_1_8V_DDR | MMC_CAP_3_3V_DDR;
  1490	
  1491		ret = mmc_of_parse(mmc);
  1492		if (ret)
  1493			goto error_free_dma;
  1494	
  1495		/*
  1496		 * If we don't support delay chains in the SoC, we can't use any
  1497		 * of the higher speed modes. Mask them out in case the device
  1498		 * tree specifies the properties for them, which gets added to
  1499		 * the caps by mmc_of_parse() above.
  1500		 */
  1501		if (!(host->cfg->clk_delays || host->use_new_timings)) {
  1502			mmc->caps &= ~(MMC_CAP_3_3V_DDR | MMC_CAP_1_8V_DDR |
  1503				       MMC_CAP_1_2V_DDR | MMC_CAP_UHS);
  1504			mmc->caps2 &= ~MMC_CAP2_HS200;
  1505		}
  1506	
  1507		/* TODO: This driver doesn't support HS400 mode yet */
  1508		mmc->caps2 &= ~MMC_CAP2_HS400;
  1509	
  1510		ret = sunxi_mmc_init_host(host);
  1511		if (ret)
  1512			goto error_free_dma;
  1513	
  1514		val = mmc_readl(host, REG_VER_SMCV) & SDXC_VER_MASK;
  1515		if (val)
> 1516			dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
> 1517				FIELD_GET(GENMASK(23, 16), val),
  1518				FIELD_GET(GENMASK(15, 8), val),
  1519				FIELD_GET(GENMASK(7, 0), val));
  1520	
  1521		pm_runtime_set_active(&pdev->dev);
  1522		pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
  1523		pm_runtime_use_autosuspend(&pdev->dev);
  1524		pm_runtime_enable(&pdev->dev);
  1525	
  1526		ret = mmc_add_host(mmc);
  1527		if (ret)
  1528			goto error_free_dma;
  1529	
  1530		dev_info(&pdev->dev, "initialized, max. request size: %u KB%s\n",
  1531			 mmc->max_req_size >> 10,
  1532			 host->use_new_timings ? ", uses new timings mode" : "");
  1533	
  1534		return 0;
  1535	
  1536	error_free_dma:
  1537		dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host->sg_dma);
  1538		return ret;
  1539	}
  1540	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
