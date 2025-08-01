Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912124467B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754052971; cv=none; b=bgS9VMXOWrnaB7b9YfWj8FfOhlPGq03Sm3lSFNGnUG4YbKTqofAPvaAhsC+Dv1o6NRDyPiJXlnU2bdVtHMu79maTK+nxiQ75kht2lcLxLVeeuDLccW2ATvsVTyVeM/E4wkb4gTq44qmxLmhLYBEzRYhyVrntgHjAUSW415NOcdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754052971; c=relaxed/simple;
	bh=YyFVr7vpLi4igOq7wL6xR29ArYXgVzTpGk2Jd6vnZHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ipzyLcRkNVPe1JqqzvYNXfsXegvA83LwvHr5+YUedYMtMmCvKb6dNHLCA81UTgZSLVGcyj5UZ4QY8DKYnnKvy5UbxOR6+wFmxc6wUBnOBuvGk2J+QI6b4/66Ey6kgQ51iuF2ce4nzvCpJ5uDRKuP4mTasoP1bLNGkmeuR6oopqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtH7MuX5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtH7MuX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754052969; x=1785588969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YyFVr7vpLi4igOq7wL6xR29ArYXgVzTpGk2Jd6vnZHE=;
  b=gtH7MuX5sxRpuXgQfGTSzHP/7OhKFVN4hoziklY7pl1K14Vdee774thO
   7oVAfiKaBBfduoZpHFgYJkqxERA7KFmDnrkbeKnPtES4uRpApAyutTm7A
   CSugLLSTmhrCitUIqrOwvXeVW9wcukK/2kmmDY4zjOLyEcwijTrPMhsYS
   qubrWSMwf8gxCfhIQSzCQ7V/R8UwFMSr73K4Qb5HWPOmnxOHQcDkAlBM1
   h2HBqxrwjID1o5e3KcaB1HIx+yOjIT99kaeYCt4A5hZZHQYg9x7PsAVwD
   rTeGGziQCJl6DzJory/G1yvMakO3NfzcFt7WSPhpee3IB33gDvIdHadvp
   Q==;
X-CSE-ConnectionGUID: 7KxQVRTMQVKLhbreLSUAew==
X-CSE-MsgGUID: utPo72B+S2GKnbkyhn8u2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56357676"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56357676"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 05:56:08 -0700
X-CSE-ConnectionGUID: bQ9uY/6jQkicn2ubbiiicQ==
X-CSE-MsgGUID: yIGGtwunTI6EcsQ6Bw3qFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="167742004"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Aug 2025 05:56:06 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhpIq-0004dC-12;
	Fri, 01 Aug 2025 12:56:04 +0000
Date: Fri, 1 Aug 2025 20:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-lookup 53/56] include/drm/drm_print.h:578:9: error:
 implicit declaration of function '_dynamic_func_call_cls'
Message-ID: <202508012015.2l89ZOLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-lookup
head:   f6006e353294709829a526d40efb1f26185a20cd
commit: 08d5ff8083dc983d4e3975240e382563d2ddf1ef [53/56] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: x86_64-randconfig-r071-20250801 (https://download.01.org/0day-ci/archive/20250801/202508012015.2l89ZOLg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508012015.2l89ZOLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508012015.2l89ZOLg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:43,
                    from drivers/accel/amdxdna/aie2_ctx.c:8:
   drivers/accel/amdxdna/aie2_ctx.c: In function 'aie2_hwctx_restart':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro 'drm_dbg'
      15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^~~~~~~
   drivers/accel/amdxdna/aie2_ctx.c:76:17: note: in expansion of macro 'XDNA_DBG'
      76 |                 XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
         |                 ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/accel/amdxdna/aie2_error.c:8:
   drivers/accel/amdxdna/aie2_error.c: In function 'aie2_error_worker':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro 'drm_dbg'
      15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^~~~~~~
   drivers/accel/amdxdna/aie2_error.c:253:9: note: in expansion of macro 'XDNA_DBG'
     253 |         XDNA_DBG(xdna, "Error count %d return code %d", info->err_cnt, info->ret_code);
         |         ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:43,
                    from drivers/accel/amdxdna/aie2_message.c:9:
   drivers/accel/amdxdna/aie2_message.c: In function 'aie2_query_aie_version':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro 'drm_dbg'
      15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^~~~~~~
   drivers/accel/amdxdna/aie2_message.c:123:9: note: in expansion of macro 'XDNA_DBG'
     123 |         XDNA_DBG(xdna, "Query AIE version - major: %u minor: %u completed",
         |         ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:43,
                    from include/drm/drm_gem_shmem_helper.h:11,
                    from drivers/accel/amdxdna/aie2_pci.c:9:
   drivers/accel/amdxdna/aie2_pci.c: In function 'aie2_dump_chann_info_debug':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro 'drm_dbg'
      15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^~~~~~~
   drivers/accel/amdxdna/aie2_pci.c:86:9: note: in expansion of macro 'XDNA_DBG'
      86 |         XDNA_DBG(xdna, "i2x tail    0x%x", ndev->mgmt_i2x.mb_tail_ptr_reg);
         |         ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:43,
                    from include/drm/drm_gem_shmem_helper.h:11,
                    from drivers/accel/amdxdna/aie2_smu.c:7:
   drivers/accel/amdxdna/aie2_smu.c: In function 'npu1_set_dpm':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro 'drm_dbg'
      15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^~~~~~~
   drivers/accel/amdxdna/aie2_smu.c:81:9: note: in expansion of macro 'XDNA_DBG'
      81 |         XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
         |         ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/accel/amdxdna/aie2_solver.c:8:
   drivers/accel/amdxdna/aie2_solver.c: In function 'xrs_allocate_resource':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/amdxdna/aie2_solver.c:336:9: note: in expansion of macro 'drm_dbg'
     336 |         drm_dbg(xrs->cfg.ddev, "start col %d ncols %d\n",
         |         ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:43,
                    from drivers/accel/amdxdna/amdxdna_ctx.c:10:
   drivers/accel/amdxdna/amdxdna_ctx.c: In function 'amdxdna_hwctx_remove_all':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro 'drm_dbg'
      15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^~~~~~~
   drivers/accel/amdxdna/amdxdna_ctx.c:157:17: note: in expansion of macro 'XDNA_DBG'
     157 |                 XDNA_DBG(client->xdna, "PID %d close HW context %d",
         |                 ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:43,
                    from drivers/accel/amdxdna/amdxdna_gem.c:9:
   drivers/accel/amdxdna/amdxdna_gem.c: In function 'amdxdna_hmm_invalidate':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro 'drm_dbg'
      15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^~~~~~~
   drivers/accel/amdxdna/amdxdna_gem.c:72:9: note: in expansion of macro 'XDNA_DBG'
      72 |         XDNA_DBG(xdna, "Invalidating range 0x%lx, 0x%lx, type %d",
         |         ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:43,
                    from drivers/accel/amdxdna/amdxdna_pci_drv.c:9:
   drivers/accel/amdxdna/amdxdna_pci_drv.c: In function 'amdxdna_drm_open':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro 'drm_dbg'
      15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^~~~~~~
   drivers/accel/amdxdna/amdxdna_pci_drv.c:96:9: note: in expansion of macro 'XDNA_DBG'
      96 |         XDNA_DBG(xdna, "pid %d opened", client->pid);
         |         ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:43,
                    from aie2_ctx.c:8:
   aie2_ctx.c: In function 'aie2_hwctx_restart':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   amdxdna_pci_drv.h:15:41: note: in expansion of macro 'drm_dbg'
      15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^~~~~~~
   aie2_ctx.c:76:17: note: in expansion of macro 'XDNA_DBG'
      76 |                 XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
         |                 ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from aie2_error.c:8:
   aie2_error.c: In function 'aie2_error_worker':
>> include/drm/drm_print.h:578:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:681:33: note: in expansion of macro 'drm_dbg_driver'
     681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   amdxdna_pci_drv.h:15:41: note: in expansion of macro 'drm_dbg'
      15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
         |                                         ^~~~~~~
   aie2_error.c:253:9: note: in expansion of macro 'XDNA_DBG'
     253 |         XDNA_DBG(xdna, "Error count %d return code %d", info->err_cnt, info->ret_code);
         |         ^~~~~~~~
   cc1: some warnings being treated as errors
..


vim +/_dynamic_func_call_cls +578 include/drm/drm_print.h

02c9656b2f0d69 Haneen Mohammed 2017-10-17  572  
84ec67288c10fb Jim Cromie      2022-09-11  573  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
e820f52577b14c Jim Cromie      2022-09-11  574  #define drm_dev_dbg(dev, cat, fmt, ...)				\
16deeb8e18cafd Jim Cromie      2022-09-11  575  	__drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
84ec67288c10fb Jim Cromie      2022-09-11  576  #else
84ec67288c10fb Jim Cromie      2022-09-11  577  #define drm_dev_dbg(dev, cat, fmt, ...)				\
16deeb8e18cafd Jim Cromie      2022-09-11 @578  	_dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,		\
84ec67288c10fb Jim Cromie      2022-09-11  579  			       dev, cat, fmt, ##__VA_ARGS__)
84ec67288c10fb Jim Cromie      2022-09-11  580  #endif
e820f52577b14c Jim Cromie      2022-09-11  581  

:::::: The code at line 578 was first introduced by commit
:::::: 16deeb8e18cafd30e70d8dc2b12a753b28298d8a drm_print: add _ddebug descriptor to drm_*dbg prototypes

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
