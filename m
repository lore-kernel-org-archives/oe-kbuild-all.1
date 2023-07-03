Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8B11CA8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 21:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688420547; x=1719956547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpWsht9Dc58k59JyJJWEzjIV6OH6ImlMoqEbeOO1zVM=;
  b=QNyR/Drq4StKsAcHOCtDB8WOwLNgMzhGl/t5uszeZmwR2F190pwjw+Nr
   B5BNVDN3+hNE+1gA+HwkuA96RF18NUJjw+qsDCEDiRDeEFGdYOagcRTvy
   zxrFOgDIbSlAWm/LaC6zesheoB4f0GAcKrn/1VgBDMvmIYnhTs3+XA2Iz
   je4QAljRBUur3MyM9MYdwDn7rCo2QnLMEB+c/WrkypVpZSqivh5DeAxKn
   9XtuwHITolce9TfW43n+2UXmXgeXrpSHZvY3gWOumw+JsgC2psfg5RrME
   vb1e6AkKBiwvgDhX7K51gGSnW1ayZlKfdpGct+Plks1qTN+5ppOroRaO9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="342561900"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="342561900"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 14:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="842769836"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="842769836"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Jul 2023 14:42:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGRJQ-000Hfn-05;
	Mon, 03 Jul 2023 21:42:24 +0000
Date: Tue, 4 Jul 2023 05:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 203/217]
 fs/xfs/scrub/dir_repair.c:642:41: warning: unused variable 'ino'
Message-ID: <202307040529.GE6mjSZd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   c0ed27a65e17a5d3db3a6e2a4df60d4642524c8c
commit: 971ead598ffdc2c27849ce0a67d6600f17264b0d [203/217] xfs: online repair of directories
config: i386-randconfig-i005-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040529.GE6mjSZd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040529.GE6mjSZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040529.GE6mjSZd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/scrub/dir_repair.c: In function 'xrep_dir_replay_update':
>> fs/xfs/scrub/dir_repair.c:642:41: warning: unused variable 'ino' [-Wunused-variable]
     642 |         xfs_ino_t                       ino;
         |                                         ^~~


vim +/ino +642 fs/xfs/scrub/dir_repair.c

   625	
   626	/*
   627	 * Add this stashed incore directory entry to the temporary directory.
   628	 * The caller must hold the tempdir's IOLOCK, must not hold any ILOCKs, and
   629	 * must not be in transaction context.
   630	 */
   631	STATIC int
   632	xrep_dir_replay_update(
   633		struct xrep_dir			*rd,
   634		const struct xrep_dirent	*dirent)
   635	{
   636		struct xfs_name			name = {
   637			.len			= dirent->namelen,
   638			.type			= dirent->ftype,
   639			.name			= rd->namebuf,
   640		};
   641		struct xfs_mount		*mp = rd->sc->mp;
 > 642		xfs_ino_t			ino;
   643		uint				resblks;
   644		int				error;
   645	
   646		resblks = XFS_LINK_SPACE_RES(mp, dirent->namelen);
   647		error = xchk_trans_alloc(rd->sc, resblks);
   648		if (error)
   649			return error;
   650	
   651		/* Lock the temporary directory and join it to the transaction */
   652		xrep_tempfile_ilock(rd->sc);
   653		xfs_trans_ijoin(rd->sc->tp, rd->sc->tempip, 0);
   654	
   655		/*
   656		 * Create a replacement dirent in the temporary directory.  Note that
   657		 * _createname doesn't check for existing entries.  There shouldn't be
   658		 * any in the temporary dir, but we'll verify this in debug mode.
   659		 */
   660	#ifdef DEBUG
   661		error = xchk_dir_lookup(rd->sc, rd->sc->tempip, &name, &ino);
   662		if (error != -ENOENT) {
   663			ASSERT(error != -ENOENT);
   664			goto out_cancel;
   665		}
   666	#endif
   667	
   668		error = xrep_dir_replay_createname(rd, &name, dirent->ino, resblks);
   669		if (error)
   670			goto out_cancel;
   671	
   672		if (name.type == XFS_DIR3_FT_DIR)
   673			rd->subdirs++;
   674		rd->dirents++;
   675	
   676		/* Commit and unlock. */
   677		error = xrep_trans_commit(rd->sc);
   678		if (error)
   679			return error;
   680	
   681		xrep_tempfile_iunlock(rd->sc);
   682		return 0;
   683	out_cancel:
   684		xchk_trans_cancel(rd->sc);
   685		xrep_tempfile_iunlock(rd->sc);
   686		return error;
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
