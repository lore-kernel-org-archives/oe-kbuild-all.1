Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5823DF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685648024; x=1717184024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kcZJ3+qNx8leUOO/Kenv3qu0LykWwuGfFkR6Pl0R91o=;
  b=P7QTluoQunPczejNMgWKBU6JPe3DE6Pi6bNftviYP6bhupe7nGzRNyy7
   jQcYn6PemGEvbKeUVkhWtLVfKvDbecnFTjCv7LIs6MNbM126TcXwRw0zO
   PWAOdHYy/0T1Z7kUH0P0kQP92eGHoUfL4w8Zhkpr3x5fFT/UGO5s0vuXx
   aSK3X7aAmEHDVgZCsJnEYcInsDTyO318hdehJoqTob3rYbWB3kprbJNUr
   u33vNqmHLqGG9H31epSfGI7Vs/DLKRGH+eNJmjABSfWDdD/5Rq3Wdcwqh
   YwJn5zKREIAJVDimGT85Ef9nRpmylUlAsmtgvz/eP9cnfmozCbo60udw4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353158102"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="353158102"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 12:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="819954904"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="819954904"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 12:33:39 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4o3H-0002do-0N;
	Thu, 01 Jun 2023 19:33:39 +0000
Date: Fri, 2 Jun 2023 03:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Amarula patchwork <linux-amarula@amarulasolutions.com>,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/panel: simple: add support for Rocktech
 RK043FN48H panel
Message-ID: <202306020343.jNTWeM0P-lkp@intel.com>
References: <20230601170320.2845218-6-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601170320.2845218-6-dario.binacchi@amarulasolutions.com>

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on drm-tip/drm-tip linus/master v6.4-rc4 next-20230601]
[cannot apply to atorgue-stm32/stm32-next drm-misc/drm-misc-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/ARM-dts-stm32-add-ltdc-support-on-stm32f746-MCU/20230602-010536
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20230601170320.2845218-6-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH 5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306020343.jNTWeM0P-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5a692e898df9428078855c58f8e945def084613b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dario-Binacchi/ARM-dts-stm32-add-ltdc-support-on-stm32f746-MCU/20230602-010536
        git checkout 5a692e898df9428078855c58f8e945def084613b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020343.jNTWeM0P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-simple.c:3201:68: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    3201 |         .flags = DISPLAY_FLAGS_VSYNC_LOW + DISPLAY_FLAGS_HSYNC_LOW |
         |                                                                    ^


vim +3201 drivers/gpu/drm/panel/panel-simple.c

  3190	
  3191	static const struct display_timing rocktech_rk043fn48h_timing = {
  3192		.pixelclock = { 6000000, 9000000, 12000000 },
  3193		.hactive = { 480, 480, 480 },
  3194		.hback_porch = { 8, 43, 43 },
  3195		.hfront_porch = { 2, 8, 8 },
  3196		.hsync_len = { 1, 1, 1 },
  3197		.vactive = { 272, 272, 272 },
  3198		.vback_porch = { 2, 12, 12 },
  3199		.vfront_porch = { 1, 4, 4 },
  3200		.vsync_len = { 1, 10, 10 },
> 3201		.flags = DISPLAY_FLAGS_VSYNC_LOW + DISPLAY_FLAGS_HSYNC_LOW |
  3202			 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
  3203	};
  3204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
