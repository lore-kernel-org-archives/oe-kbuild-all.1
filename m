Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3971363CC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 02:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjWaIspd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701830844; x=1733366844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h78tM5iWESEZMMvITWLlhlIiO2PTDF0ljZd7EmAEHm0=;
  b=TjWaIspd6cfjU80nRrdA7ZOsBf0TChv1OeoVoFA49yjzefaPDy7Q3E3Q
   JziKx1f0+uoUXbD3Q/OHQ0T3FWd13jDBnkJhJCr7EJDV9UEFztl3V9jwx
   7avf0GfgwqsEAWfALDOewFG9UOmDmxrcxjca2l59nQhqjfXGSsVjaHdEH
   Fj2oPvzTzISEcKzxzRWh1R87Sy/U5rTSD2TvBops+144lgr+x//MHO6en
   ffcLTUyl1HqJk3vUx4mmXq0Yv02LR7bHfuZka0gIjeACgAWwTQ7ECPGiE
   8k1Sx27Nq0tPXQlqYNvfaAH/IMNulzyjD71sJFSkgG0YhgbCfJBrDHV0f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1060121"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1060121"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 18:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102665127"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102665127"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 18:47:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAhwS-000A7A-1C;
	Wed, 06 Dec 2023 02:47:16 +0000
Date: Wed, 6 Dec 2023 10:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 1/42] drivers/mfd/tps6594-spi.c:101:11:
 warning: assignment makes integer from pointer without a cast
Message-ID: <202312061012.pMvs4Ica-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   414b0dc753ec961cf8e532b86412522e78a00169
commit: e4a3f0b229639b9aa114e5cbcfeee07c814ee9f9 [1/42] spi: Add multi-cs memories support in SPI core
config: i386-buildonly-randconfig-005-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061012.pMvs4Ica-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061012.pMvs4Ica-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061012.pMvs4Ica-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/tps6594-spi.c: In function 'tps6594_spi_probe':
>> drivers/mfd/tps6594-spi.c:101:11: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
     tps->reg = spi->chip_select;
              ^


vim +101 drivers/mfd/tps6594-spi.c

325bec7157b385 Julien Panis  2023-05-11   87  
325bec7157b385 Julien Panis  2023-05-11   88  static int tps6594_spi_probe(struct spi_device *spi)
325bec7157b385 Julien Panis  2023-05-11   89  {
325bec7157b385 Julien Panis  2023-05-11   90  	struct device *dev = &spi->dev;
325bec7157b385 Julien Panis  2023-05-11   91  	struct tps6594 *tps;
325bec7157b385 Julien Panis  2023-05-11   92  	const struct of_device_id *match;
325bec7157b385 Julien Panis  2023-05-11   93  
325bec7157b385 Julien Panis  2023-05-11   94  	tps = devm_kzalloc(dev, sizeof(*tps), GFP_KERNEL);
325bec7157b385 Julien Panis  2023-05-11   95  	if (!tps)
325bec7157b385 Julien Panis  2023-05-11   96  		return -ENOMEM;
325bec7157b385 Julien Panis  2023-05-11   97  
325bec7157b385 Julien Panis  2023-05-11   98  	spi_set_drvdata(spi, tps);
325bec7157b385 Julien Panis  2023-05-11   99  
325bec7157b385 Julien Panis  2023-05-11  100  	tps->dev = dev;
325bec7157b385 Julien Panis  2023-05-11 @101  	tps->reg = spi->chip_select;
325bec7157b385 Julien Panis  2023-05-11  102  	tps->irq = spi->irq;
325bec7157b385 Julien Panis  2023-05-11  103  
325bec7157b385 Julien Panis  2023-05-11  104  	tps->regmap = devm_regmap_init(dev, NULL, spi, &tps6594_spi_regmap_config);
325bec7157b385 Julien Panis  2023-05-11  105  	if (IS_ERR(tps->regmap))
325bec7157b385 Julien Panis  2023-05-11  106  		return dev_err_probe(dev, PTR_ERR(tps->regmap), "Failed to init regmap\n");
325bec7157b385 Julien Panis  2023-05-11  107  
325bec7157b385 Julien Panis  2023-05-11  108  	match = of_match_device(tps6594_spi_of_match_table, dev);
325bec7157b385 Julien Panis  2023-05-11  109  	if (!match)
cc5f2eb7ce1190 Dan Carpenter 2023-05-25  110  		return dev_err_probe(dev, -EINVAL, "Failed to find matching chip ID\n");
325bec7157b385 Julien Panis  2023-05-11  111  	tps->chip_id = (unsigned long)match->data;
325bec7157b385 Julien Panis  2023-05-11  112  
325bec7157b385 Julien Panis  2023-05-11  113  	crc8_populate_msb(tps6594_spi_crc_table, TPS6594_CRC8_POLYNOMIAL);
325bec7157b385 Julien Panis  2023-05-11  114  
325bec7157b385 Julien Panis  2023-05-11  115  	return tps6594_device_init(tps, enable_crc);
325bec7157b385 Julien Panis  2023-05-11  116  }
325bec7157b385 Julien Panis  2023-05-11  117  

:::::: The code at line 101 was first introduced by commit
:::::: 325bec7157b3859b45b9471447f5d130ab8a8723 mfd: tps6594: Add driver for TI TPS6594 PMIC

:::::: TO: Julien Panis <jpanis@baylibre.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
