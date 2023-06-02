Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203EF1B909
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 16:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685722004; x=1717258004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GD3L6M8H4ZyddpwHPTKmW1FH51PsvJoUJvG0Kw5dob8=;
  b=hNdY2Y7YQt2eWViYikmt8XncT9OR7fJrWZRYcAxp6n1evdBdow2VMJU6
   OjJWqtsEih8wG+G9Xy54MaV1892B7lhhgov7GFBpYmfvwnzvR4461nVex
   FaWOCtq3CSFAtBe8/nR2E/b1N124ySf7yBaFpFw8frv7jMJjd4+C+Dk93
   Wk4iIGMYNLjEYKrxibHMnOKKoJXEsBBFVUphTEjCf7FR97MOiVRn/0y/m
   uRMA17SirKsnaxualU6GfHDAAaX3581Q061i/+X/MtTR52mouur+6Iwca
   A/DsGZUWD5CdE6PyjnWxxUwuGmhMh1mgA5Ik0o6Pce1LiEgsX9Do93hC5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="340534041"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="340534041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 09:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="740872758"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="740872758"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Jun 2023 09:06:42 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q57IX-0000ek-1m;
	Fri, 02 Jun 2023 16:06:41 +0000
Date: Sat, 3 Jun 2023 00:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 8/59] include/drm/drm_print.h:536:39: error:
 format '%ld' expects argument of type 'long int', but argument 4 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202306022310.HrWmSlgT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   e10d2beaa25f29bbe6ad179eb8f568189ca8eab3
commit: db82fd1a37fff1a5c64ac9e3ecbda2787a00810a [8/59] FROMGIT: drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306022310.HrWmSlgT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout db82fd1a37fff1a5c64ac9e3ecbda2787a00810a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306022310.HrWmSlgT-lkp@intel.com/

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
>> include/drm/drm_print.h:536:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
     536 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |                                       ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/drm/drm_print.h:536:9: note: in expansion of macro 'dev_warn'
     536 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:546:9: note: in expansion of macro '__drm_printk'
     546 |         __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:112:17: note: in expansion of macro 'drm_warn'
     112 |                 drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
         |                 ^~~~~~~~
   cc1: all warnings being treated as errors


vim +536 include/drm/drm_print.h

e820f52577b14c6 Jim Cromie            2022-09-11  496  
02c9656b2f0d699 Haneen Mohammed       2017-10-17  497  /**
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  498   * DRM_DEV_DEBUG() - Debug output for generic drm code
02c9656b2f0d699 Haneen Mohammed       2017-10-17  499   *
306589856399e18 Douglas Anderson      2021-09-21  500   * NOTE: this is deprecated in favor of drm_dbg_core().
306589856399e18 Douglas Anderson      2021-09-21  501   *
091756bbb1a9613 Haneen Mohammed       2017-10-17  502   * @dev: device pointer
091756bbb1a9613 Haneen Mohammed       2017-10-17  503   * @fmt: printf() like format string.
02c9656b2f0d699 Haneen Mohammed       2017-10-17  504   */
db87086492581c8 Joe Perches           2018-03-16  505  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
db87086492581c8 Joe Perches           2018-03-16  506  	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  507  /**
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  508   * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  509   *
306589856399e18 Douglas Anderson      2021-09-21  510   * NOTE: this is deprecated in favor of drm_dbg() or dev_dbg().
306589856399e18 Douglas Anderson      2021-09-21  511   *
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  512   * @dev: device pointer
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  513   * @fmt: printf() like format string.
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  514   */
db87086492581c8 Joe Perches           2018-03-16  515  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
db87086492581c8 Joe Perches           2018-03-16  516  	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  517  /**
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  518   * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  519   *
306589856399e18 Douglas Anderson      2021-09-21  520   * NOTE: this is deprecated in favor of drm_dbg_kms().
306589856399e18 Douglas Anderson      2021-09-21  521   *
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  522   * @dev: device pointer
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  523   * @fmt: printf() like format string.
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  524   */
db87086492581c8 Joe Perches           2018-03-16  525  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
db87086492581c8 Joe Perches           2018-03-16  526  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
a18b21929453af7 Lyude Paul            2018-07-16  527  
fb6c7ab8718eb25 Jani Nikula           2019-12-10  528  /*
fb6c7ab8718eb25 Jani Nikula           2019-12-10  529   * struct drm_device based logging
fb6c7ab8718eb25 Jani Nikula           2019-12-10  530   *
fb6c7ab8718eb25 Jani Nikula           2019-12-10  531   * Prefer drm_device based logging over device or prink based logging.
fb6c7ab8718eb25 Jani Nikula           2019-12-10  532   */
fb6c7ab8718eb25 Jani Nikula           2019-12-10  533  
fb6c7ab8718eb25 Jani Nikula           2019-12-10  534  /* Helper for struct drm_device based logging. */
fb6c7ab8718eb25 Jani Nikula           2019-12-10  535  #define __drm_printk(drm, level, type, fmt, ...)			\
fb6c7ab8718eb25 Jani Nikula           2019-12-10 @536  	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
fb6c7ab8718eb25 Jani Nikula           2019-12-10  537  
fb6c7ab8718eb25 Jani Nikula           2019-12-10  538  

:::::: The code at line 536 was first introduced by commit
:::::: fb6c7ab8718eb2543695d77ad8302ff81e8e1e32 drm/print: introduce new struct drm_device based logging macros

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
