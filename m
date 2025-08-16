Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698D2288D5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755350446; cv=none; b=HRaNr/0nhlXSq+++cKT1iVQf7LXMUWmV3x5VSBQntrIsBGGlC6rWfL7zmEVTO0Mysvt2kY30uQ2Uco8zNrRDgmNsHBrN0rB7th/qQLHO9APy5icx3xVGERpE1fZkVnggykZ1EALaBYhKlj1AnnKGO5x0nzv0s7mfQSn98se+A68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755350446; c=relaxed/simple;
	bh=2agxR6DCW2CyQ3F7L/wa8H5zzkZTZQSaUSx/qGznufw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jelrn5uys3e1HZwO0AaonHXdxzC3BFY+r6QbqUiAMgxRc5vM+KqfXjNN7DiAlw84+i6a5Ots5djhTmBcs5zkvnIcLjp/ynJn0XW66CKscUMVXFhxJSpDXq7ZEWtv1TIwTbSYXxvTZLmrlU3btA/Mz67iog02SGD+D6QZh9gj8Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYLHwcVd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYLHwcVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755350444; x=1786886444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2agxR6DCW2CyQ3F7L/wa8H5zzkZTZQSaUSx/qGznufw=;
  b=NYLHwcVdC126AL3Rhu0njLnFg62pZU4PFfS3AfTK7N5bEl+mrxkvjVQs
   FSf34Oa+/cZmhz1wh6MUbuwsO4mFutwKIQDuGo/XDhLqZlIKureeyYDoh
   uEH8jyf+EQC5RywXWa5d5DWel7emf6SOPMM81P+DY2BrZ7XQYdH26NoaV
   UH4Bi74rx6knneaLqC20igBwAZWDZQctVLdtyu5h1SVtYFAhXsCoKRoMt
   getrDrkciTq7eXTUhvlBYTcMrsRZLlBCKqPLhlJzuUoN7TCvcZNf9C/4z
   DB12W6/UXGbYoFTBlYVNeSmhOyXBbBuFqn+cExcOSkzq43KaumDaDeBdq
   g==;
X-CSE-ConnectionGUID: R1U4g6lkQhqKqIKcL9VO7w==
X-CSE-MsgGUID: 6PADrkxbTHOWWkalFgQ/yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57716785"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57716785"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 06:20:44 -0700
X-CSE-ConnectionGUID: YzZTL3amRKKGijcNkJToKg==
X-CSE-MsgGUID: lS+CO2n7RpmkxC3sn0DW3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167593360"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2025 06:20:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unGps-000Cse-1x;
	Sat, 16 Aug 2025 13:20:40 +0000
Date: Sat, 16 Aug 2025 21:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:arm/kvm_page_fault 3/8] arch/arm64/kvm/mmu.c:1839:17:
 error: 'ret' undeclared; did you mean 'net'?
Message-ID: <202508162140.E13ldE0A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux arm/kvm_page_fault
head:   2985b2d78ea170d1acbd1d34f265422fe65b6d54
commit: e7b52ab1cd1779bfd89fe6ce43dedcfdf6b2fcc4 [3/8] KVM: arm64: Move SRCU-protected region of kvm_handle_guest_abort() to helper
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250816/202508162140.E13ldE0A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508162140.E13ldE0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508162140.E13ldE0A-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/mmu.c: In function '__kvm_handle_guest_abort':
>> arch/arm64/kvm/mmu.c:1839:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
    1839 |                 ret = kvm_walk_nested_s2(vcpu, fault_ipa, &nested_trans);
         |                 ^~~
         |                 net
   arch/arm64/kvm/mmu.c:1839:17: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/mmu.c: In function 'kvm_handle_guest_abort':
   arch/arm64/kvm/mmu.c:1989:1: warning: label 'out_unlock' defined but not used [-Wunused-label]
    1989 | out_unlock:
         | ^~~~~~~~~~


vim +1839 arch/arm64/kvm/mmu.c

aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier        2015-03-12  1813  
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1814  static int __kvm_handle_guest_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1815  				    unsigned long esr)
342cd0ab0e6ca3f arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1816  {
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1817  	struct kvm_s2_trans nested_trans, *nested = NULL;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1818  	struct kvm_memory_slot *memslot;
ed866b1b51cd009 arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1819  	bool write_fault, writable;
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1820  	unsigned long hva;
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1821  	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1822  	gfn_t gfn;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1823  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1824  	/*
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1825  	 * We may have faulted on a shadow stage 2 page table if we are
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1826  	 * running a nested guest.  In this case, we have to resolve the L2
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1827  	 * IPA to the L1 IPA first, before knowing what kind of memory should
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1828  	 * back the L1 IPA.
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1829  	 *
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1830  	 * If the shadow stage 2 page table walk faults, then we simply inject
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1831  	 * this to the guest and carry on.
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1832  	 *
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1833  	 * If there are no shadow S2 PTs because S2 is disabled, there is
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1834  	 * nothing to walk and we treat it as a 1:1 before going through the
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1835  	 * canonical translation.
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1836  	 */
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1837  	if (kvm_is_nested_s2_mmu(vcpu->kvm,vcpu->arch.hw_mmu) &&
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1838  	    vcpu->arch.hw_mmu->nested_stage2_enabled) {
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14 @1839  		ret = kvm_walk_nested_s2(vcpu, fault_ipa, &nested_trans);
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1840  		if (ret) {
e2a301cc693b7c3 arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1841  			kvm_inject_s2_fault(vcpu, kvm_s2_trans_esr(&nested_trans));
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1842  			return ret;
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1843  		}
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1844  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1845  		ret = kvm_s2_handle_perm_fault(vcpu, &nested_trans);
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1846  		if (ret) {
e2a301cc693b7c3 arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1847  			kvm_inject_s2_fault(vcpu, kvm_s2_trans_esr(&nested_trans));
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1848  			return ret;
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1849  		}
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1850  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1851  		ipa = kvm_s2_trans_output(&nested_trans);
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1852  		nested = &nested_trans;
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1853  	}
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1854  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1855  	gfn = ipa >> PAGE_SHIFT;
98047888bb9fd57 arch/arm/kvm/mmu.c   Christoffer Dall    2014-08-19  1856  	memslot = gfn_to_memslot(vcpu->kvm, gfn);
98047888bb9fd57 arch/arm/kvm/mmu.c   Christoffer Dall    2014-08-19  1857  	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
a7d079cea2dffb1 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-09  1858  	write_fault = kvm_is_write_fault(vcpu);
98047888bb9fd57 arch/arm/kvm/mmu.c   Christoffer Dall    2014-08-19  1859  	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
022c8328dc80212 arch/arm64/kvm/mmu.c Will Deacon         2020-07-29  1860  		/*
022c8328dc80212 arch/arm64/kvm/mmu.c Will Deacon         2020-07-29  1861  		 * The guest has put either its instructions or its page-tables
022c8328dc80212 arch/arm64/kvm/mmu.c Will Deacon         2020-07-29  1862  		 * somewhere it shouldn't have. Userspace won't be able to do
022c8328dc80212 arch/arm64/kvm/mmu.c Will Deacon         2020-07-29  1863  		 * anything about this (there's no syndrome for a start), so
022c8328dc80212 arch/arm64/kvm/mmu.c Will Deacon         2020-07-29  1864  		 * re-inject the abort back into the guest.
022c8328dc80212 arch/arm64/kvm/mmu.c Will Deacon         2020-07-29  1865  		 */
ed866b1b51cd009 arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1866  		if (kvm_vcpu_trap_is_iabt(vcpu)) {
6d674e28f642e3f virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1867  			ret = -ENOEXEC;
6d674e28f642e3f virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1868  			goto out;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1869  		}
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1870  
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1871  		if (kvm_vcpu_abt_iss1tw(vcpu))
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1872  			return kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
022c8328dc80212 arch/arm64/kvm/mmu.c Will Deacon         2020-07-29  1873  
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1874  		/*
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1875  		 * Check for a cache maintenance operation. Since we
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1876  		 * ended-up here, we know it is outside of any memory
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1877  		 * slot. But we can't find out if that is for a device,
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1878  		 * or if the guest is just being stupid. The only thing
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1879  		 * we know for sure is that this range cannot be cached.
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1880  		 *
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1881  		 * So let's assume that the guest is just being
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1882  		 * cautious, and skip the instruction.
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1883  		 */
54dc0d2404dd7aa arch/arm64/kvm/mmu.c Will Deacon         2020-07-29  1884  		if (kvm_is_error_hva(hva) && kvm_vcpu_dabt_is_cm(vcpu)) {
cdb5e02ed133731 arch/arm64/kvm/mmu.c Marc Zyngier        2020-10-14  1885  			kvm_incr_pc(vcpu);
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1886  			return 1;
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1887  		}
57c841f131ef295 arch/arm/kvm/mmu.c   Marc Zyngier        2016-01-29  1888  
cfe3950c2a19c1e arch/arm/kvm/mmu.c   Marc Zyngier        2012-12-12  1889  		/*
cfe3950c2a19c1e arch/arm/kvm/mmu.c   Marc Zyngier        2012-12-12  1890  		 * The IPA is reported as [MAX:12], so we need to
cfe3950c2a19c1e arch/arm/kvm/mmu.c   Marc Zyngier        2012-12-12  1891  		 * complement it with the bottom 12 bits from the
cfe3950c2a19c1e arch/arm/kvm/mmu.c   Marc Zyngier        2012-12-12  1892  		 * faulting VA. This is always 12 bits, irrespective
cfe3950c2a19c1e arch/arm/kvm/mmu.c   Marc Zyngier        2012-12-12  1893  		 * of the page size.
cfe3950c2a19c1e arch/arm/kvm/mmu.c   Marc Zyngier        2012-12-12  1894  		 */
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1895  		ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1896  		return io_mem_abort(vcpu, ipa);
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1897  	}
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1898  
c3058d5da222262 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  1899  	/* Userspace should not be able to register out-of-bounds IPAs */
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1900  	VM_BUG_ON(ipa >= kvm_phys_size(vcpu->arch.hw_mmu));
c3058d5da222262 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  1901  
11e5ea5242e38d4 arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1902  	if (esr_fsc_is_access_flag_fault(esr)) {
aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier        2015-03-12  1903  		handle_access_fault(vcpu, fault_ipa);
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1904  		return 1;
aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier        2015-03-12  1905  	}
aeda9130c38e2e0 arch/arm/kvm/mmu.c   Marc Zyngier        2015-03-12  1906  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1907  	ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
11e5ea5242e38d4 arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1908  			     esr_fsc_is_permission_fault(esr));
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1909  	if (ret == 0)
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1910  		ret = 1;
6d674e28f642e3f virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1911  out:
9aba641b9ec2a9f arch/arm64/kvm/mmu.c Oliver Upton        2025-07-08  1912  	if (ret == -ENOEXEC)
9aba641b9ec2a9f arch/arm64/kvm/mmu.c Oliver Upton        2025-07-08  1913  		ret = kvm_inject_sea_iabt(vcpu, kvm_vcpu_get_hfar(vcpu));
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1914  	return ret;
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1915  }
e7b52ab1cd1779b arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1916  

:::::: The code at line 1839 was first introduced by commit
:::::: fd276e71d1e7b7f729050f2da235a1e6fe4f328a KVM: arm64: nv: Handle shadow stage 2 page faults

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
