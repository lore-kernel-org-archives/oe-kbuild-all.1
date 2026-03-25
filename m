Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C559023D291
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 15:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452195; cv=none; b=r7Vqq1FXD03KmMT0lBKKvOjU7b3TnWZsiyEQ2BzB/aUweDUrXgB7j6Pxh7HXDal0DORFG900Zc07mF5iKxrA/SPpEIA+6whFb/e84USPQmJikLSTtHrrP0i4cgJCaKN4qGHZnHYn2LjYlSHE+STkz2ubfCqABrO0xz0PY3EGxrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452195; c=relaxed/simple;
	bh=dKYKbIw8BE1CFqfs79B8vp7USF48H8mmcVvt0VN/WeU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CYVJW6OctXFOg2CKM4Hth+ElInk5GkHESYiyqBYjYeU7PEBhdI4WlQjkhY6SOz9N1XsuhhIU5AIyBBMTfc8CQFfONNC02Z93ex+haM/HoIAjFT9dW28cvWpa/Y6Ql7JgkZdyDkmTJ+24sN1dT13qfr04rescCp0u+b7C6X2iLKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmREL0Iw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmREL0Iw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774452193; x=1805988193;
  h=date:from:to:cc:subject:message-id;
  bh=dKYKbIw8BE1CFqfs79B8vp7USF48H8mmcVvt0VN/WeU=;
  b=kmREL0IwweF7GqcHB2a5nKLOA5zPlOT/uqCtiyDMJzMpWxdaROOYDVBE
   dYfhnp2hqvjMmCfXmvEN28YmMxgH1zlgMVCtydpG8QHLc7T1+MYltBmde
   anfaYLyIQSWvwfDhFtpC4JutrIQU1UB7BWnOddyTHwmfCsT9b9tJwRL6D
   w3Q86PabRTgkegzoHsCOwwWVdQqZMkGsxTlxQVnYFlMF4Gmnwef4RILKO
   x2V6aCIf9Z+ul/XDDK4p065wMSXnwlaQZEWS6t8c0a7l5IQ0o6K0vRLxF
   H4K3OnIDdPni95JtivQmTxqBT6FF8LV3nNk9houuSHhr8ZWhjzRTohZCg
   A==;
X-CSE-ConnectionGUID: y9nlR9qHRCaiIwAPWbk4PA==
X-CSE-MsgGUID: IRKDVOu/RwOOyTXtOw1QsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86572243"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86572243"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 08:23:00 -0700
X-CSE-ConnectionGUID: VuGJOWEPQ4Ss2Ek3n2vfvQ==
X-CSE-MsgGUID: kHJCCtJJSCuFBqvTx8usAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="248211225"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2026 08:22:59 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Q4O-0000000077h-3Ign;
	Wed, 25 Mar 2026 15:22:56 +0000
Date: Wed, 25 Mar 2026 23:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 arch/arm64/kvm/hyp/nvhe/switch.c:411:5: warning: no previous prototype for
 '__pkvm_register_hyp_panic_notifier'
Message-ID: <202603252315.lKbm8ENn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: 9cf9fea7b7c229f272fdd6a9d9cbb114ff69c352 [1/1] ANDROID: KVM: arm64: Introduce a hyp panic module notifier
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260325/202603252315.lKbm8ENn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252315.lKbm8ENn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603252315.lKbm8ENn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/switch.c:233:43: warning: initialized field overwritten [-Woverride-init]
     233 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:233:43: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/nvhe/switch.c:234:43: warning: initialized field overwritten [-Woverride-init]
     234 |         [ESR_ELx_EC_HVC64]              = kvm_hyp_handle_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:234:43: note: (near initialization for 'hyp_exit_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/switch.c:235:43: warning: initialized field overwritten [-Woverride-init]
     235 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:235:43: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:236:43: warning: initialized field overwritten [-Woverride-init]
     236 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:236:43: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:237:43: warning: initialized field overwritten [-Woverride-init]
     237 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:237:43: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:238:43: warning: initialized field overwritten [-Woverride-init]
     238 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:238:43: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:239:43: warning: initialized field overwritten [-Woverride-init]
     239 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:239:43: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:240:43: warning: initialized field overwritten [-Woverride-init]
     240 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:240:43: note: (near initialization for 'hyp_exit_handlers[52]')
   arch/arm64/kvm/hyp/nvhe/switch.c:241:43: warning: initialized field overwritten [-Woverride-init]
     241 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:241:43: note: (near initialization for 'hyp_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:246:43: warning: initialized field overwritten [-Woverride-init]
     246 |         [ESR_ELx_EC_HVC64]              = kvm_handle_pvm_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:246:43: note: (near initialization for 'pvm_exit_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/switch.c:247:43: warning: initialized field overwritten [-Woverride-init]
     247 |         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:247:43: note: (near initialization for 'pvm_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:248:43: warning: initialized field overwritten [-Woverride-init]
     248 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:248:43: note: (near initialization for 'pvm_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:249:43: warning: initialized field overwritten [-Woverride-init]
     249 |         [ESR_ELx_EC_SME]                = kvm_handle_pvm_restricted,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:249:43: note: (near initialization for 'pvm_exit_handlers[29]')
   arch/arm64/kvm/hyp/nvhe/switch.c:250:43: warning: initialized field overwritten [-Woverride-init]
     250 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:250:43: note: (near initialization for 'pvm_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:251:43: warning: initialized field overwritten [-Woverride-init]
     251 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:251:43: note: (near initialization for 'pvm_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:252:43: warning: initialized field overwritten [-Woverride-init]
     252 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:252:43: note: (near initialization for 'pvm_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:253:43: warning: initialized field overwritten [-Woverride-init]
     253 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:253:43: note: (near initialization for 'pvm_exit_handlers[52]')
   arch/arm64/kvm/hyp/nvhe/switch.c:254:43: warning: initialized field overwritten [-Woverride-init]
     254 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:254:43: note: (near initialization for 'pvm_exit_handlers[9]')
>> arch/arm64/kvm/hyp/nvhe/switch.c:411:5: warning: no previous prototype for '__pkvm_register_hyp_panic_notifier' [-Wmissing-prototypes]
     411 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__pkvm_register_hyp_panic_notifier +411 arch/arm64/kvm/hyp/nvhe/switch.c

   409	
   410	static void (*hyp_panic_notifier)(struct user_pt_regs *regs);
 > 411	int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
   412	{
   413		return cmpxchg(&hyp_panic_notifier, NULL, cb) ? -EBUSY : 0;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
