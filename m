Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B882F3C22
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414036; cv=none; b=j3YnCM2anWflHxNqCohCFRhKdwZBdE24Vc9VHupBaykuH05xlKUXjj1LrcPVH6DxzdckNA36K82YRu3zVVC6p8JrikDA/qq325VrvV8qt9cm+NaEj8hMbPQWARWfjyZG1p1tgtG5eUf8+J/OIavi/FJ/S1mvjtQgzvBOzHdMxwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414036; c=relaxed/simple;
	bh=GHWamv7sCKgsmrpWyQ+X7zAUf+JNj8JcdpXfceISfsE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VHDgLjeQawkiY2P9mng5nCA/Ss2lq72HYAEiHHzAj4kQYwkiygDSgIu75TH7jGqfbrzy9JnkP4hoX7rjDt/LwZ74fsr028Q7vAyD8CwAFO1cFi9ahVEXSVb2mv7H8F/gYwEngaKiUhGLQ0PejkglV4kYb15R+SDHj5wqJd2isc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sp0dJZf1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sp0dJZf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766414034; x=1797950034;
  h=date:from:to:cc:subject:message-id;
  bh=GHWamv7sCKgsmrpWyQ+X7zAUf+JNj8JcdpXfceISfsE=;
  b=Sp0dJZf1MxDGkmu92pYTSgNnmIELLrSjhldB09xTnK9ZaahbHsfqQHV9
   4KJRqN37vTDjyTaqbTzuP/IIPJIZIjw+Pvcf7lCXnkXwfqctQNpCGIRT4
   +74qDpRgD9iWxyY/3d6u7wXv2iE4Yy3UtfW4IJtWhz9MRQw0xFH/PHOf2
   bcwc1+i8zz5uYJK0NM7q45Zox/9R0g2jsT0DDECaY7ciAW/MYjbSIV2wK
   IqkdlTckEpIeSuGvlSgJBhOKJab5wQk+MOH4hHbvi/YKEzom1T55zN8+t
   vPnxNAHned1WYpROakulsB0QHUdvo2iupGNu0KxBxXexhRUrY46cnZcVI
   A==;
X-CSE-ConnectionGUID: eaUfFD1+RCWROQNR24J4Og==
X-CSE-MsgGUID: KE41JYfARySRiC4qFwnVAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93739255"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="93739255"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:33:53 -0800
X-CSE-ConnectionGUID: l67GFgnbQlij65zUAkT7XQ==
X-CSE-MsgGUID: IcrqiRkzTlicmaXrndh44w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="230548243"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Dec 2025 06:33:51 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXgya-000000000fd-0rN9;
	Mon, 22 Dec 2025 14:33:36 +0000
Date: Mon, 22 Dec 2025 22:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542] arch/arm64/kvm/rme.c:740:6:
 warning: variable 'tmp_page' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202512222225.THn80kvi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Steven,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: a74f93b7e7c0d8a2114055ed0c652cc735a7a07b [3542/3542] [backport]rme: populate guest memory region without guest_memfd
config: arm64-randconfig-001-20251215 (https://download.01.org/0day-ci/archive/20251222/202512222225.THn80kvi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222225.THn80kvi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222225.THn80kvi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/rme.c:740:6: warning: variable 'tmp_page' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     740 |         if (memslot->base_gfn + memslot->npages < end_gfn) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/rme.c:789:14: note: uninitialized use occurs here
     789 |         __free_page(tmp_page);
         |                     ^~~~~~~~
   arch/arm64/kvm/rme.c:740:2: note: remove the 'if' if its condition is always false
     740 |         if (memslot->base_gfn + memslot->npages < end_gfn) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     741 |                 ret = -EINVAL;
         |                 ~~~~~~~~~~~~~~
     742 |                 goto out;
         |                 ~~~~~~~~~
     743 |         }
         |         ~
   arch/arm64/kvm/rme.c:734:6: warning: variable 'tmp_page' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     734 |         if (!memslot) {
         |             ^~~~~~~~
   arch/arm64/kvm/rme.c:789:14: note: uninitialized use occurs here
     789 |         __free_page(tmp_page);
         |                     ^~~~~~~~
   arch/arm64/kvm/rme.c:734:2: note: remove the 'if' if its condition is always false
     734 |         if (!memslot) {
         |         ^~~~~~~~~~~~~~~
     735 |                 ret = -EFAULT;
         |                 ~~~~~~~~~~~~~~
     736 |                 goto out;
         |                 ~~~~~~~~~
     737 |         }
         |         ~
   arch/arm64/kvm/rme.c:726:23: note: initialize the variable 'tmp_page' to silence this warning
     726 |         struct page *tmp_page;
         |                              ^
         |                               = NULL
   arch/arm64/kvm/rme.c:798:16: warning: variable 'data_flags' set but not used [-Wunused-but-set-variable]
     798 |         unsigned long data_flags = 0;
         |                       ^
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +740 arch/arm64/kvm/rme.c

e216f77846eeb7 Steven Price 2025-06-14  715  
e216f77846eeb7 Steven Price 2025-06-14  716  static int populate_region(struct kvm *kvm,
e216f77846eeb7 Steven Price 2025-06-14  717  			   phys_addr_t ipa_base,
e216f77846eeb7 Steven Price 2025-06-14  718  			   phys_addr_t ipa_end,
e216f77846eeb7 Steven Price 2025-06-14  719  			   unsigned long data_flags)
e216f77846eeb7 Steven Price 2025-06-14  720  {
e216f77846eeb7 Steven Price 2025-06-14  721  	struct realm *realm = &kvm->arch.realm;
e216f77846eeb7 Steven Price 2025-06-14  722  	struct kvm_memory_slot *memslot;
e216f77846eeb7 Steven Price 2025-06-14  723  	gfn_t base_gfn, end_gfn;
e216f77846eeb7 Steven Price 2025-06-14  724  	int idx;
e216f77846eeb7 Steven Price 2025-06-14  725  	phys_addr_t ipa = ipa_base;
a74f93b7e7c0d8 Steven Price 2025-06-14  726  	struct page *tmp_page;
e216f77846eeb7 Steven Price 2025-06-14  727  	int ret = 0;
e216f77846eeb7 Steven Price 2025-06-14  728  
e216f77846eeb7 Steven Price 2025-06-14  729  	base_gfn = gpa_to_gfn(ipa_base);
e216f77846eeb7 Steven Price 2025-06-14  730  	end_gfn = gpa_to_gfn(ipa_end);
e216f77846eeb7 Steven Price 2025-06-14  731  
e216f77846eeb7 Steven Price 2025-06-14  732  	idx = srcu_read_lock(&kvm->srcu);
e216f77846eeb7 Steven Price 2025-06-14  733  	memslot = gfn_to_memslot(kvm, base_gfn);
e216f77846eeb7 Steven Price 2025-06-14  734  	if (!memslot) {
e216f77846eeb7 Steven Price 2025-06-14  735  		ret = -EFAULT;
e216f77846eeb7 Steven Price 2025-06-14  736  		goto out;
e216f77846eeb7 Steven Price 2025-06-14  737  	}
e216f77846eeb7 Steven Price 2025-06-14  738  
e216f77846eeb7 Steven Price 2025-06-14  739  	/* We require the region to be contained within a single memslot */
e216f77846eeb7 Steven Price 2025-06-14 @740  	if (memslot->base_gfn + memslot->npages < end_gfn) {
e216f77846eeb7 Steven Price 2025-06-14  741  		ret = -EINVAL;
e216f77846eeb7 Steven Price 2025-06-14  742  		goto out;
e216f77846eeb7 Steven Price 2025-06-14  743  	}
e216f77846eeb7 Steven Price 2025-06-14  744  
a74f93b7e7c0d8 Steven Price 2025-06-14  745  	tmp_page = alloc_page(GFP_KERNEL);
a74f93b7e7c0d8 Steven Price 2025-06-14  746  	if (!tmp_page) {
a74f93b7e7c0d8 Steven Price 2025-06-14  747  		ret = -ENOMEM;
e216f77846eeb7 Steven Price 2025-06-14  748  		goto out;
e216f77846eeb7 Steven Price 2025-06-14  749  	}
e216f77846eeb7 Steven Price 2025-06-14  750  
a74f93b7e7c0d8 Steven Price 2025-06-14  751  	mmap_read_lock(current->mm);
a74f93b7e7c0d8 Steven Price 2025-06-14  752  
e216f77846eeb7 Steven Price 2025-06-14  753  	while (ipa < ipa_end) {
e216f77846eeb7 Steven Price 2025-06-14  754  		struct vm_area_struct *vma;
e216f77846eeb7 Steven Price 2025-06-14  755  		unsigned long hva;
e216f77846eeb7 Steven Price 2025-06-14  756  		struct page *page;
e216f77846eeb7 Steven Price 2025-06-14  757  		kvm_pfn_t pfn;
e216f77846eeb7 Steven Price 2025-06-14  758  
e216f77846eeb7 Steven Price 2025-06-14  759  		hva = gfn_to_hva_memslot(memslot, gpa_to_gfn(ipa));
e216f77846eeb7 Steven Price 2025-06-14  760  		vma = vma_lookup(current->mm, hva);
e216f77846eeb7 Steven Price 2025-06-14  761  		if (!vma) {
e216f77846eeb7 Steven Price 2025-06-14  762  			ret = -EFAULT;
e216f77846eeb7 Steven Price 2025-06-14  763  			break;
e216f77846eeb7 Steven Price 2025-06-14  764  		}
e216f77846eeb7 Steven Price 2025-06-14  765  
a74f93b7e7c0d8 Steven Price 2025-06-14  766  		pfn = gfn_to_pfn_memslot(memslot, gpa_to_gfn(ipa));
e216f77846eeb7 Steven Price 2025-06-14  767  
e216f77846eeb7 Steven Price 2025-06-14  768  		if (is_error_pfn(pfn)) {
e216f77846eeb7 Steven Price 2025-06-14  769  			ret = -EFAULT;
e216f77846eeb7 Steven Price 2025-06-14  770  			break;
e216f77846eeb7 Steven Price 2025-06-14  771  		}
e216f77846eeb7 Steven Price 2025-06-14  772  
a74f93b7e7c0d8 Steven Price 2025-06-14  773  		page = pfn_to_page(pfn);
e216f77846eeb7 Steven Price 2025-06-14  774  
e216f77846eeb7 Steven Price 2025-06-14  775  		ret = realm_create_protected_data_page(realm, ipa,
a74f93b7e7c0d8 Steven Price 2025-06-14  776  						       page,
a74f93b7e7c0d8 Steven Price 2025-06-14  777  						       tmp_page,
e216f77846eeb7 Steven Price 2025-06-14  778  						       data_flags);
a74f93b7e7c0d8 Steven Price 2025-06-14  779  		if (ret) {
e216f77846eeb7 Steven Price 2025-06-14  780  			kvm_release_page_clean(page);
e216f77846eeb7 Steven Price 2025-06-14  781  			break;
a74f93b7e7c0d8 Steven Price 2025-06-14  782  		}
e216f77846eeb7 Steven Price 2025-06-14  783  
e216f77846eeb7 Steven Price 2025-06-14  784  		ipa += PAGE_SIZE;
a74f93b7e7c0d8 Steven Price 2025-06-14  785  		kvm_release_pfn_dirty(pfn);
e216f77846eeb7 Steven Price 2025-06-14  786  	}
e216f77846eeb7 Steven Price 2025-06-14  787  out:
a74f93b7e7c0d8 Steven Price 2025-06-14  788  	mmap_read_unlock(current->mm);
a74f93b7e7c0d8 Steven Price 2025-06-14  789  	__free_page(tmp_page);
e216f77846eeb7 Steven Price 2025-06-14  790  	srcu_read_unlock(&kvm->srcu, idx);
e216f77846eeb7 Steven Price 2025-06-14  791  	return ret;
e216f77846eeb7 Steven Price 2025-06-14  792  }
e216f77846eeb7 Steven Price 2025-06-14  793  

:::::: The code at line 740 was first introduced by commit
:::::: e216f77846eeb7062baa345cea2be0978dea94cc [v8-19-43]arm64: RME: Allow populating initial contents

:::::: TO: Steven Price <steven.price@arm.com>
:::::: CC: Xu Raoqing <xuraoqing@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
