Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B4C25C80E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 02:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778812331; cv=none; b=tGmR2sxuyeZCRbFmNJiwkIRGqULRam0VJApbL2K7c7YhQPL5Nq2P1qZr17kgHjk5z2dgwVvrBD2dRPlAFi8bko1//C8KE9vaAow3I2NyJBF7SO+kTaVWQjX308kSlYq6/GVG0ZXNY6VxuO7btC4grd5zYOplzRWpjqIbjAu6LRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778812331; c=relaxed/simple;
	bh=xdDZmJwdm5OhCk/KePx9tEI0bk4sYeAe1d2aZs74ivQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fvXwYgWF3ZkLxLHtsyKK5lfTQN2I+7Xjf7AijOr3AGRZp6/G+qSTRwxnhrRvyFifRoYeVyun5pVduxqG1VpMAnezqVjggFgWbZGkhSPNLtvJdfnvRMUMkOXrMKtdbkgNnp/gRz2doiThod6zcFzDiuYGZ+Dzps1Usi6NwbJQldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kER792uw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kER792uw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778812329; x=1810348329;
  h=date:from:to:cc:subject:message-id;
  bh=xdDZmJwdm5OhCk/KePx9tEI0bk4sYeAe1d2aZs74ivQ=;
  b=kER792uwrO/6n97Mk0UawZTXTP4ZYVvbT/3CsnB33dY6dwieNx5O+xN1
   u7DKB7TLyu4K1vKzertsjKNbjIpGyP3zNdQzJxPFndKoqAWz1wvl9XVk1
   mERxmnaVd5gqL3mvnopVGEPo/61fFefcZAYmE8MAiHss54mfNWxVIZrpo
   7T06Sj9f3vfmE/lue9kwCMBSFF97nJqmUqf0dDUY5k+BA8+leoCAUQsfr
   Jm7YbQrSRAo3tnClwRvsUhQ0/1Y9y7DG3nUQrnnWzVZIJ5Ke30AVUSrOu
   oN87Fz+MTv6/qDZYOUgOwPwYhXuoB6IQ0a5rSnEcccAkdld6GumkK6LKk
   A==;
X-CSE-ConnectionGUID: 7jRsGZcDRu2UKgTHUioWJw==
X-CSE-MsgGUID: /1yaRZ6+TEml4GG23RIbBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79886238"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79886238"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 19:32:08 -0700
X-CSE-ConnectionGUID: Cp4vwEn/TcqZNsoc0CTtPw==
X-CSE-MsgGUID: 5z5V4oK8Scur1CSdvpN4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="237564141"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2026 19:32:06 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNiLL-000000000dW-0Px2;
	Fri, 15 May 2026 02:32:03 +0000
Date: Fri, 15 May 2026 10:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>,
 Nutty Liu <liujingqi@lanxincomputing.com>
Subject: arch/riscv/kvm/vcpu_exit.c:139:34: sparse: sparse: cast to
 restricted __le32
Message-ID: <202605151011.cLM0NT0p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66182ca873a4e87b3496eca79d57f86b76d7f52d
commit: 77ba6469fe1ed37a1f62bc76fb5a7b159f698aed RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
date:   10 months ago
config: riscv-randconfig-r113-20260515 (https://download.01.org/0day-ci/archive/20260515/202605151011.cLM0NT0p-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151011.cLM0NT0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 77ba6469fe1e ("RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151011.cLM0NT0p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kvm/vcpu_exit.c:139:34: sparse: sparse: cast to restricted __le32
>> arch/riscv/kvm/vcpu_exit.c:155:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_exit.c:155:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_exit.c:155:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_exit.c:158:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_exit.c:158:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_exit.c:158:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_exit.c:159:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_exit.c:159:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_exit.c:159:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_exit.c:160:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_exit.c:160:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_exit.c:160:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_exit.c:163:41: sparse: sparse: cast to restricted __le32

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
