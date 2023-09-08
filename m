Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BBF1389
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694157056; x=1725693056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CMkSlIoJ3DDBTwDOpwE4UwXxpaqOvSKyyfZWzl7k6HA=;
  b=V6mqig8Xh3lTRaek3pthHNRx4AxxD6o0pzFTWo3FUOZux0Sw2e1x3VK6
   I/fOAa4vCx0dyPUKKzNoSMBxf6fnG2xHkFGawau/GP23O311wINMRZc1U
   F3b9KfOB45WgZtK9Dso48KHNv7Mbg7TQtJ4ppwJMUgd474oadBiIvhv7w
   fVDcMiv7+KdnG4AdXp5ocCkq9ky5S1oe7v2wyYl3VJ+G/Z8LmIjoQLC6W
   eNSyCbqr5SRMC1IQ/u+OklaUy2QQT79Hl455j1iVFHYeA/UbI9WuNbpke
   x/VjdtGxFrOQsqMWhN8s/KHpIy1mpGSwbzB9Mt6Az/zqaR+lcqEiSCJPM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463959914"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="463959914"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 00:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="866009108"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="866009108"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Sep 2023 00:10:53 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeVdj-00020h-1R;
	Fri, 08 Sep 2023 07:10:51 +0000
Date: Fri, 8 Sep 2023 15:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guarded_kvm_headers 20/20]
 arch/x86/include/asm/kvm_host.h:1561:19: error: 'kvm_x86_ops' undeclared;
 did you mean 'kvm_pmu_ops'?
Message-ID: <202309081524.arog010h-lkp@intel.com>
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
config: i386-buildonly-randconfig-006-20230908 (https://download.01.org/0day-ci/archive/20230908/202309081524.arog010h-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081524.arog010h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081524.arog010h-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:45:0,
                    from arch/x86/kvm/irq.c:13:
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_alloc_vm':
>> arch/x86/include/asm/kvm_host.h:1561:19: error: 'kvm_x86_ops' undeclared (first use in this function); did you mean 'kvm_pmu_ops'?
     return __vmalloc(kvm_x86_ops.vm_size, GFP_KERNEL_ACCOUNT | __GFP_ZERO);
                      ^~~~~~~~~~~
                      kvm_pmu_ops
   arch/x86/include/asm/kvm_host.h:1561:19: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_flush_remote_tlbs':
   arch/x86/include/asm/kvm_host.h:1570:6: error: 'kvm_x86_ops' undeclared (first use in this function); did you mean 'kvm_pmu_ops'?
     if (kvm_x86_ops.flush_remote_tlbs &&
         ^~~~~~~~~~~
         kvm_pmu_ops
   In file included from <command-line>:0:0:
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_flush_remote_tlbs' undeclared (first use in this function); did you mean 'kvm_arch_flush_remote_tlbs'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1571:7: note: in expansion of macro 'static_call'
         !static_call(kvm_x86_flush_remote_tlbs)(kvm))
          ^~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_vcpu_blocking':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_vcpu_blocking' undeclared (first use in this function); did you mean 'kvm_arch_vcpu_blocking'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:251:38: note: in expansion of macro '__static_call'
    #define static_call_cond(name) (void)__static_call(name)
                                         ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1952:2: note: in expansion of macro 'static_call_cond'
     static_call_cond(kvm_x86_vcpu_blocking)(vcpu);
     ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_vcpu_unblocking':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_vcpu_unblocking' undeclared (first use in this function); did you mean 'kvm_arch_vcpu_unblocking'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:251:38: note: in expansion of macro '__static_call'
    #define static_call_cond(name) (void)__static_call(name)
                                         ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1957:2: note: in expansion of macro 'static_call_cond'
     static_call_cond(kvm_x86_vcpu_unblocking)(vcpu);
     ^~~~~~~~~~~~~~~~
   arch/x86/kvm/kvm_cache_regs.h: In function 'kvm_register_read_raw':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCT__apic_call_read'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/kvm_cache_regs.h:101:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, reg);
      ^~~~~~~~~~~
   arch/x86/kvm/kvm_cache_regs.h: In function 'kvm_pdptr_read':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCT__apic_call_read'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/kvm_cache_regs.h:141:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_PDPTR);
      ^~~~~~~~~~~
   arch/x86/kvm/kvm_cache_regs.h: In function 'kvm_read_cr0_bits':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCT__apic_call_read'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/kvm_cache_regs.h:156:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR0);
      ^~~~~~~~~~~
   arch/x86/kvm/kvm_cache_regs.h: In function 'kvm_read_cr4_bits':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCT__apic_call_read'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/kvm_cache_regs.h:178:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR4);
      ^~~~~~~~~~~
   arch/x86/kvm/kvm_cache_regs.h: In function 'kvm_read_cr3':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCT__apic_call_read'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/kvm_cache_regs.h:193:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR3);
      ^~~~~~~~~~~
--
   In file included from include/linux/kvm_host.h:45:0,
                    from arch/x86/kvm/vmx/vmx.h:5,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_alloc_vm':
>> arch/x86/include/asm/kvm_host.h:1561:19: error: 'kvm_x86_ops' undeclared (first use in this function); did you mean 'kvm_pmu_ops'?
     return __vmalloc(kvm_x86_ops.vm_size, GFP_KERNEL_ACCOUNT | __GFP_ZERO);
                      ^~~~~~~~~~~
                      kvm_pmu_ops
   arch/x86/include/asm/kvm_host.h:1561:19: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_flush_remote_tlbs':
   arch/x86/include/asm/kvm_host.h:1570:6: error: 'kvm_x86_ops' undeclared (first use in this function); did you mean 'kvm_pmu_ops'?
     if (kvm_x86_ops.flush_remote_tlbs &&
         ^~~~~~~~~~~
         kvm_pmu_ops
   In file included from <command-line>:0:0:
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_flush_remote_tlbs' undeclared (first use in this function); did you mean 'kvm_arch_flush_remote_tlbs'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1571:7: note: in expansion of macro 'static_call'
         !static_call(kvm_x86_flush_remote_tlbs)(kvm))
          ^~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_vcpu_blocking':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_vcpu_blocking' undeclared (first use in this function); did you mean 'kvm_arch_vcpu_blocking'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:251:38: note: in expansion of macro '__static_call'
    #define static_call_cond(name) (void)__static_call(name)
                                         ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1952:2: note: in expansion of macro 'static_call_cond'
     static_call_cond(kvm_x86_vcpu_blocking)(vcpu);
     ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_vcpu_unblocking':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_vcpu_unblocking' undeclared (first use in this function); did you mean 'kvm_arch_vcpu_unblocking'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:251:38: note: in expansion of macro '__static_call'
    #define static_call_cond(name) (void)__static_call(name)
                                         ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1957:2: note: in expansion of macro 'static_call_cond'
     static_call_cond(kvm_x86_vcpu_unblocking)(vcpu);
     ^~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h: In function 'kvm_register_read_raw':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCT__apic_call_read'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:101:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, reg);
      ^~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h: In function 'kvm_pdptr_read':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCT__apic_call_read'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:141:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_PDPTR);
      ^~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h: In function 'kvm_read_cr0_bits':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCT__apic_call_read'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:156:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR0);
      ^~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h: In function 'kvm_read_cr4_bits':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCT__apic_call_read'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:178:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR4);
      ^~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h: In function 'kvm_read_cr3':
>> include/linux/static_call_types.h:15:34: error: '__SCT__kvm_x86_cache_reg' undeclared (first use in this function); did you mean '__SCT__apic_call_read'?
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
   include/linux/static_call_types.h:74:29: note: in expansion of macro '__raw_static_call'
    #define __static_call(name) __raw_static_call(name)
                                ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:27: note: in expansion of macro '__static_call'
    #define static_call(name) __static_call(name)
                              ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/../kvm_cache_regs.h:193:3: note: in expansion of macro 'static_call'
      static_call(kvm_x86_cache_reg)(vcpu, VCPU_EXREG_CR3);
      ^~~~~~~~~~~
..


vim +1561 arch/x86/include/asm/kvm_host.h

4f8396b96a9fc6 Sean Christopherson 2022-11-30  1557  
434a1e94469d3b Sean Christopherson 2018-03-20  1558  #define __KVM_HAVE_ARCH_VM_ALLOC
434a1e94469d3b Sean Christopherson 2018-03-20  1559  static inline struct kvm *kvm_arch_alloc_vm(void)
434a1e94469d3b Sean Christopherson 2018-03-20  1560  {
88dca4ca5a93d2 Christoph Hellwig   2020-06-01 @1561  	return __vmalloc(kvm_x86_ops.vm_size, GFP_KERNEL_ACCOUNT | __GFP_ZERO);
434a1e94469d3b Sean Christopherson 2018-03-20  1562  }
78b497f2e62d8c Juergen Gross       2021-09-03  1563  

:::::: The code at line 1561 was first introduced by commit
:::::: 88dca4ca5a93d2c09e5bbc6a62fbfc3af83c4fca mm: remove the pgprot argument to __vmalloc

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
