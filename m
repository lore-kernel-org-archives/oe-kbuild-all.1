Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64194503F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 17:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520384; cv=none; b=NTFcS/VnKyv0YJ3YIgcDA4hF4nZDSz6N2o3GKx70fhz0qALUM9G++UdzZIZDwQ8/lBmjFKHbxyoP3SjtcFar/inp0FP9PVj8vqXcTWuegniZIKjmFsSaB+H6VKrheYBfaHLesDl/fk4DP/1uXV7dPxon6gELIvcNGJXfytz//tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520384; c=relaxed/simple;
	bh=JJSJWIvYCuOXjRf1uk00gulmHSNfCVztIVLOheqM6dw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gU19r3zcslStlp+xCS+CzlUdOJ4U3TaQ+iDzlhbeEwWec7tPFaxxpAN9n5JZQitH6IivzaORptXzIO8mmuPOOqtORhfiVX0wFIsQzi3uCZgjxIq9alr6y5qjG69rX3NWHpz1g4vv/hHGbc69t/IQZ8RpJ82UURk0MayAFBPXw5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmAAHuFA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmAAHuFA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785520382; x=1817056382;
  h=date:from:to:cc:subject:message-id;
  bh=JJSJWIvYCuOXjRf1uk00gulmHSNfCVztIVLOheqM6dw=;
  b=VmAAHuFAtySWl92Tnh0tWcaaTsZY/9SqgtIWL1qtBQQvj8MMeg247EPU
   jJVMNqxNCgXPQyNFl9s+qtdW6Vsb+y6IIxPmXOV5nOPP78cjQj7Eo7INg
   pze3qANpSh2dRu3b8mBJ7kyWyyhq2CfB+xTT470rrroWpTo6lhgN3TMDb
   5t4z1en6YuSi0JyRkspxpB9/YlVLfhaZ1U/QiR+WbCTfUYf2sRjIfXL4Y
   X84w4Xpjc93f6aaOGj+WbKIXU7tpMFdYVTFZHeZN1BX/YJr/qurc57Ydg
   +nf2x+DJKLqG5Zm4uqTBKMsEzHzPp9sxj9MJKzNQbia/Ehq2/lcrEeCtP
   Q==;
X-CSE-ConnectionGUID: lafk1LZdTYmAzmmy2LXvMQ==
X-CSE-MsgGUID: VDO6q5TORXW4v2E+qvCvfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="89830132"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="89830132"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 10:53:01 -0700
X-CSE-ConnectionGUID: fJwnGw/aTtKSqkpj3RJMOA==
X-CSE-MsgGUID: GA4EsSknRdqgnncSdh8VXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="261249089"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2026 10:53:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wprPl-000000001ph-3f4V;
	Fri, 31 Jul 2026 17:52:57 +0000
Date: Sat, 01 Aug 2026 01:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/2]
 arch/arm64/kvm/fpsimd.c:129:5: error: implicit declaration of function
 'sve_cond_update_zcr_vq'
Message-ID: <202608010151.ZErMgrN9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Marc,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   1290154c48656bd1012a837076a0fbe379330eb3
commit: b0e15c8c44275afef4aacfb1560e38b974b02ac8 [2/2] FROMGIT: KVM: arm64: Save/restore SVE state for nVHE
config: arm64-randconfig-003-20260731 (https://download.01.org/0day-ci/archive/20260801/202608010151.ZErMgrN9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010151.ZErMgrN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010151.ZErMgrN9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/fpsimd.c: In function 'kvm_arch_vcpu_put_fp':
>> arch/arm64/kvm/fpsimd.c:129:5: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     129 |     sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
