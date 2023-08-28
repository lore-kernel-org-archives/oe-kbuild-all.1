Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393BA4D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 06:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693203273; x=1724739273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q6dIUwRlEMYdmQX/dmqR66+FlRjxqJ/GocW4WTyU+U8=;
  b=MIAw5WASHOn45Igxmx5pbA/KZC9fJP5JpmBY0NeU7FruTNsEp2g94X//
   rEJnCxto2t1vB1dOGRxwoZLIyhXTzkveuAuGcuFufoxiR8vdTh6wkn+Pu
   u9u/bNc4fK38rplJL5aQUA7TpcDoRVv/Z9uZra7svdR0QhZsijA8e+dWM
   98Ko+KCd2BdDzZzYlVdVQQoBdvMd7/BI+NpvezG1oev7bXO561gdOrsw0
   3DFtNayOpSJfH92p8YOcouMxuPPy/vpJy/Yuh0YJ1UXFIbNjRUFhWuw+K
   M8sPrKX3sbrN3nxlwBE2DIyyq8/x6jlV+tzPxcm4lvtpxFX1FWVxi+xbA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="441370079"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="441370079"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 23:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="852719073"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="852719073"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2023 23:14:30 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaVVE-0007cp-3A;
	Mon, 28 Aug 2023 06:14:06 +0000
Date: Mon, 28 Aug 2023 14:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Perret <qperret@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <willdeacon@google.com>
Subject: [sudeep-holla:android13-5.15/ffa 2733/4062]
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id'
 defined but not used
Message-ID: <202308281414.4dwZvLV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: 5da4a4ca5f6805c27ccd1fc48e4bec11764819d2 [2733/4062] ANDROID: BACKPORT: KVM: arm64: Make owner ids 32 bits wide
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230828/202308281414.4dwZvLV2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281414.4dwZvLV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308281414.4dwZvLV2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/switch.c:208:43: warning: initialized field overwritten [-Woverride-init]
     208 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:208:43: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/nvhe/switch.c:209:43: warning: initialized field overwritten [-Woverride-init]
     209 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:209:43: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:210:43: warning: initialized field overwritten [-Woverride-init]
     210 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:210:43: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:211:43: warning: initialized field overwritten [-Woverride-init]
     211 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:211:43: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:212:43: warning: initialized field overwritten [-Woverride-init]
     212 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:212:43: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:213:43: warning: initialized field overwritten [-Woverride-init]
     213 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:213:43: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:214:43: warning: initialized field overwritten [-Woverride-init]
     214 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:214:43: note: (near initialization for 'hyp_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:219:43: warning: initialized field overwritten [-Woverride-init]
     219 |         [ESR_ELx_EC_HVC64]              = kvm_handle_pvm_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:219:43: note: (near initialization for 'pvm_exit_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/switch.c:220:43: warning: initialized field overwritten [-Woverride-init]
     220 |         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:220:43: note: (near initialization for 'pvm_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:221:43: warning: initialized field overwritten [-Woverride-init]
     221 |         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:221:43: note: (near initialization for 'pvm_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:222:43: warning: initialized field overwritten [-Woverride-init]
     222 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_handle_pvm_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:222:43: note: (near initialization for 'pvm_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:223:43: warning: initialized field overwritten [-Woverride-init]
     223 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:223:43: note: (near initialization for 'pvm_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:224:43: warning: initialized field overwritten [-Woverride-init]
     224 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:224:43: note: (near initialization for 'pvm_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:225:43: warning: initialized field overwritten [-Woverride-init]
     225 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:225:43: note: (near initialization for 'pvm_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:362:17: warning: no previous prototype for 'hyp_panic' [-Wmissing-prototypes]
     362 | void __noreturn hyp_panic(void)
         |                 ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:384:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     384 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:22: warning: 'pkvm_guest_id' defined but not used [-Wunused-const-variable=]
      57 | static const pkvm_id pkvm_guest_id      = 2;
         |                      ^~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:56:22: warning: 'pkvm_hyp_id' defined but not used [-Wunused-const-variable=]
      56 | static const pkvm_id pkvm_hyp_id        = 1;
         |                      ^~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      55 | static const pkvm_id pkvm_host_id       = 0;
         |                      ^~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/tlb.c:11:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:22: warning: 'pkvm_guest_id' defined but not used [-Wunused-const-variable=]
      57 | static const pkvm_id pkvm_guest_id      = 2;
         |                      ^~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:56:22: warning: 'pkvm_hyp_id' defined but not used [-Wunused-const-variable=]
      56 | static const pkvm_id pkvm_hyp_id        = 1;
         |                      ^~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      55 | static const pkvm_id pkvm_host_id       = 0;
         |                      ^~~~~~~~~~~~
--
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:321:43: warning: initialized field overwritten [-Woverride-init]
     321 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:321:43: note: (near initialization for 'entry_shadow_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:322:43: warning: initialized field overwritten [-Woverride-init]
     322 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:322:43: note: (near initialization for 'entry_shadow_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:323:43: warning: initialized field overwritten [-Woverride-init]
     323 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:323:43: note: (near initialization for 'entry_shadow_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:324:43: warning: initialized field overwritten [-Woverride-init]
     324 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:324:43: note: (near initialization for 'entry_shadow_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:325:43: warning: initialized field overwritten [-Woverride-init]
     325 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:325:43: note: (near initialization for 'entry_shadow_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:330:43: warning: initialized field overwritten [-Woverride-init]
     330 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:330:43: note: (near initialization for 'exit_shadow_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:331:43: warning: initialized field overwritten [-Woverride-init]
     331 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:331:43: note: (near initialization for 'exit_shadow_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:332:43: warning: initialized field overwritten [-Woverride-init]
     332 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:332:43: note: (near initialization for 'exit_shadow_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:333:43: warning: initialized field overwritten [-Woverride-init]
     333 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:333:43: note: (near initialization for 'exit_shadow_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:334:43: warning: initialized field overwritten [-Woverride-init]
     334 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:334:43: note: (near initialization for 'exit_shadow_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:919:6: warning: no previous prototype for 'handle_trap' [-Wmissing-prototypes]
     919 | void handle_trap(struct kvm_cpu_context *host_ctxt)
         |      ^~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:8,
                    from arch/arm64/kvm/hyp/nvhe/hyp-main.c:18:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:22: warning: 'pkvm_guest_id' defined but not used [-Wunused-const-variable=]
      57 | static const pkvm_id pkvm_guest_id      = 2;
         |                      ^~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:56:22: warning: 'pkvm_hyp_id' defined but not used [-Wunused-const-variable=]
      56 | static const pkvm_id pkvm_hyp_id        = 1;
         |                      ^~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      55 | static const pkvm_id pkvm_host_id       = 0;
         |                      ^~~~~~~~~~~~
--
   arch/arm64/kvm/hyp/nvhe/setup.c:277:17: warning: no previous prototype for '__pkvm_init_finalise' [-Wmissing-prototypes]
     277 | void __noreturn __pkvm_init_finalise(void)
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:8,
                    from arch/arm64/kvm/hyp/nvhe/setup.c:15:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:22: warning: 'pkvm_guest_id' defined but not used [-Wunused-const-variable=]
      57 | static const pkvm_id pkvm_guest_id      = 2;
         |                      ^~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      55 | static const pkvm_id pkvm_host_id       = 0;
         |                      ^~~~~~~~~~~~


vim +/pkvm_host_id +55 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h

    53	
    54	typedef u32 pkvm_id;
  > 55	static const pkvm_id pkvm_host_id	= 0;
    56	static const pkvm_id pkvm_hyp_id	= 1;
    57	static const pkvm_id pkvm_guest_id	= 2;
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
