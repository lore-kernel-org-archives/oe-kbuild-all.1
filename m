Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF766FC2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674129960; x=1705665960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IFvVKeRwpMpn4nhTLJ81A/Vz/pqYQDQnps5b5+DGV0U=;
  b=eJxsnuFH9mBsJ02LX8aK1bsOJtJcoqVHUc9+pWigH1YFPDJzGZUdGBhj
   29ekMhmh+H6VflbGY/yOG5edZdTkuVJixwJPbuCgujwKmpsyG3PnKyDcU
   u9ZVZTR+2KJxpo/tMv4JgmODxSfHUNoS5M2LrNTRhvQpbkf+2HOygU9rX
   Et3qehf9G6DYE78aCbz+0TmiOY8L4J5hreF6fyPz6xkt9gn/n7JxoPQXc
   fi+E3FdDPvrL36bgoDdicslLlSjUmnozzqFPmz9FMthhdkPOEHA9LPegG
   nkSDTOwda0CnSfQJ1eBg+GnKmDC5yBITIm9gIN/Lhh73o1PCjJN781GNY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411504498"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="411504498"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 04:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="690604430"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="690604430"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 04:05:49 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pITfx-0001Qy-0l;
	Thu, 19 Jan 2023 12:05:49 +0000
Date: Thu, 19 Jan 2023 20:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: [drm-misc:drm-misc-next 3/7]
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:249:12: warning: 'ret' is
 used uninitialized
Message-ID: <202301191956.s3AcGxpU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   852be13f3bd32c1eab808840cfac41b1fea25991
commit: 9402cde9347eca050e14ea9e47270e84a6899162 [3/7] drm/panel: vtdr6130: Use 16-bit brightness function
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230119/202301191956.s3AcGxpU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout 9402cde9347eca050e14ea9e47270e84a6899162
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/panel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c: In function 'visionox_vtdr6130_bl_update_status':
>> drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:249:12: warning: 'ret' is used uninitialized [-Wuninitialized]
     249 |         if (ret < 0)
         |            ^
   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:246:13: note: 'ret' was declared here
     246 |         int ret;
         |             ^~~


vim +/ret +249 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c

2349183d32d83a Neil Armstrong 2023-01-09  241  
2349183d32d83a Neil Armstrong 2023-01-09  242  static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
2349183d32d83a Neil Armstrong 2023-01-09  243  {
2349183d32d83a Neil Armstrong 2023-01-09  244  	struct mipi_dsi_device *dsi = bl_get_data(bl);
2349183d32d83a Neil Armstrong 2023-01-09  245  	u16 brightness = backlight_get_brightness(bl);
2349183d32d83a Neil Armstrong 2023-01-09  246  	int ret;
2349183d32d83a Neil Armstrong 2023-01-09  247  
9402cde9347eca Richard Acayan 2023-01-16  248  	mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
2349183d32d83a Neil Armstrong 2023-01-09 @249  	if (ret < 0)
2349183d32d83a Neil Armstrong 2023-01-09  250  		return ret;
2349183d32d83a Neil Armstrong 2023-01-09  251  
2349183d32d83a Neil Armstrong 2023-01-09  252  	return 0;
2349183d32d83a Neil Armstrong 2023-01-09  253  }
2349183d32d83a Neil Armstrong 2023-01-09  254  

:::::: The code at line 249 was first introduced by commit
:::::: 2349183d32d83a7635baa804934813bcad13fd62 drm/panel: add visionox vtdr6130 DSI panel driver

:::::: TO: Neil Armstrong <neil.armstrong@linaro.org>
:::::: CC: Neil Armstrong <neil.armstrong@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
