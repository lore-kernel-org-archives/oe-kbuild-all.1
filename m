Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3413D31D377
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616815; cv=none; b=Nr7a3dC4+9BrofsyH937Y3c3nThiEGPtgy6rHE1GU1RbHyLrDjzLL84hJqzWLG1nfdUBzPylMy0780J5dM/Arf9eB+iFIREeExtPoB4SMXEFtpas0CSQKCgrJdHi3QV+5atSmItc3Ci42PT1A7NKaZaqdM8BHgzZ3P7ny+2s98A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616815; c=relaxed/simple;
	bh=UDjUeOanEZDhdGI4LYUbv57/j6dcj6yrGWcf2E6iC+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qfohxQXVUtIjwRHZNg+Tw8kACnp+CH7qSCiR0/K/nZRD6KLX9k6DahfG86/0xDgZ10iWywA/QOTjmH6ikeSmBerT3HoPwIESabFDyGmLgecSCcZTzISev9imKuiC/qdVoQO0qQzPpWiR4fSyBIsI/wYBbpmA64ySuY2r9t3Bp3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AumjLMLH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AumjLMLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758616812; x=1790152812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UDjUeOanEZDhdGI4LYUbv57/j6dcj6yrGWcf2E6iC+U=;
  b=AumjLMLHC3tBTv9tEZkTnQ04iLBRfg4O2XSBSaCTYIN4MYqun+ZtH0+r
   tXm3P+HDtmUsiq/bvPLW+5bJZuX0/g53liSRxfVVaZJgSIrBT9+KHGAke
   wwI/en6MFabOEYUihDXEE3uCHOvGylhCH5Zeg6jkG4lPjTfbVzTz8XjSC
   /d9gRm4nFBcgikdTI7Gf3MdaWjXWwA9GSvmUp52mYW0pBVRL3Hw3FuQlK
   GLkhqs9k0uCPj7bgkH4WvJqTJaqu+PxAxQ+U+N+YhU7+PGPZjLeJ+qb9d
   2VmFW0eddgOG1B/3Qij6MjgFKXnaxisiBWUIXauPgFZsRR13Cdq8p60US
   Q==;
X-CSE-ConnectionGUID: A0UNC4rMRYCz876BTbfT/A==
X-CSE-MsgGUID: vwTRDyZYSBy7hY2sbTIZIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72250027"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="72250027"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 01:40:10 -0700
X-CSE-ConnectionGUID: leQ/Fl5sQ0CN3wuN+b/Z9Q==
X-CSE-MsgGUID: 8tNYq6xRTreTymTnJo3D2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="181007192"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2025 01:40:08 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0yZB-0002vR-33;
	Tue, 23 Sep 2025 08:40:05 +0000
Date: Tue, 23 Sep 2025 16:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2909/2909] arch/arm64/kvm/virtcca_cvm.c:992:5:
 sparse: sparse: symbol 'kvm_cvm_vgic_nr_lr' was not declared. Should it be
 static?
Message-ID: <202509231602.0wZbxID6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   be758a5796c3d280deb877699c41fd0cd04e1deb
commit: 62c8d269e7acb9171be225e1f9ebd52c718a0cc0 [2909/2909] Reapply "VirtCCA: cvm support UEFI boot"
config: arm64-randconfig-r121-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231602.0wZbxID6-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231602.0wZbxID6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231602.0wZbxID6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/virtcca_cvm.c:992:5: sparse: sparse: symbol 'kvm_cvm_vgic_nr_lr' was not declared. Should it be static?
   arch/arm64/kvm/virtcca_cvm.c:1311:5: sparse: sparse: symbol 'cvm_arm_smmu_domain_set_kvm' was not declared. Should it be static?

vim +/kvm_cvm_vgic_nr_lr +992 arch/arm64/kvm/virtcca_cvm.c

67e11ee6347c43 Jingxian He  2024-08-03  824  
86b9cab8c4752e gongchangsui 2025-03-03 @825  u64 virtcca_get_tmi_version(void)
86b9cab8c4752e gongchangsui 2025-03-03  826  {
86b9cab8c4752e gongchangsui 2025-03-03  827  	u64 res = tmi_version();
86b9cab8c4752e gongchangsui 2025-03-03  828  
86b9cab8c4752e gongchangsui 2025-03-03  829  	if (res == SMCCC_RET_NOT_SUPPORTED)
86b9cab8c4752e gongchangsui 2025-03-03  830  		return 0;
86b9cab8c4752e gongchangsui 2025-03-03  831  	return res;
86b9cab8c4752e gongchangsui 2025-03-03  832  }
86b9cab8c4752e gongchangsui 2025-03-03  833  
67e11ee6347c43 Jingxian He  2024-08-03  834  static bool is_numa_ipa_range_valid(struct kvm_numa_info *numa_info)
67e11ee6347c43 Jingxian He  2024-08-03  835  {
67e11ee6347c43 Jingxian He  2024-08-03  836  	unsigned long i;
67e11ee6347c43 Jingxian He  2024-08-03  837  	struct kvm_numa_node *numa_node, *prev_numa_node;
67e11ee6347c43 Jingxian He  2024-08-03  838  
67e11ee6347c43 Jingxian He  2024-08-03  839  	prev_numa_node = NULL;
67e11ee6347c43 Jingxian He  2024-08-03  840  	for (i = 0; i < numa_info->numa_cnt; i++) {
67e11ee6347c43 Jingxian He  2024-08-03  841  		numa_node = &numa_info->numa_nodes[i];
67e11ee6347c43 Jingxian He  2024-08-03  842  		if (numa_node->ipa_start + numa_node->ipa_size < numa_node->ipa_start)
67e11ee6347c43 Jingxian He  2024-08-03  843  			return false;
67e11ee6347c43 Jingxian He  2024-08-03  844  		if (prev_numa_node &&
67e11ee6347c43 Jingxian He  2024-08-03  845  			numa_node->ipa_start < prev_numa_node->ipa_start + prev_numa_node->ipa_size)
67e11ee6347c43 Jingxian He  2024-08-03  846  			return false;
67e11ee6347c43 Jingxian He  2024-08-03  847  		prev_numa_node = numa_node;
67e11ee6347c43 Jingxian He  2024-08-03  848  	}
67e11ee6347c43 Jingxian He  2024-08-03  849  	if (numa_node->ipa_start + numa_node->ipa_size > CVM_IPA_MAX_VAL)
67e11ee6347c43 Jingxian He  2024-08-03  850  		return false;
67e11ee6347c43 Jingxian He  2024-08-03  851  	return true;
67e11ee6347c43 Jingxian He  2024-08-03  852  }
67e11ee6347c43 Jingxian He  2024-08-03  853  
67773feaf93305 gongchangsui 2025-03-04  854  static inline bool is_dtb_info_has_extend_data(u64 dtb_info)
67773feaf93305 gongchangsui 2025-03-04  855  {
67773feaf93305 gongchangsui 2025-03-04  856  	return dtb_info & 0x1;
67773feaf93305 gongchangsui 2025-03-04  857  }
67773feaf93305 gongchangsui 2025-03-04  858  
67e11ee6347c43 Jingxian He  2024-08-03  859  int kvm_load_user_data(struct kvm *kvm, unsigned long arg)
67e11ee6347c43 Jingxian He  2024-08-03  860  {
67e11ee6347c43 Jingxian He  2024-08-03  861  	struct kvm_user_data user_data;
67e11ee6347c43 Jingxian He  2024-08-03  862  	void __user *argp = (void __user *)arg;
67e11ee6347c43 Jingxian He  2024-08-03  863  	struct virtcca_cvm *cvm = kvm->arch.virtcca_cvm;
67e11ee6347c43 Jingxian He  2024-08-03  864  	struct kvm_numa_info *numa_info;
67e11ee6347c43 Jingxian He  2024-08-03  865  
befbde867291b5 He Jingxian  2025-04-07  866  	if (!kvm_is_realm(kvm))
67e11ee6347c43 Jingxian He  2024-08-03  867  		return -EFAULT;
67e11ee6347c43 Jingxian He  2024-08-03  868  
67e11ee6347c43 Jingxian He  2024-08-03  869  	if (copy_from_user(&user_data, argp, sizeof(user_data)))
67e11ee6347c43 Jingxian He  2024-08-03  870  		return -EINVAL;
67e11ee6347c43 Jingxian He  2024-08-03  871  
67e11ee6347c43 Jingxian He  2024-08-03  872  	numa_info = &user_data.numa_info;
67e11ee6347c43 Jingxian He  2024-08-03  873  	if (numa_info->numa_cnt > MAX_NUMA_NODE)
67e11ee6347c43 Jingxian He  2024-08-03  874  		return -EINVAL;
67e11ee6347c43 Jingxian He  2024-08-03  875  
67e11ee6347c43 Jingxian He  2024-08-03  876  	if (numa_info->numa_cnt > 0) {
67e11ee6347c43 Jingxian He  2024-08-03  877  		unsigned long i, total_size = 0;
67e11ee6347c43 Jingxian He  2024-08-03  878  		struct kvm_numa_node *numa_node = &numa_info->numa_nodes[0];
67e11ee6347c43 Jingxian He  2024-08-03  879  		unsigned long ipa_end = numa_node->ipa_start + numa_node->ipa_size;
67e11ee6347c43 Jingxian He  2024-08-03  880  
67e11ee6347c43 Jingxian He  2024-08-03  881  		if (!is_numa_ipa_range_valid(numa_info))
67e11ee6347c43 Jingxian He  2024-08-03  882  			return -EINVAL;
67773feaf93305 gongchangsui 2025-03-04  883  
67773feaf93305 gongchangsui 2025-03-04  884  		if ((user_data.loader_start != numa_node->ipa_start) ||
67773feaf93305 gongchangsui 2025-03-04  885  			(user_data.data_start + user_data.data_size < user_data.data_start))
67e11ee6347c43 Jingxian He  2024-08-03  886  			return -EINVAL;
67773feaf93305 gongchangsui 2025-03-04  887  
67773feaf93305 gongchangsui 2025-03-04  888  		if (is_dtb_info_has_extend_data(user_data.dtb_info)) {
67773feaf93305 gongchangsui 2025-03-04  889  			/* Direct boot, check DTB address is in IPA range */
67773feaf93305 gongchangsui 2025-03-04  890  			if (user_data.data_start + user_data.data_size > ipa_end)
67773feaf93305 gongchangsui 2025-03-04  891  				return -EINVAL;
67773feaf93305 gongchangsui 2025-03-04  892  		} else {
67773feaf93305 gongchangsui 2025-03-04  893  			/*
67773feaf93305 gongchangsui 2025-03-04  894  			 * UEFI boot, check MMIO address range is within the valid limit (less than
67773feaf93305 gongchangsui 2025-03-04  895  			 * loader_start)
67773feaf93305 gongchangsui 2025-03-04  896  			 */
67773feaf93305 gongchangsui 2025-03-04  897  			if (user_data.data_start + user_data.data_size > user_data.loader_start)
67773feaf93305 gongchangsui 2025-03-04  898  				return -EINVAL;
67773feaf93305 gongchangsui 2025-03-04  899  		}
67773feaf93305 gongchangsui 2025-03-04  900  
67e11ee6347c43 Jingxian He  2024-08-03  901  		for (i = 0; i < numa_info->numa_cnt; i++)
67e11ee6347c43 Jingxian He  2024-08-03  902  			total_size += numa_info->numa_nodes[i].ipa_size;
67e11ee6347c43 Jingxian He  2024-08-03  903  		if (total_size != user_data.ram_size)
67e11ee6347c43 Jingxian He  2024-08-03  904  			return -EINVAL;
67e11ee6347c43 Jingxian He  2024-08-03  905  	}
67e11ee6347c43 Jingxian He  2024-08-03  906  
67773feaf93305 gongchangsui 2025-03-04  907  	if (is_dtb_info_has_extend_data(user_data.dtb_info))
67773feaf93305 gongchangsui 2025-03-04  908  		cvm->dtb_end = user_data.data_start + user_data.data_size;
67773feaf93305 gongchangsui 2025-03-04  909  	else {
67773feaf93305 gongchangsui 2025-03-04  910  		cvm->dtb_end = user_data.loader_start + user_data.dtb_info;
67773feaf93305 gongchangsui 2025-03-04  911  		cvm->mmio_start = user_data.data_start;
67773feaf93305 gongchangsui 2025-03-04  912  		cvm->mmio_end = user_data.data_start + user_data.data_size;
67773feaf93305 gongchangsui 2025-03-04  913  	}
67e11ee6347c43 Jingxian He  2024-08-03  914  
67e11ee6347c43 Jingxian He  2024-08-03  915  	cvm->loader_start = user_data.loader_start;
67e11ee6347c43 Jingxian He  2024-08-03  916  	cvm->ram_size = user_data.ram_size;
67e11ee6347c43 Jingxian He  2024-08-03  917  	memcpy(&cvm->numa_info, numa_info, sizeof(struct kvm_numa_info));
67e11ee6347c43 Jingxian He  2024-08-03  918  
67e11ee6347c43 Jingxian He  2024-08-03  919  	return 0;
67e11ee6347c43 Jingxian He  2024-08-03  920  }
67e11ee6347c43 Jingxian He  2024-08-03  921  
67e11ee6347c43 Jingxian He  2024-08-03  922  void kvm_cvm_vcpu_put(struct kvm_vcpu *vcpu)
67e11ee6347c43 Jingxian He  2024-08-03  923  {
67e11ee6347c43 Jingxian He  2024-08-03  924  	kvm_timer_vcpu_put(vcpu);
67e11ee6347c43 Jingxian He  2024-08-03  925  	kvm_vgic_put(vcpu);
67e11ee6347c43 Jingxian He  2024-08-03  926  	vcpu->cpu = -1;
67e11ee6347c43 Jingxian He  2024-08-03  927  }
67e11ee6347c43 Jingxian He  2024-08-03  928  
67e11ee6347c43 Jingxian He  2024-08-03  929  unsigned long cvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu,
67e11ee6347c43 Jingxian He  2024-08-03  930  	unsigned long target_affinity, unsigned long lowest_affinity_level)
67e11ee6347c43 Jingxian He  2024-08-03  931  {
67e11ee6347c43 Jingxian He  2024-08-03  932  	struct kvm_vcpu *target_vcpu;
67e11ee6347c43 Jingxian He  2024-08-03  933  
67e11ee6347c43 Jingxian He  2024-08-03  934  	if (lowest_affinity_level != 0)
67e11ee6347c43 Jingxian He  2024-08-03  935  		return PSCI_RET_INVALID_PARAMS;
67e11ee6347c43 Jingxian He  2024-08-03  936  
67e11ee6347c43 Jingxian He  2024-08-03  937  	target_vcpu = kvm_mpidr_to_vcpu(vcpu->kvm, target_affinity);
67e11ee6347c43 Jingxian He  2024-08-03  938  	if (!target_vcpu)
67e11ee6347c43 Jingxian He  2024-08-03  939  		return PSCI_RET_INVALID_PARAMS;
67e11ee6347c43 Jingxian He  2024-08-03  940  
befbde867291b5 He Jingxian  2025-04-07  941  	cvm_psci_complete(vcpu, target_vcpu, PSCI_RET_SUCCESS);
67e11ee6347c43 Jingxian He  2024-08-03  942  	return PSCI_RET_SUCCESS;
67e11ee6347c43 Jingxian He  2024-08-03  943  }
67e11ee6347c43 Jingxian He  2024-08-03  944  
67e11ee6347c43 Jingxian He  2024-08-03  945  int kvm_cvm_vcpu_set_events(struct kvm_vcpu *vcpu,
67e11ee6347c43 Jingxian He  2024-08-03  946  	bool serror_pending, bool ext_dabt_pending)
67e11ee6347c43 Jingxian He  2024-08-03  947  {
befbde867291b5 He Jingxian  2025-04-07  948  	struct tmi_tec_run *run = vcpu->arch.tec.run;
67e11ee6347c43 Jingxian He  2024-08-03  949  	if (serror_pending)
67e11ee6347c43 Jingxian He  2024-08-03  950  		return -EINVAL;
67e11ee6347c43 Jingxian He  2024-08-03  951  
67e11ee6347c43 Jingxian He  2024-08-03  952  	if (ext_dabt_pending) {
befbde867291b5 He Jingxian  2025-04-07  953  		if (!(run->enter.flags & REC_ENTER_FLAG_EMULATED_MMIO))
67e11ee6347c43 Jingxian He  2024-08-03  954  			return -EINVAL;
befbde867291b5 He Jingxian  2025-04-07  955  		run->enter.flags &= ~REC_ENTER_FLAG_EMULATED_MMIO;
befbde867291b5 He Jingxian  2025-04-07  956  		run->enter.flags |= REC_ENTER_FLAG_INJECT_SEA;
67e11ee6347c43 Jingxian He  2024-08-03  957  	}
67e11ee6347c43 Jingxian He  2024-08-03  958  	return 0;
67e11ee6347c43 Jingxian He  2024-08-03  959  }
67e11ee6347c43 Jingxian He  2024-08-03  960  
67e11ee6347c43 Jingxian He  2024-08-03  961  int kvm_init_cvm_vm(struct kvm *kvm)
67e11ee6347c43 Jingxian He  2024-08-03  962  {
67e11ee6347c43 Jingxian He  2024-08-03  963  	struct tmi_cvm_params *params;
67e11ee6347c43 Jingxian He  2024-08-03  964  	struct virtcca_cvm *cvm;
67e11ee6347c43 Jingxian He  2024-08-03  965  
67e11ee6347c43 Jingxian He  2024-08-03  966  	if (kvm->arch.virtcca_cvm) {
67e11ee6347c43 Jingxian He  2024-08-03  967  		kvm_info("cvm already create.\n");
67e11ee6347c43 Jingxian He  2024-08-03  968  		return 0;
67e11ee6347c43 Jingxian He  2024-08-03  969  	}
67e11ee6347c43 Jingxian He  2024-08-03  970  
67e11ee6347c43 Jingxian He  2024-08-03  971  	cvm = (struct virtcca_cvm *)kzalloc(sizeof(struct virtcca_cvm), GFP_KERNEL_ACCOUNT);
67e11ee6347c43 Jingxian He  2024-08-03  972  	if (!cvm)
67e11ee6347c43 Jingxian He  2024-08-03  973  		return -ENOMEM;
67e11ee6347c43 Jingxian He  2024-08-03  974  
67e11ee6347c43 Jingxian He  2024-08-03  975  	kvm->arch.virtcca_cvm = cvm;
67e11ee6347c43 Jingxian He  2024-08-03  976  	params = kzalloc(PAGE_SIZE, GFP_KERNEL_ACCOUNT);
67e11ee6347c43 Jingxian He  2024-08-03  977  	if (!params) {
67e11ee6347c43 Jingxian He  2024-08-03  978  		kfree(kvm->arch.virtcca_cvm);
67e11ee6347c43 Jingxian He  2024-08-03  979  		kvm->arch.virtcca_cvm = NULL;
67e11ee6347c43 Jingxian He  2024-08-03  980  		return -ENOMEM;
67e11ee6347c43 Jingxian He  2024-08-03  981  	}
67e11ee6347c43 Jingxian He  2024-08-03  982  
67e11ee6347c43 Jingxian He  2024-08-03  983  	cvm->params = params;
67e11ee6347c43 Jingxian He  2024-08-03  984  	WRITE_ONCE(cvm->state, CVM_STATE_NONE);
67e11ee6347c43 Jingxian He  2024-08-03  985  
befbde867291b5 He Jingxian  2025-04-07  986  	kvm_enable_virtcca_cvm(kvm);
67e11ee6347c43 Jingxian He  2024-08-03  987  	return 0;
67e11ee6347c43 Jingxian He  2024-08-03  988  }
a8078c65197c6f yangxiangkai 2024-09-10  989  
befbde867291b5 He Jingxian  2025-04-07  990  extern struct vgic_global kvm_vgic_global_state;
befbde867291b5 He Jingxian  2025-04-07  991  
befbde867291b5 He Jingxian  2025-04-07 @992  u32 kvm_cvm_vgic_nr_lr(void)
befbde867291b5 He Jingxian  2025-04-07  993  {
befbde867291b5 He Jingxian  2025-04-07  994  	return kvm_vgic_global_state.nr_lr;
befbde867291b5 He Jingxian  2025-04-07  995  }
befbde867291b5 He Jingxian  2025-04-07  996  

:::::: The code at line 992 was first introduced by commit
:::::: befbde867291b5bb068a97b17086ad20484b6068 VirtCCA: Adapt virtcca operations by cca_base.

:::::: TO: He Jingxian <hejingxian@huawei.com>
:::::: CC: Xu Raoqing <xuraoqing@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
