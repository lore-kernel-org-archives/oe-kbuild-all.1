Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD39EBE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 06:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678429383; x=1709965383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKiOm806NGN7iwqRndD60c9XIBcWBOLfMqFNnNiu3/k=;
  b=TLqQ4s6zQLIk1xn0ET/HBFjS/3rhcDTKEXMI1F3VKg8aFa0B/qK2Zqqa
   wc7HLi+fMY9sBy3oU/oZ4OTIwCrFtyKpcBcB5swBHhaF5QxPQdi0kZuA4
   nnCpjuIaiZ72sn38YgW5A0lD9EQHYMgm+N6cPkVk9g/PnT2sz9Lc7auYl
   4g/dpkYntXmlehbPE8yQYE74uMx2xbk3UnnnHsTkM9To8myvxXDL1n4ic
   jC4G+8G+DVrk83A3jejfY+J8RFEBAN3pX8iyfTmm9Lon5gzBQr8Dbroa9
   vc4ckxiA2dyWTus8rQsF2ThmHVXxYpN+oFLvUMmPC2hQh9GzXPz9P7lJu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364313027"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="364313027"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 22:22:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677692501"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="677692501"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2023 22:22:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paW9X-0003Zj-2N;
	Fri, 10 Mar 2023 06:22:55 +0000
Date: Fri, 10 Mar 2023 14:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1656/2655] drivers/spi/spi-mpc512x-psc.c:516:17:
 error: label 'free_ipg_clock' used but not defined
Message-ID: <202303101423.vlii0zvA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   24469a0e5052ba01a35a15f104717a82b7a4798b
commit: 9e21720a49589304aef9e37e8b6c6a4196daf156 [1656/2655] spi: mpc5xxx-psc: use devm_clk_get_enabled() for core clock
config: powerpc-randconfig-r033-20230308 (https://download.01.org/0day-ci/archive/20230310/202303101423.vlii0zvA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9e21720a49589304aef9e37e8b6c6a4196daf156
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9e21720a49589304aef9e37e8b6c6a4196daf156
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101423.vlii0zvA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-mpc512x-psc.c: In function 'mpc512x_psc_spi_of_probe':
>> drivers/spi/spi-mpc512x-psc.c:516:17: error: label 'free_ipg_clock' used but not defined
     516 |                 goto free_ipg_clock;
         |                 ^~~~


vim +/free_ipg_clock +516 drivers/spi/spi-mpc512x-psc.c

6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  456  
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  457  static int mpc512x_psc_spi_of_probe(struct platform_device *pdev)
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  458  {
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  459  	struct device *dev = &pdev->dev;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  460  	struct mpc512x_psc_spi *mps;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  461  	struct spi_master *master;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  462  	int ret;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  463  	void *tempp;
a81a5094a32871 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-08-06  464  	struct clk *clk;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  465  
01602336524e17 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  466  	master = devm_spi_alloc_master(dev, sizeof(*mps));
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  467  	if (master == NULL)
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  468  		return -ENOMEM;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  469  
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  470  	dev_set_drvdata(dev, master);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  471  	mps = spi_master_get_devdata(master);
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  472  	mps->type = (int)device_get_match_data(dev);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  473  
c88dd349b5a83c drivers/spi/spi-mpc512x-psc.c Anatolij Gustschin 2013-01-14  474  	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LSB_FIRST;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  475  	master->setup = mpc512x_psc_spi_setup;
85085898ab0fef drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-06-03  476  	master->prepare_transfer_hardware = mpc512x_psc_spi_prep_xfer_hw;
85085898ab0fef drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-06-03  477  	master->transfer_one_message = mpc512x_psc_spi_msg_xfer;
85085898ab0fef drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-06-03  478  	master->unprepare_transfer_hardware = mpc512x_psc_spi_unprep_xfer_hw;
2818824ced4be5 drivers/spi/spi-mpc512x-psc.c Linus Walleij      2022-01-20  479  	master->use_gpio_descriptors = true;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  480  	master->cleanup = mpc512x_psc_spi_cleanup;
12b15e83289bc7 drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-07-27  481  	master->dev.of_node = dev->of_node;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  482  
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  483  	tempp = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
ee493fa5d91dec drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  484  	if (IS_ERR(tempp))
ee493fa5d91dec drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  485  		return dev_err_probe(dev, PTR_ERR(tempp), "could not ioremap I/O port range\n");
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  486  	mps->psc = tempp;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  487  	mps->fifo =
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  488  		(struct mpc512x_psc_fifo *)(tempp + sizeof(struct mpc52xx_psc));
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  489  
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  490  	mps->irq = platform_get_irq(pdev, 0);
208ee586f86237 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  491  	if (mps->irq < 0)
208ee586f86237 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  492  		return mps->irq;
208ee586f86237 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  493  
e1d0cd473be4c8 drivers/spi/spi-mpc512x-psc.c Jingoo Han         2013-12-18  494  	ret = devm_request_irq(dev, mps->irq, mpc512x_psc_spi_isr, IRQF_SHARED,
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  495  				"mpc512x-psc-spi", mps);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  496  	if (ret)
01602336524e17 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  497  		return ret;
85085898ab0fef drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-06-03  498  	init_completion(&mps->txisrdone);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  499  
9e21720a495893 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  500  	clk = devm_clk_get_enabled(dev, "mclk");
01602336524e17 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  501  	if (IS_ERR(clk))
01602336524e17 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  502  		return PTR_ERR(clk);
01602336524e17 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  503  
a81a5094a32871 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-08-06  504  	mps->mclk_rate = clk_get_rate(clk);
a81a5094a32871 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-08-06  505  
9e21720a495893 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  506  	clk = devm_clk_get_enabled(dev, "ipg");
9e21720a495893 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  507  	if (IS_ERR(clk))
9e21720a495893 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  508  		return PTR_ERR(clk);
dff148ad7b6940 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-11-30  509  
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  510  	ret = mpc512x_psc_spi_port_config(master, mps);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  511  	if (ret < 0)
dff148ad7b6940 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-11-30  512  		goto free_ipg_clock;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  513  
eaa24297846bcd drivers/spi/spi-mpc512x-psc.c Jingoo Han         2013-09-24  514  	ret = devm_spi_register_master(dev, master);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  515  	if (ret < 0)
dff148ad7b6940 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-11-30 @516  		goto free_ipg_clock;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  517  
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  518  	return ret;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  519  }
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  520  

:::::: The code at line 516 was first introduced by commit
:::::: dff148ad7b69409181e12641cca6962e5f02cffe spi: mpc512x: adjust to OF based clock lookup

:::::: TO: Gerhard Sittig <gsi@denx.de>
:::::: CC: Anatolij Gustschin <agust@denx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
