Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07D02233D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 21:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Holxq07P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700514795; x=1732050795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X2v1aQ0dK7Hc6Qj+q59/u99PxqGzwcLLjDj0sqCw4F8=;
  b=Holxq07PvJyYjzqZ11xpB0SU0GLNAtYMxmcG3EL/p8C+43PPqhAI5wtp
   1983wdsq4Ha3sMBma+ALz2kXAMfpXi21NS/i0O2fgKcH778P2+SAUEBQk
   ZHObsCoAz21OWWlhakbp20TmF+nB5PF1SiGkSy6w+Xx6nKm/Q9bHJOua/
   4P6p2fjwgvFZkp9r/zP0bG+EcUII+EC4z0jeJfT2aOhRAmkOTXYW2yoYA
   2IdFX3EVwBU5OkD/TQnXOVkkDJCqz1avAkaa1lx6YoIJzy8Qjq+o+yjsw
   GsHQp1HilnIy7igikd6FqCSCOt/coSPk9GeslKCJpBIXUehdHguB/Jrdv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4821552"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="4821552"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:13:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7687039"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2023 13:13:08 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5BZp-0006vu-1e;
	Mon, 20 Nov 2023 21:13:05 +0000
Date: Tue, 21 Nov 2023 05:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v10_20231118_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
 1/2] drivers/mfd/tps6594-spi.c:101:18: warning: assignment to 'short
 unsigned int' from 'u8 *' {aka 'unsigned char *'} makes integer from pointer
 without a cast
Message-ID: <202311210529.xDNTRfCI-lkp@intel.com>
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
config: arc-randconfig-002-20231121 (https://download.01.org/0day-ci/archive/20231121/202311210529.xDNTRfCI-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210529.xDNTRfCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210529.xDNTRfCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/tps6594-spi.c: In function 'tps6594_spi_probe':
>> drivers/mfd/tps6594-spi.c:101:18: warning: assignment to 'short unsigned int' from 'u8 *' {aka 'unsigned char *'} makes integer from pointer without a cast [-Wint-conversion]
     101 |         tps->reg = spi->chip_select;
         |                  ^


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
