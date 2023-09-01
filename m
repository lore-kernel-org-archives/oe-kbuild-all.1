Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4186F881F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693561597; x=1725097597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gp9/OnGiaqWWM/I7LwY9M1c19y6nn1Hv0kh4GlZU4dc=;
  b=CVeC6e5Bp01rG7oCuI9T/QmAYvLE+v8VHoaUokoIlXV6iQhTUrWiSvnC
   iRxJiusE6SHUYbdjtKWqkhe6QAcneIIioPm8blFxvD+BjyvMIcKZzAmkT
   wOHmtzLj25xMELEvXiVJ6tLFZO78faPbQ0He3KnyO7fl3faFsrijA27Yp
   dmTkpE5gnCCimK9RwOvrYcdJekSh6Qh1zYEnZN/9qapqQmjtV/sP/sje4
   swDec2GqSFLnMfp9p4F+DLNbp3b+rxZYTOs6FHhjQsyWm52GQ/wrcCvYT
   FEPmzYDfi+d3QsJF2DlIFMHHx3YOkxXwF93Pbn6uYn6xvcmZYL6h2F2Nk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366406690"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="366406690"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 02:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733468236"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="733468236"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Sep 2023 02:46:33 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc0jX-00019p-1I;
	Fri, 01 Sep 2023 09:46:31 +0000
Date: Fri, 1 Sep 2023 17:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 5/8] drivers/fpga/altera-ps-spi.c:243:48: error:
 passing argument 1 of 'spi_get_device_match_data' from incompatible pointer
 type
Message-ID: <202309011710.YkzcEftE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   a143793949161ccf952d0b50ee37e442cf8c02e9
commit: 0be56945298277377b33c8b380b610d449ec9db7 [5/8] Use of_device_get_match_data
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309011710.YkzcEftE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011710.YkzcEftE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011710.YkzcEftE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/fpga/altera-ps-spi.c: In function 'altera_ps_probe':
>> drivers/fpga/altera-ps-spi.c:243:48: error: passing argument 1 of 'spi_get_device_match_data' from incompatible pointer type [-Werror=incompatible-pointer-types]
     243 |         conf->data = spi_get_device_match_data(&spi->dev);
         |                                                ^~~~~~~~~
         |                                                |
         |                                                struct device *
   In file included from drivers/fpga/altera-ps-spi.c:23:
   include/linux/spi/spi.h:1629:52: note: expected 'const struct spi_device *' but argument is of type 'struct device *'
    1629 | spi_get_device_match_data(const struct spi_device *sdev);
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/spi_get_device_match_data +243 drivers/fpga/altera-ps-spi.c

   233	
   234	static int altera_ps_probe(struct spi_device *spi)
   235	{
   236		struct altera_ps_conf *conf;
   237		struct fpga_manager *mgr;
   238	
   239		conf = devm_kzalloc(&spi->dev, sizeof(*conf), GFP_KERNEL);
   240		if (!conf)
   241			return -ENOMEM;
   242	
 > 243		conf->data = spi_get_device_match_data(&spi->dev);
   244		conf->spi = spi;
   245		conf->config = devm_gpiod_get(&spi->dev, "nconfig", GPIOD_OUT_LOW);
   246		if (IS_ERR(conf->config)) {
   247			dev_err(&spi->dev, "Failed to get config gpio: %ld\n",
   248				PTR_ERR(conf->config));
   249			return PTR_ERR(conf->config);
   250		}
   251	
   252		conf->status = devm_gpiod_get(&spi->dev, "nstat", GPIOD_IN);
   253		if (IS_ERR(conf->status)) {
   254			dev_err(&spi->dev, "Failed to get status gpio: %ld\n",
   255				PTR_ERR(conf->status));
   256			return PTR_ERR(conf->status);
   257		}
   258	
   259		conf->confd = devm_gpiod_get_optional(&spi->dev, "confd", GPIOD_IN);
   260		if (IS_ERR(conf->confd)) {
   261			dev_err(&spi->dev, "Failed to get confd gpio: %ld\n",
   262				PTR_ERR(conf->confd));
   263			return PTR_ERR(conf->confd);
   264		} else if (!conf->confd) {
   265			dev_warn(&spi->dev, "Not using confd gpio");
   266		}
   267	
   268		/* Register manager with unique name */
   269		snprintf(conf->mgr_name, sizeof(conf->mgr_name), "%s %s",
   270			 dev_driver_string(&spi->dev), dev_name(&spi->dev));
   271	
   272		mgr = devm_fpga_mgr_register(&spi->dev, conf->mgr_name,
   273					     &altera_ps_ops, conf);
   274		return PTR_ERR_OR_ZERO(mgr);
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
