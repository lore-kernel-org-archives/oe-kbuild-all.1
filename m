Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276B07E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 19:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677181399; x=1708717399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QVlYkVJIqpraf4Xg71ONopYyEBeqdlzbdvYeKPrx3Tw=;
  b=EELaQyB2Nf4HV06HkyVFuOX9NzH6pMi5BDamSJduSXTYNPrh6OcshaqI
   Y7FSZCXip0MI1f3cGgojMs1yGcHHwrxJ5dde9LKnhrt9DGU+K+xoBkmwy
   ETvW5PUTS7T8hIpffXZZtAsc4NV42DEvY5m2IsqChGaPfYAohAft1SJYf
   UJBEbbcXR1aaIZNSqPQxTK6wJ+jOvSMAiUHkSXZrFRCOS2xL5nAYWKXwf
   dASgBbtAb9xA4rLdopUED6p8sRnoEAQ5HSkUsQnVjxLTzjkX5BliBHpaA
   AFP7HlS3GEbDmWJRzRdV4K8EwLMNxeN0vzRCc4JFvjgcoyroEO7IFO+iW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="419540128"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="419540128"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 11:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="650101726"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="650101726"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Feb 2023 11:43:17 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVHUq-0001gY-1Z;
	Thu, 23 Feb 2023 19:43:16 +0000
Date: Fri, 24 Feb 2023 03:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.2.y 17/63]
 drivers/gpu/drm/tiny/ili9488_pio.c:23:10: fatal error:
 drm/drm_fb_cma_helper.h: No such file or directory
Message-ID: <202302240340.QSRqFjxt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.2.y
head:   30c0eb0e7216c96ef26210d2d461087b772c80a6
commit: f277036a29721a1f62ed04242cbf6d9668f3d2c9 [17/63] ODROID-COMMON: gpu/drm: Add new Tiny DRM driver with Ili9488
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302240340.QSRqFjxt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/tobetter/linux/commit/f277036a29721a1f62ed04242cbf6d9668f3d2c9
        git remote add tobetter https://github.com/tobetter/linux
        git fetch --no-tags tobetter odroid-6.2.y
        git checkout f277036a29721a1f62ed04242cbf6d9668f3d2c9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240340.QSRqFjxt-lkp@intel.com/

Note: the tobetter/odroid-6.2.y HEAD 30c0eb0e7216c96ef26210d2d461087b772c80a6 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/ili9488_pio.c:23:10: fatal error: drm/drm_fb_cma_helper.h: No such file or directory
      23 | #include <drm/drm_fb_cma_helper.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +23 drivers/gpu/drm/tiny/ili9488_pio.c

    19	
    20	#include <drm/drm_atomic_helper.h>
    21	#include <drm/drm_damage_helper.h>
    22	#include <drm/drm_drv.h>
  > 23	#include <drm/drm_fb_cma_helper.h>
    24	#include <drm/drm_fb_helper.h>
    25	#include <drm/drm_fourcc.h>
    26	#include <drm/drm_gem_atomic_helper.h>
    27	#include <drm/drm_gem_cma_helper.h>
    28	#include <drm/drm_gem_framebuffer_helper.h>
    29	#include <drm/drm_managed.h>
    30	#include <drm/drm_mipi_dbi.h>
    31	#include <drm/drm_rect.h>
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
