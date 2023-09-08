Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC971865
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694162220; x=1725698220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8dcgkkGdCEMFEjeLDMaMYpgV5fAFT11m4+gkJ7glGVA=;
  b=jpdKO7rDzVdVOIfz/g5OYE3htSinP/56vNXAl/amg110PHPWDWR8qkbl
   mAKg2wxwa8/Wl2V+P0Blv4f+L0Fqfzw6OzbvcE+4h7Kx3CbQ8hEcN6EOo
   w9cZXviVvTYr+eVceuP578XrByd+pqq43sgUpVPMNYPKPMcUZh6PvV0m3
   j3n+zvVEm9RQC2INSzJ7PwvLZI94wtIEMCudSdzZ9wsxWUPRpPepTGmEA
   +YM6OApSY8CM9CySY5Rho2K2cPZupA5B9F+jqoIGChkEsmumWrb/01LWJ
   gQ564Pt8CTw13xYYgORwxzsnxDPO85KLIGUigLYkErMN7gQ/IZ5NNh2Si
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="408587371"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="408587371"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 01:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="885586111"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="885586111"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2023 01:36:41 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeWz0-00024r-1W;
	Fri, 08 Sep 2023 08:36:54 +0000
Date: Fri, 8 Sep 2023 16:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guarded_kvm_headers 20/20]
 arch/x86/kvm/mmu/mmu_internal.h:158:9: error: 'kvm_x86_ops' undeclared; did
 you mean 'kvm_pmu_ops'?
Message-ID: <202309081630.qfWybcr3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/guarded_kvm_headers
head:   bac0634d402f98992a041354ea641c03d00ee498
commit: bac0634d402f98992a041354ea641c03d00ee498 [20/20] KVM: x86: Move "ops" files to arch/x86/kvm/
config: x86_64-randconfig-013-20230908 (https://download.01.org/0day-ci/archive/20230908/202309081630.qfWybcr3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081630.qfWybcr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081630.qfWybcr3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:45:0,
                    from arch/x86/kvm/vmx/vmx.h:5,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_alloc_vm':
   arch/x86/include/asm/kvm_host.h:1561:19: error: 'kvm_x86_ops' undeclared (first use in this function); did you mean 'kvm_pmu_ops'?
     return __vmalloc(kvm_x86_ops.vm_size, GFP_KERNEL_ACCOUNT | __GFP_ZERO);
                      ^~~~~~~~~~~
                      kvm_pmu_ops
   arch/x86/include/asm/kvm_host.h:1561:19: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_flush_remote_tlbs':
   arch/x86/include/asm/kvm_host.h:1570:6: error: 'kvm_x86_ops' undeclared (first use in this function); did you mean 'kvm_pmu_ops'?
     if (kvm_x86_ops.flush_remote_tlbs &&
         ^~~~~~~~~~~
         kvm_pmu_ops
   In file included from include/linux/static_call_types.h:7:0,
                    from include/linux/entry-kvm.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/vmx/vmx.h:5,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
>> include/linux/static_call_types.h:9:33: error: '__SCK__kvm_x86_flush_remote_tlbs' undeclared (first use in this function); did you mean 'kvm_arch_flush_remote_tlbs'?
    #define STATIC_CALL_KEY_PREFIX  __SCK__
                                    ^
   include/linux/compiler.h:215:55: note: in definition of macro '___ADDRESSABLE'
      __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                                                          ^~~
   include/linux/static_call_types.h:53:2: note: in expansion of macro '__ADDRESSABLE'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
     ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
    #define __PASTE(a,b) ___PASTE(a,b)
                         ^~~~~~~~
   include/linux/static_call_types.h:12:32: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                   ^~~~~~~
   include/linux/static_call_types.h:12:40: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:16: note: in expansion of macro 'STATIC_CALL_KEY'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
                   ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:2: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
     __STATIC_CALL_ADDRESSABLE(name);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1571:7: note: in expansion of macro 'static_call'
         !static_call(kvm_x86_flush_remote_tlbs)(kvm))
          ^~~~~~~~~~~
   In file included from <command-line>:0:0:
   include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_flush_remote_tlbs' undeclared (first use in this function); did you mean '__SCK__kvm_x86_flush_remote_tlbs'?
    #define STATIC_CALL_TRAMP_PREFIX __SCT__
                                     ^
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
    #define ___PASTE(a,b) a##b
                          ^
   include/linux/static_call_types.h:18:34: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                     ^~~~~~~
   include/linux/static_call_types.h:18:42: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
    #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
                                      ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:58:2: note: in expansion of macro '__raw_static_call'
     __raw_static_call(name);     \
     ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1571:7: note: in expansion of macro 'static_call'
         !static_call(kvm_x86_flush_remote_tlbs)(kvm))
          ^~~~~~~~~~~
   In file included from include/linux/static_call_types.h:7:0,
                    from include/linux/entry-kvm.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/vmx/vmx.h:5,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_vcpu_blocking':
>> include/linux/static_call_types.h:9:33: error: '__SCK__kvm_x86_vcpu_blocking' undeclared (first use in this function); did you mean 'kvm_arch_vcpu_blocking'?
    #define STATIC_CALL_KEY_PREFIX  __SCK__
                                    ^
   include/linux/compiler.h:215:55: note: in definition of macro '___ADDRESSABLE'
      __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                                                          ^~~
   include/linux/static_call_types.h:53:2: note: in expansion of macro '__ADDRESSABLE'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
     ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
    #define __PASTE(a,b) ___PASTE(a,b)
                         ^~~~~~~~
   include/linux/static_call_types.h:12:32: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                   ^~~~~~~
   include/linux/static_call_types.h:12:40: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:16: note: in expansion of macro 'STATIC_CALL_KEY'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
                   ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:2: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
     __STATIC_CALL_ADDRESSABLE(name);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:209:38: note: in expansion of macro '__static_call'
    #define static_call_cond(name) (void)__static_call(name)
                                         ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1952:2: note: in expansion of macro 'static_call_cond'
     static_call_cond(kvm_x86_vcpu_blocking)(vcpu);
     ^~~~~~~~~~~~~~~~
   In file included from <command-line>:0:0:
   include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_vcpu_blocking' undeclared (first use in this function); did you mean '__SCK__kvm_x86_vcpu_blocking'?
    #define STATIC_CALL_TRAMP_PREFIX __SCT__
                                     ^
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
    #define ___PASTE(a,b) a##b
                          ^
   include/linux/static_call_types.h:18:34: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                     ^~~~~~~
   include/linux/static_call_types.h:18:42: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
    #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
                                      ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:58:2: note: in expansion of macro '__raw_static_call'
     __raw_static_call(name);     \
     ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:209:38: note: in expansion of macro '__static_call'
    #define static_call_cond(name) (void)__static_call(name)
                                         ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1952:2: note: in expansion of macro 'static_call_cond'
     static_call_cond(kvm_x86_vcpu_blocking)(vcpu);
     ^~~~~~~~~~~~~~~~
   In file included from include/linux/static_call_types.h:7:0,
                    from include/linux/entry-kvm.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/vmx/vmx.h:5,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_vcpu_unblocking':
>> include/linux/static_call_types.h:9:33: error: '__SCK__kvm_x86_vcpu_unblocking' undeclared (first use in this function); did you mean 'kvm_arch_vcpu_unblocking'?
    #define STATIC_CALL_KEY_PREFIX  __SCK__
                                    ^
   include/linux/compiler.h:215:55: note: in definition of macro '___ADDRESSABLE'
      __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                                                          ^~~
   include/linux/static_call_types.h:53:2: note: in expansion of macro '__ADDRESSABLE'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
     ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
    #define __PASTE(a,b) ___PASTE(a,b)
                         ^~~~~~~~
   include/linux/static_call_types.h:12:32: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                   ^~~~~~~
   include/linux/static_call_types.h:12:40: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:16: note: in expansion of macro 'STATIC_CALL_KEY'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
                   ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:2: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
     __STATIC_CALL_ADDRESSABLE(name);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:209:38: note: in expansion of macro '__static_call'
    #define static_call_cond(name) (void)__static_call(name)
                                         ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1957:2: note: in expansion of macro 'static_call_cond'
     static_call_cond(kvm_x86_vcpu_unblocking)(vcpu);
     ^~~~~~~~~~~~~~~~
   In file included from <command-line>:0:0:
   include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_vcpu_unblocking' undeclared (first use in this function); did you mean '__SCK__kvm_x86_vcpu_unblocking'?
    #define STATIC_CALL_TRAMP_PREFIX __SCT__
                                     ^
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
    #define ___PASTE(a,b) a##b
                          ^
   include/linux/static_call_types.h:18:34: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                     ^~~~~~~
   include/linux/static_call_types.h:18:42: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
    #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
                                      ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:58:2: note: in expansion of macro '__raw_static_call'
     __raw_static_call(name);     \
     ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:209:38: note: in expansion of macro '__static_call'
    #define static_call_cond(name) (void)__static_call(name)
                                         ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1957:2: note: in expansion of macro 'static_call_cond'
     static_call_cond(kvm_x86_vcpu_unblocking)(vcpu);
     ^~~~~~~~~~~~~~~~
   In file included from include/linux/static_call_types.h:7:0,
                    from include/linux/entry-kvm.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/vmx/vmx.h:5,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/kvm/vmx/../kvm_cache_regs.h: In function 'kvm_register_read_raw':
>> include/linux/static_call_types.h:9:33: error: '__SCK__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCK__apic_call_read'?
    #define STATIC_CALL_KEY_PREFIX  __SCK__
                                    ^
   include/linux/compiler.h:215:55: note: in definition of macro '___ADDRESSABLE'
      __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                                                          ^~~
   include/linux/static_call_types.h:53:2: note: in expansion of macro '__ADDRESSABLE'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
     ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
    #define __PASTE(a,b) ___PASTE(a,b)
                         ^~~~~~~~
   include/linux/static_call_types.h:12:32: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                   ^~~~~~~
   include/linux/static_call_types.h:12:40: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:16: note: in expansion of macro 'STATIC_CALL_KEY'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
                   ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:2: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
     __STATIC_CALL_ADDRESSABLE(name);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:101:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, reg);
      ^~~~~~~~~~~
   In file included from <command-line>:0:0:
   include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCK__kvm_x86_cache_reg'?
    #define STATIC_CALL_TRAMP_PREFIX __SCT__
                                     ^
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
    #define ___PASTE(a,b) a##b
                          ^
   include/linux/static_call_types.h:18:34: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                     ^~~~~~~
   include/linux/static_call_types.h:18:42: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
    #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
                                      ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:58:2: note: in expansion of macro '__raw_static_call'
     __raw_static_call(name);     \
     ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:101:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, reg);
      ^~~~~~~~~~~
   In file included from include/linux/static_call_types.h:7:0,
                    from include/linux/entry-kvm.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/vmx/vmx.h:5,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/kvm/vmx/../kvm_cache_regs.h: In function 'kvm_pdptr_read':
>> include/linux/static_call_types.h:9:33: error: '__SCK__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCK__apic_call_read'?
    #define STATIC_CALL_KEY_PREFIX  __SCK__
                                    ^
   include/linux/compiler.h:215:55: note: in definition of macro '___ADDRESSABLE'
      __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                                                          ^~~
   include/linux/static_call_types.h:53:2: note: in expansion of macro '__ADDRESSABLE'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
     ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
    #define __PASTE(a,b) ___PASTE(a,b)
                         ^~~~~~~~
   include/linux/static_call_types.h:12:32: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                   ^~~~~~~
   include/linux/static_call_types.h:12:40: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:16: note: in expansion of macro 'STATIC_CALL_KEY'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
                   ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:2: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
     __STATIC_CALL_ADDRESSABLE(name);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:141:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_PDPTR);
      ^~~~~~~~~~~
   In file included from <command-line>:0:0:
   include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCK__kvm_x86_cache_reg'?
    #define STATIC_CALL_TRAMP_PREFIX __SCT__
                                     ^
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
    #define ___PASTE(a,b) a##b
                          ^
   include/linux/static_call_types.h:18:34: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                     ^~~~~~~
   include/linux/static_call_types.h:18:42: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
    #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
                                      ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:58:2: note: in expansion of macro '__raw_static_call'
     __raw_static_call(name);     \
     ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:141:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_PDPTR);
      ^~~~~~~~~~~
   In file included from include/linux/static_call_types.h:7:0,
                    from include/linux/entry-kvm.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/vmx/vmx.h:5,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/kvm/vmx/../kvm_cache_regs.h: In function 'kvm_read_cr0_bits':
>> include/linux/static_call_types.h:9:33: error: '__SCK__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCK__apic_call_read'?
    #define STATIC_CALL_KEY_PREFIX  __SCK__
                                    ^
   include/linux/compiler.h:215:55: note: in definition of macro '___ADDRESSABLE'
      __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                                                          ^~~
   include/linux/static_call_types.h:53:2: note: in expansion of macro '__ADDRESSABLE'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
     ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
    #define __PASTE(a,b) ___PASTE(a,b)
                         ^~~~~~~~
   include/linux/static_call_types.h:12:32: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                   ^~~~~~~
   include/linux/static_call_types.h:12:40: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:16: note: in expansion of macro 'STATIC_CALL_KEY'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
                   ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:2: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
     __STATIC_CALL_ADDRESSABLE(name);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:156:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR0);
      ^~~~~~~~~~~
   In file included from <command-line>:0:0:
   include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCK__kvm_x86_cache_reg'?
    #define STATIC_CALL_TRAMP_PREFIX __SCT__
                                     ^
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
    #define ___PASTE(a,b) a##b
                          ^
   include/linux/static_call_types.h:18:34: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                     ^~~~~~~
   include/linux/static_call_types.h:18:42: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
    #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
                                      ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:58:2: note: in expansion of macro '__raw_static_call'
     __raw_static_call(name);     \
     ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:156:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR0);
      ^~~~~~~~~~~
   In file included from include/linux/static_call_types.h:7:0,
                    from include/linux/entry-kvm.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/vmx/vmx.h:5,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/kvm/vmx/../kvm_cache_regs.h: In function 'kvm_read_cr4_bits':
>> include/linux/static_call_types.h:9:33: error: '__SCK__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCK__apic_call_read'?
    #define STATIC_CALL_KEY_PREFIX  __SCK__
                                    ^
   include/linux/compiler.h:215:55: note: in definition of macro '___ADDRESSABLE'
      __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                                                          ^~~
   include/linux/static_call_types.h:53:2: note: in expansion of macro '__ADDRESSABLE'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
     ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
    #define __PASTE(a,b) ___PASTE(a,b)
                         ^~~~~~~~
   include/linux/static_call_types.h:12:32: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                   ^~~~~~~
   include/linux/static_call_types.h:12:40: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:16: note: in expansion of macro 'STATIC_CALL_KEY'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
                   ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:2: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
     __STATIC_CALL_ADDRESSABLE(name);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:178:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR4);
      ^~~~~~~~~~~
   In file included from <command-line>:0:0:
   include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCK__kvm_x86_cache_reg'?
    #define STATIC_CALL_TRAMP_PREFIX __SCT__
                                     ^
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
    #define ___PASTE(a,b) a##b
                          ^
   include/linux/static_call_types.h:18:34: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                     ^~~~~~~
   include/linux/static_call_types.h:18:42: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
    #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
                                      ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:58:2: note: in expansion of macro '__raw_static_call'
     __raw_static_call(name);     \
     ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:178:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR4);
      ^~~~~~~~~~~
   In file included from include/linux/static_call_types.h:7:0,
                    from include/linux/entry-kvm.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/vmx/vmx.h:5,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/kvm/vmx/../kvm_cache_regs.h: In function 'kvm_read_cr3':
>> include/linux/static_call_types.h:9:33: error: '__SCK__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCK__apic_call_read'?
    #define STATIC_CALL_KEY_PREFIX  __SCK__
                                    ^
   include/linux/compiler.h:215:55: note: in definition of macro '___ADDRESSABLE'
      __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                                                          ^~~
   include/linux/static_call_types.h:53:2: note: in expansion of macro '__ADDRESSABLE'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
     ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
    #define __PASTE(a,b) ___PASTE(a,b)
                         ^~~~~~~~
   include/linux/static_call_types.h:12:32: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                   ^~~~~~~
   include/linux/static_call_types.h:12:40: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
    #define STATIC_CALL_KEY(name)  __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:16: note: in expansion of macro 'STATIC_CALL_KEY'
     __ADDRESSABLE(STATIC_CALL_KEY(name))
                   ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:2: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
     __STATIC_CALL_ADDRESSABLE(name);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:193:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR3);
      ^~~~~~~~~~~
   In file included from <command-line>:0:0:
   include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCK__kvm_x86_cache_reg'?
    #define STATIC_CALL_TRAMP_PREFIX __SCT__
                                     ^
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
    #define ___PASTE(a,b) a##b
                          ^
   include/linux/static_call_types.h:18:34: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                     ^~~~~~~
   include/linux/static_call_types.h:18:42: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
    #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
                                      ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:58:2: note: in expansion of macro '__raw_static_call'
     __raw_static_call(name);     \
     ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:193:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR3);
      ^~~~~~~~~~~
..


vim +158 arch/x86/kvm/mmu/mmu_internal.h

08889894cc82bc Sean Christopherson 2021-03-15  147  
ce92ef7604ffe7 Sean Christopherson 2021-11-17  148  static inline bool kvm_mmu_page_ad_need_write_protect(struct kvm_mmu_page *sp)
5a9624affe7c74 Paolo Bonzini       2020-10-16  149  {
5a9624affe7c74 Paolo Bonzini       2020-10-16  150  	/*
44ac5958a6c1fd Sean Christopherson 2021-02-25  151  	 * When using the EPT page-modification log, the GPAs in the CPU dirty
44ac5958a6c1fd Sean Christopherson 2021-02-25  152  	 * log would come from L2 rather than L1.  Therefore, we need to rely
44ac5958a6c1fd Sean Christopherson 2021-02-25  153  	 * on write protection to record dirty pages, which bypasses PML, since
44ac5958a6c1fd Sean Christopherson 2021-02-25  154  	 * writes now result in a vmexit.  Note, the check on CPU dirty logging
44ac5958a6c1fd Sean Christopherson 2021-02-25  155  	 * being enabled is mandatory as the bits used to denote WP-only SPTEs
ce92ef7604ffe7 Sean Christopherson 2021-11-17  156  	 * are reserved for PAE paging (32-bit KVM).
5a9624affe7c74 Paolo Bonzini       2020-10-16  157  	 */
ce92ef7604ffe7 Sean Christopherson 2021-11-17 @158  	return kvm_x86_ops.cpu_dirty_log_size && sp->role.guest_mode;
5a9624affe7c74 Paolo Bonzini       2020-10-16  159  }
5a9624affe7c74 Paolo Bonzini       2020-10-16  160  

:::::: The code at line 158 was first introduced by commit
:::::: ce92ef7604ffe74da84f559f6eba8c6053250451 KVM: x86/mmu: Use shadow page role to detect PML-unfriendly pages for L2

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
