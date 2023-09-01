Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5A8A49
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 20:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693600255; x=1725136255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=faRuPyqpIxjyBNxtv43Px6XWOEAiuP/yYmDB4HXeni4=;
  b=J5pLJpMmLBDdaC7YUnWvzmmxDGXPa/esjESD+rW2i9MT0RKLX5zVO/CK
   2KCPthlhU31h9MIVXCUIXc35YVrEXpL9D7dcLRuCpRJy0yxbKljADiiNV
   OfdmdqPUFIPt0zfBNmwDmZo/i2kYF1bm7bJQ5Q8uTxo/dVQdkJMKteEC0
   4D0ay2P2eHi5PgsuCr7+v+C5isjAgtkdzHhMW4Lj1Y+V9N5jCRHFc2miy
   PpD4fOWJOb6w6gF5kzEG66KN+SSL9t8EkryKsiS4CARplDHJHjDBzldeb
   TtfVV+tJ6YuH3jDOKcsfKN3+WyRlE9bI7j3nqPu6MijnX7XyuPHRHUO8I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356611366"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="356611366"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 13:30:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805569629"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="805569629"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Sep 2023 13:30:52 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcAn4-0001cF-10;
	Fri, 01 Sep 2023 20:30:50 +0000
Date: Sat, 2 Sep 2023 04:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6160/24603]
 drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:1458:12: warning:
 'hdmirx_runtime_resume' defined but not used
Message-ID: <202309020439.CfWUHfSG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: f23cd0bfe50f8652d6b8932f3bf4ab8d792ae759 [6160/24603] Merge branch 'display/next' into next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230902/202309020439.CfWUHfSG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020439.CfWUHfSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020439.CfWUHfSG-lkp@intel.com/

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
