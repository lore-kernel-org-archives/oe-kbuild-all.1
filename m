Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9EB1C2E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 08:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694076126; x=1725612126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ytAJ7lbTaD9JGHhp27nX9fVMNN/5UOEWxGkPWXOg/Wo=;
  b=YPmVYdxxU+jml5sQ1BKiDAkU3K/WZs34VtGqzgfrSCTz1Fm9IcSXXw2D
   lG7BR2KO4ydp0Hw7H/dp75dv1xEYOUI0rUI32HPneHQdfTNIHHf3arQmO
   zROg5Fj6eMbhMofpg6jIyuWV8j+eEQIYQfO+Er6XHOE9MK7oqAPHOPzhj
   d2oeNsOz5DdF8vlFAr+s3SHrEInU6IW9hM7XxvJuc6pFs6wXg4zl1axOl
   btnGreW47SZeiQlDbetN1zd/MTYm8MHoPnM6dRSuHJJQQYduLrrPOaffd
   LNeOmaXlx7sS/dktkT8aV3C5d0gtkOEpxU5YG7/U57fdgSdhoj2ytl+WA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374688535"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="374688535"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 01:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072795080"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="1072795080"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Sep 2023 01:41:57 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeAaI-00013F-1h;
	Thu, 07 Sep 2023 08:41:54 +0000
Date: Thu, 7 Sep 2023 16:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/7]
 arch/arm64/kvm/hyp/nvhe/switch.c:337:5: warning: no previous prototype for
 '__pkvm_register_hyp_panic_notifier'
Message-ID: <202309071629.k4elZIr8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   89a4bca2629d5169c163e3ec353812226b0a1435
commit: 191c0276be9ad766609acf822b4e2be5e38dbffb [2/7] ANDROID: KVM: arm64: Introduce a hyp panic module notifier
config: arm64-randconfig-r035-20230906 (https://download.01.org/0day-ci/archive/20230907/202309071629.k4elZIr8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309071629.k4elZIr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071629.k4elZIr8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/switch.c:183:43: warning: initialized field overwritten [-Woverride-init]
     183 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:183:43: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/nvhe/switch.c:184:43: warning: initialized field overwritten [-Woverride-init]
     184 |         [ESR_ELx_EC_HVC64]              = kvm_hyp_handle_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:184:43: note: (near initialization for 'hyp_exit_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/switch.c:185:43: warning: initialized field overwritten [-Woverride-init]
     185 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:185:43: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:186:43: warning: initialized field overwritten [-Woverride-init]
     186 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:43: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:187:43: warning: initialized field overwritten [-Woverride-init]
     187 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:187:43: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:188:43: warning: initialized field overwritten [-Woverride-init]
     188 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:188:43: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:189:43: warning: initialized field overwritten [-Woverride-init]
     189 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:189:43: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:190:43: warning: initialized field overwritten [-Woverride-init]
     190 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:190:43: note: (near initialization for 'hyp_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:195:43: warning: initialized field overwritten [-Woverride-init]
     195 |         [ESR_ELx_EC_HVC64]              = kvm_handle_pvm_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:195:43: note: (near initialization for 'pvm_exit_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/switch.c:196:43: warning: initialized field overwritten [-Woverride-init]
     196 |         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:196:43: note: (near initialization for 'pvm_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:197:43: warning: initialized field overwritten [-Woverride-init]
     197 |         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:197:43: note: (near initialization for 'pvm_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:198:43: warning: initialized field overwritten [-Woverride-init]
     198 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:198:43: note: (near initialization for 'pvm_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:199:43: warning: initialized field overwritten [-Woverride-init]
     199 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:199:43: note: (near initialization for 'pvm_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:200:43: warning: initialized field overwritten [-Woverride-init]
     200 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:200:43: note: (near initialization for 'pvm_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:201:43: warning: initialized field overwritten [-Woverride-init]
     201 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:201:43: note: (near initialization for 'pvm_exit_handlers[9]')
>> arch/arm64/kvm/hyp/nvhe/switch.c:337:5: warning: no previous prototype for '__pkvm_register_hyp_panic_notifier' [-Wmissing-prototypes]
     337 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct kvm_cpu_context *host_ctxt))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:342:28: warning: no previous prototype for 'hyp_panic' [-Wmissing-prototypes]
     342 | asmlinkage void __noreturn hyp_panic(void)
         |                            ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:371:28: warning: no previous prototype for 'hyp_panic_bad_stack' [-Wmissing-prototypes]
     371 | asmlinkage void __noreturn hyp_panic_bad_stack(void)
         |                            ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:376:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     376 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__pkvm_register_hyp_panic_notifier +337 arch/arm64/kvm/hyp/nvhe/switch.c

   335	
   336	static void (*hyp_panic_notifier)(struct kvm_cpu_context *host_ctxt);
 > 337	int __pkvm_register_hyp_panic_notifier(void (*cb)(struct kvm_cpu_context *host_ctxt))
   338	{
   339		return cmpxchg(&hyp_panic_notifier, NULL, cb) ? -EBUSY : 0;
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
