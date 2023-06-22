Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64AD3D67
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687466929; x=1719002929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OoiV9l6K6vEGjFTw+m0DAbDm8+ocWX2i81qJ+WRIOnw=;
  b=Lxnkdi22fD+omE4riwkLDCaxhKkQ4VQftfkic0ex3A3KTj+Dq8NAgyjs
   Twn/KlqLQFCxWaJRGhhbz/Ik/2A8zD/Kxcsv9G4eW94/yNZqWeYhIdYnZ
   /otzSWNiMUFSn60OcEGQM8wE5mq0S02/eOQtBXHne3g6IQjmIq+hnG2we
   6iQ/XJFk5/2iTBRQBD0Gnfkwjobd+tKiZpGhIbLejXmH5F4vqgvIG/jMw
   i6j+SuHxIDTEU+PG5OSOG/B67Kb/euh4G/sx58moEwFTEnG3X/LRR5f+1
   Jxn4jw7uuMBatHetvs5sjaQb+svW7a+OTvadpCEj4TwaxuUySHW/eMHSa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="446985556"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="446985556"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 13:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="889227899"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="889227899"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Jun 2023 13:48:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCREU-0007lr-12;
	Thu, 22 Jun 2023 20:48:46 +0000
Date: Fri, 23 Jun 2023 04:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4752/9881]
 drivers/media/platform/mxc/capture/ov5640_v2.c:1708:32: warning: variable
 'frame_rate' set but not used
Message-ID: <202306230444.OD8FtNpR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   3260d1af47b1bedfe12b79a26efa184b9a60a8a3
commit: ce0e2f7e0ebc193aa10e4a6921c61302e470387c [4752/9881] Merge remote-tracking branch 'origin/capture/ov5640' into capture/next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230623/202306230444.OD8FtNpR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230444.OD8FtNpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230444.OD8FtNpR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mxc/capture/mx6s_capture.c:365:18: warning: no previous prototype for 'format_by_fourcc' [-Wmissing-prototypes]
     365 | struct mx6s_fmt *format_by_fourcc(int fourcc)
         |                  ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mx6s_capture.c:378:18: warning: no previous prototype for 'format_by_mbus' [-Wmissing-prototypes]
     378 | struct mx6s_fmt *format_by_mbus(u32 code)
         |                  ^~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mx6s_capture.c:396:6: warning: no previous prototype for 'csi_clk_enable' [-Wmissing-prototypes]
     396 | void csi_clk_enable(struct mx6s_csi_dev *csi_dev)
         |      ^~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mx6s_capture.c:403:6: warning: no previous prototype for 'csi_clk_disable' [-Wmissing-prototypes]
     403 | void csi_clk_disable(struct mx6s_csi_dev *csi_dev)
         |      ^~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6sx_register_subdevs':
>> drivers/media/platform/mxc/capture/mx6s_capture.c:1792:35: warning: variable 'asd' set but not used [-Wunused-but-set-variable]
    1792 |         struct v4l2_async_subdev *asd;
         |                                   ^~~
--
   drivers/media/platform/mxc/capture/ov5640_v2.c: In function 'ov5640_get_register':
   drivers/media/platform/mxc/capture/ov5640_v2.c:792:28: warning: unused variable 'client' [-Wunused-variable]
     792 |         struct i2c_client *client = v4l2_get_subdevdata(sd);
         |                            ^~~~~~
   drivers/media/platform/mxc/capture/ov5640_v2.c: In function 'ov5640_set_register':
   drivers/media/platform/mxc/capture/ov5640_v2.c:811:28: warning: unused variable 'client' [-Wunused-variable]
     811 |         struct i2c_client *client = v4l2_get_subdevdata(sd);
         |                            ^~~~~~
   drivers/media/platform/mxc/capture/ov5640_v2.c: In function 'init_device':
>> drivers/media/platform/mxc/capture/ov5640_v2.c:1708:32: warning: variable 'frame_rate' set but not used [-Wunused-but-set-variable]
    1708 |         enum ov5640_frame_rate frame_rate;
         |                                ^~~~~~~~~~
>> drivers/media/platform/mxc/capture/ov5640_v2.c:1706:13: warning: variable 'tgt_xclk' set but not used [-Wunused-but-set-variable]
    1706 |         u32 tgt_xclk;   /* target xclk */
         |             ^~~~~~~~


vim +/frame_rate +1708 drivers/media/platform/mxc/capture/ov5640_v2.c

15d73846f70ad8 Robby Cai 2019-09-25  1698  
15d73846f70ad8 Robby Cai 2019-09-25  1699  /*!
15d73846f70ad8 Robby Cai 2019-09-25  1700   * dev_init - V4L2 sensor init
15d73846f70ad8 Robby Cai 2019-09-25  1701   * @s: pointer to standard V4L2 device structure
15d73846f70ad8 Robby Cai 2019-09-25  1702   *
15d73846f70ad8 Robby Cai 2019-09-25  1703   */
15d73846f70ad8 Robby Cai 2019-09-25  1704  static int init_device(void)
15d73846f70ad8 Robby Cai 2019-09-25  1705  {
15d73846f70ad8 Robby Cai 2019-09-25 @1706  	u32 tgt_xclk;	/* target xclk */
15d73846f70ad8 Robby Cai 2019-09-25  1707  	u32 tgt_fps;	/* target frames per secound */
15d73846f70ad8 Robby Cai 2019-09-25 @1708  	enum ov5640_frame_rate frame_rate;
15d73846f70ad8 Robby Cai 2019-09-25  1709  	int ret;
15d73846f70ad8 Robby Cai 2019-09-25  1710  
15d73846f70ad8 Robby Cai 2019-09-25  1711  	ov5640_data.on = true;
15d73846f70ad8 Robby Cai 2019-09-25  1712  
15d73846f70ad8 Robby Cai 2019-09-25  1713  	/* mclk */
15d73846f70ad8 Robby Cai 2019-09-25  1714  	tgt_xclk = ov5640_data.mclk;
15d73846f70ad8 Robby Cai 2019-09-25  1715  
15d73846f70ad8 Robby Cai 2019-09-25  1716  	/* Default camera frame rate is set in probe */
15d73846f70ad8 Robby Cai 2019-09-25  1717  	tgt_fps = ov5640_data.streamcap.timeperframe.denominator /
15d73846f70ad8 Robby Cai 2019-09-25  1718  		  ov5640_data.streamcap.timeperframe.numerator;
15d73846f70ad8 Robby Cai 2019-09-25  1719  
15d73846f70ad8 Robby Cai 2019-09-25  1720  	if (tgt_fps == 15)
15d73846f70ad8 Robby Cai 2019-09-25  1721  		frame_rate = ov5640_15_fps;
15d73846f70ad8 Robby Cai 2019-09-25  1722  	else if (tgt_fps == 30)
15d73846f70ad8 Robby Cai 2019-09-25  1723  		frame_rate = ov5640_30_fps;
15d73846f70ad8 Robby Cai 2019-09-25  1724  	else
15d73846f70ad8 Robby Cai 2019-09-25  1725  		return -EINVAL; /* Only support 15fps or 30fps now. */
15d73846f70ad8 Robby Cai 2019-09-25  1726  
15d73846f70ad8 Robby Cai 2019-09-25  1727  	ret = ov5640_init_mode();
15d73846f70ad8 Robby Cai 2019-09-25  1728  
15d73846f70ad8 Robby Cai 2019-09-25  1729  	return ret;
15d73846f70ad8 Robby Cai 2019-09-25  1730  }
15d73846f70ad8 Robby Cai 2019-09-25  1731  

:::::: The code at line 1708 was first introduced by commit
:::::: 15d73846f70ad81bfd5552f6dd8eb96d520b3b02 media: capture: add ov5640 mipi and parallel driver of subdev version

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
