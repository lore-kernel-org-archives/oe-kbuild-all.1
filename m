Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD861E0DCE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739127510; cv=none; b=f0qMHx7KsvpACcdSO7euMkRk/OwBxU+Tt7BPOsSTB6wMOvXbncm9/dwYn83cFEA10YEMa3lHZs543Ch8rGzrxd9U55z/BWNUuaOkqIRyPEAVENg+pe/1V3YhP+nZEfojp13J1WmE2AEcdQDhFxrH2YILS+S0M5wKUjzmvT6roOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739127510; c=relaxed/simple;
	bh=oMVPUdEAh9umnQ3s9Ra4GVehW1DXgt8RPkynDKqBzvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MRRinmz/yHIZGwvmRd5NUjxuz3NeVDrN3KLUVZYnTwEmBEFzeh2AUk0PKAajvwiUtkemN6mZA4piKFomj2cpgz/+pEyvjZfbCHeaFcX4XlwLFxG7Eo4RO1sLre2FyP9hlYBXlFplOrGQREvpti1ligEV3jlBDhDN5zVtBuYNhvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8pdiQBS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8pdiQBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739127508; x=1770663508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oMVPUdEAh9umnQ3s9Ra4GVehW1DXgt8RPkynDKqBzvA=;
  b=m8pdiQBSJrWSwRyr25dCpFUSRChgyxvE5OJHD0jvVnR3XIJmPtc0mQ+y
   bteNDp9sAwLZp/PF4M9JMM7CA96QLP4D6BJKeDZlCYpaP6LCtq+784gZZ
   WABwT9Th0prWlD7RUyTDs6EX4/f/gH/KFUhyV9J7Tz2E/wt/0Q2+n9Ua4
   F3YmATXPwbjM/q22fzj4OX8u9Vuj3E5jYxVAYlWEfS6aKVwkGjYzjPUS/
   NKAf4AF8DUmSifp3zlwgOAkctZsdvOJUVbhNI1TSooKr+OJHdxVLeOx+p
   GDzy1WCQeU5O/60E8qloZp67vp+2jgTb0K/qb6PnCBYfDZdhhqwOZn065
   w==;
X-CSE-ConnectionGUID: swSeBJQ9RgOrB7V8j8kdsg==
X-CSE-MsgGUID: 8gmWJLT1SEOqDQvIUW482w==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50691708"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="50691708"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 10:58:26 -0800
X-CSE-ConnectionGUID: 1dsxKiK0TYu1EluhqbDX0w==
X-CSE-MsgGUID: kTF80VB4RciYY3BSQ6+4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="142859331"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Feb 2025 10:58:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thCVa-0011nx-06;
	Sun, 09 Feb 2025 18:58:22 +0000
Date: Mon, 10 Feb 2025 02:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-614rc 64/64] drivers/accel/amdxdna/aie2_pci.c:86:2:
 error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202502100212.lGFlatTb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-614rc
head:   ab4777a9442deebcd3923e57a728bc68db0a5125
commit: ab4777a9442deebcd3923e57a728bc68db0a5125 [64/64] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: x86_64-randconfig-008-20250209 (https://download.01.org/0day-ci/archive/20250210/202502100212.lGFlatTb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100212.lGFlatTb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100212.lGFlatTb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/amdxdna/aie2_pci.c:86:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      86 |         XDNA_DBG(xdna, "i2x tail    0x%x", ndev->mgmt_i2x.mb_tail_ptr_reg);
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/aie2_pci.c:266:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     266 |         XDNA_DBG(ndev->xdna, "Firmware suspended");
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/aie2_pci.c:496:46: warning: shift count >= width of type [-Wshift-count-overflow]
     496 |         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   drivers/accel/amdxdna/aie2_pci.c:860:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     860 |         XDNA_DBG(xdna, "Got param %d", args->param);
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/aie2_pci.c:879:6: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     879 |         if (XDNA_MBZ_DBG(xdna, power_state.pad, sizeof(power_state.pad)))
         |             ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:24:5: note: expanded from macro 'XDNA_MBZ_DBG'
      24 |                                 XDNA_DBG(xdna, "MBZ check failed");     \
         |                                 ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   1 warning and 4 errors generated.
--
>> drivers/accel/amdxdna/aie2_ctx.c:74:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      74 |                 XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
         |                 ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/aie2_ctx.c:86:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      86 |         XDNA_DBG(xdna, "%s restarted, ret %d", hwctx->name, ret);
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/aie2_ctx.c:103:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     103 |                 XDNA_DBG(xdna, "Resetting %s", hwctx->name);
         |                 ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/aie2_ctx.c:207:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |         XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/aie2_ctx.c:234:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     234 |         XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/aie2_ctx.c:261:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     261 |         XDNA_DBG(xdna, "Status 0x%x", resp->status);
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/aie2_ctx.c:407:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     407 |                 XDNA_DBG(xdna, "Force start from col 0");
         |                 ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
--
>> drivers/accel/amdxdna/amdxdna_ctx.c:157:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     157 |                 XDNA_DBG(client->xdna, "PID %d close HW context %d",
         |                 ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/amdxdna_ctx.c:223:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     223 |         XDNA_DBG(xdna, "PID %d create HW context %d, ret %d", client->pid, args->handle, ret);
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/amdxdna_ctx.c:246:6: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     246 |         if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
         |             ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:24:5: note: expanded from macro 'XDNA_MBZ_DBG'
      24 |                                 XDNA_DBG(xdna, "MBZ check failed");     \
         |                                 ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/amdxdna_ctx.c:255:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     255 |                 XDNA_DBG(xdna, "PID %d HW context %d not exist",
         |                 ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/amdxdna_ctx.c:266:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     266 |         XDNA_DBG(xdna, "PID %d destroyed HW context %d", client->pid, args->handle);
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/amdxdna_ctx.c:283:6: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     283 |         if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
         |             ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:24:5: note: expanded from macro 'XDNA_MBZ_DBG'
      24 |                                 XDNA_DBG(xdna, "MBZ check failed");     \
         |                                 ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/amdxdna_ctx.c:318:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     318 |                 XDNA_DBG(xdna, "Unknown HW context config type %d", args->param_type);
         |                 ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
--
>> drivers/accel/amdxdna/aie2_error.c:255:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     255 |         XDNA_DBG(xdna, "Error count %d return code %d", info->err_cnt, info->ret_code);
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/amdxdna/aie2_error.c:350:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     350 |         XDNA_DBG(xdna, "Async event count %d, buf total size 0x%x",
         |         ^
   drivers/accel/amdxdna/amdxdna_pci_drv.h:14:38: note: expanded from macro 'XDNA_DBG'
      14 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^
   include/drm/drm_print.h:654:32: note: expanded from macro 'drm_dbg'
     654 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:636:2: note: expanded from macro 'drm_dbg_driver'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:557:2: note: expanded from macro 'drm_dev_dbg'
     557 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   2 errors generated.
..


vim +/_dynamic_func_call_cls +86 drivers/accel/amdxdna/aie2_pci.c

b1dcfe620574b6 Lizhi Hou 2024-12-13  81  
b87f920b934426 Lizhi Hou 2024-11-18  82  static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
b87f920b934426 Lizhi Hou 2024-11-18  83  {
b87f920b934426 Lizhi Hou 2024-11-18  84  	struct amdxdna_dev *xdna = ndev->xdna;
b87f920b934426 Lizhi Hou 2024-11-18  85  
b87f920b934426 Lizhi Hou 2024-11-18 @86  	XDNA_DBG(xdna, "i2x tail    0x%x", ndev->mgmt_i2x.mb_tail_ptr_reg);
b87f920b934426 Lizhi Hou 2024-11-18  87  	XDNA_DBG(xdna, "i2x head    0x%x", ndev->mgmt_i2x.mb_head_ptr_reg);
b87f920b934426 Lizhi Hou 2024-11-18  88  	XDNA_DBG(xdna, "i2x ringbuf 0x%x", ndev->mgmt_i2x.rb_start_addr);
b87f920b934426 Lizhi Hou 2024-11-18  89  	XDNA_DBG(xdna, "i2x rsize   0x%x", ndev->mgmt_i2x.rb_size);
b87f920b934426 Lizhi Hou 2024-11-18  90  	XDNA_DBG(xdna, "x2i tail    0x%x", ndev->mgmt_x2i.mb_tail_ptr_reg);
b87f920b934426 Lizhi Hou 2024-11-18  91  	XDNA_DBG(xdna, "x2i head    0x%x", ndev->mgmt_x2i.mb_head_ptr_reg);
b87f920b934426 Lizhi Hou 2024-11-18  92  	XDNA_DBG(xdna, "x2i ringbuf 0x%x", ndev->mgmt_x2i.rb_start_addr);
b87f920b934426 Lizhi Hou 2024-11-18  93  	XDNA_DBG(xdna, "x2i rsize   0x%x", ndev->mgmt_x2i.rb_size);
b87f920b934426 Lizhi Hou 2024-11-18  94  	XDNA_DBG(xdna, "x2i chann index 0x%x", ndev->mgmt_chan_idx);
b1dcfe620574b6 Lizhi Hou 2024-12-13  95  	XDNA_DBG(xdna, "mailbox protocol major 0x%x", ndev->mgmt_prot_major);
b1dcfe620574b6 Lizhi Hou 2024-12-13  96  	XDNA_DBG(xdna, "mailbox protocol minor 0x%x", ndev->mgmt_prot_minor);
b87f920b934426 Lizhi Hou 2024-11-18  97  }
b87f920b934426 Lizhi Hou 2024-11-18  98  

:::::: The code at line 86 was first introduced by commit
:::::: b87f920b934426a24d54613f12ed67c03ae05024 accel/amdxdna: Support hardware mailbox

:::::: TO: Lizhi Hou <lizhi.hou@amd.com>
:::::: CC: Jeffrey Hugo <quic_jhugo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
