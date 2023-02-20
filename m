Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9EC882E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 21:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676930252; x=1708466252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9fI6rFiGw3ylnYZTIbWru1dIsl5AyRcgVcpLY7qa6bM=;
  b=WefPIpfs4cpGdInRrbhNPr55XgTCaYXxGaUTyoDkWxrBVFB2BrE1yP4E
   U4V3qMD2X+QfaaMY8STBbNMoSavo+Zrh7Tqim94XQldRzgPRwyNqdJb9y
   4rY3NS+wiTqiGtIP1p26RTD87uGOALsh2mYibbgau8Yyx/RdJgYGfJNbL
   uDaRIg50cWk9hAPSVT0qos/Ov++4VtiiRwQzenJbi3fkG68dfznmmwPyA
   F/GLO22S8tDFygbZ7A+rdcF8MyUCryLJn4WE7YfU8HwHTMVoQg5LvV97g
   nTSMNZlqZug6WTv2POFMxdlfJIQblFtkTmcK40zSK9fAl5yHOAPVDPdTl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="330216660"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="330216660"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 13:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="916964261"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="916964261"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Feb 2023 13:57:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUEA6-000ECd-1k;
	Mon, 20 Feb 2023 21:57:30 +0000
Date: Tue, 21 Feb 2023 05:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2022-12 16169/16328] ld:
 drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
Message-ID: <202302210518.mRx9RJjL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2022-12
head:   772dbeb6d2acc905fca96f41b55e1b7ab428972b
commit: 8a7073c1061a0551fc3485f59ac02a45d86b81b8 [16169/16328] ANDROID: mm/slab: Create 64-byte slab caches if the hardware supports it
config: i386-randconfig-a001-20230220 (https://download.01.org/0day-ci/archive/20230221/202302210518.mRx9RJjL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-2022-12
        git checkout 8a7073c1061a0551fc3485f59ac02a45d86b81b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210518.mRx9RJjL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
   drivers/gpu/drm/drm_fb_helper.c:856: undefined reference to `fb_set_suspend'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
   drivers/gpu/drm/drm_fb_helper.c:370: undefined reference to `fb_set_suspend'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
   drivers/gpu/drm/drm_fb_helper.c:605: undefined reference to `unregister_framebuffer'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fini':
   drivers/gpu/drm/drm_fb_helper.c:634: undefined reference to `framebuffer_release'
   ld: drivers/gpu/drm/drm_fb_helper.c:633: undefined reference to `fb_dealloc_cmap'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_read':
   drivers/gpu/drm/drm_fb_helper.c:728: undefined reference to `fb_sys_read'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
   drivers/gpu/drm/drm_fb_helper.c:559: undefined reference to `framebuffer_alloc'
   ld: drivers/gpu/drm/drm_fb_helper.c:563: undefined reference to `fb_alloc_cmap'
   ld: drivers/gpu/drm/drm_fb_helper.c:589: undefined reference to `framebuffer_release'
   ld: drivers/gpu/drm/drm_fb_helper.c:587: undefined reference to `fb_dealloc_cmap'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_generic_probe':
   drivers/gpu/drm/drm_fb_helper.c:2360: undefined reference to `fb_deferred_io_init'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
   drivers/gpu/drm/drm_fb_helper.c:1867: undefined reference to `register_framebuffer'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend_unlocked':
   drivers/gpu/drm/drm_fb_helper.c:901: undefined reference to `fb_set_suspend'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_write':
   drivers/gpu/drm/drm_fb_helper.c:746: undefined reference to `fb_sys_write'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:764: undefined reference to `sys_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:779: undefined reference to `sys_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
   drivers/gpu/drm/drm_fb_helper.c:794: undefined reference to `sys_imageblit'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:809: undefined reference to `cfb_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:824: undefined reference to `cfb_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_imageblit':
   drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
>> ld: drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
   drivers/gpu/drm/drm_fb_helper.c:794: undefined reference to `sys_imageblit'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:824: undefined reference to `cfb_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:779: undefined reference to `sys_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:809: undefined reference to `cfb_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:764: undefined reference to `sys_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_cleanup':
   drivers/gpu/drm/drm_fb_helper.c:2054: undefined reference to `fb_deferred_io_cleanup'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
   drivers/gpu/drm/drm_fb_helper.c:605: undefined reference to `unregister_framebuffer'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
