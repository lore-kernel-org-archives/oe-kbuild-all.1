Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478DA3C082
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbhI46h0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701768334; x=1733304334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+cj7OQt8e/BLon4dHUxxDV54bF5kvg6oF3Ts0Zc/Ng=;
  b=WbhI46h0ZBBG3RW1xnuH1g6cpMaXJxSaDzfC8gUdYAcWkfvGI1UwIs1s
   q+ggKQxd+FGxbVQLwI+rY7UrcD5T5O6CHL3zE+2oOBBbE1efljU7Xmh5h
   tzlgvroDyLdvjSWMagg3EjZonmygoHS2Ij2UKXH9+1i2uKVHmg0O9WVJS
   c6X4oAGhTdeGVapMSZwDdhyjJrn2/nMeuUjaObyS/GFUKCF22x2DgMSEo
   prR2rSzkYQdMAPhj8rtGP5VMSu/3WvYCyd8lnDjBhrhMUMF0OjM249fq1
   jntBWuxFDl7J7Y0BgVNM6ofP8bniMIvHryiTDZQRPpetzOs/c/SpRCnJ7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="946501"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="946501"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 01:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="18899220"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2023 01:25:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rARgG-0008f5-2j;
	Tue, 05 Dec 2023 09:25:28 +0000
Date: Tue, 5 Dec 2023 17:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fix-rtmount-overflows-6.7 20/20]
 fs/xfs/libxfs/xfs_sb.c:512:8: error: implicit declaration of function
 'xfs_validate_rtextents' is invalid in C99
Message-ID: <202312051707.GCc4tV9a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fix-rtmount-overflows-6.7
head:   435e0fd775b6fa76a4dfd605d523b48561723e6b
commit: 1d648213d57c406688c432792cb1fec11a74044e [20/20] xfs: don't allow overly small or large realtime volumes
config: powerpc-g5_defconfig (https://download.01.org/0day-ci/archive/20231205/202312051707.GCc4tV9a-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051707.GCc4tV9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051707.GCc4tV9a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_sb.c:512:8: error: implicit declaration of function 'xfs_validate_rtextents' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!xfs_validate_rtextents(rexts) ||
                        ^
   fs/xfs/libxfs/xfs_sb.c:512:8: note: did you mean 'xfs_validate_ag_length'?
   fs/xfs/libxfs/xfs_alloc.h:276:16: note: 'xfs_validate_ag_length' declared here
   xfs_failaddr_t xfs_validate_ag_length(struct xfs_buf *bp, uint32_t seqno,
                  ^
   fs/xfs/libxfs/xfs_sb.c:514:27: error: implicit declaration of function 'xfs_compute_rextslog' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                       sbp->sb_rextslog != xfs_compute_rextslog(rexts) ||
                                           ^
   2 errors generated.


vim +/xfs_validate_rtextents +512 fs/xfs/libxfs/xfs_sb.c

   304	
   305	/* Check the validity of the SB. */
   306	STATIC int
   307	xfs_validate_sb_common(
   308		struct xfs_mount	*mp,
   309		struct xfs_buf		*bp,
   310		struct xfs_sb		*sbp)
   311	{
   312		struct xfs_dsb		*dsb = bp->b_addr;
   313		uint32_t		agcount = 0;
   314		uint32_t		rem;
   315		bool			has_dalign;
   316	
   317		if (!xfs_verify_magic(bp, dsb->sb_magicnum)) {
   318			xfs_warn(mp,
   319	"Superblock has bad magic number 0x%x. Not an XFS filesystem?",
   320				be32_to_cpu(dsb->sb_magicnum));
   321			return -EWRONGFS;
   322		}
   323	
   324		if (!xfs_sb_good_version(sbp)) {
   325			xfs_warn(mp,
   326	"Superblock has unknown features enabled or corrupted feature masks.");
   327			return -EWRONGFS;
   328		}
   329	
   330		/*
   331		 * Validate feature flags and state
   332		 */
   333		if (xfs_sb_is_v5(sbp)) {
   334			if (sbp->sb_blocksize < XFS_MIN_CRC_BLOCKSIZE) {
   335				xfs_notice(mp,
   336	"Block size (%u bytes) too small for Version 5 superblock (minimum %d bytes)",
   337					sbp->sb_blocksize, XFS_MIN_CRC_BLOCKSIZE);
   338				return -EFSCORRUPTED;
   339			}
   340	
   341			/* V5 has a separate project quota inode */
   342			if (sbp->sb_qflags & (XFS_OQUOTA_ENFD | XFS_OQUOTA_CHKD)) {
   343				xfs_notice(mp,
   344				   "Version 5 of Super block has XFS_OQUOTA bits.");
   345				return -EFSCORRUPTED;
   346			}
   347	
   348			/*
   349			 * Full inode chunks must be aligned to inode chunk size when
   350			 * sparse inodes are enabled to support the sparse chunk
   351			 * allocation algorithm and prevent overlapping inode records.
   352			 */
   353			if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_SPINODES) {
   354				uint32_t	align;
   355	
   356				align = XFS_INODES_PER_CHUNK * sbp->sb_inodesize
   357						>> sbp->sb_blocklog;
   358				if (sbp->sb_inoalignmt != align) {
   359					xfs_warn(mp,
   360	"Inode block alignment (%u) must match chunk size (%u) for sparse inodes.",
   361						 sbp->sb_inoalignmt, align);
   362					return -EINVAL;
   363				}
   364			}
   365		} else if (sbp->sb_qflags & (XFS_PQUOTA_ENFD | XFS_GQUOTA_ENFD |
   366					XFS_PQUOTA_CHKD | XFS_GQUOTA_CHKD)) {
   367				xfs_notice(mp,
   368	"Superblock earlier than Version 5 has XFS_{P|G}QUOTA_{ENFD|CHKD} bits.");
   369				return -EFSCORRUPTED;
   370		}
   371	
   372		if (unlikely(
   373		    sbp->sb_logstart == 0 && mp->m_logdev_targp == mp->m_ddev_targp)) {
   374			xfs_warn(mp,
   375			"filesystem is marked as having an external log; "
   376			"specify logdev on the mount command line.");
   377			return -EINVAL;
   378		}
   379	
   380		if (unlikely(
   381		    sbp->sb_logstart != 0 && mp->m_logdev_targp != mp->m_ddev_targp)) {
   382			xfs_warn(mp,
   383			"filesystem is marked as having an internal log; "
   384			"do not specify logdev on the mount command line.");
   385			return -EINVAL;
   386		}
   387	
   388		/* Compute agcount for this number of dblocks and agblocks */
   389		if (sbp->sb_agblocks) {
   390			agcount = div_u64_rem(sbp->sb_dblocks, sbp->sb_agblocks, &rem);
   391			if (rem)
   392				agcount++;
   393		}
   394	
   395		/*
   396		 * More sanity checking.  Most of these were stolen directly from
   397		 * xfs_repair.
   398		 */
   399		if (unlikely(
   400		    sbp->sb_agcount <= 0					||
   401		    sbp->sb_sectsize < XFS_MIN_SECTORSIZE			||
   402		    sbp->sb_sectsize > XFS_MAX_SECTORSIZE			||
   403		    sbp->sb_sectlog < XFS_MIN_SECTORSIZE_LOG			||
   404		    sbp->sb_sectlog > XFS_MAX_SECTORSIZE_LOG			||
   405		    sbp->sb_sectsize != (1 << sbp->sb_sectlog)			||
   406		    sbp->sb_blocksize < XFS_MIN_BLOCKSIZE			||
   407		    sbp->sb_blocksize > XFS_MAX_BLOCKSIZE			||
   408		    sbp->sb_blocklog < XFS_MIN_BLOCKSIZE_LOG			||
   409		    sbp->sb_blocklog > XFS_MAX_BLOCKSIZE_LOG			||
   410		    sbp->sb_blocksize != (1 << sbp->sb_blocklog)		||
   411		    sbp->sb_dirblklog + sbp->sb_blocklog > XFS_MAX_BLOCKSIZE_LOG ||
   412		    sbp->sb_inodesize < XFS_DINODE_MIN_SIZE			||
   413		    sbp->sb_inodesize > XFS_DINODE_MAX_SIZE			||
   414		    sbp->sb_inodelog < XFS_DINODE_MIN_LOG			||
   415		    sbp->sb_inodelog > XFS_DINODE_MAX_LOG			||
   416		    sbp->sb_inodesize != (1 << sbp->sb_inodelog)		||
   417		    sbp->sb_inopblock != howmany(sbp->sb_blocksize,sbp->sb_inodesize) ||
   418		    XFS_FSB_TO_B(mp, sbp->sb_agblocks) < XFS_MIN_AG_BYTES	||
   419		    XFS_FSB_TO_B(mp, sbp->sb_agblocks) > XFS_MAX_AG_BYTES	||
   420		    sbp->sb_agblklog != xfs_highbit32(sbp->sb_agblocks - 1) + 1	||
   421		    agcount == 0 || agcount != sbp->sb_agcount			||
   422		    (sbp->sb_blocklog - sbp->sb_inodelog != sbp->sb_inopblog)	||
   423		    (sbp->sb_rextsize * sbp->sb_blocksize > XFS_MAX_RTEXTSIZE)	||
   424		    (sbp->sb_rextsize * sbp->sb_blocksize < XFS_MIN_RTEXTSIZE)	||
   425		    (sbp->sb_imax_pct > 100 /* zero sb_imax_pct is valid */)	||
   426		    sbp->sb_dblocks == 0					||
   427		    sbp->sb_dblocks > XFS_MAX_DBLOCKS(sbp)			||
   428		    sbp->sb_dblocks < XFS_MIN_DBLOCKS(sbp)			||
   429		    sbp->sb_shared_vn != 0)) {
   430			xfs_notice(mp, "SB sanity check failed");
   431			return -EFSCORRUPTED;
   432		}
   433	
   434		/*
   435		 * Logs that are too large are not supported at all. Reject them
   436		 * outright. Logs that are too small are tolerated on v4 filesystems,
   437		 * but we can only check that when mounting the log. Hence we skip
   438		 * those checks here.
   439		 */
   440		if (sbp->sb_logblocks > XFS_MAX_LOG_BLOCKS) {
   441			xfs_notice(mp,
   442			"Log size 0x%x blocks too large, maximum size is 0x%llx blocks",
   443				 sbp->sb_logblocks, XFS_MAX_LOG_BLOCKS);
   444			return -EFSCORRUPTED;
   445		}
   446	
   447		if (XFS_FSB_TO_B(mp, sbp->sb_logblocks) > XFS_MAX_LOG_BYTES) {
   448			xfs_warn(mp,
   449			"log size 0x%llx bytes too large, maximum size is 0x%llx bytes",
   450				 XFS_FSB_TO_B(mp, sbp->sb_logblocks),
   451				 XFS_MAX_LOG_BYTES);
   452			return -EFSCORRUPTED;
   453		}
   454	
   455		/*
   456		 * Do not allow filesystems with corrupted log sector or stripe units to
   457		 * be mounted. We cannot safely size the iclogs or write to the log if
   458		 * the log stripe unit is not valid.
   459		 */
   460		if (sbp->sb_versionnum & XFS_SB_VERSION_SECTORBIT) {
   461			if (sbp->sb_logsectsize != (1U << sbp->sb_logsectlog)) {
   462				xfs_notice(mp,
   463				"log sector size in bytes/log2 (0x%x/0x%x) must match",
   464					sbp->sb_logsectsize, 1U << sbp->sb_logsectlog);
   465				return -EFSCORRUPTED;
   466			}
   467		} else if (sbp->sb_logsectsize || sbp->sb_logsectlog) {
   468			xfs_notice(mp,
   469			"log sector size in bytes/log2 (0x%x/0x%x) are not zero",
   470				sbp->sb_logsectsize, sbp->sb_logsectlog);
   471			return -EFSCORRUPTED;
   472		}
   473	
   474		if (sbp->sb_logsunit > 1) {
   475			if (sbp->sb_logsunit % sbp->sb_blocksize) {
   476				xfs_notice(mp,
   477			"log stripe unit 0x%x bytes must be a multiple of block size",
   478					sbp->sb_logsunit);
   479				return -EFSCORRUPTED;
   480			}
   481			if (sbp->sb_logsunit > XLOG_MAX_RECORD_BSIZE) {
   482				xfs_notice(mp,
   483			"log stripe unit 0x%x bytes over maximum size (0x%x bytes)",
   484					sbp->sb_logsunit, XLOG_MAX_RECORD_BSIZE);
   485				return -EFSCORRUPTED;
   486			}
   487		}
   488	
   489		/* Validate the realtime geometry; stolen from xfs_repair */
   490		if (sbp->sb_rextsize * sbp->sb_blocksize > XFS_MAX_RTEXTSIZE ||
   491		    sbp->sb_rextsize * sbp->sb_blocksize < XFS_MIN_RTEXTSIZE) {
   492			xfs_notice(mp,
   493				"realtime extent sanity check failed");
   494			return -EFSCORRUPTED;
   495		}
   496	
   497		if (sbp->sb_rblocks == 0) {
   498			if (sbp->sb_rextents != 0 || sbp->sb_rbmblocks != 0 ||
   499			    sbp->sb_rextslog != 0 || sbp->sb_frextents != 0) {
   500				xfs_notice(mp,
   501					"realtime zeroed geometry check failed");
   502				return -EFSCORRUPTED;
   503			}
   504		} else {
   505			uint64_t	rexts;
   506			uint64_t	rbmblocks;
   507	
   508			rexts = div_u64(sbp->sb_rblocks, sbp->sb_rextsize);
   509			rbmblocks = howmany_64(sbp->sb_rextents,
   510					       NBBY * sbp->sb_blocksize);
   511	
 > 512			if (!xfs_validate_rtextents(rexts) ||
   513			    sbp->sb_rextents != rexts ||
   514			    sbp->sb_rextslog != xfs_compute_rextslog(rexts) ||
   515			    sbp->sb_rbmblocks != rbmblocks) {
   516				xfs_notice(mp,
   517					"realtime geometry sanity check failed");
   518				return -EFSCORRUPTED;
   519			}
   520		}
   521	
   522		/*
   523		 * Either (sb_unit and !hasdalign) or (!sb_unit and hasdalign)
   524		 * would imply the image is corrupted.
   525		 */
   526		has_dalign = sbp->sb_versionnum & XFS_SB_VERSION_DALIGNBIT;
   527		if (!!sbp->sb_unit ^ has_dalign) {
   528			xfs_notice(mp, "SB stripe alignment sanity check failed");
   529			return -EFSCORRUPTED;
   530		}
   531	
   532		if (!xfs_validate_stripe_geometry(mp, XFS_FSB_TO_B(mp, sbp->sb_unit),
   533				XFS_FSB_TO_B(mp, sbp->sb_width), 0, false))
   534			return -EFSCORRUPTED;
   535	
   536		/*
   537		 * Currently only very few inode sizes are supported.
   538		 */
   539		switch (sbp->sb_inodesize) {
   540		case 256:
   541		case 512:
   542		case 1024:
   543		case 2048:
   544			break;
   545		default:
   546			xfs_warn(mp, "inode size of %d bytes not supported",
   547					sbp->sb_inodesize);
   548			return -ENOSYS;
   549		}
   550	
   551		return 0;
   552	}
   553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
