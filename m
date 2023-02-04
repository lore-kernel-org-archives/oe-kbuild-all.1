Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823231FB7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675509650; x=1707045650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5XTHHm4rruIQ7Bkgk1G1i7oLwOYOibx0lxIvzDIhox8=;
  b=eWg+d1I857fOq7bjeWlLSx2K7I84RZu9SkyxP5rkHDe0WGkTTJWfL6iO
   qEWw1QFo+uyZ9Ljsgl/eizI/mnyfj7NSCZNCA6Vc0wHWf8myz/uWc4Cjw
   3zToAhsqqtsHN060nBaAXemaj7v7Cfn1tP31/qLJ6dihwcPPCl2T00F68
   uesEXP++/11vwZCXFtZMcEonCzslZJkoXUT/gVS6AC3RfNqHdTRvqB8s4
   CxHagqQGJqEpgN2qoUe6X/7XZ2dWAUOekzW0oBnlqdAYP6wpi/JSit1wU
   CvHmCNxBUSmhpaFktJWiAzAt8CvUXTrHG7MykuX0T4fJ3CJoGSM2FrvLa
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="308577959"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="308577959"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 03:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789968515"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="789968515"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Feb 2023 03:20:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOGb3-0001GW-2E;
	Sat, 04 Feb 2023 11:20:41 +0000
Date: Sat, 4 Feb 2023 19:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 135/20209]
 sound/soc/fsl/fsl_xcvr_sysfs.c:106:31: warning: old-style function
 definition
Message-ID: <202302041957.5ZBoyOn3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viorel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 63a55b587dc56c1621aeea7bed86c56c75f98fa5 [135/20209] MLK-24965: ASoC: fsl_xcvr: bit and timestamp counters
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302041957.5ZBoyOn3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/63a55b587dc56c1621aeea7bed86c56c75f98fa5
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 63a55b587dc56c1621aeea7bed86c56c75f98fa5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/backlight/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/fsl/fsl_xcvr_sysfs.c: In function 'fsl_xcvr_get_attr_grp':
>> sound/soc/fsl/fsl_xcvr_sysfs.c:106:31: warning: old-style function definition [-Wold-style-definition]
     106 | const struct attribute_group *fsl_xcvr_get_attr_grp()
         |                               ^~~~~~~~~~~~~~~~~~~~~


vim +106 sound/soc/fsl/fsl_xcvr_sysfs.c

   105	
 > 106	const struct attribute_group *fsl_xcvr_get_attr_grp()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
