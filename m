Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259D96ADB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 12:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678453103; x=1709989103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1TOzhmFS6jPdApKzS3fR6ueF8FbxFE7HBGzQdsCoaY=;
  b=SqzpnmQc9mKyfIU7IxvFd2oJQyXxynBgt1GW/1RqCk+DYxSeBoZCgc3g
   sgNcKu7JyqztZlQr05/JaBY+NsVrh8r43OFwll/kz6FzMaqYCEaf4XZ1l
   HAHgsZpJqfyhZEdqjoMnQuzoHyi4lvo6SnvpMTXUNckpUQRLWhW+Ge2mZ
   towvo5eF/9UdBZoXbcUbqkt+zLohxhXI36vqLmiDBIbKdcKRPXEW7/hvT
   H47RKSjbn2I9mWIIGIxCExho1lrvRrfsLZEztfh2enC5wRhH7vn7+FAyA
   PmlNyAckMuZjrfY3GKTXJGaP4NH5d/V/YssBPJqiST5ILSidsT9YA8u+a
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="320572943"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="320572943"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 04:58:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627803208"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="627803208"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Mar 2023 04:58:19 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pacKB-0003s5-0D;
	Fri, 10 Mar 2023 12:58:19 +0000
Date: Fri, 10 Mar 2023 20:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 172/432]
 include/uapi/linux/const.h:28:33: error: left shift count >= width of type
Message-ID: <202303102024.MzAME3ol-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   b4a08c4cd3ed29e3977509b24adc2c59e39825c1
commit: e83792bfbe07a14fa2c616e2aad763434062b3c0 [172/432] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230310/202303102024.MzAME3ol-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/e83792bfbe07a14fa2c616e2aad763434062b3c0
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout e83792bfbe07a14fa2c616e2aad763434062b3c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/ drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102024.MzAME3ol-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
--
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/list.h:9,
                    from drivers/gpu/drm/i915/gt/mock_engine.h:9,
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
