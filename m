Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052DB7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 01:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682385134; x=1713921134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GIF0BCJ8qI1Z5WqSOcP3nfIWEjKq1LVBdC83rVkDlaY=;
  b=CFhi8STPS0z5l+q4DQ/UapYrE6eUmKhhJLQbd1HFHJffBjpHFk731+mN
   nFs93PJ4L+15aSWGRlRs4D8UyLdNF4cBcZeUcWL1ftKvbaslLJ7JIBERj
   UeDIgICwJdnBdOQ2hE7LR3gDgDC85GQ6bsvotTw5280wRxm6+r8V9iYdl
   054TugPZZuhHzlAmo4QzPkext4F9Qlk56UjKlEZ/SGWxn99Sdvb9v9+DX
   JbeOgNR7KwXWbpSEItUstRVnWRGUX4ynVpCPF4eeDiw7XkwrXxT71oLEG
   SYawlhimBgejqm3RWzKEyz5vd14MT2ZT0RCf4at51jaYjKdr+FpVr04T1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="344095014"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="344095014"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 18:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="643578631"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="643578631"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Apr 2023 18:12:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr7Dz-000inK-13;
	Tue, 25 Apr 2023 01:12:07 +0000
Date: Tue, 25 Apr 2023 09:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 55/338]
 include/uapi/linux/const.h:28:33: warning: left shift count >= width of type
Message-ID: <202304250939.kNvWVLMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   abaa3072a8763b7a6276df61d205bf33eb2f31a5
commit: 627dfa66ca7a1fa5af2927650f2e9d8a28b67a24 [55/338] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-randconfig-a013-20230424 (https://download.01.org/0day-ci/archive/20230425/202304250939.kNvWVLMp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/627dfa66ca7a1fa5af2927650f2e9d8a28b67a24
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 627dfa66ca7a1fa5af2927650f2e9d8a28b67a24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250939.kNvWVLMp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/align.h:5,
                    from include/linux/kernel.h:15,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:28:
   arch/x86/include/asm/tdx.h: In function '__seamcall':
>> include/uapi/linux/const.h:28:33: warning: left shift count >= width of type [-Wshift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx.h:19:41: note: in expansion of macro '_BITUL'
      19 | #define TDX_ERROR                       _BITUL(63)
         |                                         ^~~~~~
   arch/x86/include/asm/tdx.h:20:42: note: in expansion of macro 'TDX_ERROR'
      20 | #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                          ^~~~~~~~~
   arch/x86/include/asm/tdx.h:24:42: note: in expansion of macro 'TDX_SW_ERROR'
      24 | #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
         |                                          ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:114:70: note: in expansion of macro 'TDX_SEAMCALL_UD'
     114 |                              struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
         |                                                                      ^~~~~~~~~~~~~~~
--
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from arch/x86/platform/pvh/enlighten.c:2:
   arch/x86/include/asm/tdx.h: In function '__seamcall':
>> include/uapi/linux/const.h:28:33: warning: left shift count >= width of type [-Wshift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx.h:19:41: note: in expansion of macro '_BITUL'
      19 | #define TDX_ERROR                       _BITUL(63)
         |                                         ^~~~~~
   arch/x86/include/asm/tdx.h:20:42: note: in expansion of macro 'TDX_ERROR'
      20 | #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                          ^~~~~~~~~
   arch/x86/include/asm/tdx.h:24:42: note: in expansion of macro 'TDX_SW_ERROR'
      24 | #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
         |                                          ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:114:70: note: in expansion of macro 'TDX_SEAMCALL_UD'
     114 |                              struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
         |                                                                      ^~~~~~~~~~~~~~~
   arch/x86/platform/pvh/enlighten.c: At top level:
   arch/x86/platform/pvh/enlighten.c:120:13: warning: no previous prototype for 'xen_prepare_pvh' [-Wmissing-prototypes]
     120 | void __init xen_prepare_pvh(void)
         |             ^~~~~~~~~~~~~~~
--
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/align.h:5,
                    from include/linux/kernel.h:15,
                    from include/linux/crypto.h:16,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/tdx.h: In function '__seamcall':
>> include/uapi/linux/const.h:28:33: warning: left shift count >= width of type [-Wshift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx.h:19:41: note: in expansion of macro '_BITUL'
      19 | #define TDX_ERROR                       _BITUL(63)
         |                                         ^~~~~~
   arch/x86/include/asm/tdx.h:20:42: note: in expansion of macro 'TDX_ERROR'
      20 | #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                          ^~~~~~~~~
   arch/x86/include/asm/tdx.h:24:42: note: in expansion of macro 'TDX_SW_ERROR'
      24 | #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
         |                                          ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:114:70: note: in expansion of macro 'TDX_SEAMCALL_UD'
     114 |                              struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
         |                                                                      ^~~~~~~~~~~~~~~


vim +28 include/uapi/linux/const.h

2dd8a62c647691 Masahiro Yamada 2018-04-10  27  
21e7bc600e3b66 Masahiro Yamada 2018-04-10 @28  #define _BITUL(x)	(_UL(1) << (x))
21e7bc600e3b66 Masahiro Yamada 2018-04-10  29  #define _BITULL(x)	(_ULL(1) << (x))
2fc016c5bd8aad H. Peter Anvin  2013-04-27  30  

:::::: The code at line 28 was first introduced by commit
:::::: 21e7bc600e3b662020c05fd0749bcf85f16336f7 linux/const.h: refactor _BITUL and _BITULL a bit

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
