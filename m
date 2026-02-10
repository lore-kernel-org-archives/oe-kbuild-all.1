Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38E723741
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770739610; cv=none; b=sO+mNP81Wx7BFmpUiSwExuJF5SPNx7vuylzaXxfUKmLbXw70XsYHOUrBWjF514IlMRqyzIn2PNV9Y1foKCDJt6oNkDKnzebHk0tVCudDscpG8CAOGg8Dgp48AS4PVBX89+hAD3MhpIx6D6+NumGWO6c4D1LtfQP2nQmPPCLr+7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770739610; c=relaxed/simple;
	bh=JFQrb6ABOYw5xB82oL5yEsh+H0lKith+SaZhAtdopG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KXvmqU5zQAAP133GhPKBwctn80+2WjnQ2BUMsop+x4x1C1ich+iysytRMsUq3pDwX0np1a1xlLURmFWzQLR2wCommVHQ6vJUR/tEZ/UIQ3/Oqr9e8u+zbLDep1UBPAW1HWOaJFO5iLwwRJKTy9xEIZ+sNEW8pJ8kKjw4UW4Q/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBFsY6oB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBFsY6oB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770739609; x=1802275609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JFQrb6ABOYw5xB82oL5yEsh+H0lKith+SaZhAtdopG8=;
  b=DBFsY6oBzWKLKPg/+SI3pswulgA+O6gamPLtE1PJ5ZYESgEf1j60+l0w
   MYP4XRnt2fdU3ut73B2xsJwvTUWqAXatm9OZUIStAhRnQZZvc+0JWJ0mP
   +IRFNi/PKAm4+vVG+7NRfWiDuyEf8JncicHEUBt8gT2md/a4NBZSWm5eE
   s65c+FMF1a0mqJqynBqpKlqGXR8VNa7JpQ0/0Y/jcYqeo77AgJCJWjsLS
   B0NiL7hcaWuJvfFprx82BkmutGLhu2f78oC/iOzCyPUypYKB/kWarQ77/
   56VO9Ieikf8+nDbrLqAg7NJg1q+/WPjZ2MlZwiMBduupkpnYErAD9T5Zf
   g==;
X-CSE-ConnectionGUID: eq6w0ZxtQ+exnaHoChwtHQ==
X-CSE-MsgGUID: xKfqwNPhR6u51SRhSOIsEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71082392"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71082392"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 08:06:48 -0800
X-CSE-ConnectionGUID: 29Jt6IuWQL+vZ6C/Rae+eA==
X-CSE-MsgGUID: QhIWPm2lQPG2Vga4xwwoTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211287744"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Feb 2026 08:06:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpqGC-00000000pAl-0hL7;
	Tue, 10 Feb 2026 16:06:44 +0000
Date: Wed, 11 Feb 2026 00:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 57/60]
 drivers/accel/rocket/rocket_gem.c:137:3: error: call to undeclared function
 '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602102353.C3RmcWLH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   a6b2d8088b8b36fe673974611b90c1a1d9d5c18e
commit: 680ca28c4c0b565db3d9f8263a97fad8214ffdfe [57/60] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: powerpc64-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602102353.C3RmcWLH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602102353.C3RmcWLH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602102353.C3RmcWLH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/rocket/rocket_gem.c:137:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     137 |                 drm_dbg(dev, "Reserved field in drm_rocket_prep_bo struct should be 0.\n");
         |                 ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/rocket/rocket_gem.c:166:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     166 |                 drm_dbg(dev, "Reserved field in drm_rocket_fini_bo struct should be 0.\n");
         |                 ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   2 errors generated.
--
>> drivers/accel/rocket/rocket_job.c:76:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      76 |                 drm_dbg(dev, "Failed to allocate task array\n");
         |                 ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/rocket/rocket_job.c:86:4: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      86 |                         drm_dbg(dev, "Failed to copy incoming tasks\n");
         |                         ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/rocket/rocket_job.c:92:4: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      92 |                         drm_dbg(dev, "regcmd_count field in drm_rocket_task should be > 0.\n");
         |                         ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/rocket/rocket_job.c:604:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     604 |                 drm_dbg(dev, "job_struct_size field in drm_rocket_submit struct is too small.\n");
         |                 ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/rocket/rocket_job.c:609:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     609 |                 drm_dbg(dev, "Reserved field in drm_rocket_submit struct should be 0.\n");
         |                 ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/rocket/rocket_job.c:615:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     615 |                 drm_dbg(dev, "Failed to allocate incoming job array\n");
         |                 ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/rocket/rocket_job.c:624:4: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     624 |                         drm_dbg(dev, "Failed to copy incoming job array\n");
         |                         ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   7 errors generated.


vim +/_dynamic_func_call_cls +137 drivers/accel/rocket/rocket_gem.c

525ad89dd90434 Tomeu Vizoso 2025-07-21  127  
525ad89dd90434 Tomeu Vizoso 2025-07-21  128  int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file)
525ad89dd90434 Tomeu Vizoso 2025-07-21  129  {
525ad89dd90434 Tomeu Vizoso 2025-07-21  130  	struct drm_rocket_prep_bo *args = data;
525ad89dd90434 Tomeu Vizoso 2025-07-21  131  	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
525ad89dd90434 Tomeu Vizoso 2025-07-21  132  	struct drm_gem_object *gem_obj;
525ad89dd90434 Tomeu Vizoso 2025-07-21  133  	struct drm_gem_shmem_object *shmem_obj;
525ad89dd90434 Tomeu Vizoso 2025-07-21  134  	long ret = 0;
525ad89dd90434 Tomeu Vizoso 2025-07-21  135  
525ad89dd90434 Tomeu Vizoso 2025-07-21  136  	if (args->reserved != 0) {
525ad89dd90434 Tomeu Vizoso 2025-07-21 @137  		drm_dbg(dev, "Reserved field in drm_rocket_prep_bo struct should be 0.\n");
525ad89dd90434 Tomeu Vizoso 2025-07-21  138  		return -EINVAL;
525ad89dd90434 Tomeu Vizoso 2025-07-21  139  	}
525ad89dd90434 Tomeu Vizoso 2025-07-21  140  
525ad89dd90434 Tomeu Vizoso 2025-07-21  141  	gem_obj = drm_gem_object_lookup(file, args->handle);
525ad89dd90434 Tomeu Vizoso 2025-07-21  142  	if (!gem_obj)
525ad89dd90434 Tomeu Vizoso 2025-07-21  143  		return -ENOENT;
525ad89dd90434 Tomeu Vizoso 2025-07-21  144  
525ad89dd90434 Tomeu Vizoso 2025-07-21  145  	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_WRITE, true, timeout);
525ad89dd90434 Tomeu Vizoso 2025-07-21  146  	if (!ret)
525ad89dd90434 Tomeu Vizoso 2025-07-21  147  		ret = timeout ? -ETIMEDOUT : -EBUSY;
525ad89dd90434 Tomeu Vizoso 2025-07-21  148  
525ad89dd90434 Tomeu Vizoso 2025-07-21  149  	shmem_obj = &to_rocket_bo(gem_obj)->base;
525ad89dd90434 Tomeu Vizoso 2025-07-21  150  
525ad89dd90434 Tomeu Vizoso 2025-07-21  151  	dma_sync_sgtable_for_cpu(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
525ad89dd90434 Tomeu Vizoso 2025-07-21  152  
525ad89dd90434 Tomeu Vizoso 2025-07-21  153  	drm_gem_object_put(gem_obj);
525ad89dd90434 Tomeu Vizoso 2025-07-21  154  
525ad89dd90434 Tomeu Vizoso 2025-07-21  155  	return ret;
525ad89dd90434 Tomeu Vizoso 2025-07-21  156  }
525ad89dd90434 Tomeu Vizoso 2025-07-21  157  

:::::: The code at line 137 was first introduced by commit
:::::: 525ad89dd90434d529b76a87b1c653a69fedc416 accel/rocket: Add IOCTLs for synchronizing memory accesses

:::::: TO: Tomeu Vizoso <tomeu@tomeuvizoso.net>
:::::: CC: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
