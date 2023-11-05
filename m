Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F0D17998
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 20:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyAhOsN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699214899; x=1730750899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGpjNOcUdNfKKPZmQwJ0wXjVnDEj0YLKt17JpwCIfkQ=;
  b=LyAhOsN8GNqY3aIYyKR+f94wJsIER1T/jQJTYozTzdEwy9Q00gP3dqYu
   fpNKukcByfpmdEEAerFenZYsp7M9xX4F8xHlSsJeH9B6S4vXdGq8LB71W
   kppjrTWUVMtIOHGMbrwFDQzEwEtcW9fcKMwDf5SBXyx8FG19Nc3EpoDEx
   rl01V4kVG8vaH4+xyTrVwchxzJq/t7HeeLTjR9EbBiqQxN+XGL+mgmEzX
   wMu0KqqqK+kmJV+kL90qnIe6YaNypmJF2e/8qNmUUU7xr/OLqRoqcpNHH
   +Kvt+dqEZ7IzIKhSwaUDV6a3ZvpJvQUeku6yoZMMi7rO0s5vPAi2i99hf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2155067"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="2155067"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 12:08:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762127937"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="762127937"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Nov 2023 12:08:15 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzjPp-0005lA-1g;
	Sun, 05 Nov 2023 20:08:13 +0000
Date: Mon, 6 Nov 2023 04:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Othacehe <m.othacehe@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/iio/proximity/isl29501.c:1009:34: warning:
 'isl29501_i2c_matches' defined but not used
Message-ID: <202311060413.MoUX2fHF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: 1c28799257bca28cd5ba715e33157500d6239333 iio: light: isl29501: Add support for the ISL29501 ToF sensor.
date:   5 years ago
config: x86_64-randconfig-r025-20230725 (https://download.01.org/0day-ci/archive/20231106/202311060413.MoUX2fHF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060413.MoUX2fHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060413.MoUX2fHF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/proximity/isl29501.c:1009:34: warning: 'isl29501_i2c_matches' defined but not used [-Wunused-const-variable=]
    1009 | static const struct of_device_id isl29501_i2c_matches[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/isl29501_i2c_matches +1009 drivers/iio/proximity/isl29501.c

  1007	
  1008	#if defined(CONFIG_OF)
> 1009	static const struct of_device_id isl29501_i2c_matches[] = {
  1010		{ .compatible = "renesas,isl29501" },
  1011		{ }
  1012	};
  1013	MODULE_DEVICE_TABLE(of, isl29501_i2c_matches);
  1014	#endif
  1015	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
