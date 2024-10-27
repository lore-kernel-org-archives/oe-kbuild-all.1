Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D5317C7C4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730066991; cv=none; b=Ear9jTdsTbkz2cvT/G7UN/jdtkKyICO28QNlRxn6iYXzcQJOT0OxoPHHxqNBxxorOeB8MbM/NLvQodr7jnLguzrKG2nKi5aFF90ljWKa5/yWczOm0yfh4V6tsEP3AoZdmnjBc0A+Xm93I7uKTPHaXQEpqQyWdTGmsBPyA2ImDr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730066991; c=relaxed/simple;
	bh=Kj+Hc97Fl+3D2KLs/UuPi0yRn7Y2/cKrOb/s9EK1kW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uv+/BbmY5PODtAqrZbXe0zEnfFAU2yIL9dQA/LV97BYjcVY94yN2T56QOYjdqCqq6dxhWmI79e2qti6pcWZ0FRmFBlJ/rRHhyQ+3aubaPw4si776TV0r47W8q9b4kTbMfW1w0vzXlKAJQG4fhIanDym/NCYSpEggaIiirc0SPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5RT1Tns; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5RT1Tns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730066988; x=1761602988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kj+Hc97Fl+3D2KLs/UuPi0yRn7Y2/cKrOb/s9EK1kW8=;
  b=A5RT1TnsXVdbimFEsW4bVYIY1PRm/GQdENwLI6vRw3uegLaGITR9BoBA
   W5Et/j6S7UWJoIBw6RGck2xnJ47cVfxFG/7kX6OrU75V/7kp1za4K9L/Y
   2qjZnooWlTSZBAqvBzDQcAzL005KDY3XEknus0O8Q+LEw02QIDRFqN2lA
   T8fIJzBLKUFumSnyISoT+wYzfYyKChlbywD+r2U8JbsRp915y8YEcDBwN
   np/h7yRyr9tBPLknXw/knM1U+2Ro3e1K39S6jFH6oMUK+4hIWIAUu0eEL
   1WJzQoVNRI6P3g1+O0RBDNkJLxb5sFiTjRgBbXpGtqd0vPBO9gxDEWTmq
   Q==;
X-CSE-ConnectionGUID: kSSFrmeSTcyoJQfbo9PvVw==
X-CSE-MsgGUID: +2Az/FK+S4+pUBAK6qYsuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="55069945"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="55069945"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 15:09:47 -0700
X-CSE-ConnectionGUID: nGQHL7mIRvidUrNJyfS/1A==
X-CSE-MsgGUID: swqV0CO2RLORlYiDQoOpKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="86180924"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2024 15:09:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5BSB-000b1c-1f;
	Sun, 27 Oct 2024 22:09:43 +0000
Date: Mon, 28 Oct 2024 06:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hejingxian <hejingxian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 25559/30000] arch/arm64/kvm/cvm.c:71:6: warning:
 no previous prototype for 'kvm_cvm_supports_sve'
Message-ID: <202410280656.1UEnlVVA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jingxian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: ae80c7e2f5cd3e50d1f360c387a33088310d54a0 [25559/30000] kvm: add cvm host feature
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241028/202410280656.1UEnlVVA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280656.1UEnlVVA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280656.1UEnlVVA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/cvm.c:42:5: warning: no previous prototype for 'cvm_phys_to_phys' [-Wmissing-prototypes]
      42 | u64 cvm_phys_to_phys(u64 phys)
         |     ^~~~~~~~~~~~~~~~
>> arch/arm64/kvm/cvm.c:71:6: warning: no previous prototype for 'kvm_cvm_supports_sve' [-Wmissing-prototypes]
      71 | bool kvm_cvm_supports_sve(void)
         |      ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/cvm.c:76:6: warning: no previous prototype for 'kvm_cvm_supports_pmu' [-Wmissing-prototypes]
      76 | bool kvm_cvm_supports_pmu(void)
         |      ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/cvm.c:81:5: warning: no previous prototype for 'kvm_cvm_ipa_limit' [-Wmissing-prototypes]
      81 | u32 kvm_cvm_ipa_limit(void)
         |     ^~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/cvm.c:86:5: warning: no previous prototype for 'kvm_cvm_get_num_brps' [-Wmissing-prototypes]
      86 | u32 kvm_cvm_get_num_brps(void)
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/cvm.c:91:5: warning: no previous prototype for 'kvm_cvm_get_num_wrps' [-Wmissing-prototypes]
      91 | u32 kvm_cvm_get_num_wrps(void)
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/cvm.c:240:5: warning: no previous prototype for 'kvm_cvm_create_ttt_levels' [-Wmissing-prototypes]
     240 | int kvm_cvm_create_ttt_levels(struct kvm *kvm, struct cvm *cvm,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/cvm.c:301:5: warning: no previous prototype for 'kvm_cvm_populate_par_region' [-Wmissing-prototypes]
     301 | int kvm_cvm_populate_par_region(struct kvm *kvm,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_cvm_supports_sve +71 arch/arm64/kvm/cvm.c

    70	
  > 71	bool kvm_cvm_supports_sve(void)
    72	{
    73		return tmm_supports(TMI_FEATURE_REGISTER_0_SVE_EN);
    74	}
    75	
  > 76	bool kvm_cvm_supports_pmu(void)
    77	{
    78		return tmm_supports(TMI_FEATURE_REGISTER_0_PMU_EN);
    79	}
    80	
  > 81	u32 kvm_cvm_ipa_limit(void)
    82	{
    83		return u64_get_bits(tmm_feat_reg0, TMI_FEATURE_REGISTER_0_S2SZ);
    84	}
    85	
  > 86	u32 kvm_cvm_get_num_brps(void)
    87	{
    88		return u64_get_bits(tmm_feat_reg0, TMI_FEATURE_REGISTER_0_NUM_BPS);
    89	}
    90	
  > 91	u32 kvm_cvm_get_num_wrps(void)
    92	{
    93		return u64_get_bits(tmm_feat_reg0, TMI_FEATURE_REGISTER_0_NUM_WPS);
    94	}
    95	
    96	static int cvm_vmid_reserve(void)
    97	{
    98		int ret;
    99		unsigned int vmid_count = 1 << kvm_get_vmid_bits();
   100	
   101		spin_lock(&cvm_vmid_lock);
   102		ret = bitmap_find_free_region(cvm_vmid_bitmap, vmid_count, 0);
   103		spin_unlock(&cvm_vmid_lock);
   104	
   105		return ret;
   106	}
   107	
   108	static void cvm_vmid_release(unsigned int vmid)
   109	{
   110		spin_lock(&cvm_vmid_lock);
   111		bitmap_release_region(cvm_vmid_bitmap, vmid, 0);
   112		spin_unlock(&cvm_vmid_lock);
   113	}
   114	
   115	static u32 __kvm_pgd_page_idx(struct kvm_pgtable *pgt, u64 addr)
   116	{
   117		u64 shift = ARM64_HW_PGTABLE_LEVEL_SHIFT(pgt->start_level - 1);
   118		u64 mask = BIT(pgt->ia_bits) - 1;
   119	
   120		return (addr & mask) >> shift;
   121	}
   122	
   123	static u32 kvm_pgd_pages(u32 ia_bits, u32 start_level)
   124	{
   125		struct kvm_pgtable pgt = {
   126			.ia_bits		= ia_bits,
   127			.start_level	= start_level,
   128		};
   129		return __kvm_pgd_page_idx(&pgt, -1ULL) + 1;
   130	}
   131	
   132	int kvm_arm_create_cvm(struct kvm *kvm)
   133	{
   134		int ret;
   135		struct kvm_pgtable *pgt = kvm->arch.mmu.pgt;
   136		unsigned int pgd_sz;
   137	
   138		if (!kvm_is_cvm(kvm) || kvm_cvm_state(kvm) != CVM_STATE_NONE)
   139			return 0;
   140	
   141		ret = cvm_vmid_reserve();
   142		if (ret < 0)
   143			return ret;
   144	
   145		kvm->arch.cvm.cvm_vmid = ret;
   146	
   147		pgd_sz = kvm_pgd_pages(pgt->ia_bits, pgt->start_level);
   148	
   149		kvm->arch.cvm.params->ttt_base = phys_to_cvm_phys(kvm->arch.mmu.pgd_phys);
   150		kvm->arch.cvm.params->measurement_algo = 0;
   151		kvm->arch.cvm.params->ttt_level_start = kvm->arch.mmu.pgt->start_level;
   152		kvm->arch.cvm.params->ttt_num_start = pgd_sz;
   153		kvm->arch.cvm.params->s2sz = VTCR_EL2_IPA(kvm->arch.vtcr);
   154		kvm->arch.cvm.params->vmid = kvm->arch.cvm.cvm_vmid;
   155		kvm->arch.cvm.params->ns_vtcr = kvm->arch.vtcr;
   156		kvm->arch.cvm.params->vttbr_el2 = kvm->arch.mmu.pgd_phys;
   157		ret = tmi_cvm_create(kvm->arch.cvm.rd, __pa(kvm->arch.cvm.params));
   158		if (!ret)
   159			kvm_info("KVM creates cVM: %d\n", kvm->arch.cvm.cvm_vmid);
   160	
   161		WRITE_ONCE(kvm->arch.cvm.state, CVM_STATE_NEW);
   162		kfree(kvm->arch.cvm.params);
   163		kvm->arch.cvm.params = NULL;
   164		return ret;
   165	}
   166	
   167	int cvm_create_rd(struct kvm *kvm)
   168	{
   169		if (!static_key_enabled(&kvm_cvm_is_available))
   170			return -EFAULT;
   171	
   172		kvm->arch.cvm.rd = tmi_mem_alloc(kvm->arch.cvm.rd, NO_NUMA,
   173			TMM_MEM_TYPE_RD, TMM_MEM_MAP_SIZE_MAX);
   174		if (!kvm->arch.cvm.rd) {
   175			kvm_err("tmi_mem_alloc for cvm rd failed: %d\n", kvm->arch.cvm.cvm_vmid);
   176			return -ENOMEM;
   177		}
   178		kvm->arch.is_cvm = true;
   179		return 0;
   180	}
   181	
   182	void kvm_free_rd(struct kvm *kvm)
   183	{
   184		int ret;
   185	
   186		if (!kvm->arch.cvm.rd)
   187			return;
   188	
   189		ret = tmi_mem_free(kvm->arch.cvm.rd, NO_NUMA, TMM_MEM_TYPE_RD, TMM_MEM_MAP_SIZE_MAX);
   190		if (ret)
   191			kvm_err("tmi_mem_free for cvm rd failed: %d\n", kvm->arch.cvm.cvm_vmid);
   192		else
   193			kvm->arch.cvm.rd = 0;
   194	}
   195	
   196	void kvm_destroy_cvm(struct kvm *kvm)
   197	{
   198		uint32_t cvm_vmid = kvm->arch.cvm.cvm_vmid;
   199	
   200		kfree(kvm->arch.cvm.params);
   201		kvm->arch.cvm.params = NULL;
   202	
   203		if (kvm_cvm_state(kvm) == CVM_STATE_NONE)
   204			return;
   205	
   206		cvm_vmid_release(cvm_vmid);
   207	
   208		WRITE_ONCE(kvm->arch.cvm.state, CVM_STATE_DYING);
   209	
   210		if (!tmi_cvm_destroy(kvm->arch.cvm.rd))
   211			kvm_info("KVM has destroyed cVM: %d\n", kvm->arch.cvm.cvm_vmid);
   212	
   213		kvm_free_rd(kvm);
   214	}
   215	
   216	static int kvm_get_host_numa_node_by_ipa(uint64_t ipa, struct kvm_vcpu *vcpu)
   217	{
   218		int i;
   219		struct kvm_numa_info *numa_info = &vcpu->kvm->arch.cvm.numa_info;
   220	
   221		for (i = 0; i < numa_info->numa_cnt && i < MAX_NUMA_NODE; i++) {
   222			struct kvm_numa_node *numa_node = &numa_info->numa_nodes[i];
   223	
   224			if (ipa >= numa_node->ipa_start &&
   225				ipa < (numa_node->ipa_start + numa_node->ipa_size))
   226				return numa_node->host_numa_node;
   227		}
   228		return NO_NUMA;
   229	}
   230	
   231	static int kvm_cvm_ttt_create(struct cvm *cvm,
   232				unsigned long addr,
   233				int level,
   234				phys_addr_t phys)
   235	{
   236		addr = ALIGN_DOWN(addr, cvm_ttt_level_mapsize(level - 1));
   237		return tmi_ttt_create(phys, cvm->rd, addr, level);
   238	}
   239	
 > 240	int kvm_cvm_create_ttt_levels(struct kvm *kvm, struct cvm *cvm,
   241				unsigned long ipa,
   242				int level,
   243				int max_level,
   244				struct kvm_mmu_memory_cache *mc)
   245	{
   246		if (WARN_ON(level == max_level))
   247			return 0;
   248	
   249		while (level++ < max_level) {
   250			phys_addr_t ttt;
   251	
   252			ttt = tmi_mem_alloc(cvm->rd, NO_NUMA,
   253				TMM_MEM_TYPE_TTT, TMM_MEM_MAP_SIZE_MAX);
   254			if (ttt == 0)
   255				return -ENOMEM;
   256	
   257			if (kvm_cvm_ttt_create(cvm, ipa, level, ttt)) {
   258				(void)tmi_mem_free(ttt, NO_NUMA, TMM_MEM_TYPE_TTT, TMM_MEM_MAP_SIZE_MAX);
   259				return -ENXIO;
   260			}
   261		}
   262	
   263		return 0;
   264	}
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
