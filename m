Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D36816
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 00:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678581488; x=1710117488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=omtfREivJBaCatG/iBTOVz+sSLtN1SpXS1wwPmIp1M4=;
  b=GA1TJ8L6IHlQw49MTdxK9Ea6nhdwUazL/MLNmtD0OJUyXQklqQSaYOUU
   aGaqUhizW2RLV7Pi6EaAfqNdBpd4PG4mg/dF4In8scKM0AJc9QcMh0UA8
   lByYVG1jqmtJk/KcA2gDP+7rPfJ460dUcwGEVOuHA1Lil1wXiKLAtD60B
   dMb4Rjieh8kA2urSoShYk0RhGECFLGDcUv/f4vuj0ZQHperYQR4OtnSh/
   VY2vHIUGUVTxbPnRzpfJtKMwc9IhcGWpWKoNMu1V1wfCK0rpX13+eOgvk
   9b6fb705sKpVPz90et5myIkfrxiUo5x5qd2602nqzK5TWJFvNQFz7flZV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="339319467"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="339319467"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 16:38:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="710696345"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="710696345"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Mar 2023 16:38:06 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb9iv-0004sb-2y;
	Sun, 12 Mar 2023 00:38:05 +0000
Date: Sun, 12 Mar 2023 08:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:dpt_debug 4/4] include/drm/drm_print.h:456:39: error:
 format '%llx' expects argument of type 'long long unsigned int', but
 argument 5 has type 'unsigned int'
Message-ID: <202303120817.CEIR9cai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/vsyrjala/linux.git dpt_debug
head:   93b6968da31ee411cedc83b08b625e06525ca566
commit: 93b6968da31ee411cedc83b08b625e06525ca566 [4/4] dpt debug
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230312/202303120817.CEIR9cai-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/vsyrjala/linux/commit/93b6968da31ee411cedc83b08b625e06525ca566
        git remote add vsyrjala https://github.com/vsyrjala/linux.git
        git fetch --no-tags vsyrjala dpt_debug
        git checkout 93b6968da31ee411cedc83b08b625e06525ca566
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120817.CEIR9cai-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from drivers/gpu/drm/i915/i915_drv.h:35,
                    from drivers/gpu/drm/i915/display/intel_dpt.c:11:
   drivers/gpu/drm/i915/display/intel_dpt.c: In function 'intel_dpt_debug':
>> include/drm/drm_print.h:456:39: error: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'unsigned int' [-Werror=format=]
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |                                       ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   include/drm/drm_print.h:456:9: note: in expansion of macro 'dev_err'
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:469:9: note: in expansion of macro '__drm_printk'
     469 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_dpt.c:91:17: note: in expansion of macro 'drm_err'
      91 |                 drm_err(&vm->i915->drm, "dpt %p [%d] physical address 0x%llx\n",
         |                 ^~~~~~~
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

:::::: The code at line 456 was first introduced by commit
:::::: fb6c7ab8718eb2543695d77ad8302ff81e8e1e32 drm/print: introduce new struct drm_device based logging macros

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
