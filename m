Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DE822306
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 23:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+ZSCG26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698967791; x=1730503791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9RocG26D4/qxlY2EMAQa0AHQ6hYFVfthrJ2mGc8K5Ug=;
  b=M+ZSCG26+jdwC/cknFS6kJjZUDmSx2OfhDBh562pPydkDryjn/HVAMy9
   lk8s/0j1VG/gFrhZdeIuA5r8eXGR4EYQe5JCzATzPYh65FVlTmSHeN/9A
   oF5nkB7hUfJy1OT48eWLm8aBvdhOE4qLMJrcA/zIfIIk51UuCqBoFcebR
   xs0HKtqGwKZ3yRaQXCm59tCDOYnZ47H0Dq0Upc43alg4DsvZrZo0CLWmH
   4cyPXV/RKl1Vp22smuvhPi5X7WHP2UZ18fNdEI9GZCDbwD6LPrDGbodZl
   1jApfgB13joYT5kr0E2ujiQLY80c1SPmxtI3RnW1f6Z5biyB13VWbABXQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="10375315"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="10375315"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 16:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1092889546"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="1092889546"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Nov 2023 16:29:48 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyh8E-00020I-1L;
	Thu, 02 Nov 2023 23:29:46 +0000
Date: Fri, 3 Nov 2023 07:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:spi-nor/die-erase-v2 47/52]
 drivers/mtd/spi-nor/core.c:1069: warning: Function parameter or member
 'addr' not described in 'spi_nor_erase_die'
Message-ID: <202311030730.eZMulU9J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day spi-nor/die-erase-v2
head:   a5e1b9d735b2061fc6a8a539280e0e98c156bf9b
commit: 1865315f05d4c15e7b9227e0b6baefcc7a0bfb46 [47/52] mtd: spi-nor: add erase die (chip) capability
config: csky-randconfig-001-20231103 (https://download.01.org/0day-ci/archive/20231103/202311030730.eZMulU9J-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030730.eZMulU9J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030730.eZMulU9J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/core.c:1069: warning: Function parameter or member 'addr' not described in 'spi_nor_erase_die'
>> drivers/mtd/spi-nor/core.c:1069: warning: Function parameter or member 'die_size' not described in 'spi_nor_erase_die'
>> drivers/mtd/spi-nor/core.c:1069: warning: expecting prototype for spi_nor_erase_chip(). Prototype was for spi_nor_erase_die() instead


vim +1069 drivers/mtd/spi-nor/core.c

502c4b0a14458a drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-10-29  1061  
78f1ddf7bb6ee7 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1062  /**
78f1ddf7bb6ee7 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1063   * spi_nor_erase_chip() - Erase the entire flash memory.
78f1ddf7bb6ee7 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1064   * @nor:	pointer to 'struct spi_nor'.
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie    2014-02-24  1065   *
78f1ddf7bb6ee7 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1066   * Return: 0 on success, -errno otherwise.
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie    2014-02-24  1067   */
1865315f05d4c1 drivers/mtd/spi-nor/core.c    Tudor Ambarus   2023-11-01  1068  static int spi_nor_erase_die(struct spi_nor *nor, loff_t addr, size_t die_size)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie    2014-02-24 @1069  {
1865315f05d4c1 drivers/mtd/spi-nor/core.c    Tudor Ambarus   2023-11-01  1070  	bool multi_die = nor->mtd.size == die_size;
d1ed88eae3fba8 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1071  	int ret;
d1ed88eae3fba8 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1072  
1865315f05d4c1 drivers/mtd/spi-nor/core.c    Tudor Ambarus   2023-11-01  1073  	dev_dbg(nor->dev, " %lldKiB\n", (long long)(die_size >> 10));
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie    2014-02-24  1074  
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  1075  	if (nor->spimem) {
1865315f05d4c1 drivers/mtd/spi-nor/core.c    Tudor Ambarus   2023-11-01  1076  		struct spi_mem_op op =
1865315f05d4c1 drivers/mtd/spi-nor/core.c    Tudor Ambarus   2023-11-01  1077  			SPI_NOR_DIE_ERASE_OP(nor->params->die_erase_opcode,
1865315f05d4c1 drivers/mtd/spi-nor/core.c    Tudor Ambarus   2023-11-01  1078  					     nor->addr_nbytes, addr, multi_die);
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  1079  
f8cd9f632f4415 drivers/mtd/spi-nor/core.c    Patrice Chotard 2022-06-29  1080  		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
0e30f47232ab57 drivers/mtd/spi-nor/core.c    Pratyush Yadav  2020-10-05  1081  
d1ed88eae3fba8 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1082  		ret = spi_mem_exec_op(nor->spimem, &op);
d1ed88eae3fba8 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1083  	} else {
1865315f05d4c1 drivers/mtd/spi-nor/core.c    Tudor Ambarus   2023-11-01  1084  		if (multi_die)
1865315f05d4c1 drivers/mtd/spi-nor/core.c    Tudor Ambarus   2023-11-01  1085  			return -EOPNOTSUPP;
1865315f05d4c1 drivers/mtd/spi-nor/core.c    Tudor Ambarus   2023-11-01  1086  
6e1bf55d7207aa drivers/mtd/spi-nor/core.c    Pratyush Yadav  2020-10-05  1087  		ret = spi_nor_controller_ops_write_reg(nor,
6e1bf55d7207aa drivers/mtd/spi-nor/core.c    Pratyush Yadav  2020-10-05  1088  						       SPINOR_OP_CHIP_ERASE,
d1ed88eae3fba8 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1089  						       NULL, 0);
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  1090  	}
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  1091  
d1ed88eae3fba8 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1092  	if (ret)
d1ed88eae3fba8 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1093  		dev_dbg(nor->dev, "error %d erasing chip\n", ret);
d1ed88eae3fba8 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1094  
d1ed88eae3fba8 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-11-02  1095  	return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie    2014-02-24  1096  }
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie    2014-02-24  1097  

:::::: The code at line 1069 was first introduced by commit
:::::: b199489d37b21c5e294f95bf265acc5dde3fc3a2 mtd: spi-nor: add the framework for SPI NOR

:::::: TO: Huang Shijie <b32955@freescale.com>
:::::: CC: Brian Norris <computersforpeace@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
