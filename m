Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0273364022
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 22:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781303896; cv=none; b=YueeBRZBnDcjxk/LY6hfSg752m/DY9VSMwy3eq28Oz68EUPVE+xVM1vgYhqu2PuAxAbh1b0YXd3/ZK8yiKqp0FV91WVqoRfXK5rLa6TaNS57ZDynlOdQEZ6f4aBZQq/cVwmJViUUy5bckJfvD9uRR/mWYH1PAZdRrvQzP8tlhb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781303896; c=relaxed/simple;
	bh=Ga1jGZPeWDZ/i+PdPNaMEOlitlBWgDeNKUm6L/GK9oc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QqD7dof3b/GvCEDfcgCLtX4TAgw85uU0LQRz1oOmH/PJw8BKETHomrvHKxUWPp1K9suiWNug2WxIuMiGx6Z+EUQGFhq9hRk+w0oLY64rHOBvaPePcbmNhDP/iymXFBuXAwauGBlri6C5p9YrWj54kAh4lXXRHzG0YF6EkhNoVig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PofG6BC2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PofG6BC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781303894; x=1812839894;
  h=date:from:to:cc:subject:message-id;
  bh=Ga1jGZPeWDZ/i+PdPNaMEOlitlBWgDeNKUm6L/GK9oc=;
  b=PofG6BC2W+vqZXhUUiU1eHBozjyluOIfwh/FTqV9AtmOSA1mt64aFVEf
   rOTk2nG6lPRWFfI3axFo+Thr29XqmnIjQN07N9Il3aVQyI1WZMQL8rJqx
   zByHG29PzR/4cHBy/JDVxkc7v61n8qrREDHetyF7G5Tlipfol1xOhAntC
   RyYAZEHHJMeoeb5oQCWBLIwvpQWTyVc+O4OAxWJW4+JfL9i00dPLkuPni
   RC/rz7wi8vX6g2EAa+WzXVwfc6vm8sGmX/xObOlu/8bR1dQb2JtxfVAqy
   XCyeGN4oEbmY9ABhPPF2AA7JyEIGl9L0Dq5P2G5oX3Gf3E7Ma796GzrQ1
   A==;
X-CSE-ConnectionGUID: 2TlmaDGURT+wokHzryshdQ==
X-CSE-MsgGUID: OLNk56eQQjKytoZC0i93ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82185594"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="82185594"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 15:38:13 -0700
X-CSE-ConnectionGUID: PCxY8RasTCOefdGFZ83PBw==
X-CSE-MsgGUID: Mhnmvf9/ThuWTvv8EjYSlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="252033587"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2026 15:38:12 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYAVu-000000004LZ-01PA;
	Fri, 12 Jun 2026 22:38:10 +0000
Date: Sat, 13 Jun 2026 00:37:24 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/no_unsync_for_nested_tdp 28/28]
 arch/x86/kvm/mmu/mmu.c:6743:1: warning: control reaches end of non-void
 function
Message-ID: <202606130016.G5neHfNV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/no_unsync_for_nested_tdp
head:   cf61c0380b4809886b14ce509549f68bf59338d3
commit: cf61c0380b4809886b14ce509549f68bf59338d3 [28/28] KVM: x86/mmu: Add Kconfig option to disable legacy (non-TDP) shadow paging
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260613/202606130016.G5neHfNV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130016.G5neHfNV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130016.G5neHfNV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/mmu/mmu.c: In function 'kvm_mmu_find_shadow_page':
   arch/x86/kvm/mmu/mmu.c:2270:13: warning: unused variable 'ret' [-Wunused-variable]
    2270 |         int ret;
         |             ^~~
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_configure_mmu':
>> arch/x86/kvm/mmu/mmu.c:6743:1: warning: control reaches end of non-void function [-Wreturn-type]
    6743 | }
         | ^
   arch/x86/kvm/mmu/mmu.c: At top level:
>> arch/x86/kvm/mmu/mmu.c:5952:13: warning: 'kvm_init_shadow_mmu' defined but not used [-Wunused-function]
    5952 | static void kvm_init_shadow_mmu(struct kvm_vcpu *vcpu,
         |             ^~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/mmu/mmu.c:5295:13: warning: 'sync_mmio_spte' defined but not used [-Wunused-function]
    5295 | static bool sync_mmio_spte(struct kvm_vcpu *vcpu, u64 *sptep, gfn_t gfn,
         |             ^~~~~~~~~~~~~~
>> arch/x86/kvm/mmu/mmu.c:1501:13: warning: 'kvm_vcpu_write_protect_gfn' defined but not used [-Wunused-function]
    1501 | static bool kvm_vcpu_write_protect_gfn(struct kvm_vcpu *vcpu, u64 gfn)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +6743 arch/x86/kvm/mmu/mmu.c

eb4b248e152d3e arch/x86/kvm/mmu.c     Junaid Shahid       2018-06-27  6712  
cf61c0380b4809 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2026-06-12  6713  int kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
746700d21fd523 arch/x86/kvm/mmu/mmu.c Wei Huang           2021-08-18  6714  		      int tdp_max_root_level, int tdp_huge_page_level)
1855267210e1a8 arch/x86/kvm/mmu.c     Joerg Roedel        2008-02-07  6715  {
cf61c0380b4809 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2026-06-12  6716  #ifdef CONFIG_KVM_LEGACY_SHADOW_PAGING
bde7723559586d arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6717  	tdp_enabled = enable_tdp;
cf61c0380b4809 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2026-06-12  6718  #else
cf61c0380b4809 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2026-06-12  6719  	if (!enable_tdp) {
cf61c0380b4809 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2026-06-12  6720  		pr_err("TDP (EPT or NPT) not supported by hardware\n");
cf61c0380b4809 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2026-06-12  6721  		return -EOPNOTSUPP;
cf61c0380b4809 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2026-06-12  6722  	}
cf61c0380b4809 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2026-06-12  6723  #endif
746700d21fd523 arch/x86/kvm/mmu/mmu.c Wei Huang           2021-08-18  6724  	tdp_root_level = tdp_forced_root_level;
83013059bdc548 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-07-15  6725  	max_tdp_level = tdp_max_root_level;
703c335d069344 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6726  
1f98f2bd8ec4df arch/x86/kvm/mmu/mmu.c David Matlack       2022-09-21  6727  #ifdef CONFIG_X86_64
1f98f2bd8ec4df arch/x86/kvm/mmu/mmu.c David Matlack       2022-09-21  6728  	tdp_mmu_enabled = tdp_mmu_allowed && tdp_enabled;
1f98f2bd8ec4df arch/x86/kvm/mmu/mmu.c David Matlack       2022-09-21  6729  #endif
703c335d069344 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6730  	/*
1d92d2e8e70697 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-07-15  6731  	 * max_huge_page_level reflects KVM's MMU capabilities irrespective
703c335d069344 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6732  	 * of kernel support, e.g. KVM may be capable of using 1GB pages when
703c335d069344 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6733  	 * the kernel is not.  But, KVM never creates a page size greater than
703c335d069344 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6734  	 * what is used by the kernel for any given HVA, i.e. the kernel's
703c335d069344 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6735  	 * capabilities are ultimately consulted by kvm_mmu_hugepage_adjust().
703c335d069344 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6736  	 */
703c335d069344 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6737  	if (tdp_enabled)
1d92d2e8e70697 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-07-15  6738  		max_huge_page_level = tdp_huge_page_level;
703c335d069344 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6739  	else if (boot_cpu_has(X86_FEATURE_GBPAGES))
1d92d2e8e70697 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-07-15  6740  		max_huge_page_level = PG_LEVEL_1G;
703c335d069344 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-02  6741  	else
1d92d2e8e70697 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-07-15  6742  		max_huge_page_level = PG_LEVEL_2M;
1855267210e1a8 arch/x86/kvm/mmu.c     Joerg Roedel        2008-02-07 @6743  }
6b36119b94d0b2 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2025-09-18  6744  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_configure_mmu);
85875a133ea3ac arch/x86/kvm/mmu.c     Sean Christopherson 2019-02-05  6745  

:::::: The code at line 6743 was first introduced by commit
:::::: 1855267210e1a8c9d41fe3a3c7a0d42eca5fb7cd KVM: export information about NPT to generic x86 code

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Avi Kivity <avi@qumranet.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
