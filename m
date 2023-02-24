Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A26196
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 00:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677199170; x=1708735170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9aGu+s/CxA8JJuuo/BwjUWrZDMi/GxvggikqyQJBo0=;
  b=EweDpCnPcKgHbR6jpwFBtojE4ixGO3IhFhnEvKUAKmLCEhXJdxWdBqjC
   8bF0hobuIqG85+Vi+rOpwGrHQvV+A38UP5ko5wAKJOJJLmmyeRyMOZ7ew
   9OirNbXZ2sufYsaYOsfb4LE9Lh89aEiiVd13z9/g13UgPMHeHOBc0OiJH
   d8MQKrsvAanD8kwwlh3Qn9+vJd69rQ0S93lrf0DwTMM8tS2v4iMckPsE5
   to1mmaDsqHwf/LaIMDXDobG6gayprwWcFlca766b1B6ibuHOKFLWNoktc
   WLS3BFdjBXHj5FbTVMSx1D7SQTVaFoKWx2wEmmC58Nx1B/vI6IoUhpLa+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="398092970"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="398092970"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 16:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="815551368"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="815551368"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2023 16:39:28 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVM7U-0001y1-02;
	Fri, 24 Feb 2023 00:39:28 +0000
Date: Fri, 24 Feb 2023 08:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [stable:linux-5.15.y 489/9999] xtensa-linux-ld:
 drm_fb_helper.c:undefined reference to `fb_sys_write'
Message-ID: <202302240848.WI2i8syK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   60b502b3ffea07de3d741d79a22da1092b7a8657
commit: 51f0af904fb621721d2c95c1eb349fb46af63a04 [489/9999] drm/fb-helper: Mark screen buffers in system memory with FBINFO_VIRTFB
config: xtensa-randconfig-r004-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240848.WI2i8syK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=51f0af904fb621721d2c95c1eb349fb46af63a04
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 51f0af904fb621721d2c95c1eb349fb46af63a04
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240848.WI2i8syK-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `pan_set':
   drm_fb_helper.c:(.text+0x1c8): undefined reference to `fb_set_suspend'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x1eb): undefined reference to `fb_set_suspend'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
   drm_fb_helper.c:(.text+0x222): undefined reference to `fb_set_suspend'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_init':
   drm_fb_helper.c:(.text+0x384): undefined reference to `unregister_framebuffer'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x3a6): undefined reference to `unregister_framebuffer'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
   drm_fb_helper.c:(.text+0x3e0): undefined reference to `fb_dealloc_cmap'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x3e4): undefined reference to `framebuffer_release'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fini':
   drm_fb_helper.c:(.text+0x476): undefined reference to `fb_dealloc_cmap'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x48a): undefined reference to `framebuffer_release'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x538): undefined reference to `fb_sys_read'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x550): undefined reference to `fb_sys_read'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_single_fb_probe':
   drm_fb_helper.c:(.text+0x1408): undefined reference to `register_framebuffer'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_setup_crtcs_fb':
   drm_fb_helper.c:(.text+0x1482): undefined reference to `register_framebuffer'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `fb_write_screen_buffer':
   drm_fb_helper.c:(.text+0x1ca0): undefined reference to `framebuffer_alloc'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x1ca4): undefined reference to `fb_alloc_cmap'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x1cbe): undefined reference to `framebuffer_alloc'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x1cee): undefined reference to `fb_alloc_cmap'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x1d62): undefined reference to `fb_dealloc_cmap'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x1d93): undefined reference to `framebuffer_release'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fill_info':
   drm_fb_helper.c:(.text+0x1e8e): undefined reference to `fb_set_suspend'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_setcmap':
   drm_fb_helper.c:(.text+0x2728): undefined reference to `fb_deferred_io_init'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x288c): undefined reference to `fb_deferred_io_init'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_generic_probe':
   drm_fb_helper.c:(.text+0x2bfc): undefined reference to `fb_sys_write'
>> xtensa-linux-ld: drm_fb_helper.c:(.text+0x2c14): undefined reference to `fb_sys_write'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2c4c): undefined reference to `sys_fillrect'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2c60): undefined reference to `sys_fillrect'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2c78): undefined reference to `sys_copyarea'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2c8c): undefined reference to `sys_copyarea'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2ca4): undefined reference to `sys_imageblit'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2cb8): undefined reference to `sys_imageblit'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2cd0): undefined reference to `cfb_fillrect'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2ce4): undefined reference to `cfb_fillrect'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2cfc): undefined reference to `cfb_copyarea'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2d10): undefined reference to `cfb_copyarea'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2d28): undefined reference to `cfb_imageblit'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2d3c): undefined reference to `cfb_imageblit'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2d7a): undefined reference to `cfb_copyarea'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2d8c): undefined reference to `sys_copyarea'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2dca): undefined reference to `cfb_imageblit'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2ddc): undefined reference to `sys_imageblit'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_debug_leave':
   drm_fb_helper.c:(.text+0x2e1a): undefined reference to `cfb_fillrect'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2e2c): undefined reference to `sys_fillrect'
   xtensa-linux-ld: drm_fb_helper.c:(.text+0x2f64): undefined reference to `fb_deferred_io_cleanup'
   xtensa-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_use_iomem':
   drm_fb_helper.c:(.text+0x2fbe): undefined reference to `fb_deferred_io_cleanup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
