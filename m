Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6762ECE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677522715; x=1709058715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BMfAM8568QcBjH2ZXe8+oEHoddFunLvoc1fP1nQLYbw=;
  b=crPoapfySKgz7pHHeJry7PZt+E2N+xxO7CR59yotLhRlKanxeAM994YV
   RJ03yPikao5Iy3dh0yMtsL6s6z4BtLk91X54Yzs9g0BV56IrV2esYat+R
   +A1vG8bVNpbJboZXKvLdBJ7AsZi6cyOHP+rXDpKuY90G3mA9QWfQchoGS
   N+izKp8FlCSrI6uxBOs3seK81zYKRr1V397/lTXhhk7RrRejpDBLO4vgY
   XZAFXDMAGCwFM1lJ7Dq562ksghkYpexJVG75cTIKyxO4JHzcUCD7YkF+U
   8U9SJm0QuWlOMFRJh9GZ+D8Eng0Ml62SvJLgbxK3OEqMtbx9dEROzOtiB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398710442"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="398710442"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 10:31:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="742673238"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="742673238"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Feb 2023 10:31:54 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWiHx-0004fj-1O;
	Mon, 27 Feb 2023 18:31:53 +0000
Date: Tue, 28 Feb 2023 02:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 312/583]
 drivers/staging/fbtft/fb_st7735r.c:189:5: warning: no previous prototype for
 'variant_adafruit18'
Message-ID: <202302280235.J0oUTufb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: 5b4633cd65ca53a07dca6892c593862589b51249 [312/583] staging/fbtft: Add support for display variants
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230228/202302280235.J0oUTufb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/5b4633cd65ca53a07dca6892c593862589b51249
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 5b4633cd65ca53a07dca6892c593862589b51249
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/char/broadcom/ drivers/gpio/ drivers/media/i2c/ drivers/staging/fbtft/ drivers/staging/vc04_services/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280235.J0oUTufb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/fbtft/fb_st7735r.c:189:5: warning: no previous prototype for 'variant_adafruit18' [-Wmissing-prototypes]
     189 | int variant_adafruit18(struct fbtft_display *display)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fb_st7735r.c:195:5: warning: no previous prototype for 'variant_adafruit18_green' [-Wmissing-prototypes]
     195 | int variant_adafruit18_green(struct fbtft_display *display)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_TLV320AIC32X4_I2C
   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && I2C [=m] && COMMON_CLK [=n]
   Selected by [m]:
   - SND_AUDIOSENSE_PI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   WARNING: unmet direct dependencies detected for COMMON_CLK_HIFIBERRY_DACPRO
   Depends on [n]: COMMON_CLK [=n]
   Selected by [m]:
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUS [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSADC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSADCPRO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   WARNING: unmet direct dependencies detected for COMMON_CLK_HIFIBERRY_DACPLUSHD
   Depends on [n]: COMMON_CLK [=n]
   Selected by [m]:
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSHD [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])


vim +/variant_adafruit18 +189 drivers/staging/fbtft/fb_st7735r.c

   188	
 > 189	int variant_adafruit18(struct fbtft_display *display)
   190	{
   191		display->gamma = ADAFRUIT18_GAMMA;
   192		return 0;
   193	}
   194	
 > 195	int variant_adafruit18_green(struct fbtft_display *display)
   196	{
   197		display->gamma = ADAFRUIT18_GAMMA;
   198		display->fbtftops.set_addr_win = adafruit18_green_tab_set_addr_win;
   199		return 0;
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
