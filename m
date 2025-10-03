Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4C205AB6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759535836; cv=none; b=Wek8RjxopQpely+fSZUElttT2Y00FVG+kpvFv/LS0uYlOaTjvjCA5oHKSNTwladL/8WFq6dyZ2M8sk9SDj88Wrqzc1FOoaDT/WSZNPDIOTXYc47Z1zqNn+3qOkQ70zMMsSMni2sCdzG57dNvrONUFtWfm1CW/m0onMnsjW7XMZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759535836; c=relaxed/simple;
	bh=RXd6UYQNL2XiJhjSf60Vp34KTSdoDARwj/HuRnCVL4s=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jb3eFZd08kq9hdLXZJ49BpBsXzVXNCJkZRdFdczodG2yWSHNwmr8wIOtsM66XxKKgKhmh6MW9tBDf7hff0hLBfx236Z/fRqp5soLZ/xH+cuWrnmPm/EOB7HSHlZ+Lu1zZOkw6bgUVy8Dz28YSh00fLw6wHdBxEYblXcIrmlFRLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvNFCf/f; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvNFCf/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759535835; x=1791071835;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RXd6UYQNL2XiJhjSf60Vp34KTSdoDARwj/HuRnCVL4s=;
  b=NvNFCf/ftldGRhTzLu6U9rU/CsGXtedlZi2sjuljRWSlsPvZnjATSjK2
   J4asIXrYmP45bf19WDWEUmRAa0YO9ttXEytgE9Z87vbSW22EmiU9U9q7U
   PB4l+ujQif2RbmyndLD48mBe0eDnJvp7SS+oX3UtwWkleanclaIeqr1yV
   zeMX76qKSrf94YQgdoNVUEObyiUK8oM15KWqPgXjerWUsci/2kgS+hqnQ
   XamqUfHR1IMYifw/W6Op39Zr6Ezw0FW3yp93HHqmb9EYQzqiBwhHpnQ3v
   82KVq9P6fwyq4dpT+OrUYwTWJY5Rczz2Brye1wDPazecR52sS4ZoFrY3/
   Q==;
X-CSE-ConnectionGUID: CcmvwCszSHm9ar6RKBSFxA==
X-CSE-MsgGUID: v49XsUTOT7u/bTdmFls6Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61705532"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="61705532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 16:57:15 -0700
X-CSE-ConnectionGUID: 6DfOGa8wTcST0ZRX7qNk6A==
X-CSE-MsgGUID: LnlwVebmRR+Rt1ob8tIVcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="179429743"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Oct 2025 16:57:13 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4peA-0004yl-2d;
	Fri, 03 Oct 2025 23:57:10 +0000
Date: Sat, 4 Oct 2025 07:57:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kai Huang <kai.huang@intel.com>,
	Kishen Maloor <kishen.maloor@intel.com>
Subject: [intel-tdx:mig-dpamt-v3 86/97] arch/x86/kvm/mmu/tdp_mmu.c:2170:42:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202510040754.objbrYuD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git mig-dpamt-v3
head:   365885765611aa7959870e2388dda12ce2126442
commit: 3561867d781985bf3cd9a7feba55dd22524877f8 [86/97] KVM: x86/mmu: cgm: Add kvm_mmu_import_private_pages()
config: x86_64-randconfig-123-20251003 (https://download.01.org/0day-ci/archive/20251004/202510040754.objbrYuD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510040754.objbrYuD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040754.objbrYuD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/tdp_mmu.c:2044:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:2044:40: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:2044:40: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:2073:71: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:2073:71: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:2073:71: sparse:     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:2170:42: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/mmu/tdp_mmu.c:2170:42: sparse:    unsigned long long [noderef] __rcu *
   arch/x86/kvm/mmu/tdp_mmu.c:2170:42: sparse:    unsigned long long [usertype] *
   arch/x86/kvm/mmu/tdp_mmu.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:869:9: sparse: sparse: context imbalance in '__tdp_mmu_zap_root' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:1596:33: sparse: sparse: context imbalance in 'tdp_mmu_split_huge_pages_root' - unexpected unlock

vim +2170 arch/x86/kvm/mmu/tdp_mmu.c

  2034	
  2035	static int tdp_mmu_restore_private_page(struct kvm *kvm, gfn_t gfn,
  2036						u64 *sptep, u64 old_spte, int level)
  2037	{
  2038		int ret;
  2039	
  2040		if (!is_writable_pte(old_spte)) {
  2041			ret = static_call(kvm_x86_write_unblock_private_page)(kvm, gfn, level);
  2042			if (ret)
  2043				return ret;
> 2044			kvm_tdp_mmu_write_spte(sptep, old_spte,
  2045					       old_spte | PT_WRITABLE_MASK, level);
  2046		}
  2047	
  2048		if (!kvm_x86_ops.restore_private_page)
  2049			return 0;
  2050	
  2051		return static_call(kvm_x86_restore_private_page)(kvm, gfn);
  2052	}
  2053	
  2054	static int tdp_mmu_restore_private_pages(struct kvm *kvm,
  2055						 struct kvm_mmu_page *root)
  2056	{
  2057		struct tdp_iter iter;
  2058		gfn_t end = tdp_mmu_max_gfn_exclusive();
  2059		gfn_t start = 0;
  2060		int ret = 0;
  2061	
  2062		rcu_read_lock();
  2063		for_each_tdp_pte_min_level(iter, kvm, root, PG_LEVEL_4K, start, end) {
  2064			if (tdp_mmu_iter_cond_resched(kvm, &iter, false, false))
  2065				continue;
  2066	
  2067			if (iter.level > PG_LEVEL_4K)
  2068				continue;
  2069	
  2070			if (!is_shadow_present_pte(iter.old_spte))
  2071				continue;
  2072	
  2073			ret = tdp_mmu_restore_private_page(kvm, iter.gfn, iter.sptep,
  2074							   iter.old_spte, iter.level);
  2075			if (ret)
  2076				break;
  2077		}
  2078		rcu_read_unlock();
  2079	
  2080		return ret;
  2081	}
  2082	
  2083	int kvm_tdp_mmu_restore_private_pages(struct kvm *kvm)
  2084	{
  2085		struct kvm_mmu_page *root;
  2086		int i, ret;
  2087	
  2088		write_lock(&kvm->mmu_lock);
  2089	
  2090		for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
  2091			for_each_tdp_mmu_root_yield_safe(kvm, root) {
  2092				if (!is_mirror_sp(root))
  2093					continue;
  2094				ret = tdp_mmu_restore_private_pages(kvm, root);
  2095				if (ret)
  2096					break;
  2097			}
  2098		}
  2099		kvm_flush_remote_tlbs(kvm);
  2100	
  2101		write_unlock(&kvm->mmu_lock);
  2102		return ret;
  2103	}
  2104	
  2105	int kvm_tdp_mmu_import_private_pages(struct kvm *kvm,
  2106					     struct kvm_cgm_data *data,
  2107					     struct kvm_import_private_pages *pages)
  2108	{
  2109		struct kvm_vcpu *vcpu = kvm_get_vcpu(kvm, 0);
  2110		struct kvm_import_private_gfn *gfns = pages->gfns;
  2111		uint64_t page_nr = pages->page_nr;
  2112		uint64_t i, old_spte, new_spte;
  2113		struct kvm_memory_slot *slot;
  2114		struct page *page_unused;
  2115		struct kvm_mmu_page *sp;
  2116		uint64_t *sptep = NULL;
  2117		kvm_pfn_t pfn;
  2118		gfn_t gfn;
  2119		int ret;
  2120	
  2121		for (i = 0; i < page_nr; i++) {
  2122			gfn = (gfn_t)(gfns[i].gfn);
  2123	
  2124			if (!kvm_mem_is_private(kvm, gfn)) {
  2125				pr_err("Import page (gfn: %llx) isn't private\n", gfn);
  2126				return -EINVAL;
  2127			}
  2128	
  2129			kvm_tdp_mmu_walk_lockless_begin();
  2130			kvm_tdp_mmu_fast_pf_get_last_sptep(vcpu, gfn, &old_spte, true);
  2131			kvm_tdp_mmu_walk_lockless_end();
  2132	
  2133			if (!is_shadow_present_pte(old_spte)) {
  2134				slot = gfn_to_memslot(kvm, gfn);
  2135				if (!slot) {
  2136					pr_err("Import page not valid\n");
  2137					return -EINVAL;
  2138				}
  2139				ret = kvm_gmem_get_pfn(kvm, slot,
  2140						       gfn, &pfn, &page_unused, NULL);
  2141				if (ret) {
  2142					pr_err("Failed to get pfn from gmem\n");
  2143					return -EIO;
  2144				}
  2145				folio_put(page_folio(page_unused));
  2146				/* Initial (first time) import of a private page */
  2147				gfns[i].init = true;
  2148			} else {
  2149				pfn = spte_to_pfn(old_spte);
  2150			}
  2151			pages->pfns[i] = pfn;
  2152		}
  2153	
  2154		ret = static_call(kvm_x86_cgm_set_memory_state)(kvm, data, pages);
  2155		if (ret < 0)
  2156			return ret;
  2157	
  2158		read_lock(&kvm->mmu_lock);
  2159		kvm_tdp_mmu_walk_lockless_begin();
  2160	
  2161		for (i = 0; i < page_nr; i++) {
  2162			if (gfns[i].skip)
  2163				continue;
  2164	
  2165			gfn = (gfn_t)(gfns[i].gfn);
  2166			pfn = pages->pfns[i];
  2167			sptep = kvm_tdp_mmu_fast_pf_get_last_sptep(vcpu, gfn,
  2168								&old_spte, true);
  2169			if (!is_shadow_present_pte(old_spte)) {
> 2170				sp = sptep_to_sp(rcu_dereference(sptep));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
