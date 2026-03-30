Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001FD13777E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862153; cv=none; b=q1kR0rxKlWpvxc0k+8MspmkAIwdVf9aaRSDjZEkQ/1VIK20jQcFt99oyknrUNcVymwD6z4hCkfqmmunsyTe6yjjk0STgN4ZzzVSaoY9R/c73OD5kUpMDsg9f0Vj3Cbxy+OY1e1ziClNHITez6RtR27XLgCTRhw3a15BhtYzLuxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862153; c=relaxed/simple;
	bh=Wm7iPHfvdYSXvcTjn9tNeDtKJebnmjSy5UrIxC9tMl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kj49TCHyew64otS5Q6/IAGGbXFbbt3hVL+q3hKNcg8+exzYnIlFVUIRovRq9aPBeJOSRnKUYdJ1AkBxerPEPJFvMRbibNwdMKjwxvf/XMhIdWCuF9oFBF87AC2Rcfldl/nWe7TLAac0mJDu6JhCLn9AVx3mJ7nFRRRrPqvaudG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQheh9Fd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQheh9Fd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774862152; x=1806398152;
  h=date:from:to:cc:subject:message-id;
  bh=Wm7iPHfvdYSXvcTjn9tNeDtKJebnmjSy5UrIxC9tMl8=;
  b=OQheh9Fd8IvRuvkU0e8bi+595hfNP/2YcC0jDT8akuL+DPdyID+EZdJ6
   MpB0aTop0bdFCVx3+uh9zWz9HQZb2lSUgOLPo0h9Ix+/Hh+KS0+XSQeY9
   g91jxjNIJ8Hji+4Vtn3DLCxLvJ5JgzJx69RlRpYC5BdsWM5Q/38oHBh6f
   NpWvh3+b8KeTszCD2HBZe2AHWkcleDVL6MUKzaxTkA2uu+j2ZdP/AAGFe
   ffmdfh2jpnu39WMw7nlEVCxwd80HijA/9T13pxLahMyog4lAoIOn09R2U
   11+s5+/Tob6ZCuQmAt2IAA6bylpGtleyYhh0OC54Tks9HbVeMneYMaaU/
   w==;
X-CSE-ConnectionGUID: yjbk+utaTViEohDmdGDrEQ==
X-CSE-MsgGUID: gPseCkuQTuS9eywT7/1p+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="93431904"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="93431904"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:15:51 -0700
X-CSE-ConnectionGUID: nJ18fLAbT7WcRItZtBDZaA==
X-CSE-MsgGUID: 0eJYC3W1TUisD3UFa/C3XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="226256229"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Mar 2026 02:15:50 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w78ip-000000000tR-1t8e;
	Mon, 30 Mar 2026 09:15:47 +0000
Date: Mon, 30 Mar 2026 17:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 4/4]
 arch/arm64/kvm/at.c:736:45: warning: variable 'px' set but not used
Message-ID: <202603301724.0NNhZLTI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Marc,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: d6a01a2dc760c8350fa182a6afd69fabab131f73 [4/4] KVM: arm64: nv: Add SW walker for AT S1 emulation
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260330/202603301724.0NNhZLTI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301724.0NNhZLTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301724.0NNhZLTI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/at.c: In function 'handle_at_slow':
>> arch/arm64/kvm/at.c:736:45: warning: variable 'px' set but not used [-Wunused-but-set-variable]
     736 |         bool perm_fail, ur, uw, ux, pr, pw, px;
         |                                             ^~
   arch/arm64/kvm/at.c: In function '__kvm_at_s1e2':
   arch/arm64/kvm/at.c:973:36: warning: variable 'mmu' set but not used [-Wunused-but-set-variable]
     973 |                 struct kvm_s2_mmu *mmu;
         |                                    ^~~


vim +/px +736 arch/arm64/kvm/at.c

   733	
   734	static u64 handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
   735	{
 > 736		bool perm_fail, ur, uw, ux, pr, pw, px;
   737		struct s1_walk_result wr = {};
   738		struct s1_walk_info wi = {};
   739		int ret, idx;
   740	
   741		ret = setup_s1_walk(vcpu, op, &wi, &wr, vaddr);
   742		if (ret)
   743			goto compute_par;
   744	
   745		if (wr.level == S1_MMU_DISABLED)
   746			goto compute_par;
   747	
   748		idx = srcu_read_lock(&vcpu->kvm->srcu);
   749	
   750		ret = walk_s1(vcpu, &wi, &wr, vaddr);
   751	
   752		srcu_read_unlock(&vcpu->kvm->srcu, idx);
   753	
   754		if (ret)
   755			goto compute_par;
   756	
   757		/* FIXME: revisit when adding indirect permission support */
   758		/* AArch64.S1DirectBasePermissions() */
   759		if (wi.regime != TR_EL2) {
   760			switch (FIELD_GET(PTE_USER | PTE_RDONLY, wr.desc)) {
   761			case 0b00:
   762				pr = pw = true;
   763				ur = uw = false;
   764				break;
   765			case 0b01:
   766				pr = pw = ur = uw = true;
   767				break;
   768			case 0b10:
   769				pr = true;
   770				pw = ur = uw = false;
   771				break;
   772			case 0b11:
   773				pr = ur = true;
   774				pw = uw = false;
   775				break;
   776			}
   777	
   778			switch (wr.APTable) {
   779			case 0b00:
   780				break;
   781			case 0b01:
   782				ur = uw = false;
   783				break;
   784			case 0b10:
   785				pw = uw = false;
   786				break;
   787			case 0b11:
   788				pw = ur = uw = false;
   789				break;
   790			}
   791	
   792			/* We don't use px for anything yet, but hey... */
   793			px = !((wr.desc & PTE_PXN) || wr.PXNTable || uw);
   794			ux = !((wr.desc & PTE_UXN) || wr.UXNTable);
   795	
   796			if (op == OP_AT_S1E1RP || op == OP_AT_S1E1WP) {
   797				bool pan;
   798	
   799				pan = *vcpu_cpsr(vcpu) & PSR_PAN_BIT;
   800				pan &= ur || uw;
   801				pw &= !pan;
   802				pr &= !pan;
   803			}
   804		} else {
   805			ur = uw = ux = false;
   806	
   807			if (!(wr.desc & PTE_RDONLY)) {
   808				pr = pw = true;
   809			} else {
   810				pr = true;
   811				pw = false;
   812			}
   813	
   814			if (wr.APTable & BIT(1))
   815				pw = false;
   816	
   817			/* XN maps to UXN */
   818			px = !((wr.desc & PTE_UXN) || wr.UXNTable);
   819		}
   820	
   821		perm_fail = false;
   822	
   823		switch (op) {
   824		case OP_AT_S1E1RP:
   825		case OP_AT_S1E1R:
   826		case OP_AT_S1E2R:
   827			perm_fail = !pr;
   828			break;
   829		case OP_AT_S1E1WP:
   830		case OP_AT_S1E1W:
   831		case OP_AT_S1E2W:
   832			perm_fail = !pw;
   833			break;
   834		case OP_AT_S1E0R:
   835			perm_fail = !ur;
   836			break;
   837		case OP_AT_S1E0W:
   838			perm_fail = !uw;
   839			break;
   840		default:
   841			BUG();
   842		}
   843	
   844		if (perm_fail)
   845			fail_s1_walk(&wr, ESR_ELx_FSC_PERM_L(wr.level), false, false);
   846	
   847	compute_par:
   848		return compute_par_s1(vcpu, &wr, wi.regime);
   849	}
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
