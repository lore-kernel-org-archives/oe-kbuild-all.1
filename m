Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B55B1101
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 00:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679360111; x=1710896111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hUpUwerS1gNCRj4vX2R1CNi66/y8RkCvXDqrJ164bV4=;
  b=ffCpD/deMjP85vn5btSw19km2FS2mJd92fO/PEJb5xDysQLinAyXGMyP
   qz1fMuJvXK87P5G7CKK9kVvdW3ACy2RNHfDSBtWG60LolJs9Ri54OpBHw
   OClXaFWRlvmYVC8JVAFzKujx+Pbx5WbSPdQKlF6H92AEfGv+GWvG3ltiY
   Bvhf3Wq2ABiu6d2vPQhws7BtEDyM5AxuRzTpRvAaYEAorQKISmLvh3woT
   GrEH6LESJQdA/z4Sk9HYKLbadn8B5N2CN5v+64hcO8HvTxTRKo8/rjrde
   T+WT19yhcu7bqijTdKPOeUloP3ENjBRIXkqSBngKfvF29+X6kd3s+UMxG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="322655866"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="322655866"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 17:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="683641910"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="683641910"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2023 17:55:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peQHI-000BRs-1e;
	Tue, 21 Mar 2023 00:55:04 +0000
Date: Tue, 21 Mar 2023 08:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream 55/157] include/uapi/linux/const.h:28:33:
 error: left shift count >= width of type
Message-ID: <202303210849.dW4siXcm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Isaku,

FYI, the error/warning still remains.

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   af455bd9233d89034be3007550c0209df72914f1
commit: 3c2c142e14a04a833b47f77faecaa91899b472cd [55/157] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230321/202303210849.dW4siXcm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/3c2c142e14a04a833b47f77faecaa91899b472cd
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream
        git checkout 3c2c142e14a04a833b47f77faecaa91899b472cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210849.dW4siXcm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/string_helpers.h:5,
                    from drivers/gpu/drm/i915/display/intel_display_trace.h:12,
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

2dd8a62c6476911 Masahiro Yamada 2018-04-10  27  
21e7bc600e3b662 Masahiro Yamada 2018-04-10 @28  #define _BITUL(x)	(_UL(1) << (x))
21e7bc600e3b662 Masahiro Yamada 2018-04-10  29  #define _BITULL(x)	(_ULL(1) << (x))
2fc016c5bd8aad2 H. Peter Anvin  2013-04-27  30  

:::::: The code at line 28 was first introduced by commit
:::::: 21e7bc600e3b662020c05fd0749bcf85f16336f7 linux/const.h: refactor _BITUL and _BITULL a bit

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
