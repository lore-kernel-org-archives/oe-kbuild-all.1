Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3373644
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 05:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689139242; x=1720675242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lIC39Wg59BAyZCRMzfPgaSz0QYglD7BkHSEXSmxAyCI=;
  b=UnJbHpAyjuckE34tVcxPRpK92JPc5PANd/O2lQw1Qu/Ud21qB5E87crg
   LHEh7Jmw8uTwmAKJobknI8X1+A4ec2HOCdPrh0vs+EubNJIeD7m0To6xt
   rbE/Y7cYWU+L/zmJlLJ4eI8sLtPyDjWund8K4yaaQLSuu2BIYRuqurvvY
   IGY+U8MalvnIV0UZHV77qpprRc36kfEmsCNMvJlIiU0keY7f/AFfIzk2Z
   5/DBIF2ZA4fvL6irVfKpWNBxFtzZmNttbijrGlhBxrVECn9pBrcDgRmr+
   yQBVCwAVacQ6tmOH/CnQG9MlJudGSNUuFbvMWDbQ0ILQuyWEf1wbjRwJe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="345116936"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="345116936"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 22:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834986915"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="834986915"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 22:20:40 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJSHI-0005PB-0H;
	Wed, 12 Jul 2023 05:20:40 +0000
Date: Wed, 12 Jul 2023 13:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 49/219] fs/xfs/scrub/scrub.c:527:18:
 error: call to undeclared function 'xchk_stats_elapsed_ns'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202307121305.dxbBqead-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   f1829956dc4905fa58fc02ea84b6a020e3f5a7c8
commit: 613443e2e3831d4b3da1a8b0c3a2abd3d420ac5a [49/219] xfs: track usage statistics of online fsck
config: x86_64-randconfig-r024-20230712 (https://download.01.org/0day-ci/archive/20230712/202307121305.dxbBqead-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121305.dxbBqead-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121305.dxbBqead-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/scrub/scrub.c:527:18: error: call to undeclared function 'xchk_stats_elapsed_ns'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           run.scrub_ns += xchk_stats_elapsed_ns(check_start);
                           ^
   1 error generated.


vim +/xchk_stats_elapsed_ns +527 fs/xfs/scrub/scrub.c

   460	
   461	/* Dispatch metadata scrubbing. */
   462	int
   463	xfs_scrub_metadata(
   464		struct file			*file,
   465		struct xfs_scrub_metadata	*sm)
   466	{
   467		struct xchk_stats_run		run = { };
   468		struct xfs_scrub		*sc;
   469		struct xfs_mount		*mp = XFS_I(file_inode(file))->i_mount;
   470		u64				check_start;
   471		int				error = 0;
   472	
   473		BUILD_BUG_ON(sizeof(meta_scrub_ops) !=
   474			(sizeof(struct xchk_meta_ops) * XFS_SCRUB_TYPE_NR));
   475	
   476		trace_xchk_start(XFS_I(file_inode(file)), sm, error);
   477	
   478		/* Forbidden if we are shut down or mounted norecovery. */
   479		error = -ESHUTDOWN;
   480		if (xfs_is_shutdown(mp))
   481			goto out;
   482		error = -ENOTRECOVERABLE;
   483		if (xfs_has_norecovery(mp))
   484			goto out;
   485	
   486		error = xchk_validate_inputs(mp, sm);
   487		if (error)
   488			goto out;
   489	
   490		xfs_warn_mount(mp, XFS_OPSTATE_WARNED_SCRUB,
   491	 "EXPERIMENTAL online scrub feature in use. Use at your own risk!");
   492	
   493		sc = kzalloc(sizeof(struct xfs_scrub), XCHK_GFP_FLAGS);
   494		if (!sc) {
   495			error = -ENOMEM;
   496			goto out;
   497		}
   498	
   499		sc->mp = mp;
   500		sc->file = file;
   501		sc->sm = sm;
   502		sc->ops = &meta_scrub_ops[sm->sm_type];
   503		sc->sick_mask = xchk_health_mask_for_scrub_type(sm->sm_type);
   504	retry_op:
   505		/*
   506		 * When repairs are allowed, prevent freezing or readonly remount while
   507		 * scrub is running with a real transaction.
   508		 */
   509		if (sm->sm_flags & XFS_SCRUB_IFLAG_REPAIR) {
   510			error = mnt_want_write_file(sc->file);
   511			if (error)
   512				goto out_sc;
   513		}
   514	
   515		/* Set up for the operation. */
   516		error = sc->ops->setup(sc);
   517		if (error == -EDEADLOCK && !(sc->flags & XCHK_TRY_HARDER))
   518			goto try_harder;
   519		if (error == -ECHRNG && !(sc->flags & XCHK_NEED_DRAIN))
   520			goto need_drain;
   521		if (error)
   522			goto out_teardown;
   523	
   524		/* Scrub for errors. */
   525		check_start = xchk_stats_now();
   526		error = sc->ops->scrub(sc);
 > 527		run.scrub_ns += xchk_stats_elapsed_ns(check_start);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
