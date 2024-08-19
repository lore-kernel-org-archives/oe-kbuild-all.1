Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170B08287D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083741; cv=none; b=uXpmLntb/wb4S9puAwpRZbzJIwAJrH/hs9LPKjuEkGRD46gEpS3F8V/f5/JwP6h0a/2aKVpklYdGcFePBOazR2edFq/idLMuNjtSdjuQfEsFv4zjz3/LX0wEa9dPEE+p9rJZkApwVfThcF7XeP0cDAngyaks5CO1QyQvt0Li0kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083741; c=relaxed/simple;
	bh=k/2oqkYAZCy+6g5JlPwo6/ddQuJQJS2aDABL23CGwZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=siwlgn6Ji9QvZxwi0cuU9ClJ24CAPThbKzHVmQjvxfwA2theUi2wS/D098PvleYL0rtMRk1ijnZ0yTsg7AFQkW0YiS/6pZ/7l+ixMCaQIG/lv658e3Wv7B2LSornG1kcSLx8uhWFKt/1ERmBwoAoeM4PblVLxWnIuUfz6yzeoSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTui7kap; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTui7kap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724083739; x=1755619739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k/2oqkYAZCy+6g5JlPwo6/ddQuJQJS2aDABL23CGwZo=;
  b=VTui7kapK5RcD2QuTMxhJF9qsyeoUfX97v4Ub8lEr/QZXT2TnMqH4EqI
   hKsMYYEn5w3nLdS7jJAkVkwToag0ay+U8+y2gOBJrZgLR9iIPuoIq+d4i
   n5Mjos2wp7ODvN7+LFehQS+sNOlpg0czVhvfu3N+o50+dpNAcwtpfPBiQ
   3YfUagk/+/D6rH1uLL2b/veCWQUujPQ4jb2TdDSUN7Pix7SEp21U2Zx7R
   RpwntA6XlSZp3N/21jbFO6neIyiiox7c8q07RMXuglBA63wTyuM2udDWQ
   yMPP0ZHU17I1hj6cuudjsHk9JCC/WzoHv1RtYbJYDheWuWrvo8SaR9KsT
   w==;
X-CSE-ConnectionGUID: LCBlrlnrQ7qx8JwFMHbJHQ==
X-CSE-MsgGUID: RAu+y7ZLRi+w2zRcpWmTeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33724425"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="33724425"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 09:08:52 -0700
X-CSE-ConnectionGUID: bvXbNyKqQhCPnNgNXN8XKA==
X-CSE-MsgGUID: Yg4nI7IDTR6F6eYLARHAsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="61197187"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Aug 2024 09:08:51 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg4w3-0009AI-3D;
	Mon, 19 Aug 2024 16:08:48 +0000
Date: Tue, 20 Aug 2024 00:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hejingxian <hejingxian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 12432/13455] arch/arm64/kvm/virtcca_cvm.c:70:6:
 warning: no previous prototype for 'kvm_cvm_supports_sve'
Message-ID: <202408200033.m00Dx7hV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   063fb5b67877d27a0adebef0dd88bab842d8de07
commit: 67e11ee6347c43a97e8987b03a5b3534cd8095d9 [12432/13455] kvm: add virtcca cvm host feature
config: arm64-randconfig-003-20240820 (https://download.01.org/0day-ci/archive/20240820/202408200033.m00Dx7hV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200033.m00Dx7hV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200033.m00Dx7hV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/virtcca_cvm.c:70:6: warning: no previous prototype for 'kvm_cvm_supports_sve' [-Wmissing-prototypes]
      70 | bool kvm_cvm_supports_sve(void)
         |      ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/virtcca_cvm.c:75:6: warning: no previous prototype for 'kvm_cvm_supports_pmu' [-Wmissing-prototypes]
      75 | bool kvm_cvm_supports_pmu(void)
         |      ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/virtcca_cvm.c:80:5: warning: no previous prototype for 'kvm_cvm_ipa_limit' [-Wmissing-prototypes]
      80 | u32 kvm_cvm_ipa_limit(void)
         |     ^~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/virtcca_cvm.c:85:5: warning: no previous prototype for 'kvm_cvm_get_num_brps' [-Wmissing-prototypes]
      85 | u32 kvm_cvm_get_num_brps(void)
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/virtcca_cvm.c:90:5: warning: no previous prototype for 'kvm_cvm_get_num_wrps' [-Wmissing-prototypes]
      90 | u32 kvm_cvm_get_num_wrps(void)
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/virtcca_cvm.c:244:5: warning: no previous prototype for 'kvm_cvm_create_ttt_levels' [-Wmissing-prototypes]
     244 | int kvm_cvm_create_ttt_levels(struct kvm *kvm, struct virtcca_cvm *cvm,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/virtcca_cvm.c:311:5: warning: no previous prototype for 'kvm_cvm_populate_par_region' [-Wmissing-prototypes]
     311 | int kvm_cvm_populate_par_region(struct kvm *kvm, u64 numa_set,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm64/kvm/tmi.c:131:5: warning: no previous prototype for 'tmi_tmm_inf_test' [-Wmissing-prototypes]
     131 | u64 tmi_tmm_inf_test(u64 x1, u64 x2, u64 x3, u64 x4, u64 x5)
         |     ^~~~~~~~~~~~~~~~


vim +/kvm_cvm_supports_sve +70 arch/arm64/kvm/virtcca_cvm.c

    69	
  > 70	bool kvm_cvm_supports_sve(void)
    71	{
    72		return tmm_supports(TMI_FEATURE_REGISTER_0_SVE_EN);
    73	}
    74	
  > 75	bool kvm_cvm_supports_pmu(void)
    76	{
    77		return tmm_supports(TMI_FEATURE_REGISTER_0_PMU_EN);
    78	}
    79	
  > 80	u32 kvm_cvm_ipa_limit(void)
    81	{
    82		return u64_get_bits(tmm_feat_reg0, TMI_FEATURE_REGISTER_0_S2SZ);
    83	}
    84	
  > 85	u32 kvm_cvm_get_num_brps(void)
    86	{
    87		return u64_get_bits(tmm_feat_reg0, TMI_FEATURE_REGISTER_0_NUM_BPS);
    88	}
    89	
  > 90	u32 kvm_cvm_get_num_wrps(void)
    91	{
    92		return u64_get_bits(tmm_feat_reg0, TMI_FEATURE_REGISTER_0_NUM_WPS);
    93	}
    94	
    95	static int cvm_vmid_reserve(void)
    96	{
    97		int ret;
    98		unsigned int vmid_count = 1 << kvm_get_vmid_bits();
    99	
   100		spin_lock(&cvm_vmid_lock);
   101		ret = bitmap_find_free_region(cvm_vmid_bitmap, vmid_count, 0);
   102		spin_unlock(&cvm_vmid_lock);
   103	
   104		return ret;
   105	}
   106	
   107	static void cvm_vmid_release(unsigned int vmid)
   108	{
   109		spin_lock(&cvm_vmid_lock);
   110		bitmap_release_region(cvm_vmid_bitmap, vmid, 0);
   111		spin_unlock(&cvm_vmid_lock);
   112	}
   113	
   114	static u32 __kvm_pgd_page_idx(struct kvm_pgtable *pgt, u64 addr)
   115	{
   116		u64 shift = ARM64_HW_PGTABLE_LEVEL_SHIFT(pgt->start_level - 1);
   117		u64 mask = BIT(pgt->ia_bits) - 1;
   118	
   119		return (addr & mask) >> shift;
   120	}
   121	
   122	static u32 kvm_pgd_pages(u32 ia_bits, u32 start_level)
   123	{
   124		struct kvm_pgtable pgt = {
   125			.ia_bits		= ia_bits,
   126			.start_level	= start_level,
   127		};
   128		return __kvm_pgd_page_idx(&pgt, -1ULL) + 1;
   129	}
   130	
   131	/*
   132	 * the configurable physical numa range in QEMU is 0-127,
   133	 * but in real scenarios, 0-63 is sufficient.
   134	 */
   135	static u64 kvm_get_host_numa_set_by_vcpu(u64 vcpu, struct kvm *kvm)
   136	{
   137		int64_t i;
   138		struct virtcca_cvm *cvm = kvm->arch.virtcca_cvm;
   139		struct kvm_numa_info *numa_info = &cvm->numa_info;
   140	
   141		for (i = 0; i < numa_info->numa_cnt && i < MAX_NUMA_NODE; i++) {
   142			if (test_bit(vcpu, (unsigned long *)numa_info->numa_nodes[i].cpu_id))
   143				return numa_info->numa_nodes[i].host_numa_nodes[0];
   144		}
   145		return NO_NUMA;
   146	}
   147	
   148	static u64 kvm_get_first_binded_numa_set(struct kvm *kvm)
   149	{
   150		struct virtcca_cvm *cvm = kvm->arch.virtcca_cvm;
   151		struct kvm_numa_info *numa_info = &cvm->numa_info;
   152	
   153		if (numa_info->numa_cnt > 0)
   154			return numa_info->numa_nodes[0].host_numa_nodes[0];
   155		return NO_NUMA;
   156	}
   157	
   158	int kvm_arm_create_cvm(struct kvm *kvm)
   159	{
   160		int ret;
   161		struct kvm_pgtable *pgt = kvm->arch.mmu.pgt;
   162		unsigned int pgd_sz;
   163		struct virtcca_cvm *cvm = kvm->arch.virtcca_cvm;
   164		/* get affine host numa set by default vcpu 0 */
   165		u64 numa_set = kvm_get_host_numa_set_by_vcpu(0, kvm);
   166	
   167		if (!kvm_is_virtcca_cvm(kvm) || virtcca_cvm_state(kvm) != CVM_STATE_NONE)
   168			return 0;
   169	
   170		if (!cvm->params) {
   171			ret = -EFAULT;
   172			goto out;
   173		}
   174	
   175		ret = cvm_vmid_reserve();
   176		if (ret < 0)
   177			goto out;
   178	
   179		cvm->cvm_vmid = ret;
   180	
   181		pgd_sz = kvm_pgd_pages(pgt->ia_bits, pgt->start_level);
   182	
   183		cvm->params->ttt_level_start = kvm->arch.mmu.pgt->start_level;
   184		cvm->params->ttt_num_start = pgd_sz;
   185		cvm->params->s2sz = VTCR_EL2_IPA(kvm->arch.vtcr);
   186		cvm->params->vmid = cvm->cvm_vmid;
   187		cvm->params->ns_vtcr = kvm->arch.vtcr;
   188		cvm->params->vttbr_el2 = kvm->arch.mmu.pgd_phys;
   189		memcpy(cvm->params->rpv, &cvm->cvm_vmid, sizeof(cvm->cvm_vmid));
   190		cvm->rd = tmi_cvm_create(__pa(cvm->params), numa_set);
   191		if (!cvm->rd) {
   192			kvm_err("KVM creates cVM failed: %d\n", cvm->cvm_vmid);
   193			ret = -ENOMEM;
   194			goto out;
   195		}
   196	
   197		WRITE_ONCE(cvm->state, CVM_STATE_NEW);
   198		ret = 0;
   199	out:
   200		kfree(cvm->params);
   201		cvm->params = NULL;
   202		if (ret < 0) {
   203			kfree(cvm);
   204			kvm->arch.virtcca_cvm = NULL;
   205		}
   206		return ret;
   207	}
   208	
   209	void kvm_destroy_cvm(struct kvm *kvm)
   210	{
   211		struct virtcca_cvm *cvm = kvm->arch.virtcca_cvm;
   212		uint32_t cvm_vmid;
   213	
   214		if (!cvm)
   215			return;
   216	
   217		cvm_vmid = cvm->cvm_vmid;
   218		kfree(cvm->params);
   219		cvm->params = NULL;
   220	
   221		if (virtcca_cvm_state(kvm) == CVM_STATE_NONE)
   222			return;
   223	
   224		cvm_vmid_release(cvm_vmid);
   225	
   226		WRITE_ONCE(cvm->state, CVM_STATE_DYING);
   227	
   228		if (!tmi_cvm_destroy(cvm->rd))
   229			kvm_info("KVM has destroyed cVM: %d\n", cvm->cvm_vmid);
   230	
   231		kfree(cvm);
   232		kvm->arch.virtcca_cvm = NULL;
   233	}
   234	
   235	static int kvm_cvm_ttt_create(struct virtcca_cvm *cvm,
   236				unsigned long addr,
   237				int level,
   238				u64 numa_set)
   239	{
   240		addr = ALIGN_DOWN(addr, cvm_ttt_level_mapsize(level - 1));
   241		return tmi_ttt_create(numa_set, cvm->rd, addr, level);
   242	}
   243	
 > 244	int kvm_cvm_create_ttt_levels(struct kvm *kvm, struct virtcca_cvm *cvm,
   245				unsigned long ipa,
   246				int level,
   247				int max_level,
   248				struct kvm_mmu_memory_cache *mc)
   249	{
   250		int ret = 0;
   251		if (WARN_ON(level == max_level))
   252			return 0;
   253	
   254		while (level++ < max_level) {
   255			u64 numa_set = kvm_get_first_binded_numa_set(kvm);
   256	
   257			ret = kvm_cvm_ttt_create(cvm, ipa, level, numa_set);
   258			if (ret)
   259				return -ENXIO;
   260		}
   261	
   262		return 0;
   263	}
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
