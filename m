Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30DC1C9DD6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723033529; cv=none; b=NnxudzY3WCXzyWyOWv0dKebcFR53I8X/IwZMEgv5iI0kiKyV8XUp41HMc/WOgWGos24hy5r6UfDK6WMHZu2FwPdLZUJno+E8Aoy8Eb02Yjv96JhiZeECv2nNTwtzYmyyU31YAdBPcEuK/ZUdIIwkjjYkOCSrE06YuJ3qBFgUFkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723033529; c=relaxed/simple;
	bh=ymgttV7/4vVciOUeadrk+urnjLq9W/RUzn+jbmqRS3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wvi41feMubnj+97F1JxkSi/j+X8c3FrE5D5v/kmG4yrBob/SOYUbf1m33SWjJn3v6WUwgBTHYya8IHwzjxbZzeY3BMBOf48zxlXIC8vwXD3JPj8qxwmtBHslVQHk8tMKQYSYZzB7mYoUL6c9MfVlZosnoQGacBzSfTKDZzS+dkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLYKQlTo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLYKQlTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723033527; x=1754569527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ymgttV7/4vVciOUeadrk+urnjLq9W/RUzn+jbmqRS3w=;
  b=QLYKQlToGkMC9JtP0YKg96xWxmv33kVF0Zgd+oDdKfxXoAScgKrq+iiS
   c8oBJBoUI0F8AWFV/i1ZmaLu3E71njuHD8kqYq4m1vsw+DSaPwmAmFlG0
   6Q1xkMjm/3p8jkzG8XYeWVIFMAU3jrRezF91+6XNhszPwXhILQXNjS2c2
   Cb61qViOYm2+zbQuAIDRu2BZhk5hYEqn5yJ05Yr7ZZ3fUojVl6cWG9tAm
   tFFCbxTzSIzQ52tb3BtZ8ZC8PmUR07GPlLTnmy0T7zI0COzwZFH9+heoF
   m5vH8vFmWNn6r0z9Qdikq4qXjINGxrDuMbZbU/ahcR0sHPafVkXV4kBKs
   A==;
X-CSE-ConnectionGUID: ZIDrMS/OSdG4a0Tk46H5Fw==
X-CSE-MsgGUID: hym35AM5TMGgXJoWh1Rg7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21271677"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="21271677"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:25:26 -0700
X-CSE-ConnectionGUID: gC6k0xTiRNiZzmgwy6GDng==
X-CSE-MsgGUID: KuOI4o8tT22UNwgpt2WUlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="61481355"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2024 05:25:25 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbfjH-0005NI-0E;
	Wed, 07 Aug 2024 12:25:23 +0000
Date: Wed, 7 Aug 2024 20:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:pfncache-2 27/27]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:757:45: warning: unused variable
 'hva_range'
Message-ID: <202408072043.UtIA4nWr-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240807/202408072043.UtIA4nWr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408072043.UtIA4nWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408072043.UtIA4nWr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_mmu_notifier_invalidate_range_start':
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:778:58: error: expected ')' before '{' token
     778 |         if (likely(kvm->mn_active_invalidate_count == 1) {
         |            ~                                             ^
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:807:1: error: expected expression before '}' token
     807 | }
         | ^
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:757:45: warning: unused variable 'hva_range' [-Wunused-variable]
     757 |         const struct kvm_mmu_notifier_range hva_range = {
         |                                             ^~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:807:1: warning: no return statement in function returning non-void [-Wreturn-type]
     807 | }
         | ^


vim +/hva_range +757 arch/x86/kvm/../../../virt/kvm/kvm_main.c

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
