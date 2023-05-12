Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663A6261E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 21:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683928379; x=1715464379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YpCCsLtFqVbm4TBTn3BdJOWkAmbD1PxICz8y1bUa+L4=;
  b=PXA6fV9nsp2Ys3wl6VVela/ks9gDGKwNxvxfshmTDvglLYivAveCMPwM
   vSeZtcz59+tg11X6fHE0BakCft3WwVarYNlBsIy4wys55si7cZIxg4tnN
   /sZ5ELhgQ4VK/nnMrX8gYnGg2a/QzNRPAfV5a8PvjKZH+yYZ3ui8iUI7m
   sMRrraJwzaiH7X8RVH4t4WxRasPGEHZXVRbo5DYcaYpulJfyauwV6GZjq
   zyhjCxx3r4oEWse0N0BHHCVx8v3USnRDiKKvCFFYp9WKgL9dSr733yIux
   qqJOs3icfgjq6KbvdcDacFZH9qVG4XzmSz57Dwo2/febR9V2gasVBsknP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335416259"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335416259"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 14:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769945266"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="769945266"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 May 2023 14:52:57 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxah6-00058G-39;
	Fri, 12 May 2023 21:52:56 +0000
Date: Sat, 13 May 2023 05:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 55/341]
 include/uapi/linux/const.h:28:33: error: left shift count >= width of type
Message-ID: <202305130549.YnpoLeui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   a8ba58bfbd61bb49f204238176ff563405f400a7
commit: 4af3db05a87de0f2b9b15c5d69f1794bef77318d [55/341] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230513/202305130549.YnpoLeui-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/4af3db05a87de0f2b9b15c5d69f1794bef77318d
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 4af3db05a87de0f2b9b15c5d69f1794bef77318d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130549.YnpoLeui-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from include/linux/i2c.h:13,
                    from drivers/gpu/drm/i915/display/intel_display_types.h:29,
                    from <command-line>:
   arch/x86/include/asm/tdx.h: In function '__seamcall':
>> include/uapi/linux/const.h:28:33: error: left shift count >= width of type [-Werror=shift-count-overflow]
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
   cc1: all warnings being treated as errors


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
