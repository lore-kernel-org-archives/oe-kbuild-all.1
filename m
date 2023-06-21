Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B2C18C28
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 18:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687373538; x=1718909538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4HIQIcu912psoYdIo6vxVinoQt9oNfF+oNv+kRiL5cM=;
  b=QcSzBwr2PTjGF/IsSPEc8bvkxASHbu/FUhgy3LAsxDchGbsi8VjHfGGh
   1VS/OorJKH1fRjCLbFcymT+G6t7eYe/BxRO29EfAvfX+OiMpxYlXoeTLC
   /+pQ5WDY+M3GgkOpQLU2wbUhS1Uh656/wzifUmTh3Q5T1hjHkHUQzopZh
   n+kNSOFGqUitLXFMto+j3WaNi2q8mQ5c2taJN5liEz97NBCBpiIVB2I8A
   9MMyRP5w1Azd0WG5RGOEYTWxmLPQ51lfnoxyXuD4j+Td695PrTvO28SVD
   5jfqEvOdfK2EUzzPURVI4bzxfKDo4t51wm0vvqF8JYmOtG3YniUqTpbey
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="423929832"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="423929832"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 11:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804492703"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="804492703"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2023 11:52:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC2wB-000727-1y;
	Wed, 21 Jun 2023 18:52:15 +0000
Date: Thu, 22 Jun 2023 02:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:dpt_debug_2 2/3] include/drm/drm_print.h:456:39: error:
 format '%llx' expects argument of type 'long long unsigned int', but
 argument 5 has type 'unsigned int'
Message-ID: <202306220205.JOwwBV7x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/vsyrjala/linux.git dpt_debug_2
head:   2f46ac9af5a093e6b0363752c07692d34672ff3a
commit: 5eeedbfbcc698af4c74b3bfabf7fae2a309ed466 [2/3] dpt debug
config: i386-randconfig-i003-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220205.JOwwBV7x-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220205.JOwwBV7x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220205.JOwwBV7x-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
