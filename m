Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90233C16
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 01:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRARyNG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699667464; x=1731203464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3SwseRwxSWbv/U7tAZt9CFuie5mehrBBtqlrGiCTnI=;
  b=CRARyNG0fnaj+b701rJzlYY6Wr1+J5835FnxtXou/sQUHQxbqkGGRPxw
   oGaRa99GimE4oBFYWQM5FuSr1vxLjUIWuMNxZO7X21L7zpQxsSHnmNzhG
   CDbd6E89NLKXNOZFwgIPFQGiIIsWUsG0DUtYwgD6DVcZN+p1eD6Nw26Vf
   ffA5CP+vxw8Ygd7C0Bz68sLjYT71rwucezl8NawUP+qqW8+94LLPffNV5
   yRZlItWdLtAdndSo/8rKnQBuB/N6teqamQYGkRfNWjHXvc8W313QqgO1e
   98F2u71lrXqLt9JahQI5bteLH04Pb8pDUEtWvWvUx3e6gQhIov/LQPveb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="456746725"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="456746725"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 17:51:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763867213"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="763867213"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 17:51:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1d9I-000A8a-2Z;
	Sat, 11 Nov 2023 01:51:00 +0000
Date: Sat, 11 Nov 2023 09:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jagath Jog J <jagathjog1996@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [linux-next:master 10319/16858]
 drivers/iio/imu/bmi323/bmi323_spi.c:44:28: sparse: sparse: symbol
 'bmi323_spi_regmap_config' was not declared. Should it be static?
Message-ID: <202311110902.HjNmBOUN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8728c14129df7a6e29188a2e737b4774fb200953
commit: b512c767e7bcef308ee5b038405debf9baa9c579 [10319/16858] iio: imu: Add driver for BMI323 IMU
config: i386-randconfig-063-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110902.HjNmBOUN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110902.HjNmBOUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110902.HjNmBOUN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/imu/bmi323/bmi323_spi.c:44:28: sparse: sparse: symbol 'bmi323_spi_regmap_config' was not declared. Should it be static?

vim +/bmi323_spi_regmap_config +44 drivers/iio/imu/bmi323/bmi323_spi.c

    43	
  > 44	const struct regmap_config bmi323_spi_regmap_config = {
    45		.reg_bits = 8,
    46		.val_bits = 16,
    47		.pad_bits = 8,
    48		.read_flag_mask = BIT(7),
    49		.max_register = BMI323_CFG_RES_REG,
    50		.val_format_endian = REGMAP_ENDIAN_LITTLE,
    51	};
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
