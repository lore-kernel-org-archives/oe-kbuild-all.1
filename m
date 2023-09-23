Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A99437A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 02:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695434548; x=1726970548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wD3ZZekWCKXnUKhpTtUKoP1zLB+sArLoi+uC5kixcXg=;
  b=HbK8QugK8GQ5NC25uzaKr4MOUTTQfo+xmeXuC0J+HQYJDCiEUVd6PLYS
   qzWSOrmYdUEY5ejh37VctaTmECxguRF5C91VSRT7u0WL5WIEkmq3PEkcG
   AsoRcfOMhGXT2ems9KTJhZlbsolA1ZtUHPE6N3MpRTMKUeVonOSn04PV2
   sn4AlGcsKf00l4yAKLoP5k71ExNiPoCfTdkE7ERPGqw4gQmNw4+Bhv53n
   lpqmMPXZS4vV5K8QtwmteNHCsGvxH9T9d6PGehqu4xC6TKC+/hjzMuBKl
   QLByPraWNHRrxf/rU813nyMa2znB/TC1DCHobc1mN8vvdQXvBUhYeHkQx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="467274757"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="467274757"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 19:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="837976547"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="837976547"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2023 19:02:26 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjryR-0001av-33;
	Sat, 23 Sep 2023 02:02:23 +0000
Date: Sat, 23 Sep 2023 10:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 41/42] drivers/misc/nxp-sr1xx.c:584:21:
 warning: assignment to 'int' from 'struct gpio_desc *' makes integer from
 pointer without a cast
Message-ID: <202309230902.mrheT0hT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   0fc3a2e40457fa5b337c9dad35cce2a9cacdbb18
commit: 30dee752600323ee56b4ba0c9504475fa7ab6849 [41/42] CHROMIUM: FROMLIST: misc: nxp-sr1xx: UWB driver for sr1xx
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230923/202309230902.mrheT0hT-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309230902.mrheT0hT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309230902.mrheT0hT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/nxp-sr1xx.c: In function 'sr1xx_probe':
>> drivers/misc/nxp-sr1xx.c:584:21: warning: assignment to 'int' from 'struct gpio_desc *' makes integer from pointer without a cast [-Wint-conversion]
     584 |                 ret = gpiod_irq;
         |                     ^
   drivers/misc/nxp-sr1xx.c:593:21: warning: assignment to 'int' from 'struct gpio_desc *' makes integer from pointer without a cast [-Wint-conversion]
     593 |                 ret = gpiod_ce;
         |                     ^
   drivers/misc/nxp-sr1xx.c:602:21: warning: assignment to 'int' from 'struct gpio_desc *' makes integer from pointer without a cast [-Wint-conversion]
     602 |                 ret = gpiod_ri;
         |                     ^
   drivers/misc/nxp-sr1xx.c: At top level:
>> drivers/misc/nxp-sr1xx.c:695:5: warning: no previous prototype for 'sr1xx_dev_suspend' [-Wmissing-prototypes]
     695 | int sr1xx_dev_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/misc/nxp-sr1xx.c:710:5: warning: no previous prototype for 'sr1xx_dev_resume' [-Wmissing-prototypes]
     710 | int sr1xx_dev_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~
--
>> drivers/misc/nxp-sr1xx.c:172: warning: Function parameter or member 'sr1xx_dev' not described in 'sr1xx_wait_for_irq_gpio_low'
>> drivers/misc/nxp-sr1xx.c:202: warning: Function parameter or member 'sr1xx_dev' not described in 'sr1xx_dev_transceive'
>> drivers/misc/nxp-sr1xx.c:202: warning: Function parameter or member 'op_mode' not described in 'sr1xx_dev_transceive'
>> drivers/misc/nxp-sr1xx.c:202: warning: Function parameter or member 'count' not described in 'sr1xx_dev_transceive'
>> drivers/misc/nxp-sr1xx.c:353: warning: Function parameter or member 'sr1xx_dev' not described in 'sr1xx_hbci_write'
>> drivers/misc/nxp-sr1xx.c:353: warning: Function parameter or member 'count' not described in 'sr1xx_hbci_write'
>> drivers/misc/nxp-sr1xx.c:415: warning: Function parameter or member 'sr1xx_dev' not described in 'sr1xx_hbci_read'
>> drivers/misc/nxp-sr1xx.c:415: warning: Function parameter or member 'buf' not described in 'sr1xx_hbci_read'
>> drivers/misc/nxp-sr1xx.c:415: warning: Function parameter or member 'count' not described in 'sr1xx_hbci_read'
>> drivers/misc/nxp-sr1xx.c:696: warning: Function parameter or member 'dev' not described in 'sr1xx_dev_suspend'
>> drivers/misc/nxp-sr1xx.c:711: warning: Function parameter or member 'dev' not described in 'sr1xx_dev_resume'


vim +584 drivers/misc/nxp-sr1xx.c

   403	
   404	/**
   405	 * sr1xx_hbci_read
   406	 *
   407	 * Function used to read data from sr1xx on SPI line
   408	 * as part of firmware download sequence.
   409	 *
   410	 * Returns: Number of bytes read if read is success else
   411	 *              indicate each error code
   412	 */
   413	static ssize_t sr1xx_hbci_read(struct sr1xx_dev *sr1xx_dev, char *buf,
   414				       size_t count)
 > 415	{
   416		int ret = -EIO;
   417	
   418		if (count > SR1XX_RXBUF_SIZE) {
   419			dev_err(&sr1xx_dev->spi->dev, "count(%zu) out of range(0-%d)\n",
   420				count, SR1XX_RXBUF_SIZE);
   421			ret = -EINVAL;
   422			goto hbci_fail;
   423		}
   424		/* Wait for inetrrupt upto 500ms */
   425		ret = wait_event_interruptible_timeout(sr1xx_dev->read_wq,
   426						       sr1xx_dev->irq_received,
   427						       sr1xx_dev->timeout_in_ms);
   428		if (ret == 0) {
   429			dev_err(&sr1xx_dev->spi->dev,
   430				"hbci wait_event_interruptible timeout() : Failed.\n");
   431			ret = -EIO;
   432			goto hbci_fail;
   433		}
   434		if (sr1xx_dev->read_abort_requested) {
   435			sr1xx_dev->read_abort_requested = false;
   436			dev_err(&sr1xx_dev->spi->dev, "HBCI Abort Read pending......");
   437			return ret;
   438		}
   439		if (!gpio_get_value(sr1xx_dev->irq_gpio)) {
   440			dev_err(&sr1xx_dev->spi->dev,
   441				"IRQ is low during firmware download");
   442			goto hbci_fail;
   443		}
   444		ret = spi_read(sr1xx_dev->spi, (void *)sr1xx_dev->rx_buffer, count);
   445		if (ret < 0) {
   446			dev_err(&sr1xx_dev->spi->dev,
   447				"sr1xx_dev_read: spi read error %d\n ", ret);
   448			goto hbci_fail;
   449		}
   450		ret = count;
   451		if (copy_to_user(buf, sr1xx_dev->rx_buffer, count)) {
   452			dev_err(&sr1xx_dev->spi->dev,
   453				"sr1xx_dev_read: copy to user failed\n");
   454			ret = -EFAULT;
   455		}
   456		return ret;
   457	hbci_fail:
   458		dev_err(&sr1xx_dev->spi->dev, "Error sr1xx_fw_download ret %d Exit\n",
   459			ret);
   460		return ret;
   461	}
   462	
   463	static ssize_t sr1xx_dev_read(struct file *filp, char *buf, size_t count,
   464				      loff_t *offset)
   465	{
   466		struct sr1xx_dev *sr1xx_dev = filp->private_data;
   467		int ret = -EIO;
   468	
   469		/* 500ms timeout in jiffies */
   470		sr1xx_dev->timeout_in_ms = ((500 * HZ) / 1000);
   471		memset(sr1xx_dev->rx_buffer, 0x00, SR1XX_RXBUF_SIZE);
   472		if (!gpio_get_value(sr1xx_dev->irq_gpio)) {
   473			if (filp->f_flags & O_NONBLOCK) {
   474				ret = -EAGAIN;
   475				goto read_end;
   476			}
   477		}
   478		/* HBCI packet read */
   479		if (sr1xx_dev->is_fw_dwnld_enabled) {
   480			ret = sr1xx_hbci_read(sr1xx_dev, buf, count);
   481			goto read_end;
   482		}
   483		/* UCI packet read */
   484		do {
   485			sr1xx_enable_irq(sr1xx_dev);
   486			if (!sr1xx_dev->read_abort_requested) {
   487				ret = wait_event_interruptible(sr1xx_dev->read_wq,
   488							       sr1xx_dev->irq_received);
   489				if (ret) {
   490					dev_err(&sr1xx_dev->spi->dev,
   491						"wait_event_interruptible() : Failed.\n");
   492					goto read_end;
   493				}
   494			}
   495			if (sr1xx_dev->read_abort_requested) {
   496				sr1xx_dev->read_abort_requested = false;
   497				dev_err(&sr1xx_dev->spi->dev,
   498					"Abort Read pending......");
   499				goto read_end;
   500			}
   501			ret = sr1xx_dev_transceive(sr1xx_dev, SR1XX_READ_MODE, count);
   502			if (ret == IRQ_WAIT_REQUEST) {
   503				dev_err(&sr1xx_dev->spi->dev,
   504					"Irg is low due to write hence irq is requested again...");
   505			}
   506		} while (ret == IRQ_WAIT_REQUEST);
   507		if (ret == TRANSCEIVE_SUCCESS) {
   508			if (copy_to_user(buf, sr1xx_dev->rx_buffer,
   509					 sr1xx_dev->read_count)) {
   510				dev_err(&sr1xx_dev->spi->dev,
   511					"%s: copy to user failed\n", __func__);
   512				ret = -EFAULT;
   513				goto read_end;
   514			}
   515			ret = sr1xx_dev->read_count;
   516		} else if (ret == IRQ_WAIT_TIMEOUT) {
   517			dev_err(&sr1xx_dev->spi->dev,
   518				"Second irq is not received..Time out...");
   519			ret = -ETIME;
   520		} else {
   521			dev_err(&sr1xx_dev->spi->dev, "spi read failed...%d", ret);
   522			ret = -EIO;
   523		}
   524	read_end:
   525		return ret;
   526	}
   527	
   528	static inline void sr1xx_set_data(struct spi_device *spi, void *data)
   529	{
   530		dev_set_drvdata(&spi->dev, data);
   531	}
   532	
   533	static inline void *sr1xx_get_data(const struct spi_device *spi)
   534	{
   535		return dev_get_drvdata(&spi->dev);
   536	}
   537	
   538	/* Possible fops on the sr1xx device */
   539	static const struct file_operations sr1xx_dev_fops = {
   540		.owner = THIS_MODULE,
   541		.read = sr1xx_dev_read,
   542		.write = sr1xx_dev_write,
   543		.open = sr1xx_dev_open,
   544		.unlocked_ioctl = sr1xx_dev_ioctl,
   545		.compat_ioctl = sr1xx_dev_ioctl,
   546	};
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
 > 593			ret = gpiod_ce;
   594			goto err_setup;
   595		} else {
   596			sr1xx_dev->ce_gpio = desc_to_gpio(gpiod_ce);
   597		}
   598	
   599		gpiod_ri = devm_gpiod_get(&spi->dev, "nxp,sr1xx-ri", GPIOD_OUT_LOW);
   600		if (IS_ERR(gpiod_ri)) {
   601			dev_err(&spi->dev, "failed to do fetch ri gpio desc\n");
 > 602			ret = gpiod_ri;
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
 > 696	{
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
 > 711	{
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
