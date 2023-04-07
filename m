Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4966FBD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680886682; x=1712422682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+m53ePiDDY2OzjyzJuk27K+qL371oSrHgedBarBLQs=;
  b=mLKZFXZqLEp6VnV4caC8Vq/MUVMG0BaXISiGumPhClCwNroe2X1ZktbF
   DJxMxMuMd8svHud6tmUazRONY0yHmB+1nirxsY15ijLy2M6MXuk170QWq
   r3VfKUnVwGix+F4rHabYkIC6fdcqe7bWkhKnyLlfphIm6bnDZwyI0UZnS
   a5WgiyElPa5nx8hqXLO7IR9pfG1qguTxwW27YCm2ZssrJxLlJLu22U5U7
   VZyqppnHDudnzsLyaGYkPcaXL/dNi5xsEKyx/s/4GwszKzk5d+O2bFgxm
   1LJwCPmjPrd9TB6MrGmnUVPZP5AiXvZ73lrQkXpr8qOB9XdQLwHIFzWtb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="340515955"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="340515955"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 09:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811452140"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="811452140"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2023 09:57:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpPP-000Shn-1S;
	Fri, 07 Apr 2023 16:57:55 +0000
Date: Sat, 8 Apr 2023 00:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 176/335]
 arch/x86/kvm/mmu/tdp_mmu.c:1362:32: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202304080038.WmaqwQfO-lkp@intel.com>
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
commit: ffb3424e2c86a61c2ad982fc465e23c29c7870fe [176/335] KVM: x86/tdp_mmu: Try to merge pages into a large page
config: x86_64-randconfig-s023-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080038.WmaqwQfO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/ffb3424e2c86a61c2ad982fc465e23c29c7870fe
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout ffb3424e2c86a61c2ad982fc465e23c29c7870fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080038.WmaqwQfO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/tdp_mmu.c:684:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu * @@
   arch/x86/kvm/mmu/tdp_mmu.c:684:17: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:684:17: sparse:     got unsigned long long [noderef] [usertype] __rcu *
   arch/x86/kvm/mmu/tdp_mmu.c:769:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr @@
   arch/x86/kvm/mmu/tdp_mmu.c:769:14: sparse:     expected void const volatile *v
   arch/x86/kvm/mmu/tdp_mmu.c:769:14: sparse:     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr
   arch/x86/kvm/mmu/tdp_mmu.c:769:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:769:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:769:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:769:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:915:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:915:30: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:915:30: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:923:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:923:28: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:923:28: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1908:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1908:9: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1908:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:1362:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[assigned] [usertype] child_pt @@
   arch/x86/kvm/mmu/tdp_mmu.c:1362:32: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1362:32: sparse:     got unsigned long long [noderef] [usertype] __rcu *[assigned] [usertype] child_pt
>> arch/x86/kvm/mmu/tdp_mmu.c:1426:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1426:34: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1426:34: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1442:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1442:34: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1442:34: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1630:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1630:25: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1630:25: sparse:     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:394:13: sparse: sparse: context imbalance in 'tdp_mmu_unlink_sp' - different lock contexts for basic block
   arch/x86/kvm/mmu/tdp_mmu.c:769:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/mmu/tdp_mmu.c:769:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:804:9: sparse: sparse: context imbalance in '__tdp_mmu_zap_root' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     got unsigned long long [usertype] *sptep
   include/linux/rcupdate.h:804:9: sparse: sparse: context imbalance in 'tdp_mmu_alloc_sp_for_split' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:814:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:840:42: sparse:     got unsigned long long [usertype] *sptep

vim +1362 arch/x86/kvm/mmu/tdp_mmu.c

  1327	
  1328	static int tdp_mmu_merge_private_spt(struct kvm_vcpu *vcpu,
  1329					     struct kvm_page_fault *fault,
  1330					     struct tdp_iter *iter, u64 new_spte)
  1331	{
  1332		u64 *sptep = rcu_dereference(iter->sptep);
  1333		struct kvm_mmu_page *child_sp;
  1334		struct kvm *kvm = vcpu->kvm;
  1335		struct tdp_iter child_iter;
  1336		bool ret_pf_retry = false;
  1337		int level = iter->level;
  1338		gfn_t gfn = iter->gfn;
  1339		u64 old_spte = *sptep;
  1340		tdp_ptep_t child_pt;
  1341		u64 child_spte;
  1342		int ret = 0;
  1343		int i;
  1344	
  1345		/*
  1346		 * TDX KVM supports only 2MB large page.  It's not supported to merge
  1347		 * 2MB pages into 1GB page at the moment.
  1348		 */
  1349		WARN_ON_ONCE(fault->goal_level != PG_LEVEL_2M);
  1350		WARN_ON_ONCE(iter->level != PG_LEVEL_2M);
  1351		WARN_ON_ONCE(!is_large_pte(new_spte));
  1352	
  1353		/* Freeze the spte to prevent other threads from working spte. */
  1354		if (!try_cmpxchg64(sptep, &iter->old_spte, REMOVED_SPTE))
  1355			return -EBUSY;
  1356	
  1357		/*
  1358		 * Step down to the child spte.  Because tdp_iter_next() assumes the
  1359		 * parent spte isn't freezed, do it manually.
  1360		 */
  1361		child_pt = spte_to_child_pt(iter->old_spte, iter->level);
> 1362		child_sp = sptep_to_sp(child_pt);
  1363		WARN_ON_ONCE(child_sp->role.level != PG_LEVEL_4K);
  1364		WARN_ON_ONCE(!kvm_mmu_page_role_is_private(child_sp->role));
  1365	
  1366		/* Don't modify iter as the caller will use iter after this function. */
  1367		child_iter = *iter;
  1368		/* Adjust the target gfn to the head gfn of the large page. */
  1369		child_iter.next_last_level_gfn &= -KVM_PAGES_PER_HPAGE(level);
  1370		tdp_iter_step_down(&child_iter, child_pt);
  1371	
  1372		/*
  1373		 * All child pages are required to be populated for merging them into a
  1374		 * large page.  Populate all child spte.
  1375		 */
  1376		for (i = 0; i < SPTE_ENT_PER_PAGE; i++, tdp_iter_step_side(&child_iter)) {
  1377			WARN_ON_ONCE(child_iter.level != PG_LEVEL_4K);
  1378			if (is_shadow_present_pte(child_iter.old_spte)) {
  1379				/* TODO: relocate page for huge page. */
  1380				WARN_ON_ONCE(spte_to_pfn(child_iter.old_spte) != spte_to_pfn(new_spte) + i);
  1381				continue;
  1382			}
  1383	
  1384			WARN_ON_ONCE(spte_to_pfn(child_iter.old_spte) != spte_to_pfn(new_spte) + i);
  1385			child_spte = make_huge_page_split_spte(kvm, new_spte, child_sp->role, i);
  1386			/*
  1387			 * Because other thread may have started to operate on this spte
  1388			 * before freezing the parent spte,  Use atomic version to
  1389			 * prevent race.
  1390			 */
  1391			ret = tdp_mmu_set_spte_atomic(vcpu->kvm, &child_iter, child_spte);
  1392			if (ret == -EBUSY || ret == -EAGAIN)
  1393				/*
  1394				 * There was a race condition.  Populate remaining 4K
  1395				 * spte to resolve fault->gfn to guarantee the forward
  1396				 * progress.
  1397				 */
  1398				ret_pf_retry = true;
  1399			else if (ret)
  1400				goto out;
  1401		}
  1402		if (ret_pf_retry) {
  1403			ret = RET_PF_RETRY;
  1404			goto out;
  1405		}
  1406	
  1407		/* Prevent the Secure-EPT entry from being used. */
  1408		ret = static_call(kvm_x86_zap_private_spte)(kvm, gfn, level);
  1409		if (ret)
  1410			goto out;
  1411		kvm_flush_remote_tlbs_with_address(kvm, gfn, KVM_PAGES_PER_HPAGE(level));
  1412	
  1413		/* Merge pages into a large page. */
  1414		ret = static_call(kvm_x86_merge_private_spt)(kvm, gfn, level,
  1415							     kvm_mmu_private_spt(child_sp));
  1416		/*
  1417		 * Failed to merge pages because some pages are accepted and some are
  1418		 * pending.  Since the child page was mapped above, let vcpu run.
  1419		 */
  1420		if (ret == -EAGAIN)
  1421			ret = RET_PF_RETRY;
  1422		if (ret)
  1423			goto unzap;
  1424	
  1425		/* Unfreeze spte. */
> 1426		__kvm_tdp_mmu_write_spte(sptep, new_spte);
  1427	
  1428		/*
  1429		 * Free unused child sp.  Secure-EPT page was already freed at TDX level
  1430		 * by kvm_x86_merge_private_spt().
  1431		 */
  1432		tdp_unaccount_mmu_page(kvm, child_sp);
  1433		tdp_mmu_free_sp(child_sp);
  1434		return RET_PF_RETRY;
  1435	
  1436	unzap:
  1437		if (static_call(kvm_x86_unzap_private_spte)(kvm, gfn, level))
  1438			old_spte = SHADOW_NONPRESENT_VALUE |
  1439				(spte_to_pfn(old_spte) << PAGE_SHIFT) |
  1440				PT_PAGE_SIZE_MASK;
  1441	out:
  1442		__kvm_tdp_mmu_write_spte(sptep, old_spte);
  1443		return ret;
  1444	}
  1445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
