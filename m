Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC51C2C6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714396124; cv=none; b=iYfQyGy0ooTKo/YZT+buyDe2DGp/MlgZ/YVUDOWmSvaiG9oJ46Sc60/ToDhAvXe/QbK3NrHMlcY834XH8Ny766oTBvbOHk1fKThIQ5G30znfhupT+L8pYRIKMEujIpYhP9i7lfnIg7xfhA5raMf8kntqWdjPfTPf9Cbg7XkhHy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714396124; c=relaxed/simple;
	bh=sdZm6s52Ouc39HUSA9rnff5yew/fjDmBALMriNHZ4uA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WMpdbHj+WJlTPQ+ZdEcgIE9JEWoUg21VZfU4nl2itWwgkcTxtGwpAmVY41SDhQmR2l2l2CulLWTRintVPgubgO4rliKNNKhEeeGK7pEwCycnW/rSh2kaubD3dAIW64bzw8G5GscaseWpMAA3Rg8tb0yHm6rD4coOnv74JejmQpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUZPfNdn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUZPfNdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714396122; x=1745932122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sdZm6s52Ouc39HUSA9rnff5yew/fjDmBALMriNHZ4uA=;
  b=RUZPfNdn7dxfl9XZrEluStFhSRfYrkaEPvsieakj+NQDgshFJUjnR5Dn
   qqWqjC/g0ikmTnMHXm0+hdFaytNWrTFjaugpML9jaRQzv3iVE0nN8LlcF
   Qwent9ezdh2r3n+i1Hw6Pq3JZO89jbyc3qWiCHJPHerti24u+vbIu0/lZ
   9zX+FPAk1bLvYHXZ0n3zvl/0JvKwc+Vb5DKmKzfwoV4N6AEBcSpTvwxXP
   p2A7w9Dq33LItnF1mYcBNoJ6zz2bica//mksr1K9csmy0p6X8gp0aUtjh
   TB9UndV1Iy0XhytTvHg5s03TmHwYbUz/UiOBGw2z00rq5QrErGpOVHUQz
   g==;
X-CSE-ConnectionGUID: d50ohz7TSICPlEEwzHvRaQ==
X-CSE-MsgGUID: G5leB/HyRomJqXuU4grT4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="12988354"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="12988354"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 06:08:42 -0700
X-CSE-ConnectionGUID: IFYtEcCrRI2udlk6ZudJZw==
X-CSE-MsgGUID: LpYq23txTaWPLMrDB4KNTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30790506"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2024 06:08:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1QkI-0007BW-0y;
	Mon, 29 Apr 2024 13:08:38 +0000
Date: Mon, 29 Apr 2024 21:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 6503/11728]
 drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:407:32:
 error: no previous prototype for 'device_gpu_cooling_register'
Message-ID: <202404292140.BqfiOlgr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: a517b970f8a97273a42f4b88b56bf246192a23c9 [6503/11728] LF-10537 [#imx-3251] [imx] refine GPU frequency adjustment feature
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404292140.BqfiOlgr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292140.BqfiOlgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292140.BqfiOlgr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:407:32: error: no previous prototype for 'device_gpu_cooling_register' [-Werror=missing-prototypes]
     407 | struct thermal_cooling_device *device_gpu_cooling_register(struct device_node *np,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:443:6: error: no previous prototype for 'device_gpu_cooling_unregister' [-Werror=missing-prototypes]
     443 | void device_gpu_cooling_unregister(struct thermal_cooling_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:716:5: error: no previous prototype for 'init_gpu_opp_table' [-Werror=missing-prototypes]
     716 | int init_gpu_opp_table(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: In function 'init_gpu_opp_table':
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:763:58: error: variable 'shader_volt' set but not used [-Werror=unused-but-set-variable]
     763 |         unsigned long core_freq, core_volt, shader_freq, shader_volt;
         |                                                          ^~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: At top level:
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:804:5: error: no previous prototype for 'remove_gpu_opp_table' [-Werror=missing-prototypes]
     804 | int remove_gpu_opp_table(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:1308:5: error: no previous prototype for 'init_priv' [-Werror=missing-prototypes]
    1308 | int init_priv(void)
         |     ^~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:1328:1: error: no previous prototype for 'free_priv' [-Werror=missing-prototypes]
    1328 | free_priv(void)
         | ^~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: In function 'device_gpu_cooling_register':
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:426:59: error: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Werror=format-truncation=]
     426 |     snprintf(dev_name, sizeof(dev_name), "thermal-gpufreq-%d",
         |                                                           ^~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:426:42: note: directive argument in the range [0, 2147483647]
     426 |     snprintf(dev_name, sizeof(dev_name), "thermal-gpufreq-%d",
         |                                          ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:426:5: note: 'snprintf' output between 18 and 27 bytes into a destination of size 20
     426 |     snprintf(dev_name, sizeof(dev_name), "thermal-gpufreq-%d",
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     427 |               gpufreq_dev->id);
         |               ~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/device_gpu_cooling_register +407 drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c

323eeb46374a47 Zhang Bo   2022-03-04  406  
323eeb46374a47 Zhang Bo   2022-03-04 @407  struct thermal_cooling_device *device_gpu_cooling_register(struct device_node *np,
323eeb46374a47 Zhang Bo   2022-03-04  408                                                             unsigned long states)
323eeb46374a47 Zhang Bo   2022-03-04  409  {
a517b970f8a972 Dandan Sun 2023-11-14  410      struct thermal_cooling_device *cdev;
a517b970f8a972 Dandan Sun 2023-11-14  411      struct gpufreq_cooling_device *gpufreq_dev = NULL;
323eeb46374a47 Zhang Bo   2022-03-04  412      char dev_name[THERMAL_NAME_LENGTH];
323eeb46374a47 Zhang Bo   2022-03-04  413      int ret = 0;
323eeb46374a47 Zhang Bo   2022-03-04  414  
a517b970f8a972 Dandan Sun 2023-11-14  415      gpufreq_dev = kzalloc(sizeof(struct gpufreq_cooling_device),
323eeb46374a47 Zhang Bo   2022-03-04  416                                   GFP_KERNEL);
a517b970f8a972 Dandan Sun 2023-11-14  417      if (!gpufreq_dev)
323eeb46374a47 Zhang Bo   2022-03-04  418          return ERR_PTR(-ENOMEM);
323eeb46374a47 Zhang Bo   2022-03-04  419  
a517b970f8a972 Dandan Sun 2023-11-14  420      ret = get_idr(&gpufreq_idr, &gpufreq_dev->id);
323eeb46374a47 Zhang Bo   2022-03-04  421      if (ret) {
a517b970f8a972 Dandan Sun 2023-11-14  422          kfree(gpufreq_dev);
323eeb46374a47 Zhang Bo   2022-03-04  423          return ERR_PTR(-EINVAL);
323eeb46374a47 Zhang Bo   2022-03-04  424      }
323eeb46374a47 Zhang Bo   2022-03-04  425  
323eeb46374a47 Zhang Bo   2022-03-04 @426      snprintf(dev_name, sizeof(dev_name), "thermal-gpufreq-%d",
a517b970f8a972 Dandan Sun 2023-11-14  427                gpufreq_dev->id);
a517b970f8a972 Dandan Sun 2023-11-14  428  
a517b970f8a972 Dandan Sun 2023-11-14  429      gpufreq_dev->max_state = states;
a517b970f8a972 Dandan Sun 2023-11-14  430      cdev = thermal_of_cooling_device_register(np, dev_name, gpufreq_dev,
a517b970f8a972 Dandan Sun 2023-11-14  431                                           &gpufreq_cooling_ops);
a517b970f8a972 Dandan Sun 2023-11-14  432      if (!cdev) {
a517b970f8a972 Dandan Sun 2023-11-14  433          release_idr(&gpufreq_idr, gpufreq_dev->id);
a517b970f8a972 Dandan Sun 2023-11-14  434          kfree(gpufreq_dev);
323eeb46374a47 Zhang Bo   2022-03-04  435          return ERR_PTR(-EINVAL);
323eeb46374a47 Zhang Bo   2022-03-04  436      }
a517b970f8a972 Dandan Sun 2023-11-14  437      gpufreq_dev->cdev = cdev;
a517b970f8a972 Dandan Sun 2023-11-14  438      gpufreq_dev->state = 0;
323eeb46374a47 Zhang Bo   2022-03-04  439  
a517b970f8a972 Dandan Sun 2023-11-14  440      return cdev;
323eeb46374a47 Zhang Bo   2022-03-04  441  }
323eeb46374a47 Zhang Bo   2022-03-04  442  
323eeb46374a47 Zhang Bo   2022-03-04 @443  void device_gpu_cooling_unregister(struct thermal_cooling_device *cdev)
323eeb46374a47 Zhang Bo   2022-03-04  444  {
a517b970f8a972 Dandan Sun 2023-11-14  445      struct gpufreq_cooling_device *gpufreq_dev = cdev->devdata;
323eeb46374a47 Zhang Bo   2022-03-04  446  
a517b970f8a972 Dandan Sun 2023-11-14  447      thermal_cooling_device_unregister(gpufreq_dev->cdev);
a517b970f8a972 Dandan Sun 2023-11-14  448      release_idr(&gpufreq_idr, gpufreq_dev->id);
a517b970f8a972 Dandan Sun 2023-11-14  449      kfree(gpufreq_dev);
323eeb46374a47 Zhang Bo   2022-03-04  450  }
323eeb46374a47 Zhang Bo   2022-03-04  451  

:::::: The code at line 407 was first introduced by commit
:::::: 323eeb46374a4772e8cdc409328c159eb9c60f71 MA-19319 [#imx-2825] Add another thermal PM processing interface for android

:::::: TO: Zhang Bo <bo.zhang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
