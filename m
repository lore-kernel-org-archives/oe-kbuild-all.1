Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F41910EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 00:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfLH0jl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697244637; x=1728780637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z7wsellLftjxbknVBW6UpFObszBl4UO4WOnlKdQOBLc=;
  b=DfLH0jl+rcAZMCQJzzp/48OEx1jwvsTZLII6Zad1G2TYp1gHb20wDbvQ
   Uznlv4b7WOd+DW6VIvxGbaJR9OfQoS46UTRUDZphvn9EO8emD6gJMYdU3
   z3ekk5JYZ+UF9xGwhmDGb+og3sDNakhpMr9wwOJvG3ynk0riTJ/6WPPQo
   mqwQ8k5v8FydN8I0KlYGPjLBW4oSzYmm5EkQUZQodAzAIHA5+q41L1uOG
   HldNTaQk9h/8wExDtXEZqStKq6LDusBstxUtGk8PdbcDGcB/EA9F365iC
   NJ6Ei7GzQGBL8YuELmIGEEhmRghjgl0i5gxT4ywQZJBfgc9iEEI7i1lER
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365556220"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="365556220"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="790046769"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="790046769"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 17:50:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrSrP-0005Yz-0c;
	Sat, 14 Oct 2023 00:50:31 +0000
Date: Sat, 14 Oct 2023 08:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6160/24603]
 drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:1458:12: warning:
 'hdmirx_runtime_resume' defined but not used
Message-ID: <202310140815.Cu12MlYd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: f23cd0bfe50f8652d6b8932f3bf4ab8d792ae759 [6160/24603] Merge branch 'display/next' into next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140815.Cu12MlYd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140815.Cu12MlYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140815.Cu12MlYd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:681:27: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Werror=incompatible-pointer-types]
     681 |         .enum_mbus_code = hdmirx_enum_mbus_code,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:681:27: note: (near initialization for 'cdns_pad_ops_hdmi.enum_mbus_code')
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:682:28: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Werror=incompatible-pointer-types]
     682 |         .enum_frame_size = hdmirx_enum_framesizes,
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:682:28: note: (near initialization for 'cdns_pad_ops_hdmi.enum_frame_size')
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:683:32: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_interval_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_interval_enum *)' [-Werror=incompatible-pointer-types]
     683 |         .enum_frame_interval = hdmirx_enum_frame_interval,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:683:32: note: (near initialization for 'cdns_pad_ops_hdmi.enum_frame_interval')
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:684:20: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
     684 |         .get_fmt = hdmirx_get_format,
         |                    ^~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:684:20: note: (near initialization for 'cdns_pad_ops_hdmi.get_fmt')
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c: In function 'tmdsmon_fn':
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:907:58: warning: variable 'events' set but not used [-Wunused-but-set-variable]
     907 |                                                 uint32_t events;
         |                                                          ^~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c: At top level:
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:1149: warning: "HOTPLUG_DEBOUNCE_MS" redefined
    1149 | #define HOTPLUG_DEBOUNCE_MS             200
         | 
   In file included from drivers/staging/media/imx/hdmirx/cdns-mhdp-hdmirx.h:32,
                    from drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.h:15,
                    from drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:16:
   include/drm/bridge/cdns-mhdp.h:531: note: this is the location of the previous definition
     531 | #define HOTPLUG_DEBOUNCE_MS             50
         | 
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:1458:12: warning: 'hdmirx_runtime_resume' defined but not used [-Wunused-function]
    1458 | static int hdmirx_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:1443:12: warning: 'hdmirx_runtime_suspend' defined but not used [-Wunused-function]
    1443 | static int hdmirx_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/hdmirx_runtime_resume +1458 drivers/staging/media/imx/hdmirx/cdns-hdmirx.c

4830fa96893226 Sandor Yu 2020-12-09  1442  
4830fa96893226 Sandor Yu 2020-12-09 @1443  static int hdmirx_runtime_suspend(struct device *dev)
4830fa96893226 Sandor Yu 2020-12-09  1444  {
4830fa96893226 Sandor Yu 2020-12-09  1445  	struct cdns_hdmirx_device *hdmirx = dev_get_drvdata(dev);
4830fa96893226 Sandor Yu 2020-12-09  1446  
4830fa96893226 Sandor Yu 2020-12-09  1447  	if (hdmirx->flags & HDMIRX_RUNTIME_SUSPEND)
4830fa96893226 Sandor Yu 2020-12-09  1448  		return 0;
4830fa96893226 Sandor Yu 2020-12-09  1449  
4830fa96893226 Sandor Yu 2020-12-09  1450  	if (hdmirx->flags & HDMIRX_PM_POWERED) {
4830fa96893226 Sandor Yu 2020-12-09  1451  		hdmirx_clock_disable(hdmirx);
4830fa96893226 Sandor Yu 2020-12-09  1452  		hdmirx->flags |= HDMIRX_RUNTIME_SUSPEND;
4830fa96893226 Sandor Yu 2020-12-09  1453  		hdmirx->flags &= ~HDMIRX_PM_POWERED;
4830fa96893226 Sandor Yu 2020-12-09  1454  	}
4830fa96893226 Sandor Yu 2020-12-09  1455  	return 0;
4830fa96893226 Sandor Yu 2020-12-09  1456  }
4830fa96893226 Sandor Yu 2020-12-09  1457  
4830fa96893226 Sandor Yu 2020-12-09 @1458  static int hdmirx_runtime_resume(struct device *dev)
4830fa96893226 Sandor Yu 2020-12-09  1459  {
4830fa96893226 Sandor Yu 2020-12-09  1460  	struct cdns_hdmirx_device *hdmirx = dev_get_drvdata(dev);
4830fa96893226 Sandor Yu 2020-12-09  1461  
4830fa96893226 Sandor Yu 2020-12-09  1462  	if (hdmirx->flags & HDMIRX_PM_POWERED)
4830fa96893226 Sandor Yu 2020-12-09  1463  		return 0;
4830fa96893226 Sandor Yu 2020-12-09  1464  
4830fa96893226 Sandor Yu 2020-12-09  1465  	if (hdmirx->flags & HDMIRX_RUNTIME_SUSPEND) {
4830fa96893226 Sandor Yu 2020-12-09  1466  		hdmirx_clock_enable(hdmirx);
4830fa96893226 Sandor Yu 2020-12-09  1467  		hdmirx->flags |= HDMIRX_PM_POWERED;
4830fa96893226 Sandor Yu 2020-12-09  1468  		hdmirx->flags &= ~HDMIRX_RUNTIME_SUSPEND;
4830fa96893226 Sandor Yu 2020-12-09  1469  	}
4830fa96893226 Sandor Yu 2020-12-09  1470  	return 0;
4830fa96893226 Sandor Yu 2020-12-09  1471  }
4830fa96893226 Sandor Yu 2020-12-09  1472  

:::::: The code at line 1458 was first introduced by commit
:::::: 4830fa96893226afb8f79e763acef0fa8197fd9b MLK-24081-06: staging: media: imx: Add hdmi rx driver

:::::: TO: Sandor Yu <Sandor.yu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
