Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD70D533
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680818123; x=1712354123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AFbYkKTJndLFNymP4rV7cP6eBeZBYulhTZXHRvbZL1E=;
  b=kkuXYUQxyTofE0JpaNQUPPyhMaNo8KDRMmwBmYr0ke9EOacBb4+6WhGu
   VA4OWyvdUVNdvk1OHWv8tMpP39xPd9oierJNnd37QgJTgm3zDPB2AeIFl
   IK72HeZRYw/quaMiIoq+CVNis6Jv7l96inVVKaBKZSfqaeuOpTZb1ilQL
   w4zx8xEmoSiRNPAQLzWIJY/ckrZvVZyJauwWoAQeMVP2utOGKCGZviFcX
   Z7DuNVhqorLUKlGjLT2LiAfUPBE8tM5FM7/2JJsDni1DuhySvvgtXDZdc
   RAQVnOJ8AwRn1YcIn3SshQ3znFcvLaV88qy2CLYqf50gGY6m00JJijOds
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331489812"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="331489812"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 14:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719850027"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="719850027"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 14:48:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkXSn-000Rp8-2q;
	Thu, 06 Apr 2023 21:48:13 +0000
Date: Fri, 7 Apr 2023 05:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH v7 4/8] drm/i915/pxp: Add GSC-CS backend to
 send GSC fw messages
Message-ID: <202304070513.t2LuAqVF-lkp@intel.com>
References: <20230406174419.471256-5-alan.previn.teres.alexis@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406174419.471256-5-alan.previn.teres.alexis@intel.com>

Hi Alan,

kernel test robot noticed the following build errors:

[auto build test ERROR on fbadfcf137737f02425a35bf3ae17a1492301f21]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Previn/drm-i915-pxp-Add-GSC-CS-back-end-resource-init-and-cleanup/20230407-014557
base:   fbadfcf137737f02425a35bf3ae17a1492301f21
patch link:    https://lore.kernel.org/r/20230406174419.471256-5-alan.previn.teres.alexis%40intel.com
patch subject: [Intel-gfx] [PATCH v7 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230407/202304070513.t2LuAqVF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/509f190262b2c49355d7f033010467b82deaef2d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alan-Previn/drm-i915-pxp-Add-GSC-CS-back-end-resource-init-and-cleanup/20230407-014557
        git checkout 509f190262b2c49355d7f033010467b82deaef2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070513.t2LuAqVF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from arch/x86/include/asm/perf_event.h:5,
                    from include/linux/perf_event.h:25,
                    from drivers/gpu/drm/i915/i915_pmu.h:11,
                    from drivers/gpu/drm/i915/gt/intel_engine_types.h:21,
                    from drivers/gpu/drm/i915/gt/intel_context_types.h:18,
                    from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20,
                    from drivers/gpu/drm/i915/i915_request.h:34,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gt/intel_context.h:13,
                    from drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:8:
   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c: In function 'gsccs_send_message':
>> include/drm/drm_print.h:456:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |                                       ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/drm/drm_print.h:456:9: note: in expansion of macro 'dev_warn'
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:466:9: note: in expansion of macro '__drm_printk'
     466 |         __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:112:17: note: in expansion of macro 'drm_warn'
     112 |                 drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
         |                 ^~~~~~~~
   cc1: all warnings being treated as errors


vim +456 include/drm/drm_print.h

e820f52577b14c Jim Cromie            2022-09-11  416  
02c9656b2f0d69 Haneen Mohammed       2017-10-17  417  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  418   * DRM_DEV_DEBUG() - Debug output for generic drm code
02c9656b2f0d69 Haneen Mohammed       2017-10-17  419   *
306589856399e1 Douglas Anderson      2021-09-21  420   * NOTE: this is deprecated in favor of drm_dbg_core().
306589856399e1 Douglas Anderson      2021-09-21  421   *
091756bbb1a961 Haneen Mohammed       2017-10-17  422   * @dev: device pointer
091756bbb1a961 Haneen Mohammed       2017-10-17  423   * @fmt: printf() like format string.
02c9656b2f0d69 Haneen Mohammed       2017-10-17  424   */
db87086492581c Joe Perches           2018-03-16  425  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
db87086492581c Joe Perches           2018-03-16  426  	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  427  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  428   * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  429   *
306589856399e1 Douglas Anderson      2021-09-21  430   * NOTE: this is deprecated in favor of drm_dbg() or dev_dbg().
306589856399e1 Douglas Anderson      2021-09-21  431   *
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  432   * @dev: device pointer
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  433   * @fmt: printf() like format string.
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  434   */
db87086492581c Joe Perches           2018-03-16  435  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
db87086492581c Joe Perches           2018-03-16  436  	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  437  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  438   * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  439   *
306589856399e1 Douglas Anderson      2021-09-21  440   * NOTE: this is deprecated in favor of drm_dbg_kms().
306589856399e1 Douglas Anderson      2021-09-21  441   *
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  442   * @dev: device pointer
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  443   * @fmt: printf() like format string.
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  444   */
db87086492581c Joe Perches           2018-03-16  445  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
db87086492581c Joe Perches           2018-03-16  446  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
a18b21929453af Lyude Paul            2018-07-16  447  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  448  /*
fb6c7ab8718eb2 Jani Nikula           2019-12-10  449   * struct drm_device based logging
fb6c7ab8718eb2 Jani Nikula           2019-12-10  450   *
fb6c7ab8718eb2 Jani Nikula           2019-12-10  451   * Prefer drm_device based logging over device or prink based logging.
fb6c7ab8718eb2 Jani Nikula           2019-12-10  452   */
fb6c7ab8718eb2 Jani Nikula           2019-12-10  453  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  454  /* Helper for struct drm_device based logging. */
fb6c7ab8718eb2 Jani Nikula           2019-12-10  455  #define __drm_printk(drm, level, type, fmt, ...)			\
fb6c7ab8718eb2 Jani Nikula           2019-12-10 @456  	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
fb6c7ab8718eb2 Jani Nikula           2019-12-10  457  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  458  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
