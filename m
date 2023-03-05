Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB23C02
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 19:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678045962; x=1709581962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cC8isjC7Kbj63GFIhJjOvNrN1rtwSSGWMuotUcDj6Kk=;
  b=if4e740JjI6NWXiaAlvZXSQKsqTEg5PcJbaG1+WqKNX2+6ec7csEv8fL
   zYuLoGMg2e+EsoWHlpgZ+LtTy9lz93nocxZ1uNvw5+ZIH4gbCXwbg1XMH
   yHdsWCFGf/tAUejeowQDt6VUhSrsRzSzr4XzvGGGdOV6a34FPw4qsj4QA
   vvTFwvtXssSfsLqIw1f8lEFZh2bsMRhyRY2tU3PUUWp8obB0E6oAcMf/e
   MmDep3blbL1rxJM9e4BXVRusxaBXO6P8Fch0F+h1Ia2s1dRJ4b856Fc0L
   cpv5f0+ALDEv4JjXOAsPoqtXR8oXPrQC1pW9cIYHKih04SIgvBCzPglyc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="319240918"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="319240918"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 11:52:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="799794252"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="799794252"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Mar 2023 11:52:40 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYuPQ-00030U-0l;
	Sun, 05 Mar 2023 19:52:40 +0000
Date: Mon, 6 Mar 2023 03:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>
Subject: [stable:linux-5.15.y 1053/9999] ia64-linux-ld:
 drm_fb_helper.c:undefined reference to `framebuffer_release'
Message-ID: <202303060311.ovVYS4q1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d9b4a0c83a2d405dd85bf32d672686146b9bedff
commit: 81e5b16de862866e7f09a1b00b49f97a9bc23a78 [1053/9999] platform: chrome: Split trace include file
config: ia64-randconfig-c023-20230305 (https://download.01.org/0day-ci/archive/20230306/202303060311.ovVYS4q1-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=81e5b16de862866e7f09a1b00b49f97a9bc23a78
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 81e5b16de862866e7f09a1b00b49f97a9bc23a78
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303060311.ovVYS4q1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
   drm_fb_helper.c:(.text+0x692): undefined reference to `fb_set_suspend'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
   drm_fb_helper.c:(.text+0x6f2): undefined reference to `fb_set_suspend'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
   drm_fb_helper.c:(.text+0x872): undefined reference to `unregister_framebuffer'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_read':
   drm_fb_helper.c:(.text+0x8c2): undefined reference to `fb_sys_read'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fini':
   drm_fb_helper.c:(.text+0x2842): undefined reference to `fb_dealloc_cmap'
>> ia64-linux-ld: drm_fb_helper.c:(.text+0x2852): undefined reference to `framebuffer_release'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
   drm_fb_helper.c:(.text+0x2dc2): undefined reference to `framebuffer_alloc'
>> ia64-linux-ld: drm_fb_helper.c:(.text+0x2e02): undefined reference to `fb_alloc_cmap'
   ia64-linux-ld: drm_fb_helper.c:(.text+0x2e42): undefined reference to `framebuffer_release'
>> ia64-linux-ld: drm_fb_helper.c:(.text+0x2ed2): undefined reference to `fb_dealloc_cmap'
   ia64-linux-ld: drm_fb_helper.c:(.text+0x2ee2): undefined reference to `framebuffer_release'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_generic_probe':
   drm_fb_helper.c:(.text+0x31b2): undefined reference to `fb_deferred_io_init'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
   drm_fb_helper.c:(.text+0x3442): undefined reference to `register_framebuffer'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend_unlocked':
   drm_fb_helper.c:(.text+0x3dd2): undefined reference to `fb_set_suspend'
>> ia64-linux-ld: drm_fb_helper.c:(.text+0x3e32): undefined reference to `fb_set_suspend'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_write':
   drm_fb_helper.c:(.text+0x53e2): undefined reference to `fb_sys_write'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
   drm_fb_helper.c:(.text+0x5482): undefined reference to `sys_fillrect'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
   drm_fb_helper.c:(.text+0x5522): undefined reference to `sys_copyarea'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
>> drm_fb_helper.c:(.text+0x55c2): undefined reference to `sys_imageblit'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
   drm_fb_helper.c:(.text+0x5662): undefined reference to `cfb_fillrect'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
   drm_fb_helper.c:(.text+0x5702): undefined reference to `cfb_copyarea'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_imageblit':
   drm_fb_helper.c:(.text+0x57a2): undefined reference to `cfb_imageblit'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_copyarea':
   drm_fb_helper.c:(.text+0x5872): undefined reference to `cfb_copyarea'
>> ia64-linux-ld: drm_fb_helper.c:(.text+0x58e2): undefined reference to `sys_copyarea'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_fillrect':
   drm_fb_helper.c:(.text+0x59b2): undefined reference to `cfb_fillrect'
>> ia64-linux-ld: drm_fb_helper.c:(.text+0x5a22): undefined reference to `sys_fillrect'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_imageblit':
   drm_fb_helper.c:(.text+0x5af2): undefined reference to `cfb_imageblit'
>> ia64-linux-ld: drm_fb_helper.c:(.text+0x5b62): undefined reference to `sys_imageblit'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_cleanup':
   drm_fb_helper.c:(.text+0x61e2): undefined reference to `fb_deferred_io_cleanup'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_client_unregister':
   drm_fb_helper.c:(.text+0x63c2): undefined reference to `unregister_framebuffer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
