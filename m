Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948914387E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711719116; cv=none; b=Jbj7B+okl2dPzcarz9Q/3liBd4yeNvYqvsUa2lYcD8V9/drOJ8nSsrK5vxxJnLraGadzYPwVgKUfxyn7bXPPUj/goI/ig2c+qNKXZ4lWjLPA+QtGM7sMUilrukLJWYWmynAqO+DtfIEpPDyCnQIw22Ht2SQ+ArY+NeVRYfU0+0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711719116; c=relaxed/simple;
	bh=Xaez6yQeQac2NP8yCMeNuVN3Aji3F7qHpPaZpdK8iYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFdFALilzff3yBlvjAsppJTSCtc6J+wS3IdJhrJa61cv4Q7/fmqJpCTyYCJHtqKg9bv3SkDuJFncA+sK8McIUc0hXZe+H7Qgf7fOpbRBTwh8Sae25wKGNbSRAwjSnuUi2cjYQb7EyLwQ4KzHb6MlX2Z7LCQSgzvYCqSmJqN42E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEQRlDsc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEQRlDsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711719114; x=1743255114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xaez6yQeQac2NP8yCMeNuVN3Aji3F7qHpPaZpdK8iYc=;
  b=OEQRlDscyBTffUzSj/XR4/KWpvZhtNpkvTI80c4TyTpKqTVBLNS5CBn9
   awZVXk6O3mv3133UcNKoDCURKIn5ZK23B7O3sJb5sIu2kA/W/WpqQtysF
   1pUnrDDLKZ7Fb3/yGZzWwX3KIwZLvmM/q5WywYeQ0Mz6NgyLywL5dkuQh
   O577Oes7Tk7DTyxfYGINAu45YoMrSZ/LnMMa1kNGwmaehzn/cuLJHRzJu
   Ums5E5+DFXocw6qj0Zfypz68SxMor+6fv41rANpCRvExxJq5/4HhBezQc
   AcHrkMSePXSsveiFkqE7KajM57Blz2n57FBLE67dUx5LJfB1RpwUju1r/
   Q==;
X-CSE-ConnectionGUID: wqifhoMeRNaMeUvk4hP8Ig==
X-CSE-MsgGUID: 9qTeSdVrTNaCPU0Ul1MiZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17533420"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="17533420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 06:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="17020589"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Mar 2024 06:31:50 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqCKi-0003Dm-2L;
	Fri, 29 Mar 2024 13:31:48 +0000
Date: Fri, 29 Mar 2024 21:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-classmap-add-trace 20/64]
 include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
Message-ID: <202403292121.J65vrdhF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-classmap-add-trace
head:   3341029059d1eb4ef9a6b48d5c2075e3f694daaf
commit: 198c1990e09a81474b7bad0e664cac4c18afa1d7 [20/64] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403292121.J65vrdhF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403292121.J65vrdhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403292121.J65vrdhF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from include/drm/ttm/ttm_tt.h:30,
                    from drivers/gpu/drm/xe/xe_bo.h:9,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_gem_create_ioctl':
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1888:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1888 |         if (XE_IOCTL_DBG(xe, args->extensions) ||
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1889:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1889 |             XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1890:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1890 |             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1894:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1894 |         if (XE_IOCTL_DBG(xe, (args->placement & ~xe->info.mem_region_mask) ||
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1898:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1898 |         if (XE_IOCTL_DBG(xe, args->flags &
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1904:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1904 |         if (XE_IOCTL_DBG(xe, args->handle))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1907:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1907 |         if (XE_IOCTL_DBG(xe, !args->size))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1910:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1910 |         if (XE_IOCTL_DBG(xe, args->size > SIZE_MAX))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1913:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1913 |         if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1926:21: note: in expansion of macro 'XE_IOCTL_DBG'
    1926 |                 if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
         |                     ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1932:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1932 |         if (XE_IOCTL_DBG(xe, !args->cpu_caching ||
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1936:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1936 |         if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_CREATE_VRAM_MASK &&
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1940:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1940 |         if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_SCANOUT_BIT &&
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1946:21: note: in expansion of macro 'XE_IOCTL_DBG'
    1946 |                 if (XE_IOCTL_DBG(xe, !vm))
         |                     ^~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_gem_mmap_offset_ioctl':
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1993:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1993 |         if (XE_IOCTL_DBG(xe, args->extensions) ||
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1994:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1994 |             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:1997:13: note: in expansion of macro 'XE_IOCTL_DBG'
    1997 |         if (XE_IOCTL_DBG(xe, args->flags))
         |             ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:271:58: error: expected expression before 'do'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^~
   include/linux/dynamic_debug.h:298:9: note: in expansion of macro '__dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:423:9: note: in expansion of macro '_dynamic_func_call_cls'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro 'drm_dbg'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:2001:13: note: in expansion of macro 'XE_IOCTL_DBG'
    2001 |         if (XE_IOCTL_DBG(xe, !gem_obj))
         |             ^~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_bo.c:1989:27: warning: unused variable 'xe' [-Wunused-variable]
    1989 |         struct xe_device *xe = to_xe_device(dev);
         |                           ^~
..


vim +/do +271 include/linux/dynamic_debug.h

9049fc745300c5e Jason Baron      2016-08-03  259  
ca90fca7f7b5183 Jim Cromie       2022-09-04  260  /*
ca90fca7f7b5183 Jim Cromie       2022-09-04  261   * Factory macros: ($prefix)dynamic_func_call($suffix)
ca90fca7f7b5183 Jim Cromie       2022-09-04  262   *
ca90fca7f7b5183 Jim Cromie       2022-09-04  263   * Lower layer (with __ prefix) gets the callsite metadata, and wraps
ca90fca7f7b5183 Jim Cromie       2022-09-04  264   * the func inside a debug-branch/static-key construct.  Upper layer
ca90fca7f7b5183 Jim Cromie       2022-09-04  265   * (with _ prefix) does the UNIQUE_ID once, so that lower can ref the
ca90fca7f7b5183 Jim Cromie       2022-09-04  266   * name/label multiple times, and tie the elements together.
ca90fca7f7b5183 Jim Cromie       2022-09-04  267   * Multiple flavors:
ca90fca7f7b5183 Jim Cromie       2022-09-04  268   * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
ca90fca7f7b5183 Jim Cromie       2022-09-04  269   * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
ca90fca7f7b5183 Jim Cromie       2022-09-04  270   */
ca90fca7f7b5183 Jim Cromie       2022-09-04 @271  #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
ca90fca7f7b5183 Jim Cromie       2022-09-04  272  	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
47cdd64be4832ff Rasmus Villemoes 2019-03-07  273  	if (DYNAMIC_DEBUG_BRANCH(id))				\
47cdd64be4832ff Rasmus Villemoes 2019-03-07  274  		func(&id, ##__VA_ARGS__);			\
e9d376f0fa66bd6 Jason Baron      2009-02-05  275  } while (0)
ca90fca7f7b5183 Jim Cromie       2022-09-04  276  #define __dynamic_func_call(id, fmt, func, ...)				\
ca90fca7f7b5183 Jim Cromie       2022-09-04  277  	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
ca90fca7f7b5183 Jim Cromie       2022-09-04  278  				func, ##__VA_ARGS__)
e9d376f0fa66bd6 Jason Baron      2009-02-05  279  

:::::: The code at line 271 was first introduced by commit
:::::: ca90fca7f7b51830dfb95bf655210a1c84588f15 dyndbg: add class_id to pr_debug callsites

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
