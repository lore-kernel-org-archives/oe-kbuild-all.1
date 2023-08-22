Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F13E1D2E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692719735; x=1724255735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RUKMXtznuNCvnoUNuSmWOXxzG9TFNolKomsWs02BDbI=;
  b=J+UADNIgVBXt/vOT7ybPYNcZ8FBa+AnCyBebTJtFGk4cbycQSL0sg8CK
   ikDYYWDcMGLzbKbgnG+JrrQxAQ2dwdb0atWQ0VM2GddhMFvGmmK+Str1S
   5Lt1wCS4pj3VplX4TLJJWRP5Zzceat3XOOTpTqyWywvYuK1PUMhiBG0yQ
   wSZj4BJXC4QhXsho+IPg6/iqjbLUYxMUX5PA/QCjP4i7beP4b4aetuiQ3
   viq4Q1ZwBKlm4UFMgCTe2KdTSBD6XKC0LHDpwS3zLUp7bPMIoGmFqvNFU
   z/iJVPGfNQ8BRFboxGuVFl0456iQ7Z3DyhXf7NPjbsXNn8aLJffJr8uD7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437849488"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="437849488"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 08:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806340119"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="806340119"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 08:55:33 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYTjA-0000JJ-1p;
	Tue, 22 Aug 2023 15:55:32 +0000
Date: Tue, 22 Aug 2023 23:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:rmap-intent-cleanups 328/407]
 fs/xfs/scrub/scrub.c:456:13: error: use of undeclared identifier
 'xrep_metapath'; did you mean 'xchk_metapath'?
Message-ID: <202308222316.V0bhmakd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rmap-intent-cleanups
head:   55b33d3f7a00cf89ee5c47dba0a8c0ffe7f1f8bb
commit: 1b1c381ff9c69418eac56278d08405c379a0233b [328/407] xfs: repair metadata directory file path connectivity
config: x86_64-randconfig-006-20230822 (https://download.01.org/0day-ci/archive/20230822/202308222316.V0bhmakd-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222316.V0bhmakd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222316.V0bhmakd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/scrub/scrub.c:456:13: error: use of undeclared identifier 'xrep_metapath'; did you mean 'xchk_metapath'?
                   .repair = xrep_metapath,
                             ^~~~~~~~~~~~~
                             xchk_metapath
   fs/xfs/scrub/scrub.h:192:5: note: 'xchk_metapath' declared here
   int xchk_metapath(struct xfs_scrub *sc);
       ^
   1 error generated.


vim +456 fs/xfs/scrub/scrub.c

   267	
   268	static const struct xchk_meta_ops meta_scrub_ops[] = {
   269		[XFS_SCRUB_TYPE_PROBE] = {	/* ioctl presence test */
   270			.type	= ST_NONE,
   271			.setup	= xchk_setup_fs,
   272			.scrub	= xchk_probe,
   273			.repair = xrep_probe,
   274		},
   275		[XFS_SCRUB_TYPE_SB] = {		/* superblock */
   276			.type	= ST_PERAG,
   277			.setup	= xchk_setup_agheader,
   278			.scrub	= xchk_superblock,
   279			.repair	= xrep_superblock,
   280		},
   281		[XFS_SCRUB_TYPE_AGF] = {	/* agf */
   282			.type	= ST_PERAG,
   283			.setup	= xchk_setup_agheader,
   284			.scrub	= xchk_agf,
   285			.repair	= xrep_agf,
   286		},
   287		[XFS_SCRUB_TYPE_AGFL]= {	/* agfl */
   288			.type	= ST_PERAG,
   289			.setup	= xchk_setup_agheader,
   290			.scrub	= xchk_agfl,
   291			.repair	= xrep_agfl,
   292		},
   293		[XFS_SCRUB_TYPE_AGI] = {	/* agi */
   294			.type	= ST_PERAG,
   295			.setup	= xchk_setup_agheader,
   296			.scrub	= xchk_agi,
   297			.repair	= xrep_agi,
   298		},
   299		[XFS_SCRUB_TYPE_BNOBT] = {	/* bnobt */
   300			.type	= ST_PERAG,
   301			.setup	= xchk_setup_ag_allocbt,
   302			.scrub	= xchk_bnobt,
   303			.repair	= xrep_allocbt,
   304			.repair_eval = xrep_revalidate_allocbt,
   305		},
   306		[XFS_SCRUB_TYPE_CNTBT] = {	/* cntbt */
   307			.type	= ST_PERAG,
   308			.setup	= xchk_setup_ag_allocbt,
   309			.scrub	= xchk_cntbt,
   310			.repair	= xrep_allocbt,
   311			.repair_eval = xrep_revalidate_allocbt,
   312		},
   313		[XFS_SCRUB_TYPE_INOBT] = {	/* inobt */
   314			.type	= ST_PERAG,
   315			.setup	= xchk_setup_ag_iallocbt,
   316			.scrub	= xchk_inobt,
   317			.repair	= xrep_iallocbt,
   318			.repair_eval = xrep_revalidate_iallocbt,
   319		},
   320		[XFS_SCRUB_TYPE_FINOBT] = {	/* finobt */
   321			.type	= ST_PERAG,
   322			.setup	= xchk_setup_ag_iallocbt,
   323			.scrub	= xchk_finobt,
   324			.has	= xfs_has_finobt,
   325			.repair	= xrep_iallocbt,
   326			.repair_eval = xrep_revalidate_iallocbt,
   327		},
   328		[XFS_SCRUB_TYPE_RMAPBT] = {	/* rmapbt */
   329			.type	= ST_PERAG,
   330			.setup	= xchk_setup_ag_rmapbt,
   331			.scrub	= xchk_rmapbt,
   332			.has	= xfs_has_rmapbt,
   333			.repair	= xrep_rmapbt,
   334		},
   335		[XFS_SCRUB_TYPE_REFCNTBT] = {	/* refcountbt */
   336			.type	= ST_PERAG,
   337			.setup	= xchk_setup_ag_refcountbt,
   338			.scrub	= xchk_refcountbt,
   339			.has	= xfs_has_reflink,
   340			.repair	= xrep_refcountbt,
   341		},
   342		[XFS_SCRUB_TYPE_INODE] = {	/* inode record */
   343			.type	= ST_INODE,
   344			.setup	= xchk_setup_inode,
   345			.scrub	= xchk_inode,
   346			.repair	= xrep_inode,
   347		},
   348		[XFS_SCRUB_TYPE_BMBTD] = {	/* inode data fork */
   349			.type	= ST_INODE,
   350			.setup	= xchk_setup_inode_bmap,
   351			.scrub	= xchk_bmap_data,
   352			.repair	= xrep_bmap_data,
   353		},
   354		[XFS_SCRUB_TYPE_BMBTA] = {	/* inode attr fork */
   355			.type	= ST_INODE,
   356			.setup	= xchk_setup_inode_bmap,
   357			.scrub	= xchk_bmap_attr,
   358			.repair	= xrep_bmap_attr,
   359		},
   360		[XFS_SCRUB_TYPE_BMBTC] = {	/* inode CoW fork */
   361			.type	= ST_INODE,
   362			.setup	= xchk_setup_inode_bmap,
   363			.scrub	= xchk_bmap_cow,
   364			.repair	= xrep_bmap_cow,
   365		},
   366		[XFS_SCRUB_TYPE_DIR] = {	/* directory */
   367			.type	= ST_INODE,
   368			.setup	= xchk_setup_directory,
   369			.scrub	= xchk_directory,
   370			.repair	= xrep_directory,
   371		},
   372		[XFS_SCRUB_TYPE_XATTR] = {	/* extended attributes */
   373			.type	= ST_INODE,
   374			.setup	= xchk_setup_xattr,
   375			.scrub	= xchk_xattr,
   376			.repair	= xrep_xattr,
   377		},
   378		[XFS_SCRUB_TYPE_SYMLINK] = {	/* symbolic link */
   379			.type	= ST_INODE,
   380			.setup	= xchk_setup_symlink,
   381			.scrub	= xchk_symlink,
   382			.repair	= xrep_symlink,
   383		},
   384		[XFS_SCRUB_TYPE_PARENT] = {	/* parent pointers */
   385			.type	= ST_INODE,
   386			.setup	= xchk_setup_parent,
   387			.scrub	= xchk_parent,
   388			.repair	= xrep_parent,
   389		},
   390		[XFS_SCRUB_TYPE_RTBITMAP] = {	/* realtime bitmap */
   391			.type	= ST_FS,
   392			.setup	= xchk_setup_rtbitmap,
   393			.scrub	= xchk_rtbitmap,
   394			.repair	= xrep_rtbitmap,
   395		},
   396		[XFS_SCRUB_TYPE_RTSUM] = {	/* realtime summary */
   397			.type	= ST_FS,
   398			.setup	= xchk_setup_rtsummary,
   399			.scrub	= xchk_rtsummary,
   400			.repair	= xrep_rtsummary,
   401		},
   402		[XFS_SCRUB_TYPE_UQUOTA] = {	/* user quota */
   403			.type	= ST_FS,
   404			.setup	= xchk_setup_quota,
   405			.scrub	= xchk_quota,
   406			.repair	= xrep_quota,
   407		},
   408		[XFS_SCRUB_TYPE_GQUOTA] = {	/* group quota */
   409			.type	= ST_FS,
   410			.setup	= xchk_setup_quota,
   411			.scrub	= xchk_quota,
   412			.repair	= xrep_quota,
   413		},
   414		[XFS_SCRUB_TYPE_PQUOTA] = {	/* project quota */
   415			.type	= ST_FS,
   416			.setup	= xchk_setup_quota,
   417			.scrub	= xchk_quota,
   418			.repair	= xrep_quota,
   419		},
   420		[XFS_SCRUB_TYPE_FSCOUNTERS] = {	/* fs summary counters */
   421			.type	= ST_FS,
   422			.setup	= xchk_setup_fscounters,
   423			.scrub	= xchk_fscounters,
   424			.repair	= xrep_fscounters,
   425		},
   426		[XFS_SCRUB_TYPE_QUOTACHECK] = {	/* quota counters */
   427			.type	= ST_FS,
   428			.setup	= xchk_setup_quotacheck,
   429			.scrub	= xchk_quotacheck,
   430			.repair	= xrep_quotacheck,
   431		},
   432		[XFS_SCRUB_TYPE_NLINKS] = {	/* inode link counts */
   433			.type	= ST_FS,
   434			.setup	= xchk_setup_nlinks,
   435			.scrub	= xchk_nlinks,
   436			.repair	= xrep_nlinks,
   437		},
   438		[XFS_SCRUB_TYPE_HEALTHY] = {	/* fs healthy; clean all reminders */
   439			.type	= ST_FS,
   440			.setup	= xchk_setup_fs,
   441			.scrub	= xchk_health_record,
   442			.repair = xrep_notsupported,
   443		},
   444		[XFS_SCRUB_TYPE_DIRTREE] = {	/* directory tree structure */
   445			.type	= ST_INODE,
   446			.setup	= xchk_setup_dirtree,
   447			.scrub	= xchk_dirtree,
   448			.has	= xfs_has_parent,
   449			.repair	= xrep_dirtree,
   450		},
   451		[XFS_SCRUB_TYPE_METAPATH] = {	/* metadata directory tree path */
   452			.type	= ST_GENERIC,
   453			.setup	= xchk_setup_metapath,
   454			.scrub	= xchk_metapath,
   455			.has	= xfs_has_metadir,
 > 456			.repair	= xrep_metapath,
   457		},
   458	};
   459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
