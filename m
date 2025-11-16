Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D60F3398A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 04:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763268070; cv=none; b=S+RdSrBNPVNb3OloiIj9fviiQjDWHbA8L2cvYFFNFQNVy6WEi9fCetl+cctw8eYPv3ZqWGLFq7V2tTGjIwUtsGI1250S9T2lZGjdA0inkx8Q6z1y644Y9VViT4iw/NHKcpLi+eE+0jyR95zbdnppn3Z3k92ArX7kDCqr52rGxro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763268070; c=relaxed/simple;
	bh=TNFO70qUV9zmA5eZHDDlqrqP1piupFV6277Wlwc50u4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPw+D17Rg7VWUGxvv1K7j+t3oyTdAPZWmX1VDGzUi9D2maA0tXeMmOpMkhlN9MNxibxbLnVWrftMQFXGQDBSj+v86URnjXeqfGpbZ1DadjGuAFpihFcWRYlqt549QMAUlPWrXuIZyV3dG6VsWcI1uCW9z6QpAcMAr39XRmEzrUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WL1o4Kht; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WL1o4Kht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763268067; x=1794804067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TNFO70qUV9zmA5eZHDDlqrqP1piupFV6277Wlwc50u4=;
  b=WL1o4KhthaZIXIE2ezXtGhTnQldNqu91pwkdUe14zxmhnvZ5BBdaFOB4
   kzUJpBlOmwt5ERxas0tAvyO4topfwqTmUVPw+DGbAUVwx/ce3ZB1qGAJn
   i0uyvBm8pxFD1sg66OrzcfkzYOMQ9+QJMBN2O3F4LWz2mOadlTuM9XMaf
   iNbpMJM6ItWEqzPFYQJ3BPuKdkydqVxQ0hgJDuHX50VkwqGc2pEW7JN3q
   bjDGEZK7tRVBjBfP1tVQ5HvMUMFy+jSYQGkNcyM6ZDjcM4zm5HPCQKuaK
   a5RK3Vlu7FLSW4cq9zLT8CZqv/etOo/bT2IKVSJNOrnRYH/GX96/20/rT
   A==;
X-CSE-ConnectionGUID: PbiAkwNWTJaj+zmql3Pxdw==
X-CSE-MsgGUID: HSrbnIPvQzqZP/z7PKlYFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="82934164"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="82934164"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 20:41:06 -0800
X-CSE-ConnectionGUID: X3WF1xg2SJigHxVXsIRZCQ==
X-CSE-MsgGUID: DWLpPX9jRTi3bJH3QFoiqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="189412598"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Nov 2025 20:41:06 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKUZT-0008Vn-0I;
	Sun, 16 Nov 2025 04:41:03 +0000
Date: Sun, 16 Nov 2025 12:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v1 12/18]
 arch/riscv/kvm/vcpu_nested.c:22:6: warning: variable 'cpu' set but not used
Message-ID: <202511161205.BQFZlTRt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_kvm_nested_v1
head:   865d3a70e5bb0e7c9a91f57d283d28fc42367a51
commit: d14c2a28296575b8a4af0b6eeb40ba975969623c [12/18] RISC-V: KVM: Extend trap redirection for nested virtualization
config: riscv-randconfig-002-20251116 (https://download.01.org/0day-ci/archive/20251116/202511161205.BQFZlTRt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511161205.BQFZlTRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511161205.BQFZlTRt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kvm/vcpu_nested.c: In function 'kvm_riscv_vcpu_nested_set_virt':
>> arch/riscv/kvm/vcpu_nested.c:22:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      22 |  int cpu;
         |      ^~~


vim +/cpu +22 arch/riscv/kvm/vcpu_nested.c

    14	
    15	void kvm_riscv_vcpu_nested_set_virt(struct kvm_vcpu *vcpu,
    16					    enum kvm_vcpu_nested_set_virt_event event,
    17					    bool virt, bool spvp, bool gva)
    18	{
    19		struct kvm_vcpu_nested *ns = &vcpu->arch.nested;
    20		struct kvm_vcpu_nested_csr *nsc = &ns->csr;
    21		unsigned long tmp, sr_fs_vs_mask = 0;
  > 22		int cpu;
    23	
    24		/* If H-extension is not available for VCPU then do nothing */
    25		if (!riscv_isa_extension_available(vcpu->arch.isa, h))
    26			return;
    27	
    28		/* Grab the CPU to ensure we remain on same CPU */
    29		cpu = get_cpu();
    30	
    31		/* Skip hardware CSR update if no change in virt state */
    32		if (virt == ns->virt)
    33			goto skip_csr_update;
    34	
    35		/* TODO: */
    36	
    37		/* Swap hardware vs<xyz> CSRs except vsie and vsstatus */
    38		nsc->vstvec = ncsr_swap(CSR_VSTVEC, nsc->vstvec);
    39		nsc->vsscratch = ncsr_swap(CSR_VSSCRATCH, nsc->vsscratch);
    40		nsc->vsepc = ncsr_swap(CSR_VSEPC, nsc->vsepc);
    41		nsc->vscause = ncsr_swap(CSR_VSCAUSE, nsc->vscause);
    42		nsc->vstval = ncsr_swap(CSR_VSTVAL, nsc->vstval);
    43		nsc->vsatp = ncsr_swap(CSR_VSATP, nsc->vsatp);
    44	
    45		/* Update vsstatus CSR */
    46		if (riscv_isa_extension_available(vcpu->arch.isa, f) ||
    47		    riscv_isa_extension_available(vcpu->arch.isa, d))
    48			sr_fs_vs_mask |= SR_FS;
    49		if (riscv_isa_extension_available(vcpu->arch.isa, v))
    50			sr_fs_vs_mask |= SR_VS;
    51		if (virt) {
    52			/*
    53			 * Update vsstatus in following manner:
    54			 * 1) Swap hardware vsstatus (i.e. virtual-HS mode sstatus) with
    55			 *    vsstatus in nested virtualization context (i.e. virtual-VS
    56			 *    mode sstatus)
    57			 * 2) Swap host sstatus.[FS|VS] (i.e. HS mode sstatus.[FS|VS])
    58			 *    with the vsstatus.[FS|VS] saved in nested virtualization
    59			 *    context (i.e. virtual-HS mode sstatus.[FS|VS])
    60			 */
    61			nsc->vsstatus = ncsr_swap(CSR_VSSTATUS, nsc->vsstatus);
    62			tmp = vcpu->arch.guest_context.sstatus & sr_fs_vs_mask;
    63			vcpu->arch.guest_context.sstatus &= ~sr_fs_vs_mask;
    64			vcpu->arch.guest_context.sstatus |= (nsc->vsstatus & sr_fs_vs_mask);
    65			nsc->vsstatus &= ~sr_fs_vs_mask;
    66			nsc->vsstatus |= tmp;
    67		} else {
    68			/*
    69			 * Update vsstatus in following manner:
    70			 * 1) Swap host sstatus.[FS|VS] (i.e. virtual-HS mode sstatus.[FS|VS])
    71			 *    with vsstatus.[FS|VS] saved in the nested virtualization context
    72			 *    context (i.e. HS mode sstatus.[FS|VS])
    73			 * 2) Swap hardware vsstatus (i.e. virtual-VS mode sstatus) with
    74			 *    vsstatus in nested virtualization context (i.e. virtual-HS
    75			 *    mode sstatus)
    76			 */
    77			tmp = vcpu->arch.guest_context.sstatus & sr_fs_vs_mask;
    78			vcpu->arch.guest_context.sstatus &= ~sr_fs_vs_mask;
    79			vcpu->arch.guest_context.sstatus |= (nsc->vsstatus & sr_fs_vs_mask);
    80			nsc->vsstatus &= ~sr_fs_vs_mask;
    81			nsc->vsstatus |= tmp;
    82			nsc->vsstatus = ncsr_swap(CSR_VSSTATUS, nsc->vsstatus);
    83		}
    84	
    85	skip_csr_update:
    86		if (event != NESTED_SET_VIRT_EVENT_SRET) {
    87			/* Update guest hstatus.SPV bit */
    88			nsc->hstatus &= ~HSTATUS_SPV;
    89			nsc->hstatus |= (ns->virt) ? HSTATUS_SPV : 0;
    90	
    91			/* Update guest hstatus.SPVP bit */
    92			if (ns->virt) {
    93				nsc->hstatus &= ~HSTATUS_SPVP;
    94				if (spvp)
    95					nsc->hstatus |= HSTATUS_SPVP;
    96			}
    97	
    98			/* Update guest hstatus.GVA bit */
    99			if (event == NESTED_SET_VIRT_EVENT_TRAP) {
   100				nsc->hstatus &= ~HSTATUS_GVA;
   101				nsc->hstatus |= (gva) ? HSTATUS_GVA : 0;
   102			}
   103		}
   104	
   105		/* Update host SRET trapping */
   106		vcpu->arch.guest_context.hstatus &= ~HSTATUS_VTSR;
   107		if (virt) {
   108			if (nsc->hstatus & HSTATUS_VTSR)
   109				vcpu->arch.guest_context.hstatus |= HSTATUS_VTSR;
   110		} else {
   111			if (nsc->hstatus & HSTATUS_SPV)
   112				vcpu->arch.guest_context.hstatus |= HSTATUS_VTSR;
   113		}
   114	
   115		/* Update host VM trapping */
   116		vcpu->arch.guest_context.hstatus &= ~HSTATUS_VTVM;
   117		if (virt && (nsc->hstatus & HSTATUS_VTVM))
   118			vcpu->arch.guest_context.hstatus |= HSTATUS_VTVM;
   119	
   120		/* Update virt flag */
   121		ns->virt = virt;
   122	
   123		/* Release CPU */
   124		put_cpu();
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
