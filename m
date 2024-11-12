Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034D14387B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731418750; cv=none; b=G5Mj1lysZ8RORj435jXGNFcSc44BQjNkv6BT9ynMGypMVSgkiMj+5j1C0fu8c1EA1kezMEPF56i681ejQws8CUjKykjU9AnY8BaT/8GbLL4xpkEjZPWn3CvigqYZPrX4gfAwdqs5mgAO7Nklb4tYDI/oHLIlq4khlW0yqTlp9Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731418750; c=relaxed/simple;
	bh=cnp77poCibxQMTOeDXtOLXYgNWh98jc9B7VyMylQ1EE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OcEZmh8hyjoVvX2OUZaeYVuHv4dgboX8fhI/5pQcamHSzgq9yb+zbJuXxQZrqVs/L/owSv6ADgg6XTpKTkjeHEEy5f4gsrRfWCx3a7sNg8l6EzvohTuAufux5CI3REED48PTlgRX2ZUN/mUlyyTQApBcr63fI3HiqpT3Lf77XOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXiOrMXh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXiOrMXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731418749; x=1762954749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnp77poCibxQMTOeDXtOLXYgNWh98jc9B7VyMylQ1EE=;
  b=FXiOrMXhpPQKq+m5+vuI6LrTMhvV6WOzztLcMpmlMc2pIGjeVvz5HDvZ
   rY2Uc/SzAu/8JWwYvwTCv3RV2BqJXO9hz1dzdBCIs9/6PUcU/jvpocmkc
   +ZwJ/6s7YdD4Zr6XCnQn0RMGQjkFktyGHv3jQ4clDaabiRXQ7bDYH/etd
   mq9BUmFZRKcLiqKFtZmCvPIkk3VAT5RhJgQWi40dFj/rcARBhkdWjFV9n
   emgMF4QAwvb/0Ie/phqnpQxcs6StNbOBU1x5WXMi91RiBXmmFUw4ztKVB
   KfN6t0mlyY0EOUR5/OTc7Nd86NGjqPJZgGQEKaRK4WefMLEEE5L5PRBfM
   Q==;
X-CSE-ConnectionGUID: IYzdCXpNTLS49bQphgkeHg==
X-CSE-MsgGUID: CVsx831eTPa+lVlv6TVABA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31017191"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31017191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 05:39:08 -0800
X-CSE-ConnectionGUID: eXlf84VSSV6p9Ig1rEN6lw==
X-CSE-MsgGUID: YOzzuVUnR7OI5aGJ7rawvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92427181"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Nov 2024 05:39:07 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAr6n-0001MP-0E;
	Tue, 12 Nov 2024 13:39:05 +0000
Date: Tue, 12 Nov 2024 21:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1070/30000]
 arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration
 of function 'sve_cond_update_zcr_vq'
Message-ID: <202411122122.tEVcBCiP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   de373c691bd1f70e66cd9b5b249f84ce02188f7f
commit: 1105b4d1cef4bc19ad20129a716194268c937eaf [1070/30000] BACKPORT: FROMGIT: KVM: arm64: Rework SVE host-save/guest-restore
config: arm64-randconfig-r062-20241112 (https://download.01.org/0day-ci/archive/20241112/202411122122.tEVcBCiP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122122.tEVcBCiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122122.tEVcBCiP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/switch.c:8:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |         sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c: At top level:
   arch/arm64/kvm/hyp/vhe/switch.c:227:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     227 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:8:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |         sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c: At top level:
   arch/arm64/kvm/hyp/nvhe/switch.c:282:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     282 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |         sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: At top level:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:233:6: warning: no previous prototype for 'handle_trap' [-Wmissing-prototypes]
     233 | void handle_trap(struct kvm_cpu_context *host_ctxt)
         |      ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:15:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |         sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +/sve_cond_update_zcr_vq +216 arch/arm64/kvm/hyp/include/hyp/switch.h

   213	
   214	static inline void __hyp_sve_restore_guest(struct kvm_vcpu *vcpu)
   215	{
 > 216		sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
   217		__sve_restore_state(vcpu_sve_pffr(vcpu),
   218				    &vcpu->arch.ctxt.fp_regs.fpsr);
   219		write_sysreg_el1(__vcpu_sys_reg(vcpu, ZCR_EL1), SYS_ZCR);
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
