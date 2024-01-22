Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2487D40C01
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705947312; cv=none; b=XI9Dqr74q+CoOmxpzcicUKNd8Spmc3bu8vWawICQgLdohU11m1nEwEeUzwmxyfV7VQ/fE8X+iOVRNADkolov9yE/fypqCZ/IhfMf0jyg35n7+lkyc1iIEsrzcHl4nc47cafwSvZRd+D0o4cD6f+/ijQW2Da/rUuELxuhb5kCIK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705947312; c=relaxed/simple;
	bh=aquIAON3idvH5fGFPmo65QrFObWAwNiD/oP9Ke7erEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KoNczZgAmiDZYeSG+DOvDhNIKW50R7fSzhCAEyTAwEHAwnvFwaCHVbrEfnKWrw4fXD39PdnnXHuBbTLwBFSd/rpNZtgiKr1DRDeyzxArbP62vkVez4NOcR4LnbzFXb1SP8DMqGR6CxTr43CFe9So/7spgsx+qc0vj2eVbskzG20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSw8bAol; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSw8bAol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705947310; x=1737483310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aquIAON3idvH5fGFPmo65QrFObWAwNiD/oP9Ke7erEU=;
  b=NSw8bAolZAA3eGTNjmtOXK1WwoiIb7T70TU80NIBvu39OmiPrxoiVLce
   C+3PlcQKB89r/tBvm6izqZRjYL9t2ivTYtRs7o50f5Ux4kA8r2OD/ZfG/
   tO0spzaWrqrG7Q5QpedUPEi054+skfwo52lypp5lsqFkY1Y+g6TOqgh9R
   vTeYwBy5goZthrFTK9mdffzqyKhHXpV7eY/YyIchROjcAvJDId/XD556I
   E4npxGSk/RW5gYR3z5KSd4U4AAwHhsuztNcYNObcDdCbQ+20fDBwk4meS
   9QrE7Vfhy7mAa9CoZoYjYkJ8WM47wcb4ABG1drWohSuJhmqdCK1BNtWYK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="391711376"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="391711376"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 10:15:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="958822207"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="958822207"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Jan 2024 10:15:05 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRyp5-0006no-0z;
	Mon, 22 Jan 2024 18:15:03 +0000
Date: Tue, 23 Jan 2024 02:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 73/73] fs/xfs/xfs_mount.c:1153: undefined
 reference to `xfs_zone_gc_stop'
Message-ID: <202401230254.X8nd9Uue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   fe993d9ce4b06f9f36486f58cc478779e7d24ea5
commit: fe993d9ce4b06f9f36486f58cc478779e7d24ea5 [73/73] xfs: add proactive gc and write throtteling
config: i386-randconfig-012-20240122 (https://download.01.org/0day-ci/archive/20240123/202401230254.X8nd9Uue-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401230254.X8nd9Uue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401230254.X8nd9Uue-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_mount.o: in function `xfs_unmountfs':
>> fs/xfs/xfs_mount.c:1153: undefined reference to `xfs_zone_gc_stop'
   ld: fs/xfs/xfs_mount.o: in function `xfs_mountfs':
>> fs/xfs/xfs_mount.c:1067: undefined reference to `xfs_zone_gc_start'
   ld: fs/xfs/xfs_super.o: in function `xfs_remount_ro':
>> fs/xfs/xfs_super.c:1955: undefined reference to `xfs_zone_gc_stop'
   ld: fs/xfs/xfs_super.o: in function `xfs_remount_rw':
>> fs/xfs/xfs_super.c:1908: undefined reference to `xfs_zone_gc_start'


vim +1153 fs/xfs/xfs_mount.c

   684	
   685	/*
   686	 * This function does the following on an initial mount of a file system:
   687	 *	- reads the superblock from disk and init the mount struct
   688	 *	- if we're a 32-bit kernel, do a size check on the superblock
   689	 *		so we don't mount terabyte filesystems
   690	 *	- init mount struct realtime fields
   691	 *	- allocate inode hash table for fs
   692	 *	- init directory manager
   693	 *	- perform recovery and init the log manager
   694	 */
   695	int
   696	xfs_mountfs(
   697		struct xfs_mount	*mp)
   698	{
   699		struct xfs_sb		*sbp = &(mp->m_sb);
   700		struct xfs_inode	*rip;
   701		struct xfs_ino_geometry	*igeo = M_IGEO(mp);
   702		uint			quotamount = 0;
   703		uint			quotaflags = 0;
   704		int			error = 0;
   705		int			i;
   706	
   707		xfs_sb_mount_common(mp, sbp);
   708	
   709		/*
   710		 * Check for a mismatched features2 values.  Older kernels read & wrote
   711		 * into the wrong sb offset for sb_features2 on some platforms due to
   712		 * xfs_sb_t not being 64bit size aligned when sb_features2 was added,
   713		 * which made older superblock reading/writing routines swap it as a
   714		 * 64-bit value.
   715		 *
   716		 * For backwards compatibility, we make both slots equal.
   717		 *
   718		 * If we detect a mismatched field, we OR the set bits into the existing
   719		 * features2 field in case it has already been modified; we don't want
   720		 * to lose any features.  We then update the bad location with the ORed
   721		 * value so that older kernels will see any features2 flags. The
   722		 * superblock writeback code ensures the new sb_features2 is copied to
   723		 * sb_bad_features2 before it is logged or written to disk.
   724		 */
   725		if (xfs_sb_has_mismatched_features2(sbp)) {
   726			xfs_warn(mp, "correcting sb_features alignment problem");
   727			sbp->sb_features2 |= sbp->sb_bad_features2;
   728			mp->m_update_sb = true;
   729		}
   730	
   731	
   732		/* always use v2 inodes by default now */
   733		if (!(mp->m_sb.sb_versionnum & XFS_SB_VERSION_NLINKBIT)) {
   734			mp->m_sb.sb_versionnum |= XFS_SB_VERSION_NLINKBIT;
   735			mp->m_features |= XFS_FEAT_NLINK;
   736			mp->m_update_sb = true;
   737		}
   738	
   739		/*
   740		 * If we were given new sunit/swidth options, do some basic validation
   741		 * checks and convert the incore dalign and swidth values to the
   742		 * same units (FSB) that everything else uses.  This /must/ happen
   743		 * before computing the inode geometry.
   744		 */
   745		error = xfs_validate_new_dalign(mp);
   746		if (error)
   747			goto out;
   748	
   749		xfs_alloc_compute_maxlevels(mp);
   750		xfs_bmap_compute_maxlevels(mp, XFS_DATA_FORK);
   751		xfs_bmap_compute_maxlevels(mp, XFS_ATTR_FORK);
   752		xfs_mount_setup_inode_geom(mp);
   753		xfs_rmapbt_compute_maxlevels(mp);
   754		xfs_rtrmapbt_compute_maxlevels(mp);
   755		xfs_refcountbt_compute_maxlevels(mp);
   756		xfs_rtrefcountbt_compute_maxlevels(mp);
   757	
   758		xfs_agbtree_compute_maxlevels(mp);
   759		xfs_rtbtree_compute_maxlevels(mp);
   760	
   761		/*
   762		 * Check if sb_agblocks is aligned at stripe boundary.  If sb_agblocks
   763		 * is NOT aligned turn off m_dalign since allocator alignment is within
   764		 * an ag, therefore ag has to be aligned at stripe boundary.  Note that
   765		 * we must compute the free space and rmap btree geometry before doing
   766		 * this.
   767		 */
   768		error = xfs_update_alignment(mp);
   769		if (error)
   770			goto out;
   771	
   772		/* enable fail_at_unmount as default */
   773		mp->m_fail_unmount = true;
   774	
   775		error = xfs_sysfs_init(&mp->m_kobj, &xfs_mp_ktype,
   776				       NULL, mp->m_super->s_id);
   777		if (error)
   778			goto out;
   779	
   780		error = xfs_sysfs_init(&mp->m_stats.xs_kobj, &xfs_stats_ktype,
   781				       &mp->m_kobj, "stats");
   782		if (error)
   783			goto out_remove_sysfs;
   784	
   785		xchk_stats_register(mp->m_scrub_stats, mp->m_debugfs);
   786	
   787		error = xfs_error_sysfs_init(mp);
   788		if (error)
   789			goto out_remove_scrub_stats;
   790	
   791		error = xfs_errortag_init(mp);
   792		if (error)
   793			goto out_remove_error_sysfs;
   794	
   795		error = xfs_uuid_mount(mp);
   796		if (error)
   797			goto out_remove_errortag;
   798	
   799		/*
   800		 * Update the preferred write size based on the information from the
   801		 * on-disk superblock.
   802		 */
   803		mp->m_allocsize_log =
   804			max_t(uint32_t, sbp->sb_blocklog, mp->m_allocsize_log);
   805		mp->m_allocsize_blocks = 1U << (mp->m_allocsize_log - sbp->sb_blocklog);
   806	
   807		/* set the low space thresholds for dynamic preallocation */
   808		xfs_set_low_space_thresholds(mp);
   809	
   810		/*
   811		 * If enabled, sparse inode chunk alignment is expected to match the
   812		 * cluster size. Full inode chunk alignment must match the chunk size,
   813		 * but that is checked on sb read verification...
   814		 */
   815		if (xfs_has_sparseinodes(mp) &&
   816		    mp->m_sb.sb_spino_align !=
   817				XFS_B_TO_FSBT(mp, igeo->inode_cluster_size_raw)) {
   818			xfs_warn(mp,
   819		"Sparse inode block alignment (%u) must match cluster size (%llu).",
   820				 mp->m_sb.sb_spino_align,
   821				 XFS_B_TO_FSBT(mp, igeo->inode_cluster_size_raw));
   822			error = -EINVAL;
   823			goto out_remove_uuid;
   824		}
   825	
   826		/*
   827		 * Check that the data (and log if separate) is an ok size.
   828		 */
   829		error = xfs_check_sizes(mp);
   830		if (error)
   831			goto out_remove_uuid;
   832	
   833		/*
   834		 * Initialize realtime fields in the mount structure
   835		 */
   836		error = xfs_rtmount_init(mp);
   837		if (error) {
   838			xfs_warn(mp, "RT mount failed");
   839			goto out_remove_uuid;
   840		}
   841	
   842		/*
   843		 *  Copies the low order bits of the timestamp and the randomly
   844		 *  set "sequence" number out of a UUID.
   845		 */
   846		mp->m_fixedfsid[0] =
   847			(get_unaligned_be16(&sbp->sb_uuid.b[8]) << 16) |
   848			 get_unaligned_be16(&sbp->sb_uuid.b[4]);
   849		mp->m_fixedfsid[1] = get_unaligned_be32(&sbp->sb_uuid.b[0]);
   850	
   851		error = xfs_da_mount(mp);
   852		if (error) {
   853			xfs_warn(mp, "Failed dir/attr init: %d", error);
   854			goto out_remove_uuid;
   855		}
   856	
   857		/*
   858		 * Initialize the precomputed transaction reservations values.
   859		 */
   860		xfs_trans_init(mp);
   861	
   862		/*
   863		 * Allocate and initialize the per-ag data.
   864		 */
   865		error = xfs_initialize_perag(mp, sbp->sb_agcount, mp->m_sb.sb_dblocks,
   866				&mp->m_maxagi);
   867		if (error) {
   868			xfs_warn(mp, "Failed per-ag init: %d", error);
   869			goto out_free_dir;
   870		}
   871	
   872		error = xfs_initialize_rtgroups(mp, sbp->sb_rgcount);
   873		if (error) {
   874			xfs_warn(mp, "Failed rtgroup init: %d", error);
   875			goto out_free_perag;
   876		}
   877	
   878		if (XFS_IS_CORRUPT(mp, !sbp->sb_logblocks)) {
   879			xfs_warn(mp, "no log defined");
   880			error = -EFSCORRUPTED;
   881			goto out_free_rtgroup;
   882		}
   883	
   884		error = xfs_inodegc_register_shrinker(mp);
   885		if (error)
   886			goto out_fail_wait;
   887	
   888		/*
   889		 * Log's mount-time initialization. The first part of recovery can place
   890		 * some items on the AIL, to be handled when recovery is finished or
   891		 * cancelled.
   892		 */
   893		error = xfs_log_mount(mp, mp->m_logdev_targp,
   894				      XFS_FSB_TO_DADDR(mp, sbp->sb_logstart),
   895				      XFS_FSB_TO_BB(mp, sbp->sb_logblocks));
   896		if (error) {
   897			xfs_warn(mp, "log mount failed");
   898			goto out_inodegc_shrinker;
   899		}
   900	
   901		/* Enable background inode inactivation workers. */
   902		xfs_inodegc_start(mp);
   903		xfs_blockgc_start(mp);
   904	
   905		/*
   906		 * Now that we've recovered any pending superblock feature bit
   907		 * additions, we can finish setting up the attr2 behaviour for the
   908		 * mount. The noattr2 option overrides the superblock flag, so only
   909		 * check the superblock feature flag if the mount option is not set.
   910		 */
   911		if (xfs_has_noattr2(mp)) {
   912			mp->m_features &= ~XFS_FEAT_ATTR2;
   913		} else if (!xfs_has_attr2(mp) &&
   914			   (mp->m_sb.sb_features2 & XFS_SB_VERSION2_ATTR2BIT)) {
   915			mp->m_features |= XFS_FEAT_ATTR2;
   916		}
   917	
   918		error = xfs_mount_setup_metadir(mp);
   919		if (error)
   920			goto out_free_metadir;
   921	
   922		/*
   923		 * Get and sanity-check the root inode.
   924		 * Save the pointer to it in the mount structure.
   925		 */
   926		error = xfs_iget(mp, NULL, sbp->sb_rootino, XFS_IGET_UNTRUSTED,
   927				 XFS_ILOCK_EXCL, &rip);
   928		if (error) {
   929			xfs_warn(mp,
   930				"Failed to read root inode 0x%llx, error %d",
   931				sbp->sb_rootino, -error);
   932			goto out_free_metadir;
   933		}
   934	
   935		ASSERT(rip != NULL);
   936	
   937		if (XFS_IS_CORRUPT(mp, !S_ISDIR(VFS_I(rip)->i_mode))) {
   938			xfs_warn(mp, "corrupted root inode %llu: not a directory",
   939				(unsigned long long)rip->i_ino);
   940			xfs_iunlock(rip, XFS_ILOCK_EXCL);
   941			error = -EFSCORRUPTED;
   942			goto out_rele_rip;
   943		}
   944		mp->m_rootip = rip;	/* save it */
   945	
   946		xfs_iunlock(rip, XFS_ILOCK_EXCL);
   947	
   948		/*
   949		 * Initialize realtime inode pointers in the mount structure
   950		 */
   951		error = xfs_rtmount_inodes(mp);
   952		if (error) {
   953			/*
   954			 * Free up the root inode.
   955			 */
   956			xfs_warn(mp, "failed to read RT inodes");
   957			goto out_rele_rip;
   958		}
   959	
   960		/* Make sure the summary counts are ok. */
   961		error = xfs_check_summary_counts(mp);
   962		if (error)
   963			goto out_rtunmount;
   964	
   965		/*
   966		 * If this is a read-only mount defer the superblock updates until
   967		 * the next remount into writeable mode.  Otherwise we would never
   968		 * perform the update e.g. for the root filesystem.
   969		 */
   970		if (mp->m_update_sb && !xfs_is_readonly(mp)) {
   971			error = xfs_sync_sb(mp, false);
   972			if (error) {
   973				xfs_warn(mp, "failed to write sb changes");
   974				goto out_rtunmount;
   975			}
   976		}
   977	
   978		/*
   979		 * Initialise the XFS quota management subsystem for this mount
   980		 */
   981		if (XFS_IS_QUOTA_ON(mp)) {
   982			error = xfs_qm_newmount(mp, &quotamount, &quotaflags);
   983			if (error)
   984				goto out_rtunmount;
   985		} else {
   986			/*
   987			 * If a file system had quotas running earlier, but decided to
   988			 * mount without -o uquota/pquota/gquota options, revoke the
   989			 * quotachecked license.
   990			 */
   991			if (mp->m_sb.sb_qflags & XFS_ALL_QUOTA_ACCT) {
   992				xfs_notice(mp, "resetting quota flags");
   993				error = xfs_mount_reset_sbqflags(mp);
   994				if (error)
   995					goto out_rtunmount;
   996			}
   997		}
   998	
   999		/*
  1000		 * Finish recovering the file system.  This part needed to be delayed
  1001		 * until after the root and real-time bitmap inodes were consistently
  1002		 * read in.  Temporarily create per-AG space reservations for metadata
  1003		 * btree shape changes because space freeing transactions (for inode
  1004		 * inactivation) require the per-AG reservation in lieu of reserving
  1005		 * blocks.
  1006		 */
  1007		error = xfs_fs_reserve_ag_blocks(mp);
  1008		if (error && error == -ENOSPC)
  1009			xfs_warn(mp,
  1010		"ENOSPC reserving per-AG metadata pool, log recovery may fail.");
  1011		error = xfs_log_mount_finish(mp);
  1012		xfs_fs_unreserve_ag_blocks(mp);
  1013		if (error) {
  1014			xfs_warn(mp, "log mount finish failed");
  1015			goto out_rtunmount;
  1016		}
  1017	
  1018		/*
  1019		 * Now the log is fully replayed, we can transition to full read-only
  1020		 * mode for read-only mounts. This will sync all the metadata and clean
  1021		 * the log so that the recovery we just performed does not have to be
  1022		 * replayed again on the next mount.
  1023		 *
  1024		 * We use the same quiesce mechanism as the rw->ro remount, as they are
  1025		 * semantically identical operations.
  1026		 */
  1027		if (xfs_is_readonly(mp) && !xfs_has_norecovery(mp))
  1028			xfs_log_clean(mp);
  1029	
  1030		/*
  1031		 * Complete the quota initialisation, post-log-replay component.
  1032		 */
  1033		if (quotamount) {
  1034			ASSERT(mp->m_qflags == 0);
  1035			mp->m_qflags = quotaflags;
  1036	
  1037			xfs_qm_mount_quotas(mp);
  1038		}
  1039	
  1040		/*
  1041		 * Now we are mounted, reserve a small amount of unused space for
  1042		 * privileged transactions. This is needed so that transaction
  1043		 * space required for critical operations can dip into this pool
  1044		 * when at ENOSPC. This is needed for operations like create with
  1045		 * attr, unwritten extent conversion at ENOSPC, garbage collection
  1046		 * etc. Data allocations are not allowed to use this reserved space.
  1047		 *
  1048		 * This may drive us straight to ENOSPC on mount, but that implies
  1049		 * we were already there on the last unmount. Warn if this occurs.
  1050		 */
  1051		if (!xfs_is_readonly(mp)) {
  1052			for (i = 0; i < FREE_NR; i++) {
  1053				error = xfs_reserve_blocks(mp, i,
  1054						xfs_default_resblks(mp, i));
  1055				if (error)
  1056					xfs_warn(mp,
  1057		"Unable to allocate reserve blocks. Continuing without reserve pool.");
  1058			}
  1059	
  1060			/* Reserve AG blocks for future btree expansion. */
  1061			error = xfs_fs_reserve_ag_blocks(mp);
  1062			if (error && error != -ENOSPC)
  1063				goto out_agresv;
  1064		}
  1065	
  1066		if (!xfs_is_readonly(mp))
> 1067			xfs_zone_gc_start(mp);
  1068	
  1069		return 0;
  1070	
  1071	 out_agresv:
  1072		xfs_fs_unreserve_ag_blocks(mp);
  1073		xfs_qm_unmount_quotas(mp);
  1074	 out_rtunmount:
  1075		xfs_rtunmount_inodes(mp);
  1076	 out_rele_rip:
  1077		xfs_irele(rip);
  1078		/* Clean out dquots that might be in memory after quotacheck. */
  1079		xfs_qm_unmount(mp);
  1080	 out_free_metadir:
  1081		if (mp->m_metadirip)
  1082			xfs_imeta_irele(mp->m_metadirip);
  1083	
  1084		/*
  1085		 * Inactivate all inodes that might still be in memory after a log
  1086		 * intent recovery failure so that reclaim can free them.  Metadata
  1087		 * inodes and the root directory shouldn't need inactivation, but the
  1088		 * mount failed for some reason, so pull down all the state and flee.
  1089		 */
  1090		xfs_inodegc_flush(mp);
  1091	
  1092		/*
  1093		 * Flush all inode reclamation work and flush the log.
  1094		 * We have to do this /after/ rtunmount and qm_unmount because those
  1095		 * two will have scheduled delayed reclaim for the rt/quota inodes.
  1096		 *
  1097		 * This is slightly different from the unmountfs call sequence
  1098		 * because we could be tearing down a partially set up mount.  In
  1099		 * particular, if log_mount_finish fails we bail out without calling
  1100		 * qm_unmount_quotas and therefore rely on qm_unmount to release the
  1101		 * quota inodes.
  1102		 */
  1103		xfs_unmount_flush_inodes(mp);
  1104		xfs_log_mount_cancel(mp);
  1105	 out_inodegc_shrinker:
  1106		shrinker_free(mp->m_inodegc_shrinker);
  1107	 out_fail_wait:
  1108		if (mp->m_logdev_targp && mp->m_logdev_targp != mp->m_ddev_targp)
  1109			xfs_buftarg_drain(mp->m_logdev_targp);
  1110		xfs_buftarg_drain(mp->m_ddev_targp);
  1111	 out_free_rtgroup:
  1112		xfs_free_rtgroups(mp);
  1113	 out_free_perag:
  1114		xfs_free_perag(mp);
  1115	 out_free_dir:
  1116		xfs_da_unmount(mp);
  1117	 out_remove_uuid:
  1118		xfs_uuid_unmount(mp);
  1119	 out_remove_errortag:
  1120		xfs_errortag_del(mp);
  1121	 out_remove_error_sysfs:
  1122		xfs_error_sysfs_del(mp);
  1123	 out_remove_scrub_stats:
  1124		xchk_stats_unregister(mp->m_scrub_stats);
  1125		xfs_sysfs_del(&mp->m_stats.xs_kobj);
  1126	 out_remove_sysfs:
  1127		xfs_sysfs_del(&mp->m_kobj);
  1128	 out:
  1129		return error;
  1130	}
  1131	
  1132	/*
  1133	 * This flushes out the inodes,dquots and the superblock, unmounts the
  1134	 * log and makes sure that incore structures are freed.
  1135	 */
  1136	void
  1137	xfs_unmountfs(
  1138		struct xfs_mount	*mp)
  1139	{
  1140		int			error;
  1141	
  1142		/*
  1143		 * Perform all on-disk metadata updates required to inactivate inodes
  1144		 * that the VFS evicted earlier in the unmount process.  Freeing inodes
  1145		 * and discarding CoW fork preallocations can cause shape changes to
  1146		 * the free inode and refcount btrees, respectively, so we must finish
  1147		 * this before we discard the metadata space reservations.  Metadata
  1148		 * inodes and the root directory do not require inactivation.
  1149		 */
  1150		xfs_inodegc_flush(mp);
  1151	
  1152		xfs_blockgc_stop(mp);
> 1153		xfs_zone_gc_stop(mp);
  1154		xfs_fs_unreserve_ag_blocks(mp);
  1155		xfs_qm_unmount_quotas(mp);
  1156		xfs_rtunmount_inodes(mp);
  1157		xfs_irele(mp->m_rootip);
  1158		if (mp->m_metadirip)
  1159			xfs_imeta_irele(mp->m_metadirip);
  1160	
  1161		xfs_unmount_flush_inodes(mp);
  1162	
  1163		xfs_qm_unmount(mp);
  1164	
  1165		/*
  1166		 * Unreserve any blocks we have so that when we unmount we don't account
  1167		 * the reserved free space as used. This is really only necessary for
  1168		 * lazy superblock counting because it trusts the incore superblock
  1169		 * counters to be absolutely correct on clean unmount.
  1170		 *
  1171		 * We don't bother correcting this elsewhere for lazy superblock
  1172		 * counting because on mount of an unclean filesystem we reconstruct the
  1173		 * correct counter value and this is irrelevant.
  1174		 *
  1175		 * For non-lazy counter filesystems, this doesn't matter at all because
  1176		 * we only every apply deltas to the superblock and hence the incore
  1177		 * value does not matter....
  1178		 */
  1179		error = xfs_reserve_blocks(mp, FREE_BLOCKS, 0);
  1180		if (error)
  1181			xfs_warn(mp, "Unable to free reserved block pool. "
  1182					"Freespace may not be correct on next mount.");
  1183		xfs_unmount_check(mp);
  1184	
  1185		xfs_log_unmount(mp);
  1186		xfs_da_unmount(mp);
  1187		xfs_uuid_unmount(mp);
  1188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
