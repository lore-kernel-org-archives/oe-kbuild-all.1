Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C812E638
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6+C+b4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699308258; x=1730844258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Y+P2XsbMV7efUJXTNffqjAmc6DOk0xRIg/LSV1fkbM=;
  b=E6+C+b4Gq83fM+tMUOH5+G06i/1qxqSn8PaxfqfyUEzNqxfJAWdVOudB
   eguyFDAWMCGUX9+Nzfn/BWwsgZJVuKBgQugWwpqkUAWuy2OMQFG3V4RQt
   Y0EBP+ZwaayxaDSSLz7+8u9Qc80llIlWVBR2kyT2+Y2/pe9eIkcK/knYs
   YJv2qDyhQBuEDKhNujMS1m/o+oEizomrJQtdJQajD/sPRhIJpTRpuK31M
   aREetMfcei5bQICYE+PhWCsN3gJjDru+074vtJ0NAxkHvMgMJQ6ze49oW
   YTpXO61DR0u67bUgWNYWeS9zpbR8MCi3OntkTlHkZjzSlXgKhhK8lRto/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="379770929"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="379770929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 14:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="3760795"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2023 14:04:16 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r07he-0006lD-2V;
	Mon, 06 Nov 2023 22:04:14 +0000
Date: Tue, 7 Nov 2023 06:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jagath Jog J <jagathjog1996@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [linux-next:master 10351/16504]
 drivers/iio/imu/bmi323/bmi323_i2c.c:69:28: sparse: sparse: symbol
 'bmi323_i2c_regmap_config' was not declared. Should it be static?
Message-ID: <202311070530.qKhLTz1Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ff7a5781ceee3befb9224d29cef6e6a4766c5fe
commit: b512c767e7bcef308ee5b038405debf9baa9c579 [10351/16504] iio: imu: Add driver for BMI323 IMU
config: sh-randconfig-r111-20231106 (https://download.01.org/0day-ci/archive/20231107/202311070530.qKhLTz1Y-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070530.qKhLTz1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070530.qKhLTz1Y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/imu/bmi323/bmi323_i2c.c:69:28: sparse: sparse: symbol 'bmi323_i2c_regmap_config' was not declared. Should it be static?

vim +/bmi323_i2c_regmap_config +69 drivers/iio/imu/bmi323/bmi323_i2c.c

    68	
  > 69	const struct regmap_config bmi323_i2c_regmap_config = {
    70		.reg_bits = 8,
    71		.val_bits = 16,
    72		.max_register = BMI323_CFG_RES_REG,
    73		.val_format_endian = REGMAP_ENDIAN_LITTLE,
    74	};
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
