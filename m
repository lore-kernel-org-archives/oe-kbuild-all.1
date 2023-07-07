Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED931852
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 06:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688710134; x=1720246134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9xA0TzFO87QcC0oCTlkVEcDZtBL0YP3r7T82rd530mc=;
  b=h/Swkk4zb7FYpwrzd5GBCJPR/wDpO9m2nshxfvmJy6mjkLfLG56QRrOu
   epoKTAw/RobryOXDPgqmg6fAzrcWmtlBivMl35mS66VI3qF4CR/Y/gpIw
   B0SPx5E9lr3p3LTNvOIDE1hDsYUSHKzqcGqCSYM1jsXvoccrxf5JzWKAT
   zvGcKcACfMX0n/m36wWYO0l20KMqLOoQ1Wyn2Cv2QskfST6Gd0CjDk6b2
   aoi21H3s+vyxf6MkZHGtD4X2STZ9lWFd8GPu85pDmX3LBAjbhCmNwZaj1
   qdrkCYpk3NZm8emX38vZv5wFFjvTAa3qO0eWLabohKL5lHxRyGJQW/G0D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="344145066"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="344145066"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 23:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="785224155"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="785224155"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Jul 2023 23:08:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHeeC-0001p6-0o;
	Fri, 07 Jul 2023 06:08:52 +0000
Date: Fri, 7 Jul 2023 14:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 51/377]
 drivers/thermal/mediatek/auxadc_thermal.c:562: warning: expecting prototype
 for raw_to_mcelsius(). Prototype was for raw_to_mcelsius_v1() instead
Message-ID: <202307071353.WQByt7h3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Balsam,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   91da1079a24840825fccc4b320c4a08b4b66fcdd
commit: 0c5ad2b0ede5b59edcbbb1114c18d9f5cdda47a4 [51/377] thermal/drivers/mediatek: Relocate driver to mediatek folder
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230707/202307071353.WQByt7h3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071353.WQByt7h3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071353.WQByt7h3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/mediatek/auxadc_thermal.c:562: warning: expecting prototype for raw_to_mcelsius(). Prototype was for raw_to_mcelsius_v1() instead


vim +562 drivers/thermal/mediatek/auxadc_thermal.c

a4ffe6b52d27f4 drivers/thermal/mtk_thermal.c Michael Kao   2019-02-01  551  
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  552  /**
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  553   * raw_to_mcelsius - convert a raw ADC value to mcelsius
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  554   * @mt:	The thermal controller
3772bb422072d4 drivers/thermal/mtk_thermal.c Amit Kucheria 2019-11-20  555   * @sensno:	sensor number
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  556   * @raw:	raw ADC value
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  557   *
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  558   * This converts the raw ADC value to mcelsius using the SoC specific
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  559   * calibration constants
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  560   */
54bf1e5a629dfb drivers/thermal/mtk_thermal.c Henry Yen     2020-04-30  561  static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30 @562  {
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  563  	s32 tmp;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  564  
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  565  	raw &= 0xfff;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  566  
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  567  	tmp = 203450520 << 3;
f84514766985d3 drivers/thermal/mtk_thermal.c Michael Kao   2019-02-01  568  	tmp /= mt->conf->cali_val + mt->o_slope;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  569  	tmp /= 10000 + mt->adc_ge;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  570  	tmp *= raw - mt->vts[sensno] - 3350;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  571  	tmp >>= 3;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  572  
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  573  	return mt->degc_cali * 500 - tmp;
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  574  }
a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  575  

:::::: The code at line 562 was first introduced by commit
:::::: a92db1c8089e82b7524545d15b6d6ee6cee67965 thermal: Add Mediatek thermal controller support

:::::: TO: Sascha Hauer <s.hauer@pengutronix.de>
:::::: CC: Eduardo Valentin <edubezval@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
