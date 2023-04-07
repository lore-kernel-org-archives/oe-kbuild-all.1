Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE53848E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680891119; x=1712427119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5k84gzEOih5x8aiYEI1TDkXROWWJQ1cjMvJyX0Owfzk=;
  b=Sd7VwODO3myaXMz6EC6EOyfJ0JZEpD7AtIpkJZQJvDQs+NbGItCttS17
   CEwocrotPOce+lDVvFoZqlfVOYJC/QH0kEolbU5Xl+qtiLqFn93IwLq1g
   qfmg1giB7+XJMxvjPjaXJQtuIhUgcWFbCmE71v7G2a1vowBPzmwfB//j3
   KVjIghYuGdV8nvQLHDoJ4XVoXnmeb3XjfVUleBIIhV8IMTVSRYIUZHgx9
   sEtEyDeePMeqpIUOdaFeHlUavI4cE9plJmyjge56hZh9ZuT0W8k3cHF3a
   AWdw/KUpOR0eBOdqqZuznM3D8gq7ClOrrk/EVyHR3D6gLLObQSxphbl6t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344817010"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="344817010"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="664976021"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="664976021"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2023 11:11:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqZ3-000Slf-25;
	Fri, 07 Apr 2023 18:11:57 +0000
Date: Sat, 8 Apr 2023 02:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 209/335]
 arch/x86/kvm/mmu/tdp_mmu.c:941:35: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202304080231.WwKfwDzL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   3e6762343e0ddcb90b2e49af3a341051541d1a3a
commit: 905042be677292b9f7047bacf4121c835e134fc4 [209/335] KVM: x86/tdp_mmu: optimize remote tlb flush
config: x86_64-randconfig-s023-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080231.WwKfwDzL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/905042be677292b9f7047bacf4121c835e134fc4
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 905042be677292b9f7047bacf4121c835e134fc4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080231.WwKfwDzL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/tdp_mmu.c:729:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu * @@
   arch/x86/kvm/mmu/tdp_mmu.c:729:17: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:729:17: sparse:     got unsigned long long [noderef] [usertype] __rcu *
   arch/x86/kvm/mmu/tdp_mmu.c:859:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr @@
   arch/x86/kvm/mmu/tdp_mmu.c:859:14: sparse:     expected void const volatile *v
   arch/x86/kvm/mmu/tdp_mmu.c:859:14: sparse:     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr
   arch/x86/kvm/mmu/tdp_mmu.c:859:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:859:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:859:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:859:14: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/x86/kvm/mmu/tdp_mmu.c:941:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *const [usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:941:35: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:941:35: sparse:     got unsigned long long [noderef] [usertype] __rcu *const [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1008:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1008:9: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1008:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1021:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1021:30: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1021:30: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1029:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1029:28: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1029:28: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:2037:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:2037:9: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:2037:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1487:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[assigned] [usertype] child_pt @@
   arch/x86/kvm/mmu/tdp_mmu.c:1487:32: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1487:32: sparse:     got unsigned long long [noderef] [usertype] __rcu *[assigned] [usertype] child_pt
   arch/x86/kvm/mmu/tdp_mmu.c:1551:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1551:34: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1551:34: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1567:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1567:34: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1567:34: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1722:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1722:17: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1722:17: sparse:     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:394:13: sparse: sparse: context imbalance in 'tdp_mmu_unlink_sp' - different lock contexts for basic block
   arch/x86/kvm/mmu/tdp_mmu.c:859:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/mmu/tdp_mmu.c:859:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:804:9: sparse: sparse: context imbalance in '__tdp_mmu_zap_root' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     got unsigned long long [usertype] *sptep
   include/linux/rcupdate.h:804:9: sparse: sparse: context imbalance in 'tdp_mmu_alloc_sp_for_split' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:906:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:932:42: sparse:     got unsigned long long [usertype] *sptep

vim +941 arch/x86/kvm/mmu/tdp_mmu.c

   935	
   936	static u64 private_zapped_spte(struct kvm *kvm, const struct tdp_iter *iter)
   937	{
   938		if (!kvm_gfn_shared_mask(kvm))
   939			return SHADOW_NONPRESENT_VALUE;
   940	
 > 941		if (!is_private_sptep(iter->sptep))
   942			return SHADOW_NONPRESENT_VALUE;
   943	
   944		return SHADOW_NONPRESENT_VALUE | SPTE_PRIVATE_ZAPPED |
   945			(spte_to_pfn(iter->old_spte) << PAGE_SHIFT) |
   946			(is_large_pte(iter->old_spte) ? PT_PAGE_SIZE_MASK : 0);
   947	}
   948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
