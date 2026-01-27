Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4642D324B30
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540217; cv=none; b=IYf3gW8jo97dUUgQZa1Jlq2R35Pl8J8+uYP4gi11+n12dH6ju2Zt5y6QCQPRkJgRWC3ASILbw6senfc9rEU1DqD4zwtFaX5ukRgk5kaxw0uJayIqID7UI+vDce2kwP9n9IPeJ9lGqmF+n00kbT2hLF41NAjJY6zoOt1VxTRpXFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540217; c=relaxed/simple;
	bh=fwPaGqOTHtFPbqdPnaTVwMYLaAqbjqp5aHU5bd3jSFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UsqxV7V7cnPCg7H0ElsRv1G1+uQgKT6cL0ONsPqmbaQVxtOIGx4aT388l7lK95hlnFnXS0u9muJzYxKZjMuAlz/SGpV+ZPV7DkebIUz9fcHaLEWMEIgr26Nj18++1D1xXwvXRNU/eyrXRtN0Kkqc31TNU+87duCX3DkRINsInb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZAWQukj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZAWQukj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769540215; x=1801076215;
  h=date:from:to:cc:subject:message-id;
  bh=fwPaGqOTHtFPbqdPnaTVwMYLaAqbjqp5aHU5bd3jSFc=;
  b=XZAWQukjpBd2whfwBgYnDqt4eun94DA/lYepFeVyKC8uR0s0uor12eKg
   AthFVXrY21CYXR+RzNmH3+5hZDjSkyMWDgIrliFSfM/UWWaew8QPvGvW9
   y2UR57EiqpOfRcl14PGaKoPPMWQhFrsRGzEJbNcDc82kfdwtT6sU943vN
   LzmJHnNcIECvs8ZashckwUxRoRemPtOv+qEH0FoYIp7YHSW4cvmN427M8
   V/xc9+OVbOIuB4N5zdnY7xN/zs5UwluqDaJ+UpId/5hzQc/c6MfDjkpht
   gAt19ThNe+0YifpLjaSN8yy/bsswPa/ASOtLKTlxMN9B9u5AkaYhiIHC1
   g==;
X-CSE-ConnectionGUID: O+d11aWhSFubYeUFiGOMyQ==
X-CSE-MsgGUID: SI9HfeShR4KQOyy5uq0c/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73333653"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="73333653"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:56:54 -0800
X-CSE-ConnectionGUID: cFF/z62kR2aciT/5CTVttw==
X-CSE-MsgGUID: oIm4O2DDScmrIbMALbEc7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212599599"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2026 10:56:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkoF6-00000000YrC-2kI3;
	Tue, 27 Jan 2026 18:56:48 +0000
Date: Wed, 28 Jan 2026 02:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 15/53]
 arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse: sparse: incorrect type in argument
 1 (different address spaces)
Message-ID: <202601280247.B3HHRxkm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   4c35756ab388149481ea4bba261cfe450dac4fed
commit: 70002ec92ce671fd481e7fc6a2e9150aae74eed8 [15/53] KVM: x86/mmu: Fold set_external_spte_present() into its sole caller
config: x86_64-randconfig-121-20260127 (https://download.01.org/0day-ci/archive/20260128/202601280247.B3HHRxkm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280247.B3HHRxkm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280247.B3HHRxkm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c: note: in included file (through include/linux/rculist.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in '__tdp_mmu_zap_root' - unexpected unlock
>> arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     got unsigned long long [usertype] *sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     got unsigned long long [usertype] *sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     got unsigned long long [usertype] *sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     got unsigned long long [usertype] *sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1556:33: sparse: sparse: context imbalance in 'tdp_mmu_split_huge_pages_root' - unexpected unlock
>> arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     got unsigned long long [usertype] *sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:640:50: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:642:50: sparse:     got unsigned long long [usertype] *sptep

vim +640 arch/x86/kvm/mmu/tdp_mmu.c

   597	
   598	static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
   599								 struct tdp_iter *iter,
   600								 u64 new_spte)
   601	{
   602		u64 *sptep = rcu_dereference(iter->sptep);
   603	
   604		/*
   605		 * The caller is responsible for ensuring the old SPTE is not a FROZEN
   606		 * SPTE.  KVM should never attempt to zap or manipulate a FROZEN SPTE,
   607		 * and pre-checking before inserting a new SPTE is advantageous as it
   608		 * avoids unnecessary work.
   609		 */
   610		WARN_ON_ONCE(iter->yielded || is_frozen_spte(iter->old_spte));
   611	
   612		if (is_mirror_sptep(iter->sptep) && !is_frozen_spte(new_spte)) {
   613			int ret;
   614	
   615			/*
   616			 * KVM doesn't currently support zapping or splitting SPTEs
   617			 * while holding mmu_lock for read.
   618			 */
   619			if (KVM_BUG_ON(is_shadow_present_pte(iter->old_spte), kvm) ||
   620			    KVM_BUG_ON(!is_shadow_present_pte(new_spte), kvm))
   621				return -EBUSY;
   622	
   623			/*
   624			 * Temporarily freeze the SPTE until the external PTE operation
   625			 * has completed, e.g. so that concurrent faults don't attempt
   626			 * to install a child PTE in the external page table before the
   627			 * parent PTE has been written.
   628			 */
   629			if (!try_cmpxchg64(sptep, &iter->old_spte, FROZEN_SPTE))
   630				return -EBUSY;
   631	
   632			/*
   633			 * Update the external PTE.  On success, set the mirror SPTE to
   634			 * the desired value.  On failure, restore the old SPTE so that
   635			 * the SPTE isn't frozen in perpetuity.
   636			 */
   637			ret = kvm_x86_call(set_external_spte)(kvm, iter->gfn,
   638							      iter->level, new_spte);
   639			if (ret)
 > 640				__kvm_tdp_mmu_write_spte(sptep, iter->old_spte);
   641			else
   642				__kvm_tdp_mmu_write_spte(sptep, new_spte);
   643			return ret;
   644		}
   645	
   646		/*
   647		 * Note, fast_pf_fix_direct_spte() can also modify TDP MMU SPTEs and
   648		 * does not hold the mmu_lock.  On failure, i.e. if a different logical
   649		 * CPU modified the SPTE, try_cmpxchg64() updates iter->old_spte with
   650		 * the current value, so the caller operates on fresh data, e.g. if it
   651		 * retries tdp_mmu_set_spte_atomic()
   652		 */
   653		if (!try_cmpxchg64(sptep, &iter->old_spte, new_spte))
   654			return -EBUSY;
   655	
   656		return 0;
   657	}
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
