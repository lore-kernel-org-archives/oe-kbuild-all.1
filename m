Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BBE223DD1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749854369; cv=none; b=Kdmeau9N8oJOhJ+EZP63XkplyqQWBl90w3+HqGa92XexEW4cw7j82ux5JQaYyEjWCXPDYP/O+IoWxB0+bL4IQX+5YrqF+7h0o/efp1JdEbSvVpWG+54d9ztBuzRbeClUSudn3G97sNLiaBcvBUpwVQFgrdHPOASM1cUsOQU5Wgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749854369; c=relaxed/simple;
	bh=gDns3GyN5Z39UbFMq5QRS/ah9pDvKUmpUX/BNPdLdN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P48j4zdcyPjdSiyhQNQg/t6zz4+LBnB/BRClvCrH8VSpuJmzPC49GdZgZoRn7n0kHxVPYB1CtAnrgs/j7T4oMd2biIE+zXVeRLCMAlMj/9h972oLHdmTsmPGqUJDd9rLqMgc17X9sIy9yaNHH3vQM3lKtKF863T7By9TTAUgvnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQar9L0S; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQar9L0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749854367; x=1781390367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gDns3GyN5Z39UbFMq5QRS/ah9pDvKUmpUX/BNPdLdN8=;
  b=fQar9L0SyGC/bSTrQp1hbcF2qPS8fVRM+vxd/zO+qC3DQV75TDjyndLR
   DaXnIDaK9aNkz0DdSFy3wwWAJ0RT9mgHvruxpyIVinZEUCBBbQrWwH9Ly
   fKKxx9VS6nKIJ8XRByX5DfjIyu+lgV0VdZs118LuDVzXNRVNMznSokVX4
   cYsaUclXvwgGJhMB3ABKW39gWpUjgPRGZ8Yh5LpmYjHOM/i02yS+gSpOW
   Lb2CKWOpuY39JY9CNCS1u0YdcBSovZnMQ2+s5wErbcq8ZUC2k9KI6Tzga
   J3kVU6lfL2YeREIyjZOcXSJGK0FRGuS7DVw/kztLgz2qiIYFYaFIPbQSd
   g==;
X-CSE-ConnectionGUID: 5Lxh5/JKQeyBKD8/FuoV2w==
X-CSE-MsgGUID: yZ9WEFQhRcucNQgINZ6Udg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77471992"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="77471992"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 15:39:26 -0700
X-CSE-ConnectionGUID: JTy5ufvTSku7/NHevpsaAw==
X-CSE-MsgGUID: nkH4yh4HSr63iWtQbj+xlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="151763243"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 15:39:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQD3T-000D3A-0t;
	Fri, 13 Jun 2025 22:39:23 +0000
Date: Sat, 14 Jun 2025 06:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2390/2390]
 drivers/crypto/sedriver/wst_se_echip_driver.c:18:1: sparse: sparse: symbol
 'g_reclistlock' was not declared. Should it be static?
Message-ID: <202506140640.zLTmWYoC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cae4eb6e367d11798ca1765e36ccaa97fa789a00
commit: 3fb87845837f13b19d7b20349801e75f2e303293 [2390/2390] crypto: loongson: add wst se chip support
config: loongarch-randconfig-r131-20250614 (https://download.01.org/0day-ci/archive/20250614/202506140640.zLTmWYoC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250614/202506140640.zLTmWYoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140640.zLTmWYoC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/crypto/sedriver/wst_se_echip_driver.c: note: in included file:
   drivers/crypto/sedriver/wst_se_echip_driver.h:109:1: sparse: sparse: symbol 'g_writelock' was not declared. Should it be static?
>> drivers/crypto/sedriver/wst_se_echip_driver.c:18:1: sparse: sparse: symbol 'g_reclistlock' was not declared. Should it be static?
>> drivers/crypto/sedriver/wst_se_echip_driver.c:19:1: sparse: sparse: symbol 'g_sendlistlock' was not declared. Should it be static?
>> drivers/crypto/sedriver/wst_se_echip_driver.c:20:1: sparse: sparse: symbol 'g_getdmabuflock' was not declared. Should it be static?
>> drivers/crypto/sedriver/wst_se_echip_driver.c:22:15: sparse: sparse: symbol 'g_pCacheInBuf' was not declared. Should it be static?
>> drivers/crypto/sedriver/wst_se_echip_driver.c:22:38: sparse: sparse: symbol 'g_pCacheOutBuf' was not declared. Should it be static?
>> drivers/crypto/sedriver/wst_se_echip_driver.c:924:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:924:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:924:9: sparse:     got void *
>> drivers/crypto/sedriver/wst_se_echip_driver.c:934:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:934:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:934:25: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:935:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:935:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:935:25: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:940:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:940:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:940:25: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:941:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:941:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:941:25: sparse:     got void *
>> drivers/crypto/sedriver/wst_se_echip_driver.c:988:79: sparse: sparse: Using plain integer as NULL pointer
   drivers/crypto/sedriver/wst_se_echip_driver.c:1005:79: sparse: sparse: Using plain integer as NULL pointer
   drivers/crypto/sedriver/wst_se_echip_driver.c:1018:78: sparse: sparse: Using plain integer as NULL pointer
   drivers/crypto/sedriver/wst_se_echip_driver.c:620:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:620:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:620:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:622:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:622:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:622:17: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:544:66: sparse: sparse: Using plain integer as NULL pointer
   drivers/crypto/sedriver/wst_se_echip_driver.c:549:65: sparse: sparse: Using plain integer as NULL pointer
   drivers/crypto/sedriver/wst_se_echip_driver.c:559:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:559:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:559:17: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:561:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:561:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:561:17: sparse:     got void *
>> drivers/crypto/sedriver/wst_se_echip_driver.c:95:24: sparse: sparse: symbol 'se_get_dma_buf' was not declared. Should it be static?
>> drivers/crypto/sedriver/wst_se_echip_driver.c:114:5: sparse: sparse: symbol 'se_free_dma_buf' was not declared. Should it be static?
>> drivers/crypto/sedriver/wst_se_echip_driver.c:150:5: sparse: sparse: symbol 'se_printk_hex' was not declared. Should it be static?
   drivers/crypto/sedriver/wst_se_echip_driver.c:197:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:197:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:197:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:198:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:198:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:198:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:199:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:199:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:199:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:200:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:200:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:200:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:201:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:201:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:201:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:204:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:204:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:204:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:205:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:205:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:205:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:206:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:206:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:206:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:207:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:207:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:207:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:208:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:208:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:208:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:209:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:209:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:209:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:210:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:210:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:210:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:214:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:214:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:214:17: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:216:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:216:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:216:17: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:243:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:243:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:243:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:244:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:244:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:244:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:246:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:246:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:246:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:249:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:249:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:249:26: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:251:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:251:53: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:251:53: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:252:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:252:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:252:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:654:46: sparse: sparse: Using plain integer as NULL pointer
   drivers/crypto/sedriver/wst_se_echip_driver.c:656:46: sparse: sparse: Using plain integer as NULL pointer
   drivers/crypto/sedriver/wst_se_echip_driver.c:687:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:687:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:687:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:688:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:688:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:688:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:689:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:689:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:689:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:704:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:704:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:704:25: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:707:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:707:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:707:33: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:862:59: sparse: sparse: Using plain integer as NULL pointer
   drivers/crypto/sedriver/wst_se_echip_driver.c:862:62: sparse: sparse: Using plain integer as NULL pointer
   drivers/crypto/sedriver/wst_se_echip_driver.c:1160:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:1160:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:1160:9: sparse:     got void *
   drivers/crypto/sedriver/wst_se_echip_driver.c:1162:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:1162:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/crypto/sedriver/wst_se_echip_driver.c:1162:9: sparse:     got void *
>> drivers/crypto/sedriver/wst_se_echip_driver.c:1169:58: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/crypto/sedriver/wst_se_echip_driver.c:1169:58: sparse:     expected long ( *write )( ... )
   drivers/crypto/sedriver/wst_se_echip_driver.c:1169:58: sparse:     got long ( * )( ... )
>> drivers/crypto/sedriver/wst_se_echip_driver.c:1175:5: sparse: sparse: symbol 'se_chip_load' was not declared. Should it be static?
>> drivers/crypto/sedriver/wst_se_echip_driver.c:1272:6: sparse: sparse: symbol 'se_chip_unload' was not declared. Should it be static?
   drivers/crypto/sedriver/wst_se_echip_driver.c: note: in included file (through drivers/crypto/sedriver/wst_se_ktrans.h, drivers/crypto/sedriver/wst_se_echip_driver.h):
>> drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char *puserbuf @@
   drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse:     expected void const [noderef] __user *from
   drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse:     got unsigned char *puserbuf
>> drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char *puserbuf @@
   drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse:     expected void [noderef] __user *to
   drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse:     got unsigned char *puserbuf
>> drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char *puserbuf @@
   drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse:     expected void const [noderef] __user *from
   drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse:     got unsigned char *puserbuf
>> drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char *puserbuf @@
   drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse:     expected void [noderef] __user *to
   drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse:     got unsigned char *puserbuf
>> drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char *puserbuf @@
   drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse:     expected void const [noderef] __user *from
   drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse:     got unsigned char *puserbuf
>> drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char *puserbuf @@
   drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse:     expected void [noderef] __user *to
   drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse:     got unsigned char *puserbuf
>> drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char *puserbuf @@
   drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse:     expected void const [noderef] __user *from
   drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse:     got unsigned char *puserbuf
>> drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char *puserbuf @@
   drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse:     expected void [noderef] __user *to
   drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse:     got unsigned char *puserbuf
>> drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char *puserbuf @@
   drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse:     expected void const [noderef] __user *from
   drivers/crypto/sedriver/wst_se_common_type.h:93:46: sparse:     got unsigned char *puserbuf
>> drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char *puserbuf @@
   drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse:     expected void [noderef] __user *to
   drivers/crypto/sedriver/wst_se_common_type.h:95:37: sparse:     got unsigned char *puserbuf

vim +/g_reclistlock +18 drivers/crypto/sedriver/wst_se_echip_driver.c

    14	
    15	#define LS_CRYPTO_SE_ADDR1 TO_UNCACHE(LOONGSON_REG_BASE + 0x0400)
    16	#define LS_CRYPTO_SE_ADDR2 TO_UNCACHE(0xc0010200000)
    17	#define DRIVER_VERSION "01.10.220111"
  > 18	DEFINE_SPINLOCK(g_reclistlock);
  > 19	DEFINE_SPINLOCK(g_sendlistlock);
  > 20	DEFINE_SPINLOCK(g_getdmabuflock);
    21	
  > 22	unsigned char *g_pCacheInBuf = NULL, *g_pCacheOutBuf = NULL;
    23	static struct class *g_psecclass;
    24	static struct device *g_psecdev;
    25	static struct tagSEdrvctl *g_psechipDrvCtrl;
    26	static int g_isechip_Major = -1;
    27	static struct semaphore g_lowsema, g_lowirqsema;
    28	static atomic_t g_sendtotallen;
    29	static struct tag_Queue_container g_RecQueueContainer;
    30	static struct tag_Queue_container g_SendQueueContainer;
    31	static int g_suspend;
    32	static struct semaphore g_dmabufsem;
    33	struct loongson_sedriver_irq se_irq[] = {
    34		{
    35			.pat = "se-irq",
    36		},
    37		{
    38			.pat = "se-lirq",
    39		},
    40	};
    41	static struct tag_Queue_container g_DmaBQueueContainer;
    42	static struct tag_dma_buf_ctl *g_pdmadatabuf;
    43	static int g_iDmaBufNum;
    44	static struct work_struct g_recwork, g_sendwork;
    45	static struct workqueue_struct *g_worksendqueue, *g_workrecqueue;
    46	static irqreturn_t se_interrupt(int irq, void *p);
    47	static irqreturn_t wst_low_channel_status(int irq, void *p);
    48	static void globalmem_do_send_op(struct work_struct *p);
    49	static void globalmem_do_rec_op(struct work_struct *p);
    50	static int g_iUseIntr = 1;
    51	module_param(g_iUseIntr, int, 0644);
    52	
    53	static int se_init_dma_buf(int idatasize, int idatanum)
    54	{
    55		int i;
    56		struct tag_dma_buf_ctl *pdmactl;
    57	
    58		wst_InitQueue(&g_DmaBQueueContainer, idatanum);
    59		g_pdmadatabuf = kmalloc((sizeof(struct tag_dma_buf_ctl) * idatanum),
    60					GFP_KERNEL);
    61		if (!g_pdmadatabuf)
    62			return -1;
    63		for (i = 0; i < idatanum; i++) {
    64			pdmactl = &g_pdmadatabuf[i];
    65			pdmactl->pDmaBuf =
    66				(unsigned char *)__get_free_page(GFP_KERNEL | GFP_DMA);
    67			if (!pdmactl->pDmaBuf) {
    68				g_iDmaBufNum = i;
    69				return SE_OK;
    70			}
    71			wst_Pushback_Que(&g_DmaBQueueContainer, pdmactl);
    72		}
    73		g_iDmaBufNum = i;
    74		sema_init(&g_dmabufsem, 1);
    75		return SE_OK;
    76	}
    77	
    78	static int se_del_dma_buf(void)
    79	{
    80		int i;
    81		struct tag_dma_buf_ctl *pdmactl;
    82	
    83		for (i = 0; i < g_iDmaBufNum; i++) {
    84			pdmactl = &g_pdmadatabuf[i];
    85			if (pdmactl) {
    86				free_page((unsigned long)pdmactl->pDmaBuf);
    87				pdmactl->pDmaBuf = NULL;
    88			}
    89		}
    90		kfree(g_pdmadatabuf);
    91		g_pdmadatabuf = NULL;
    92		return 0;
    93	}
    94	
  > 95	struct tag_dma_buf_ctl *se_get_dma_buf(int ikernel)
    96	{
    97		struct tag_dma_buf_ctl *pbufctl = NULL;
    98		unsigned long ultimeout = 0;
    99	
   100		ultimeout = jiffies + 20 * HZ;
   101		while (1) {
   102			spin_lock(&g_getdmabuflock);
   103			pbufctl = (struct tag_dma_buf_ctl *)wst_Popfront_Que(
   104				&g_DmaBQueueContainer);
   105			spin_unlock(&g_getdmabuflock);
   106			if (pbufctl)
   107				return pbufctl;
   108			if (down_timeout(&g_dmabufsem, ultimeout))
   109				return NULL;
   110		}
   111		return pbufctl;
   112	}
   113	
 > 114	int se_free_dma_buf(struct tag_dma_buf_ctl *pdmabufctl)
   115	{
   116		spin_lock(&g_getdmabuflock);
   117		wst_Pushback_Que(&g_DmaBQueueContainer, pdmabufctl);
   118		spin_unlock(&g_getdmabuflock);
   119		if (g_dmabufsem.count <= 0)
   120			up(&g_dmabufsem);
   121	
   122		return 0;
   123	}
   124	
   125	static unsigned long bytes_align(struct device *pdev, unsigned long ulVirAddr)
   126	{
   127		unsigned char diff;
   128		unsigned long ulPhyAddr = (unsigned long)__pa((void *)ulVirAddr);
   129	
   130		if ((ulPhyAddr & 0x000000000000003f) == 0)
   131			return ulVirAddr;
   132		diff = ((long)ulPhyAddr & (~(0x000000000000003f))) + 64 - ulPhyAddr;
   133		ulVirAddr += diff;
   134	
   135		return ulVirAddr;
   136	}
   137	
   138	static unsigned long descri_bytes_align(unsigned long ulVirAddr)
   139	{
   140		unsigned char diff;
   141		unsigned long ulPhyAddr = ulVirAddr;
   142	
   143		if ((ulPhyAddr & (~0x00000000ffffffe0)) == 0)
   144			return ulVirAddr;
   145		diff = ((long)ulPhyAddr & 0x00000000ffffffe0) + 32 - ulPhyAddr;
   146		ulVirAddr += diff;
   147		return ulVirAddr;
   148	}
   149	
 > 150	int se_printk_hex(unsigned char *buff, int length)
   151	{
   152		unsigned char *string_tmp = buff;
   153		int i;
   154		int count = 0;
   155	
   156		for (i = 0; i < length; i++, count++) {
   157			if (count < 16)
   158				pr_info("%02x ", string_tmp[i]);
   159			else {
   160				count = 0;
   161				pr_info("\n%02x ", string_tmp[i]);
   162				continue;
   163			}
   164		}
   165		pr_info("\n");
   166		return 0;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
