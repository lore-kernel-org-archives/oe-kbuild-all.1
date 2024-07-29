Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7494A8F6E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 19:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722280022; cv=none; b=TxN9vGSBgg8wAeXqzXAVH4tOVq06Y2t7rQBybFhRE5rNJQswgnmBv7bhC2by5L6ffzkU8xFGSDFLy6iEVtJCKYqogpFNMRltziC9r2rz5EMTw14K8HTgowmWCfH2weguatuVOP2+GEJKbEeKPjVfEmFsBzQjKlEJy1XBGiA9a8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722280022; c=relaxed/simple;
	bh=3ikcGHqa78wPniikgYP9XbWkIz5YiQp5J4YbbMuQy54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RzspEiIYFfGLb9rFp/qC0FULJgrG8uUJ39Ea+9aILloLcOabo2QxSEcA+s3U7tal8DIsx+NBGZrTqs2naZAk1OQsiutfK2Hb0UiDZyI57xddtHPYptRDFThhdqwcrt8KbPxRhHasQQwiyitF80EDjUvUjxrXSe8VmyxotoaoJzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFGMEivt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFGMEivt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722280020; x=1753816020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ikcGHqa78wPniikgYP9XbWkIz5YiQp5J4YbbMuQy54=;
  b=MFGMEivtcLT0ntQwU8KzWWjp4oWMgSuyHIRThBHJvnTdLEaMMoCRPfnq
   xM/+7WY6/ZF+HjkhJf2tgxzSw2nTTvZqQXu0lcT1INLDuv71y7HQGky69
   dE/CH3mcZwrfobc8XCv28tFZX4x2LJD4kYx4ofTPFDtP0HilnIzNDmwxn
   XV3tF/I70OAXdkzWJJRn7O+UmI0yA8QCLpZiFVaT9Dx18Cmb1iyFcGHDs
   Bzl4vlIzKDTD/hRC3YsfKcPOM+Y2TdK0bmMR80SBoetbZBiTDd6bx95f+
   XACJGzUXdnPmtaGMW6sdCIBT/ZNPdE8LkTXuzXOGl24P3t7dqaAt5eXR6
   g==;
X-CSE-ConnectionGUID: mhr8JnRrQrCeUGoepBXqdw==
X-CSE-MsgGUID: pVHeFz/qSuiltlrddEiHEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37566143"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="37566143"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 12:07:00 -0700
X-CSE-ConnectionGUID: yAF023DKQMuCq1Ip6drNLQ==
X-CSE-MsgGUID: TgmMgcBrTtq986LSuds4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="54049523"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jul 2024 12:06:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYVhw-000rz6-3D;
	Mon, 29 Jul 2024 19:06:57 +0000
Date: Tue, 30 Jul 2024 03:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_ipi_fix_v2 18/22] arch/riscv/kvm/aia.c:119:27:
 sparse: sparse: cast to restricted __le64
Message-ID: <202407300322.NVaVpuUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_ipi_fix_v2
head:   4722091e62d2a5e294f60ca729bb8bf3ed28b8da
commit: e34135b1c5c36056377f3801f7ec1dcba6aec729 [18/22] RISC-V: KVM: Use nacl_csr_xyz() for accessing AIA CSRs
config: riscv-randconfig-r121-20240729 (https://download.01.org/0day-ci/archive/20240730/202407300322.NVaVpuUu-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300322.NVaVpuUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300322.NVaVpuUu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/aia.c:119:27: sparse: sparse: cast to restricted __le64
>> arch/riscv/kvm/aia.c:134:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/aia.c:134:9: sparse:     expected unsigned long
   arch/riscv/kvm/aia.c:134:9: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/aia.c:147:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/aia.c:147:17: sparse:     expected unsigned long
   arch/riscv/kvm/aia.c:147:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/aia.c:148:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/aia.c:148:17: sparse:     expected unsigned long
   arch/riscv/kvm/aia.c:148:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/aia.c:149:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/aia.c:149:17: sparse:     expected unsigned long
   arch/riscv/kvm/aia.c:149:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/aia.c:179:34: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/aia.c:180:33: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/aia.c:181:33: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/aia.c:282:27: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/aia.c:286:27: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/aia.c:315:27: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/aia.c:319:27: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/aia.c:340:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/aia.c:340:17: sparse:     expected unsigned long
   arch/riscv/kvm/aia.c:340:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/aia.c:344:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/aia.c:344:17: sparse:     expected unsigned long
   arch/riscv/kvm/aia.c:344:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/aia.c:409:16: sparse: sparse: cast to restricted __le64

vim +119 arch/riscv/kvm/aia.c

   109	
   110		seip = vcpu->arch.guest_csr.vsie;
   111		seip &= (unsigned long)mask;
   112		seip &= BIT(IRQ_S_EXT);
   113	
   114		if (!kvm_riscv_aia_initialized(vcpu->kvm) || !seip)
   115			return false;
   116	
   117		hgei = aia_find_hgei(vcpu);
   118		if (hgei > 0)
 > 119			return !!(ncsr_read(CSR_HGEIP) & BIT(hgei));
   120	
   121		return false;
   122	}
   123	
   124	void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
   125	{
   126		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   127	
   128		if (!kvm_riscv_aia_available())
   129			return;
   130	
   131	#ifdef CONFIG_32BIT
   132		ncsr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
   133	#endif
 > 134		ncsr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
