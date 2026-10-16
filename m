Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE66B24E4C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142267; cv=none; b=IbVWnIiQsBGDJT9OqA8boHwjSb91dmk6rdOn5uYYnbFdMvTAGLIlE9A9T4rcivdmfDsQhxIy6UF7cAxIxJV56rwtl4SYf/YGX9tRZFPuGARuJeZRkVUFGWiaCwV4tkkYGUnjPVAxenokpO8heUcyg/LFO7cmwOQ48cPcz56lvyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142267; c=relaxed/simple;
	bh=R5bPLcEOzZ6RXQXzes689qETnzb0cXUtNBV1iLu1kCk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mr6miDFNcp4ygaBlCbRu1MrqkrfKwxZ1VedRNMB+wwCqtNOwJl0lwKJBhC0B7QDXyZ9A4z2BdA4PGNlc597BRvk1IRcokCvqMiaAFR8fpxk/S44PJLq7alQ6ZYlWskmlHz1Q7eMNrisNvS4+P3+4tlfKUwm4S8hHeIjPV9Bsimc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNBTxMgK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNBTxMgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792142266; x=1823678266;
  h=date:from:to:cc:subject:message-id;
  bh=R5bPLcEOzZ6RXQXzes689qETnzb0cXUtNBV1iLu1kCk=;
  b=TNBTxMgKYANE+KNB5m5F4TgQnJ5RBuPcMB1fTOCc7Oq/SIjsiM3hGxk5
   UPxOSp8xbHBkYmcnzq39z5sVxrnyG8MG9LZnrrFCZKWS+RDXbMe0VuOgx
   XrFILubZvBE6BBo1nP7zPL8e7YPMVgh+FLvzt/etKK4A4ef0g9mwCl4Us
   f5/69iXnZ3d4UcNKmMFWe0nn//SqmObPymRvLmgOodAU0b1aw4239vnto
   qKsvw0evlgJUeWsVQKFHtZ3YnLGkbgtnwB3ChhJUCtrtIXSEAM7MVpNsi
   fEVvQ7WYMwogRwI7FvgpInnlU97+QafXz+8ALPEdz4DWAc+naDSIvCCQ2
   Q==;
X-CSE-ConnectionGUID: ps8Kxn9KRDahaNNQIHtpEw==
X-CSE-MsgGUID: QTzaAIz8RDuQv7VXpgCC9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="1025468"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1025468"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 02:17:46 -0700
X-CSE-ConnectionGUID: JZfZZKkVRtqy+YDpUcEeLw==
X-CSE-MsgGUID: TjefQEeyQ92yZShxyCAIrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1901159"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2026 02:17:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHe4L-00000000C9r-31jN;
	Fri, 16 Oct 2026 09:17:41 +0000
Date: Fri, 16 Oct 2026 11:16:44 +0200
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 1/92]
 drivers/media/platform/apple/isp/isp-drv.h:253:29: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 4 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202610161156.2DshnNOp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   c792edd0ffb515a81db3e039bc6e2a611c51d65b
commit: a4f0cf2bc24733efc65eda7596f80788878666f5 [1/92] media: apple: Add Apple ISP driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261016/202610161156.2DshnNOp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161156.2DshnNOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161156.2DshnNOp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:38,
                    from include/media/media-device.h:17,
                    from include/media/v4l2-device.h:12,
                    from drivers/media/platform/apple/isp/isp-drv.h:13,
                    from drivers/media/platform/apple/isp/isp-iommu.h:7,
                    from drivers/media/platform/apple/isp/isp-ipc.c:4:
   drivers/media/platform/apple/isp/isp-ipc.c: In function 'sm_malloc_deferred_worker':
>> drivers/media/platform/apple/isp/isp-drv.h:253:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     253 |         dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:253:9: note: in expansion of macro 'dev_err'
     253 |         dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-ipc.c:227:17: note: in expansion of macro 'isp_err'
     227 |                 isp_err(isp, "failed to vmap iova=0x%llx size=0x%llx\n",
         |                 ^~~~~~~


vim +253 drivers/media/platform/apple/isp/isp-drv.h

   251	
   252	#define isp_err(isp, fmt, ...) \
 > 253		dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
   254	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
