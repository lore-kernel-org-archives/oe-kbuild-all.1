Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEFF2E7BC9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 22:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765232537; cv=none; b=PzfI4FFbu27zP4bvoYpiIYWa9f5OIRo0+4bYuxIRlAr3oAB3fQZw932tBdVIKaMfbqAeQRl8WJBU8d72UPyQ/34e2osukw4bBqTJXt6s/yHZL0wF1Mg9STJPDvcaA5n7xSKkYwm+ty4aNa6+OX33n4+Y0Oc4hubiuPix0hLnP6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765232537; c=relaxed/simple;
	bh=tgB3OkFFdIJH5A8yzS/OltbvKtxrV2y0WS0Cg1d/LAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktKOwtxzlecKDS0GmVTQElZCJJ0g86SXHmmTT4J91ilsdZlW+247uzxE21+ClPBp8TZwSAJ/MbUmnitP7gK4ekZLqqNj7ksiJOiXs2Q0sn90cvGzG7SNbRSc0O2BcK5piyT43+GVLDRwpAt0VYQWTXBjDL86ZhUBcQUpJvs3lyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPDHTnQK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPDHTnQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765232535; x=1796768535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tgB3OkFFdIJH5A8yzS/OltbvKtxrV2y0WS0Cg1d/LAY=;
  b=aPDHTnQKHJaX53UI5gzTuRgPr7ol7wOmHK2W9nLixlsxsqlCR9G8D0TV
   FRGwXIQ3AilwUP3RqVWIp9tmkL/xr2QdTLmRkefJ8+IGQvtISL1b6Oxb4
   nMsyhh9ZkKL/oFnJM+EJPA0cudb/Cfhef9Y1SZ5f1SWCuyOTP2Qd/7rli
   sHvd00Fi12YAqnjKWVXNttDwi3peTCzBEUXqn7s/sW7g0O7EDG5/8BnTW
   aUChooAx8xPvbUt0rkGmMjUaCtWOLjcS7aYNO9ZdKQLqLgh7xYXUN/Q3F
   uI34Kx6JdopMQF8h/yOpvldp/xzuiSTFb/2xNb7hleVa6fbCDGBkD83zc
   g==;
X-CSE-ConnectionGUID: ToYTYDv2QT2FCF5E4vPbaQ==
X-CSE-MsgGUID: x4TFwGEvS6+IxA9buC1Jpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77801748"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="77801748"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 14:22:14 -0800
X-CSE-ConnectionGUID: tbbK7wfCSrGs3ili++mRSA==
X-CSE-MsgGUID: R0oyUwV4QcKYUk1PQiqdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="196516542"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Dec 2025 14:22:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSjcP-000000000v3-3miQ;
	Mon, 08 Dec 2025 22:22:09 +0000
Date: Tue, 9 Dec 2025 06:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/19] video/vga: Add VGA_IS0_R
Message-ID: <202512090603.ycfxEuHJ-lkp@intel.com>
References: <20251208182637.334-15-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208182637.334-15-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.18 next-20251208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-vga-Register-vgaarb-client-later/20251209-030730
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20251208182637.334-15-ville.syrjala%40linux.intel.com
patch subject: [PATCH 14/19] video/vga: Add VGA_IS0_R
config: i386-randconfig-141-20251209 (https://download.01.org/0day-ci/archive/20251209/202512090603.ycfxEuHJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090603.ycfxEuHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090603.ycfxEuHJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tiny/bochs.c:29:
   include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
     489 | ?
         | ^
   In file included from include/linux/module.h:23,
                    from drivers/gpu/drm/tiny/bochs.c:5:
   drivers/gpu/drm/tiny/bochs.c: In function '__check_modeset':
   drivers/gpu/drm/tiny/bochs.c:66:29: error: 'bochs_modeset' undeclared (first use in this function)
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         |                             ^~~~~~~~~~~~~
   include/linux/moduleparam.h:430:75: note: in definition of macro '__param_check'
     430 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                                                           ^
   include/linux/moduleparam.h:155:9: note: in expansion of macro 'param_check_int'
     155 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:1: note: in expansion of macro 'module_param_named'
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:29: note: each undeclared identifier is reported only once for each function it appears in
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         |                             ^~~~~~~~~~~~~
   include/linux/moduleparam.h:430:75: note: in definition of macro '__param_check'
     430 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                                                           ^
   include/linux/moduleparam.h:155:9: note: in expansion of macro 'param_check_int'
     155 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:1: note: in expansion of macro 'module_param_named'
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c: At top level:
   drivers/gpu/drm/tiny/bochs.c:66:29: error: 'bochs_modeset' undeclared here (not in a function)
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         |                             ^~~~~~~~~~~~~
   include/linux/moduleparam.h:298:61: note: in definition of macro '__module_param_call'
     298 |             VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
         |                                                             ^~~
   include/linux/moduleparam.h:156:9: note: in expansion of macro 'module_param_cb'
     156 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:1: note: in expansion of macro 'module_param_named'
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:32,
                    from include/linux/pci.h:37,
                    from drivers/gpu/drm/tiny/bochs.c:6:
   drivers/gpu/drm/tiny/bochs.c: In function 'bochs_pci_driver_init':
>> include/linux/device/driver.h:261:1: warning: control reaches end of non-void function [-Wreturn-type]
     261 | } \
         | ^
   include/drm/drm_module.h:93:9: note: in expansion of macro 'module_driver'
      93 |         module_driver(__pci_drv, drm_pci_register_driver_if_modeset, \
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:835:1: note: in expansion of macro 'drm_module_pci_driver_if_modeset'
     835 | drm_module_pci_driver_if_modeset(bochs_pci_driver, bochs_modeset);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +261 include/linux/device/driver.h

4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  242  
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  243  /**
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  244   * module_driver() - Helper macro for drivers that don't do anything
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  245   * special in module init/exit. This eliminates a lot of boilerplate.
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  246   * Each module may only use this macro once, and calling it replaces
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  247   * module_init() and module_exit().
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  248   *
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  249   * @__driver: driver name
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  250   * @__register: register function for this driver type
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  251   * @__unregister: unregister function for this driver type
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  252   * @...: Additional arguments to be passed to __register and __unregister.
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  253   *
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  254   * Use this macro to construct bus specific macros for registering
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  255   * drivers, and do not use it on its own.
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  256   */
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  257  #define module_driver(__driver, __register, __unregister, ...) \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  258  static int __init __driver##_init(void) \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  259  { \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  260  	return __register(&(__driver) , ##__VA_ARGS__); \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09 @261  } \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  262  module_init(__driver##_init); \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  263  static void __exit __driver##_exit(void) \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  264  { \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  265  	__unregister(&(__driver) , ##__VA_ARGS__); \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  266  } \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  267  module_exit(__driver##_exit);
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  268  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
