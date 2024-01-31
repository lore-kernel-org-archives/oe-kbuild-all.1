Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36B3CF7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 23:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706744133; cv=none; b=d1Hup0Xcns129xRV7iqiKZU1hB07zgQmfAJZ65Qn2mXTtD7EsTOAVfSyNaK2Zqir2LoHDN8EDvBC+7qE+q32uXOOEvAAZ+HknDYhlnnwZzJ2PJ2tTlA9CtKLv/woTk1iuxtGrgY6R0CDLjlvcRVeUyLorL3XDBdvZ9v67ZVTNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706744133; c=relaxed/simple;
	bh=KeXsDpSvJaXDAcNDvtu6FOE5sFV0+87eKEabJbXqCNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4bSN9xRwyM2ZLFGzDORJmPngBxHbrKBhmmWTmWP/9c0h1dpCDpJ3g9UERIvqxYyYYVKH5lFcM9c3ADkkJMl1Y8tkSr/OdtpcoHqSS9QSaf8iJ86tBFlvdJwLNkukjSzP30h1GF2OUuK4vvZDg2KLyz0rJv79pSEkdibcj7v9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJGWQB9z; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJGWQB9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706744131; x=1738280131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KeXsDpSvJaXDAcNDvtu6FOE5sFV0+87eKEabJbXqCNk=;
  b=BJGWQB9zvaZWdIvAd8U2JMLKDKL/HbK2Ucicd0v/ovKLWMmx0JP980I6
   L6FbZuoNIH2CrIi8SMc5AqFBP5BhuZyFz4MHXManacpgt3aJ00cUpulT9
   vXxBf7v4hTyCjA5Amrni6yop39iYfk5c3NSanEV6495/99R2b1SkTRFfD
   g/kmsOqj7BK5fALkMawavL8MGg3F9DNd6vaNq76WVa5QZmPeGa1E+ThJ1
   eBJ1t2FQ/c8XLzOa7dV+F4VoerN+gUGdo8OoQr+jQUna5llkoAOIqfFnB
   VrK5+rtoOjkIjV95NZItExtCjKDIXXz/Nc9pfUBeGAdI4uCCl3QbUBm7I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402600543"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="402600543"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 15:35:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="30401363"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 Jan 2024 15:35:29 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVK6p-0002AA-2z;
	Wed, 31 Jan 2024 23:35:18 +0000
Date: Thu, 1 Feb 2024 07:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28292/30000] arch/x86/kvm/mmu/mmu.c:5812
 kvm_mmu_slot_largepage_remove_write_access() error: uninitialized symbol
 'flush'.
Message-ID: <202402010712.s76rk6os-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   260c7a5874066269671cc826d6c9ccd70dd001e5
commit: 7eb46ab3d33ed664d9d4fe0e3cdf3232a9099e11 [28292/30000] KVM: x86/mmu: Skip rmap operations if rmaps not allocated
config: x86_64-randconfig-161-20240129 (https://download.01.org/0day-ci/archive/20240201/202402010712.s76rk6os-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010712.s76rk6os-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/mmu/mmu.c:5812 kvm_mmu_slot_largepage_remove_write_access() error: uninitialized symbol 'flush'.
arch/x86/kvm/mmu/mmu.c:5834 kvm_mmu_slot_set_dirty() error: uninitialized symbol 'flush'.

Old smatch warnings:
arch/x86/kvm/mmu/mmu.c:3788 direct_page_fault() warn: missing error code? 'r'
arch/x86/kvm/mmu/paging_tmpl.h:857 ept_page_fault() warn: missing error code? 'r'
arch/x86/kvm/mmu/paging_tmpl.h:857 paging64_page_fault() warn: missing error code? 'r'
arch/x86/kvm/mmu/paging_tmpl.h:857 paging32_page_fault() warn: missing error code? 'r'
arch/x86/kvm/mmu/mmu.c:5743 kvm_mmu_zap_collapsible_sptes() error: uninitialized symbol 'flush'.

vim +/flush +5812 arch/x86/kvm/mmu/mmu.c

f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5793  
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5794  void kvm_mmu_slot_largepage_remove_write_access(struct kvm *kvm,
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5795  					struct kvm_memory_slot *memslot)
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5796  {
d77aa73c7072c5 arch/x86/kvm/mmu.c     Xiao Guangrong      2015-05-13  5797  	bool flush;
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5798  
7eb46ab3d33ed6 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-05-18  5799  	if (kvm_memslots_have_rmaps(kvm)) {
91f65ea3582813 arch/x86/kvm/mmu/mmu.c Ben Gardon          2023-08-14  5800  		write_lock(&kvm->mmu_lock);
d77aa73c7072c5 arch/x86/kvm/mmu.c     Xiao Guangrong      2015-05-13  5801  		flush = slot_handle_large_level(kvm, memslot, slot_rmap_write_protect,
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5802  						false);
91f65ea3582813 arch/x86/kvm/mmu/mmu.c Ben Gardon          2023-08-14  5803  		write_unlock(&kvm->mmu_lock);
7eb46ab3d33ed6 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-05-18  5804  	}
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5805  
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5806  	if (is_tdp_mmu_enabled(kvm)) {
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5807  		read_lock(&kvm->mmu_lock);
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5808  		flush |= kvm_tdp_mmu_wrprot_slot(kvm, memslot, PG_LEVEL_2M);
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5809  		read_unlock(&kvm->mmu_lock);
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5810  	}
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5811  
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28 @5812  	if (flush)
7f42aa76d4a558 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-02-18  5813  		kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5814  }
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5815  EXPORT_SYMBOL_GPL(kvm_mmu_slot_largepage_remove_write_access);
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5816  
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5817  void kvm_mmu_slot_set_dirty(struct kvm *kvm,
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5818  			    struct kvm_memory_slot *memslot)
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5819  {
d77aa73c7072c5 arch/x86/kvm/mmu.c     Xiao Guangrong      2015-05-13  5820  	bool flush;
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5821  
7eb46ab3d33ed6 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-05-18  5822  	if (kvm_memslots_have_rmaps(kvm)) {
91f65ea3582813 arch/x86/kvm/mmu/mmu.c Ben Gardon          2023-08-14  5823  		write_lock(&kvm->mmu_lock);
d77aa73c7072c5 arch/x86/kvm/mmu.c     Xiao Guangrong      2015-05-13  5824  		flush = slot_handle_all_level(kvm, memslot, __rmap_set_dirty, false);
91f65ea3582813 arch/x86/kvm/mmu/mmu.c Ben Gardon          2023-08-14  5825  		write_unlock(&kvm->mmu_lock);
7eb46ab3d33ed6 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-05-18  5826  	}
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5827  
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5828  	if (is_tdp_mmu_enabled(kvm)) {
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5829  		read_lock(&kvm->mmu_lock);
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5830  		flush |= kvm_tdp_mmu_slot_set_dirty(kvm, memslot);
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5831  		read_unlock(&kvm->mmu_lock);
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5832  	}
ac11ca5ab371f5 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  5833  
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28 @5834  	if (flush)
7f42aa76d4a558 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-02-18  5835  		kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5836  }
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5837  EXPORT_SYMBOL_GPL(kvm_mmu_slot_set_dirty);
f4b4b1808690c3 arch/x86/kvm/mmu.c     Kai Huang           2015-01-28  5838  

:::::: The code at line 5812 was first introduced by commit
:::::: f4b4b1808690c37c7c703d43789c1988c5e7fdeb KVM: MMU: Add mmu help functions to support PML

:::::: TO: Kai Huang <kai.huang@linux.intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
