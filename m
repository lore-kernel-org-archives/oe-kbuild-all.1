Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E815A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 03:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689477733; x=1721013733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SEvxv002HD1HQuLaVpTcm/+UGKJfTHOpZexNWncWcE8=;
  b=f6KIq27PARuiu0GBOT6Motq3CUEQ3Qe4skxyh5KeWwNOS2n93mUv44yA
   P0nLOoxgoHat12ald1mZCT4S3KLorgdK8PhA+CAbjz20nuc5Hws/EJT23
   zu0OusOT+Z/7bJ7N+1uRx52QostD9OgPMb4eLJYTHvRzwz2kZOJTAkfG6
   6CUw5z0P5gtFsRVP47P5EQpTkGFshehM0LvlKU8jLGB84YABEBZcUH7Zs
   T7KIA2+0fkzhIR+Y7RtRBCJiA6z6QEKfJVyZhesLpJqTUzw1M4rb0xpGM
   /O266n2NZlidoCuJqnkFHAtQpI+S6sTZwVhJCttERfZp4UDA+ynCJ9sRH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="346034094"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="346034094"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 20:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="726118234"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="726118234"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jul 2023 20:22:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKsKp-0008Wr-0c;
	Sun, 16 Jul 2023 03:22:11 +0000
Date: Sun, 16 Jul 2023 11:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 121/365]
 arch/x86/kvm/vmx/main.c:185:17: error: implicit declaration of function
 'tdx_flush_tlb_current'; did you mean 'vmx_flush_tlb_current'?
Message-ID: <202307161143.F71U7ilF-lkp@intel.com>
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
commit: 5f81f9f172b39f1502e95ae8e9120d71b7673e7e [121/365] KVM: TDX: TDP MMU TDX support
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230716/202307161143.F71U7ilF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161143.F71U7ilF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161143.F71U7ilF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/align.h:5,
                    from include/linux/kernel.h:15,
                    from include/linux/moduleparam.h:7,
                    from arch/x86/kvm/vmx/main.c:2:
   arch/x86/include/asm/tdx.h: In function '__seamcall':
   include/uapi/linux/const.h:28:33: warning: left shift count >= width of type [-Wshift-count-overflow]
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
   arch/x86/include/asm/tdx.h:173:70: note: in expansion of macro 'TDX_SEAMCALL_UD'
     173 |                              struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
         |                                                                      ^~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/vmx/x86_ops.h:5,
                    from arch/x86/kvm/vmx/main.c:4:
   include/linux/kvm_host.h: At top level:
   include/linux/kvm_host.h:2370:6: warning: no previous prototype for 'kvm_arch_gmem_invalidate' [-Wmissing-prototypes]
    2370 | void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/main.c: In function 'vt_flush_tlb_current':
>> arch/x86/kvm/vmx/main.c:185:17: error: implicit declaration of function 'tdx_flush_tlb_current'; did you mean 'vmx_flush_tlb_current'? [-Werror=implicit-function-declaration]
     185 |                 tdx_flush_tlb_current(vcpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 vmx_flush_tlb_current
   cc1: some warnings being treated as errors


vim +185 arch/x86/kvm/vmx/main.c

   181	
   182	static void vt_flush_tlb_current(struct kvm_vcpu *vcpu)
   183	{
   184		if (is_td_vcpu(vcpu)) {
 > 185			tdx_flush_tlb_current(vcpu);
   186			return;
   187		}
   188	
   189		vmx_flush_tlb_current(vcpu);
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
