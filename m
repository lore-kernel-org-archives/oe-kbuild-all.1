Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12893217
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675540316; x=1707076316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VUdGDp28dvLZnZVADUJk+Vg/HJJIpbzHkCmWyXSyKGQ=;
  b=REkC4lroQPLzgUV37EgZXqZnYtwR7XwTH3oIUj2uBGXxvjzuxqLLaw87
   5pn+3fvQ+gBIjuxdWiTVAhmFMCTs88t+gbGmxgicxCLnjixluLleLOhSY
   z4H9sGz130ggCuxUV9/XCyEHYBU1cuEw2lYD8w6Tb/s7NDjXBdyGE0aMf
   rwC/pbiurxP4gGKRBzfiCRTeuD44YIE4nESr98eZlQm+yFm+2OvTwi5sb
   65ovrX0pgTC22PK4qamceSWMJPRdW1qNgC6IJalzgwUADfxPSB4/OEWDx
   GyCtyHDUVjWUBvoSKDXDqbJNNOFmpeRiger9xS2ItkJFWobp8jmMUaU7V
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="326672332"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="326672332"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 11:51:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="734715484"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="734715484"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2023 11:51:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOOZm-0001Vc-2v;
	Sat, 04 Feb 2023 19:51:54 +0000
Date: Sun, 5 Feb 2023 03:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl-media:muxed/2023.1/xilinx/api-updates 63/88]
 drivers/media/platform/xilinx/xilinx-axis-switch.c:371:10: error: 'const
 struct media_entity_operations' has no member named 'has_route'
Message-ID: <202302050311.DQosOyVF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/xilinx/api-updates
head:   4d84aca55464a5384ebfc09558bbc965f6eb5218
commit: d82203157d87cabd7ad7fb53da5398c664831e75 [63/88] Revert "media: entity: Add has_route entity operation"
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302050311.DQosOyVF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/xilinx/api-updates
        git checkout d82203157d87cabd7ad7fb53da5398c664831e75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the pinchartl-media/muxed/2023.1/xilinx/api-updates HEAD 4d84aca55464a5384ebfc09558bbc965f6eb5218 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-axis-switch.c:371:10: error: 'const struct media_entity_operations' has no member named 'has_route'
     371 |         .has_route = xvsw_has_route,
         |          ^~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     371 |         .has_route = xvsw_has_route,
         |                      ^~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: note: (near initialization for 'xvsw_media_ops')
   cc1: some warnings being treated as errors
--
>> drivers/media/platform/xilinx/xilinx-switch.c:331:10: error: 'const struct media_entity_operations' has no member named 'has_route'
     331 |         .has_route = xsw_has_route,
         |          ^~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     331 |         .has_route = xsw_has_route,
         |                      ^~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: note: (near initialization for 'xsw_media_ops')
   cc1: some warnings being treated as errors


vim +371 drivers/media/platform/xilinx/xilinx-axis-switch.c

789f326f453f86 Vishal Sagar 2018-08-14  368  
789f326f453f86 Vishal Sagar 2018-08-14  369  static const struct media_entity_operations xvsw_media_ops = {
789f326f453f86 Vishal Sagar 2018-08-14  370  	.link_validate = v4l2_subdev_link_validate,
789f326f453f86 Vishal Sagar 2018-08-14 @371  	.has_route = xvsw_has_route,
789f326f453f86 Vishal Sagar 2018-08-14  372  };
789f326f453f86 Vishal Sagar 2018-08-14  373  

:::::: The code at line 371 was first introduced by commit
:::::: 789f326f453f8641e69a8684c7349580213067f8 v4l: xilinx: Driver support for Xilinx AXI4-Stream Switch

:::::: TO: Vishal Sagar <vishal.sagar@xilinx.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
