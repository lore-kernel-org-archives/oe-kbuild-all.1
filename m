Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D0E649
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 04:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692160362; x=1723696362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RtM0byn395fW6cd2ur/l8WGYKVFyKvjsBTSKortY7Ak=;
  b=hmNMDn5GZFVKmlAysvvxa1gAuY96qdCzUshj+SLJcDd9Eh/1XWDKannt
   1PCbm8FxhiQek6zHtYrqYBdLX+tsrA3vhNbORLPsP3zneiZ6Rx+2VrG7N
   6k808D5I5NaqGwFRAkIkWxO2V3rn6cwOY31JqRMLINBIUaxq11hc4PVZQ
   8It50qIsPbQxkTnfnrWJdDvBn0R3CQSZ03w7axMvp5oWPPYveuGY/WMzA
   xvslo5mZkuxSIKvUJedm5rmyS8BAdgVPPYtT5BMbWU+0wzmUWpKWW0tMk
   WFt0yWx73xmtOx/+LXO8+pqWomyROjdq6myslDjRP/5TW0c4n0ZIBlbWX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357414878"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="357414878"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 21:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848329659"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="848329659"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2023 21:32:40 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW8D1-0001V1-20;
	Wed, 16 Aug 2023 04:32:39 +0000
Date: Wed, 16 Aug 2023 12:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 171/9999] drm_fb_helper.c:undefined reference
 to `fb_dealloc_cmap'
Message-ID: <202308161253.JGLlDzxo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   24c4de4069cbce796a1c71166240807d617cd652
commit: 0a2ddbfd65b3fefece66a49fc7d7498aaabf1d2d [171/9999] ALSA: ISA: not for M68K
config: m68k-randconfig-r016-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161253.JGLlDzxo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161253.JGLlDzxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161253.JGLlDzxo-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: warning: arch/m68k/lib/umodsi3.o: missing .note.GNU-stack section implies executable stack
   m68k-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   m68k-linux-ld: warning: arch/m68k/lib/umodsi3.o: missing .note.GNU-stack section implies executable stack
   m68k-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   m68k-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
   drm_fb_helper.c:(.text+0x3e2): undefined reference to `fb_set_suspend'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
   drm_fb_helper.c:(.text+0x3fc): undefined reference to `fb_set_suspend'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
   drm_fb_helper.c:(.text+0x462): undefined reference to `unregister_framebuffer'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fini':
>> drm_fb_helper.c:(.text+0x4b0): undefined reference to `fb_dealloc_cmap'
>> m68k-linux-ld: drm_fb_helper.c:(.text+0x4ba): undefined reference to `framebuffer_release'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_read':
   drm_fb_helper.c:(.text+0x54a): undefined reference to `fb_sys_read'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
   drm_fb_helper.c:(.text+0xec2): undefined reference to `register_framebuffer'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_cleanup':
   drm_fb_helper.c:(.text+0x119a): undefined reference to `fb_deferred_io_cleanup'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
   drm_fb_helper.c:(.text+0x17c8): undefined reference to `framebuffer_alloc'
>> m68k-linux-ld: drm_fb_helper.c:(.text+0x17e6): undefined reference to `fb_alloc_cmap'
>> m68k-linux-ld: drm_fb_helper.c:(.text+0x180c): undefined reference to `fb_dealloc_cmap'
   m68k-linux-ld: drm_fb_helper.c:(.text+0x182a): undefined reference to `framebuffer_release'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_generic_probe':
   drm_fb_helper.c:(.text+0x194a): undefined reference to `fb_deferred_io_init'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend_unlocked':
   drm_fb_helper.c:(.text+0x1fc2): undefined reference to `fb_set_suspend'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_write':
   drm_fb_helper.c:(.text+0x211e): undefined reference to `fb_sys_write'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
   drm_fb_helper.c:(.text+0x215c): undefined reference to `sys_fillrect'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
   drm_fb_helper.c:(.text+0x2190): undefined reference to `sys_copyarea'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
   drm_fb_helper.c:(.text+0x21c4): undefined reference to `sys_imageblit'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
   drm_fb_helper.c:(.text+0x21f8): undefined reference to `cfb_fillrect'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
   drm_fb_helper.c:(.text+0x2246): undefined reference to `cfb_copyarea'
   m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_imageblit':
   drm_fb_helper.c:(.text+0x2294): undefined reference to `cfb_imageblit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
