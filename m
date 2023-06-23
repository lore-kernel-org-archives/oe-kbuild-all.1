Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C580A31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 07:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687504683; x=1719040683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GoYtdsW28jnf4PwVxH1W2c1JuZDB4tWxT/m3EBYQKXI=;
  b=OXmJ68X+5WUPD3XxZDsRcJ14G5gFdRxlekbYEvxirwL222s/FdjsdeiF
   tc4xd5u+9/oAdhKhyLD+vudWvBaKXRjp6Ne+DgWEQ+sKJw+Oy5vc2hAra
   +FKGS5T2VMlnYkcuCj8pHTmzv0UU10KjaVWKBNPNKBXoWwY4J1GKZr6SX
   b8+ta9GrUAQthPXrR6hPJTkSaAxNqYN7JhmCR9FKV7Kq8Zx8WBiNZ9O+5
   dJXngDaL6ilcAzl5vMduvl0n0rdOWMqD6tWsAq1Cw4++Tfgb7A5IAr7G1
   7IuYyrE4iZPH8VW6tthGfiVZImzOr1XS1rU5XYtzk1T11400KEvaQNN/W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="358197899"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="358197899"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 00:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="889382381"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="889382381"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Jun 2023 00:18:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCb3Q-00084d-1D;
	Fri, 23 Jun 2023 07:18:00 +0000
Date: Fri, 23 Jun 2023 15:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 35/202] fs/xfs/scrub/scrub.c:527:25:
 error: implicit declaration of function 'xchk_stats_elapsed_ns'; did you
 mean 'xchk_stats_elapsed_ms'?
Message-ID: <202306231518.bvtiv2LO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   9f2fc0e8ef147d9fd9c6af47c4ab87427e0d2d19
commit: 5368138492f38c80081b9f8d5fab01f72d755435 [35/202] xfs: track usage statistics of online fsck
config: sparc-randconfig-c043-20230623 (https://download.01.org/0day-ci/archive/20230623/202306231518.bvtiv2LO-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231518.bvtiv2LO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231518.bvtiv2LO-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/scrub.c: In function 'xfs_scrub_metadata':
>> fs/xfs/scrub/scrub.c:527:25: error: implicit declaration of function 'xchk_stats_elapsed_ns'; did you mean 'xchk_stats_elapsed_ms'? [-Werror=implicit-function-declaration]
     527 |         run.scrub_ns += xchk_stats_elapsed_ns(check_start);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         xchk_stats_elapsed_ms
   cc1: some warnings being treated as errors


vim +527 fs/xfs/scrub/scrub.c

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
