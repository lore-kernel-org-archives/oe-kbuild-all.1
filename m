Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F52010E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748499940; cv=none; b=LCbGxuNZcMRmD8GiEiD6ef/uZRkeqbjw48MSVMEvpicEN4iMgw7ubyHiLDkQff8nQK7aaRm5kJz6SKXvb3f0xedHbelkaHVXOtRll6kFMpvgfAzbp6eC+4Mvb9EYuJz3iIvuchK8aeJ6WoXGSYAu1R0ADH8dcI3Mo8toCypDcLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748499940; c=relaxed/simple;
	bh=aar1zJELZDYeBucUXJtNs6otcc48zCELE3fGNA/GRXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXc8iBbGMFNtbDdBVrcR0o0S/kxqjLxh31hRXtgZ2gxMmzToJ/pfMKfVUxMBcDszjGnnYOY3ZpHhzHybN6txjxT68j2XHSkkVQ5CjgiD8EhE+pRcyIXEM8nEPFvEqg32ICbri8/g+/K+qOm2f8HYIvNLtGprr56rR7WEkG9E+do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ey6qfXln; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ey6qfXln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748499938; x=1780035938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aar1zJELZDYeBucUXJtNs6otcc48zCELE3fGNA/GRXA=;
  b=ey6qfXlnZJOLBS/cfkW7EYB8IwqMnlnG/vz5D9vVgNOaDEn2FLlU0fnK
   8eFoiUcRPUX9NvMnp9ACwfIsAPRmdLjklDwW0py7L98B+TuqvFSCuUxQL
   waWM6JmC3NhOFRrP9kp0xiH/RkTG25iX5w5CqaybS/FcuPu+Zb7cmsQnu
   su2/F2/NXCGGrv7KVbFYK5ObbAO7rNTufGFNCndR1Wf0yjBMYmRQ//Lto
   yAsURIYgeXHei2uxcmKWH5BnJr7583f3mCfxQ/B9QM7td6Ary30WKUlUe
   C4ZVt5xyLWliIr6S8e6vn+Vyn1yfzeI9FEVMFda6ASjztuJ8wAaicD8T+
   w==;
X-CSE-ConnectionGUID: lJVnw95RR3imQKIR/nrhoA==
X-CSE-MsgGUID: 4N1inHfkQLKs3sM2OzypZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="68097679"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="68097679"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 23:25:38 -0700
X-CSE-ConnectionGUID: 3wH8P4vuRAulzWl7aGpP0A==
X-CSE-MsgGUID: Pxmtn1qqRDy9v110C4Lh0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="143453840"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2025 23:25:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKWhq-000WOC-1g;
	Thu, 29 May 2025 06:25:34 +0000
Date: Thu, 29 May 2025 14:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2331/2331]
 arch/arm64/kvm/hisilicon/hisi_virt.h:116:13: warning:
 'hisi_ipiv_enable_per_vm' defined but not used
Message-ID: <202505291449.qcY77e1i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66b0cef2a959be1562a528e3d8cc260dc3803e61
commit: cd77c03a1ee1bcae1ffbde74afcc32a0a1bb0273 [2331/2331] KVM: arm64: Implement PV_SGI related calls
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250529/202505291449.qcY77e1i-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291449.qcY77e1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291449.qcY77e1i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/arm.c:53:
>> arch/arm64/kvm/hisilicon/hisi_virt.h:116:13: warning: 'hisi_ipiv_enable_per_vm' defined but not used [-Wunused-function]
     116 | static void hisi_ipiv_enable_per_vm(struct kvm_vcpu *vcpu) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hisilicon/hisi_virt.h:112:13: warning: 'hisi_ipiv_supported_per_vm' defined but not used [-Wunused-function]
     112 | static bool hisi_ipiv_supported_per_vm(struct kvm_vcpu *vcpu)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hisi_ipiv_enable_per_vm +116 arch/arm64/kvm/hisilicon/hisi_virt.h

    89	
    90	int kvm_sched_affinity_vcpu_init(struct kvm_vcpu *vcpu);
    91	void kvm_sched_affinity_vcpu_destroy(struct kvm_vcpu *vcpu);
    92	int kvm_sched_affinity_vm_init(struct kvm *kvm);
    93	void kvm_sched_affinity_vm_destroy(struct kvm *kvm);
    94	void kvm_tlbi_dvmbm_vcpu_load(struct kvm_vcpu *vcpu);
    95	void kvm_tlbi_dvmbm_vcpu_put(struct kvm_vcpu *vcpu);
    96	void kvm_hisi_reload_lsudvmbm(struct kvm *kvm);
    97	#else
    98	static inline void probe_hisi_cpu_type(void) {}
    99	static inline bool hisi_ncsnp_supported(void)
   100	{
   101		return false;
   102	}
   103	static inline bool hisi_dvmbm_supported(void)
   104	{
   105		return false;
   106	}
   107	#ifdef CONFIG_ARM64_HISI_IPIV
   108	static inline bool hisi_ipiv_supported(void)
   109	{
   110		return false;
   111	}
 > 112	static bool hisi_ipiv_supported_per_vm(struct kvm_vcpu *vcpu)
   113	{
   114		return false;
   115	}
 > 116	static void hisi_ipiv_enable_per_vm(struct kvm_vcpu *vcpu) {}
   117	static inline void ipiv_gicd_init(void) {}
   118	#endif /* CONFIG_ARM64_HISI_IPIV */
   119	static inline void kvm_get_pg_cfg(void) {}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
