Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3BA205AA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 16:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731428855; cv=none; b=dRgreoMEDJRsSQxVhDMkp9BuQCW4BfST4ajzqijZsfi33v/28yTNoHwUXHDoWTKjHaptZSRKOW3du0ZffU2UXFAU1+wRgTDqEu0lwOI/lMS+a+Cb6avX1PuysYiZgWrzKklTDAE3D6S5ySNd7zAcdGs//58FMJQ19oEwiT2NVIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731428855; c=relaxed/simple;
	bh=u3Buv5SXONadfSPID6AfV6Hy52lYyIUuqYcTHgx17hU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ICHr4bGSoU9ClwoC1hkMeOTdW0F13YnEVznzMFZ+/wfuNMaOBF0J19zb+8FNTB9Tw7JKMu8/DwCra/D8XWYAE7IMZOnkkJNoFTEbFVMOji7pKDWVgMdROVMPBxpnJ9ZdwoPbeNyw7ppIOePLFL3oYwQw552vVDG18JgXcQyNqt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bw8kcDWS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bw8kcDWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731428854; x=1762964854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u3Buv5SXONadfSPID6AfV6Hy52lYyIUuqYcTHgx17hU=;
  b=bw8kcDWSTqHu/d8d7H3G+rgpM5Ra66jLxxqJHR+vVJnhWDnaSf1aQLzR
   rMnXcBWm1C1wGO/Dw08YIab9UNLTYI9CS6ANQDxGjZo22wqEJkWB6ASsU
   AVzCPClkAwq4aVB3fvIqr7qYA2fsFIeDBQvusLrtIpdBWq/N/Sf4lpUPS
   WPTngQt+9SR/JHs36bR88dyNA/W3pH7sobwvMYtbz5ORqtUkMnlzv8qtV
   hLP17sNCc6F4JyY7tYnLrhCotkBWhQtIWxVgaQf1OlHlGDk+AzXT/L8gv
   Nz/b1PYiYAERkPf657ySGHI/LQmUMUUBQ1WU3ndDBysLQUwjPMBLwrpwC
   g==;
X-CSE-ConnectionGUID: b3sugX+fRkG1HLzu/kSnEQ==
X-CSE-MsgGUID: l+QIG7tURt6K0meib7uhFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41836527"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41836527"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:27:34 -0800
X-CSE-ConnectionGUID: ygmq3sW2RDuPp2G0jj+1gA==
X-CSE-MsgGUID: 6kjd3/gGSLe4mWNIqNT1WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="88372365"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Nov 2024 08:27:33 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAtjm-0001WF-18;
	Tue, 12 Nov 2024 16:27:30 +0000
Date: Wed, 13 Nov 2024 00:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1074/30000]
 arch/arm64/kvm/fpsimd.c:129:33: error: implicit declaration of function
 'sve_cond_update_zcr_vq'
Message-ID: <202411130017.Jd7DgIfM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   de373c691bd1f70e66cd9b5b249f84ce02188f7f
commit: b0e15c8c44275afef4aacfb1560e38b974b02ac8 [1074/30000] FROMGIT: KVM: arm64: Save/restore SVE state for nVHE
config: arm64-randconfig-r062-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130017.Jd7DgIfM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130017.Jd7DgIfM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130017.Jd7DgIfM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/fpsimd.c: In function 'kvm_arch_vcpu_put_fp':
>> arch/arm64/kvm/fpsimd.c:129:33: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     129 |                                 sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
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


vim +/sve_cond_update_zcr_vq +129 arch/arm64/kvm/fpsimd.c

   108	
   109	/*
   110	 * Write back the vcpu FPSIMD regs if they are dirty, and invalidate the
   111	 * cpu FPSIMD regs so that they can't be spuriously reused if this vcpu
   112	 * disappears and another task or vcpu appears that recycles the same
   113	 * struct fpsimd_state.
   114	 */
   115	void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
   116	{
   117		unsigned long flags;
   118		bool host_has_sve = system_supports_sve();
   119		bool guest_has_sve = vcpu_has_sve(vcpu);
   120	
   121		local_irq_save(flags);
   122	
   123		if (vcpu->arch.flags & KVM_ARM64_FP_ENABLED) {
   124			if (guest_has_sve) {
   125				__vcpu_sys_reg(vcpu, ZCR_EL1) = read_sysreg_el1(SYS_ZCR);
   126	
   127				/* Restore the VL that was saved when bound to the CPU */
   128				if (!has_vhe())
 > 129					sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
