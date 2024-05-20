Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C271C13956D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 22:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716242999; cv=none; b=dzvYMC7ZqdurYEujOymB+DZ2sUo3Nu/k7lLmzpGmMj5Y/b2U8g7ewV7LiRI0+gwLdHlF0gzvnGoeTpjIOGHTKmr4+UNYs8wuklcKv2TlDPbE//2qWLw1b4iEQFtAM0SIh/n/qNB3tS4Ip7024VzMn0GpuoVVFMUiDLUMHhes7uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716242999; c=relaxed/simple;
	bh=u17HWAbfa9ptBYxJPoCHrUNpIdJdtFRrJikzEmspCPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9Y29Fa3mZtqqh5hsA78K5NJV6hk9NtGxjpt0ti+jUDdnu9eQ5PHqGtU6UvPfx2wBnrdF7EQ3A/HVg9Zq7UjRixkdrVbgS/0jwiVCKQjdgm+Bciwjwby/tDAvowjH4rIDEMo+akCnhfD+H4WZwMCCno5qq7Nch4mQBDrTagWY6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcHDKbUj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcHDKbUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716242998; x=1747778998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u17HWAbfa9ptBYxJPoCHrUNpIdJdtFRrJikzEmspCPI=;
  b=mcHDKbUjLdDAKTyqxUCJHwE5XTGLPsCfBmcL/XiPHhH62esCWO3qPbgC
   ffXZFoS74z4o2eTDnvdLzn1YkrOsL1GtwbTgtZvm0OTfL1EFcRWzgPZ6/
   WO6GYN8vW64m9ddmLM4vPp9U24KdROcumLX5h+Lw85xGGHS1BO3bNXi9u
   O4ulwHVBgom5L7nPIABucMc8XBwMxfUgSupyhYKTn7DN87IouSkI0WGcy
   yeR8NjW7MHr5RftRHWbkpBZ9tqpbiyK+zmr81SaWiuyeeylHkojcAR+Pp
   BgyYY2CMHiRfur4YF4iumkO8sYyJXfIb6x1LtaOp/IBKYcDRrRRqNjr4q
   Q==;
X-CSE-ConnectionGUID: eliXTyF+Qa64C52lsto0Yg==
X-CSE-MsgGUID: idWuXonpTImmqiwr0YoYHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12577640"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12577640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 15:09:58 -0700
X-CSE-ConnectionGUID: N9PpyIvHQ2ywVoN8rg0CpQ==
X-CSE-MsgGUID: hBFMbqQBT4utr/QnMZr3mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37061742"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2024 15:09:56 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9BAs-0005C2-28;
	Mon, 20 May 2024 22:09:13 +0000
Date: Tue, 21 May 2024 06:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-8c 32/34]
 drivers/gpu/drm/xe/display/intel_fb_bo.c:43:7: error: expected expression
Message-ID: <202405210648.p6TPeHNf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-8c
head:   19c77819e39e4e7e74eef7f78bea70e004c6724c
commit: 51b0efcbcf9a4cfe4bdd5033286e703ed1d74b87 [32/34] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240521/202405210648.p6TPeHNf-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405210648.p6TPeHNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210648.p6TPeHNf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/display/intel_fb_bo.c:8:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/display/intel_fb_bo.c:43:7: error: expected expression
      43 |                 if (XE_IOCTL_DBG(i915, !list_empty(&bo->ttm.base.gpuva.list))) {
         |                     ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:532:32: note: expanded from macro 'drm_dbg'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:514:2: note: expanded from macro 'drm_dbg_driver'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:435:2: note: expanded from macro 'drm_dev_dbg'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:317:2: note: expanded from macro '_dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:290:58: note: expanded from macro '__dynamic_func_call_cls'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^
   5 warnings and 1 error generated.


vim +43 drivers/gpu/drm/xe/display/intel_fb_bo.c

44e694958b95395 Maarten Lankhorst 2023-08-17  22  
44e694958b95395 Maarten Lankhorst 2023-08-17  23  int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
44e694958b95395 Maarten Lankhorst 2023-08-17  24  				 struct xe_bo *bo,
44e694958b95395 Maarten Lankhorst 2023-08-17  25  				 struct drm_mode_fb_cmd2 *mode_cmd)
44e694958b95395 Maarten Lankhorst 2023-08-17  26  {
44e694958b95395 Maarten Lankhorst 2023-08-17  27  	struct drm_i915_private *i915 = to_i915(bo->ttm.base.dev);
44e694958b95395 Maarten Lankhorst 2023-08-17  28  	int ret;
44e694958b95395 Maarten Lankhorst 2023-08-17  29  
44e694958b95395 Maarten Lankhorst 2023-08-17  30  	xe_bo_get(bo);
44e694958b95395 Maarten Lankhorst 2023-08-17  31  
44e694958b95395 Maarten Lankhorst 2023-08-17  32  	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
44e694958b95395 Maarten Lankhorst 2023-08-17  33  	if (ret)
652ead9b746a63e Maarten Lankhorst 2024-04-04  34  		goto err;
44e694958b95395 Maarten Lankhorst 2023-08-17  35  
44e694958b95395 Maarten Lankhorst 2023-08-17  36  	if (!(bo->flags & XE_BO_SCANOUT_BIT)) {
44e694958b95395 Maarten Lankhorst 2023-08-17  37  		/*
44e694958b95395 Maarten Lankhorst 2023-08-17  38  		 * XE_BO_SCANOUT_BIT should ideally be set at creation, or is
44e694958b95395 Maarten Lankhorst 2023-08-17  39  		 * automatically set when creating FB. We cannot change caching
44e694958b95395 Maarten Lankhorst 2023-08-17  40  		 * mode when the boect is VM_BINDed, so we can only set
44e694958b95395 Maarten Lankhorst 2023-08-17  41  		 * coherency with display when unbound.
44e694958b95395 Maarten Lankhorst 2023-08-17  42  		 */
44e694958b95395 Maarten Lankhorst 2023-08-17 @43  		if (XE_IOCTL_DBG(i915, !list_empty(&bo->ttm.base.gpuva.list))) {
44e694958b95395 Maarten Lankhorst 2023-08-17  44  			ttm_bo_unreserve(&bo->ttm);
652ead9b746a63e Maarten Lankhorst 2024-04-04  45  			ret = -EINVAL;
652ead9b746a63e Maarten Lankhorst 2024-04-04  46  			goto err;
44e694958b95395 Maarten Lankhorst 2023-08-17  47  		}
44e694958b95395 Maarten Lankhorst 2023-08-17  48  		bo->flags |= XE_BO_SCANOUT_BIT;
44e694958b95395 Maarten Lankhorst 2023-08-17  49  	}
44e694958b95395 Maarten Lankhorst 2023-08-17  50  	ttm_bo_unreserve(&bo->ttm);
652ead9b746a63e Maarten Lankhorst 2024-04-04  51  	return 0;
44e694958b95395 Maarten Lankhorst 2023-08-17  52  
652ead9b746a63e Maarten Lankhorst 2024-04-04  53  err:
652ead9b746a63e Maarten Lankhorst 2024-04-04  54  	xe_bo_put(bo);
44e694958b95395 Maarten Lankhorst 2023-08-17  55  	return ret;
44e694958b95395 Maarten Lankhorst 2023-08-17  56  }
44e694958b95395 Maarten Lankhorst 2023-08-17  57  

:::::: The code at line 43 was first introduced by commit
:::::: 44e694958b95395bd1c41508c88c8ca141bf9bd7 drm/xe/display: Implement display support

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
