Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541AAF9E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695975633; x=1727511633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Sbjr4bWWU8vPLpeQtrtcmY71cQMw2ZI0PYPYGnshE8=;
  b=nqpGBGthEJUXMHmSc7mgiJ4wzXLmWVMckZfrdRxZBBnWXJAFwAHmO7BC
   xOM73pRf5GFpp9oHb+oRo4lCgHfeZ5DOV2uw7b8C9LXKdavMhVufd7bne
   hJhuQvyxIBHn5z2X5hcFQsQnWzo5i35G89IKrRRGuf1PLW6dbLWKkqIjd
   OUble+EbTECKr6i+2/0shmQ4WIdBRPp5YjMjGcI3Bq3Veq8ZCZypr8Z60
   WdqicjmU7O8egOCDdaJHVI2Vsw1PWwsd3poiel8fdFiDgkoqMQtVcykGh
   v4m/YlDBaZdV30E4uN2wwJi2QnaIv40pjI9U9DcnxNn3PYQo/+ldSQGGd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379521647"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="379521647"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 00:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840199144"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="840199144"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Sep 2023 00:30:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm7xM-0002aX-17;
	Fri, 29 Sep 2023 07:30:36 +0000
Date: Fri, 29 Sep 2023 15:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] KVM: x86/mmu: always take tdp_mmu_pages_lock
Message-ID: <202309291557.Eq3JDvT6-lkp@intel.com>
References: <20230928162959.1514661-4-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928162959.1514661-4-pbonzini@redhat.com>

Hi Paolo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on linus/master v6.6-rc3 next-20230929]
[cannot apply to mst-vhost/linux-next kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/KVM-x86-mmu-remove-unnecessary-bool-shared-argument-from-functions/20230929-003259
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230928162959.1514661-4-pbonzini%40redhat.com
patch subject: [PATCH 3/3] KVM: x86/mmu: always take tdp_mmu_pages_lock
config: x86_64-buildonly-randconfig-004-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291557.Eq3JDvT6-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291557.Eq3JDvT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291557.Eq3JDvT6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/tdp_mmu.c:289: warning: Excess function parameter 'shared' description in 'tdp_mmu_unlink_sp'


vim +289 arch/x86/kvm/mmu/tdp_mmu.c

43a063cab325ee7 Yosry Ahmed         2022-08-23  278  
a9442f594147f95 Ben Gardon          2021-02-02  279  /**
c298a30c2821cb0 David Matlack       2022-01-19  280   * tdp_mmu_unlink_sp() - Remove a shadow page from the list of used pages
a9442f594147f95 Ben Gardon          2021-02-02  281   *
a9442f594147f95 Ben Gardon          2021-02-02  282   * @kvm: kvm instance
a9442f594147f95 Ben Gardon          2021-02-02  283   * @sp: the page to be removed
9a77daacc87dee9 Ben Gardon          2021-02-02  284   * @shared: This operation may not be running under the exclusive use of
9a77daacc87dee9 Ben Gardon          2021-02-02  285   *	    the MMU lock and the operation must synchronize with other
9a77daacc87dee9 Ben Gardon          2021-02-02  286   *	    threads that might be adding or removing pages.
a9442f594147f95 Ben Gardon          2021-02-02  287   */
44f1ce87ebc1ca1 Paolo Bonzini       2023-09-28  288  static void tdp_mmu_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp)
a9442f594147f95 Ben Gardon          2021-02-02 @289  {
44f1ce87ebc1ca1 Paolo Bonzini       2023-09-28  290  	lockdep_assert_held(&kvm->mmu_lock);
44f1ce87ebc1ca1 Paolo Bonzini       2023-09-28  291  
43a063cab325ee7 Yosry Ahmed         2022-08-23  292  	tdp_unaccount_mmu_page(kvm, sp);
d25ceb9264364dc Sean Christopherson 2022-10-19  293  
d25ceb9264364dc Sean Christopherson 2022-10-19  294  	if (!sp->nx_huge_page_disallowed)
d25ceb9264364dc Sean Christopherson 2022-10-19  295  		return;
d25ceb9264364dc Sean Christopherson 2022-10-19  296  
9a77daacc87dee9 Ben Gardon          2021-02-02  297  	spin_lock(&kvm->arch.tdp_mmu_pages_lock);
61f94478547bb4f Sean Christopherson 2022-10-19  298  	sp->nx_huge_page_disallowed = false;
61f94478547bb4f Sean Christopherson 2022-10-19  299  	untrack_possible_nx_huge_page(kvm, sp);
9a77daacc87dee9 Ben Gardon          2021-02-02  300  	spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
a9442f594147f95 Ben Gardon          2021-02-02  301  }
a9442f594147f95 Ben Gardon          2021-02-02  302  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
