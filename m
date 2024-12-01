Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235635789D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 21:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733087147; cv=none; b=FRftH7j/q8Yj4bwsXEC2yV3+guQFciQXAkenU9Oobq2qyisFtkGKA3m1Rmp0qxJYr7T/iBxMJao/0fYrYRfhVX6rzLx2/J75d/7WWgLdd1CuSKT29gFAmb+aK0DVA2gNffg2CZdXPVZXVYH8ynB6wjqQ0inhWiPOcYshmRGsKUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733087147; c=relaxed/simple;
	bh=yPF8cnRZT0rGkZxjogU+auVEbC+VsYhhnkTJWgeOx9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQZu6pQLXGVW7OQj9QKE134QRH6CPVfMaRXW67CFDaiSfZatYFBUGlAobFZr7929fHyrH+4gxmLtoJ7tXFhWH4Q6apCO79OpCpjhSk/cwIok2IeHU9zkoYAJC8s390V+wFLG/S96HgUU8nK4o9nTtE0wEfQvIS4qO/DSWfm3cdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S80Y1Bqy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S80Y1Bqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733087145; x=1764623145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yPF8cnRZT0rGkZxjogU+auVEbC+VsYhhnkTJWgeOx9M=;
  b=S80Y1BqyHaXH/1RCfqNLUtyAajNgJKkmQ1kKUelAdVbjV4pmnfIcv0/P
   /svE3VvnKhXOTOSrMUW/RLS4iOFAnINtp5eMa4s/S8HgCzZucyz7aCWL8
   7ubU5gRcxypsZzWzmDQT1RujRS/0iN9GUYoQ++UZYiooHGESUMKjvnZrT
   z/6RTqTxvEBLXEBaz2NBxBwZHc2veehA4JvXAFBBAoeHG/lykGH/8h+Lb
   fGh00nYPaPGoLFyr68Ron9CkW9UEseV6po+ATDU1ZEbiZu/HF3PIU88ux
   02iIketfRzpCtH1IZVKIviz4wdHoFmmBx3qoh3dS0ri2OT3c6vK+PmHCg
   A==;
X-CSE-ConnectionGUID: jixlcZaqTEG8IHlibf0V+A==
X-CSE-MsgGUID: EwM0TpmJTlOr8JSv72Dqew==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="43730978"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="43730978"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 13:05:45 -0800
X-CSE-ConnectionGUID: wMuwf3TqRua9Mx+rEAzL8w==
X-CSE-MsgGUID: J3ogunxpQW2t9vJOdTGCgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93093111"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Dec 2024 13:05:43 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHr8P-0001qR-1F;
	Sun, 01 Dec 2024 21:05:41 +0000
Date: Mon, 2 Dec 2024 05:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 382/30000]
 arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration
 of function 'sve_cond_update_zcr_vq'
Message-ID: <202412020400.2YhUc55k-lkp@intel.com>
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
head:   b0e9b554c383a988e7185baf9fdee7d959b8de3e
commit: 1105b4d1cef4bc19ad20129a716194268c937eaf [382/30000] BACKPORT: FROMGIT: KVM: arm64: Rework SVE host-save/guest-restore
config: arm64-randconfig-r062-20241112 (https://download.01.org/0day-ci/archive/20241202/202412020400.2YhUc55k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020400.2YhUc55k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020400.2YhUc55k-lkp@intel.com/

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
