Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F513CFF65
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984734; cv=none; b=UzjxtiRI4CFW1RgWuJ4JWgUdF2S/cxmtQCmUIqQeFsb6WKZ9kz3b7GlXhZ3VeW9dSyOSEqKotCPtCtH0GFWyRY80z+qBVAmwu/h4x+WX1jytI/9GuyPS7ek6ogeEMWNg2aV2dDM0ntLpEqqwTv/E6lpgdYxvifQZZQBdR1zlSeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984734; c=relaxed/simple;
	bh=XeoElC3N+bAwQDuceSMfxT07Ngz8qYal6AmL2v1/5k8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ocg2YDKtQlUf4tQP62o131vy4wAyK28d3mSym/iXMlWuKWbJ+BVOJcDEDhIZIGfEt12RAC79rsXbR0ak2ESEJw+Y3fi9TU+y06u90Vbf0vTGCCLtlyElhtqyvUCyXwyPvFvM9zSmzIBPJdsWtuuZFxl6umjqiWByUpeWfypWAJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYHUHnW7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYHUHnW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777984732; x=1809520732;
  h=date:from:to:cc:subject:message-id;
  bh=XeoElC3N+bAwQDuceSMfxT07Ngz8qYal6AmL2v1/5k8=;
  b=nYHUHnW7MRm/OjiXnnIEkC8sXvs78hsii98u+o1bKWbU7gvGlAg6dphu
   VQMJR2PYQrgfGJajM0oTQbpIiVuLWP7bZaOTixtio7jyyi3ifkMEj1X4U
   9l22YotHMgvxtVcsZjUAaadZrMsMans1IvSuu8bL+ZRgUVjvLnhsL5R7G
   EwP0vPddoS0hp5FNBBBs831CzzYe6pWf+iudPuX52Y8d8F7+eGTstQPdA
   un2NrH7tWUjGQcnyrWMDS8a5ouSs8ePEmWsqiGDg5RIC19uYshiN4ihN2
   eXHRZoe+M4o9LLicjZAMcUJXxrynQVl6t0Ybj72lZBqUIPLUDoQY21eJR
   g==;
X-CSE-ConnectionGUID: QPwL6rHFRzGSvggC8A1izg==
X-CSE-MsgGUID: 30Q4u+U+T+Cf5+bVvySAHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78951063"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78951063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 05:38:52 -0700
X-CSE-ConnectionGUID: yl0euKqTQwuqoUN9SbhHrg==
X-CSE-MsgGUID: PJM7mhj/TFO+QuEmCCvmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="259476390"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 May 2026 05:38:50 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKF31-0000000008L-22pm;
	Tue, 05 May 2026 12:38:47 +0000
Date: Tue, 05 May 2026 20:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>,
 Nutty Liu <liujingqi@lanxincomputing.com>
Subject: arch/riscv/kvm/vcpu_exit.c:139:34: sparse: sparse: cast to
 restricted __le64
Message-ID: <202605052050.CJsAMbd7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: 77ba6469fe1ed37a1f62bc76fb5a7b159f698aed RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
date:   9 months ago
config: riscv-randconfig-r111-20260505 (https://download.01.org/0day-ci/archive/20260505/202605052050.CJsAMbd7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605052050.CJsAMbd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 77ba6469fe1e ("RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605052050.CJsAMbd7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_exit.c:139:34: sparse: sparse: cast to restricted __le64
>> arch/riscv/kvm/vcpu_exit.c:155:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_exit.c:155:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_exit.c:155:9: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_exit.c:158:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_exit.c:158:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_exit.c:158:9: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_exit.c:159:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_exit.c:159:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_exit.c:159:9: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_exit.c:160:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_exit.c:160:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_exit.c:160:9: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_exit.c:163:41: sparse: sparse: cast to restricted __le64

vim +139 arch/riscv/kvm/vcpu_exit.c

   129	
   130	/**
   131	 * kvm_riscv_vcpu_trap_redirect -- Redirect trap to Guest
   132	 *
   133	 * @vcpu: The VCPU pointer
   134	 * @trap: Trap details
   135	 */
   136	void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
   137					  struct kvm_cpu_trap *trap)
   138	{
 > 139		unsigned long vsstatus = ncsr_read(CSR_VSSTATUS);
   140	
   141		/* Change Guest SSTATUS.SPP bit */
   142		vsstatus &= ~SR_SPP;
   143		if (vcpu->arch.guest_context.sstatus & SR_SPP)
   144			vsstatus |= SR_SPP;
   145	
   146		/* Change Guest SSTATUS.SPIE bit */
   147		vsstatus &= ~SR_SPIE;
   148		if (vsstatus & SR_SIE)
   149			vsstatus |= SR_SPIE;
   150	
   151		/* Clear Guest SSTATUS.SIE bit */
   152		vsstatus &= ~SR_SIE;
   153	
   154		/* Update Guest SSTATUS */
 > 155		ncsr_write(CSR_VSSTATUS, vsstatus);
   156	
   157		/* Update Guest SCAUSE, STVAL, and SEPC */
   158		ncsr_write(CSR_VSCAUSE, trap->scause);
   159		ncsr_write(CSR_VSTVAL, trap->stval);
   160		ncsr_write(CSR_VSEPC, trap->sepc);
   161	
   162		/* Set Guest PC to Guest exception vector */
   163		vcpu->arch.guest_context.sepc = ncsr_read(CSR_VSTVEC);
   164	
   165		/* Set Guest privilege mode to supervisor */
   166		vcpu->arch.guest_context.sstatus |= SR_SPP;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
