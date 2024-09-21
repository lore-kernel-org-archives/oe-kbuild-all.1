Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64913BBC9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 16:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726937881; cv=none; b=VoXn2kFpEOiMGdaVkpfAXDBBhzbsLlq403EpVPt7212W/uVhVP18zwz+JwwhA5Uu08T9F8eTZ1twgYQ8jmaxhH7VuWwFqa5pvg6HVL8K1OnJ9d3p08X26V/Esivcbfjkal3RDfsRWvNzYNXtI4jy42C3+VwhXvJF5NG/KT9pICE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726937881; c=relaxed/simple;
	bh=DqrfjmQAmIYak7+nwZB4NkoOnUWGfNzm24ilkc1Bw3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=II1UnIC4ll0G4hZ6CBmC7SDdAdqgisy3WA1ZC3erBkKnkPdpJcq/OXspOMEJH9LFVqo6aVr/Ovl6S2gFkkEOE2p8UqTF0DxmtDNAtyeDtWmk8Lsgpl4JyGCP4X7BHUFhJybpT4gzdk41copj6FmIyvMd9wId8gtgh85NQvlC0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2WOSk4p; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2WOSk4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726937879; x=1758473879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqrfjmQAmIYak7+nwZB4NkoOnUWGfNzm24ilkc1Bw3E=;
  b=h2WOSk4p3umur1Nnxd28/ewGSO7NMzcy4t6CGzytM3Qn8p/syG4MVDzH
   a//E/GZe/jgwKjJ8mJBMdPMYAcqOC47EZB8rugdS0RVNW9K2w/vFUpPIP
   E/g0YoHXiEhpQ/Jwr0w3ctZuOx0rsilv8EvG2x3VuJ+mWfJZBzoKpWz0o
   YYc6JkdF/OL1nknrE8xea0+ZbXxUENfLQ79FAVkL+Q9KfsEGkvT6gimep
   s9DdKFvkdNqS9bnGJKdI2hUXSMN5S8X9ACMOTBM4BFdlV/3T5p7un4wxi
   VnU377beV0VlFwUHg2dEiXz5H536ENkeyGSsN4w1RGFWnSEthSGX+GyA5
   g==;
X-CSE-ConnectionGUID: 69mDCfuLTC29KGJd9kupvA==
X-CSE-MsgGUID: b3qXoWw3SDy+MUcKssylTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43448736"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="43448736"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 09:57:58 -0700
X-CSE-ConnectionGUID: zHxtKbk9RJ+qw33iVavV1A==
X-CSE-MsgGUID: TX2NfzsTQTydGJNJspcyAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="75178537"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2024 09:57:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss3Qg-000FcD-32;
	Sat, 21 Sep 2024 16:57:54 +0000
Date: Sun, 22 Sep 2024 00:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:djwong-wtf 113/300] fs/xfs/xfs_mount.c:834:10: error:
 call to undeclared function 'xfs_initialize_rtgroup'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202409220012.Oczqcee7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git djwong-wtf
head:   75b997687eb231c2269caf06c35d90dd5f92e925
commit: 56f8b82a3b69af4ac61f0682e68aa76cf098b288 [113/300] xfs: create incore realtime group structures
config: i386-randconfig-002-20240921 (https://download.01.org/0day-ci/archive/20240922/202409220012.Oczqcee7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220012.Oczqcee7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220012.Oczqcee7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_mount.c:834:10: error: call to undeclared function 'xfs_initialize_rtgroup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     834 |         error = xfs_initialize_rtgroup(mp, 0, sbp->sb_rgcount);
         |                 ^
   fs/xfs/xfs_mount.c:834:10: note: did you mean 'xfs_initialize_perag'?
   fs/xfs/libxfs/xfs_ag.h:145:5: note: 'xfs_initialize_perag' declared here
     145 | int xfs_initialize_perag(struct xfs_mount *mp, xfs_agnumber_t old_agcount,
         |     ^
   1 error generated.
--
>> fs/xfs/xfs_log_recover.c:3409:10: error: call to undeclared function 'xfs_initialize_rtgroup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3409 |         error = xfs_initialize_rtgroup(mp, old_rgcount, sbp->sb_rgcount);
         |                 ^
   fs/xfs/xfs_log_recover.c:3409:10: note: did you mean 'xfs_initialize_perag'?
   fs/xfs/libxfs/xfs_ag.h:145:5: note: 'xfs_initialize_perag' declared here
     145 | int xfs_initialize_perag(struct xfs_mount *mp, xfs_agnumber_t old_agcount,
         |     ^
   1 error generated.


vim +/xfs_initialize_rtgroup +834 fs/xfs/xfs_mount.c

   648	
   649	/*
   650	 * This function does the following on an initial mount of a file system:
   651	 *	- reads the superblock from disk and init the mount struct
   652	 *	- if we're a 32-bit kernel, do a size check on the superblock
   653	 *		so we don't mount terabyte filesystems
   654	 *	- init mount struct realtime fields
   655	 *	- allocate inode hash table for fs
   656	 *	- init directory manager
   657	 *	- perform recovery and init the log manager
   658	 */
   659	int
   660	xfs_mountfs(
   661		struct xfs_mount	*mp)
   662	{
   663		struct xfs_sb		*sbp = &(mp->m_sb);
   664		struct xfs_inode	*rip;
   665		struct xfs_ino_geometry	*igeo = M_IGEO(mp);
   666		uint			quotamount = 0;
   667		uint			quotaflags = 0;
   668		int			error = 0;
   669	
   670		xfs_sb_mount_common(mp, sbp);
   671	
   672		/*
   673		 * Check for a mismatched features2 values.  Older kernels read & wrote
   674		 * into the wrong sb offset for sb_features2 on some platforms due to
   675		 * xfs_sb_t not being 64bit size aligned when sb_features2 was added,
   676		 * which made older superblock reading/writing routines swap it as a
   677		 * 64-bit value.
   678		 *
   679		 * For backwards compatibility, we make both slots equal.
   680		 *
   681		 * If we detect a mismatched field, we OR the set bits into the existing
   682		 * features2 field in case it has already been modified; we don't want
   683		 * to lose any features.  We then update the bad location with the ORed
   684		 * value so that older kernels will see any features2 flags. The
   685		 * superblock writeback code ensures the new sb_features2 is copied to
   686		 * sb_bad_features2 before it is logged or written to disk.
   687		 */
   688		if (xfs_sb_has_mismatched_features2(sbp)) {
   689			xfs_warn(mp, "correcting sb_features alignment problem");
   690			sbp->sb_features2 |= sbp->sb_bad_features2;
   691			mp->m_update_sb = true;
   692		}
   693	
   694	
   695		/* always use v2 inodes by default now */
   696		if (!(mp->m_sb.sb_versionnum & XFS_SB_VERSION_NLINKBIT)) {
   697			mp->m_sb.sb_versionnum |= XFS_SB_VERSION_NLINKBIT;
   698			mp->m_features |= XFS_FEAT_NLINK;
   699			mp->m_update_sb = true;
   700		}
   701	
   702		/*
   703		 * If we were given new sunit/swidth options, do some basic validation
   704		 * checks and convert the incore dalign and swidth values to the
   705		 * same units (FSB) that everything else uses.  This /must/ happen
   706		 * before computing the inode geometry.
   707		 */
   708		error = xfs_validate_new_dalign(mp);
   709		if (error)
   710			goto out;
   711	
   712		xfs_alloc_compute_maxlevels(mp);
   713		xfs_bmap_compute_maxlevels(mp, XFS_DATA_FORK);
   714		xfs_bmap_compute_maxlevels(mp, XFS_ATTR_FORK);
   715		xfs_mount_setup_inode_geom(mp);
   716		xfs_rmapbt_compute_maxlevels(mp);
   717		xfs_refcountbt_compute_maxlevels(mp);
   718	
   719		xfs_agbtree_compute_maxlevels(mp);
   720	
   721		/*
   722		 * Check if sb_agblocks is aligned at stripe boundary.  If sb_agblocks
   723		 * is NOT aligned turn off m_dalign since allocator alignment is within
   724		 * an ag, therefore ag has to be aligned at stripe boundary.  Note that
   725		 * we must compute the free space and rmap btree geometry before doing
   726		 * this.
   727		 */
   728		error = xfs_update_alignment(mp);
   729		if (error)
   730			goto out;
   731	
   732		/* enable fail_at_unmount as default */
   733		mp->m_fail_unmount = true;
   734	
   735		super_set_sysfs_name_id(mp->m_super);
   736	
   737		error = xfs_sysfs_init(&mp->m_kobj, &xfs_mp_ktype,
   738				       NULL, mp->m_super->s_id);
   739		if (error)
   740			goto out;
   741	
   742		error = xfs_sysfs_init(&mp->m_stats.xs_kobj, &xfs_stats_ktype,
   743				       &mp->m_kobj, "stats");
   744		if (error)
   745			goto out_remove_sysfs;
   746	
   747		xchk_stats_register(mp->m_scrub_stats, mp->m_debugfs);
   748	
   749		error = xfs_error_sysfs_init(mp);
   750		if (error)
   751			goto out_remove_scrub_stats;
   752	
   753		error = xfs_errortag_init(mp);
   754		if (error)
   755			goto out_remove_error_sysfs;
   756	
   757		error = xfs_uuid_mount(mp);
   758		if (error)
   759			goto out_remove_errortag;
   760	
   761		/*
   762		 * Update the preferred write size based on the information from the
   763		 * on-disk superblock.
   764		 */
   765		mp->m_allocsize_log =
   766			max_t(uint32_t, sbp->sb_blocklog, mp->m_allocsize_log);
   767		mp->m_allocsize_blocks = 1U << (mp->m_allocsize_log - sbp->sb_blocklog);
   768	
   769		/* set the low space thresholds for dynamic preallocation */
   770		xfs_set_low_space_thresholds(mp);
   771	
   772		/*
   773		 * If enabled, sparse inode chunk alignment is expected to match the
   774		 * cluster size. Full inode chunk alignment must match the chunk size,
   775		 * but that is checked on sb read verification...
   776		 */
   777		if (xfs_has_sparseinodes(mp) &&
   778		    mp->m_sb.sb_spino_align !=
   779				XFS_B_TO_FSBT(mp, igeo->inode_cluster_size_raw)) {
   780			xfs_warn(mp,
   781		"Sparse inode block alignment (%u) must match cluster size (%llu).",
   782				 mp->m_sb.sb_spino_align,
   783				 XFS_B_TO_FSBT(mp, igeo->inode_cluster_size_raw));
   784			error = -EINVAL;
   785			goto out_remove_uuid;
   786		}
   787	
   788		/*
   789		 * Check that the data (and log if separate) is an ok size.
   790		 */
   791		error = xfs_check_sizes(mp);
   792		if (error)
   793			goto out_remove_uuid;
   794	
   795		/*
   796		 * Initialize realtime fields in the mount structure
   797		 */
   798		error = xfs_rtmount_init(mp);
   799		if (error) {
   800			xfs_warn(mp, "RT mount failed");
   801			goto out_remove_uuid;
   802		}
   803	
   804		/*
   805		 *  Copies the low order bits of the timestamp and the randomly
   806		 *  set "sequence" number out of a UUID.
   807		 */
   808		mp->m_fixedfsid[0] =
   809			(get_unaligned_be16(&sbp->sb_uuid.b[8]) << 16) |
   810			 get_unaligned_be16(&sbp->sb_uuid.b[4]);
   811		mp->m_fixedfsid[1] = get_unaligned_be32(&sbp->sb_uuid.b[0]);
   812	
   813		error = xfs_da_mount(mp);
   814		if (error) {
   815			xfs_warn(mp, "Failed dir/attr init: %d", error);
   816			goto out_remove_uuid;
   817		}
   818	
   819		/*
   820		 * Initialize the precomputed transaction reservations values.
   821		 */
   822		xfs_trans_init(mp);
   823	
   824		/*
   825		 * Allocate and initialize the per-ag data.
   826		 */
   827		error = xfs_initialize_perag(mp, 0, sbp->sb_agcount,
   828				mp->m_sb.sb_dblocks, &mp->m_maxagi);
   829		if (error) {
   830			xfs_warn(mp, "Failed per-ag init: %d", error);
   831			goto out_free_dir;
   832		}
   833	
 > 834		error = xfs_initialize_rtgroup(mp, 0, sbp->sb_rgcount);
   835		if (error) {
   836			xfs_warn(mp, "Failed rtgroup init: %d", error);
   837			goto out_free_perag;
   838		}
   839	
   840		if (XFS_IS_CORRUPT(mp, !sbp->sb_logblocks)) {
   841			xfs_warn(mp, "no log defined");
   842			error = -EFSCORRUPTED;
   843			goto out_free_rtgroup;
   844		}
   845	
   846		error = xfs_inodegc_register_shrinker(mp);
   847		if (error)
   848			goto out_fail_wait;
   849	
   850		/*
   851		 * Log's mount-time initialization. The first part of recovery can place
   852		 * some items on the AIL, to be handled when recovery is finished or
   853		 * cancelled.
   854		 */
   855		error = xfs_log_mount(mp, mp->m_logdev_targp,
   856				      XFS_FSB_TO_DADDR(mp, sbp->sb_logstart),
   857				      XFS_FSB_TO_BB(mp, sbp->sb_logblocks));
   858		if (error) {
   859			xfs_warn(mp, "log mount failed");
   860			goto out_inodegc_shrinker;
   861		}
   862	
   863		/*
   864		 * If logged xattrs are still enabled after log recovery finishes, then
   865		 * they'll be available until unmount.  Otherwise, turn them off.
   866		 */
   867		if (xfs_sb_version_haslogxattrs(&mp->m_sb))
   868			xfs_set_using_logged_xattrs(mp);
   869		else
   870			xfs_clear_using_logged_xattrs(mp);
   871	
   872		/* Enable background inode inactivation workers. */
   873		xfs_inodegc_start(mp);
   874		xfs_blockgc_start(mp);
   875	
   876		/*
   877		 * Now that we've recovered any pending superblock feature bit
   878		 * additions, we can finish setting up the attr2 behaviour for the
   879		 * mount. The noattr2 option overrides the superblock flag, so only
   880		 * check the superblock feature flag if the mount option is not set.
   881		 */
   882		if (xfs_has_noattr2(mp)) {
   883			mp->m_features &= ~XFS_FEAT_ATTR2;
   884		} else if (!xfs_has_attr2(mp) &&
   885			   (mp->m_sb.sb_features2 & XFS_SB_VERSION2_ATTR2BIT)) {
   886			mp->m_features |= XFS_FEAT_ATTR2;
   887		}
   888	
   889		if (xfs_has_metadir(mp)) {
   890			error = xfs_mount_setup_metadir(mp);
   891			if (error)
   892				goto out_free_metadir;
   893		}
   894	
   895		/*
   896		 * Get and sanity-check the root inode.
   897		 * Save the pointer to it in the mount structure.
   898		 */
   899		error = xfs_iget(mp, NULL, sbp->sb_rootino, XFS_IGET_UNTRUSTED,
   900				 XFS_ILOCK_EXCL, &rip);
   901		if (error) {
   902			xfs_warn(mp,
   903				"Failed to read root inode 0x%llx, error %d",
   904				sbp->sb_rootino, -error);
   905			goto out_free_metadir;
   906		}
   907	
   908		ASSERT(rip != NULL);
   909	
   910		if (XFS_IS_CORRUPT(mp, !S_ISDIR(VFS_I(rip)->i_mode))) {
   911			xfs_warn(mp, "corrupted root inode %llu: not a directory",
   912				(unsigned long long)rip->i_ino);
   913			xfs_iunlock(rip, XFS_ILOCK_EXCL);
   914			error = -EFSCORRUPTED;
   915			goto out_rele_rip;
   916		}
   917		mp->m_rootip = rip;	/* save it */
   918	
   919		xfs_iunlock(rip, XFS_ILOCK_EXCL);
   920	
   921		/*
   922		 * Initialize realtime inode pointers in the mount structure
   923		 */
   924		error = xfs_rtmount_inodes(mp);
   925		if (error) {
   926			/*
   927			 * Free up the root inode.
   928			 */
   929			xfs_warn(mp, "failed to read RT inodes");
   930			goto out_rele_rip;
   931		}
   932	
   933		/* Make sure the summary counts are ok. */
   934		error = xfs_check_summary_counts(mp);
   935		if (error)
   936			goto out_rtunmount;
   937	
   938		/*
   939		 * If this is a read-only mount defer the superblock updates until
   940		 * the next remount into writeable mode.  Otherwise we would never
   941		 * perform the update e.g. for the root filesystem.
   942		 */
   943		if (mp->m_update_sb && !xfs_is_readonly(mp)) {
   944			error = xfs_sync_sb(mp, false);
   945			if (error) {
   946				xfs_warn(mp, "failed to write sb changes");
   947				goto out_rtunmount;
   948			}
   949		}
   950	
   951		/*
   952		 * Initialise the XFS quota management subsystem for this mount
   953		 */
   954		if (XFS_IS_QUOTA_ON(mp)) {
   955			error = xfs_qm_newmount(mp, &quotamount, &quotaflags);
   956			if (error)
   957				goto out_rtunmount;
   958		} else {
   959			/*
   960			 * If a file system had quotas running earlier, but decided to
   961			 * mount without -o uquota/pquota/gquota options, revoke the
   962			 * quotachecked license.
   963			 */
   964			if (mp->m_sb.sb_qflags & XFS_ALL_QUOTA_ACCT) {
   965				xfs_notice(mp, "resetting quota flags");
   966				error = xfs_mount_reset_sbqflags(mp);
   967				if (error)
   968					goto out_rtunmount;
   969			}
   970		}
   971	
   972		/*
   973		 * Finish recovering the file system.  This part needed to be delayed
   974		 * until after the root and real-time bitmap inodes were consistently
   975		 * read in.  Temporarily create per-AG space reservations for metadata
   976		 * btree shape changes because space freeing transactions (for inode
   977		 * inactivation) require the per-AG reservation in lieu of reserving
   978		 * blocks.
   979		 */
   980		error = xfs_fs_reserve_ag_blocks(mp);
   981		if (error && error == -ENOSPC)
   982			xfs_warn(mp,
   983		"ENOSPC reserving per-AG metadata pool, log recovery may fail.");
   984		error = xfs_log_mount_finish(mp);
   985		xfs_fs_unreserve_ag_blocks(mp);
   986		if (error) {
   987			xfs_warn(mp, "log mount finish failed");
   988			goto out_rtunmount;
   989		}
   990	
   991		/*
   992		 * Now the log is fully replayed, we can transition to full read-only
   993		 * mode for read-only mounts. This will sync all the metadata and clean
   994		 * the log so that the recovery we just performed does not have to be
   995		 * replayed again on the next mount.
   996		 *
   997		 * We use the same quiesce mechanism as the rw->ro remount, as they are
   998		 * semantically identical operations.
   999		 */
  1000		if (xfs_is_readonly(mp) && !xfs_has_norecovery(mp))
  1001			xfs_log_clean(mp);
  1002	
  1003		/*
  1004		 * Complete the quota initialisation, post-log-replay component.
  1005		 */
  1006		if (quotamount) {
  1007			ASSERT(mp->m_qflags == 0);
  1008			mp->m_qflags = quotaflags;
  1009	
  1010			xfs_qm_mount_quotas(mp);
  1011		}
  1012	
  1013		/*
  1014		 * Now we are mounted, reserve a small amount of unused space for
  1015		 * privileged transactions. This is needed so that transaction
  1016		 * space required for critical operations can dip into this pool
  1017		 * when at ENOSPC. This is needed for operations like create with
  1018		 * attr, unwritten extent conversion at ENOSPC, etc. Data allocations
  1019		 * are not allowed to use this reserved space.
  1020		 *
  1021		 * This may drive us straight to ENOSPC on mount, but that implies
  1022		 * we were already there on the last unmount. Warn if this occurs.
  1023		 */
  1024		if (!xfs_is_readonly(mp)) {
  1025			error = xfs_reserve_blocks(mp, xfs_default_resblks(mp));
  1026			if (error)
  1027				xfs_warn(mp,
  1028		"Unable to allocate reserve blocks. Continuing without reserve pool.");
  1029	
  1030			/* Reserve AG blocks for future btree expansion. */
  1031			error = xfs_fs_reserve_ag_blocks(mp);
  1032			if (error && error != -ENOSPC)
  1033				goto out_agresv;
  1034		}
  1035	
  1036		return 0;
  1037	
  1038	 out_agresv:
  1039		xfs_fs_unreserve_ag_blocks(mp);
  1040		xfs_qm_unmount_quotas(mp);
  1041	 out_rtunmount:
  1042		xfs_rtunmount_inodes(mp);
  1043	 out_rele_rip:
  1044		xfs_irele(rip);
  1045		/* Clean out dquots that might be in memory after quotacheck. */
  1046		xfs_qm_unmount(mp);
  1047	 out_free_metadir:
  1048		if (mp->m_metadirip)
  1049			xfs_irele(mp->m_metadirip);
  1050	
  1051		/*
  1052		 * Inactivate all inodes that might still be in memory after a log
  1053		 * intent recovery failure so that reclaim can free them.  Metadata
  1054		 * inodes and the root directory shouldn't need inactivation, but the
  1055		 * mount failed for some reason, so pull down all the state and flee.
  1056		 */
  1057		xfs_inodegc_flush(mp);
  1058	
  1059		/*
  1060		 * Flush all inode reclamation work and flush the log.
  1061		 * We have to do this /after/ rtunmount and qm_unmount because those
  1062		 * two will have scheduled delayed reclaim for the rt/quota inodes.
  1063		 *
  1064		 * This is slightly different from the unmountfs call sequence
  1065		 * because we could be tearing down a partially set up mount.  In
  1066		 * particular, if log_mount_finish fails we bail out without calling
  1067		 * qm_unmount_quotas and therefore rely on qm_unmount to release the
  1068		 * quota inodes.
  1069		 */
  1070		xfs_unmount_flush_inodes(mp);
  1071		xfs_log_mount_cancel(mp);
  1072	 out_inodegc_shrinker:
  1073		shrinker_free(mp->m_inodegc_shrinker);
  1074	 out_fail_wait:
  1075		if (mp->m_logdev_targp && mp->m_logdev_targp != mp->m_ddev_targp)
  1076			xfs_buftarg_drain(mp->m_logdev_targp);
  1077		xfs_buftarg_drain(mp->m_ddev_targp);
  1078	 out_free_rtgroup:
  1079		xfs_free_rtgroup_range(mp, 0, mp->m_sb.sb_rgcount);
  1080	 out_free_perag:
  1081		xfs_free_perag_range(mp, 0, mp->m_sb.sb_agcount);
  1082	 out_free_dir:
  1083		xfs_da_unmount(mp);
  1084	 out_remove_uuid:
  1085		xfs_uuid_unmount(mp);
  1086	 out_remove_errortag:
  1087		xfs_errortag_del(mp);
  1088	 out_remove_error_sysfs:
  1089		xfs_error_sysfs_del(mp);
  1090	 out_remove_scrub_stats:
  1091		xchk_stats_unregister(mp->m_scrub_stats);
  1092		xfs_sysfs_del(&mp->m_stats.xs_kobj);
  1093	 out_remove_sysfs:
  1094		xfs_sysfs_del(&mp->m_kobj);
  1095	 out:
  1096		return error;
  1097	}
  1098	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
