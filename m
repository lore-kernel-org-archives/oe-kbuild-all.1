Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE5C11185
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 18:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693159892; x=1724695892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YhGb9lB3qJxUjkGd34jSuk4c/srvGmcBXZoiIzvmYNM=;
  b=dNh2qZoDwFZcc9EuPfYsUR6lvlcBaaUG+V/uCCnDrcpghf4weeA/FGXP
   5iV/QN/g59RJvhG7DT4VgZRdQ2qSWAHH9eDEzMC7h5MaKmU2pT6BLC8H/
   4wIDrIWLyTWl4DK/UoUR+x1/JOq175ThsN4wL5ncSlohlc1UpeGavqBQp
   jN152FuE6p4uN/GwB3ZE7ATUUQULj71XgJbfJLPDWYEe/MYC2iGngvojA
   HcKOhFxW74tgLhm66sE5EKkepYKmZQG0kSazaA0oERGVsNgNHmjZbi8DQ
   dHiLX9CVHIB1ZuEkKmGD57rTRBjJrfq9Oazf52LbiIXD+VI65TJTQr+qp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="365166828"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="365166828"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 11:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="767438204"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="767438204"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Aug 2023 11:11:30 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaKET-00065D-0l;
	Sun, 27 Aug 2023 18:11:29 +0000
Date: Mon, 28 Aug 2023 02:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ruifeng Gao <ruifeng.gao@intel.com>
Subject: [intel-tdx:osv-integration 220/272]
 arch/x86/kvm/mmu/tdp_mmu.c:1293:32: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202308280231.G7Oym8DH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git osv-integration
head:   5617f3b0634401156d29e3d8d107db54f66bd3d6
commit: f97babf124418a069ecd9144db3343d713d79db8 [220/272] KVM: x86/tdp_mmu: Try to merge pages into a large page
config: x86_64-randconfig-123-20230827 (https://download.01.org/0day-ci/archive/20230828/202308280231.G7Oym8DH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280231.G7Oym8DH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280231.G7Oym8DH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/tdp_mmu.c:627:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu * @@
   arch/x86/kvm/mmu/tdp_mmu.c:627:17: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:627:17: sparse:     got unsigned long long [noderef] [usertype] __rcu *
   arch/x86/kvm/mmu/tdp_mmu.c:707:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr @@
   arch/x86/kvm/mmu/tdp_mmu.c:707:14: sparse:     expected void const volatile *v
   arch/x86/kvm/mmu/tdp_mmu.c:707:14: sparse:     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr
   arch/x86/kvm/mmu/tdp_mmu.c:707:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:707:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:707:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:707:14: sparse: sparse: cast removes address space '__rcu' of expression
   arch/x86/kvm/mmu/tdp_mmu.c:845:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:845:30: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:845:30: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:853:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:853:28: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:853:28: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1862:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1862:9: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1862:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:1293:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[assigned] [usertype] child_pt @@
   arch/x86/kvm/mmu/tdp_mmu.c:1293:32: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1293:32: sparse:     got unsigned long long [noderef] [usertype] __rcu *[assigned] [usertype] child_pt
>> arch/x86/kvm/mmu/tdp_mmu.c:1375:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1375:34: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1375:34: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1387:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1387:34: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1387:34: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1582:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1582:25: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1582:25: sparse:     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:336:13: sparse: sparse: context imbalance in 'tdp_mmu_unlink_sp' - different lock contexts for basic block
   arch/x86/kvm/mmu/tdp_mmu.c:707:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/mmu/tdp_mmu.c:707:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__tdp_mmu_zap_root' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     got unsigned long long [usertype] *sptep
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'tdp_mmu_alloc_sp_for_split' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:752:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:781:42: sparse:     got unsigned long long [usertype] *sptep

vim +1293 arch/x86/kvm/mmu/tdp_mmu.c

  1258	
  1259	static int tdp_mmu_merge_private_spt(struct kvm_vcpu *vcpu,
  1260					     struct kvm_page_fault *fault,
  1261					     struct tdp_iter *iter, u64 new_spte)
  1262	{
  1263		u64 *sptep = rcu_dereference(iter->sptep);
  1264		u64 old_spte = iter->old_spte;
  1265		struct kvm_mmu_page *child_sp;
  1266		struct kvm *kvm = vcpu->kvm;
  1267		struct tdp_iter child_iter;
  1268		bool ret_pf_retry = false;
  1269		int level = iter->level;
  1270		gfn_t gfn = iter->gfn;
  1271		tdp_ptep_t child_pt;
  1272		u64 child_spte;
  1273		int ret = 0;
  1274		int i;
  1275	
  1276		/*
  1277		 * TDX KVM supports only 2MB large page.  It's not supported to merge
  1278		 * 2MB pages into 1GB page at the moment.
  1279		 */
  1280		WARN_ON_ONCE(fault->goal_level != PG_LEVEL_2M);
  1281		WARN_ON_ONCE(iter->level != PG_LEVEL_2M);
  1282		WARN_ON_ONCE(!is_large_pte(new_spte));
  1283	
  1284		/* Freeze the spte to prevent other threads from working spte. */
  1285		if (!try_cmpxchg64(sptep, &iter->old_spte, REMOVED_SPTE))
  1286			return -EBUSY;
  1287	
  1288		/*
  1289		 * Step down to the child spte.  Because tdp_iter_next() assumes the
  1290		 * parent spte isn't freezed, do it manually.
  1291		 */
  1292		child_pt = spte_to_child_pt(iter->old_spte, iter->level);
> 1293		child_sp = sptep_to_sp(child_pt);
  1294		WARN_ON_ONCE(child_sp->role.level != PG_LEVEL_4K);
  1295		WARN_ON_ONCE(!kvm_mmu_page_role_is_private(child_sp->role));
  1296	
  1297		/* Don't modify iter as the caller will use iter after this function. */
  1298		child_iter = *iter;
  1299		/* Adjust the target gfn to the head gfn of the large page. */
  1300		child_iter.next_last_level_gfn &= -KVM_PAGES_PER_HPAGE(level);
  1301		tdp_iter_step_down(&child_iter, child_pt);
  1302	
  1303		/*
  1304		 * All child pages are required to be populated for merging them into a
  1305		 * large page.  Populate all child spte.
  1306		 */
  1307		for (i = 0; i < SPTE_ENT_PER_PAGE; i = tdp_mmu_iter_step_side(i, &child_iter)) {
  1308			WARN_ON_ONCE(child_iter.level != PG_LEVEL_4K);
  1309			if (is_shadow_present_pte(child_iter.old_spte)) {
  1310				/* TODO: relocate page for huge page. */
  1311				if (WARN_ON_ONCE(spte_to_pfn(child_iter.old_spte) !=
  1312						 spte_to_pfn(new_spte) + i)) {
  1313					ret = -EAGAIN;
  1314					ret_pf_retry = true;
  1315				}
  1316				/*
  1317				 * When SEPT_VE_DISABLE=true and the page state is
  1318				 * pending, this case can happen.  Just resume the vcpu
  1319				 * again with the expectation for other vcpu to accept
  1320				 * this page.
  1321				 */
  1322				if (child_iter.gfn == fault->gfn) {
  1323					ret = -EAGAIN;
  1324					ret_pf_retry = true;
  1325					break;
  1326				}
  1327				continue;
  1328			}
  1329	
  1330			WARN_ON_ONCE(spte_to_pfn(child_iter.old_spte) != spte_to_pfn(new_spte) + i);
  1331			child_spte = make_huge_page_split_spte(kvm, new_spte, child_sp->role, i);
  1332			/*
  1333			 * Because other thread may have started to operate on this spte
  1334			 * before freezing the parent spte,  Use atomic version to
  1335			 * prevent race.
  1336			 */
  1337			ret = tdp_mmu_set_spte_atomic(vcpu->kvm, &child_iter, child_spte);
  1338			if (ret == -EBUSY || ret == -EAGAIN)
  1339				/*
  1340				 * There was a race condition.  Populate remaining 4K
  1341				 * spte to resolve fault->gfn to guarantee the forward
  1342				 * progress.
  1343				 */
  1344				ret_pf_retry = true;
  1345			else if (ret)
  1346				goto out;
  1347		}
  1348		if (ret_pf_retry)
  1349			goto out;
  1350	
  1351		/* Prevent the Secure-EPT entry from being used. */
  1352		ret = static_call(kvm_x86_zap_private_spte)(kvm, gfn, level);
  1353		if (ret)
  1354			goto out;
  1355		kvm_flush_remote_tlbs_range(kvm, gfn & KVM_HPAGE_GFN_MASK(level),
  1356					    KVM_PAGES_PER_HPAGE(level));
  1357	
  1358		/* Merge pages into a large page. */
  1359		ret = static_call(kvm_x86_merge_private_spt)(kvm, gfn, level,
  1360							     kvm_mmu_private_spt(child_sp));
  1361		/*
  1362		 * Failed to merge pages because some pages are accepted and some are
  1363		 * pending.  Since the child page was mapped above, let vcpu run.
  1364		 */
  1365		if (ret) {
  1366			if (static_call(kvm_x86_unzap_private_spte)(kvm, gfn, level))
  1367				old_spte = SHADOW_NONPRESENT_VALUE |
  1368					(spte_to_pfn(old_spte) << PAGE_SHIFT) |
  1369					PT_PAGE_SIZE_MASK;
  1370			goto out;
  1371		}
  1372	
  1373		/* Unfreeze spte. */
  1374		iter->old_spte = new_spte;
> 1375		__kvm_tdp_mmu_write_spte(sptep, new_spte);
  1376	
  1377		/*
  1378		 * Free unused child sp.  Secure-EPT page was already freed at TDX level
  1379		 * by kvm_x86_merge_private_spt().
  1380		 */
  1381		tdp_unaccount_mmu_page(kvm, child_sp);
  1382		tdp_mmu_free_sp(child_sp);
  1383		return -EAGAIN;
  1384	
  1385	out:
  1386		iter->old_spte = old_spte;
  1387		__kvm_tdp_mmu_write_spte(sptep, old_spte);
  1388		return ret;
  1389	}
  1390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
