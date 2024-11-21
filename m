Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B5B23098E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 03:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732160196; cv=none; b=rwfBp5qB4kl7b9pj2ivlHIp1/7XURuejIXxZEiV9aWJVi17yjCzuFyony7EW9oijn+KK8kST9LQXVtgi6gXCInrQ7etVJk8TNCzebn6tfdf77F8zXTeYv8pphICmhNlw6eOHNFr4JrYFOvGqqOQgRVjGhFrhtUrRa0/6hJ109W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732160196; c=relaxed/simple;
	bh=Po0CDZSumhC9wdDKi8m4GXsiRrGC7mXHP/AAm8vY9Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUQa9Q/jnkhwXBJIPRXFLYlMHHE4xo4sJskQaxOp2DM1wOUy1YQFPKofdDKLzcJRZZBW9k6+TQfhlJTNqYGvrTsDQZTSohaH5GbJnh+1B008WjuYvdjcWxrtJohjSHzoTuB17rdv6eAas9CAAxAw23s/fP4JfBNoDAOfm+W0C5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6hwF/k8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6hwF/k8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732160194; x=1763696194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Po0CDZSumhC9wdDKi8m4GXsiRrGC7mXHP/AAm8vY9Nc=;
  b=R6hwF/k8NrDCcqR/F2NOhEuU0nS/Yf9c32WUPr0jo4FFDH4EgDnla/UD
   EnjGj4u9yh+npTglDzZCxqkig/7Kb6k9lHhl70//VE7qbTfoTTui117Yk
   HJjkmNBtPMnqrluyR1kYuuLZ2MZK4yQT06Iys3YXQE5rzBwtFSbeXd55L
   uDegdXfjJe4F4r9rhJdJFhR3+B3QNGdAvO+PdoDqj/Usd/XevmgM/CnoM
   /QZ5rxNtV8Z1SMyvYdrSIWYbflVpel1/3rW3WOdnhlBBg1rqQhHUGWwEH
   AMtliKRDBBlUzCxBAPAdko2VRrRA+iIMNKz4ckKLQI92F7OedW4MiU39G
   w==;
X-CSE-ConnectionGUID: 1GwOLaOxQGaz3dMPTtXobQ==
X-CSE-MsgGUID: PHJhaSN8TaG0cSv6vkt85w==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="36163904"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="36163904"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 19:36:33 -0800
X-CSE-ConnectionGUID: vyMGv+ZySx6sW5Nr7HqVmg==
X-CSE-MsgGUID: IHYovDFSSYWbRnXReG7S0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="94574790"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Nov 2024 19:36:32 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDxzZ-0001cF-1w;
	Thu, 21 Nov 2024 03:36:29 +0000
Date: Thu, 21 Nov 2024 11:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 72/77] fs/xfs/xfs_mount.c:1188:undefined
 reference to `xfs_unmount_zones'
Message-ID: <202411211134.MW0EPr9p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   90d9623aee06c9da4a4d1c15fe048020476ad457
commit: 03b06a1a9f51e9625907b0ee5e448a2955a1e686 [72/77] xfs: don't indirect zone mount handling through xfs_rtalloc.c
config: loongarch-randconfig-002-20241121 (https://download.01.org/0day-ci/archive/20241121/202411211134.MW0EPr9p-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211134.MW0EPr9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211134.MW0EPr9p-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: fs/xfs/xfs_mount.o: in function `xfs_unmountfs':
>> fs/xfs/xfs_mount.c:1188:(.text+0x1258): undefined reference to `xfs_unmount_zones'
   loongarch64-linux-ld: fs/xfs/xfs_mount.o: in function `xfs_mountfs':
>> fs/xfs/xfs_mount.c:982:(.text+0x1d38): undefined reference to `xfs_mount_zones'
>> loongarch64-linux-ld: fs/xfs/xfs_mount.c:1103:(.text+0x1fe0): undefined reference to `xfs_unmount_zones'


vim +1188 fs/xfs/xfs_mount.c

   676	
   677	/*
   678	 * This function does the following on an initial mount of a file system:
   679	 *	- reads the superblock from disk and init the mount struct
   680	 *	- if we're a 32-bit kernel, do a size check on the superblock
   681	 *		so we don't mount terabyte filesystems
   682	 *	- init mount struct realtime fields
   683	 *	- allocate inode hash table for fs
   684	 *	- init directory manager
   685	 *	- perform recovery and init the log manager
   686	 */
   687	int
   688	xfs_mountfs(
   689		struct xfs_mount	*mp)
   690	{
   691		struct xfs_sb		*sbp = &(mp->m_sb);
   692		struct xfs_inode	*rip;
   693		struct xfs_ino_geometry	*igeo = M_IGEO(mp);
   694		uint			quotamount = 0;
   695		uint			quotaflags = 0;
   696		int			error = 0;
   697		int			i;
   698	
   699		xfs_sb_mount_common(mp, sbp);
   700	
   701		/*
   702		 * Check for a mismatched features2 values.  Older kernels read & wrote
   703		 * into the wrong sb offset for sb_features2 on some platforms due to
   704		 * xfs_sb_t not being 64bit size aligned when sb_features2 was added,
   705		 * which made older superblock reading/writing routines swap it as a
   706		 * 64-bit value.
   707		 *
   708		 * For backwards compatibility, we make both slots equal.
   709		 *
   710		 * If we detect a mismatched field, we OR the set bits into the existing
   711		 * features2 field in case it has already been modified; we don't want
   712		 * to lose any features.  We then update the bad location with the ORed
   713		 * value so that older kernels will see any features2 flags. The
   714		 * superblock writeback code ensures the new sb_features2 is copied to
   715		 * sb_bad_features2 before it is logged or written to disk.
   716		 */
   717		if (xfs_sb_has_mismatched_features2(sbp)) {
   718			xfs_warn(mp, "correcting sb_features alignment problem");
   719			sbp->sb_features2 |= sbp->sb_bad_features2;
   720			mp->m_update_sb = true;
   721		}
   722	
   723	
   724		/* always use v2 inodes by default now */
   725		if (!(mp->m_sb.sb_versionnum & XFS_SB_VERSION_NLINKBIT)) {
   726			mp->m_sb.sb_versionnum |= XFS_SB_VERSION_NLINKBIT;
   727			mp->m_features |= XFS_FEAT_NLINK;
   728			mp->m_update_sb = true;
   729		}
   730	
   731		/*
   732		 * If we were given new sunit/swidth options, do some basic validation
   733		 * checks and convert the incore dalign and swidth values to the
   734		 * same units (FSB) that everything else uses.  This /must/ happen
   735		 * before computing the inode geometry.
   736		 */
   737		error = xfs_validate_new_dalign(mp);
   738		if (error)
   739			goto out;
   740	
   741		xfs_alloc_compute_maxlevels(mp);
   742		xfs_bmap_compute_maxlevels(mp, XFS_DATA_FORK);
   743		xfs_bmap_compute_maxlevels(mp, XFS_ATTR_FORK);
   744		xfs_mount_setup_inode_geom(mp);
   745		xfs_rmapbt_compute_maxlevels(mp);
   746		xfs_rtrmapbt_compute_maxlevels(mp);
   747		xfs_refcountbt_compute_maxlevels(mp);
   748		xfs_rtrefcountbt_compute_maxlevels(mp);
   749	
   750		xfs_agbtree_compute_maxlevels(mp);
   751		xfs_rtbtree_compute_maxlevels(mp);
   752	
   753		/*
   754		 * Check if sb_agblocks is aligned at stripe boundary.  If sb_agblocks
   755		 * is NOT aligned turn off m_dalign since allocator alignment is within
   756		 * an ag, therefore ag has to be aligned at stripe boundary.  Note that
   757		 * we must compute the free space and rmap btree geometry before doing
   758		 * this.
   759		 */
   760		error = xfs_update_alignment(mp);
   761		if (error)
   762			goto out;
   763	
   764		/* enable fail_at_unmount as default */
   765		mp->m_fail_unmount = true;
   766	
   767		super_set_sysfs_name_id(mp->m_super);
   768	
   769		error = xfs_sysfs_init(&mp->m_kobj, &xfs_mp_ktype,
   770				       NULL, mp->m_super->s_id);
   771		if (error)
   772			goto out;
   773	
   774		error = xfs_sysfs_init(&mp->m_stats.xs_kobj, &xfs_stats_ktype,
   775				       &mp->m_kobj, "stats");
   776		if (error)
   777			goto out_remove_sysfs;
   778	
   779		xchk_stats_register(mp->m_scrub_stats, mp->m_debugfs);
   780	
   781		error = xfs_error_sysfs_init(mp);
   782		if (error)
   783			goto out_remove_scrub_stats;
   784	
   785		error = xfs_errortag_init(mp);
   786		if (error)
   787			goto out_remove_error_sysfs;
   788	
   789		error = xfs_uuid_mount(mp);
   790		if (error)
   791			goto out_remove_errortag;
   792	
   793		/*
   794		 * Update the preferred write size based on the information from the
   795		 * on-disk superblock.
   796		 */
   797		mp->m_allocsize_log =
   798			max_t(uint32_t, sbp->sb_blocklog, mp->m_allocsize_log);
   799		mp->m_allocsize_blocks = 1U << (mp->m_allocsize_log - sbp->sb_blocklog);
   800	
   801		/* set the low space thresholds for dynamic preallocation */
   802		xfs_set_low_space_thresholds(mp);
   803	
   804		/*
   805		 * If enabled, sparse inode chunk alignment is expected to match the
   806		 * cluster size. Full inode chunk alignment must match the chunk size,
   807		 * but that is checked on sb read verification...
   808		 */
   809		if (xfs_has_sparseinodes(mp) &&
   810		    mp->m_sb.sb_spino_align !=
   811				XFS_B_TO_FSBT(mp, igeo->inode_cluster_size_raw)) {
   812			xfs_warn(mp,
   813		"Sparse inode block alignment (%u) must match cluster size (%llu).",
   814				 mp->m_sb.sb_spino_align,
   815				 XFS_B_TO_FSBT(mp, igeo->inode_cluster_size_raw));
   816			error = -EINVAL;
   817			goto out_remove_uuid;
   818		}
   819	
   820		/*
   821		 * Check that the data (and log if separate) is an ok size.
   822		 */
   823		error = xfs_check_sizes(mp);
   824		if (error)
   825			goto out_remove_uuid;
   826	
   827		/*
   828		 * Initialize realtime fields in the mount structure
   829		 */
   830		error = xfs_rtmount_init(mp);
   831		if (error) {
   832			xfs_warn(mp, "RT mount failed");
   833			goto out_remove_uuid;
   834		}
   835	
   836		/*
   837		 *  Copies the low order bits of the timestamp and the randomly
   838		 *  set "sequence" number out of a UUID.
   839		 */
   840		mp->m_fixedfsid[0] =
   841			(get_unaligned_be16(&sbp->sb_uuid.b[8]) << 16) |
   842			 get_unaligned_be16(&sbp->sb_uuid.b[4]);
   843		mp->m_fixedfsid[1] = get_unaligned_be32(&sbp->sb_uuid.b[0]);
   844	
   845		error = xfs_da_mount(mp);
   846		if (error) {
   847			xfs_warn(mp, "Failed dir/attr init: %d", error);
   848			goto out_remove_uuid;
   849		}
   850	
   851		/*
   852		 * Initialize the precomputed transaction reservations values.
   853		 */
   854		xfs_trans_init(mp);
   855	
   856		/*
   857		 * Allocate and initialize the per-ag data.
   858		 */
   859		error = xfs_initialize_perag(mp, 0, sbp->sb_agcount,
   860				mp->m_sb.sb_dblocks, &mp->m_maxagi);
   861		if (error) {
   862			xfs_warn(mp, "Failed per-ag init: %d", error);
   863			goto out_free_dir;
   864		}
   865	
   866		error = xfs_initialize_rtgroups(mp, 0, sbp->sb_rgcount,
   867				mp->m_sb.sb_rextents);
   868		if (error) {
   869			xfs_warn(mp, "Failed rtgroup init: %d", error);
   870			goto out_free_perag;
   871		}
   872	
   873		if (XFS_IS_CORRUPT(mp, !sbp->sb_logblocks)) {
   874			xfs_warn(mp, "no log defined");
   875			error = -EFSCORRUPTED;
   876			goto out_free_rtgroup;
   877		}
   878	
   879		error = xfs_inodegc_register_shrinker(mp);
   880		if (error)
   881			goto out_fail_wait;
   882	
   883		/*
   884		 * If we're resuming quota status, pick up the preliminary qflags from
   885		 * the ondisk superblock so that we know if we should recover dquots.
   886		 */
   887		if (xfs_is_resuming_quotaon(mp))
   888			xfs_qm_resume_quotaon(mp);
   889	
   890		/*
   891		 * Log's mount-time initialization. The first part of recovery can place
   892		 * some items on the AIL, to be handled when recovery is finished or
   893		 * cancelled.
   894		 */
   895		error = xfs_log_mount(mp, mp->m_logdev_targp,
   896				      XFS_FSB_TO_DADDR(mp, sbp->sb_logstart),
   897				      XFS_FSB_TO_BB(mp, sbp->sb_logblocks));
   898		if (error) {
   899			xfs_warn(mp, "log mount failed");
   900			goto out_inodegc_shrinker;
   901		}
   902	
   903		/*
   904		 * If we're resuming quota status and recovered the log, re-sample the
   905		 * qflags from the ondisk superblock now that we've recovered it, just
   906		 * in case someone shut down enforcement just before a crash.
   907		 */
   908		if (xfs_clear_resuming_quotaon(mp) && xlog_recovery_needed(mp->m_log))
   909			xfs_qm_resume_quotaon(mp);
   910	
   911		/*
   912		 * If logged xattrs are still enabled after log recovery finishes, then
   913		 * they'll be available until unmount.  Otherwise, turn them off.
   914		 */
   915		if (xfs_sb_version_haslogxattrs(&mp->m_sb))
   916			xfs_set_using_logged_xattrs(mp);
   917		else
   918			xfs_clear_using_logged_xattrs(mp);
   919	
   920		/* Enable background inode inactivation workers. */
   921		xfs_inodegc_start(mp);
   922		xfs_blockgc_start(mp);
   923	
   924		/*
   925		 * Now that we've recovered any pending superblock feature bit
   926		 * additions, we can finish setting up the attr2 behaviour for the
   927		 * mount. The noattr2 option overrides the superblock flag, so only
   928		 * check the superblock feature flag if the mount option is not set.
   929		 */
   930		if (xfs_has_noattr2(mp)) {
   931			mp->m_features &= ~XFS_FEAT_ATTR2;
   932		} else if (!xfs_has_attr2(mp) &&
   933			   (mp->m_sb.sb_features2 & XFS_SB_VERSION2_ATTR2BIT)) {
   934			mp->m_features |= XFS_FEAT_ATTR2;
   935		}
   936	
   937		if (xfs_has_metadir(mp)) {
   938			error = xfs_mount_setup_metadir(mp);
   939			if (error)
   940				goto out_free_metadir;
   941		}
   942	
   943		/*
   944		 * Get and sanity-check the root inode.
   945		 * Save the pointer to it in the mount structure.
   946		 */
   947		error = xfs_iget(mp, NULL, sbp->sb_rootino, XFS_IGET_UNTRUSTED,
   948				 XFS_ILOCK_EXCL, &rip);
   949		if (error) {
   950			xfs_warn(mp,
   951				"Failed to read root inode 0x%llx, error %d",
   952				sbp->sb_rootino, -error);
   953			goto out_free_metadir;
   954		}
   955	
   956		ASSERT(rip != NULL);
   957	
   958		if (XFS_IS_CORRUPT(mp, !S_ISDIR(VFS_I(rip)->i_mode))) {
   959			xfs_warn(mp, "corrupted root inode %llu: not a directory",
   960				(unsigned long long)rip->i_ino);
   961			xfs_iunlock(rip, XFS_ILOCK_EXCL);
   962			error = -EFSCORRUPTED;
   963			goto out_rele_rip;
   964		}
   965		mp->m_rootip = rip;	/* save it */
   966	
   967		xfs_iunlock(rip, XFS_ILOCK_EXCL);
   968	
   969		/*
   970		 * Initialize realtime inode pointers in the mount structure
   971		 */
   972		error = xfs_rtmount_inodes(mp);
   973		if (error) {
   974			/*
   975			 * Free up the root inode.
   976			 */
   977			xfs_warn(mp, "failed to read RT inodes");
   978			goto out_rele_rip;
   979		}
   980	
   981		if (xfs_has_zoned(mp)) {
   982			error = xfs_mount_zones(mp);
   983			if (error)
   984				goto out_rtunmount;
   985		}
   986	
   987		/* Make sure the summary counts are ok. */
   988		error = xfs_check_summary_counts(mp);
   989		if (error)
   990			goto out_unmount_zones;
   991	
   992		/*
   993		 * If this is a read-only mount defer the superblock updates until
   994		 * the next remount into writeable mode.  Otherwise we would never
   995		 * perform the update e.g. for the root filesystem.
   996		 */
   997		if (mp->m_update_sb && !xfs_is_readonly(mp)) {
   998			error = xfs_sync_sb(mp, false);
   999			if (error) {
  1000				xfs_warn(mp, "failed to write sb changes");
  1001				goto out_rtunmount;
  1002			}
  1003		}
  1004	
  1005		/*
  1006		 * Initialise the XFS quota management subsystem for this mount
  1007		 */
  1008		if (XFS_IS_QUOTA_ON(mp)) {
  1009			error = xfs_qm_newmount(mp, &quotamount, &quotaflags);
  1010			if (error)
  1011				goto out_rtunmount;
  1012		} else {
  1013			/*
  1014			 * If a file system had quotas running earlier, but decided to
  1015			 * mount without -o uquota/pquota/gquota options, revoke the
  1016			 * quotachecked license.
  1017			 */
  1018			if (mp->m_sb.sb_qflags & XFS_ALL_QUOTA_ACCT) {
  1019				xfs_notice(mp, "resetting quota flags");
  1020				error = xfs_mount_reset_sbqflags(mp);
  1021				if (error)
  1022					goto out_rtunmount;
  1023			}
  1024		}
  1025	
  1026		/*
  1027		 * Finish recovering the file system.  This part needed to be delayed
  1028		 * until after the root and real-time bitmap inodes were consistently
  1029		 * read in.  Temporarily create per-AG space reservations for metadata
  1030		 * btree shape changes because space freeing transactions (for inode
  1031		 * inactivation) require the per-AG reservation in lieu of reserving
  1032		 * blocks.
  1033		 */
  1034		error = xfs_fs_reserve_ag_blocks(mp);
  1035		if (error && error == -ENOSPC)
  1036			xfs_warn(mp,
  1037		"ENOSPC reserving per-AG metadata pool, log recovery may fail.");
  1038		error = xfs_log_mount_finish(mp);
  1039		xfs_fs_unreserve_ag_blocks(mp);
  1040		if (error) {
  1041			xfs_warn(mp, "log mount finish failed");
  1042			goto out_rtunmount;
  1043		}
  1044	
  1045		/*
  1046		 * Now the log is fully replayed, we can transition to full read-only
  1047		 * mode for read-only mounts. This will sync all the metadata and clean
  1048		 * the log so that the recovery we just performed does not have to be
  1049		 * replayed again on the next mount.
  1050		 *
  1051		 * We use the same quiesce mechanism as the rw->ro remount, as they are
  1052		 * semantically identical operations.
  1053		 */
  1054		if (xfs_is_readonly(mp) && !xfs_has_norecovery(mp))
  1055			xfs_log_clean(mp);
  1056	
  1057		/*
  1058		 * Complete the quota initialisation, post-log-replay component.
  1059		 */
  1060		if (quotamount) {
  1061			ASSERT(mp->m_qflags == 0);
  1062			mp->m_qflags = quotaflags;
  1063	
  1064			xfs_qm_mount_quotas(mp);
  1065		}
  1066	
  1067		/*
  1068		 * Now we are mounted, reserve a small amount of unused space for
  1069		 * privileged transactions. This is needed so that transaction
  1070		 * space required for critical operations can dip into this pool
  1071		 * when at ENOSPC. This is needed for operations like create with
  1072		 * attr, unwritten extent conversion at ENOSPC, garbage collection
  1073		 * etc. Data allocations are not allowed to use this reserved space.
  1074		 *
  1075		 * This may drive us straight to ENOSPC on mount, but that implies
  1076		 * we were already there on the last unmount. Warn if this occurs.
  1077		 */
  1078		if (!xfs_is_readonly(mp)) {
  1079			for (i = 0; i < FREE_NR; i++) {
  1080				error = xfs_reserve_blocks(mp, i,
  1081						xfs_default_resblks(mp, i));
  1082				if (error)
  1083					xfs_warn(mp,
  1084		"Unable to allocate reserve blocks. Continuing without reserve pool.");
  1085			}
  1086	
  1087			/* Reserve AG blocks for future btree expansion. */
  1088			error = xfs_fs_reserve_ag_blocks(mp);
  1089			if (error && error != -ENOSPC)
  1090				goto out_agresv;
  1091		}
  1092	
  1093		if (!xfs_is_readonly(mp))
  1094			xfs_zone_gc_start(mp);
  1095	
  1096		return 0;
  1097	
  1098	 out_agresv:
  1099		xfs_fs_unreserve_ag_blocks(mp);
  1100		xfs_qm_unmount_quotas(mp);
  1101	 out_unmount_zones:
  1102		if (xfs_has_zoned(mp))
> 1103			xfs_unmount_zones(mp);
  1104	 out_rtunmount:
  1105		xfs_rtunmount_inodes(mp);
  1106	 out_rele_rip:
  1107		xfs_irele(rip);
  1108		/* Clean out dquots that might be in memory after quotacheck. */
  1109		xfs_qm_unmount(mp);
  1110	 out_free_metadir:
  1111		if (mp->m_metadirip)
  1112			xfs_irele(mp->m_metadirip);
  1113	
  1114		/*
  1115		 * Inactivate all inodes that might still be in memory after a log
  1116		 * intent recovery failure so that reclaim can free them.  Metadata
  1117		 * inodes and the root directory shouldn't need inactivation, but the
  1118		 * mount failed for some reason, so pull down all the state and flee.
  1119		 */
  1120		xfs_inodegc_flush(mp);
  1121	
  1122		/*
  1123		 * Flush all inode reclamation work and flush the log.
  1124		 * We have to do this /after/ rtunmount and qm_unmount because those
  1125		 * two will have scheduled delayed reclaim for the rt/quota inodes.
  1126		 *
  1127		 * This is slightly different from the unmountfs call sequence
  1128		 * because we could be tearing down a partially set up mount.  In
  1129		 * particular, if log_mount_finish fails we bail out without calling
  1130		 * qm_unmount_quotas and therefore rely on qm_unmount to release the
  1131		 * quota inodes.
  1132		 */
  1133		xfs_unmount_flush_inodes(mp);
  1134		xfs_log_mount_cancel(mp);
  1135	 out_inodegc_shrinker:
  1136		shrinker_free(mp->m_inodegc_shrinker);
  1137	 out_fail_wait:
  1138		if (mp->m_logdev_targp && mp->m_logdev_targp != mp->m_ddev_targp)
  1139			xfs_buftarg_drain(mp->m_logdev_targp);
  1140		xfs_buftarg_drain(mp->m_ddev_targp);
  1141	 out_free_rtgroup:
  1142		xfs_free_rtgroups(mp, 0, mp->m_sb.sb_rgcount);
  1143	 out_free_perag:
  1144		xfs_free_perag_range(mp, 0, mp->m_sb.sb_agcount);
  1145	 out_free_dir:
  1146		xfs_da_unmount(mp);
  1147	 out_remove_uuid:
  1148		xfs_uuid_unmount(mp);
  1149	 out_remove_errortag:
  1150		xfs_errortag_del(mp);
  1151	 out_remove_error_sysfs:
  1152		xfs_error_sysfs_del(mp);
  1153	 out_remove_scrub_stats:
  1154		xchk_stats_unregister(mp->m_scrub_stats);
  1155		xfs_sysfs_del(&mp->m_stats.xs_kobj);
  1156	 out_remove_sysfs:
  1157		xfs_sysfs_del(&mp->m_kobj);
  1158	 out:
  1159		return error;
  1160	}
  1161	
  1162	/*
  1163	 * This flushes out the inodes,dquots and the superblock, unmounts the
  1164	 * log and makes sure that incore structures are freed.
  1165	 */
  1166	void
  1167	xfs_unmountfs(
  1168		struct xfs_mount	*mp)
  1169	{
  1170		int			error;
  1171	
  1172		/*
  1173		 * Perform all on-disk metadata updates required to inactivate inodes
  1174		 * that the VFS evicted earlier in the unmount process.  Freeing inodes
  1175		 * and discarding CoW fork preallocations can cause shape changes to
  1176		 * the free inode and refcount btrees, respectively, so we must finish
  1177		 * this before we discard the metadata space reservations.  Metadata
  1178		 * inodes and the root directory do not require inactivation.
  1179		 */
  1180		xfs_inodegc_flush(mp);
  1181	
  1182		xfs_blockgc_stop(mp);
  1183		if (!test_bit(XFS_OPSTATE_READONLY, &mp->m_opstate))
  1184			xfs_zone_gc_stop(mp);
  1185		xfs_fs_unreserve_ag_blocks(mp);
  1186		xfs_qm_unmount_quotas(mp);
  1187		if (xfs_has_zoned(mp))
> 1188			xfs_unmount_zones(mp);
  1189		xfs_rtunmount_inodes(mp);
  1190		xfs_irele(mp->m_rootip);
  1191		if (mp->m_metadirip)
  1192			xfs_irele(mp->m_metadirip);
  1193	
  1194		xfs_unmount_flush_inodes(mp);
  1195	
  1196		xfs_qm_unmount(mp);
  1197	
  1198		/*
  1199		 * Unreserve any blocks we have so that when we unmount we don't account
  1200		 * the reserved free space as used. This is really only necessary for
  1201		 * lazy superblock counting because it trusts the incore superblock
  1202		 * counters to be absolutely correct on clean unmount.
  1203		 *
  1204		 * We don't bother correcting this elsewhere for lazy superblock
  1205		 * counting because on mount of an unclean filesystem we reconstruct the
  1206		 * correct counter value and this is irrelevant.
  1207		 *
  1208		 * For non-lazy counter filesystems, this doesn't matter at all because
  1209		 * we only every apply deltas to the superblock and hence the incore
  1210		 * value does not matter....
  1211		 */
  1212		error = xfs_reserve_blocks(mp, FREE_BLOCKS, 0);
  1213		if (error)
  1214			xfs_warn(mp, "Unable to free reserved block pool. "
  1215					"Freespace may not be correct on next mount.");
  1216		xfs_unmount_check(mp);
  1217	
  1218		/*
  1219		 * Indicate that it's ok to clear log incompat bits before cleaning
  1220		 * the log and writing the unmount record.
  1221		 */
  1222		xfs_set_done_with_log_incompat(mp);
  1223		xfs_log_unmount(mp);
  1224		xfs_da_unmount(mp);
  1225		xfs_uuid_unmount(mp);
  1226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
