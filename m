Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC45212564
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 01:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766452008; cv=none; b=IB7Z2kI8lZQnt9eex5mZYL3Kp0zBYu0PvKIczzvv8y2laN/8yHmb76VaX9OTArbs2ffK23iJlae5mrmJRBzVkDJXreoUem8aey6Z1p93tZmSRMOTpvKb4flGyD8mZBPj+/rOnd8ZwQbBb5PGMrGm6qr6eneVnV/B01y31W5lJxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766452008; c=relaxed/simple;
	bh=oBPHrdewzD6JWRSIqoxnYQRvkj3pCTL5/t18ZOQrYi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sfY7ZaIAISXa/sehhsPa9en8UHSDdgAohaCKeeLx0XFL6/Ur9GN9+4FmkmEAjKlxVd6UjO5HYG74lo3pYdgv/oiw1Pyab/WXFsW368nsuLtqDMgAptcA4tIhVVZSxneGhl0cBdKp7/uifpTEffflqHHshTLSRNg9OOqG0Sgiau4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgXAIPq3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgXAIPq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766452007; x=1797988007;
  h=date:from:to:cc:subject:message-id;
  bh=oBPHrdewzD6JWRSIqoxnYQRvkj3pCTL5/t18ZOQrYi8=;
  b=RgXAIPq3eGdF04oIGciRDPAZFiB+dBzSml5ywfyBh30Guu6VgbayyLwq
   R+3xQImKqHDoTdFzD26tflOVAVfY14L5YqlDxNZxiI3WtAt8duVsFNOA9
   EwpXbkpNVoFcogmP+08Rx51i+tbZSj0rAyu7bVuZDSp45TrJw+S2ImYrg
   4kVtsTK2Imun1TTwtF8c6SR1PXUEKAHPhPW+BUjNSIDAkelL+ByblPaa2
   0X0v72woC12jmD2+vWp+LO0OV0CVKLm57EXEYF2rmvmAMkakPglLdoSdf
   d1yntwD+DwCyDq7tzv670xBNazkBxm/wRrMGErBGuudxi0BGE6mN/NOXL
   A==;
X-CSE-ConnectionGUID: cqDloBmaRdOZ4O9RwTsABw==
X-CSE-MsgGUID: 0uXFaHQdSNqDpnJCkpKQow==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72156399"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="72156399"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 17:06:47 -0800
X-CSE-ConnectionGUID: Ng8t7FP0TQy3/BzefMr6Tw==
X-CSE-MsgGUID: Aomw2TKkTOqRl7trnIVQTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="237061240"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 17:06:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXqrK-000000001HL-4BG7;
	Tue, 23 Dec 2025 01:06:42 +0000
Date: Tue, 23 Dec 2025 09:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 15/15]
 arch/x86/include/asm/kvm_pkvm.h:280:37: error: field 'iommu_map_param' has
 incomplete type
Message-ID: <202512230817.SqRIugmm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   4e640d57b9513962095028e1186dddf47814e50f
commit: e3aff207324c14597db951ea892402226359276b [15/15] ANDROID: pkvm: x86: Hypercalls for domain pagetable management
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20251223/202512230817.SqRIugmm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230817.SqRIugmm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230817.SqRIugmm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
   arch/x86/include/asm/kvm_pkvm.h:275:38: error: field 'lm_context_param' has incomplete type
     275 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:276:45: error: field 'clear_translation_param' has incomplete type
     276 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:277:38: error: field 'sm_context_param' has incomplete type
     277 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:278:39: error: field 'pasid_table_param' has incomplete type
     278 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:279:34: error: field 'domain_param' has incomplete type
     279 |         struct pkvm_domain_param domain_param;
         |                                  ^~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:280:37: error: field 'iommu_map_param' has incomplete type
     280 |         struct pkvm_iommu_map_param iommu_map_param;
         |                                     ^~~~~~~~~~~~~~~


vim +/iommu_map_param +280 arch/x86/include/asm/kvm_pkvm.h

   267	
   268	union pkvm_pv_param {
   269		struct kvm_segment seg;
   270		struct msr_data msr;
   271		struct desc_ptr desc;
   272		struct eoi_exitmap eoi_exit_bitmap;
   273	
   274		/* IOMMU hypercall params */
   275		struct pkvm_lm_context_param lm_context_param;
   276		struct pkvm_clear_translation_param clear_translation_param;
   277		struct pkvm_sm_context_param sm_context_param;
   278		struct pkvm_pasid_table_param pasid_table_param;
   279		struct pkvm_domain_param domain_param;
 > 280		struct pkvm_iommu_map_param iommu_map_param;
   281	} __aligned(PAGE_SIZE);
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
