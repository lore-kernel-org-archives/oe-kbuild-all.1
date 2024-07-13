Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2461EA85
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720858632; cv=none; b=XHCwLMyau+7tuuRABjizZkf9vzmTIDPNheBSpdqi6WKg1SSRJNmVHDfB1vGgxhLzSPljnniOOZVBdmyTYuBI/W8YnPKy14nCpUirSWBskhYI1Ny9eQanni3YUj5idBb2nvDEwGYHddRRYwEEl4Ijs3zPqPA/Q9K5zCb6k9lFol8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720858632; c=relaxed/simple;
	bh=wbc4fDt1JZ/6iFk3Xva5CRGVN+arNrjn9Oo4ZCDf5BI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ghUvG3hzSsxZbnUYN7qNPkhN7UWHcvFlkpK8+nk1tRhwhKPRvXRZ9PhukKyauQjPD6HbAsHpTNp2himKyD+EWhaO4UOcvzwNyutyjJLnh5ZZfxSmlfqfKURlwdSq0EGaJcP5MlyWTXrS7Vs25EwPxJMY0lFFks0P2HG/S+9h2LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nI5Z9T98; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nI5Z9T98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720858630; x=1752394630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wbc4fDt1JZ/6iFk3Xva5CRGVN+arNrjn9Oo4ZCDf5BI=;
  b=nI5Z9T98ifg4Ouhw8quyq5X3CAV0mga+DOaVBcE+cqJ6kZfF85dbDETj
   ax04x4c5Nve3cY+WrGABfQ5fXW3DcUvp8Lu9B638Ka7QS07D6JhQ9wLPK
   BS9BAv8n3C38F3d3jEh8mVMADZ8ReKtQStaoQhw374X6sC4y0T591n2LG
   w+k5lE9HoXfFJvveVdpJLFtx6q5kvIMFDTDTvf8qGJo1xKrIOvNxROaUB
   dl+KtO6OqwW49jbqCYjxsVCeW5jWIBdwdXLKF5+DkAMk7xodHoet4sQx9
   Im11gqWvq3dadVximhK36cmDKOT625LNcR6q+bq8ps1uSubqWqmYQ4hTE
   A==;
X-CSE-ConnectionGUID: QSxSyGXGSJOHyMAMZIMAxg==
X-CSE-MsgGUID: DBqks1WfTIOZEGaqoqZaoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18501817"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="18501817"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 01:17:10 -0700
X-CSE-ConnectionGUID: rIlLY6eeTH6/cAw+kjSC4w==
X-CSE-MsgGUID: WdHzfnQOQjaghc8ndrg7EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="72347910"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2024 01:17:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSXwJ-000bry-06;
	Sat, 13 Jul 2024 08:17:07 +0000
Date: Sat, 13 Jul 2024 16:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_follow_pfn 77/94] arch/mips/kvm/mmu.c:488:14:
 warning: variable 'pfn_valid' set but not used
Message-ID: <202407131635.q8W3LkCC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_follow_pfn
head:   5641418383baccd16ccdb1a3d1601864b8361a4e
commit: 43553c14c435297382091214cebb9b19255aa48e [77/94] KVM: MIPS: Mark "struct page" pfns accessed only in "slow" page fault path
config: mips-loongson3_defconfig (https://download.01.org/0day-ci/archive/20240713/202407131635.q8W3LkCC-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131635.q8W3LkCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131635.q8W3LkCC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/kvm/mmu.c: In function '_kvm_mips_map_page_fast':
>> arch/mips/kvm/mmu.c:488:14: warning: variable 'pfn_valid' set but not used [-Wunused-but-set-variable]
     488 |         bool pfn_valid = false;
         |              ^~~~~~~~~
>> arch/mips/kvm/mmu.c:487:19: warning: variable 'pfn' set but not used [-Wunused-but-set-variable]
     487 |         kvm_pfn_t pfn = 0;      /* silence bogus GCC warning */
         |                   ^~~


vim +/pfn_valid +488 arch/mips/kvm/mmu.c

411740f5422a96 James Hogan 2016-12-13  461  
b5f1dd1ba4042b James Hogan 2016-12-06  462  /**
b5f1dd1ba4042b James Hogan 2016-12-06  463   * _kvm_mips_map_page_fast() - Fast path GPA fault handler.
b5f1dd1ba4042b James Hogan 2016-12-06  464   * @vcpu:		VCPU pointer.
b5f1dd1ba4042b James Hogan 2016-12-06  465   * @gpa:		Guest physical address of fault.
b5f1dd1ba4042b James Hogan 2016-12-06  466   * @write_fault:	Whether the fault was due to a write.
b5f1dd1ba4042b James Hogan 2016-12-06  467   * @out_entry:		New PTE for @gpa (written on success unless NULL).
b5f1dd1ba4042b James Hogan 2016-12-06  468   * @out_buddy:		New PTE for @gpa's buddy (written on success unless
b5f1dd1ba4042b James Hogan 2016-12-06  469   *			NULL).
b5f1dd1ba4042b James Hogan 2016-12-06  470   *
b5f1dd1ba4042b James Hogan 2016-12-06  471   * Perform fast path GPA fault handling, doing all that can be done without
411740f5422a96 James Hogan 2016-12-13  472   * calling into KVM. This handles marking old pages young (for idle page
411740f5422a96 James Hogan 2016-12-13  473   * tracking), and dirtying of clean pages (for dirty page logging).
b5f1dd1ba4042b James Hogan 2016-12-06  474   *
b5f1dd1ba4042b James Hogan 2016-12-06  475   * Returns:	0 on success, in which case we can update derived mappings and
b5f1dd1ba4042b James Hogan 2016-12-06  476   *		resume guest execution.
b5f1dd1ba4042b James Hogan 2016-12-06  477   *		-EFAULT on failure due to absent GPA mapping or write to
b5f1dd1ba4042b James Hogan 2016-12-06  478   *		read-only page, in which case KVM must be consulted.
b5f1dd1ba4042b James Hogan 2016-12-06  479   */
b5f1dd1ba4042b James Hogan 2016-12-06  480  static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
b5f1dd1ba4042b James Hogan 2016-12-06  481  				   bool write_fault,
b5f1dd1ba4042b James Hogan 2016-12-06  482  				   pte_t *out_entry, pte_t *out_buddy)
b5f1dd1ba4042b James Hogan 2016-12-06  483  {
b5f1dd1ba4042b James Hogan 2016-12-06  484  	struct kvm *kvm = vcpu->kvm;
b5f1dd1ba4042b James Hogan 2016-12-06  485  	gfn_t gfn = gpa >> PAGE_SHIFT;
b5f1dd1ba4042b James Hogan 2016-12-06  486  	pte_t *ptep;
411740f5422a96 James Hogan 2016-12-13 @487  	kvm_pfn_t pfn = 0;	/* silence bogus GCC warning */
411740f5422a96 James Hogan 2016-12-13 @488  	bool pfn_valid = false;
b5f1dd1ba4042b James Hogan 2016-12-06  489  	int ret = 0;
b5f1dd1ba4042b James Hogan 2016-12-06  490  
b5f1dd1ba4042b James Hogan 2016-12-06  491  	spin_lock(&kvm->mmu_lock);
b5f1dd1ba4042b James Hogan 2016-12-06  492  
b5f1dd1ba4042b James Hogan 2016-12-06  493  	/* Fast path - just check GPA page table for an existing entry */
b5f1dd1ba4042b James Hogan 2016-12-06  494  	ptep = kvm_mips_pte_for_gpa(kvm, NULL, gpa);
b5f1dd1ba4042b James Hogan 2016-12-06  495  	if (!ptep || !pte_present(*ptep)) {
b5f1dd1ba4042b James Hogan 2016-12-06  496  		ret = -EFAULT;
b5f1dd1ba4042b James Hogan 2016-12-06  497  		goto out;
b5f1dd1ba4042b James Hogan 2016-12-06  498  	}
b5f1dd1ba4042b James Hogan 2016-12-06  499  
411740f5422a96 James Hogan 2016-12-13  500  	/* Track access to pages marked old */
411740f5422a96 James Hogan 2016-12-13  501  	if (!pte_young(*ptep)) {
411740f5422a96 James Hogan 2016-12-13  502  		set_pte(ptep, pte_mkyoung(*ptep));
411740f5422a96 James Hogan 2016-12-13  503  		pfn = pte_pfn(*ptep);
411740f5422a96 James Hogan 2016-12-13  504  		pfn_valid = true;
411740f5422a96 James Hogan 2016-12-13  505  	}
b5f1dd1ba4042b James Hogan 2016-12-06  506  	if (write_fault && !pte_dirty(*ptep)) {
411740f5422a96 James Hogan 2016-12-13  507  		if (!pte_write(*ptep)) {
411740f5422a96 James Hogan 2016-12-13  508  			ret = -EFAULT;
411740f5422a96 James Hogan 2016-12-13  509  			goto out;
411740f5422a96 James Hogan 2016-12-13  510  		}
411740f5422a96 James Hogan 2016-12-13  511  
411740f5422a96 James Hogan 2016-12-13  512  		/* Track dirtying of writeable pages */
b5f1dd1ba4042b James Hogan 2016-12-06  513  		set_pte(ptep, pte_mkdirty(*ptep));
411740f5422a96 James Hogan 2016-12-13  514  		pfn = pte_pfn(*ptep);
b5f1dd1ba4042b James Hogan 2016-12-06  515  		mark_page_dirty(kvm, gfn);
b5f1dd1ba4042b James Hogan 2016-12-06  516  	}
b5f1dd1ba4042b James Hogan 2016-12-06  517  
b5f1dd1ba4042b James Hogan 2016-12-06  518  	if (out_entry)
b5f1dd1ba4042b James Hogan 2016-12-06  519  		*out_entry = *ptep;
b5f1dd1ba4042b James Hogan 2016-12-06  520  	if (out_buddy)
b5f1dd1ba4042b James Hogan 2016-12-06  521  		*out_buddy = *ptep_buddy(ptep);
b5f1dd1ba4042b James Hogan 2016-12-06  522  
b5f1dd1ba4042b James Hogan 2016-12-06  523  out:
b5f1dd1ba4042b James Hogan 2016-12-06  524  	spin_unlock(&kvm->mmu_lock);
b5f1dd1ba4042b James Hogan 2016-12-06  525  	return ret;
b5f1dd1ba4042b James Hogan 2016-12-06  526  }
b5f1dd1ba4042b James Hogan 2016-12-06  527  

:::::: The code at line 488 was first introduced by commit
:::::: 411740f5422a960c30a4285343d821b62daec34b KVM: MIPS/MMU: Implement KVM_CAP_SYNC_MMU

:::::: TO: James Hogan <james.hogan@imgtec.com>
:::::: CC: James Hogan <james.hogan@imgtec.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
