Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D317470
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682378826; x=1713914826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N5Jrm1n8Ob11SzpbZdievnqErOU1uL852q0B3+3lzz0=;
  b=MtqBYa80VYItu8/vaWF0ukEkCj8WL92QCW+zJNCzp0Z761+AUtYhisnp
   WMO2GQ/K8rzcxGjzTtVm9v9iwVQBuTtDAUdSqTr+Cg4lk1ChYLvCXlyK4
   fvw9azrR7Y7QG4ukFK5zYpE3RPHFax23WGa4EPZ1Q7n5Pku5hjqeuXfEy
   GBYUekvYnEemml3KcQmyQ9afyOuG2MDnwDaTnJxAUu+StxB/nXqLDkaw1
   Kj8+e7fR6sI+GbTTcRRoGlm5f8EuGtDSj4E7EGqXzu8UWx5UvTjm2FUTq
   WWOtdkCRW043inIaNQDWiLo1zYzHiLvhhEWZR9RSuqbbDHKkjNOmpzj9M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="374541077"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="374541077"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 16:27:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693264519"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="693264519"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Apr 2023 16:27:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr5aJ-000iid-2d;
	Mon, 24 Apr 2023 23:27:03 +0000
Date: Tue, 25 Apr 2023 07:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 55/338]
 include/uapi/linux/const.h:28:33: error: left shift count >= width of type
Message-ID: <202304250709.e5YWaNwp-lkp@intel.com>
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
config: i386-randconfig-a012-20230424 (https://download.01.org/0day-ci/archive/20230425/202304250709.e5YWaNwp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/627dfa66ca7a1fa5af2927650f2e9d8a28b67a24
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 627dfa66ca7a1fa5af2927650f2e9d8a28b67a24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250709.e5YWaNwp-lkp@intel.com/

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
