Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31D0184
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 00:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689640695; x=1721176695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PGBRMkOfMUAwuX7ltwOQmIGXaubdZ4Fx9vJR3Y57ABs=;
  b=DAW2gEAiD1ouy9iRcPVfQO2RsdBHWdGPKx2DY62msNA67JKUh7nAEkuu
   zPtrBQhpKsUN4LCG5OsbR/bJdR97Svbyc4jJYM3EDQj1pcD/Mh8Tx3Ppk
   MvqAo87f9GRgseittHUlErAHEpjv3ZseRjFbAAogjKfGeOHFHrhOwmJCH
   JnuESOCkxsJOWE/cX7FxnYLurD8u6qA2W5SMcdNH2w/HLRoW/D5DahEKX
   v6mXPXOEfTOBXIHAHv4gOFVo+6Fcc8FQfk6xA3fPGcKueC2DeyZEhX5Em
   R2ENcNsbRkR3lPp+NkcygFQDoWxV8ifYq/OEtDDY30T6PorQOh4vdvOxT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452450717"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="452450717"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 17:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="788851653"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="788851653"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jul 2023 17:38:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLYjF-000A1i-0s;
	Tue, 18 Jul 2023 00:38:13 +0000
Date: Tue, 18 Jul 2023 08:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 6733/27219]
 arch/arm64/kvm/fpsimd.c:129:33: error: implicit declaration of function
 'sve_cond_update_zcr_vq'
Message-ID: <202307180820.tMSXrKnN-lkp@intel.com>
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
head:   f48a4c3b296eb7cf187021f0bb6b9150c5aa74c7
commit: b0e15c8c44275afef4aacfb1560e38b974b02ac8 [6733/27219] FROMGIT: KVM: arm64: Save/restore SVE state for nVHE
config: arm64-randconfig-r024-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180820.tMSXrKnN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180820.tMSXrKnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180820.tMSXrKnN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/fpsimd.c: In function 'kvm_arch_vcpu_put_fp':
>> arch/arm64/kvm/fpsimd.c:129:33: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     129 |                                 sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
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
