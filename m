Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7632C165F13
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 07:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722929313; cv=none; b=eJwCWz1Bc5WHcYIdUli0M/hjZZCI+DfXS919bLncIfLnroHe0dkYknqT0uy5XrdtqJHMr2dV/GN8z0odH4s1bD1mMMZyw2X2zcXy9IHNdFpDFkfluDXefcolg2fbQk/2bv2JjHO/rTaZraTr5gA9+dJbbDsKEUZR6n7QxbsmKyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722929313; c=relaxed/simple;
	bh=v1ixGQSDwQp+FbQF3sNJlFKBm3bMxRyA1FMPVd8Hnys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7uDkk3p7ymX6Gy0WEWyoS7+ZqBfdWz3jbveCpjKby9xPGdGaxSLX4v9kDExvbmduv62OnLODGjmWXGn8jkLZI3teTgkqlmQrys+zjWZCQzNJzLMdAWaP875uONgrV1rTKbnQe+Cu+VPB+yJnTsnAuB4BKQWEy+LMn1CnuJUuG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hiffvOE0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiffvOE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722929311; x=1754465311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v1ixGQSDwQp+FbQF3sNJlFKBm3bMxRyA1FMPVd8Hnys=;
  b=hiffvOE0IzyPUOeeqOlSB+u0OOo0keqNHdirbsdk+znnTJPaAZF+rhLV
   qMbv3V+2qb/0okdAefDN26vKk7ilolgVfDYoWbAwmabwa3p1eStApbjLG
   kOgELrrM2Fmk/su7Gz/IzCiy7lU8cjOJ0uzhXRRwJazb5EvypHlWyNJLv
   LN8EYUD7JDsioL6i2lSibTpfn2Z1H4kwgTDocmUs+cNz1HjLh5MAWkak4
   n7u7tBxngl+ARexv9W0340bKJ4VwlEhAkdXFByPsIJpubpHwPdwuRX9Em
   NhpAQlnmrCZtvSWU8weqMpFgT6qEcWflnevOza9GCbJVgx875XxBgfj7t
   w==;
X-CSE-ConnectionGUID: z8bZzgNoS1qM5EdSTBzo+A==
X-CSE-MsgGUID: P0lYl31fSVWbY2QSB21gtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24691870"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="24691870"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 00:28:31 -0700
X-CSE-ConnectionGUID: gTrlB39iTu+Gen4bZl3NEg==
X-CSE-MsgGUID: AIL72I1CQimGtLEXHorcVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="60555436"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Aug 2024 00:28:29 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbEcN-0004GM-23;
	Tue, 06 Aug 2024 07:28:27 +0000
Date: Tue, 6 Aug 2024 15:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap-rebase 22/60] fs/xfs/xfs_mount.c:846:25:
 error: implicit declaration of function 'xfs_rtgroup_alloc'; did you mean
 'xfs_rtgroup_hold'?
Message-ID: <202408061531.UFHHbl91-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap-rebase
head:   556815df77c3443419163e1deccade141c065289
commit: 498f602e6140084af4f2fb1abf3da9502090439b [22/60] xfs: create incore realtime group structures
config: arm64-randconfig-004-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061531.UFHHbl91-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061531.UFHHbl91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061531.UFHHbl91-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_mount.c: In function 'xfs_mountfs':
>> fs/xfs/xfs_mount.c:846:25: error: implicit declaration of function 'xfs_rtgroup_alloc'; did you mean 'xfs_rtgroup_hold'? [-Wimplicit-function-declaration]
     846 |                 error = xfs_rtgroup_alloc(mp, rgno);
         |                         ^~~~~~~~~~~~~~~~~
         |                         xfs_rtgroup_hold
--
   fs/xfs/xfs_log_recover.c: In function 'xlog_do_recover':
>> fs/xfs/xfs_log_recover.c:3413:33: error: implicit declaration of function 'xfs_rtgroup_alloc'; did you mean 'xfs_rtgroup_hold'? [-Wimplicit-function-declaration]
    3413 |                         error = xfs_rtgroup_alloc(mp, rgno);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 xfs_rtgroup_hold


vim +846 fs/xfs/xfs_mount.c

   658	
   659	/*
   660	 * This function does the following on an initial mount of a file system:
   661	 *	- reads the superblock from disk and init the mount struct
   662	 *	- if we're a 32-bit kernel, do a size check on the superblock
   663	 *		so we don't mount terabyte filesystems
   664	 *	- init mount struct realtime fields
   665	 *	- allocate inode hash table for fs
   666	 *	- init directory manager
   667	 *	- perform recovery and init the log manager
   668	 */
   669	int
   670	xfs_mountfs(
   671		struct xfs_mount	*mp)
   672	{
   673		struct xfs_sb		*sbp = &(mp->m_sb);
   674		struct xfs_inode	*rip;
   675		struct xfs_ino_geometry	*igeo = M_IGEO(mp);
   676		uint			quotamount = 0;
   677		uint			quotaflags = 0;
   678		xfs_rgnumber_t		rgno;
   679		int			error = 0;
   680	
   681		xfs_sb_mount_common(mp, sbp);
   682	
   683		/*
   684		 * Check for a mismatched features2 values.  Older kernels read & wrote
   685		 * into the wrong sb offset for sb_features2 on some platforms due to
   686		 * xfs_sb_t not being 64bit size aligned when sb_features2 was added,
   687		 * which made older superblock reading/writing routines swap it as a
   688		 * 64-bit value.
   689		 *
   690		 * For backwards compatibility, we make both slots equal.
   691		 *
   692		 * If we detect a mismatched field, we OR the set bits into the existing
   693		 * features2 field in case it has already been modified; we don't want
   694		 * to lose any features.  We then update the bad location with the ORed
   695		 * value so that older kernels will see any features2 flags. The
   696		 * superblock writeback code ensures the new sb_features2 is copied to
   697		 * sb_bad_features2 before it is logged or written to disk.
   698		 */
   699		if (xfs_sb_has_mismatched_features2(sbp)) {
   700			xfs_warn(mp, "correcting sb_features alignment problem");
   701			sbp->sb_features2 |= sbp->sb_bad_features2;
   702			mp->m_update_sb = true;
   703		}
   704	
   705	
   706		/* always use v2 inodes by default now */
   707		if (!(mp->m_sb.sb_versionnum & XFS_SB_VERSION_NLINKBIT)) {
   708			mp->m_sb.sb_versionnum |= XFS_SB_VERSION_NLINKBIT;
   709			mp->m_features |= XFS_FEAT_NLINK;
   710			mp->m_update_sb = true;
   711		}
   712	
   713		/*
   714		 * If we were given new sunit/swidth options, do some basic validation
   715		 * checks and convert the incore dalign and swidth values to the
   716		 * same units (FSB) that everything else uses.  This /must/ happen
   717		 * before computing the inode geometry.
   718		 */
   719		error = xfs_validate_new_dalign(mp);
   720		if (error)
   721			goto out;
   722	
   723		xfs_alloc_compute_maxlevels(mp);
   724		xfs_bmap_compute_maxlevels(mp, XFS_DATA_FORK);
   725		xfs_bmap_compute_maxlevels(mp, XFS_ATTR_FORK);
   726		xfs_mount_setup_inode_geom(mp);
   727		xfs_rmapbt_compute_maxlevels(mp);
   728		xfs_refcountbt_compute_maxlevels(mp);
   729	
   730		xfs_agbtree_compute_maxlevels(mp);
   731	
   732		/*
   733		 * Check if sb_agblocks is aligned at stripe boundary.  If sb_agblocks
   734		 * is NOT aligned turn off m_dalign since allocator alignment is within
   735		 * an ag, therefore ag has to be aligned at stripe boundary.  Note that
   736		 * we must compute the free space and rmap btree geometry before doing
   737		 * this.
   738		 */
   739		error = xfs_update_alignment(mp);
   740		if (error)
   741			goto out;
   742	
   743		/* enable fail_at_unmount as default */
   744		mp->m_fail_unmount = true;
   745	
   746		super_set_sysfs_name_id(mp->m_super);
   747	
   748		error = xfs_sysfs_init(&mp->m_kobj, &xfs_mp_ktype,
   749				       NULL, mp->m_super->s_id);
   750		if (error)
   751			goto out;
   752	
   753		error = xfs_sysfs_init(&mp->m_stats.xs_kobj, &xfs_stats_ktype,
   754				       &mp->m_kobj, "stats");
   755		if (error)
   756			goto out_remove_sysfs;
   757	
   758		xchk_stats_register(mp->m_scrub_stats, mp->m_debugfs);
   759	
   760		error = xfs_error_sysfs_init(mp);
   761		if (error)
   762			goto out_remove_scrub_stats;
   763	
   764		error = xfs_errortag_init(mp);
   765		if (error)
   766			goto out_remove_error_sysfs;
   767	
   768		error = xfs_uuid_mount(mp);
   769		if (error)
   770			goto out_remove_errortag;
   771	
   772		/*
   773		 * Update the preferred write size based on the information from the
   774		 * on-disk superblock.
   775		 */
   776		mp->m_allocsize_log =
   777			max_t(uint32_t, sbp->sb_blocklog, mp->m_allocsize_log);
   778		mp->m_allocsize_blocks = 1U << (mp->m_allocsize_log - sbp->sb_blocklog);
   779	
   780		/* set the low space thresholds for dynamic preallocation */
   781		xfs_set_low_space_thresholds(mp);
   782	
   783		/*
   784		 * If enabled, sparse inode chunk alignment is expected to match the
   785		 * cluster size. Full inode chunk alignment must match the chunk size,
   786		 * but that is checked on sb read verification...
   787		 */
   788		if (xfs_has_sparseinodes(mp) &&
   789		    mp->m_sb.sb_spino_align !=
   790				XFS_B_TO_FSBT(mp, igeo->inode_cluster_size_raw)) {
   791			xfs_warn(mp,
   792		"Sparse inode block alignment (%u) must match cluster size (%llu).",
   793				 mp->m_sb.sb_spino_align,
   794				 XFS_B_TO_FSBT(mp, igeo->inode_cluster_size_raw));
   795			error = -EINVAL;
   796			goto out_remove_uuid;
   797		}
   798	
   799		/*
   800		 * Check that the data (and log if separate) is an ok size.
   801		 */
   802		error = xfs_check_sizes(mp);
   803		if (error)
   804			goto out_remove_uuid;
   805	
   806		/*
   807		 * Initialize realtime fields in the mount structure
   808		 */
   809		error = xfs_rtmount_init(mp);
   810		if (error) {
   811			xfs_warn(mp, "RT mount failed");
   812			goto out_remove_uuid;
   813		}
   814	
   815		/*
   816		 *  Copies the low order bits of the timestamp and the randomly
   817		 *  set "sequence" number out of a UUID.
   818		 */
   819		mp->m_fixedfsid[0] =
   820			(get_unaligned_be16(&sbp->sb_uuid.b[8]) << 16) |
   821			 get_unaligned_be16(&sbp->sb_uuid.b[4]);
   822		mp->m_fixedfsid[1] = get_unaligned_be32(&sbp->sb_uuid.b[0]);
   823	
   824		error = xfs_da_mount(mp);
   825		if (error) {
   826			xfs_warn(mp, "Failed dir/attr init: %d", error);
   827			goto out_remove_uuid;
   828		}
   829	
   830		/*
   831		 * Initialize the precomputed transaction reservations values.
   832		 */
   833		xfs_trans_init(mp);
   834	
   835		/*
   836		 * Allocate and initialize the per-ag data.
   837		 */
   838		error = xfs_initialize_perag(mp, sbp->sb_agcount, mp->m_sb.sb_dblocks,
   839				&mp->m_maxagi);
   840		if (error) {
   841			xfs_warn(mp, "Failed per-ag init: %d", error);
   842			goto out_free_dir;
   843		}
   844	
   845		for (rgno = 0; rgno < mp->m_sb.sb_rgcount; rgno++) {
 > 846			error = xfs_rtgroup_alloc(mp, rgno);
   847			if (error) {
   848				xfs_warn(mp, "Failed rtgroup init: %d", error);
   849				goto out_free_rtgroup;
   850			}
   851		}
   852	
   853		if (XFS_IS_CORRUPT(mp, !sbp->sb_logblocks)) {
   854			xfs_warn(mp, "no log defined");
   855			error = -EFSCORRUPTED;
   856			goto out_free_rtgroup;
   857		}
   858	
   859		error = xfs_inodegc_register_shrinker(mp);
   860		if (error)
   861			goto out_fail_wait;
   862	
   863		/*
   864		 * Log's mount-time initialization. The first part of recovery can place
   865		 * some items on the AIL, to be handled when recovery is finished or
   866		 * cancelled.
   867		 */
   868		error = xfs_log_mount(mp, mp->m_logdev_targp,
   869				      XFS_FSB_TO_DADDR(mp, sbp->sb_logstart),
   870				      XFS_FSB_TO_BB(mp, sbp->sb_logblocks));
   871		if (error) {
   872			xfs_warn(mp, "log mount failed");
   873			goto out_inodegc_shrinker;
   874		}
   875	
   876		/*
   877		 * If logged xattrs are still enabled after log recovery finishes, then
   878		 * they'll be available until unmount.  Otherwise, turn them off.
   879		 */
   880		if (xfs_sb_version_haslogxattrs(&mp->m_sb))
   881			xfs_set_using_logged_xattrs(mp);
   882		else
   883			xfs_clear_using_logged_xattrs(mp);
   884	
   885		/* Enable background inode inactivation workers. */
   886		xfs_inodegc_start(mp);
   887		xfs_blockgc_start(mp);
   888	
   889		/*
   890		 * Now that we've recovered any pending superblock feature bit
   891		 * additions, we can finish setting up the attr2 behaviour for the
   892		 * mount. The noattr2 option overrides the superblock flag, so only
   893		 * check the superblock feature flag if the mount option is not set.
   894		 */
   895		if (xfs_has_noattr2(mp)) {
   896			mp->m_features &= ~XFS_FEAT_ATTR2;
   897		} else if (!xfs_has_attr2(mp) &&
   898			   (mp->m_sb.sb_features2 & XFS_SB_VERSION2_ATTR2BIT)) {
   899			mp->m_features |= XFS_FEAT_ATTR2;
   900		}
   901	
   902		if (xfs_has_metadir(mp)) {
   903			error = xfs_mount_setup_metadir(mp);
   904			if (error)
   905				goto out_free_metadir;
   906		}
   907	
   908		/*
   909		 * Get and sanity-check the root inode.
   910		 * Save the pointer to it in the mount structure.
   911		 */
   912		error = xfs_iget(mp, NULL, sbp->sb_rootino, XFS_IGET_UNTRUSTED,
   913				 XFS_ILOCK_EXCL, &rip);
   914		if (error) {
   915			xfs_warn(mp,
   916				"Failed to read root inode 0x%llx, error %d",
   917				sbp->sb_rootino, -error);
   918			goto out_free_metadir;
   919		}
   920	
   921		ASSERT(rip != NULL);
   922	
   923		if (XFS_IS_CORRUPT(mp, !S_ISDIR(VFS_I(rip)->i_mode))) {
   924			xfs_warn(mp, "corrupted root inode %llu: not a directory",
   925				(unsigned long long)rip->i_ino);
   926			xfs_iunlock(rip, XFS_ILOCK_EXCL);
   927			error = -EFSCORRUPTED;
   928			goto out_rele_rip;
   929		}
   930		mp->m_rootip = rip;	/* save it */
   931	
   932		xfs_iunlock(rip, XFS_ILOCK_EXCL);
   933	
   934		/*
   935		 * Initialize realtime inode pointers in the mount structure
   936		 */
   937		error = xfs_rtmount_inodes(mp);
   938		if (error) {
   939			/*
   940			 * Free up the root inode.
   941			 */
   942			xfs_warn(mp, "failed to read RT inodes");
   943			goto out_rele_rip;
   944		}
   945	
   946		/* Make sure the summary counts are ok. */
   947		error = xfs_check_summary_counts(mp);
   948		if (error)
   949			goto out_rtunmount;
   950	
   951		/*
   952		 * If this is a read-only mount defer the superblock updates until
   953		 * the next remount into writeable mode.  Otherwise we would never
   954		 * perform the update e.g. for the root filesystem.
   955		 */
   956		if (mp->m_update_sb && !xfs_is_readonly(mp)) {
   957			error = xfs_sync_sb(mp, false);
   958			if (error) {
   959				xfs_warn(mp, "failed to write sb changes");
   960				goto out_rtunmount;
   961			}
   962		}
   963	
   964		/*
   965		 * Initialise the XFS quota management subsystem for this mount
   966		 */
   967		if (XFS_IS_QUOTA_ON(mp)) {
   968			error = xfs_qm_newmount(mp, &quotamount, &quotaflags);
   969			if (error)
   970				goto out_rtunmount;
   971		} else {
   972			/*
   973			 * If a file system had quotas running earlier, but decided to
   974			 * mount without -o uquota/pquota/gquota options, revoke the
   975			 * quotachecked license.
   976			 */
   977			if (mp->m_sb.sb_qflags & XFS_ALL_QUOTA_ACCT) {
   978				xfs_notice(mp, "resetting quota flags");
   979				error = xfs_mount_reset_sbqflags(mp);
   980				if (error)
   981					goto out_rtunmount;
   982			}
   983		}
   984	
   985		/*
   986		 * Finish recovering the file system.  This part needed to be delayed
   987		 * until after the root and real-time bitmap inodes were consistently
   988		 * read in.  Temporarily create per-AG space reservations for metadata
   989		 * btree shape changes because space freeing transactions (for inode
   990		 * inactivation) require the per-AG reservation in lieu of reserving
   991		 * blocks.
   992		 */
   993		error = xfs_fs_reserve_ag_blocks(mp);
   994		if (error && error == -ENOSPC)
   995			xfs_warn(mp,
   996		"ENOSPC reserving per-AG metadata pool, log recovery may fail.");
   997		error = xfs_log_mount_finish(mp);
   998		xfs_fs_unreserve_ag_blocks(mp);
   999		if (error) {
  1000			xfs_warn(mp, "log mount finish failed");
  1001			goto out_rtunmount;
  1002		}
  1003	
  1004		/*
  1005		 * Now the log is fully replayed, we can transition to full read-only
  1006		 * mode for read-only mounts. This will sync all the metadata and clean
  1007		 * the log so that the recovery we just performed does not have to be
  1008		 * replayed again on the next mount.
  1009		 *
  1010		 * We use the same quiesce mechanism as the rw->ro remount, as they are
  1011		 * semantically identical operations.
  1012		 */
  1013		if (xfs_is_readonly(mp) && !xfs_has_norecovery(mp))
  1014			xfs_log_clean(mp);
  1015	
  1016		/*
  1017		 * Complete the quota initialisation, post-log-replay component.
  1018		 */
  1019		if (quotamount) {
  1020			ASSERT(mp->m_qflags == 0);
  1021			mp->m_qflags = quotaflags;
  1022	
  1023			xfs_qm_mount_quotas(mp);
  1024		}
  1025	
  1026		/*
  1027		 * Now we are mounted, reserve a small amount of unused space for
  1028		 * privileged transactions. This is needed so that transaction
  1029		 * space required for critical operations can dip into this pool
  1030		 * when at ENOSPC. This is needed for operations like create with
  1031		 * attr, unwritten extent conversion at ENOSPC, etc. Data allocations
  1032		 * are not allowed to use this reserved space.
  1033		 *
  1034		 * This may drive us straight to ENOSPC on mount, but that implies
  1035		 * we were already there on the last unmount. Warn if this occurs.
  1036		 */
  1037		if (!xfs_is_readonly(mp)) {
  1038			error = xfs_reserve_blocks(mp, xfs_default_resblks(mp));
  1039			if (error)
  1040				xfs_warn(mp,
  1041		"Unable to allocate reserve blocks. Continuing without reserve pool.");
  1042	
  1043			/* Reserve AG blocks for future btree expansion. */
  1044			error = xfs_fs_reserve_ag_blocks(mp);
  1045			if (error && error != -ENOSPC)
  1046				goto out_agresv;
  1047		}
  1048	
  1049		return 0;
  1050	
  1051	 out_agresv:
  1052		xfs_fs_unreserve_ag_blocks(mp);
  1053		xfs_qm_unmount_quotas(mp);
  1054	 out_rtunmount:
  1055		xfs_rtunmount_inodes(mp);
  1056	 out_rele_rip:
  1057		xfs_irele(rip);
  1058		/* Clean out dquots that might be in memory after quotacheck. */
  1059		xfs_qm_unmount(mp);
  1060	 out_free_metadir:
  1061		if (mp->m_metadirip)
  1062			xfs_irele(mp->m_metadirip);
  1063	
  1064		/*
  1065		 * Inactivate all inodes that might still be in memory after a log
  1066		 * intent recovery failure so that reclaim can free them.  Metadata
  1067		 * inodes and the root directory shouldn't need inactivation, but the
  1068		 * mount failed for some reason, so pull down all the state and flee.
  1069		 */
  1070		xfs_inodegc_flush(mp);
  1071	
  1072		/*
  1073		 * Flush all inode reclamation work and flush the log.
  1074		 * We have to do this /after/ rtunmount and qm_unmount because those
  1075		 * two will have scheduled delayed reclaim for the rt/quota inodes.
  1076		 *
  1077		 * This is slightly different from the unmountfs call sequence
  1078		 * because we could be tearing down a partially set up mount.  In
  1079		 * particular, if log_mount_finish fails we bail out without calling
  1080		 * qm_unmount_quotas and therefore rely on qm_unmount to release the
  1081		 * quota inodes.
  1082		 */
  1083		xfs_unmount_flush_inodes(mp);
  1084		xfs_log_mount_cancel(mp);
  1085	 out_inodegc_shrinker:
  1086		shrinker_free(mp->m_inodegc_shrinker);
  1087	 out_fail_wait:
  1088		if (mp->m_logdev_targp && mp->m_logdev_targp != mp->m_ddev_targp)
  1089			xfs_buftarg_drain(mp->m_logdev_targp);
  1090		xfs_buftarg_drain(mp->m_ddev_targp);
  1091	 out_free_rtgroup:
  1092		xfs_free_rtgroups(mp, rgno);
  1093		xfs_free_perag(mp);
  1094	 out_free_dir:
  1095		xfs_da_unmount(mp);
  1096	 out_remove_uuid:
  1097		xfs_uuid_unmount(mp);
  1098	 out_remove_errortag:
  1099		xfs_errortag_del(mp);
  1100	 out_remove_error_sysfs:
  1101		xfs_error_sysfs_del(mp);
  1102	 out_remove_scrub_stats:
  1103		xchk_stats_unregister(mp->m_scrub_stats);
  1104		xfs_sysfs_del(&mp->m_stats.xs_kobj);
  1105	 out_remove_sysfs:
  1106		xfs_sysfs_del(&mp->m_kobj);
  1107	 out:
  1108		return error;
  1109	}
  1110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
