Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586963AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 04:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0pjMOYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701231221; x=1732767221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OHNuW+WrbH53UJyzOrD8yt7glE+smDlWN1tZK6Xp8Gc=;
  b=P0pjMOYIhDyerz1GOWbg4aUuHdobab3zfADtioh7F1GGZU50A9WVeNjb
   I7swJvk8W3hmPPbawNDb9N/4wJeHtncQ7q70osB0X0wsT4IOjTlOQCr5I
   IpY4DDh33De2bpriEEL0MvlcuUejaNYu15XIkvbbjIal7VVTVC41uhiv1
   B4g/OHqXD1Hxr8vcoiQ936z+FaUKhU8cffbE7Jf+uDXPwRNNAC2stDSq8
   uemyw+mCofT7a7R4qXw+P/kWmbKr/4S0c3IXaGHVsxp8r/MN8bXCNJz9G
   Tbjos6f+z7Q0SY7i4tmIFWucFCyIZ0IWx9qKfrkNyKvX3f30mQOCRDs1T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383483159"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="383483159"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 20:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762155528"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="762155528"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Nov 2023 20:13:39 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8BxB-0008Xb-0K;
	Wed, 29 Nov 2023 04:13:37 +0000
Date: Wed, 29 Nov 2023 12:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:reconstruct-defer-work-6.7 7/7]
 fs/xfs/xfs_log_recover.c:2570:42: warning: unused variable 'lip'
Message-ID: <202311291023.sohqo3Xg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git reconstruct-defer-work-6.7
head:   6b40cbdb0348d7c82b1729fba6d5352da1b949d3
commit: 6b40cbdb0348d7c82b1729fba6d5352da1b949d3 [7/7] xfs: move ->iop_recover to xfs_defer_op_type
config: arm64-randconfig-001-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291023.sohqo3Xg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291023.sohqo3Xg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291023.sohqo3Xg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/xfs_log_recover.c: In function 'xlog_recover_process_intents':
>> fs/xfs/xfs_log_recover.c:2570:42: warning: unused variable 'lip' [-Wunused-variable]
    2570 |                 struct xfs_log_item     *lip = dfp->dfp_intent;
         |                                          ^~~


vim +/lip +2570 fs/xfs/xfs_log_recover.c

97cf79677ecb50 Darrick J. Wong 2022-10-16  2568  
2c9d8d0539d46a Darrick J. Wong 2023-11-22  2569  	list_for_each_entry_safe(dfp, n, &log->l_dfops, dfp_list) {
2c9d8d0539d46a Darrick J. Wong 2023-11-22 @2570  		struct xfs_log_item	*lip = dfp->dfp_intent;
2c9d8d0539d46a Darrick J. Wong 2023-11-22  2571  
2c9d8d0539d46a Darrick J. Wong 2023-11-22  2572  		ASSERT(xlog_item_is_intent(lip));
^1da177e4c3f41 Linus Torvalds  2005-04-16  2573  
^1da177e4c3f41 Linus Torvalds  2005-04-16  2574  		/*
dc42375d5f55d2 Darrick J. Wong 2016-08-03  2575  		 * We should never see a redo item with a LSN higher than
dc42375d5f55d2 Darrick J. Wong 2016-08-03  2576  		 * the last transaction we found in the log at the start
dc42375d5f55d2 Darrick J. Wong 2016-08-03  2577  		 * of recovery.
^1da177e4c3f41 Linus Torvalds  2005-04-16  2578  		 */
dc42375d5f55d2 Darrick J. Wong 2016-08-03  2579  		ASSERT(XFS_LSN_CMP(last_lsn, lip->li_lsn) >= 0);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2580  
509955823cc9cc Darrick J. Wong 2017-11-21  2581  		/*
509955823cc9cc Darrick J. Wong 2017-11-21  2582  		 * NOTE: If your intent processing routine can create more
e6fff81e487089 Darrick J. Wong 2020-09-25  2583  		 * deferred ops, you /must/ attach them to the capture list in
e6fff81e487089 Darrick J. Wong 2020-09-25  2584  		 * the recover routine or else those subsequent intents will be
509955823cc9cc Darrick J. Wong 2017-11-21  2585  		 * replayed in the wrong order!
97cf79677ecb50 Darrick J. Wong 2022-10-16  2586  		 *
b5376f3f0ac5d9 Darrick J. Wong 2023-11-22  2587  		 * The recovery function can free @dfp.
509955823cc9cc Darrick J. Wong 2017-11-21  2588  		 */
6b40cbdb0348d7 Darrick J. Wong 2023-11-22  2589  		error = xfs_defer_finish_recovery(log->l_mp, dfp,
6b40cbdb0348d7 Darrick J. Wong 2023-11-22  2590  				&capture_list);
6b40cbdb0348d7 Darrick J. Wong 2023-11-22  2591  		if (error)
e6fff81e487089 Darrick J. Wong 2020-09-25  2592  			break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2593  	}
e6fff81e487089 Darrick J. Wong 2020-09-25  2594  	if (error)
e6fff81e487089 Darrick J. Wong 2020-09-25  2595  		goto err;
e6fff81e487089 Darrick J. Wong 2020-09-25  2596  
e6fff81e487089 Darrick J. Wong 2020-09-25  2597  	error = xlog_finish_defer_ops(log->l_mp, &capture_list);
e6fff81e487089 Darrick J. Wong 2020-09-25  2598  	if (error)
e6fff81e487089 Darrick J. Wong 2020-09-25  2599  		goto err;
509955823cc9cc Darrick J. Wong 2017-11-21  2600  
e6fff81e487089 Darrick J. Wong 2020-09-25  2601  	return 0;
e6fff81e487089 Darrick J. Wong 2020-09-25  2602  err:
e6fff81e487089 Darrick J. Wong 2020-09-25  2603  	xlog_abort_defer_ops(log->l_mp, &capture_list);
3c1e2bbe5bcdcd David Chinner   2008-04-10  2604  	return error;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2605  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  2606  

:::::: The code at line 2570 was first introduced by commit
:::::: 2c9d8d0539d46aaef01ce12c66839929a145c0fa xfs: use xfs_defer_pending objects to recover intent items

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
