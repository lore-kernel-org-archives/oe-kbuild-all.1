Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE09199
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 00:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686355380; x=1717891380;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5/Dvqx4HxCTrKDzOOuGKaflPDUj4IUmLR86HdUZacvg=;
  b=LCcDJ7UpLWK0spntti5pRQ6FvBMPl93pl+SFWJ/vAKOGfSWG1/i/HVyt
   suTErWPpNO84PDHGMhozG3JYOqBvfDzE35nYY49Ii7iZx7O64ceYj8VSJ
   XQkYpcZs7/cIyYn/+L/PeDwWVt5cSyZhkyhDZ/g3kzprsucwTc1yj7vgt
   Cd6FEoa15jnLq4oFQEc9u13u7H84S1Py/3FxFXuSiwZPK4lTYqUkNnZBz
   TxjLLX/9ncF47JgAFpV1in9NHkdA8Y7FdSQbSUcRe+tHLUJx9cbr3RFQL
   Js5b7NrNXLwINDXbqg43FCZ9pgrCQxfk3I532+eQJipOBySCxvC1l+sNa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="347355324"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="347355324"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 17:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854902411"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="854902411"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 17:02:58 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7m4H-0009W2-1h;
	Sat, 10 Jun 2023 00:02:57 +0000
Date: Sat, 10 Jun 2023 08:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 20/20]
 drivers/char/tpm/tpm_tis_spi_main.c:253:35: warning: initialization of
 'const struct of_device_id *' from 'int' makes pointer from integer without
 a cast
Message-ID: <202306100746.8dwyirA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
commit: 3118a5812ec5b3b83ca38f2d1c4162ccda268c0d [20/20] of: header cleanups
config: riscv-randconfig-r013-20230610 (https://download.01.org/0day-ci/archive/20230610/202306100746.8dwyirA1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/char/tpm/ drivers/fpga/ drivers/mfd/ drivers/pci/controller/dwc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100746.8dwyirA1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/tpm_tis_spi_main.c: In function 'tpm_tis_spi_driver_probe':
   drivers/char/tpm/tpm_tis_spi_main.c:201:22: error: implicit declaration of function 'of_device_get_match_data'; did you mean 'device_get_match_data'? [-Werror=implicit-function-declaration]
     201 |         probe_func = of_device_get_match_data(&spi->dev);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
         |                      device_get_match_data
>> drivers/char/tpm/tpm_tis_spi_main.c:201:20: warning: assignment to 'tpm_tis_spi_probe_func' {aka 'int (*)(struct spi_device *)'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     201 |         probe_func = of_device_get_match_data(&spi->dev);
         |                    ^
   drivers/char/tpm/tpm_tis_spi_main.c: At top level:
   drivers/char/tpm/tpm_tis_spi_main.c:253:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
     253 |                 .of_match_table = of_match_ptr(of_tis_spi_match),
         |                                   ^~~~~~~~~~~~
>> drivers/char/tpm/tpm_tis_spi_main.c:253:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/char/tpm/tpm_tis_spi_main.c:253:35: note: (near initialization for 'tpm_tis_spi_driver.driver.of_match_table')
   drivers/char/tpm/tpm_tis_spi_main.c:253:35: error: initializer element is not constant
   drivers/char/tpm/tpm_tis_spi_main.c:253:35: note: (near initialization for 'tpm_tis_spi_driver.driver.of_match_table')
   cc1: some warnings being treated as errors
--
   drivers/fpga/microchip-spi.c:404:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
     404 |                 .of_match_table = of_match_ptr(mpf_of_ids),
         |                                   ^~~~~~~~~~~~
>> drivers/fpga/microchip-spi.c:404:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/fpga/microchip-spi.c:404:35: note: (near initialization for 'mpf_driver.driver.of_match_table')
   drivers/fpga/microchip-spi.c:404:35: error: initializer element is not constant
   drivers/fpga/microchip-spi.c:404:35: note: (near initialization for 'mpf_driver.driver.of_match_table')
   cc1: some warnings being treated as errors
--
   drivers/pci/controller/dwc/pcie-designware-plat.c: In function 'dw_plat_pcie_probe':
   drivers/pci/controller/dwc/pcie-designware-plat.c:115:16: error: implicit declaration of function 'of_device_get_match_data' [-Werror=implicit-function-declaration]
     115 |         data = of_device_get_match_data(dev);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pcie-designware-plat.c:115:14: warning: assignment to 'const struct dw_plat_pcie_of_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     115 |         data = of_device_get_match_data(dev);
         |              ^
   cc1: some warnings being treated as errors


vim +253 drivers/char/tpm/tpm_tis_spi_main.c

797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  195  
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  196  static int tpm_tis_spi_driver_probe(struct spi_device *spi)
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  197  {
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  198  	const struct spi_device_id *spi_dev_id = spi_get_device_id(spi);
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  199  	tpm_tis_spi_probe_func probe_func;
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  200  
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20 @201  	probe_func = of_device_get_match_data(&spi->dev);
114e43371c5899 drivers/char/tpm/tpm_tis_spi_main.c Liguang Zhang            2021-05-07  202  	if (!probe_func) {
114e43371c5899 drivers/char/tpm/tpm_tis_spi_main.c Liguang Zhang            2021-05-07  203  		if (spi_dev_id) {
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  204  			probe_func = (tpm_tis_spi_probe_func)spi_dev_id->driver_data;
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  205  			if (!probe_func)
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  206  				return -ENODEV;
114e43371c5899 drivers/char/tpm/tpm_tis_spi_main.c Liguang Zhang            2021-05-07  207  		} else
114e43371c5899 drivers/char/tpm/tpm_tis_spi_main.c Liguang Zhang            2021-05-07  208  			probe_func = tpm_tis_spi_probe;
114e43371c5899 drivers/char/tpm/tpm_tis_spi_main.c Liguang Zhang            2021-05-07  209  	}
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  210  
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  211  	return probe_func(spi);
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  212  }
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  213  
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  214  static SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_spi_resume);
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  215  
a0386bba70934d drivers/char/tpm/tpm_tis_spi_main.c Uwe Kleine-König         2022-01-23  216  static void tpm_tis_spi_remove(struct spi_device *dev)
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  217  {
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  218  	struct tpm_chip *chip = spi_get_drvdata(dev);
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  219  
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  220  	tpm_chip_unregister(chip);
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  221  	tpm_tis_remove(chip);
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  222  }
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  223  
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  224  static const struct spi_device_id tpm_tis_spi_id[] = {
c46ed2281bbe4b drivers/char/tpm/tpm_tis_spi_main.c Javier Martinez Canillas 2021-05-27  225  	{ "st33htpm-spi", (unsigned long)tpm_tis_spi_probe },
c46ed2281bbe4b drivers/char/tpm/tpm_tis_spi_main.c Javier Martinez Canillas 2021-05-27  226  	{ "slb9670", (unsigned long)tpm_tis_spi_probe },
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  227  	{ "tpm_tis_spi", (unsigned long)tpm_tis_spi_probe },
7eba41fe8c7bb0 drivers/char/tpm/tpm_tis_spi_main.c Mark Brown               2021-09-24  228  	{ "tpm_tis-spi", (unsigned long)tpm_tis_spi_probe },
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  229  	{ "cr50", (unsigned long)cr50_spi_probe },
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  230  	{}
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  231  };
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  232  MODULE_DEVICE_TABLE(spi, tpm_tis_spi_id);
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  233  
3fb29a23fcdadc drivers/char/tpm/tpm_tis_spi_main.c Krzysztof Kozlowski      2023-03-11  234  static const struct of_device_id of_tis_spi_match[] __maybe_unused = {
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  235  	{ .compatible = "st,st33htpm-spi", .data = tpm_tis_spi_probe },
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  236  	{ .compatible = "infineon,slb9670", .data = tpm_tis_spi_probe },
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  237  	{ .compatible = "tcg,tpm_tis-spi", .data = tpm_tis_spi_probe },
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  238  	{ .compatible = "google,cr50", .data = cr50_spi_probe },
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  239  	{}
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  240  };
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  241  MODULE_DEVICE_TABLE(of, of_tis_spi_match);
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  242  
3fb29a23fcdadc drivers/char/tpm/tpm_tis_spi_main.c Krzysztof Kozlowski      2023-03-11  243  static const struct acpi_device_id acpi_tis_spi_match[] __maybe_unused = {
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  244  	{"SMO0768", 0},
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  245  	{}
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  246  };
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  247  MODULE_DEVICE_TABLE(acpi, acpi_tis_spi_match);
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  248  
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  249  static struct spi_driver tpm_tis_spi_driver = {
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  250  	.driver = {
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  251  		.name = "tpm_tis_spi",
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  252  		.pm = &tpm_tis_pm,
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19 @253  		.of_match_table = of_match_ptr(of_tis_spi_match),
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  254  		.acpi_match_table = ACPI_PTR(acpi_tis_spi_match),
7187bf7f6297a8 drivers/char/tpm/tpm_tis_spi_main.c Douglas Anderson         2020-06-19  255  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  256  	},
797c0113c9a481 drivers/char/tpm/tpm_tis_spi.c      Andrey Pronin            2019-09-20  257  	.probe = tpm_tis_spi_driver_probe,
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  258  	.remove = tpm_tis_spi_remove,
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  259  	.id_table = tpm_tis_spi_id,
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  260  };
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  261  module_spi_driver(tpm_tis_spi_driver);
0edbfea537d10c drivers/char/tpm/tpm_tis_spi.c      Christophe Ricard        2016-05-19  262  

:::::: The code at line 253 was first introduced by commit
:::::: 0edbfea537d10c0de5505d0413368aad71027663 tpm/tpm_tis_spi: Add support for spi phy

:::::: TO: Christophe Ricard <christophe.ricard@gmail.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
