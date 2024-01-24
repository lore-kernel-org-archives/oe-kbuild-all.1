Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4342566
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 01:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706058285; cv=none; b=kzkf354ByU6otcRpLBLPcWZymTGjfHzQXZNAVOums451c40PEcVx+nF1p+VTNrlpH5J151krlFMpW40pzhMFZmAPtpdeNFgkFaz9iH8l+GVy8U03rfXPxOWqAIno5W4bOwZvWbPk5zhqL+2LkCi3f5eUbJAt5SMS3ipOe4O6UTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706058285; c=relaxed/simple;
	bh=dQy7bXzZiboJrL943crhX3HZ+bl2o3S4+wANDonLBb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nyCgZ6HBpb6SGuR6NbYgn1eZ9B5HZpiDYqGHNYDZQLA229krRybmCrbEQZECKiyAr7LX5rl7eeguVUv/3IAEI2HpRvTSq2QrqQegbDx6TERtjnXNL6QSiNsx4P6nSUqO5Po2pEPYqe727oR9he5ni2Zm1Psyz9Q/uut3IGIVnJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXAq5uc2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXAq5uc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706058283; x=1737594283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dQy7bXzZiboJrL943crhX3HZ+bl2o3S4+wANDonLBb8=;
  b=gXAq5uc2ewiC1bCANlFn54CfzZmkcPBqXOhp8vCdeYqj6OlLg7nR+WA8
   PKVP/XBS0quCdDYTv/9mlfGxp7AC3Nz5LHgPtcQCiO6W+3KwD3Q2SmX88
   sDFldGrCsoTv1YD5QsVemz15tZMGSXTR7XGVizAS9w9eWYNS9Szr2qUb8
   6wT2nDLfKKqgYn1MMIXS4KPSFbTrS3UuUCm1vE/ItBsqzujDbsN5egLNE
   u+vXUhojgillqkiFrI+SIklVlQxkiEpbedA/vEB/d1JFi4e3ihvxcK97y
   3z60Xz8cVcNiwHUCX7kPLCpKdC4q1x1Dnb6Gr4ODjxYhBKwGznrHztoGT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8376810"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8376810"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 17:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905434201"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="905434201"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2024 17:04:40 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSRh0-0007lZ-0Z;
	Wed, 24 Jan 2024 01:04:38 +0000
Date: Wed, 24 Jan 2024 09:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 124/175]
 arch/arm64/kvm/hyp/nvhe/switch.c:215:21: warning: unused variable 'vq_len'
Message-ID: <202401240818.PV8HIda4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   faf8e92b3bdd8457b68cf85e37cdcd4a4ed867e9
commit: 77171b3bd4d8077169a1164ef0c6bfd432923f50 [124/175] ANDROID: KVM: arm64: Save and restore host sve state in pKVM
config: arm64-randconfig-002-20240123 (https://download.01.org/0day-ci/archive/20240124/202401240818.PV8HIda4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401240818.PV8HIda4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240818.PV8HIda4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/switch.c: In function 'kvm_hyp_handle_fpsimd_host':
>> arch/arm64/kvm/hyp/nvhe/switch.c:215:21: warning: unused variable 'vq_len' [-Wunused-variable]
     215 |                 u64 vq_len = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
         |                     ^~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c: At top level:
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
     248 |         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:248:43: note: (near initialization for 'pvm_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:249:43: warning: initialized field overwritten [-Woverride-init]
     249 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:249:43: note: (near initialization for 'pvm_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:250:43: warning: initialized field overwritten [-Woverride-init]
     250 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:250:43: note: (near initialization for 'pvm_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:251:43: warning: initialized field overwritten [-Woverride-init]
     251 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:251:43: note: (near initialization for 'pvm_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:252:43: warning: initialized field overwritten [-Woverride-init]
     252 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:252:43: note: (near initialization for 'pvm_exit_handlers[52]')
   arch/arm64/kvm/hyp/nvhe/switch.c:253:43: warning: initialized field overwritten [-Woverride-init]
     253 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:253:43: note: (near initialization for 'pvm_exit_handlers[9]')
--
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:371:43: warning: initialized field overwritten [-Woverride-init]
     371 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:371:43: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:372:43: warning: initialized field overwritten [-Woverride-init]
     372 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:372:43: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:373:43: warning: initialized field overwritten [-Woverride-init]
     373 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:373:43: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:374:43: warning: initialized field overwritten [-Woverride-init]
     374 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:374:43: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:375:43: warning: initialized field overwritten [-Woverride-init]
     375 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:375:43: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:380:43: warning: initialized field overwritten [-Woverride-init]
     380 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:380:43: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:381:43: warning: initialized field overwritten [-Woverride-init]
     381 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:381:43: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:382:43: warning: initialized field overwritten [-Woverride-init]
     382 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:382:43: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:383:43: warning: initialized field overwritten [-Woverride-init]
     383 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:383:43: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:384:43: warning: initialized field overwritten [-Woverride-init]
     384 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:384:43: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:393:43: warning: initialized field overwritten [-Woverride-init]
     393 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:393:43: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:394:43: warning: initialized field overwritten [-Woverride-init]
     394 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:394:43: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'fpsimd_host_restore':
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:679:29: warning: unused variable 'vq_len' [-Wunused-variable]
     679 |                         u64 vq_len = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
         |                             ^~~~~~


vim +/vq_len +215 arch/arm64/kvm/hyp/nvhe/switch.c

   205	
   206	static void kvm_hyp_handle_fpsimd_host(struct kvm_vcpu *vcpu)
   207	{
   208		/*
   209		 * Non-protected kvm relies on the host restoring its sve state.
   210		 * Protected kvm restores the host's sve state as not to reveal that
   211		 * fpsimd was used by a guest nor leak upper sve bits.
   212		 */
   213		if (unlikely(is_protected_kvm_enabled() && system_supports_sve())) {
   214			struct kvm_host_sve_state *sve_state = get_host_sve_state(vcpu);
 > 215			u64 vq_len = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
   216	
   217			sve_state->zcr_el1 = read_sysreg_el1(SYS_ZCR);
   218			sve_cond_update_zcr_vq(vq_len, SYS_ZCR_EL2);
   219			__sve_save_state(sve_state->sve_regs +
   220						 sve_ffr_offset(kvm_host_sve_max_vl),
   221					 &sve_state->fpsr);
   222	
   223			/* Still trap SVE since it's handled by hyp in pKVM. */
   224			if (!vcpu_has_sve(vcpu))
   225				sysreg_clear_set(cptr_el2, 0, CPTR_EL2_TZ);
   226		} else {
   227			__fpsimd_save_state(get_host_fpsimd_state(vcpu));
   228		}
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
