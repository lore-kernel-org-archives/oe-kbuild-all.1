Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFEF19CD06
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348050; cv=none; b=herhOWRmvly2gI/j8vE0B62aKxlekfdAA0/IRaH2y0+/Fz18O4iAyXUUO4sdnHbBsGFvYF0YmRhWBkE8aHv2YqDvVTkIBj8CbS21wwXWARoVNdi6QrjhjvExZX2pP2MsoVz7owb4X2s0E0jt++gFLXvgA9KGZo2e0IOE71SuDg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348050; c=relaxed/simple;
	bh=WifboPLjXbhEsmFdsS5tbwUU0VJbyvvIUECbov48NIs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jg7rsg47ga//Yx8BcTV2iMNekPI/zRida1uPQOU+EJ05Qdf1ZyTue9rSwmWbK8wodtm4RHCUMNaDEdkVorY43KK85T2ka90b4gU0PqHpXyUNuoA87x+GLdY5o2QjVlQw5pDGIWXtHy1CFyJqzFsBpZTZg8W8qDxUidypk/PBPGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHR09CPC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHR09CPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769348050; x=1800884050;
  h=date:from:to:cc:subject:message-id;
  bh=WifboPLjXbhEsmFdsS5tbwUU0VJbyvvIUECbov48NIs=;
  b=LHR09CPCEzBS25GzFWTNgP8vxYyurKalasbecXza3Z2UlFgZC+cQ8eO1
   KwoPKrlHzqYHXiQHHvDI3xioHyU2KZ7Foj5XUKJVi+TvjuuFgD5/laGn0
   79HNiilmPqLI1pNOWEdblP1+XooevRKDWrr8Wdj1P1d9hWoGXmCpE4ks7
   a7eOYmZ79lCvZHtGWHg7h7fI2i3QQTluQrc/WKXuXu+pIVc0XZHtVogb1
   aS8Fau1KOoGSGB04ismYijnlFdGCghsdVkqXSB3sBmjN8GwHpBWV/rkoU
   VwrdqIWljpne9PtyIL6JmWz19ZKqzJypmIkGawoqiYp4w6jw6B/FCKdmk
   g==;
X-CSE-ConnectionGUID: vMthWcG9RGe3iqI7pHqhBg==
X-CSE-MsgGUID: owufJEjnRW++WnzqFwlLbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70451404"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70451404"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 05:34:07 -0800
X-CSE-ConnectionGUID: h3prWw46SBekWdEuscGzJg==
X-CSE-MsgGUID: rkaXAi8XSZaoJoeji7JvZA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jan 2026 05:34:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk0Fe-00000000W2I-2tqD;
	Sun, 25 Jan 2026 13:34:02 +0000
Date: Sun, 25 Jan 2026 21:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vmxon_sucks 17/18]
 arch/x86/kvm/vmx/main.c:1077:1: warning: label 'err_tdx_bringup' defined but
 not used
Message-ID: <202601252103.rucmNkfl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/vmxon_sucks
head:   812d315824cbec66990b83771c86b0ef6f6fc0e6
commit: 7fcfe117b421e1077f02e13d0cd5e8d1457f4b15 [17/18] KVM: TDX: Fold tdx_bringup() into tdx_hardware_setup()
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260125/202601252103.rucmNkfl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601252103.rucmNkfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601252103.rucmNkfl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/vmx/main.c: In function 'vt_init':
>> arch/x86/kvm/vmx/main.c:1077:1: warning: label 'err_tdx_bringup' defined but not used [-Wunused-label]
    1077 | err_tdx_bringup:
         | ^~~~~~~~~~~~~~~


vim +/err_tdx_bringup +1077 arch/x86/kvm/vmx/main.c

d6bee7813752b3 Kai Huang      2025-01-22  1040  
d6bee7813752b3 Kai Huang      2025-01-22  1041  static int __init vt_init(void)
d6bee7813752b3 Kai Huang      2025-01-22  1042  {
09b3d3c17f365f Isaku Yamahata 2024-10-30  1043  	unsigned vcpu_size, vcpu_align;
d6bee7813752b3 Kai Huang      2025-01-22  1044  	int r;
d6bee7813752b3 Kai Huang      2025-01-22  1045  
d6bee7813752b3 Kai Huang      2025-01-22  1046  	r = vmx_init();
d6bee7813752b3 Kai Huang      2025-01-22  1047  	if (r)
d6bee7813752b3 Kai Huang      2025-01-22  1048  		return r;
d6bee7813752b3 Kai Huang      2025-01-22  1049  
09b3d3c17f365f Isaku Yamahata 2024-10-30  1050  	/*
09b3d3c17f365f Isaku Yamahata 2024-10-30  1051  	 * TDX and VMX have different vCPU structures.  Calculate the
09b3d3c17f365f Isaku Yamahata 2024-10-30  1052  	 * maximum size/align so that kvm_init() can use the larger
09b3d3c17f365f Isaku Yamahata 2024-10-30  1053  	 * values to create the kmem_vcpu_cache.
09b3d3c17f365f Isaku Yamahata 2024-10-30  1054  	 */
09b3d3c17f365f Isaku Yamahata 2024-10-30  1055  	vcpu_size = sizeof(struct vcpu_vmx);
09b3d3c17f365f Isaku Yamahata 2024-10-30  1056  	vcpu_align = __alignof__(struct vcpu_vmx);
09b3d3c17f365f Isaku Yamahata 2024-10-30  1057  	if (enable_tdx) {
09b3d3c17f365f Isaku Yamahata 2024-10-30  1058  		vcpu_size = max_t(unsigned, vcpu_size,
09b3d3c17f365f Isaku Yamahata 2024-10-30  1059  				sizeof(struct vcpu_tdx));
09b3d3c17f365f Isaku Yamahata 2024-10-30  1060  		vcpu_align = max_t(unsigned, vcpu_align,
09b3d3c17f365f Isaku Yamahata 2024-10-30  1061  				__alignof__(struct vcpu_tdx));
161d34609f9b31 Isaku Yamahata 2024-12-10  1062  		kvm_caps.supported_vm_types |= BIT(KVM_X86_TDX_VM);
09b3d3c17f365f Isaku Yamahata 2024-10-30  1063  	}
09b3d3c17f365f Isaku Yamahata 2024-10-30  1064  
d6bee7813752b3 Kai Huang      2025-01-22  1065  	/*
d6bee7813752b3 Kai Huang      2025-01-22  1066  	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
d6bee7813752b3 Kai Huang      2025-01-22  1067  	 * exposed to userspace!
d6bee7813752b3 Kai Huang      2025-01-22  1068  	 */
09b3d3c17f365f Isaku Yamahata 2024-10-30  1069  	r = kvm_init(vcpu_size, vcpu_align, THIS_MODULE);
d6bee7813752b3 Kai Huang      2025-01-22  1070  	if (r)
d6bee7813752b3 Kai Huang      2025-01-22  1071  		goto err_kvm_init;
d6bee7813752b3 Kai Huang      2025-01-22  1072  
d6bee7813752b3 Kai Huang      2025-01-22  1073  	return 0;
d6bee7813752b3 Kai Huang      2025-01-22  1074  
d6bee7813752b3 Kai Huang      2025-01-22  1075  err_kvm_init:
fcdbdf63431c9f Kai Huang      2024-11-15  1076  	tdx_cleanup();
fcdbdf63431c9f Kai Huang      2024-11-15 @1077  err_tdx_bringup:

:::::: The code at line 1077 was first introduced by commit
:::::: fcdbdf63431c9faf639bffc957ea2ce9b545432e KVM: VMX: Initialize TDX during KVM module load

:::::: TO: Kai Huang <kai.huang@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
