Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693101A238B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733750317; cv=none; b=W1rwvkOS4fBJatEIWAjZ92HqN3wC57ym3CRVcFx3U5/eMWF383YzJS0QMZ2NmMaLczhfufXhnwHpeJNUPUA6l2u7iNpQGXWO51FBFJgBfiaPJay4nSzb+IPwqAS/pjXMdfI2HddYSNk1K7Eo2XtPx05rmbv/f6Tl+UPmLlKGpA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733750317; c=relaxed/simple;
	bh=gJm2W6/4KoVBvifM8oosOfBVPVQRRbKxBXvrAet/oHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NCFTIKtaTaPKfvT9QpW89pBltv+PylLjOOdlhLNyFuhLzmgnqpqGw1gDmgUdRoB9cwfP/YDreqPL2vcFs0YJcOzEvEe1qQO8F6mWDkPjWSGPc7lva364Bi4ldY7y/Fw5A0UbHdMO65/ubolwmHMy6KgTDv22AABAib+bK0zQxNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ham8g7Lq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ham8g7Lq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733750316; x=1765286316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gJm2W6/4KoVBvifM8oosOfBVPVQRRbKxBXvrAet/oHM=;
  b=Ham8g7LqlSx3thLtyMeTcO5+HR8qT63Qqh6+IzeIjoSGU3qNzVkUMdM5
   SdyHQL++qUs3xjAO+wsBsCXATiEbrC889VPeSTZUyGOlxM9e456oqb8oG
   UWWKZEORhjNVXL1JLDBycWzsIM2rKDA2qWn7oJwE1p/53Kw7KsPuq+VQw
   c/c+y/qaNKPzwQUFeozveQX5u0C2rn7n25BVG8SE5X/T+PYApQB/Fqz8u
   5ap0T5kKyqa+A72rMtJLLHVeJXVy/NEfaMcUBBIZCvtM2vCJ8IYiW/baO
   MOeZ9Mv1As4Pqsi6Lfbx0O68zIyeZQtYhG0zIP57qEQZzgZV0l40ZvEVL
   w==;
X-CSE-ConnectionGUID: cv/s/EFXRWWSkMT5dc7cJw==
X-CSE-MsgGUID: xA0TXKTeSlWUaEnjYQ52Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="21635554"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="21635554"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 05:18:35 -0800
X-CSE-ConnectionGUID: jOHj8tLLQVeaC+36fwzJbQ==
X-CSE-MsgGUID: Nt5IsXFNQbCXPvDEnlJFOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="132446697"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Dec 2024 05:18:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKdeh-0004MT-1y;
	Mon, 09 Dec 2024 13:18:31 +0000
Date: Mon, 9 Dec 2024 21:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:proposed-fixes-6.13 17/28] fs/xfs/xfs_trans.c:869:40:
 error: macro "xfs_trans_apply_dquot_deltas" requires 2 arguments, but only 1
 given
Message-ID: <202412092114.r0hDvOHz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git proposed-fixes-6.13
head:   8d401a19ce541ebf4bedb34ad2d838c8cf4ecef6
commit: 33459986badab198566fc6063378dfb6c3281644 [17/28] xfs: don't lose solo dquot update transactions
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20241209/202412092114.r0hDvOHz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412092114.r0hDvOHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412092114.r0hDvOHz-lkp@intel.com/

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
   923		xfs_trans_unreserve_and_mod_dquots(tp, true);
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
