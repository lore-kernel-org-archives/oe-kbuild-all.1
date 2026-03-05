Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3824033985
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 00:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672215; cv=none; b=sWCZqeMdauJ/eHny9sKPmcQh1FTru0LxXPaFIkK1hpEtKZ08yoDzbKgVjJRkMHFne92kaH6+3T/30TdHunZiqRaSxR4JbP39Oj9u6y1NzsraNvngOkOnABxnkfxTW6g+4ZtPI0w8Ijlc72uFNUURCADavKu+vzA6825nAR/MImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672215; c=relaxed/simple;
	bh=Wupy7nzu0aB2IcIsUs1kL0G4vKmsTW5GdqaASiNo9xs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PHpSIIq+PwCA1sdTzctnsh+o54jjRXjewDncKi3aAWNYx6VwSUC4kDzvHtUG+abDN1Yq9vlN4s6DkONffU2b393s9k+Eoz5heIY2fiiLl0I4H0QLTBYlIwulUEKKYExtxqMG588y1aiJGK0jO+4eVDbpgIP6RnP+c3dtcHYUwrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKfKHhFn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKfKHhFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772672215; x=1804208215;
  h=date:from:to:cc:subject:message-id;
  bh=Wupy7nzu0aB2IcIsUs1kL0G4vKmsTW5GdqaASiNo9xs=;
  b=kKfKHhFnC3WfDoFqP09j2swLAiL2ALiem552zDAUIwLYyYf93nojOtBE
   5WkxA4u2G+uR3EVOVFrer3eAchoJncEnv14WK1PWDl7u7Erj3BdxdYmU5
   6agB2OhNeL6cf0JCNxYLtqIcR2gRIsJoX7Y+8CCrtJPO9QprFYAbfJsH2
   5TkCNjse4ecCfL5FE83HlmzWS5cyPv9xhbprbqLs084ZPm7IAHF3Y0klT
   NgkWm/DX2viP0n0Pc+fa5w6+9e7n5t2uCv4n6Q2YSR9azFE1SGzcb8pKh
   6jTHYrIe/JeMsc8gIdWmpt+5AExpTyizWkql5Qrmb1OQ9B1sccZVeFHo0
   w==;
X-CSE-ConnectionGUID: agiCiEMiTdWHSzd5C1JdAQ==
X-CSE-MsgGUID: rCsqCINkT2K0+Mft3DQg2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77591753"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="77591753"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 16:56:54 -0800
X-CSE-ConnectionGUID: gkBfxmj7Qw+7rtnXXCu8yQ==
X-CSE-MsgGUID: L4+YKP3/TASIP5WxA6dkGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="218502040"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2026 16:56:52 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxx1F-000000004sZ-3fcU;
	Thu, 05 Mar 2026 00:56:49 +0000
Date: Thu, 05 Mar 2026 08:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 6/6]
 arch/arm64/kvm/fpsimd.c:129:5: error: implicit declaration of function
 'sve_cond_update_zcr_vq'
Message-ID: <202603050809.LlBgdQDP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Marc,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   8426c769398ef6f4ac3f61df3f3ec10bd11b0e50
commit: b0e15c8c44275afef4aacfb1560e38b974b02ac8 [6/6] FROMGIT: KVM: arm64: Save/restore SVE state for nVHE
config: arm64-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050809.LlBgdQDP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050809.LlBgdQDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050809.LlBgdQDP-lkp@intel.com/

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
