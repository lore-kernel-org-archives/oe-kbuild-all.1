Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF939187D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 06:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689487939; x=1721023939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2tWGrz7uh+TPxhUul5BpHsnyTHVs6peK06R5Ft5Wp6Y=;
  b=oIWOJZvQ0JBsjcIXsGSS8CVRchIAsORVOu/98p4sPQ0jVu2muoehs/WQ
   Y9nO/wyyORA/f9zQ9cP6qpSIa2ibegjPWFtpKtSZpNGAule3R9ZXThsTJ
   wwK90qDCWqlWWEPl600hBgsQMBFzdJq5dzOPsRN8gcGLeboAdGDHmoBat
   MEMpfdte5ZzE3nnleo75kikoPu1TFnCPIXhbN5/44jjPwGVvslOLjZTzE
   4dxJfa+28CFOBpfIN1UXQ8Vi0GMV9/YzxkgF6eQ5FOC94dqcZg3uYY3QB
   r3i5I2ifoxTF4ZF1+kFiVzPOFbZHY5+SBJaZAAcSvVuoomBtpqQwpP8DD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="365774463"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="365774463"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 23:12:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="788264457"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="788264457"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2023 23:12:17 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKuzQ-0008eh-2N;
	Sun, 16 Jul 2023 06:12:16 +0000
Date: Sun, 16 Jul 2023 14:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 77/365]
 include/uapi/linux/const.h:28:33: error: left shift count >= width of type
Message-ID: <202307161451.Wyhgdvaq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: 1e1d935222e73de854dc13fe2ea3b113de10f0a6 [77/365] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-randconfig-r005-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161451.Wyhgdvaq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161451.Wyhgdvaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161451.Wyhgdvaq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/average.h:5,
                    from drivers/gpu/drm/i915/gt/intel_context_types.h:9,
                    from <command-line>:
   arch/x86/include/asm/tdx.h: In function '__seamcall':
>> include/uapi/linux/const.h:28:33: error: left shift count >= width of type [-Werror=shift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx.h:21:41: note: in expansion of macro '_BITUL'
      21 | #define TDX_ERROR                       _BITUL(63)
         |                                         ^~~~~~
   arch/x86/include/asm/tdx.h:22:42: note: in expansion of macro 'TDX_ERROR'
      22 | #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                          ^~~~~~~~~
   arch/x86/include/asm/tdx.h:26:42: note: in expansion of macro 'TDX_SW_ERROR'
      26 | #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
         |                                          ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:102:70: note: in expansion of macro 'TDX_SEAMCALL_UD'
     102 |                              struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
         |                                                                      ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from drivers/gpu/drm/i915/gvt/gvt.h:37,
                    from <command-line>:
   arch/x86/include/asm/tdx.h: In function '__seamcall':
>> include/uapi/linux/const.h:28:33: error: left shift count >= width of type [-Werror=shift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx.h:21:41: note: in expansion of macro '_BITUL'
      21 | #define TDX_ERROR                       _BITUL(63)
         |                                         ^~~~~~
   arch/x86/include/asm/tdx.h:22:42: note: in expansion of macro 'TDX_ERROR'
      22 | #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                          ^~~~~~~~~
   arch/x86/include/asm/tdx.h:26:42: note: in expansion of macro 'TDX_SW_ERROR'
      26 | #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
         |                                          ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:102:70: note: in expansion of macro 'TDX_SEAMCALL_UD'
     102 |                              struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
         |                                                                      ^~~~~~~~~~~~~~~
   include/linux/kvm_host.h: At top level:
   include/linux/kvm_host.h:2369:6: error: no previous prototype for 'kvm_arch_gmem_invalidate' [-Werror=missing-prototypes]
    2369 | void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
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
https://github.com/intel/lkp-tests/wiki
