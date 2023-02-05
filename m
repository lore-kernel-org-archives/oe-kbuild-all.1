Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA617B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 07:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675581673; x=1707117673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ekDhsCO37kcx9DH+N6LG1BEGmmaoB3vsmLx+CZjvOPs=;
  b=BlHXt9gIHaW+Yolygf7p0FXklXwW08Og34i4TltNo0OdBYaIGstzycLb
   FEVgpW/jCC6cYFyJH5rfiHhq0EvQg8WzUBrByOkQW4ixuls9VSMyDMhtx
   cTVQAuaDdBg0IpatGdIZyS15JX0/a1VUgUj7/7JyoAZQOwYscsY9slLrR
   I7S4H7Kma6hZ+lS4X0tJ2/zZAtvywo0Cz+E1JwaMRHBUBEprDDzWuVfw/
   lzCIGcjsp4ND6F9SiSzZt8SIS14oxACXKrkGKyNT6lU4SE/x0NwkQ08zH
   QB3bJvZ7Cwoi6BSO9xDoKZYlbhACneiLNGZAmTefs4HHsC5yXtdiwAQ4P
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317028252"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="317028252"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 23:21:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="659534993"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="659534993"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Feb 2023 23:21:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOZKp-0001p1-2X;
	Sun, 05 Feb 2023 07:21:11 +0000
Date: Sun, 5 Feb 2023 15:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 452/20209]
 drivers/staging/media/imx/imx8-media-dev.c:597:6: warning: no previous
 prototype for 'mxc_sensor_notify'
Message-ID: <202302051527.m7D2vn0N-lkp@intel.com>
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
commit: a074276e6f239ba169642b29829a895966ccc2ee [452/20209] media: staging: imx: add media device driver support for IMX8
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302051527.m7D2vn0N-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/a074276e6f239ba169642b29829a895966ccc2ee
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout a074276e6f239ba169642b29829a895966ccc2ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/imx/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/imx8-media-dev.c:597:6: warning: no previous prototype for 'mxc_sensor_notify' [-Wmissing-prototypes]
     597 | void mxc_sensor_notify(struct v4l2_subdev *sd, unsigned int notification,
         |      ^~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-media-dev.c: In function 'register_sensor_entities':
   drivers/staging/media/imx/imx8-media-dev.c:943:17: error: implicit declaration of function 'v4l2_async_notifier_add_subdev'; did you mean 'v4l2_async_notifier_add_i2c_subdev'? [-Werror=implicit-function-declaration]
     943 |                 v4l2_async_notifier_add_subdev(&mxc_md->subdev_notifier,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 v4l2_async_notifier_add_i2c_subdev
   cc1: some warnings being treated as errors


vim +/mxc_sensor_notify +597 drivers/staging/media/imx/imx8-media-dev.c

   596	
 > 597	void mxc_sensor_notify(struct v4l2_subdev *sd, unsigned int notification,
   598			       void *arg)
   599	{
   600	}
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
