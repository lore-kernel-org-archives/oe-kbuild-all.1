Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3957A175A7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 00:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224028; cv=none; b=fFtle50OdZwUxGHfAi2BiCx9qh+Dn4J39vcQume0peCmrphY8D7/ytjMMk1N4KZP1jCA80opCgfObC6Tep1JUIAydM8dmLWzXu6zLSxWQ8tGMiNhI16/M8g0UkwMAL1frrfyf4EeyjNfwtOt35Iu8O1nO2rWLsFZymkP/otVLC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224028; c=relaxed/simple;
	bh=qUPw95Y2Dq8AtDT7+uc2tLXlefhmw5UNSv32VHi1UiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G0VLVlJsnVlT8ng9hrF/TCi6Qe8L41MVgNCOb5MUvw04wGOA6xKvjCaLv64tkCvRtNF2Z/oGY+QHBpZ9So4z62N6eMSWVvVLMwY7slY1Eul7J9IJOEUiWGrRsU4L4bcCuT+xyGcicHAYGaO3lgKQu5Q9rTZCkI/YMOHblOLYAIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H10djR/A; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H10djR/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781224027; x=1812760027;
  h=date:from:to:cc:subject:message-id;
  bh=qUPw95Y2Dq8AtDT7+uc2tLXlefhmw5UNSv32VHi1UiY=;
  b=H10djR/AeXfdaHxVSeaxG48C28a/L4y9p2ACgbNRmTfdE2otltugAGyW
   Xjg+dXPKTm6kQ0uMOgpS34iBsr+LAZ+T0oesMeXk3D8v+kzicHQggQjeH
   hMI/VGlct0svX3e39o3tp+pCSTuuUE74IFez382fcNslpiLMwSa5NkMk3
   SnxO9xmg4hekmboO8iKhjRbDQaYuvDzbIk3HGMz83aP5vSd7trqbi17b7
   YIxU5S9sqD9csB/rEKaMULV9BY7laEdjaPuAXUL/Xb6DpglrG5yNMbGQD
   e44Gpk02qb0VbyVmAHDBXlYV3JHZ4uZGyGd/oYcn8nalXzgyTHy+bvXDv
   Q==;
X-CSE-ConnectionGUID: 2X0p5eh+Sua42Od/6jG5hA==
X-CSE-MsgGUID: McP+QnLoTfyPzb+1Nztw6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82060017"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82060017"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 17:27:06 -0700
X-CSE-ConnectionGUID: SKeBTrA9TQKnGLS7ktN3eg==
X-CSE-MsgGUID: eFgCdQtCQxGptqZJdllK9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="245560993"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2026 17:27:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXpjh-00000000O4i-2VQW;
	Fri, 12 Jun 2026 00:27:01 +0000
Date: Fri, 12 Jun 2026 08:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>,
 Nutty Liu <liujingqi@lanxincomputing.com>
Subject: arch/riscv/kvm/vcpu_exit.c:139:34: sparse: sparse: cast to
 restricted __le64
Message-ID: <202606120830.jU22Lgkl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 77ba6469fe1ed37a1f62bc76fb5a7b159f698aed RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
date:   11 months ago
config: riscv-randconfig-r121-20260612 (https://download.01.org/0day-ci/archive/20260612/202606120830.jU22Lgkl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120830.jU22Lgkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 77ba6469fe1e ("RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120830.jU22Lgkl-lkp@intel.com/

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
