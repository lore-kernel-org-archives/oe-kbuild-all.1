Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B98B33C1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694348093; x=1725884093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S0ZTkZY2QzpUyDAV2t0L8uQGRVylGbv9FmBji7NmVjs=;
  b=fbjHm1LegcRVqfJbfSnrT+JrQo06RYnCueNBd9IveGrJg1ixz1amLImP
   MEoB1DENoo+jBHffPwglsxA/7ahJvu1LOjm98HDQRM/7tW+bn85IFUj3S
   K7gbPJGtStnvyMNt41UtqpMySIlvRuNLQvrKcf2kN7XbiJ6PW2//p/m09
   AurrSe1fKr9BLVwKhdIcOfSFd7kln/spWz+c0S5MzbAh7pqgViN0/Sb29
   tpSuODRTxeh+WyUbbD5ObDlnA38mMJ0Js6itmKViS9QiT2CTrWu6OjzZq
   eWlgO/CbiN3JbM8PZ7beb662duRxOZ5EQ/XHiiC4dNwRRSBred5eyNpkA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="362937639"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="362937639"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692753713"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="692753713"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Sep 2023 05:14:51 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfJKy-0004tq-2m;
	Sun, 10 Sep 2023 12:14:48 +0000
Date: Sun, 10 Sep 2023 20:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5f 23/25] include/drm/drm_print.h:423:9: error:
 implicit declaration of function '_dynamic_func_call_cls'
Message-ID: <202309102032.DrU7xTZn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-fix-5f
head:   dc6931cc4126fd98ba55329c9545f128ee112b4f
commit: a292927eecefacddc81d3015a07d575d9f702c75 [23/25] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20230910/202309102032.DrU7xTZn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309102032.DrU7xTZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309102032.DrU7xTZn-lkp@intel.com/

Note: the jimc/dd-fix-5f HEAD dc6931cc4126fd98ba55329c9545f128ee112b4f builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:32:
   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c: In function 'drm_dp_dual_mode_detect':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:504:9: note: in expansion of macro 'drm_dev_dbg'
     504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:228:9: note: in expansion of macro 'drm_dbg_kms'
     228 |         drm_dbg_kms(dev, "DP dual mode HDMI ID: %*pE (err %zd)\n",
         |         ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/display/drm_dp_helper.c:38:
   drivers/gpu/drm/display/drm_dp_helper.c: In function '__8b10b_clock_recovery_delay_us':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:504:9: note: in expansion of macro 'drm_dev_dbg'
     504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:219:17: note: in expansion of macro 'drm_dbg_kms'
     219 |                 drm_dbg_kms(aux->drm_dev, "%s: invalid AUX interval 0x%02x (max 4)\n",
         |                 ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/display/drm_dp_mst_topology.c:46:
   drivers/gpu/drm/display/drm_dp_mst_topology.c: In function 'drm_dp_decode_sideband_msg_hdr':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:504:9: note: in expansion of macro 'drm_dev_dbg'
     504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_mst_topology.c:310:17: note: in expansion of macro 'drm_dbg_kms'
     310 |                 drm_dbg_kms(mgr->dev, "crc4 mismatch 0x%x 0x%x\n", crc4, buf[len - 1]);
         |                 ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/logicvc/logicvc_layer.c:17:
   drivers/gpu/drm/logicvc/logicvc_layer.c: In function 'logicvc_plane_atomic_update':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:504:9: note: in expansion of macro 'drm_dev_dbg'
     504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/logicvc/logicvc_layer.c:215:17: note: in expansion of macro 'drm_dbg_kms'
     215 |                 drm_dbg_kms(drm_dev, "Setting layer %d alpha to %d/%d\n", index,
         |                 ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/bridge/chipone-icn6211.c:9:
   drivers/gpu/drm/bridge/chipone-icn6211.c: In function 'chipone_parse_dt':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:436:9: note: in expansion of macro 'drm_dev_dbg'
     436 |         drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/bridge/chipone-icn6211.c:656:17: note: in expansion of macro 'DRM_DEV_DEBUG'
     656 |                 DRM_DEV_DEBUG(dev, "failed to get VDD1 regulator: %d\n", ret);
         |                 ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/bridge/ite-it6505.c:30:
   drivers/gpu/drm/bridge/ite-it6505.c: In function 'it6505_debug_print':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:446:9: note: in expansion of macro 'drm_dev_dbg'
     446 |         drm_dev_dbg(dev, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/bridge/ite-it6505.c:591:17: note: in expansion of macro 'DRM_DEV_DEBUG_DRIVER'
     591 |                 DRM_DEV_DEBUG_DRIVER(dev, "%s reg[%02x] read error (%d)",
         |                 ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/bridge/ti-dlpc3433.c:13:
   drivers/gpu/drm/bridge/ti-dlpc3433.c: In function 'dlpc_atomic_enable':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:436:9: note: in expansion of macro 'drm_dev_dbg'
     436 |         drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/bridge/ti-dlpc3433.c:120:9: note: in expansion of macro 'DRM_DEV_DEBUG'
     120 |         DRM_DEV_DEBUG(dev, "DLPC3433 device id: 0x%02x\n", devid);
         |         ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_ioc32.c:35:
   drivers/gpu/drm/drm_ioc32.c: In function 'drm_compat_ioctl':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:500:9: note: in expansion of macro 'drm_dev_dbg'
     500 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_ioc32.c:990:9: note: in expansion of macro 'drm_dbg_core'
     990 |         drm_dbg_core(dev, "comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from include/drm/drm_gem_dma_helper.h:7,
                    from drivers/gpu/drm/drm_gem_dma_helper.c:23:
   drivers/gpu/drm/drm_gem_dma_helper.c: In function 'drm_gem_dma_create':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:502:9: note: in expansion of macro 'drm_dev_dbg'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:520:33: note: in expansion of macro 'drm_dbg_driver'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_dma_helper.c:157:17: note: in expansion of macro 'drm_dbg'
     157 |                 drm_dbg(drm, "failed to allocate buffer with size %zu\n",
         |                 ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from include/drm/drm_gem_shmem_helper.h:11,
                    from drivers/gpu/drm/drm_gem_shmem_helper.c:22:
   drivers/gpu/drm/drm_gem_shmem_helper.c: In function 'drm_gem_shmem_get_pages_locked':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:504:9: note: in expansion of macro 'drm_dev_dbg'
     504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:178:17: note: in expansion of macro 'drm_dbg_kms'
     178 |                 drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
         |                 ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_atomic_helper.c:41:
   drivers/gpu/drm/drm_atomic_helper.c: In function 'handle_conflicting_encoders':
>> include/drm/drm_print.h:423:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:508:9: note: in expansion of macro 'drm_dev_dbg'
     508 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_helper.c:136:33: note: in expansion of macro 'drm_dbg_atomic'
     136 |                                 drm_dbg_atomic(connector->dev,
         |                                 ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +/_dynamic_func_call_cls +423 include/drm/drm_print.h

02c9656b2f0d69 Haneen Mohammed 2017-10-17  417  
84ec67288c10fb Jim Cromie      2022-09-11  418  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
e820f52577b14c Jim Cromie      2022-09-11  419  #define drm_dev_dbg(dev, cat, fmt, ...)				\
16deeb8e18cafd Jim Cromie      2022-09-11  420  	__drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
84ec67288c10fb Jim Cromie      2022-09-11  421  #else
84ec67288c10fb Jim Cromie      2022-09-11  422  #define drm_dev_dbg(dev, cat, fmt, ...)				\
16deeb8e18cafd Jim Cromie      2022-09-11 @423  	_dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,		\
84ec67288c10fb Jim Cromie      2022-09-11  424  			       dev, cat, fmt, ##__VA_ARGS__)
84ec67288c10fb Jim Cromie      2022-09-11  425  #endif
e820f52577b14c Jim Cromie      2022-09-11  426  

:::::: The code at line 423 was first introduced by commit
:::::: 16deeb8e18cafd30e70d8dc2b12a753b28298d8a drm_print: add _ddebug descriptor to drm_*dbg prototypes

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
