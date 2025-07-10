Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06C539A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 00:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752108828; cv=none; b=MqfLnYvI7TV/ANqmXPkMBKhkajnHUpoGlSKyb7vfcU1QFbQCz2HuxOVtKo8i46pfFfQGGg5mybDr/6arPLzUeFiG0iwoKWY+Ht/rrA9kqwJfG3p1e+7oorqshDb09GIQWUc2FwJBd+XacL/3M8qzMus3w06HFF38thtjLyshTtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752108828; c=relaxed/simple;
	bh=YAzD1zPFWkIBQiWhkxrd/o57Zxzi7xi5u3oL58PN0Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ku2dzroMoR1QfXytKSfBHnnhj0U1ZXwE3+mc2nSqvgDlwXq4+mT2dOsISu+Peae5BUoekPxOWoLAWSxClYjj+2fEAq7POXF6POzOPHlm76gcQQGa0wixEBJ6InO3Ud3Cw3Ba0H7GfvkNOJBH3Llzmf6JWbddjYof9DJKu7AJNns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btJhLNZF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btJhLNZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752108826; x=1783644826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YAzD1zPFWkIBQiWhkxrd/o57Zxzi7xi5u3oL58PN0Uc=;
  b=btJhLNZFboWKjuzix/2F8++teSOpy/HEb1N0/oojz3oV1swClh/Jt2T6
   SOiZL4RrSiBFYHefdUmMo33aO7aAeo0Q/RJgFp98RXjPvvkzvTtucbKTD
   tArtZQPkl/ExG7krmOxonkT6l3J4Kn+yJtJ7hdc9JbzT+ULPYIhP+/jZU
   ksf30F/anVIQ4EBSBDfki9d0sLrt20gPMt2Dgmoa+ntiPNgmfm991eRgX
   ySUW6nLNTRqTC6BU0BELlWl7P+9EB9sjcRhzjGjqpP7m0AMpfVe93fEjr
   RzwDeNF3PSQAKhE2dfLIg0RadEx2HJqEnMdnN5cwJ89PjjRxDurBJdXMx
   Q==;
X-CSE-ConnectionGUID: 6Ww6NffWQJa4953eZzrMdQ==
X-CSE-MsgGUID: qNknXI3cQyKhu1bQoBxHeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53491582"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="53491582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 17:53:46 -0700
X-CSE-ConnectionGUID: BFJv4Cv+Q5uQv89ggknyPA==
X-CSE-MsgGUID: eiVDl+QXSzaFu3a304NuPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="161480760"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jul 2025 17:53:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZfXj-0004GR-0J;
	Thu, 10 Jul 2025 00:53:43 +0000
Date: Thu, 10 Jul 2025 08:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap-for-next 9/9] arch/arm64/kvm/sys_regs.c:2627:3:
 warning: ignoring return value of function declared with
 'warn_unused_result' attribute
Message-ID: <202507100832.pW0wqkAO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bitmap-for-next
head:   f66f9c3d09c12f6ceea17d1ba22be2cb8bc9e4e4
commit: f66f9c3d09c12f6ceea17d1ba22be2cb8bc9e4e4 [9/9] bitfield: Ensure the return values of helper functions are checked
config: arm64-randconfig-001-20250710 (https://download.01.org/0day-ci/archive/20250710/202507100832.pW0wqkAO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100832.pW0wqkAO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100832.pW0wqkAO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/sys_regs.c:2627:3: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
    2627 |                 u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
         |                 ^~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/warn_unused_result +2627 arch/arm64/kvm/sys_regs.c

a68cddbe47efda Mark Brown   2024-10-23  2605  
d3ba35b69eaed0 Oliver Upton 2024-12-17  2606  static bool access_mdcr(struct kvm_vcpu *vcpu,
d3ba35b69eaed0 Oliver Upton 2024-12-17  2607  			struct sys_reg_params *p,
d3ba35b69eaed0 Oliver Upton 2024-12-17  2608  			const struct sys_reg_desc *r)
d3ba35b69eaed0 Oliver Upton 2024-12-17  2609  {
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2610  	u64 hpmn, val, old = __vcpu_sys_reg(vcpu, MDCR_EL2);
d3ba35b69eaed0 Oliver Upton 2024-12-17  2611  
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2612  	if (!p->is_write) {
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2613  		p->regval = old;
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2614  		return true;
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2615  	}
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2616  
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2617  	val = p->regval;
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2618  	hpmn = FIELD_GET(MDCR_EL2_HPMN, val);
d3ba35b69eaed0 Oliver Upton 2024-12-17  2619  
d3ba35b69eaed0 Oliver Upton 2024-12-17  2620  	/*
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2621  	 * If HPMN is out of bounds, limit it to what we actually
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2622  	 * support. This matches the UNKNOWN definition of the field
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2623  	 * in that case, and keeps the emulation simple. Sort of.
d3ba35b69eaed0 Oliver Upton 2024-12-17  2624  	 */
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2625  	if (hpmn > vcpu->kvm->arch.nr_pmu_counters) {
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2626  		hpmn = vcpu->kvm->arch.nr_pmu_counters;
efff9dd2fee7a5 Marc Zyngier 2025-04-09 @2627  		u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2628  	}
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2629  
6678791ee3da0b Marc Zyngier 2025-06-03  2630  	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
d3ba35b69eaed0 Oliver Upton 2024-12-17  2631  
d3ba35b69eaed0 Oliver Upton 2024-12-17  2632  	/*
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2633  	 * Request a reload of the PMU to enable/disable the counters
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2634  	 * affected by HPME.
d3ba35b69eaed0 Oliver Upton 2024-12-17  2635  	 */
efff9dd2fee7a5 Marc Zyngier 2025-04-09  2636  	if ((old ^ val) & MDCR_EL2_HPME)
d3ba35b69eaed0 Oliver Upton 2024-12-17  2637  		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
d3ba35b69eaed0 Oliver Upton 2024-12-17  2638  
d3ba35b69eaed0 Oliver Upton 2024-12-17  2639  	return true;
d3ba35b69eaed0 Oliver Upton 2024-12-17  2640  }
d3ba35b69eaed0 Oliver Upton 2024-12-17  2641  

:::::: The code at line 2627 was first introduced by commit
:::::: efff9dd2fee7a5969b5b2a04995e638c3ba15826 KVM: arm64: Handle out-of-bound write to MDCR_EL2.HPMN

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
