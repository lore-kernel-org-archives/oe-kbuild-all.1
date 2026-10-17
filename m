Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295538236E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792263938; cv=none; b=bfzQQREkRW/qXU7j8/mYDT5BAO9s0AZ8w2vPgmTu1V5sdJq7iD94KeTkZgBjrdDgXs4yxuMtfCnaoN+TPkvTasDRcwhp+GNo43J7/CrYw1EwzGmGO8SpxKHKPRwskjr/aAbkO5chvICA9eKCbC7qlgvFghvQBOFy09TpqqqJj4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792263938; c=relaxed/simple;
	bh=nBtMxprM6Im8MtnRvu07vVSjUJb7U3ma5E6oCq0eAnU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gOeWwi/3+I6jtlU3QNhq/gpfELRvIjzyekSRCoAeM7wlqRzrRo6BJCNTCzjYjn5eOa8lRgkAMm5pXGYHDCpcvj2pnmypWO4KS1NX2Cd1sIE1zuA9gkGsPC9WA5wFttcGu6kx8xu5u+FyrIgScEJsSJfPPyIu6ckN1NAas9wObk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5jVq8iv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5jVq8iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792263937; x=1823799937;
  h=date:from:to:cc:subject:message-id;
  bh=nBtMxprM6Im8MtnRvu07vVSjUJb7U3ma5E6oCq0eAnU=;
  b=m5jVq8ivYOxLgxUzT5cSySbqO4AsS8nor/EoNW/62VhEJkDkTzS3W1T3
   +R4QVYDxA9onzFzGOkNJqAe3/W7gt6i+WOM+MoTjChzAzCwMEuBxcY8Q5
   7yh1NVN8Fe7I6ojWSprK/wqzOE7sEfrdaZyS3pN5kcDDkfPglHqz+STcE
   KuvCu2gGcElLb8VpBzHwm8OYSfAesmHDUQaVDv0WdSCyyolo+PBdArTzY
   0FXI068cKIEbD6MeGy6lCu6gT/MrXZv4cNdX6NunQmeb3ZtPe6Q53APoh
   pC5lUms//6FR0wpl4jYBw+LWlrGGMH6CAa1Nwcd0bI22H+Xjg3B0EELP2
   g==;
X-CSE-ConnectionGUID: 2iANNrYwQTepJYlewjqG1g==
X-CSE-MsgGUID: BHM7IFrVR16WbN+/vT4dHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="914424"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="914424"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 12:05:37 -0700
X-CSE-ConnectionGUID: xjhepwd2SVKeRxs4xxPQHQ==
X-CSE-MsgGUID: VS1ElPTARrGdqAJaQDZ3TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="3945823"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 17 Oct 2026 12:05:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI9im-00000000Jck-1UAi;
	Sat, 17 Oct 2026 19:05:32 +0000
Date: Sun, 18 Oct 2026 03:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 1/92]
 drivers/media/platform/apple/isp/isp-drv.h:253:29: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 4 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202610180229.wxn4D9Hb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   c792edd0ffb515a81db3e039bc6e2a611c51d65b
commit: a4f0cf2bc24733efc65eda7596f80788878666f5 [1/92] media: apple: Add Apple ISP driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261018/202610180229.wxn4D9Hb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180229.wxn4D9Hb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180229.wxn4D9Hb-lkp@intel.com/

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
