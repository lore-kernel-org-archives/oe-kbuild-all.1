Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0531E878
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719588469; cv=none; b=owc3HBO+3asky91CRJgJLU+HaEilg7ScoZ/hntnRsccPltuRti8seZRslAi4PejhrtgDk/BI9moZf7HVHPOe4B8heIry11HkVBaTDieym22rNGxkDXhkHuDowYEfXb3qVHj8fNz4Xk6E2lnMU8/RU7R68IxuAJthaNs9afV8EMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719588469; c=relaxed/simple;
	bh=QDH393t+OG/KCaL94jo87H0R8AJszvySog9HC+J/Tm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZF463Y1TU0SWQ+z2RzHVlZh4l43qzMwYVh+fXdo3LosAK7xAqJo7pkZkJLKpl80uf7wz/d/OQyEWGi5ofaarnLxIpOGVhuNggb+ZfLvnbQmv5ZgWthY1YANoO9s+kbfv6XkTi6npXxOOuVBju3+H8Q02rbQMHSG4wWETbblbfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/8eiMav; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/8eiMav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719588468; x=1751124468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QDH393t+OG/KCaL94jo87H0R8AJszvySog9HC+J/Tm4=;
  b=A/8eiMavGElYpHO1bS2Y0LlVyB+z6u0I8KdTdTy7OWsF4mqlHt/5iBVB
   9tpHLBTqo3jmkiw0HdG+RtnEZ6M2ZrE2SlFGEq2cThrU/aWLcBuio/agM
   JmwftkSjkIzwNO5oilg0+BQXPwvtdExf+BItP5DsqBnJAWH0N/igdDvET
   jsZYhiR8TQFozPlaz8wIFyQIYQ19lFRCo4tHMAhkit45jMPmekr6oAGA1
   hG6C29Hn2ZaE6MnvKBc6LNElRrM99CWf8ez0tWN1z28kjmdGSxeNHgt1e
   95+Sg2KLOj5C8gLhUEJiub1/XZ+lAHOzEfeFlZl/m81dixzES/6BtbpjF
   A==;
X-CSE-ConnectionGUID: 4bEWYj4JTca4WKk+dnW+tg==
X-CSE-MsgGUID: NMervgAIQHiFtnQ0YMJcbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16910379"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="16910379"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:27:47 -0700
X-CSE-ConnectionGUID: pO34OVB6S1i1RcwgUHpGsw==
X-CSE-MsgGUID: OcdzwoIRTnKxoz6VK/KB9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="49949971"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jun 2024 08:27:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNDVo-000HEc-06;
	Fri, 28 Jun 2024 15:27:44 +0000
Date: Fri, 28 Jun 2024 23:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_follow_pfn 90/92] arch/arm64/kvm/mmu.c:1600:19:
 warning: variable 'pte' set but not used
Message-ID: <202406282339.KZLeWCvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_follow_pfn
head:   ddc17683711a347aaff45e1e0b178742df18ff4d
commit: 25912b6f9dc541573e17be931a3ca554d2cee38e [90/92] KVM: arm64: Don't mark "struct page" accessed when making SPTE young
config: arm64-randconfig-001-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282339.KZLeWCvB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282339.KZLeWCvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282339.KZLeWCvB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/mmu.c: In function 'user_mem_abort':
   arch/arm64/kvm/mmu.c:1492:45: error: 'page' undeclared (first use in this function)
    1492 |                                 &writable, &page);
         |                                             ^~~~
   arch/arm64/kvm/mmu.c:1492:45: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/mmu.c:1587:40: warning: passing argument 2 of 'kvm_release_faultin_page' makes pointer from integer without a cast [-Wint-conversion]
    1587 |         kvm_release_faultin_page(page, !!ret, writable);
         |                                        ^~~~~
         |                                        |
         |                                        int
   In file included from arch/arm64/kvm/mmu.c:8:
   include/linux/kvm_host.h:1224:75: note: expected 'struct page *' but argument is of type 'int'
    1224 | static inline void kvm_release_faultin_page(struct kvm *kvm, struct page *page,
         |                                                              ~~~~~~~~~~~~~^~~~
   arch/arm64/kvm/mmu.c:1587:9: error: too few arguments to function 'kvm_release_faultin_page'
    1587 |         kvm_release_faultin_page(page, !!ret, writable);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1224:20: note: declared here
    1224 | static inline void kvm_release_faultin_page(struct kvm *kvm, struct page *page,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/mmu.c: In function 'handle_access_fault':
>> arch/arm64/kvm/mmu.c:1600:19: warning: variable 'pte' set but not used [-Wunused-but-set-variable]
    1600 |         kvm_pte_t pte;
         |                   ^~~


vim +/pte +1600 arch/arm64/kvm/mmu.c

94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1596  
ee8efad7994ce20 arch/arm64/kvm/mmu.c Will Deacon      2020-09-11  1597  /* Resolve the access fault by making the page young again. */
aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier     2015-03-12  1598  static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier     2015-03-12  1599  {
9a7ad19ac804df5 arch/arm64/kvm/mmu.c Oliver Upton     2022-12-02 @1600  	kvm_pte_t pte;
ee8efad7994ce20 arch/arm64/kvm/mmu.c Will Deacon      2020-09-11  1601  	struct kvm_s2_mmu *mmu;
aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier     2015-03-12  1602  
aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier     2015-03-12  1603  	trace_kvm_access_fault(fault_ipa);
aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier     2015-03-12  1604  
fc61f554e6947ed arch/arm64/kvm/mmu.c Oliver Upton     2022-12-02  1605  	read_lock(&vcpu->kvm->mmu_lock);
ee8efad7994ce20 arch/arm64/kvm/mmu.c Will Deacon      2020-09-11  1606  	mmu = vcpu->arch.hw_mmu;
9a7ad19ac804df5 arch/arm64/kvm/mmu.c Oliver Upton     2022-12-02  1607  	pte = kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
fc61f554e6947ed arch/arm64/kvm/mmu.c Oliver Upton     2022-12-02  1608  	read_unlock(&vcpu->kvm->mmu_lock);
aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier     2015-03-12  1609  }
aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier     2015-03-12  1610  

:::::: The code at line 1600 was first introduced by commit
:::::: 9a7ad19ac804df56d3a150bcbe8f467a63821625 KVM: arm64: Use KVM's pte type/helpers in handle_access_fault()

:::::: TO: Oliver Upton <oliver.upton@linux.dev>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
