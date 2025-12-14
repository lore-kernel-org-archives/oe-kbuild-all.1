Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416B426ACC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765693849; cv=none; b=QYR5jSZ247FPuxpoQPwPP+5U/7bdWTVWQfytWslfPZhP2dKrGixYt1TVpgdMaT/fmM7K5xDufmJRF9VDOz8DG314+IQ4Djv0r/YL5SqGy/PYI6FkWfEICTQItsKdFqVW6w1p6QNc1bCNP+MgR0NonGqMPLMl2Spf2adMBDQrSMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765693849; c=relaxed/simple;
	bh=YNEN8gT6ojZ+nTcWtMDLcVmiiiRBsE4hTjSp/vJgS38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uok2fPA8OerEvTydiOpO4SoOjVRZOHRdniDdAvBzwim3C7D/XZpjZxtkVKz92ouo6SnX7eRn5YyWHZxnbtphOPHL2hng9yGIFg9LDOg1MDMhZ0B1e+X4uoTonl8Kps4Ivnfux+/a3NhKWWz/Vq1m4ZwdETnM97Xky7HHq9vYdmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcVL03Kx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcVL03Kx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765693848; x=1797229848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNEN8gT6ojZ+nTcWtMDLcVmiiiRBsE4hTjSp/vJgS38=;
  b=TcVL03KxMCITvUv2Q1TlSn6qkcfZCGWSNMKGg0UnNYTHyUQBJN57qgyl
   As5hqe5YlHX0UsXJJXnO4GUOsvVpfMlaf9EDTGLZyAKivd+S8MuDBeP01
   AYZi0n2fOM7TI3oYMobM8IrLS3dNbcS8yjszU93kv3JIhX0g+0zXTiLig
   5xD7xShbo1kWN2OvNr+2q4Kziv9zaCys5D3yNzwao3njJlLnMSL7QrqYN
   5iHoqGMWtXjgvnnNC27EKU804zdSxDYw7mmqF6/P7ZAtSyzuQFhWaV7hQ
   1y/TsBJyvGPqTm8d8hivpJmJ9X8k+2Jnup2VU45LW0NdiT6/RsL8nJ0q+
   g==;
X-CSE-ConnectionGUID: BQLCVjTMTQaY+P9tdp3dmA==
X-CSE-MsgGUID: 9+fXy8emRri1ra8cACGIDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79004959"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79004959"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 22:30:47 -0800
X-CSE-ConnectionGUID: BuGyTH/5TmekPYSIj9TzCg==
X-CSE-MsgGUID: esmh7A1kRha9GvF/p8XJ8w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2025 22:30:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUfcy-000000008gA-0Drq;
	Sun, 14 Dec 2025 06:30:44 +0000
Date: Sun, 14 Dec 2025 14:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: arch/riscv/kvm/vcpu_exit.c:155:9: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202512141414.HofdNpIZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 77ba6469fe1ed37a1f62bc76fb5a7b159f698aed RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
date:   5 months ago
config: riscv-randconfig-r123-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141414.HofdNpIZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141414.HofdNpIZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141414.HofdNpIZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/riscv/kvm/vcpu_exit.c:139:34: sparse: sparse: cast to restricted __le64
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

vim +155 arch/riscv/kvm/vcpu_exit.c

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
   139		unsigned long vsstatus = ncsr_read(CSR_VSSTATUS);
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
