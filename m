Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD9E647
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 03:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724814636; cv=none; b=DB4z0RDFWfck9ud7YGByvwDLA9tExIKueHCwqzJgno4Nrn6sFqUATFCM/P0zbluebVsl/Yk5SU8qhzoDjz2vnBq8iglT3H0Jr52Je25qfGcIiuPvosj7zA4OS8L7xUhO4x10HYbAauVOwL7kIxCmqpltO2z+1gOcnI96InO4Xqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724814636; c=relaxed/simple;
	bh=a3k8cc72V7JMXReGRf2X1g0nAVPj5lw6UnAU/C3SKjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oP6ZmpdXuA5T0fbFtxabbZJuKyKWgHjjoO+8p1uLWQZwnTuJAeoGTascCo1rMDF873ZP4FSXBCCcxhI23ahOfXdOBLSQv2Rzuv3B4oWN13d8c7qT7bKCxGIzy7QAlh6LtQ+yCtvTjseaiVvXcU//hXF3drgIJzF5EXhSVs9xads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWArATGq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWArATGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724814634; x=1756350634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3k8cc72V7JMXReGRf2X1g0nAVPj5lw6UnAU/C3SKjA=;
  b=YWArATGq6uhtjo0k5gcxiQo4ucPHKtMNgxiUizAJjQAB6Nb+OZhv/B20
   l+hBiDKCJiaBiKYx+6XuKWDNhaiX6lZUpOld2gxs29tkmwXKnAZs7SFT0
   vsZd7wz6hJqxtedasNDodMimu2PO7lO3u+WDFIiCx7zGeJcknWYQLng8a
   6s02SCOxdwQtvpa6UIyGR+RyfiO36LAcLjK82reCL62q+XzpiGKxfyLy0
   P1IQSCQKkr6C+Pey4fJZq9RKJGptiaaVzDKhuwLJT8jS0AKFokM0JPjWE
   qIMOgIKHuh7Np9R+3pyjN8D6Rm5QJb3SYMT5xOLW2sE5Nu8goxpI2SdLu
   w==;
X-CSE-ConnectionGUID: Io65lva/Q/2hqECrilUeGw==
X-CSE-MsgGUID: epd+xN7eSl6assV7U/nLVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23449126"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23449126"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 20:10:33 -0700
X-CSE-ConnectionGUID: NhaxaZWgR1CSukahmfbTcg==
X-CSE-MsgGUID: zRd3zeOqQyKTNnTJ3pdoSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67893646"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Aug 2024 20:10:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj94n-000KP4-27;
	Wed, 28 Aug 2024 03:10:29 +0000
Date: Wed, 28 Aug 2024 11:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27226/30000] arch/x86/kvm/x86.c:1076:6: warning:
 no previous prototype for 'kvm_post_set_cr4'
Message-ID: <202408281038.faDmsrP1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a3e2493c22a624aefb09b92b040c97ecd2e8e2dd
commit: 8a7e6f51a756aa6e88ebd5da8a5f3b6744cd07b5 [27226/30000] KVM: x86: Introduce kvm_post_set_cr4 to post handle the CR4 emulation
config: x86_64-buildonly-randconfig-005-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281038.faDmsrP1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281038.faDmsrP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281038.faDmsrP1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c:893:6: warning: no previous prototype for 'kvm_post_set_cr0' [-Wmissing-prototypes]
     893 | void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
         |      ^~~~~~~~~~~~~~~~
>> arch/x86/kvm/x86.c:1076:6: warning: no previous prototype for 'kvm_post_set_cr4' [-Wmissing-prototypes]
    1076 | void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
         |      ^~~~~~~~~~~~~~~~


vim +/kvm_post_set_cr4 +1076 arch/x86/kvm/x86.c

   892	
 > 893	void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
   894	{
   895		unsigned long update_bits = X86_CR0_PG | X86_CR0_WP;
   896	
   897		if ((cr0 ^ old_cr0) & X86_CR0_PG) {
   898			kvm_clear_async_pf_completion_queue(vcpu);
   899			kvm_async_pf_hash_reset(vcpu);
   900		}
   901	
   902		if ((cr0 ^ old_cr0) & update_bits)
   903			kvm_mmu_reset_context(vcpu);
   904	
   905		if (((cr0 ^ old_cr0) & X86_CR0_CD) &&
   906		    kvm_arch_has_noncoherent_dma(vcpu->kvm) &&
   907		    !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_CD_NW_CLEARED))
   908			kvm_zap_gfn_range(vcpu->kvm, 0, ~0ULL);
   909	}
   910	
   911	int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
   912	{
   913		unsigned long old_cr0 = kvm_read_cr0(vcpu);
   914		unsigned long pdptr_bits = X86_CR0_CD | X86_CR0_NW | X86_CR0_PG;
   915	
   916		cr0 |= X86_CR0_ET;
   917	
   918	#ifdef CONFIG_X86_64
   919		if (cr0 & 0xffffffff00000000UL)
   920			return 1;
   921	#endif
   922	
   923		cr0 &= ~CR0_RESERVED_BITS;
   924	
   925		if ((cr0 & X86_CR0_NW) && !(cr0 & X86_CR0_CD))
   926			return 1;
   927	
   928		if ((cr0 & X86_CR0_PG) && !(cr0 & X86_CR0_PE))
   929			return 1;
   930	
   931	#ifdef CONFIG_X86_64
   932		if ((vcpu->arch.efer & EFER_LME) && !is_paging(vcpu) &&
   933		    (cr0 & X86_CR0_PG)) {
   934			int cs_db, cs_l;
   935	
   936			if (!is_pae(vcpu))
   937				return 1;
   938			kvm_x86_ops.get_cs_db_l_bits(vcpu, &cs_db, &cs_l);
   939			if (cs_l)
   940				return 1;
   941		}
   942	#endif
   943		if (!(vcpu->arch.efer & EFER_LME) && (cr0 & X86_CR0_PG) &&
   944		    is_pae(vcpu) && ((cr0 ^ old_cr0) & pdptr_bits) &&
   945		    !load_pdptrs(vcpu, vcpu->arch.walk_mmu, kvm_read_cr3(vcpu)))
   946			return 1;
   947	
   948		if (!(cr0 & X86_CR0_PG) && kvm_read_cr4_bits(vcpu, X86_CR4_PCIDE))
   949			return 1;
   950	
   951		kvm_x86_ops.set_cr0(vcpu, cr0);
   952	
   953		kvm_post_set_cr0(vcpu, old_cr0, cr0);
   954	
   955		return 0;
   956	}
   957	EXPORT_SYMBOL_GPL(kvm_set_cr0);
   958	
   959	void kvm_lmsw(struct kvm_vcpu *vcpu, unsigned long msw)
   960	{
   961		(void)kvm_set_cr0(vcpu, kvm_read_cr0_bits(vcpu, ~0x0eul) | (msw & 0x0f));
   962	}
   963	EXPORT_SYMBOL_GPL(kvm_lmsw);
   964	
   965	void kvm_load_guest_xsave_state(struct kvm_vcpu *vcpu)
   966	{
   967		if (kvm_read_cr4_bits(vcpu, X86_CR4_OSXSAVE)) {
   968	
   969			if (vcpu->arch.xcr0 != host_xcr0)
   970				xsetbv(XCR_XFEATURE_ENABLED_MASK, vcpu->arch.xcr0);
   971	
   972			if (vcpu->arch.xsaves_enabled &&
   973			    vcpu->arch.ia32_xss != host_xss)
   974				wrmsrl(MSR_IA32_XSS, vcpu->arch.ia32_xss);
   975		}
   976	
   977		if (static_cpu_has(X86_FEATURE_PKU) &&
   978		    (kvm_read_cr4_bits(vcpu, X86_CR4_PKE) ||
   979		     (vcpu->arch.xcr0 & XFEATURE_MASK_PKRU)) &&
   980		    vcpu->arch.pkru != vcpu->arch.host_pkru)
   981			write_pkru(vcpu->arch.pkru);
   982	}
   983	EXPORT_SYMBOL_GPL(kvm_load_guest_xsave_state);
   984	
   985	void kvm_load_host_xsave_state(struct kvm_vcpu *vcpu)
   986	{
   987		if (static_cpu_has(X86_FEATURE_PKU) &&
   988		    (kvm_read_cr4_bits(vcpu, X86_CR4_PKE) ||
   989		     (vcpu->arch.xcr0 & XFEATURE_MASK_PKRU))) {
   990			vcpu->arch.pkru = rdpkru();
   991			if (vcpu->arch.pkru != vcpu->arch.host_pkru)
   992				write_pkru(vcpu->arch.host_pkru);
   993		}
   994	
   995		if (kvm_read_cr4_bits(vcpu, X86_CR4_OSXSAVE)) {
   996	
   997			if (vcpu->arch.xcr0 != host_xcr0)
   998				xsetbv(XCR_XFEATURE_ENABLED_MASK, host_xcr0);
   999	
  1000			if (vcpu->arch.xsaves_enabled &&
  1001			    vcpu->arch.ia32_xss != host_xss)
  1002				wrmsrl(MSR_IA32_XSS, host_xss);
  1003		}
  1004	
  1005	}
  1006	EXPORT_SYMBOL_GPL(kvm_load_host_xsave_state);
  1007	
  1008	static int __kvm_set_xcr(struct kvm_vcpu *vcpu, u32 index, u64 xcr)
  1009	{
  1010		u64 xcr0 = xcr;
  1011		u64 old_xcr0 = vcpu->arch.xcr0;
  1012		u64 valid_bits;
  1013	
  1014		/* Only support XCR_XFEATURE_ENABLED_MASK(xcr0) now  */
  1015		if (index != XCR_XFEATURE_ENABLED_MASK)
  1016			return 1;
  1017		if (!(xcr0 & XFEATURE_MASK_FP))
  1018			return 1;
  1019		if ((xcr0 & XFEATURE_MASK_YMM) && !(xcr0 & XFEATURE_MASK_SSE))
  1020			return 1;
  1021	
  1022		/*
  1023		 * Do not allow the guest to set bits that we do not support
  1024		 * saving.  However, xcr0 bit 0 is always set, even if the
  1025		 * emulated CPU does not support XSAVE (see fx_init).
  1026		 */
  1027		valid_bits = vcpu->arch.guest_supported_xcr0 | XFEATURE_MASK_FP;
  1028		if (xcr0 & ~valid_bits)
  1029			return 1;
  1030	
  1031		if ((!(xcr0 & XFEATURE_MASK_BNDREGS)) !=
  1032		    (!(xcr0 & XFEATURE_MASK_BNDCSR)))
  1033			return 1;
  1034	
  1035		if (xcr0 & XFEATURE_MASK_AVX512) {
  1036			if (!(xcr0 & XFEATURE_MASK_YMM))
  1037				return 1;
  1038			if ((xcr0 & XFEATURE_MASK_AVX512) != XFEATURE_MASK_AVX512)
  1039				return 1;
  1040		}
  1041	
  1042		if ((xcr0 & XFEATURE_MASK_XTILE) &&
  1043		    ((xcr0 & XFEATURE_MASK_XTILE) != XFEATURE_MASK_XTILE))
  1044			return 1;
  1045	
  1046		vcpu->arch.xcr0 = xcr0;
  1047	
  1048		if ((xcr0 ^ old_xcr0) & XFEATURE_MASK_EXTEND)
  1049			kvm_update_cpuid_runtime(vcpu);
  1050		return 0;
  1051	}
  1052	
  1053	int kvm_set_xcr(struct kvm_vcpu *vcpu, u32 index, u64 xcr)
  1054	{
  1055		if (kvm_x86_ops.get_cpl(vcpu) != 0 ||
  1056		    __kvm_set_xcr(vcpu, index, xcr)) {
  1057			kvm_inject_gp(vcpu, 0);
  1058			return 1;
  1059		}
  1060		return 0;
  1061	}
  1062	EXPORT_SYMBOL_GPL(kvm_set_xcr);
  1063	
  1064	bool kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
  1065	{
  1066		if (cr4 & cr4_reserved_bits)
  1067			return false;
  1068	
  1069		if (cr4 & vcpu->arch.cr4_guest_rsvd_bits)
  1070			return false;
  1071	
  1072		return kvm_x86_ops.is_valid_cr4(vcpu, cr4);
  1073	}
  1074	EXPORT_SYMBOL_GPL(kvm_is_valid_cr4);
  1075	
> 1076	void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
  1077	{
  1078		unsigned long mmu_role_bits = X86_CR4_PGE | X86_CR4_PSE | X86_CR4_PAE |
  1079					      X86_CR4_SMEP | X86_CR4_SMAP | X86_CR4_PKE;
  1080	
  1081		if (((cr4 ^ old_cr4) & mmu_role_bits) ||
  1082		    (!(cr4 & X86_CR4_PCIDE) && (old_cr4 & X86_CR4_PCIDE)))
  1083			kvm_mmu_reset_context(vcpu);
  1084	}
  1085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
