Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693CCDF6C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jan 2024 21:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOgsjE+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704145248; x=1735681248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i3oKoOrAzWvGCugKbw58PvqWxmyDIZULf99Z/K9Qa1g=;
  b=GOgsjE+luOzKJ+ysPF9Et3aVXuYCFv43t/0fFRLWeoGsyPpQbkH3+zP2
   CFc9XXnHxD8plUGhfgrsQftZn1S7yRTHAmzgFrUf7PF/h1qMu+7V+1in6
   J0c9a4r1AI8H8A5ukYhHwzz5MVyCnsQKn8/RbixqvBiXVJEjbyRn0fbBP
   iohF7MGrqftr0fQBjNH2HUlYvsxnqfNV995iJ+xz4giFGTeWPMVjWMXdT
   C1pOvVnaS/o+e3vY7y4dRDQhbxhX995BIAvAQLeC8eqCSyqtN3mU9Mvsl
   ekESBuW5Cv+WcKswD/gKDf8lN7ZsfWCTW8u933lGxdqb33jVvErlko836
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="376975197"
X-IronPort-AV: E=Sophos;i="6.04,323,1695711600"; 
   d="scan'208";a="376975197"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2024 13:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,323,1695711600"; 
   d="scan'208";a="21597754"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jan 2024 13:40:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKQ1Y-000KXk-0O;
	Mon, 01 Jan 2024 21:40:44 +0000
Date: Tue, 2 Jan 2024 05:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.7-rc8-esp32 19/41]
 drivers/mtd/chips/map_esp32.c:141:15: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202401020503.c6ajLXEb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.7-rc8-esp32
head:   0d2bac3b222a38965becf64e52a686f7b89271c2
commit: 24aac20f0427218f822823f0cbb3c4dae2ebfb21 [19/41] drivers/mtd: add esp32 MTD support
config: loongarch-randconfig-r112-20240101 (https://download.01.org/0day-ci/archive/20240102/202401020503.c6ajLXEb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240102/202401020503.c6ajLXEb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401020503.c6ajLXEb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/chips/map_esp32.c:141:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/mtd/chips/map_esp32.c:141:15: sparse:     expected void *
   drivers/mtd/chips/map_esp32.c:141:15: sparse:     got void [noderef] __iomem *

vim +141 drivers/mtd/chips/map_esp32.c

   131	
   132	
   133	static int map_esp32_point(struct mtd_info *mtd, loff_t from, size_t len,
   134				   size_t *retlen, void **virt, resource_size_t *phys)
   135	{
   136		struct esp32_ipc_flash *hw = mtd->priv;
   137		struct map_info *map = hw->map;
   138	
   139		if (!map->virt)
   140			return -EINVAL;
 > 141		*virt = map->virt + from;
   142		if (phys)
   143			*phys = map->phys + from;
   144		*retlen = len;
   145		return 0;
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
