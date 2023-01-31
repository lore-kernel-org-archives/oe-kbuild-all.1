Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F93179CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675175342; x=1706711342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vMhseFPrypW6mUB+jHPspCEzSHqzj3/+AjxwfiqFYU=;
  b=DQ+Plj5uzD0mCA0bJi9Fjrxt6C2aGUAv9e8WYxAELA882fB8edKZxiP3
   wxDZShwX3fBzfhhY+BU1kEM0uxOT7QUzbx+MO6ftiGSwzJR81W/tNQJ2A
   9z5CjMOXd1ccSF3nSFpBpWdnTRHlcU3r3KYMuSn5P4ZLNPU/Zzv6kyrXh
   TCKdQype61gRhhOiEcZAOQc6UM+7vFgbV5m3gNbjDszKEhZBu8hiKZnER
   Ih/+CsSFrPgGt/buBUgeNBSwoIJ/I3adfrShr65RAhsF0RAOPfek0sLFl
   jCgYZgpSjCsyJp22RxeKi1HyNJh+wBTr3uF3CUQwGVregSjgG+bS3iPUi
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392404403"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="392404403"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 06:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="773002210"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="773002210"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2023 06:29:00 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMrd1-0004TY-0s;
	Tue, 31 Jan 2023 14:28:55 +0000
Date: Tue, 31 Jan 2023 22:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl-media:muxed/2023.1/xilinx/api-updates 63/88]
 drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: error: positional
 initialization of field in 'struct' declared with 'designated_init'
 attribute
Message-ID: <202301312250.zoRPwhsu-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230131/202301312250.zoRPwhsu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/xilinx/api-updates
        git checkout d82203157d87cabd7ad7fb53da5398c664831e75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the pinchartl-media/muxed/2023.1/xilinx/api-updates HEAD 4d84aca55464a5384ebfc09558bbc965f6eb5218 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:10: error: 'const struct media_entity_operations' has no member named 'has_route'
     371 |         .has_route = xvsw_has_route,
         |          ^~~~~~~~~
>> drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     371 |         .has_route = xvsw_has_route,
         |                      ^~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: note: (near initialization for 'xvsw_media_ops')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: error: initialization of 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, u32)' {aka 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, unsigned int)'} from incompatible pointer type 'bool (*)(struct media_entity *, unsigned int,  unsigned int)' {aka '_Bool (*)(struct media_entity *, unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: note: (near initialization for 'xvsw_media_ops.link_setup')
   cc1: some warnings being treated as errors
--
   drivers/media/platform/xilinx/xilinx-switch.c:331:10: error: 'const struct media_entity_operations' has no member named 'has_route'
     331 |         .has_route = xsw_has_route,
         |          ^~~~~~~~~
>> drivers/media/platform/xilinx/xilinx-switch.c:331:22: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     331 |         .has_route = xsw_has_route,
         |                      ^~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: note: (near initialization for 'xsw_media_ops')
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: error: initialization of 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, u32)' {aka 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, unsigned int)'} from incompatible pointer type 'bool (*)(struct media_entity *, unsigned int,  unsigned int)' {aka '_Bool (*)(struct media_entity *, unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: note: (near initialization for 'xsw_media_ops.link_setup')
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
