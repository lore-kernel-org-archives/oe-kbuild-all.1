Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA5C328B0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 19:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0y8Sgln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696707807; x=1728243807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=teiKD3HZVi6w07I5PV733ogTwxBAOlo1FDNQV9cNz14=;
  b=D0y8SglnCUSAv0MuMJ4Du5Xk+xW7QgZMjd83OfGwJdi6XSMUKhNG1qm0
   srFY9qNV6iLFxe3PMOi480ZZ9M7dW57CqAadeBqYtWgfiPl2Vez6aw14P
   IfYNSTfDwwvX3EginDGH0VyyLrF9ohXpG8PEXla774jMnk6V96HjIjzQY
   KZ5ujzGhSXzKgM5zYZqnCtZtde1GKcipvi11V9nd48d/g/V5HwdrLOfAG
   FqX2F2dXZ8M6BCPDuzGkOoRbdFCWoF6r16cr4+HmoFYfTyFdq6S2vkOyu
   Ag+XZsNhMXdRcy0kv29RSfJevsf1E8SMW6P1EZwDjxdlAsxTFKor3YAaN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="374283629"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="374283629"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 12:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="876369850"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="876369850"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Oct 2023 12:43:25 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpDCs-0004i1-2f;
	Sat, 07 Oct 2023 19:43:22 +0000
Date: Sun, 8 Oct 2023 03:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 41/43] drivers/misc/nxp-sr1xx.c:584:7:
 warning: assignment makes integer from pointer without a cast
Message-ID: <202310080312.DEpYT2Nc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   46024af913248dff4a8e5bbd5a00cbb901c894a2
commit: 30dee752600323ee56b4ba0c9504475fa7ab6849 [41/43] CHROMIUM: FROMLIST: misc: nxp-sr1xx: UWB driver for sr1xx
config: x86_64-randconfig-004-20231008 (https://download.01.org/0day-ci/archive/20231008/202310080312.DEpYT2Nc-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310080312.DEpYT2Nc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310080312.DEpYT2Nc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/nxp-sr1xx.c: In function 'sr1xx_probe':
>> drivers/misc/nxp-sr1xx.c:584:7: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
      ret = gpiod_irq;
          ^
   drivers/misc/nxp-sr1xx.c:593:7: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
      ret = gpiod_ce;
          ^
   drivers/misc/nxp-sr1xx.c:602:7: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
      ret = gpiod_ri;
          ^
   drivers/misc/nxp-sr1xx.c: At top level:
>> drivers/misc/nxp-sr1xx.c:695:5: warning: no previous declaration for 'sr1xx_dev_suspend' [-Wmissing-declarations]
    int sr1xx_dev_suspend(struct device *dev)
        ^~~~~~~~~~~~~~~~~
>> drivers/misc/nxp-sr1xx.c:710:5: warning: no previous declaration for 'sr1xx_dev_resume' [-Wmissing-declarations]
    int sr1xx_dev_resume(struct device *dev)
        ^~~~~~~~~~~~~~~~


vim +584 drivers/misc/nxp-sr1xx.c

   547	
   548	static int sr1xx_probe(struct spi_device *spi)
   549	{
   550		int ret;
   551		struct sr1xx_dev *sr1xx_dev = NULL;
   552		unsigned int irq_flags;
   553		struct gpio_desc *gpiod_irq;
   554		struct gpio_desc *gpiod_ce;
   555		struct gpio_desc *gpiod_ri;
   556	
   557		dev_info(&spi->dev, "%s chip select : %d , bus number = %d\n", __func__,
   558			 spi->chip_select, spi->master->bus_num);
   559	
   560		sr1xx_dev = kzalloc(sizeof(*sr1xx_dev), GFP_KERNEL);
   561		if (!sr1xx_dev) {
   562			ret = -ENOMEM;
   563			goto err_exit;
   564		}
   565	
   566		spi->bits_per_word = 8;
   567		spi->mode = SPI_MODE_0;
   568		spi->max_speed_hz = SR1XX_SPI_CLOCK;
   569		ret = spi_setup(spi);
   570		if (ret < 0) {
   571			dev_err(&spi->dev, "failed to do spi_setup()\n");
   572			goto err_setup;
   573		}
   574	
   575		sr1xx_dev->spi = spi;
   576		sr1xx_dev->sr1xx_device.minor = MISC_DYNAMIC_MINOR;
   577		sr1xx_dev->sr1xx_device.name = "sr1xx";
   578		sr1xx_dev->sr1xx_device.fops = &sr1xx_dev_fops;
   579		sr1xx_dev->sr1xx_device.parent = &spi->dev;
   580	
   581		gpiod_irq = devm_gpiod_get(&spi->dev, "nxp,sr1xx-irq", GPIOD_IN);
   582		if (IS_ERR(gpiod_irq)) {
   583			dev_err(&spi->dev, "failed to do fetch irq gpio desc\n");
 > 584			ret = gpiod_irq;
   585			goto err_setup;
   586		} else {
   587			sr1xx_dev->irq_gpio = desc_to_gpio(gpiod_irq);
   588		}
   589	
   590		gpiod_ce = devm_gpiod_get(&spi->dev, "nxp,sr1xx-ce", GPIOD_OUT_LOW);
   591		if (IS_ERR(gpiod_ce)) {
   592			dev_err(&spi->dev, "failed to do fetch ce gpio desc\n");
   593			ret = gpiod_ce;
   594			goto err_setup;
   595		} else {
   596			sr1xx_dev->ce_gpio = desc_to_gpio(gpiod_ce);
   597		}
   598	
   599		gpiod_ri = devm_gpiod_get(&spi->dev, "nxp,sr1xx-ri", GPIOD_OUT_LOW);
   600		if (IS_ERR(gpiod_ri)) {
   601			dev_err(&spi->dev, "failed to do fetch ri gpio desc\n");
   602			ret = gpiod_ri;
   603			goto err_setup;
   604		} else {
   605			sr1xx_dev->spi_handshake_gpio = desc_to_gpio(gpiod_ri);
   606		}
   607	
   608		dev_set_drvdata(&spi->dev, sr1xx_dev);
   609	
   610		/* init mutex and queues */
   611		init_waitqueue_head(&sr1xx_dev->read_wq);
   612		mutex_init(&sr1xx_dev->sr1xx_access_lock);
   613	
   614		spin_lock_init(&sr1xx_dev->irq_enabled_lock);
   615	
   616		ret = misc_register(&sr1xx_dev->sr1xx_device);
   617		if (ret < 0) {
   618			dev_err(&spi->dev, "misc_register failed! %d\n", ret);
   619			goto err_setup;
   620		}
   621	
   622		sr1xx_dev->tx_buffer = kzalloc(SR1XX_TXBUF_SIZE, GFP_KERNEL);
   623		sr1xx_dev->rx_buffer = kzalloc(SR1XX_RXBUF_SIZE, GFP_KERNEL);
   624		if (!sr1xx_dev->tx_buffer) {
   625			ret = -ENOMEM;
   626			goto err_exit;
   627		}
   628		if (!sr1xx_dev->rx_buffer) {
   629			ret = -ENOMEM;
   630			goto err_exit;
   631		}
   632	
   633		sr1xx_dev->spi->irq = gpio_to_irq(sr1xx_dev->irq_gpio);
   634		if (sr1xx_dev->spi->irq < 0) {
   635			dev_err(&spi->dev, "gpio_to_irq request failed gpio = 0x%x\n",
   636				sr1xx_dev->irq_gpio);
   637			goto err_exit;
   638		}
   639		/* request irq. The irq is set whenever the chip has data available
   640		 * for reading. It is cleared when all data has been read.
   641		 */
   642		irq_flags = IRQ_TYPE_LEVEL_HIGH;
   643		sr1xx_dev->irq_enabled = true;
   644		sr1xx_dev->irq_received = false;
   645	
   646		ret = request_irq(sr1xx_dev->spi->irq, sr1xx_dev_irq_handler, irq_flags,
   647				  sr1xx_dev->sr1xx_device.name, sr1xx_dev);
   648		if (ret) {
   649			dev_err(&spi->dev, "request_irq failed\n");
   650			goto err_exit;
   651		}
   652		sr1xx_disable_irq(sr1xx_dev);
   653		return 0;
   654	err_exit:
   655		if (sr1xx_dev) {
   656			kfree(sr1xx_dev->tx_buffer);
   657			kfree(sr1xx_dev->rx_buffer);
   658			misc_deregister(&sr1xx_dev->sr1xx_device);
   659		}
   660	err_setup:
   661		if (sr1xx_dev)
   662			mutex_destroy(&sr1xx_dev->sr1xx_access_lock);
   663		kfree(sr1xx_dev);
   664		dev_err(&spi->dev, "ERROR: Exit : %s ret %d\n", __func__, ret);
   665		return ret;
   666	}
   667	
   668	static void sr1xx_remove(struct spi_device *spi)
   669	{
   670		struct sr1xx_dev *sr1xx_dev = sr1xx_get_data(spi);
   671	
   672		if (!sr1xx_dev) {
   673			dev_err(&spi->dev, "sr1xx_dev is NULL\n");
   674			return;
   675		}
   676		gpio_free(sr1xx_dev->ce_gpio);
   677		mutex_destroy(&sr1xx_dev->sr1xx_access_lock);
   678		free_irq(sr1xx_dev->spi->irq, sr1xx_dev);
   679		gpio_free(sr1xx_dev->irq_gpio);
   680		gpio_free(sr1xx_dev->spi_handshake_gpio);
   681		misc_deregister(&sr1xx_dev->sr1xx_device);
   682		if (sr1xx_dev) {
   683			kfree(sr1xx_dev->tx_buffer);
   684			kfree(sr1xx_dev->rx_buffer);
   685			kfree(sr1xx_dev);
   686		}
   687	}
   688	
   689	/**
   690	 * sr1xx_dev_suspend
   691	 *
   692	 * Executed before putting the system into a sleep state
   693	 *
   694	 */
 > 695	int sr1xx_dev_suspend(struct device *dev)
   696	{
   697		struct sr1xx_dev *sr1xx_dev = dev_get_drvdata(dev);
   698	
   699		if (device_may_wakeup(dev))
   700			disable_irq_wake(sr1xx_dev->spi->irq);
   701		return 0;
   702	}
   703	
   704	/**
   705	 * sr1xx_dev_resume
   706	 *
   707	 * Executed after waking the system up from a sleep state
   708	 *
   709	 */
 > 710	int sr1xx_dev_resume(struct device *dev)
   711	{
   712		struct sr1xx_dev *sr1xx_dev = dev_get_drvdata(dev);
   713	
   714		if (device_may_wakeup(dev))
   715			enable_irq_wake(sr1xx_dev->spi->irq);
   716	
   717		return 0;
   718	}
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
