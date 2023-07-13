Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC0620FA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689244253; x=1720780253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dFISbaM/G0OFVASPy2RObqjnuMj2ErXfV2K0Mq5gBy0=;
  b=EfpqAfw79LUTXrURLLF9t79QAj3u0A/JJEc2VI6nLwQg3RO9laxZdgNv
   rH6DwHsPYitqP+Gjd/VjxtnKF5MGoafjaKdVlJbBoWt4d56Q6xvueqK+K
   rJ6rbVudqmdN1Eqc2ks8YpQMYPBbeSxB9y+2JPZ8rwllKgfVOf5dtcLAg
   WKqNMtNocMDqrcNfn+X0hQv2sz/3pEB2xZLWvrFMrKOsPP7vOPAw3SPjt
   sEbvaOdyxlrwMdQxmiBBkW874qGLdK7bjGO/CpItTMAVWpg/na5nQ/naJ
   VNYVV098uhpRvyeN1d11Zm6ogoNVEboRuL1El9PGQmuUWuSlMd4HTAwEA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="345462318"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="345462318"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 03:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="1052566994"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="1052566994"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2023 03:30:50 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJtb0-0006XB-1B;
	Thu, 13 Jul 2023 10:30:50 +0000
Date: Thu, 13 Jul 2023 18:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [mtd:nand/next 23/28]
 drivers/mtd/nand/onenand/onenand_omap2.c:470:25: warning: 'c' is used
 uninitialized
Message-ID: <202307131843.SjKZ6c6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
head:   2b42d718c7d7f4269d45fb58b4f74d7b2bfb08bd
commit: 2ef5fc30ae167056e7d9a92fc854f0741029fa04 [23/28] mtd: nand: omap: Use devm_platform_get_and_ioremap_resource()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230713/202307131843.SjKZ6c6W-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131843.SjKZ6c6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131843.SjKZ6c6W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/onenand/onenand_omap2.c: In function 'omap2_onenand_probe':
>> drivers/mtd/nand/onenand/onenand_omap2.c:470:25: warning: 'c' is used uninitialized [-Wuninitialized]
     470 |         c->onenand.base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_omap2.c:465:31: note: 'c' was declared here
     465 |         struct omap2_onenand *c;
         |                               ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SM_GCC_8350
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_VIDEOCC_8350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8450
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8550
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]


vim +/c +470 drivers/mtd/nand/onenand/onenand_omap2.c

   458	
   459	static int omap2_onenand_probe(struct platform_device *pdev)
   460	{
   461		u32 val;
   462		dma_cap_mask_t mask;
   463		int freq, latency, r;
   464		struct resource *res;
   465		struct omap2_onenand *c;
   466		struct gpmc_onenand_info info;
   467		struct device *dev = &pdev->dev;
   468		struct device_node *np = dev->of_node;
   469	
 > 470		c->onenand.base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   471		if (IS_ERR(c->onenand.base))
   472			return PTR_ERR(c->onenand.base);
   473	
   474		r = of_property_read_u32(np, "reg", &val);
   475		if (r) {
   476			dev_err(dev, "reg not found in DT\n");
   477			return r;
   478		}
   479	
   480		c = devm_kzalloc(dev, sizeof(struct omap2_onenand), GFP_KERNEL);
   481		if (!c)
   482			return -ENOMEM;
   483	
   484		init_completion(&c->irq_done);
   485		init_completion(&c->dma_done);
   486		c->gpmc_cs = val;
   487		c->phys_base = res->start;
   488	
   489		c->int_gpiod = devm_gpiod_get_optional(dev, "int", GPIOD_IN);
   490		if (IS_ERR(c->int_gpiod)) {
   491			/* Just try again if this happens */
   492			return dev_err_probe(dev, PTR_ERR(c->int_gpiod), "error getting gpio\n");
   493		}
   494	
   495		if (c->int_gpiod) {
   496			r = devm_request_irq(dev, gpiod_to_irq(c->int_gpiod),
   497					     omap2_onenand_interrupt,
   498					     IRQF_TRIGGER_RISING, "onenand", c);
   499			if (r)
   500				return r;
   501	
   502			c->onenand.wait = omap2_onenand_wait;
   503		}
   504	
   505		dma_cap_zero(mask);
   506		dma_cap_set(DMA_MEMCPY, mask);
   507	
   508		c->dma_chan = dma_request_channel(mask, NULL, NULL);
   509		if (c->dma_chan) {
   510			c->onenand.read_bufferram = omap2_onenand_read_bufferram;
   511			c->onenand.write_bufferram = omap2_onenand_write_bufferram;
   512		}
   513	
   514		c->pdev = pdev;
   515		c->mtd.priv = &c->onenand;
   516		c->mtd.dev.parent = dev;
   517		mtd_set_of_node(&c->mtd, dev->of_node);
   518	
   519		dev_info(dev, "initializing on CS%d (0x%08lx), va %p, %s mode\n",
   520			 c->gpmc_cs, c->phys_base, c->onenand.base,
   521			 c->dma_chan ? "DMA" : "PIO");
   522	
   523		r = onenand_scan(&c->mtd, 1);
   524		if (r < 0)
   525			goto err_release_dma;
   526	
   527		freq = omap2_onenand_get_freq(c->onenand.version_id);
   528		if (freq > 0) {
   529			switch (freq) {
   530			case 104:
   531				latency = 7;
   532				break;
   533			case 83:
   534				latency = 6;
   535				break;
   536			case 66:
   537				latency = 5;
   538				break;
   539			case 56:
   540				latency = 4;
   541				break;
   542			default:	/* 40 MHz or lower */
   543				latency = 3;
   544				break;
   545			}
   546	
   547			r = gpmc_omap_onenand_set_timings(dev, c->gpmc_cs,
   548							  freq, latency, &info);
   549			if (r)
   550				goto err_release_onenand;
   551	
   552			r = omap2_onenand_set_cfg(c, info.sync_read, info.sync_write,
   553						  latency, info.burst_len);
   554			if (r)
   555				goto err_release_onenand;
   556	
   557			if (info.sync_read || info.sync_write)
   558				dev_info(dev, "optimized timings for %d MHz\n", freq);
   559		}
   560	
   561		r = mtd_device_register(&c->mtd, NULL, 0);
   562		if (r)
   563			goto err_release_onenand;
   564	
   565		platform_set_drvdata(pdev, c);
   566	
   567		return 0;
   568	
   569	err_release_onenand:
   570		onenand_release(&c->mtd);
   571	err_release_dma:
   572		if (c->dma_chan)
   573			dma_release_channel(c->dma_chan);
   574	
   575		return r;
   576	}
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
