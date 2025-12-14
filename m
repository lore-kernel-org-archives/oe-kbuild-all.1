Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1262609CC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765699863; cv=none; b=Hq0LKlV5iHplcq3/7+TDFn+Z1u2OOcFCxW6zYLBXAsrP6xxhX0Ya4EB1oJbYbf005k7q/hzPDXHDk+2pVIeVLnPQ3CYuoppiwn2UcpFzYZ/cp3kqrj5hXBIbc/ZfLu59gGO5uMEoh+2SV1IfIrVGg9Ooees3QwAs5YkAb9QhKgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765699863; c=relaxed/simple;
	bh=R350V17kNfq/O1WGLXiYGnC+w3Y/M/PnemZGjCg6oks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iIO+WhPDp5JIssP88EFv7A/YJ4NoxkGZQAueVLupWRRlXT7Iqf5SRfV9YBdQx0fWjHAcUUzEwU1Y5YfwYQBl7TYApJ8h88TG4SpqzI//GfJ4OZ9yEUwK3BQG4K3ZA/1eKagIgfuJPTDeGySVg/cW7N9Zw7bBZUbEJ/KROTXoiI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoPXlXSo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoPXlXSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765699862; x=1797235862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R350V17kNfq/O1WGLXiYGnC+w3Y/M/PnemZGjCg6oks=;
  b=UoPXlXSowU5v5eKcVt7WPI3vTcGLS6YuMKy7DUISBpcYGnuMgUB/bZCk
   eSnPwjhxwPqV82tQ2oQ08VQ9PMNexT4n8+jVRukfFNTrSvXldGoZGvPIk
   M/I8iUr68u2UdYQw1/z/zWLpOGEoN/t9VcTDSHkWRCYJ7qmngYL1zv5P1
   ox0qNEBbPj9HWkF9V2CqBKI2/kiwa7bS+x86lgXb1nxo/0Ljyn0q28K1c
   k6fJ/b39dAHHF+oOAtQ/9WXkSnPWyrgV4pWLpOawgbAzQrkJITz9uwHGL
   pJhBHFmjAK+g+WMx7ZR8K9lgH1zhN+RX5C5GlzO+FsXC2EwSkpISZjEy7
   A==;
X-CSE-ConnectionGUID: w9LbgFVRQmKVAwuDYGgnXw==
X-CSE-MsgGUID: cm7xgkprSJCPCqLZneiWPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71486954"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="71486954"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 00:11:00 -0800
X-CSE-ConnectionGUID: gz7GNIDxSoueQTtxrxbxQw==
X-CSE-MsgGUID: NKDAfhJURNiI0o7RYJR74Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202558818"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Dec 2025 00:10:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUhBw-000000008rJ-39I9;
	Sun, 14 Dec 2025 08:10:56 +0000
Date: Sun, 14 Dec 2025 16:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: arch/riscv/kvm/vcpu_exit.c:139:34: sparse: sparse: cast to
 restricted __le64
Message-ID: <202512141619.z9NzOFKH-lkp@intel.com>
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
config: riscv-randconfig-r123-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141619.z9NzOFKH-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141619.z9NzOFKH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141619.z9NzOFKH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_exit.c:139:34: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu_exit.c:155:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
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
   155		ncsr_write(CSR_VSSTATUS, vsstatus);
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
