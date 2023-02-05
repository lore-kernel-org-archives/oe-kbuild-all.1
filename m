Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780F11365
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 02:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675565047; x=1707101047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nTuhkjVA2QJfzEZavCm1R7PRm2Xn25LZ6jBoagXzuCg=;
  b=FO/jD0jogxzOq1HepZ3jmF2szAaDMmlp1Zg9ktJ21Ur0Hh9vFcFi5kGK
   cmNfyTqNDNFOMcA7YkcjG83+UeLgbfzHXPavHntHEXgp+PffqhXfkZRZl
   o+tEdKXZZBSNbYk4CATgz7UGEL5yuyMOVSL6NjYcH+DFSic8flwjSOLnw
   UhDrVetXodR6iwVya2UqSZ732khe4Hxljfy9bc/r6VLT5XYJ5XKRsJ7Z4
   Te4xbpIelnxkV6WBLl6JVQUfNNtLImGZWapaoO0DJY5mOsVPqJeU7H9dN
   U5dY0YAgK22tT+LORozwhec0xPECstVlr9RnEC8W10wDtppv0jjMh3TS0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415228924"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="415228924"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 18:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="808754358"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="808754358"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2023 18:44:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOV0f-0001gT-0d;
	Sun, 05 Feb 2023 02:44:05 +0000
Date: Sun, 5 Feb 2023 10:43:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 488/20209]
 drivers/media/platform/mxc/capture/mx6s_capture.c:1788:35: warning: variable
 'asd' set but not used
Message-ID: <202302051001.TK3LmEGx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guoniu.zhou,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: e5b695af78fbb7554a60dc336f5c003cdee0e605 [488/20209] LF-3583-02: media: mx6s_capture: fix api change issue due to kernel upgrade
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302051001.TK3LmEGx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/e5b695af78fbb7554a60dc336f5c003cdee0e605
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout e5b695af78fbb7554a60dc336f5c003cdee0e605
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/mxc/capture/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/imx/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mx6s_capture.c:365:18: warning: no previous prototype for 'format_by_fourcc' [-Wmissing-prototypes]
     365 | struct mx6s_fmt *format_by_fourcc(int fourcc)
         |                  ^~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:378:18: warning: no previous prototype for 'format_by_mbus' [-Wmissing-prototypes]
     378 | struct mx6s_fmt *format_by_mbus(u32 code)
         |                  ^~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:396:6: warning: no previous prototype for 'csi_clk_enable' [-Wmissing-prototypes]
     396 | void csi_clk_enable(struct mx6s_csi_dev *csi_dev)
         |      ^~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:403:6: warning: no previous prototype for 'csi_clk_disable' [-Wmissing-prototypes]
     403 | void csi_clk_disable(struct mx6s_csi_dev *csi_dev)
         |      ^~~~~~~~~~~~~~~
   In file included from include/media/v4l2-device.h:13,
                    from drivers/media/platform/mxc/capture/mx6s_capture.c:44:
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6s_vidioc_g_parm':
   include/media/v4l2-subdev.h:1185:56: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1185 |                 else if (!(__sd->ops->o && __sd->ops->o->f))            \
         |                                                        ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1597:16: note: in expansion of macro 'v4l2_subdev_call'
    1597 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1188:53: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1188 |                          v4l2_subdev_call_wrappers.o->f)                \
         |                                                     ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1597:16: note: in expansion of macro 'v4l2_subdev_call'
    1597 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1189:63: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1189 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                                               ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1597:16: note: in expansion of macro 'v4l2_subdev_call'
    1597 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1192:48: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1192 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1597:16: note: in expansion of macro 'v4l2_subdev_call'
    1597 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6s_vidioc_s_parm':
   include/media/v4l2-subdev.h:1185:56: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1185 |                 else if (!(__sd->ops->o && __sd->ops->o->f))            \
         |                                                        ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1606:16: note: in expansion of macro 'v4l2_subdev_call'
    1606 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1188:53: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1188 |                          v4l2_subdev_call_wrappers.o->f)                \
         |                                                     ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1606:16: note: in expansion of macro 'v4l2_subdev_call'
    1606 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1189:63: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1189 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                                               ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1606:16: note: in expansion of macro 'v4l2_subdev_call'
    1606 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1192:48: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1192 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1606:16: note: in expansion of macro 'v4l2_subdev_call'
    1606 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6sx_register_subdevs':
>> drivers/media/platform/mxc/capture/mx6s_capture.c:1788:35: warning: variable 'asd' set but not used [-Wunused-but-set-variable]
    1788 |         struct v4l2_async_subdev *asd;
         |                                   ^~~


vim +/asd +1788 drivers/media/platform/mxc/capture/mx6s_capture.c

  1783	
  1784	static int mx6sx_register_subdevs(struct mx6s_csi_dev *csi_dev)
  1785	{
  1786		struct device_node *parent = csi_dev->dev->of_node;
  1787		struct device_node *node, *port, *rem;
> 1788		struct v4l2_async_subdev *asd;
  1789		int ret;
  1790	
  1791		v4l2_async_notifier_init(&csi_dev->subdev_notifier);
  1792	
  1793		/* Attach sensors linked to csi receivers */
  1794		for_each_available_child_of_node(parent, node) {
  1795			if (of_node_cmp(node->name, "port"))
  1796				continue;
  1797	
  1798			/* The csi node can have only port subnode. */
  1799			port = of_get_next_child(node, NULL);
  1800			if (!port)
  1801				continue;
  1802			rem = of_graph_get_remote_port_parent(port);
  1803			of_node_put(port);
  1804			if (rem == NULL) {
  1805				v4l2_info(&csi_dev->v4l2_dev,
  1806							"Remote device at %s not found\n",
  1807							port->full_name);
  1808				return -1;
  1809			}
  1810	
  1811			csi_dev->fwnode = of_fwnode_handle(rem);
  1812			asd = v4l2_async_notifier_add_fwnode_subdev(
  1813						&csi_dev->subdev_notifier,
  1814						csi_dev->fwnode,
  1815						struct v4l2_async_subdev);
  1816			of_node_put(rem);
  1817			break;
  1818		}
  1819	
  1820		csi_dev->subdev_notifier.ops = &mx6s_capture_async_ops;
  1821	
  1822		ret = v4l2_async_notifier_register(&csi_dev->v4l2_dev,
  1823						&csi_dev->subdev_notifier);
  1824		if (ret)
  1825			dev_err(csi_dev->dev,
  1826						"Error register async notifier regoster\n");
  1827	
  1828		return ret;
  1829	}
  1830	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
