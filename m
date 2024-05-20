Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EB91DFCB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716231555; cv=none; b=nJat2m8cIdc9maJnfEOLixxJxU7oSA7W217DxYUEz6x5Frg88ZXpad/Q7oP/L4amc6bP0HvZ5guWt62FmiwrV73XpsmOaV2BRCceBUw+d0jkgnEdwK9/heU6Res8OFqaRljo4P4y2u3Y3r8vYVFzM8v6XHHEuhdFPyeGBpY1hj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716231555; c=relaxed/simple;
	bh=Kmz5XQAT2qdgQ+syTyFqCWIlKy9/aSugt+iaBEBAOQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YqxZ0Es6RR0yaRQtwjwkoOeWGzKcpFgtkxa87YuawvyIuc9dSlFXb7QpptwDfwUb8majj9dVA7MIbG+n60uMvjLTHRfap3duiRffXNt5IerPmPcsPQl4yVmlBH2ePK0ZbSHtWLAoZLHDzKb/XS/tXZU+iGPSQ3WUO+kht4Du+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfAnvxJk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfAnvxJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716231554; x=1747767554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kmz5XQAT2qdgQ+syTyFqCWIlKy9/aSugt+iaBEBAOQI=;
  b=jfAnvxJk9GphQ3o3fgmhSiwZ4qzi7ZL4q/r0cvOqSQyUk6uvlUuOTZKS
   X5tlaTwCF5RbNyW/juP6ExV8KvNgLr25BQBgSdULQS9/XgqoBD+YmqMx7
   wLgUXf6vAJQiM5Y3vJS39CHZiW4dvs/r4rXCLJtkyCOcNy9oHkbtm8vtM
   xy7Pl3xV2wnwBDtM725omkYQFh5FXuc1esblCxeTev5pKQpxwwLXAO6/S
   OHv2drZykylKIFIMBW+sE6yzWpYQ9klMXEBM+lw+PRhGldwAvnLQxhWGD
   ZhC7PHt/F4HBjBhpZHaCSMVFvpkiui/VGdMhvop317RFCxWau/11cIHnC
   Q==;
X-CSE-ConnectionGUID: 1rvVl4RbS2me14w/4kjnFw==
X-CSE-MsgGUID: jvtb4ldbQ4m7BXHyXSwGzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12492719"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="12492719"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 11:59:13 -0700
X-CSE-ConnectionGUID: ongKv24SQFm7iMYzxkwyvA==
X-CSE-MsgGUID: VSCW5900Tea8WeBGExJ8RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="32624781"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2024 11:59:11 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s98E0-000550-2W;
	Mon, 20 May 2024 18:59:08 +0000
Date: Tue, 21 May 2024 02:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-8c 32/34]
 include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
Message-ID: <202405210209.SEziB4nB-lkp@intel.com>
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
config: mips-randconfig-r133-20240520 (https://download.01.org/0day-ci/archive/20240521/202405210209.SEziB4nB-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240521/202405210209.SEziB4nB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210209.SEziB4nB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from include/drm/ttm/ttm_tt.h:30,
                    from drivers/gpu/drm/xe/xe_bo.h:9,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_gem_create_ioctl':
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1916:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1916 |         if (XE_IOCTL_DBG(xe, args->extensions) ||
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1917:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1917 |             XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1918:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1918 |             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1922:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1922 |         if (XE_IOCTL_DBG(xe, (args->placement & ~xe->info.mem_region_mask) ||
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1926:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1926 |         if (XE_IOCTL_DBG(xe, args->flags &
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1932:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1932 |         if (XE_IOCTL_DBG(xe, args->handle))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1935:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1935 |         if (XE_IOCTL_DBG(xe, !args->size))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1938:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1938 |         if (XE_IOCTL_DBG(xe, args->size > SIZE_MAX))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1941:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1941 |         if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1954:21: note: in expansion of macro 'XE_IOCTL_DBG'
    1954 |                 if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
         |                     ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1960:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1960 |         if (XE_IOCTL_DBG(xe, !args->cpu_caching ||
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1964:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1964 |         if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_CREATE_VRAM_MASK &&
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1968:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1968 |         if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_SCANOUT_BIT &&
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1974:21: note: in expansion of macro 'XE_IOCTL_DBG'
    1974 |                 if (XE_IOCTL_DBG(xe, !vm))
         |                     ^~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_gem_mmap_offset_ioctl':
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:2021:13: note: in expansion of macro 'XE_IOCTL_DBG'
    2021 |         if (XE_IOCTL_DBG(xe, args->extensions) ||
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:2022:13: note: in expansion of macro 'XE_IOCTL_DBG'
    2022 |             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:2025:13: note: in expansion of macro 'XE_IOCTL_DBG'
    2025 |         if (XE_IOCTL_DBG(xe, args->flags))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:290:58: error: expected expression before 'do'
     290 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:317:9: note: in expansion of macro '__dynamic_func_call_cls'
     317 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:435:9: note: in expansion of macro '_dynamic_func_call_cls'
     435 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:514:9: note: in expansion of macro 'drm_dev_dbg'
     514 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:532:33: note: in expansion of macro 'drm_dbg_driver'
     532 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:2029:13: note: in expansion of macro 'XE_IOCTL_DBG'
    2029 |         if (XE_IOCTL_DBG(xe, !gem_obj))
         |             ^~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:2017:27: warning: unused variable 'xe' [-Wunused-variable]
    2017 |         struct xe_device *xe = to_xe_device(dev);
         |                           ^~
..


vim +/do +290 include/linux/dynamic_debug.h

9049fc745300c5 Jason Baron      2016-08-03  278  
ca90fca7f7b518 Jim Cromie       2022-09-04  279  /*
ca90fca7f7b518 Jim Cromie       2022-09-04  280   * Factory macros: ($prefix)dynamic_func_call($suffix)
ca90fca7f7b518 Jim Cromie       2022-09-04  281   *
ca90fca7f7b518 Jim Cromie       2022-09-04  282   * Lower layer (with __ prefix) gets the callsite metadata, and wraps
ca90fca7f7b518 Jim Cromie       2022-09-04  283   * the func inside a debug-branch/static-key construct.  Upper layer
ca90fca7f7b518 Jim Cromie       2022-09-04  284   * (with _ prefix) does the UNIQUE_ID once, so that lower can ref the
ca90fca7f7b518 Jim Cromie       2022-09-04  285   * name/label multiple times, and tie the elements together.
ca90fca7f7b518 Jim Cromie       2022-09-04  286   * Multiple flavors:
ca90fca7f7b518 Jim Cromie       2022-09-04  287   * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
ca90fca7f7b518 Jim Cromie       2022-09-04  288   * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
ca90fca7f7b518 Jim Cromie       2022-09-04  289   */
ca90fca7f7b518 Jim Cromie       2022-09-04 @290  #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
ca90fca7f7b518 Jim Cromie       2022-09-04  291  	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
47cdd64be4832f Rasmus Villemoes 2019-03-07  292  	if (DYNAMIC_DEBUG_BRANCH(id))				\
47cdd64be4832f Rasmus Villemoes 2019-03-07  293  		func(&id, ##__VA_ARGS__);			\
e9d376f0fa66bd Jason Baron      2009-02-05  294  } while (0)
ca90fca7f7b518 Jim Cromie       2022-09-04  295  #define __dynamic_func_call(id, fmt, func, ...)				\
ca90fca7f7b518 Jim Cromie       2022-09-04  296  	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
ca90fca7f7b518 Jim Cromie       2022-09-04  297  				func, ##__VA_ARGS__)
e9d376f0fa66bd Jason Baron      2009-02-05  298  

:::::: The code at line 290 was first introduced by commit
:::::: ca90fca7f7b51830dfb95bf655210a1c84588f15 dyndbg: add class_id to pr_debug callsites

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
