Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD4748CFC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725614581; cv=none; b=IdvRJyr/vteg117KGRc+dTp5l5Vr0Md3DZfSZwyghUBXHeJ0XyI246h771kaMvMCDOJRjbjnJASnFECRGWedudxRO2KLF4WnEcabiO/EaTtOf/4RsTW3oNeHp28+uPbxk5VMccq/6hbA9eapIjD9yIWdK16whvQznOLfaVp6WBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725614581; c=relaxed/simple;
	bh=D7mUoNHVb49z9yKjyInu52qyvdfvNojhnWTRneFI6Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y1z0TABaTwR1o5PElgkbGj8yp5OiszMZIYTiM3HNsOk7XJnZQLzPJ7KsqNkIAWYheWmYVrDx4V+v+ggki3Lbuo2iwF7n/JEjBxRL3yhr379+kaL3qEnBpSTQKBi1qvNSH54R6si94Do/rYiKViN1yxysGCuIWOuBuXflnTOrPYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mh9C3YrX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mh9C3YrX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725614579; x=1757150579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7mUoNHVb49z9yKjyInu52qyvdfvNojhnWTRneFI6Fs=;
  b=Mh9C3YrX0FxXfsgu+lhXFjUg0MSNvLzmP8uaqC9bfJwHHM63/HzKHaFG
   CuF2SzTl9HmSEQ2bZm1sd7e9Soug9gzw6nu93GIk4bQZf8J5LCnGr3+4y
   4DxLZFYEyPs0VXnUY2X64Kkr7PN8affDtyWC5t520mA4xZdLjPKkEVgyw
   h/StfRazukFWZ5wHcQa821NPoDts9gEbm4yjfbH9b1S01CekQ4G6OFv+a
   H4SMCQfZK1Btrj3ciNSd7I7le3g+PZv2A4IKTrKTzVQ5LiglB6RgQ47eY
   AzhFMUbYqoUEJmLJf7i+dm/vv1V+mcnBlPMpxHiwOYRUcuE50oRvhQ6cI
   g==;
X-CSE-ConnectionGUID: A8ndGm0bR4ygGA1g7VpR+A==
X-CSE-MsgGUID: 1kDOwfcBR8e9dw36bL3oFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35718887"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="35718887"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 02:22:59 -0700
X-CSE-ConnectionGUID: 55APFDAbRlmrYYXwvogbQQ==
X-CSE-MsgGUID: fjyFdYbQT1mmWOlOYF8fOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70483533"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Sep 2024 02:22:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smVB9-000Auf-0m;
	Fri, 06 Sep 2024 09:22:55 +0000
Date: Fri, 6 Sep 2024 17:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 21/53]
 drivers/mtd/chips/map_esp32.c:141:15: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202409061704.9CSxVOEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: d99ee73f47ff45ddc38967389cccb186f1265eb8 [21/53] drivers/mtd: add esp32 MTD support
config: parisc-randconfig-r113-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061704.9CSxVOEk-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240906/202409061704.9CSxVOEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061704.9CSxVOEk-lkp@intel.com/

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
