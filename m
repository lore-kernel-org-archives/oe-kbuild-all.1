Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEC8341B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 21:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lN+bPXLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698269861; x=1729805861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0sEg4t4NzFPp9Q1POPTG1rY1U2mYZWFk4zqOwrt6hjM=;
  b=lN+bPXLTKryjYqPU4zBqNUoyU+9VTr6Tn6CZi9V6ojH7S5ipv0mIOEBT
   BYaL26W9alHxzE5AIM7tpjn5LaGLttGkI0mqs6bLaJ2zPi4HzNdPQVSqj
   yUGnWr1kaba0DB/a2qXr7nS2p6+cu66GgMhTovmh0GX9q/qLQowlx5jTr
   Wabqet1yD20vk5M/pe0oZumNNd00mHm0F/ibXsU0tj93ijmHJOEj5nqbm
   GFIr+8MSY8+axAw3PEQ/V3ozlKdEHOtLQ/DO8LvKNLal0OKfrSep8hrtL
   qh9oFG0wO1zIPPBOOEMcBIK0TLJd+MzwxVezvmE9dJ+g85uL+jiskOgQl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="205289"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="205289"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="788257732"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="788257732"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Oct 2023 14:37:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvlZG-0009DQ-0v;
	Wed, 25 Oct 2023 21:37:34 +0000
Date: Thu, 26 Oct 2023 05:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-next 256/348]
 arch/x86/kvm/mmu/tdp_mmu.c:1488:34: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202310260538.hAUQf0l7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   ce98d11dcbe13d1a02ce9f4f49d422d6db223b60
commit: 0ef14edefb39ecfbd7ca72b0a68ff09a885e7b35 [256/348] KVM: x86/tdp_mmu: Try to merge pages into a large page
config: x86_64-randconfig-123-20231025 (https://download.01.org/0day-ci/archive/20231026/202310260538.hAUQf0l7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260538.hAUQf0l7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260538.hAUQf0l7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/tdp_mmu.c:626:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu * @@
   arch/x86/kvm/mmu/tdp_mmu.c:626:17: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:626:17: sparse:     got unsigned long long [noderef] [usertype] __rcu *
   arch/x86/kvm/mmu/tdp_mmu.c:701:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr @@
   arch/x86/kvm/mmu/tdp_mmu.c:701:14: sparse:     expected void const volatile *v
   arch/x86/kvm/mmu/tdp_mmu.c:701:14: sparse:     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr
   arch/x86/kvm/mmu/tdp_mmu.c:701:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:701:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:701:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:701:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:848:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:848:30: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:848:30: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:856:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:856:28: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:856:28: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1041:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[assigned] [usertype] child_pt @@
   arch/x86/kvm/mmu/tdp_mmu.c:1041:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1041:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[assigned] [usertype] child_pt
   arch/x86/kvm/mmu/tdp_mmu.c:1975:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1975:9: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1975:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1401:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[assigned] [usertype] child_pt @@
   arch/x86/kvm/mmu/tdp_mmu.c:1401:32: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1401:32: sparse:     got unsigned long long [noderef] [usertype] __rcu *[assigned] [usertype] child_pt
>> arch/x86/kvm/mmu/tdp_mmu.c:1488:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1488:34: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1488:34: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1500:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1500:34: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1500:34: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1695:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1695:25: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1695:25: sparse:     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:336:13: sparse: sparse: context imbalance in 'tdp_mmu_unlink_sp' - different lock contexts for basic block
   arch/x86/kvm/mmu/tdp_mmu.c:701:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/mmu/tdp_mmu.c:701:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__tdp_mmu_zap_root' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     got unsigned long long [usertype] *sptep
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'tdp_mmu_alloc_sp_for_split' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:746:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:784:42: sparse:     got unsigned long long [usertype] *sptep

vim +1488 arch/x86/kvm/mmu/tdp_mmu.c

  1367	
  1368	static int tdp_mmu_merge_private_spt(struct kvm_vcpu *vcpu,
  1369					     struct kvm_page_fault *fault,
  1370					     struct tdp_iter *iter, u64 new_spte)
  1371	{
  1372		u64 *sptep = rcu_dereference(iter->sptep);
  1373		u64 old_spte = iter->old_spte;
  1374		struct kvm_mmu_page *child_sp;
  1375		struct kvm *kvm = vcpu->kvm;
  1376		struct tdp_iter child_iter;
  1377		int level = iter->level;
  1378		gfn_t gfn = iter->gfn;
  1379		tdp_ptep_t child_pt;
  1380		u64 child_spte;
  1381		int ret = 0;
  1382		int i;
  1383	
  1384		/*
  1385		 * TDX KVM supports only 2MB large page.  It's not supported to merge
  1386		 * 2MB pages into 1GB page at the moment.
  1387		 */
  1388		WARN_ON_ONCE(fault->goal_level != PG_LEVEL_2M);
  1389		WARN_ON_ONCE(iter->level != PG_LEVEL_2M);
  1390		WARN_ON_ONCE(!is_large_pte(new_spte));
  1391	
  1392		/* Freeze the spte to prevent other threads from working spte. */
  1393		if (!try_cmpxchg64(sptep, &iter->old_spte, REMOVED_SPTE))
  1394			return -EBUSY;
  1395	
  1396		/*
  1397		 * Step down to the child spte.  Because tdp_iter_next() assumes the
  1398		 * parent spte isn't freezed, do it manually.
  1399		 */
  1400		child_pt = spte_to_child_pt(iter->old_spte, iter->level);
  1401		child_sp = sptep_to_sp(child_pt);
  1402		WARN_ON_ONCE(child_sp->role.level != PG_LEVEL_4K);
  1403		WARN_ON_ONCE(!kvm_mmu_page_role_is_private(child_sp->role));
  1404	
  1405		/* Don't modify iter as the caller will use iter after this function. */
  1406		child_iter = *iter;
  1407		/* Adjust the target gfn to the head gfn of the large page. */
  1408		child_iter.next_last_level_gfn &= -KVM_PAGES_PER_HPAGE(level);
  1409		tdp_iter_step_down(&child_iter, child_pt);
  1410	
  1411		/*
  1412		 * All child pages are required to be populated for merging them into a
  1413		 * large page.  Populate all child spte.
  1414		 */
  1415		for (i = 0; i < SPTE_ENT_PER_PAGE; i = tdp_mmu_iter_step_side(i, &child_iter)) {
  1416			int tmp;
  1417	
  1418			WARN_ON_ONCE(child_iter.level != PG_LEVEL_4K);
  1419	
  1420			if (is_shadow_present_pte(child_iter.old_spte)) {
  1421				/* TODO: relocate page for huge page. */
  1422				if (WARN_ON_ONCE(spte_to_pfn(child_iter.old_spte) !=
  1423						 spte_to_pfn(new_spte) + i)) {
  1424					if (!ret)
  1425						ret = -EAGAIN;
  1426					continue;
  1427				}
  1428				/*
  1429				 * When SEPT_VE_DISABLE=true and the page state is
  1430				 * pending, this case can happen.  Just resume the vcpu
  1431				 * again with the expectation for other vcpu to accept
  1432				 * this page.
  1433				 */
  1434				if (child_iter.gfn == fault->gfn) {
  1435					if (!ret)
  1436						ret = -EAGAIN;
  1437				}
  1438				continue;
  1439			}
  1440	
  1441			child_spte = make_huge_page_split_spte(kvm, new_spte, child_sp->role, i);
  1442			/*
  1443			 * Because other thread may have started to operate on this spte
  1444			 * before freezing the parent spte,  Use atomic version to
  1445			 * prevent race.
  1446			 */
  1447			tmp = tdp_mmu_set_spte_atomic(vcpu->kvm, &child_iter, child_spte);
  1448			if (tmp == -EBUSY || tmp == -EAGAIN) {
  1449				/*
  1450				 * There was a race condition.  Populate remaining 4K
  1451				 * spte to resolve fault->gfn to guarantee the forward
  1452				 * progress.
  1453				 */
  1454				if (!ret)
  1455					ret = tmp;
  1456			} else if (tmp) {
  1457				ret = tmp;
  1458				goto out;
  1459			}
  1460		}
  1461		if (ret)
  1462			goto out;
  1463	
  1464		/* Prevent the Secure-EPT entry from being used. */
  1465		ret = static_call(kvm_x86_zap_private_spte)(kvm, gfn, level);
  1466		if (ret)
  1467			goto out;
  1468		kvm_flush_remote_tlbs_range(kvm, gfn & KVM_HPAGE_GFN_MASK(level),
  1469					    KVM_PAGES_PER_HPAGE(level));
  1470	
  1471		/* Merge pages into a large page. */
  1472		ret = static_call(kvm_x86_merge_private_spt)(kvm, gfn, level,
  1473							     kvm_mmu_private_spt(child_sp));
  1474		/*
  1475		 * Failed to merge pages because some pages are accepted and some are
  1476		 * pending.  Since the child page was mapped above, let vcpu run.
  1477		 */
  1478		if (ret) {
  1479			if (static_call(kvm_x86_unzap_private_spte)(kvm, gfn, level))
  1480				old_spte = SHADOW_NONPRESENT_VALUE |
  1481					(spte_to_pfn(old_spte) << PAGE_SHIFT) |
  1482					PT_PAGE_SIZE_MASK;
  1483			goto out;
  1484		}
  1485	
  1486		/* Unfreeze spte. */
  1487		iter->old_spte = new_spte;
> 1488		__kvm_tdp_mmu_write_spte(sptep, new_spte);
  1489	
  1490		/*
  1491		 * Free unused child sp.  Secure-EPT page was already freed at TDX level
  1492		 * by kvm_x86_merge_private_spt().
  1493		 */
  1494		tdp_unaccount_mmu_page(kvm, child_sp);
  1495		tdp_mmu_free_sp(child_sp);
  1496		return -EAGAIN;
  1497	
  1498	out:
  1499		iter->old_spte = old_spte;
  1500		__kvm_tdp_mmu_write_spte(sptep, old_spte);
  1501		return ret;
  1502	}
  1503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
