Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0B85693
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 11:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691751825; x=1723287825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6J9WbzMTj1SZb/M87P3nVBOrn6yV+EB7rIH6yja+Cw=;
  b=ei/XFpji7K6DBufnsIpjqVrGZdYAsgt/dN0iuUFLMcJDQ/zuWXuws5cu
   izynVL1hidN/5L7D6KcrykBFb3uOcHhke/uL9qZOqAAiZUlx1qZxXFdqj
   iY9n6/eU0t9zVBvpJcNZKB7OBZ8K7X25Gx544mhzApF0Pmh/oVYYAm6je
   MrLB3YCx+5a5QELgjYZmdO8ByO7NIjDoNON8cuQVWbWLC51JejGpdix/y
   j3uKUOQf33zOm2JzTrjvybQ6axHwFI0vdDsivZSHSDeLlD4lUYbWTYPek
   oW6BgDD1o8wCUdK5oR3j0Yt5P3Gzhf9dY11Gm9Y6dSxkM491ZZut3qOWi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="437989895"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="437989895"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP; 11 Aug 2023 04:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="979206135"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="979206135"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2023 04:03:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUPvf-0007jM-1U;
	Fri, 11 Aug 2023 11:03:39 +0000
Date: Fri, 11 Aug 2023 19:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 22/9999] redirect error line to error_id file
 failed
Message-ID: <202308111834.iJ45Lnxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   c275eaaaa34260e6c907bc5e7ee07c096bc45064
commit: ea2258664ffcde0d5c6836e70e685696f35af75a [22/9999] m68k: coldfire/device.c: only build for MCF_EDMA when h/w macros are defined
config: m68k-randconfig-r006-20230808 (https://download.01.org/0day-ci/archive/20230811/202308111834.iJ45Lnxx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111834.iJ45Lnxx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111834.iJ45Lnxx-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: warning: arch/m68k/lib/umodsi3.o: missing .note.GNU-stack section implies executable stack
   m68k-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   m68k-linux-ld: warning: arch/m68k/lib/umodsi3.o: missing .note.GNU-stack section implies executable stack
   m68k-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   m68k-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
>> (.text+0x2b0): undefined reference to `fb_set_suspend'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
   drm_fb_helper.c:(.text+0x2d0): undefined reference to `fb_set_suspend'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
>> (.text+0x344): undefined reference to `unregister_framebuffer'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fini':
>> (.text+0x39a): undefined reference to `fb_dealloc_cmap'
>> m68k-linux-ld: (.text+0x3a4): undefined reference to `framebuffer_release'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_read':
>> (.text+0x458): undefined reference to `fb_sys_read'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
>> (.text+0xec2): undefined reference to `framebuffer_alloc'
>> m68k-linux-ld: (.text+0xee0): undefined reference to `fb_alloc_cmap'
>> m68k-linux-ld: (.text+0xf14): undefined reference to `fb_dealloc_cmap'
   m68k-linux-ld: (.text+0xf3c): undefined reference to `framebuffer_release'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_generic_probe':
   drm_fb_helper.c:(.text+0x109c): undefined reference to `fb_deferred_io_init'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
   drm_fb_helper.c:(.text+0x115c): undefined reference to `register_framebuffer'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend_unlocked':
   (.text+0x1b30): undefined reference to `fb_set_suspend'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_write':
>> (.text+0x211a): undefined reference to `fb_sys_write'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
>> (.text+0x2162): undefined reference to `sys_fillrect'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
>> (.text+0x21a0): undefined reference to `sys_copyarea'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
>> (.text+0x21de): undefined reference to `sys_imageblit'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
>> (.text+0x221c): undefined reference to `cfb_fillrect'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
>> (.text+0x225a): undefined reference to `cfb_copyarea'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_imageblit':
>> (.text+0x2298): undefined reference to `cfb_imageblit'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_fillrect':
   drm_fb_helper.c:(.text+0x2404): undefined reference to `cfb_fillrect'
>> m68k-linux-ld: drm_fb_helper.c:(.text+0x2410): undefined reference to `sys_fillrect'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_imageblit':
   drm_fb_helper.c:(.text+0x245a): undefined reference to `cfb_imageblit'
>> m68k-linux-ld: drm_fb_helper.c:(.text+0x2466): undefined reference to `sys_imageblit'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_copyarea':
   drm_fb_helper.c:(.text+0x24b0): undefined reference to `cfb_copyarea'
>> m68k-linux-ld: drm_fb_helper.c:(.text+0x24bc): undefined reference to `sys_copyarea'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_cleanup':
   drm_fb_helper.c:(.text+0x26e2): undefined reference to `fb_deferred_io_cleanup'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_client_unregister':
   drm_fb_helper.c:(.text+0x2772): undefined reference to `unregister_framebuffer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
