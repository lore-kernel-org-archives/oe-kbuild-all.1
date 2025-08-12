Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3489A145A05
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 06:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754981239; cv=none; b=e+9DJrOESPrwHhDJ9NpRZBKt1Jc0DCI1E7dFIL05Zb/oyJrqXIQvKT6zjGYD3QqR6xEy1llSdvkmGEF+l8f42TzqlvRDpShnyQob+/DsZEZAG49lu2NsJbFhljlKfcvfnp3KYYRt5UJd9ZuOi9kA4fq53itw5sOl3O+GziC8OPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754981239; c=relaxed/simple;
	bh=0grnTpkH5eLMa2I9+ulXh0MXW32bTqafLF0+UU5kQ1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EPLMickBNR6or7C0kiWNWGGD62vpcuWwE8U9mALa4gl1QUGs0NpTsB77KSNM5mECXGpaSg6IrCRrwj087n0wXzl2/z+PsSbKsrNZWgF6F3qude8DeEdVz5OYPUmydmnJltjiB3L0kZObkqSzJQmegj82X73GJhc2pdP4bnjzYNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQUI8fty; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQUI8fty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754981237; x=1786517237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0grnTpkH5eLMa2I9+ulXh0MXW32bTqafLF0+UU5kQ1I=;
  b=dQUI8ftyxi7nvvd4xspjAVnA/yxO+sZNQ7FB+hP12HcUDgYyal6mUoH0
   RPpSwa+rFFfrIurMP2jMV/Qdn1Jf2/dKIOTEd0nE7D5zhc0sbL+nlimnG
   wWSYD/lNb4StxCNm3T5TXte26NLLzpVwuuTTeq3O2IeSS0FLLGQNsYME5
   Plw/jxIl5VcMDaX6heHKcf80m+57UA4WE8R4ZOqVwoD+5SVeJtea7ib3l
   4hl2y6VcVy2o+/feyc5CEu/wksCC5ONOf9F4VFGjwFYQRp1PXrTcoyhDF
   +iGDEgTjpM9asNFBQxyVkwOvDZ+efks7cbmzWldBCZ3gN4cW6yJR7S6BD
   w==;
X-CSE-ConnectionGUID: ZJIGO+2wSoCnxT3EWGgeiw==
X-CSE-MsgGUID: TCmZX2oKRF60wVCZ57y8vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="59860548"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="59860548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 23:47:16 -0700
X-CSE-ConnectionGUID: Zs3rTDQSR42Top4RyRFnGg==
X-CSE-MsgGUID: wDBzI9AGR1OSGvnomP5WSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="197120772"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Aug 2025 23:47:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulimR-0006To-2o;
	Tue, 12 Aug 2025 06:46:59 +0000
Date: Tue, 12 Aug 2025 14:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2665/2665] arch/arm64/kvm/rme.c:740:6: warning:
 variable 'tmp_page' is used uninitialized whenever 'if' condition is true
Message-ID: <202508121448.yD6lHdJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   263cf8eeb5316aeebd9d692e9966df029f65889f
commit: a74f93b7e7c0d8a2114055ed0c652cc735a7a07b [2665/2665] [backport]rme: populate guest memory region without guest_memfd
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250812/202508121448.yD6lHdJT-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121448.yD6lHdJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121448.yD6lHdJT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/rme.c:740:6: warning: variable 'tmp_page' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     740 |         if (memslot->base_gfn + memslot->npages < end_gfn) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/rme.c:789:14: note: uninitialized use occurs here
     789 |         __free_page(tmp_page);
         |                     ^~~~~~~~
   include/linux/gfp.h:333:41: note: expanded from macro '__free_page'
     333 | #define __free_page(page) __free_pages((page), 0)
         |                                         ^~~~
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
   include/linux/gfp.h:333:41: note: expanded from macro '__free_page'
     333 | #define __free_page(page) __free_pages((page), 0)
         |                                         ^~~~
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
