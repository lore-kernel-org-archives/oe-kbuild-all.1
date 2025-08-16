Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9FE2D7D53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755362457; cv=none; b=gLwaexLDkW51JUB8E/fub72yW3K2P9OMKZGTOJJIQFHCRnlX32Mj/6Zn0X1x0Fl4/itGNXvzpFeJ+/Oij+q5rLdL2fmd7rGty/kAaTJYZbfeoN9boAuHleGg64tbHEnvrv+3RI8rigdffptFc85D624OJctC+OM2NX6FlKGgRyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755362457; c=relaxed/simple;
	bh=zDvD/1ROjUtdCEP3/1Imh2mi6/hLwMuHBRLAJBPTslg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S7HPv0ZBOMX8TdR41F01HFBlauH4KYmvfuKXZC73J9haHJ03RktwIR6LHsZlRN2ZXh2rdCBFPNaT0WoGDCmPPE2WGCwyGFYfzAg+dyhy/PCmyl1EI65S+PcmKdClqHlhEyt0UoN1hXxbzSh0uixaXw2vXTahH7XxwZTX2RoxG8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgdhzY7O; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgdhzY7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755362455; x=1786898455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zDvD/1ROjUtdCEP3/1Imh2mi6/hLwMuHBRLAJBPTslg=;
  b=GgdhzY7OBRgPJqgzQTKsVU5EMhDeexbN2PNMgaG5d6sTuGUXt3snF2DQ
   cX/n0zA46ZR15/ADbxOsfpOYh1ms/+e8m9MmsTcHfXF0EBCUiol7iaXco
   /bssQ5n0Uf5OQNEeuUTb5eah3wpSvN6sBk51agUQ4WvygEFfpzWPvmIb3
   48TXC91wWnNHLNuTejuYK7GaerjsyeVVhJaEcH/Oo00BmeOAKc6iQwLDT
   QDrW3yghQg+1XkMUK3/JN0mAPVSuitwVC0hPWfeqaIEI0RsmVBYPveI2E
   x/8oh/t1PPDimIt0tQYRRNy+/UPzfjKjZa0MJPMQCG3X81mgOB5UHYuAw
   A==;
X-CSE-ConnectionGUID: QPB0FtrKS2KhySCgLkYq7g==
X-CSE-MsgGUID: AbazaI1+RUyoV0a6Ltl8jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="60278593"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="60278593"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 09:40:54 -0700
X-CSE-ConnectionGUID: eckIAQfgTQCOkYSekrPlpQ==
X-CSE-MsgGUID: +RlTW28PQQmVWSo1I9FkfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171361478"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Aug 2025 09:40:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unJxb-000D12-1v;
	Sat, 16 Aug 2025 16:40:51 +0000
Date: Sun, 17 Aug 2025 00:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:arm/kvm_page_fault 8/8] arch/arm64/kvm/mmu.c:1807:63:
 error: implicit declaration of function 'esr_perm_fault_granule'; did you
 mean 'esr_fsc_perm_fault_granule'?
Message-ID: <202508170046.JHpcPfbS-lkp@intel.com>
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
commit: 2985b2d78ea170d1acbd1d34f265422fe65b6d54 [8/8] KVM: arm64: Track perm fault granule in "struct kvm_page_fault"
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250817/202508170046.JHpcPfbS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508170046.JHpcPfbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508170046.JHpcPfbS-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/kvm_host.h:870:9: note: in expansion of macro 'pr_err'
     870 |         pr_err("kvm [%i]: " fmt, task_pid_nr(current), ## __VA_ARGS__)
         |         ^~~~~~
   arch/arm64/kvm/mmu.c:1529:17: note: in expansion of macro 'kvm_err'
    1529 |                 kvm_err("Failed to find VMA for hva 0x%lx\n", fault->hva);
         |                 ^~~~~~~
   arch/arm64/kvm/mmu.c:1542:58: error: 'struct kvm_page_fault' has no member named 'hva'
    1542 |                 vma_shift = get_vma_page_shift(vma, fault->hva);
         |                                                          ^~
   arch/arm64/kvm/mmu.c:1571:18: error: 'struct kvm_page_fault' has no member named 'nested'
    1571 |         if (fault->nested) {
         |                  ^~
   arch/arm64/kvm/mmu.c:1576:17: error: 'ipa' undeclared (first use in this function); did you mean 'ida'?
    1576 |                 ipa = kvm_s2_trans_output(nested);
         |                 ^~~
         |                 ida
   arch/arm64/kvm/mmu.c:1576:43: error: 'nested' undeclared (first use in this function)
    1576 |                 ipa = kvm_s2_trans_output(nested);
         |                                           ^~~~~~
   In file included from <command-line>:
   include/linux/compiler.h:166:45: error: '__UNIQUE_ID_x_969' undeclared (first use in this function); did you mean '__UNIQUE_ID_y_970'?
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:10: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:98:38: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                      ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   arch/arm64/kvm/mmu.c:1583:32: note: in expansion of macro 'min'
    1583 |                 max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
         |                                ^~~
   arch/arm64/kvm/mmu.c:1635:47: error: 'struct kvm_page_fault' has no member named 'hva'
    1635 |                 kvm_send_hwpoison_signal(fault->hva, vma_shift);
         |                                               ^~
   arch/arm64/kvm/mmu.c:1696:18: error: 'struct kvm_page_fault' has no member named 'nested'
    1696 |         if (fault->nested) {
         |                  ^~
   arch/arm64/kvm/mmu.c:1697:56: error: 'struct kvm_page_fault' has no member named 'nested'
    1697 |                 writable &= kvm_s2_trans_writable(fault->nested);
         |                                                        ^~
   arch/arm64/kvm/mmu.c:1698:49: error: 'struct kvm_page_fault' has no member named 'nested'
    1698 |                 if (!kvm_s2_trans_readable(fault->nested))
         |                                                 ^~
   arch/arm64/kvm/mmu.c:1701:54: error: 'struct kvm_page_fault' has no member named 'nested'
    1701 |                 prot |= kvm_encode_nested_level(fault->nested);
         |                                                      ^~
   arch/arm64/kvm/mmu.c:1730:48: error: 'pfn' undeclared (first use in this function)
    1730 |                         sanitise_mte_tags(kvm, pfn, vma_pagesize);
         |                                                ^~~
   arch/arm64/kvm/mmu.c:1749:27: error: 'struct kvm_page_fault' has no member named 'nested'
    1749 |                    (!fault->nested || kvm_s2_trans_executable(fault->nested))) {
         |                           ^~
   arch/arm64/kvm/mmu.c:1749:68: error: 'struct kvm_page_fault' has no member named 'nested'
    1749 |                    (!fault->nested || kvm_s2_trans_executable(fault->nested))) {
         |                                                                    ^~
   arch/arm64/kvm/mmu.c: In function '__kvm_handle_guest_abort':
   arch/arm64/kvm/mmu.c:1801:18: error: 'struct kvm_page_fault' has no member named 'esr'
    1801 |                 .esr = esr,
         |                  ^~~
   arch/arm64/kvm/mmu.c:1802:24: warning: initialized field overwritten [-Woverride-init]
    1802 |                 .ipa = fault_ipa,
         |                        ^~~~~~~~~
   arch/arm64/kvm/mmu.c:1802:24: note: (near initialization for 'fault.ipa')
>> arch/arm64/kvm/mmu.c:1807:63: error: implicit declaration of function 'esr_perm_fault_granule'; did you mean 'esr_fsc_perm_fault_granule'? [-Wimplicit-function-declaration]
    1807 |                 .granule = esr_fsc_is_permission_fault(esr) ? esr_perm_fault_granule(esr) : 0,
         |                                                               ^~~~~~~~~~~~~~~~~~~~~~
         |                                                               esr_fsc_perm_fault_granule
   arch/arm64/kvm/mmu.c:1827:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
    1827 |                 ret = kvm_walk_nested_s2(vcpu, fault_ipa, &nested_trans);
         |                 ^~~
         |                 net
   arch/arm64/kvm/mmu.c:1840:22: error: 'struct kvm_page_fault' has no member named 'nested'
    1840 |                 fault.nested = &nested_trans;
         |                      ^
   arch/arm64/kvm/mmu.c:1844:15: error: 'struct kvm_page_fault' has no member named 'memslot'; did you mean 'slot'?
    1844 |         fault.memslot = gfn_to_memslot(vcpu->kvm, fault.gfn);
         |               ^~~~~~~
         |               slot
   arch/arm64/kvm/mmu.c:1845:14: error: 'struct kvm_page_fault' has no member named 'hva'
    1845 |         fault.hva = gfn_to_hva_memslot_prot(fault.memslot, fault.gfn, &writable);
         |              ^
   arch/arm64/kvm/mmu.c:1845:51: error: 'struct kvm_page_fault' has no member named 'memslot'; did you mean 'slot'?
    1845 |         fault.hva = gfn_to_hva_memslot_prot(fault.memslot, fault.gfn, &writable);
         |                                                   ^~~~~~~
         |                                                   slot
   arch/arm64/kvm/mmu.c:1846:30: error: 'hva' undeclared (first use in this function); did you mean 'hva_t'?
    1846 |         if (kvm_is_error_hva(hva) || (fault.write && !writable)) {
         |                              ^~~
         |                              hva_t
   arch/arm64/kvm/mmu.c: In function 'kvm_handle_guest_abort':
   arch/arm64/kvm/mmu.c:1975:1: warning: label 'out_unlock' defined but not used [-Wunused-label]
    1975 | out_unlock:
         | ^~~~~~~~~~


vim +1807 arch/arm64/kvm/mmu.c

  1795	
  1796	static int __kvm_handle_guest_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  1797					    unsigned long esr)
  1798	{
  1799		struct kvm_page_fault fault = {
  1800			.fault_ipa = fault_ipa,
  1801			.esr = esr,
  1802			.ipa = fault_ipa,
  1803	
  1804			.write = kvm_is_write_fault(vcpu),
  1805			.exec  = kvm_vcpu_trap_is_exec_fault(vcpu),
  1806			.is_perm = esr_fsc_is_permission_fault(esr),
> 1807			.granule = esr_fsc_is_permission_fault(esr) ? esr_perm_fault_granule(esr) : 0,
  1808		};
  1809		struct kvm_s2_trans nested_trans;
  1810		bool writable;
  1811	
  1812		/*
  1813		 * We may have faulted on a shadow stage 2 page table if we are
  1814		 * running a nested guest.  In this case, we have to resolve the L2
  1815		 * IPA to the L1 IPA first, before knowing what kind of memory should
  1816		 * back the L1 IPA.
  1817		 *
  1818		 * If the shadow stage 2 page table walk faults, then we simply inject
  1819		 * this to the guest and carry on.
  1820		 *
  1821		 * If there are no shadow S2 PTs because S2 is disabled, there is
  1822		 * nothing to walk and we treat it as a 1:1 before going through the
  1823		 * canonical translation.
  1824		 */
  1825		if (kvm_is_nested_s2_mmu(vcpu->kvm,vcpu->arch.hw_mmu) &&
  1826		    vcpu->arch.hw_mmu->nested_stage2_enabled) {
  1827			ret = kvm_walk_nested_s2(vcpu, fault_ipa, &nested_trans);
  1828			if (ret) {
  1829				kvm_inject_s2_fault(vcpu, kvm_s2_trans_esr(&nested_trans));
  1830				return ret;
  1831			}
  1832	
  1833			ret = kvm_s2_handle_perm_fault(vcpu, &nested_trans);
  1834			if (ret) {
  1835				kvm_inject_s2_fault(vcpu, kvm_s2_trans_esr(&nested_trans));
  1836				return ret;
  1837			}
  1838	
  1839			fault.ipa = kvm_s2_trans_output(&nested_trans);
  1840			fault.nested = &nested_trans;
  1841		}
  1842	
  1843		fault.gfn = fault.ipa >> PAGE_SHIFT;
  1844		fault.memslot = gfn_to_memslot(vcpu->kvm, fault.gfn);
  1845		fault.hva = gfn_to_hva_memslot_prot(fault.memslot, fault.gfn, &writable);
  1846		if (kvm_is_error_hva(hva) || (fault.write && !writable)) {
  1847			/*
  1848			 * The guest has put either its instructions or its page-tables
  1849			 * somewhere it shouldn't have. Userspace won't be able to do
  1850			 * anything about this (there's no syndrome for a start), so
  1851			 * re-inject the abort back into the guest.
  1852			 */
  1853			if (kvm_vcpu_trap_is_iabt(vcpu)) {
  1854				ret = -ENOEXEC;
  1855				goto out;
  1856			}
  1857	
  1858			if (kvm_vcpu_abt_iss1tw(vcpu))
  1859				return kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
  1860	
  1861			/*
  1862			 * Check for a cache maintenance operation. Since we
  1863			 * ended-up here, we know it is outside of any memory
  1864			 * slot. But we can't find out if that is for a device,
  1865			 * or if the guest is just being stupid. The only thing
  1866			 * we know for sure is that this range cannot be cached.
  1867			 *
  1868			 * So let's assume that the guest is just being
  1869			 * cautious, and skip the instruction.
  1870			 */
  1871			if (kvm_is_error_hva(hva) && kvm_vcpu_dabt_is_cm(vcpu)) {
  1872				kvm_incr_pc(vcpu);
  1873				return 1;
  1874			}
  1875	
  1876			/*
  1877			 * The IPA is reported as [MAX:12], so we need to
  1878			 * complement it with the bottom 12 bits from the
  1879			 * faulting VA. This is always 12 bits, irrespective
  1880			 * of the page size.
  1881			 */
  1882			fault.ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
  1883			return io_mem_abort(vcpu, fault.ipa);
  1884		}
  1885	
  1886		/* Userspace should not be able to register out-of-bounds IPAs */
  1887		VM_BUG_ON(fault.ipa >= kvm_phys_size(vcpu->arch.hw_mmu));
  1888	
  1889		if (esr_fsc_is_access_flag_fault(esr)) {
  1890			handle_access_fault(vcpu, fault.fault_ipa);
  1891			return 1;
  1892		}
  1893	
  1894		ret = user_mem_abort(vcpu, &fault);
  1895		if (ret == 0)
  1896			ret = 1;
  1897	out:
  1898		if (ret == -ENOEXEC)
  1899			ret = kvm_inject_sea_iabt(vcpu, kvm_vcpu_get_hfar(vcpu));
  1900		return ret;
  1901	}
  1902	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
