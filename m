Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B459D17BB7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 02:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713838913; cv=none; b=nWPQSxLmJewiqFPBcJcHw0KIYdyafh9qjMLMHuoNNf5xumDzE9UM5Zq3m733BYcxOfHOniMLGKeGM6+1UBWxv64Lbu5/kHrWAqRMf239vI7aBbijKbBSUq19KEhmLpuQ3TLrbXMtKP48k+i5gm57PCi+j6G6VIW3uqrAooZU0jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713838913; c=relaxed/simple;
	bh=cUJghLu5h1R8k79ThBIQUXGM0+OTlkdJEjfIM2GR2C0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ge+CNhH+PRtTbVZ4ryOGwy9pNvc7AXvhvuQFUnTtT3iuc3iaySf1s7zofq3OkHhNBynbq0GYV8sJ8tSmVhsRfY9a+8LtrGKiunk7YtwjgAyb9PPlUijJnQFlBJQSLK+fmw7ScelUf4SdVDFt8XcI56C3vOXdRMkaRc+3iUFPhlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7q8Bhtw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7q8Bhtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713838912; x=1745374912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cUJghLu5h1R8k79ThBIQUXGM0+OTlkdJEjfIM2GR2C0=;
  b=A7q8Bhtw7SZT8yUay0uIthS+trc99L0gGLlkVpbilMbz9l5dwjHdsRkq
   gEk5VXUkFQlV3fody/g2JtVSgkwMpolxBigKsly6EASZPN2Bg0am5bhIv
   O5gC07SBODmLKePu0EA7XDoFV4p/UAwQhm7/7uIyF2AjfMaU9Ho500yVl
   IdEY1PPzAk+sBC5Ycf3aCTKO4NmG9ptsqL+8QiJo2l5B25YHo2SWpkUVF
   bB6YIww2oVTuMlkuhs3WPolp8Y0jCFcx9Zswnven+MPc6ucBLKnaHCh+1
   42NXrtro4FdmPH8X5Vs3yEBEhGTwuXHqGnl32JhuiP56tQXaFCmJGusWj
   A==;
X-CSE-ConnectionGUID: RG6mbx3FTRujA41hQ3NQ4Q==
X-CSE-MsgGUID: tERTYusUQMS0eK2++oev1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26919671"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="26919671"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 19:21:51 -0700
X-CSE-ConnectionGUID: v1bFKvEHTfC9NTvTTNMW4g==
X-CSE-MsgGUID: dKzyUP1uSy+ssyplkIcNRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29008930"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Apr 2024 19:21:49 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz5n0-0000Oz-2r;
	Tue, 23 Apr 2024 02:21:46 +0000
Date: Tue, 23 Apr 2024 10:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/next-fixes 1/2]
 arch/arm64/kvm/emulate-nested.c:2186:40: error: implicit declaration of
 function 'kvm_auth_eretax'
Message-ID: <202404231049.EYjrvtt4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   6b7fa887ad3e5dbd98add789dbd189aa6d4b4ba3
commit: 12000af23affc31be8359cd8c5af850058b2a173 [1/2] Revert "KVM: arm64: nv: Add emulation for ERETAx instructions"
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240423/202404231049.EYjrvtt4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231049.EYjrvtt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231049.EYjrvtt4-lkp@intel.com/

Note: the jonhunter/tegra/next-fixes HEAD 6b7fa887ad3e5dbd98add789dbd189aa6d4b4ba3 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/arm64/kvm/emulate-nested.c: In function 'kvm_emulate_nested_eret':
>> arch/arm64/kvm/emulate-nested.c:2186:40: error: implicit declaration of function 'kvm_auth_eretax' [-Werror=implicit-function-declaration]
    2186 |         if (esr_iss_is_eretax(esr) && !kvm_auth_eretax(vcpu, &elr)) {
         |                                        ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   arch/arm64/kvm/hyp/vhe/switch.c: In function 'kvm_hyp_handle_eret':
>> arch/arm64/kvm/hyp/vhe/switch.c:247:49: error: implicit declaration of function 'kvm_auth_eretax' [-Werror=implicit-function-declaration]
     247 |                 if (!(vcpu_has_ptrauth(vcpu) && kvm_auth_eretax(vcpu, &elr)))
         |                                                 ^~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c: At top level:
   arch/arm64/kvm/hyp/vhe/switch.c:263:43: warning: initialized field overwritten [-Woverride-init]
     263 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:263:43: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/vhe/switch.c:264:43: warning: initialized field overwritten [-Woverride-init]
     264 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:264:43: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/vhe/switch.c:265:43: warning: initialized field overwritten [-Woverride-init]
     265 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:265:43: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/vhe/switch.c:266:43: warning: initialized field overwritten [-Woverride-init]
     266 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:266:43: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/vhe/switch.c:267:43: warning: initialized field overwritten [-Woverride-init]
     267 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:267:43: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/vhe/switch.c:268:43: warning: initialized field overwritten [-Woverride-init]
     268 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:268:43: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/vhe/switch.c:269:43: warning: initialized field overwritten [-Woverride-init]
     269 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:269:43: note: (near initialization for 'hyp_exit_handlers[52]')
   arch/arm64/kvm/hyp/vhe/switch.c:270:43: warning: initialized field overwritten [-Woverride-init]
     270 |         [ESR_ELx_EC_ERET]               = kvm_hyp_handle_eret,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:270:43: note: (near initialization for 'hyp_exit_handlers[26]')
   arch/arm64/kvm/hyp/vhe/switch.c:271:43: warning: initialized field overwritten [-Woverride-init]
     271 |         [ESR_ELx_EC_MOPS]               = kvm_hyp_handle_mops,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:271:43: note: (near initialization for 'hyp_exit_handlers[39]')
   cc1: some warnings being treated as errors


vim +/kvm_auth_eretax +2186 arch/arm64/kvm/emulate-nested.c

47f3a2fc765ae2 Jintack Lim  2023-02-09  2172  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2173  void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
47f3a2fc765ae2 Jintack Lim  2023-02-09  2174  {
213b3d1ea1612c Marc Zyngier 2024-04-19  2175  	u64 spsr, elr, esr;
47f3a2fc765ae2 Jintack Lim  2023-02-09  2176  
95537f06b9e826 Marc Zyngier 2024-04-19  2177  	/*
95537f06b9e826 Marc Zyngier 2024-04-19  2178  	 * Forward this trap to the virtual EL2 if the virtual
95537f06b9e826 Marc Zyngier 2024-04-19  2179  	 * HCR_EL2.NV bit is set and this is coming from !EL2.
95537f06b9e826 Marc Zyngier 2024-04-19  2180  	 */
95537f06b9e826 Marc Zyngier 2024-04-19  2181  	if (forward_traps(vcpu, HCR_NV))
95537f06b9e826 Marc Zyngier 2024-04-19  2182  		return;
95537f06b9e826 Marc Zyngier 2024-04-19  2183  
213b3d1ea1612c Marc Zyngier 2024-04-19  2184  	/* Check for an ERETAx */
213b3d1ea1612c Marc Zyngier 2024-04-19  2185  	esr = kvm_vcpu_get_esr(vcpu);
213b3d1ea1612c Marc Zyngier 2024-04-19 @2186  	if (esr_iss_is_eretax(esr) && !kvm_auth_eretax(vcpu, &elr)) {
213b3d1ea1612c Marc Zyngier 2024-04-19  2187  		/*
213b3d1ea1612c Marc Zyngier 2024-04-19  2188  		 * Oh no, ERETAx failed to authenticate.  If we have
213b3d1ea1612c Marc Zyngier 2024-04-19  2189  		 * FPACCOMBINE, deliver an exception right away.  If we
213b3d1ea1612c Marc Zyngier 2024-04-19  2190  		 * don't, then let the mangled ELR value trickle down the
213b3d1ea1612c Marc Zyngier 2024-04-19  2191  		 * ERET handling, and the guest will have a little surprise.
213b3d1ea1612c Marc Zyngier 2024-04-19  2192  		 */
213b3d1ea1612c Marc Zyngier 2024-04-19  2193  		if (kvm_has_pauth(vcpu->kvm, FPACCOMBINE)) {
213b3d1ea1612c Marc Zyngier 2024-04-19  2194  			esr &= ESR_ELx_ERET_ISS_ERETA;
213b3d1ea1612c Marc Zyngier 2024-04-19  2195  			esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_FPAC);
213b3d1ea1612c Marc Zyngier 2024-04-19  2196  			kvm_inject_nested_sync(vcpu, esr);
213b3d1ea1612c Marc Zyngier 2024-04-19  2197  			return;
213b3d1ea1612c Marc Zyngier 2024-04-19  2198  		}
213b3d1ea1612c Marc Zyngier 2024-04-19  2199  	}
213b3d1ea1612c Marc Zyngier 2024-04-19  2200  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2201  	preempt_disable();
47f3a2fc765ae2 Jintack Lim  2023-02-09  2202  	kvm_arch_vcpu_put(vcpu);
47f3a2fc765ae2 Jintack Lim  2023-02-09  2203  
dd0717a998f77f Marc Zyngier 2024-04-19  2204  	spsr = __vcpu_sys_reg(vcpu, SPSR_EL2);
dd0717a998f77f Marc Zyngier 2024-04-19  2205  	spsr = kvm_check_illegal_exception_return(vcpu, spsr);
213b3d1ea1612c Marc Zyngier 2024-04-19  2206  	if (!esr_iss_is_eretax(esr))
47f3a2fc765ae2 Jintack Lim  2023-02-09  2207  		elr = __vcpu_sys_reg(vcpu, ELR_EL2);
47f3a2fc765ae2 Jintack Lim  2023-02-09  2208  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2209  	trace_kvm_nested_eret(vcpu, elr, spsr);
47f3a2fc765ae2 Jintack Lim  2023-02-09  2210  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2211  	/*
47f3a2fc765ae2 Jintack Lim  2023-02-09  2212  	 * Note that the current exception level is always the virtual EL2,
47f3a2fc765ae2 Jintack Lim  2023-02-09  2213  	 * since we set HCR_EL2.NV bit only when entering the virtual EL2.
47f3a2fc765ae2 Jintack Lim  2023-02-09  2214  	 */
47f3a2fc765ae2 Jintack Lim  2023-02-09  2215  	*vcpu_pc(vcpu) = elr;
47f3a2fc765ae2 Jintack Lim  2023-02-09  2216  	*vcpu_cpsr(vcpu) = spsr;
47f3a2fc765ae2 Jintack Lim  2023-02-09  2217  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2218  	kvm_arch_vcpu_load(vcpu, smp_processor_id());
47f3a2fc765ae2 Jintack Lim  2023-02-09  2219  	preempt_enable();
47f3a2fc765ae2 Jintack Lim  2023-02-09  2220  }
47f3a2fc765ae2 Jintack Lim  2023-02-09  2221  

:::::: The code at line 2186 was first introduced by commit
:::::: 213b3d1ea1612c6d26153be446923831c4534689 KVM: arm64: nv: Handle ERETA[AB] instructions

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
