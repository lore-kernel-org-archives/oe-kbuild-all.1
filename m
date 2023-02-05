Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2551323B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675589718; x=1707125718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h0qVp0og/Xy1YTsZfv8638LdWKF948hOiFU5qT9yfKg=;
  b=ntWPCfjedUO9sn6r1O9sKtoSs5XbXbtIoVx357FVj1oEkRx8gm7aj89x
   SUY3rKBhbSAVy6hNjDtm6niiFZYkcpL3lcRVvAScKuci5f83i36Cc7Wlj
   mJ4yNlb5P9StZoV8AnRxCZTjr2tNzHM1WYlLE9Sd5IbzwkVdBbFKezNq0
   Qo4TMTUCTgb9CnGpTBEFVOKAM2zBsIdqJhGJkGIBXIJiV0dKanpmywMMA
   59yX0MsKeN1yVTvczuEQ1y4sCUsMpHKNbR8ssowOjVptMYmJ89Q5z1I4q
   TQBytiANVwp5VFWV0ba/W4AJDcBjaZDXQb3fgp+Ky+o23fsHgh8WujSaL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317035957"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="317035957"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 01:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="668123013"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="668123013"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Feb 2023 01:35:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pObQZ-0001uW-12;
	Sun, 05 Feb 2023 09:35:15 +0000
Date: Sun, 5 Feb 2023 17:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 455/20209]
 drivers/staging/media/imx/imx8-media-dev.c:724:1: warning: no previous
 prototype for 'mxc_md_parse_hdmi_rx_entity'
Message-ID: <202302051711.Z70j7aiS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandor,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 020d53673a4296faf233a8e38a338af52903bae1 [455/20209] MLK-24081-04: staging: media: imx_csi: support hdmi rx for imx8qm
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302051711.Z70j7aiS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/020d53673a4296faf233a8e38a338af52903bae1
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 020d53673a4296faf233a8e38a338af52903bae1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/imx/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-media-dev.c:622:6: warning: no previous prototype for 'mxc_sensor_notify' [-Wmissing-prototypes]
     622 | void mxc_sensor_notify(struct v4l2_subdev *sd, unsigned int notification,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-media-dev.c:724:1: warning: no previous prototype for 'mxc_md_parse_hdmi_rx_entity' [-Wmissing-prototypes]
     724 | mxc_md_parse_hdmi_rx_entity(struct mxc_md *mxc_md, struct device_node *node)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-media-dev.c: In function 'register_sensor_entities':
   drivers/staging/media/imx/imx8-media-dev.c:966:25: error: implicit declaration of function 'v4l2_async_notifier_add_subdev'; did you mean 'v4l2_async_notifier_add_i2c_subdev'? [-Werror=implicit-function-declaration]
     966 |                         v4l2_async_notifier_add_subdev(&mxc_md->subdev_notifier,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         v4l2_async_notifier_add_i2c_subdev
   cc1: some warnings being treated as errors


vim +/mxc_md_parse_hdmi_rx_entity +724 drivers/staging/media/imx/imx8-media-dev.c

   722	
   723	struct mxc_hdmi_rx_info*
 > 724	mxc_md_parse_hdmi_rx_entity(struct mxc_md *mxc_md, struct device_node *node)
   725	{
   726		struct mxc_hdmi_rx_info *hdmi_rx;
   727	
   728		if (!mxc_md || !node)
   729			return NULL;
   730	
   731		hdmi_rx = &mxc_md->hdmi_rx;
   732		if (!hdmi_rx)
   733			return NULL;
   734	
   735		hdmi_rx->node = node;
   736		sprintf(hdmi_rx->sd_name, "mxc-hdmi-rx");
   737	
   738		return hdmi_rx;
   739	}
   740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
