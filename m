Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0758846D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693551210; x=1725087210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SO6RZHNjd4+euGdvPJY9etiZwhC2JB1Zk655fYvg3sE=;
  b=XtW4pC5uKXZNXWamNhBrACnFqydwuQwGgpfqStRzZ9K+buO/6sIxZ5Sq
   liRQDOOerSkcJUEqJ+Biq5nm5+CwjGfjjDDQZac+NkF0JwRAKa4YW9Svu
   2m+fMV+j4TAWcEDexZkRRK7xYumvRCzEgwPvbgu95Z5hhZ+TJsaTcOEUA
   Q6wjJbdavG+GATp5ZOGYZWzvHBudtbeOUoiKc6mspgdtkaDRq4S5Cz031
   V9dM4GO/aoUkzo4AIP+0XQzPQzX3+Vix3n8TEDgKi+Cf08QbrdntEekqh
   Ejim5JkT/hs/72e+8IscK8gPa4CYAOPdkp9sJZL8K8et2CeYnI6bVs2TI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440131878"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="440131878"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 23:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854591201"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="854591201"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2023 23:53:28 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qby22-00011Q-2Z;
	Fri, 01 Sep 2023 06:53:26 +0000
Date: Fri, 1 Sep 2023 14:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 4220/24603]
 drivers/spi/spi-nxp-fspi.c:1311:12: error: use of undeclared identifier
 'nxp_fspi_pm_ops'; did you mean 'nxp_fspi_mem_ops'?
Message-ID: <202309011423.Ers9SZ00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Han,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: b14e8d1b1ca9bcf02a4e43900141ff8f17fed3f0 [4220/24603] MLK-23644: spi: spi-nxp-fspi: enable runtime pm for fspi
config: hexagon-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011423.Ers9SZ00-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011423.Ers9SZ00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011423.Ers9SZ00-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-nxp-fspi.c:1311:12: error: use of undeclared identifier 'nxp_fspi_pm_ops'; did you mean 'nxp_fspi_mem_ops'?
                   .pm =   &nxp_fspi_pm_ops,
                            ^~~~~~~~~~~~~~~
                            nxp_fspi_mem_ops
   drivers/spi/spi-nxp-fspi.c:1086:44: note: 'nxp_fspi_mem_ops' declared here
   static const struct spi_controller_mem_ops nxp_fspi_mem_ops = {
                                              ^
>> drivers/spi/spi-nxp-fspi.c:1311:11: error: incompatible pointer types initializing 'const struct dev_pm_ops *' with an expression of type 'const struct spi_controller_mem_ops *' [-Werror,-Wincompatible-pointer-types]
                   .pm =   &nxp_fspi_pm_ops,
                           ^~~~~~~~~~~~~~~~
   2 errors generated.


vim +1311 drivers/spi/spi-nxp-fspi.c

55ab8487e01d184 kuldip dwivedi      2020-09-11  1305  
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1306  static struct platform_driver nxp_fspi_driver = {
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1307  	.driver = {
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1308  		.name	= "nxp-fspi",
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1309  		.of_match_table = nxp_fspi_dt_ids,
55ab8487e01d184 kuldip dwivedi      2020-09-11  1310  		.acpi_match_table = ACPI_PTR(nxp_fspi_acpi_ids),
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15 @1311  		.pm =   &nxp_fspi_pm_ops,
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1312  	},
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1313  	.probe          = nxp_fspi_probe,
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1314  	.remove		= nxp_fspi_remove,
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1315  };
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1316  module_platform_driver(nxp_fspi_driver);
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1317  

:::::: The code at line 1311 was first introduced by commit
:::::: a5356aef6a907c2e2aed0caaa2b88b6021394471 spi: spi-mem: Add driver for NXP FlexSPI controller

:::::: TO: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
