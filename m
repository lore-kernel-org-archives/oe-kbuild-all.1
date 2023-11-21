Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B32838F9F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 06:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLQoq25m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700548404; x=1732084404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4gyDpofj1DeKQ7L7fbXLrVWTeXTiBGarb8mtdkG+t38=;
  b=OLQoq25m4QSZ8dacAyI8JwAxautwqHOOJTtc+xoukmznDgQSOtpC0yQ+
   PbXOTHVV3zNAngWoj4/C5juhq2rxvI9QvGdVQCKRit/3MZ80/5PjFEjPh
   Wna+N1zYYVNQROX+Ew3rhUZG8oa59Jt4LENdb6bG4FlsreSWkRqqt3myl
   n0AMckldEd+Pxq2MZND1SQoXJJA2p6riBkhDQolbO7IERzmF1oTG9IqBA
   GZpPjanC6X8uQ4se39oNSOONkhNCqgMZFw/w3zumlgJctYQFpvd1BcmJ3
   jJ5bQnTWNcYFz5RoWqZe0H0gN+lpqA7c3QIa386yDrbmImRBlHDKSkV+a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371947172"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371947172"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 22:33:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939997047"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939997047"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 22:33:21 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5KJJ-0007QK-2Y;
	Tue, 21 Nov 2023 06:32:39 +0000
Date: Tue, 21 Nov 2023 14:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v10_20231118_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
 1/2] drivers/mfd/tps6594-spi.c:101:18: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202311211445.bteCOip8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v10_20231118_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
head:   28c84457d889d997b2cfefd7f6967dc919bdf628
commit: eb12970007184e2e5c6eae6ef1b32eee13480811 [1/2] spi: Add multi-cs memories support in SPI core
config: openrisc-randconfig-r111-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211445.bteCOip8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211445.bteCOip8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211445.bteCOip8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/tps6594-spi.c:101:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short reg @@     got unsigned char * @@
   drivers/mfd/tps6594-spi.c:101:18: sparse:     expected unsigned short reg
   drivers/mfd/tps6594-spi.c:101:18: sparse:     got unsigned char *

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
