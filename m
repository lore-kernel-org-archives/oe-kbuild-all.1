Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B313DB92
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709850026; cv=none; b=sM0GhOv/NaB/3IK6lOzsOkIi19/yxpUaefTUJzDVIFQO8i8QZ/k93W75r/jnmkcy9V2yPFh9kGbAHpdDZA2ggBgp6jLk3zzLuOfeUBc1VeZ9tLl+eEZ/k/14F7gcpQ6AEZfVpmIVaW5vGHRZ/Sky6e/exhfCMdASHxq0eqk/NR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709850026; c=relaxed/simple;
	bh=TCKdl2hKc1FWoHY/dl8l9w1FhCT6T4En0viRkkZllqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXtaFQY3rH2yFJxBrPUukpl9T1S3RIzCIDzdC/o0+Rts63mkRodlfxbhc69hzDiXodhZQkF3bev3lNDkHuAIBC5XDAqhZ6K6rMk7WzAWwuTBldwX6Mlwi6DiRrrS0rc6T2l+jT1CRs3mLtES+VkezvprV80U9THeCZ72moCM+4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhbUliFX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhbUliFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709850025; x=1741386025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCKdl2hKc1FWoHY/dl8l9w1FhCT6T4En0viRkkZllqY=;
  b=XhbUliFX8t61PKZSnbKPLYtuyXf4VLQw2XXL/mnhv5C5f+1M7EDLTDDX
   j2lKdeMzLojdYb80kSJnYG0r1nhH9aQ7JfGmW370PvxiBA6wgqZcxOhF9
   S7bnf0AiFQE4SBeM03IgogBhedhnCd2vFb96b4Dvn/ATeVfubHD+4zun2
   FAdjOVwHv42WWEI2zkEcq9UuwdmxoR9aXLR8HkOBkjdGEqlPsWjnCGrp/
   EXsJCdJ4LAI3mg46EiSXyt9uC7PxJC2fcSYNicgrAx2u9sU+lhZ+jWx/3
   5COyDfFGMq165THTaycyDIRzCX9A9f5BP8ZsPnLsVXVlIXblIMMCouUhU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4429085"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4429085"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 14:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10242144"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2024 14:20:23 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riM68-0005lB-2d;
	Thu, 07 Mar 2024 22:20:20 +0000
Date: Fri, 8 Mar 2024 06:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jmondi:pispbe/media-staging/be-upstream 64/143]
 drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:2385:12: warning:
 'cfe_runtime_resume' defined but not used
Message-ID: <202403080625.8RcKQhe9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   b7b928a1ff80dc548d6f5c1b8c00b2082212e38e
commit: 93ec8da90f494511ef89759cd89f2cfc013c5d81 [64/143] media: bring in CFE driver from rpi kernel
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240308/202403080625.8RcKQhe9-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080625.8RcKQhe9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080625.8RcKQhe9-lkp@intel.com/

All warnings (new ones prefixed by >>):

     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:61:30: note: in expansion of macro 'dev_dbg'
      61 | #define cfe_dbg(fmt, arg...) dev_dbg(&cfe->pdev->dev, fmt, ##arg)
         |                              ^~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:1483:9: note: in expansion of macro 'cfe_dbg'
    1483 |         cfe_dbg("%s: Set " V4L2_FOURCC_CONV "\n", __func__,
         |         ^~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:1483:28: error: expected ')' before 'V4L2_FOURCC_CONV'
    1483 |         cfe_dbg("%s: Set " V4L2_FOURCC_CONV "\n", __func__,
         |                            ^~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:61:30: note: in expansion of macro 'dev_dbg'
      61 | #define cfe_dbg(fmt, arg...) dev_dbg(&cfe->pdev->dev, fmt, ##arg)
         |                              ^~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:1483:9: note: in expansion of macro 'cfe_dbg'
    1483 |         cfe_dbg("%s: Set " V4L2_FOURCC_CONV "\n", __func__,
         |         ^~~~~~~
   include/linux/dynamic_debug.h:224:21: note: to match this '('
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                     ^
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:61:30: note: in expansion of macro 'dev_dbg'
      61 | #define cfe_dbg(fmt, arg...) dev_dbg(&cfe->pdev->dev, fmt, ##arg)
         |                              ^~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:1483:9: note: in expansion of macro 'cfe_dbg'
    1483 |         cfe_dbg("%s: Set " V4L2_FOURCC_CONV "\n", __func__,
         |         ^~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:1483:17: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
    1483 |         cfe_dbg("%s: Set " V4L2_FOURCC_CONV "\n", __func__,
         |                 ^~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:61:30: note: in expansion of macro 'dev_dbg'
      61 | #define cfe_dbg(fmt, arg...) dev_dbg(&cfe->pdev->dev, fmt, ##arg)
         |                              ^~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:1483:9: note: in expansion of macro 'cfe_dbg'
    1483 |         cfe_dbg("%s: Set " V4L2_FOURCC_CONV "\n", __func__,
         |         ^~~~~~~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:1483:19: note: format string is defined here
    1483 |         cfe_dbg("%s: Set " V4L2_FOURCC_CONV "\n", __func__,
         |                  ~^
         |                   |
         |                   char *
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c: In function 'cfe_video_link_validate':
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:1689:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1689 |         source_fmt = v4l2_subdev_get_pad_format(source_sd, state,
         |                    ^
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c: In function 'cfe_register_node':
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:1908:10: error: 'struct vb2_queue' has no member named 'min_buffers_needed'
    1908 |         q->min_buffers_needed = 1;
         |          ^~
   drivers/media/platform/raspberrypi/rp1_cfe/cfe.c: At top level:
>> drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:2385:12: warning: 'cfe_runtime_resume' defined but not used [-Wunused-function]
    2385 | static int cfe_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/raspberrypi/rp1_cfe/cfe.c:2375:12: warning: 'cfe_runtime_suspend' defined but not used [-Wunused-function]
    2375 | static int cfe_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cfe_runtime_resume +2385 drivers/media/platform/raspberrypi/rp1_cfe/cfe.c

  2374	
> 2375	static int cfe_runtime_suspend(struct device *dev)
  2376	{
  2377		struct platform_device *pdev = to_platform_device(dev);
  2378		struct cfe_device *cfe = platform_get_drvdata(pdev);
  2379	
  2380		clk_disable_unprepare(cfe->clk);
  2381	
  2382		return 0;
  2383	}
  2384	
> 2385	static int cfe_runtime_resume(struct device *dev)
  2386	{
  2387		struct platform_device *pdev = to_platform_device(dev);
  2388		struct cfe_device *cfe = platform_get_drvdata(pdev);
  2389		int ret;
  2390	
  2391		ret = clk_prepare_enable(cfe->clk);
  2392		if (ret) {
  2393			dev_err(dev, "Unable to enable clock\n");
  2394			return ret;
  2395		}
  2396	
  2397		return 0;
  2398	}
  2399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
