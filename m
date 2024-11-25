Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28618BBBB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732523537; cv=none; b=UWSQ2p3bEtYU2SR5s86CTZYJjgolqcO8ruUxCuK2XDD0BdlpLc0WOcEYjx3KFqhykg59XceWx41zQdLGYreUFDx1ep5dTnZl86pUe/8YFTrjncl00x7WzkyElxKN31EBya8U8CAtAzI6ChYClyg1GPEv/49ZkIUlrPYJyY66y10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732523537; c=relaxed/simple;
	bh=pxDf5u7zRXbGilAqE+uwMhGJBHhNkH/4QDMkucUpfJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a6FCHzvzvdDHHMhnPMLk1NnNfBdMj1sCOE64nRs+Rl3Ls8U8fbIkeqoQolWtpjS1ytQN2K0JRtM0DjNr7bLjLRec/9ArIWDZsdntIBMboC8Sig4YPhOd5iw41tQIOeocUeezn2x1WpVwhHkTGWVApRQt6gbbDTuYQE9jgE/jpc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=So2I7j4R; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="So2I7j4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732523536; x=1764059536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pxDf5u7zRXbGilAqE+uwMhGJBHhNkH/4QDMkucUpfJ0=;
  b=So2I7j4R0KPu/X31wrHOda58QbTxD/Z2z8QgL4Cu22l1jFpWnGccDacG
   6BvJGTN5EvU1DZk6jjQ47dueJ0QmGAoUYGwgVOOxIGuWQYDTBEu+JGr3K
   kzcS4Tjqb6Evl3KvNIfIbTqIYOYRgfY0MteZOyCN47cbBu6gZu0rEOcW8
   yv3MNPoYi05u9oJXwpO25iygTbOW0a3UNyetjAx0pVf5zEX3IiIjMvJkh
   o2G1/QRkjFtH6uC1+e+5g29r5FNJunvDbu2z5K9Qx/lIwShp65MyIQ8LX
   0/FrKhAmJ9FVS6FKolLyZYn42LaSSD1kZdYVi0L9BsssQTrdnRipFxFzY
   Q==;
X-CSE-ConnectionGUID: qpQKq1TGTMOGtt/flxmvsQ==
X-CSE-MsgGUID: /aE57ks0RGuo6M1ki+NfxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="50026922"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="50026922"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 00:32:15 -0800
X-CSE-ConnectionGUID: Mwtq9hoATbWDlLiPYmiIlw==
X-CSE-MsgGUID: PIkd3Z7QQ8urWbwzkym4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="90825608"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2024 00:32:13 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFUVv-00064r-1K;
	Mon, 25 Nov 2024 08:32:11 +0000
Date: Mon, 25 Nov 2024 16:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-6.13-fixes 156/160] fs/xfs/xfs_trans.c:869:40:
 error: macro "xfs_trans_apply_dquot_deltas" requires 2 arguments, but only 1
 given
Message-ID: <202411251621.paH3UvZ8-lkp@intel.com>
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
config: m68k-bvme6000_defconfig (https://download.01.org/0day-ci/archive/20241125/202411251621.paH3UvZ8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251621.paH3UvZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251621.paH3UvZ8-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_trans.c: In function '__xfs_trans_commit':
>> fs/xfs/xfs_trans.c:869:40: error: macro "xfs_trans_apply_dquot_deltas" requires 2 arguments, but only 1 given
     869 |         xfs_trans_apply_dquot_deltas(tp);
         |                                        ^
   In file included from fs/xfs/xfs_trans.c:15:
   fs/xfs/xfs_quota.h:176:9: note: macro "xfs_trans_apply_dquot_deltas" defined here
     176 | #define xfs_trans_apply_dquot_deltas(tp, a)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_trans.c:869:9: error: 'xfs_trans_apply_dquot_deltas' undeclared (first use in this function); did you mean 'xfs_trans_apply_sb_deltas'?
     869 |         xfs_trans_apply_dquot_deltas(tp);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_trans_apply_sb_deltas
   fs/xfs/xfs_trans.c:869:9: note: each undeclared identifier is reported only once for each function it appears in
>> fs/xfs/xfs_trans.c:923:52: error: macro "xfs_trans_unreserve_and_mod_dquots" passed 2 arguments, but takes just 1
     923 |         xfs_trans_unreserve_and_mod_dquots(tp, true);
         |                                                    ^
   fs/xfs/xfs_quota.h:177:9: note: macro "xfs_trans_unreserve_and_mod_dquots" defined here
     177 | #define xfs_trans_unreserve_and_mod_dquots(tp)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_trans.c:923:9: error: 'xfs_trans_unreserve_and_mod_dquots' undeclared (first use in this function); did you mean 'xfs_trans_unreserve_and_mod_sb'?
     923 |         xfs_trans_unreserve_and_mod_dquots(tp, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_trans_unreserve_and_mod_sb
   fs/xfs/xfs_trans.c: In function 'xfs_trans_cancel':
   fs/xfs/xfs_trans.c:1017:53: error: macro "xfs_trans_unreserve_and_mod_dquots" passed 2 arguments, but takes just 1
    1017 |         xfs_trans_unreserve_and_mod_dquots(tp, false);
         |                                                     ^
   fs/xfs/xfs_quota.h:177:9: note: macro "xfs_trans_unreserve_and_mod_dquots" defined here
     177 | #define xfs_trans_unreserve_and_mod_dquots(tp)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_trans.c:1017:9: error: 'xfs_trans_unreserve_and_mod_dquots' undeclared (first use in this function); did you mean 'xfs_trans_unreserve_and_mod_sb'?
    1017 |         xfs_trans_unreserve_and_mod_dquots(tp, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_trans_unreserve_and_mod_sb


vim +/xfs_trans_apply_dquot_deltas +869 fs/xfs/xfs_trans.c

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
