Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D247CB654
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696076689; x=1727612689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uW96s5L8RiauKFUZ5jFcHKpbcunluKFY8xwlzjCOiEY=;
  b=LaFt3GUmw3RkNmjGhIXPjJqfPFdhsBxZKTMAEp1pXzUfPJNprK/mHBjq
   s7+QJNKvwfWmnUFxDFK7n2gf+9sKoJr8ToFXlW+5Kx2XefT7SSRGXk+18
   fz85BByQFvXj8l4JKK4cMvejqfdbi/DfpiGvm9mCl02yMIJL3v2TR6XnR
   ZLokRlVQaBFUObO7EEa3q12xYsnZCxF+M029QqqC6NI3BM3iaZ+aywiI+
   8P1SVRk7sLnIQxlSRrpAe13Ny2IQ7hb37zHlizQpPH4HaBkaP4VcSOdFj
   nijMNDJc4Kd+WpJkYTgCHVdRtcP3wnswSYBIPveCoZc76lyfXJJO2nQUP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="381322896"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="381322896"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 05:24:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="840542078"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="840542078"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Sep 2023 05:24:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmZ1W-00048D-2u;
	Sat, 30 Sep 2023 12:24:42 +0000
Date: Sat, 30 Sep 2023 20:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/3]
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:60:22: warning: 'pkvm_ffa_id'
 defined but not used
Message-ID: <202309302052.L64mYDVh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   d677c31cb00abcb616376ca2a3bae754fb56493c
commit: a0f22aaf985346fca36ce38c58dc7e4b77409884 [2/3] ANDROID: KVM: arm64: Flag pages needing poisoning in hyp_vmemmap
config: arm64-randconfig-r016-20230905 (https://download.01.org/0day-ci/archive/20230930/202309302052.L64mYDVh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309302052.L64mYDVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309302052.L64mYDVh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:17:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:60:22: warning: 'pkvm_ffa_id' defined but not used [-Wunused-const-variable=]
      60 | static const pkvm_id pkvm_ffa_id        = pkvm_hyp_id + 1; /* Secure world */
         |                      ^~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:58:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      58 | static const pkvm_id pkvm_host_id       = 0;
         |                      ^~~~~~~~~~~~
--
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:391:43: warning: initialized field overwritten [-Woverride-init]
     391 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:391:43: note: (near initialization for 'entry_pvm_shadow_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:392:43: warning: initialized field overwritten [-Woverride-init]
     392 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:392:43: note: (near initialization for 'entry_pvm_shadow_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:393:43: warning: initialized field overwritten [-Woverride-init]
     393 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:393:43: note: (near initialization for 'entry_pvm_shadow_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:394:43: warning: initialized field overwritten [-Woverride-init]
     394 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:394:43: note: (near initialization for 'entry_pvm_shadow_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:395:43: warning: initialized field overwritten [-Woverride-init]
     395 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:395:43: note: (near initialization for 'entry_pvm_shadow_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:400:43: warning: initialized field overwritten [-Woverride-init]
     400 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:400:43: note: (near initialization for 'exit_pvm_shadow_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:401:43: warning: initialized field overwritten [-Woverride-init]
     401 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:401:43: note: (near initialization for 'exit_pvm_shadow_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:402:43: warning: initialized field overwritten [-Woverride-init]
     402 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:402:43: note: (near initialization for 'exit_pvm_shadow_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:403:43: warning: initialized field overwritten [-Woverride-init]
     403 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:403:43: note: (near initialization for 'exit_pvm_shadow_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:404:43: warning: initialized field overwritten [-Woverride-init]
     404 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:404:43: note: (near initialization for 'exit_pvm_shadow_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:413:43: warning: initialized field overwritten [-Woverride-init]
     413 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:413:43: note: (near initialization for 'exit_vm_shadow_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:414:43: warning: initialized field overwritten [-Woverride-init]
     414 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:414:43: note: (near initialization for 'exit_vm_shadow_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:1073:6: warning: no previous prototype for 'handle_trap' [-Wmissing-prototypes]
    1073 | void handle_trap(struct kvm_cpu_context *host_ctxt)
         |      ^~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:8,
                    from arch/arm64/kvm/hyp/nvhe/hyp-main.c:19:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:60:22: warning: 'pkvm_ffa_id' defined but not used [-Wunused-const-variable=]
      60 | static const pkvm_id pkvm_ffa_id        = pkvm_hyp_id + 1; /* Secure world */
         |                      ^~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:58:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      58 | static const pkvm_id pkvm_host_id       = 0;
         |                      ^~~~~~~~~~~~
--
   arch/arm64/kvm/hyp/nvhe/switch.c:197:43: warning: initialized field overwritten [-Woverride-init]
     197 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:197:43: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/nvhe/switch.c:198:43: warning: initialized field overwritten [-Woverride-init]
     198 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:198:43: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:199:43: warning: initialized field overwritten [-Woverride-init]
     199 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:199:43: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:200:43: warning: initialized field overwritten [-Woverride-init]
     200 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:200:43: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:201:43: warning: initialized field overwritten [-Woverride-init]
     201 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:201:43: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:202:43: warning: initialized field overwritten [-Woverride-init]
     202 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:202:43: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:203:43: warning: initialized field overwritten [-Woverride-init]
     203 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:203:43: note: (near initialization for 'hyp_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:208:43: warning: initialized field overwritten [-Woverride-init]
     208 |         [ESR_ELx_EC_HVC64]              = kvm_handle_pvm_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:208:43: note: (near initialization for 'pvm_exit_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/switch.c:209:43: warning: initialized field overwritten [-Woverride-init]
     209 |         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:209:43: note: (near initialization for 'pvm_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:210:43: warning: initialized field overwritten [-Woverride-init]
     210 |         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:210:43: note: (near initialization for 'pvm_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:211:43: warning: initialized field overwritten [-Woverride-init]
     211 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_handle_pvm_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:211:43: note: (near initialization for 'pvm_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:212:43: warning: initialized field overwritten [-Woverride-init]
     212 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:212:43: note: (near initialization for 'pvm_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:213:43: warning: initialized field overwritten [-Woverride-init]
     213 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:213:43: note: (near initialization for 'pvm_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:214:43: warning: initialized field overwritten [-Woverride-init]
     214 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:214:43: note: (near initialization for 'pvm_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:349:17: warning: no previous prototype for 'hyp_panic' [-Wmissing-prototypes]
     349 | void __noreturn hyp_panic(void)
         |                 ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:371:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     371 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:60:22: warning: 'pkvm_ffa_id' defined but not used [-Wunused-const-variable=]
      60 | static const pkvm_id pkvm_ffa_id        = pkvm_hyp_id + 1; /* Secure world */
         |                      ^~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:58:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      58 | static const pkvm_id pkvm_host_id       = 0;
         |                      ^~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:8,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:19:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:60:22: warning: 'pkvm_ffa_id' defined but not used [-Wunused-const-variable=]
      60 | static const pkvm_id pkvm_ffa_id        = pkvm_hyp_id + 1; /* Secure world */
         |                      ^~~~~~~~~~~
--
   arch/arm64/kvm/hyp/nvhe/setup.c:294:17: warning: no previous prototype for '__pkvm_init_finalise' [-Wmissing-prototypes]
     294 | void __noreturn __pkvm_init_finalise(void)
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:8,
                    from arch/arm64/kvm/hyp/nvhe/setup.c:16:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:60:22: warning: 'pkvm_ffa_id' defined but not used [-Wunused-const-variable=]
      60 | static const pkvm_id pkvm_ffa_id        = pkvm_hyp_id + 1; /* Secure world */
         |                      ^~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:58:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      58 | static const pkvm_id pkvm_host_id       = 0;
         |                      ^~~~~~~~~~~~


vim +/pkvm_ffa_id +60 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h

68bd98a28aa6223 Quentin Perret 2021-03-15  56  
1edca0105976755 Quentin Perret 2021-10-26  57  typedef u32 pkvm_id;
1edca0105976755 Quentin Perret 2021-10-26  58  static const pkvm_id pkvm_host_id	= 0;
6dbd44ccf4c908f Quentin Perret 2021-10-26  59  static const pkvm_id pkvm_hyp_id	= (1 << 16);
1adb45e30dc198b Andrew Walbran 2021-10-19 @60  static const pkvm_id pkvm_ffa_id	= pkvm_hyp_id + 1; /* Secure world */
08d3caa584606f6 Quentin Perret 2021-08-09  61  

:::::: The code at line 60 was first introduced by commit
:::::: 1adb45e30dc198bbd4085566b04e08158686f93d ANDROID: BACKPORT: KVM: arm64: Add FF-A helpers to share/unshare memory with secure world

:::::: TO: Andrew Walbran <qwandor@google.com>
:::::: CC: Will Deacon <willdeacon@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
