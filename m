Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A71A6172
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 06:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723011327; cv=none; b=lpJL6NgBYOs61qj2V5V74Zz0169YR6sSWCFRVeTfA5arYd2AU9H1ggrpS8cyueLF+db5wgQzcVx/n5rLFlkgwIvNClFYsPvuQCKsPfZ7z6aBgQoNgJKidlUZ7SN88eVm1XIlE0fDjCPuLmWfehN6Av1RiwRGCzvl5Qdp3FAJY80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723011327; c=relaxed/simple;
	bh=uYb8p6SFlAav5iMeoJrstmur+whFvLJOXTVmH6UBw1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0a3ZZyyU4bHB3aPh3U0oIO/X/tHXCxQV+MGJ/KLyYiWbsIVneyBYcqJBv0PVPYJ6P7KMnY1P4NeSUeqER2+P7zals9/kZU1XDLzjIbaWMiCzIPRqydAbdc0uHRtYqn3GArmDNsbc09v35147LlC6w8rPkgP7i5zr+ecs8ENMrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bw1hio0e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bw1hio0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723011325; x=1754547325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uYb8p6SFlAav5iMeoJrstmur+whFvLJOXTVmH6UBw1Q=;
  b=bw1hio0eyqy6A/nGPfZwehV0p9JliME0HdllNKJ9OqiUTlteEudqok4W
   NvCUlzjZpGl/+gAZ6w/ZV+AZYnkxKebVr2NQeBOQvX2b7FO+lUKJAIZJE
   4n2mOLKepvn+joTmvlr5sTMWv77z4JYmHbU9FSmpuqN7CzXw4fA7kSEVi
   lc1U5Rac4aYldwuRfvN09eL/iqni1iEGEXDdRhdQHgOt3qjRCiOlnP39Z
   SmK15JHEOWdxRVIVBNtcrnRmTfYH/R8+9Aiw/Zval99X9JHe19OCPIhV+
   hkKKQSeQ6xQPTJGKODqO1iZrKQbhcuk4Ax++sjwmH5E4NduPAJNg1jMt2
   A==;
X-CSE-ConnectionGUID: drpnd63QTtuTQCNH3103SA==
X-CSE-MsgGUID: TzbIsWdBQ7aJeLeLfZEnzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20635438"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="20635438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 23:15:25 -0700
X-CSE-ConnectionGUID: woIj6Qf0S0KbGvr7ctRzZg==
X-CSE-MsgGUID: O2ni3mQES269fnRCWgBOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="61626182"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Aug 2024 23:15:24 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbZxB-0005Am-2K;
	Wed, 07 Aug 2024 06:15:21 +0000
Date: Wed, 7 Aug 2024 14:15:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:pfncache-2 27/27]
 arch/arm64/kvm/../../../virt/kvm/kvm_main.c:757:45: warning: unused variable
 'hva_range'
Message-ID: <202408071422.kS79nC2u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux pfncache-2
head:   137c4fcbf73fb8797363cbb89e63f31504443ddc
commit: 137c4fcbf73fb8797363cbb89e63f31504443ddc [27/27] KVM: pfncache: Protect against GPC becoming active while invalidation is active
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240807/202408071422.kS79nC2u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071422.kS79nC2u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071422.kS79nC2u-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_mmu_notifier_invalidate_range_start':
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:778:58: error: expected ')' before '{' token
     778 |         if (likely(kvm->mn_active_invalidate_count == 1) {
         |            ~                                             ^
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:807:1: error: expected expression before '}' token
     807 | }
         | ^
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:757:45: warning: unused variable 'hva_range' [-Wunused-variable]
     757 |         const struct kvm_mmu_notifier_range hva_range = {
         |                                             ^~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:807:1: warning: no return statement in function returning non-void [-Wreturn-type]
     807 | }
         | ^


vim +/hva_range +757 arch/arm64/kvm/../../../virt/kvm/kvm_main.c

8569992d64b8f7 Chao Peng           2023-10-27  752  
f922bd9bf33bd5 Sean Christopherson 2021-04-01  753  static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
f922bd9bf33bd5 Sean Christopherson 2021-04-01  754  					const struct mmu_notifier_range *range)
f922bd9bf33bd5 Sean Christopherson 2021-04-01  755  {
f922bd9bf33bd5 Sean Christopherson 2021-04-01  756  	struct kvm *kvm = mmu_notifier_to_kvm(mn);
e97b39c5c4362d Sean Christopherson 2023-10-27 @757  	const struct kvm_mmu_notifier_range hva_range = {
f922bd9bf33bd5 Sean Christopherson 2021-04-01  758  		.start		= range->start,
f922bd9bf33bd5 Sean Christopherson 2021-04-01  759  		.end		= range->end,
8569992d64b8f7 Chao Peng           2023-10-27  760  		.handler	= kvm_mmu_unmap_gfn_range,
20ec3ebd707c77 Chao Peng           2022-08-16  761  		.on_lock	= kvm_mmu_invalidate_begin,
f922bd9bf33bd5 Sean Christopherson 2021-04-01  762  		.flush_on_ret	= true,
f922bd9bf33bd5 Sean Christopherson 2021-04-01  763  		.may_block	= mmu_notifier_range_blockable(range),
f922bd9bf33bd5 Sean Christopherson 2021-04-01  764  	};
565f3be2174611 Takuya Yoshikawa    2012-02-10  765  
f922bd9bf33bd5 Sean Christopherson 2021-04-01  766  	trace_kvm_unmap_hva_range(range->start, range->end);
f922bd9bf33bd5 Sean Christopherson 2021-04-01  767  
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  768  	/*
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  769  	 * Prevent memslot modification between range_start() and range_end()
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  770  	 * so that conditionally locking provides the same result in both
20ec3ebd707c77 Chao Peng           2022-08-16  771  	 * functions.  Without that guarantee, the mmu_invalidate_in_progress
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  772  	 * adjustments will be imbalanced.
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  773  	 *
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  774  	 * Pairs with the decrement in range_end().
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  775  	 */
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  776  	spin_lock(&kvm->mn_invalidate_lock);
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  777  	kvm->mn_active_invalidate_count++;
137c4fcbf73fb8 David Woodhouse     2024-08-06 @778  	if (likely(kvm->mn_active_invalidate_count == 1) {
137c4fcbf73fb8 David Woodhouse     2024-08-06  779  		kvm->mmu_gpc_invalidate_range_start = range->start;
137c4fcbf73fb8 David Woodhouse     2024-08-06  780  		kvm->mmu_gpc_invalidate_range_end = range->end;
137c4fcbf73fb8 David Woodhouse     2024-08-06  781  	} else {
137c4fcbf73fb8 David Woodhouse     2024-08-06  782  		/*
137c4fcbf73fb8 David Woodhouse     2024-08-06  783  		 * Fully tracking multiple concurrent ranges has diminishing
137c4fcbf73fb8 David Woodhouse     2024-08-06  784  		 * returns. Keep things simple and just find the minimal range
137c4fcbf73fb8 David Woodhouse     2024-08-06  785  		 * which includes the current and new ranges. As there won't be
137c4fcbf73fb8 David Woodhouse     2024-08-06  786  		 * enough information to subtract a range after its invalidate
137c4fcbf73fb8 David Woodhouse     2024-08-06  787  		 * completes, any ranges invalidated concurrently will
137c4fcbf73fb8 David Woodhouse     2024-08-06  788  		 * accumulate and persist until all outstanding invalidates
137c4fcbf73fb8 David Woodhouse     2024-08-06  789  		 * complete.
137c4fcbf73fb8 David Woodhouse     2024-08-06  790  		 */
137c4fcbf73fb8 David Woodhouse     2024-08-06  791  		kvm->mmu_gpc_invalidate_range_start =
137c4fcbf73fb8 David Woodhouse     2024-08-06  792  			min(kvm->mmu_gpc_invalidate_range_start, range->start);
137c4fcbf73fb8 David Woodhouse     2024-08-06  793  		kvm->mmu_gpc_invalidate_range_end =
137c4fcbf73fb8 David Woodhouse     2024-08-06  794  			max(kvm->mmu_gpc_invalidate_range_end, range->end);
137c4fcbf73fb8 David Woodhouse     2024-08-06  795  	}
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  796  	spin_unlock(&kvm->mn_invalidate_lock);
52ac8b358b0cb7 Paolo Bonzini       2021-05-27  797  
cec29eef0a8153 Sean Christopherson 2023-10-27  798  	/*
cec29eef0a8153 Sean Christopherson 2023-10-27  799  	 * If one or more memslots were found and thus zapped, notify arch code
cec29eef0a8153 Sean Christopherson 2023-10-27  800  	 * that guest memory has been reclaimed.  This needs to be done *after*
cec29eef0a8153 Sean Christopherson 2023-10-27  801  	 * dropping mmu_lock, as x86's reclaim path is slooooow.
cec29eef0a8153 Sean Christopherson 2023-10-27  802  	 */
cec29eef0a8153 Sean Christopherson 2023-10-27  803  	if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
cec29eef0a8153 Sean Christopherson 2023-10-27  804  		kvm_arch_guest_memory_reclaimed(kvm);
93065ac753e444 Michal Hocko        2018-08-21  805  
e649b3f0188f8f Eiichi Tsukata      2020-06-06  806  	return 0;
e930bffe95e1e8 Andrea Arcangeli    2008-07-25 @807  }
e930bffe95e1e8 Andrea Arcangeli    2008-07-25  808  

:::::: The code at line 757 was first introduced by commit
:::::: e97b39c5c4362dc1cbc37a563ddac313b96c84f3 KVM: Tweak kvm_hva_range and hva_handler_t to allow reusing for gfn ranges

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
