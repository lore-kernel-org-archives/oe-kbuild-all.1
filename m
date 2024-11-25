Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8693A35
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 11:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732534367; cv=none; b=gAo0VsAIow/iGddPhC4OMJVnIJyLaabdkSOQ9DiJXUKTIJYMeWL6ESSLel8icgZxYJAz1XPQas1cWs5NRqll7RJwPHiVLEvEF6xaDZbHDODljXBUkGkDsc6JfcUaKbfKOcXaALnViFSGgq9q1JdLEaeV9mu9zB9F2ocfcu4x27k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732534367; c=relaxed/simple;
	bh=oUALkkZMpYd5ICUfvH67j8v1lJuerrF7ruwRUxasPig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s8Q2Ca6p8CZ0/KGRAUx7L44c1mrytW7r0Gk0deNlnkiE2b0XzfWyWxo0kGCaohQBDulQYelJBPTPvvq+obmbrkLzXk1JzNieKJjSY360jxs9MZSq/Sxp3EterVUCVgmNMO2Vfg/ot0A7B4Ls+2z1VLMpJquDc7/exWdL+ATXPSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvjgB3+a; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvjgB3+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732534365; x=1764070365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oUALkkZMpYd5ICUfvH67j8v1lJuerrF7ruwRUxasPig=;
  b=JvjgB3+aFKGz46h+BM40kmpxH4Do9PUYDN3ijb10Nn2hMO2oQs79THEv
   D2S6z9W6elfPXYW4djmx9j4o0268atj6sgbGRXyqRnYLpZSGF8Dpmb/CX
   Zoha9+yGQGDlr66B09G+tNXOKeDVd6eFhXJKQOqS+QD0GIsxOcis3ZnRB
   yRdVWKaYTc0cj/pC0NmIWyFxCQgvw0ywLj1WFGMyVVeOx0hxZYFD3r45v
   FL6capMwvpzLoSYPq9WVZqtaSdroYcmKxl8hlGfNpKYQBVyJRY5tlX3rF
   4u6I5BJDvzz/+Ty8Esf+tXIdSGoBXA2GVqidMenNdIX8hcOIQ4gM4QuO1
   g==;
X-CSE-ConnectionGUID: 25FBIBlaRUuaNPzXcJYe7A==
X-CSE-MsgGUID: bOskwVoNTqOrbIfL7rdRkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="55138661"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="55138661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 03:32:45 -0800
X-CSE-ConnectionGUID: Aeo7omriTcC1QkAVyT8R5Q==
X-CSE-MsgGUID: jW3mGJMtT1umRnX864hGiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="128757363"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2024 03:32:44 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFXKb-0006Ev-2O;
	Mon, 25 Nov 2024 11:32:41 +0000
Date: Mon, 25 Nov 2024 19:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-6.13-fixes 156/160] fs/xfs/xfs_trans.c:869:33:
 error: too few arguments provided to function-like macro invocation
Message-ID: <202411251931.U84iuZFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-6.13-fixes
head:   90f5ef1b89eb33844fc8254ba587ba0616c0bf26
commit: 12c0ebae7d6efa377d39c04dd2e1d8de42cc3e61 [156/160] xfs: don't lose solo dquot update transactions
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241125/202411251931.U84iuZFY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251931.U84iuZFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251931.U84iuZFY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/xfs/xfs_trans.c:7:
   In file included from fs/xfs/xfs.h:26:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_trans.c:869:33: error: too few arguments provided to function-like macro invocation
     869 |         xfs_trans_apply_dquot_deltas(tp);
         |                                        ^
   fs/xfs/xfs_quota.h:176:9: note: macro 'xfs_trans_apply_dquot_deltas' defined here
     176 | #define xfs_trans_apply_dquot_deltas(tp, a)
         |         ^
>> fs/xfs/xfs_trans.c:869:2: error: use of undeclared identifier 'xfs_trans_apply_dquot_deltas'; did you mean 'xfs_trans_apply_sb_deltas'?
     869 |         xfs_trans_apply_dquot_deltas(tp);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_trans_apply_sb_deltas
   fs/xfs/xfs_trans.c:485:1: note: 'xfs_trans_apply_sb_deltas' declared here
     485 | xfs_trans_apply_sb_deltas(
         | ^
>> fs/xfs/xfs_trans.c:923:41: error: too many arguments provided to function-like macro invocation
     923 |         xfs_trans_unreserve_and_mod_dquots(tp, true);
         |                                                ^
   fs/xfs/xfs_quota.h:177:9: note: macro 'xfs_trans_unreserve_and_mod_dquots' defined here
     177 | #define xfs_trans_unreserve_and_mod_dquots(tp)
         |         ^
>> fs/xfs/xfs_trans.c:923:2: error: use of undeclared identifier 'xfs_trans_unreserve_and_mod_dquots'; did you mean 'xfs_trans_unreserve_and_mod_sb'?
     923 |         xfs_trans_unreserve_and_mod_dquots(tp, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_trans_unreserve_and_mod_sb
   fs/xfs/xfs_trans.c:620:1: note: 'xfs_trans_unreserve_and_mod_sb' declared here
     620 | xfs_trans_unreserve_and_mod_sb(
         | ^
>> fs/xfs/xfs_trans.c:869:2: warning: expression result unused [-Wunused-value]
     869 |         xfs_trans_apply_dquot_deltas(tp);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_trans.c:923:2: warning: expression result unused [-Wunused-value]
     923 |         xfs_trans_unreserve_and_mod_dquots(tp, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_trans.c:1017:41: error: too many arguments provided to function-like macro invocation
    1017 |         xfs_trans_unreserve_and_mod_dquots(tp, false);
         |                                                ^
   fs/xfs/xfs_quota.h:177:9: note: macro 'xfs_trans_unreserve_and_mod_dquots' defined here
     177 | #define xfs_trans_unreserve_and_mod_dquots(tp)
         |         ^
   fs/xfs/xfs_trans.c:1017:2: error: use of undeclared identifier 'xfs_trans_unreserve_and_mod_dquots'; did you mean 'xfs_trans_unreserve_and_mod_sb'?
    1017 |         xfs_trans_unreserve_and_mod_dquots(tp, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_trans_unreserve_and_mod_sb
   fs/xfs/xfs_trans.c:620:1: note: 'xfs_trans_unreserve_and_mod_sb' declared here
     620 | xfs_trans_unreserve_and_mod_sb(
         | ^
   fs/xfs/xfs_trans.c:1017:2: warning: expression result unused [-Wunused-value]
    1017 |         xfs_trans_unreserve_and_mod_dquots(tp, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 6 errors generated.


vim +869 fs/xfs/xfs_trans.c

   837	
   838	/*
   839	 * Commit the given transaction to the log.
   840	 *
   841	 * XFS disk error handling mechanism is not based on a typical
   842	 * transaction abort mechanism. Logically after the filesystem
   843	 * gets marked 'SHUTDOWN', we can't let any new transactions
   844	 * be durable - ie. committed to disk - because some metadata might
   845	 * be inconsistent. In such cases, this returns an error, and the
   846	 * caller may assume that all locked objects joined to the transaction
   847	 * have already been unlocked as if the commit had succeeded.
   848	 * Do not reference the transaction structure after this call.
   849	 */
   850	static int
   851	__xfs_trans_commit(
   852		struct xfs_trans	*tp,
   853		bool			regrant)
   854	{
   855		struct xfs_mount	*mp = tp->t_mountp;
   856		struct xlog		*log = mp->m_log;
   857		xfs_csn_t		commit_seq = 0;
   858		int			error = 0;
   859		int			sync = tp->t_flags & XFS_TRANS_SYNC;
   860	
   861		trace_xfs_trans_commit(tp, _RET_IP_);
   862	
   863		/*
   864		 * Commit per-transaction changes that are not already tracked through
   865		 * log items.  This can add dirty log items to the transaction.
   866		 */
   867		if (tp->t_flags & XFS_TRANS_SB_DIRTY)
   868			xfs_trans_apply_sb_deltas(tp);
 > 869		xfs_trans_apply_dquot_deltas(tp);
   870	
   871		error = xfs_trans_run_precommits(tp);
   872		if (error)
   873			goto out_unreserve;
   874	
   875		/*
   876		 * If there is nothing to be logged by the transaction,
   877		 * then unlock all of the items associated with the
   878		 * transaction and free the transaction structure.
   879		 * Also make sure to return any reserved blocks to
   880		 * the free pool.
   881		 */
   882		if (!(tp->t_flags & XFS_TRANS_DIRTY))
   883			goto out_unreserve;
   884	
   885		/*
   886		 * We must check against log shutdown here because we cannot abort log
   887		 * items and leave them dirty, inconsistent and unpinned in memory while
   888		 * the log is active. This leaves them open to being written back to
   889		 * disk, and that will lead to on-disk corruption.
   890		 */
   891		if (xlog_is_shutdown(log)) {
   892			error = -EIO;
   893			goto out_unreserve;
   894		}
   895	
   896		ASSERT(tp->t_ticket != NULL);
   897	
   898		xlog_cil_commit(log, tp, &commit_seq, regrant);
   899	
   900		xfs_trans_free(tp);
   901	
   902		/*
   903		 * If the transaction needs to be synchronous, then force the
   904		 * log out now and wait for it.
   905		 */
   906		if (sync) {
   907			error = xfs_log_force_seq(mp, commit_seq, XFS_LOG_SYNC, NULL);
   908			XFS_STATS_INC(mp, xs_trans_sync);
   909		} else {
   910			XFS_STATS_INC(mp, xs_trans_async);
   911		}
   912	
   913		return error;
   914	
   915	out_unreserve:
   916		xfs_trans_unreserve_and_mod_sb(tp);
   917	
   918		/*
   919		 * It is indeed possible for the transaction to be not dirty but
   920		 * the dqinfo portion to be.  All that means is that we have some
   921		 * (non-persistent) quota reservations that need to be unreserved.
   922		 */
 > 923		xfs_trans_unreserve_and_mod_dquots(tp, true);
   924		if (tp->t_ticket) {
   925			if (regrant && !xlog_is_shutdown(log))
   926				xfs_log_ticket_regrant(log, tp->t_ticket);
   927			else
   928				xfs_log_ticket_ungrant(log, tp->t_ticket);
   929			tp->t_ticket = NULL;
   930		}
   931		xfs_trans_free_items(tp, !!error);
   932		xfs_trans_free(tp);
   933	
   934		XFS_STATS_INC(mp, xs_trans_empty);
   935		return error;
   936	}
   937	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
