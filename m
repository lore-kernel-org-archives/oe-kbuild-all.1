Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88719F48D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 22:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727821152; cv=none; b=Mrna7wnLt4rbp83ISXYOlhTGf5E8URKy5UItx3qEL3TJfKD6ZRqDh/+Ew/P2Ln5mHIC4yLmgSogfsmbBAYN3ro57Ex+NHzticVaChsC2PAff+ET+Veuve3wOGWStN5CQ0l0341GfoSBDkeT9O6K5D8QpUhuOdBu2FfyfQpahpGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727821152; c=relaxed/simple;
	bh=HOMW7ID0ii6jxqemSw0tz4hFbrK4soV1Viol1pMyWh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQZxWhTPJKQtyUJs6rWWDXCttagaAcvgflM+JUuByrcqpjDAn69zVsW95A9TbMq0FQ5CCIJMhBd9xpoPl3rLcOXUyzW87CNsfgjX32z887/xQRH71uoDFhjNPQEbjVs8qlAujlu41z2wM0UBx2n+ohSopl11CGVlcSKVijA16DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLe+sX7F; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLe+sX7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727821150; x=1759357150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HOMW7ID0ii6jxqemSw0tz4hFbrK4soV1Viol1pMyWh0=;
  b=lLe+sX7F7G5+7mtTPZXjmGHn6VNuC+bqGmZXCv2g+UnOQSgSiAYLb0p2
   23kmQJFR2eh/Id+FHhP/Qx6NtABZ5sCon4jJ0GR5KnFjUbWjwZ6DTAnkR
   jJj1gSLGSFtcbTUdL1BHekNMp7KnCc0xM6NnmRAPVhMsZQxJXwb5kpVWe
   snB34yX56xcwAUgqUeBAoraK3LRbxeMZZdA9RW3qYlVpmU+KvJLNKowZq
   OXVR20qCVV2gFii5J8NB1rcAWgT+aTHRNX56VUnocaKzwWO6DhJeCy+u7
   sKwKkfGAfA2SkCn6+XINYrhvKv1mxAEcYp30S2Btwcd/pPcJallPuc0t7
   A==;
X-CSE-ConnectionGUID: M6+f4qBWQ/GnR8+XWlJ92Q==
X-CSE-MsgGUID: d2cMKeTtTmmHeCVdhXFXeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30684939"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="30684939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 15:19:09 -0700
X-CSE-ConnectionGUID: zz6CtOsNS/2rD4S/S9ELEg==
X-CSE-MsgGUID: Ynw/Ng9QTKmuHnqnTMEz1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="73687433"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2024 15:19:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svlD0-000RED-0R;
	Tue, 01 Oct 2024 22:19:06 +0000
Date: Wed, 2 Oct 2024 06:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:djwong-wtf 116/261] fs/xfs/libxfs/xfs_sb.c:815:38:
 sparse: sparse: cast to restricted __be16
Message-ID: <202410020630.fwJzSPYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git djwong-wtf
head:   9d1f16e58290609d9adf9db6f08496c9dae4d126
commit: 5fd87456da7bde1633969dd482d4e2f592b9576a [116/261] xfs: make xfs_rtblock_t a segmented address like xfs_fsblock_t
config: x86_64-randconfig-121-20241002 (https://download.01.org/0day-ci/archive/20241002/202410020630.fwJzSPYs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020630.fwJzSPYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020630.fwJzSPYs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_sb.c:815:38: sparse: sparse: cast to restricted __be16

vim +815 fs/xfs/libxfs/xfs_sb.c

   736	
   737	static void
   738	__xfs_sb_from_disk(
   739		struct xfs_sb	*to,
   740		struct xfs_dsb	*from,
   741		bool		convert_xquota)
   742	{
   743		to->sb_magicnum = be32_to_cpu(from->sb_magicnum);
   744		to->sb_blocksize = be32_to_cpu(from->sb_blocksize);
   745		to->sb_dblocks = be64_to_cpu(from->sb_dblocks);
   746		to->sb_rblocks = be64_to_cpu(from->sb_rblocks);
   747		to->sb_rextents = be64_to_cpu(from->sb_rextents);
   748		memcpy(&to->sb_uuid, &from->sb_uuid, sizeof(to->sb_uuid));
   749		to->sb_logstart = be64_to_cpu(from->sb_logstart);
   750		to->sb_rootino = be64_to_cpu(from->sb_rootino);
   751		to->sb_rbmino = be64_to_cpu(from->sb_rbmino);
   752		to->sb_rsumino = be64_to_cpu(from->sb_rsumino);
   753		to->sb_rextsize = be32_to_cpu(from->sb_rextsize);
   754		to->sb_agblocks = be32_to_cpu(from->sb_agblocks);
   755		to->sb_agcount = be32_to_cpu(from->sb_agcount);
   756		to->sb_rbmblocks = be32_to_cpu(from->sb_rbmblocks);
   757		to->sb_logblocks = be32_to_cpu(from->sb_logblocks);
   758		to->sb_versionnum = be16_to_cpu(from->sb_versionnum);
   759		to->sb_sectsize = be16_to_cpu(from->sb_sectsize);
   760		to->sb_inodesize = be16_to_cpu(from->sb_inodesize);
   761		to->sb_inopblock = be16_to_cpu(from->sb_inopblock);
   762		memcpy(&to->sb_fname, &from->sb_fname, sizeof(to->sb_fname));
   763		to->sb_blocklog = from->sb_blocklog;
   764		to->sb_sectlog = from->sb_sectlog;
   765		to->sb_inodelog = from->sb_inodelog;
   766		to->sb_inopblog = from->sb_inopblog;
   767		to->sb_agblklog = from->sb_agblklog;
   768		to->sb_rextslog = from->sb_rextslog;
   769		to->sb_inprogress = from->sb_inprogress;
   770		to->sb_imax_pct = from->sb_imax_pct;
   771		to->sb_icount = be64_to_cpu(from->sb_icount);
   772		to->sb_ifree = be64_to_cpu(from->sb_ifree);
   773		to->sb_fdblocks = be64_to_cpu(from->sb_fdblocks);
   774		to->sb_frextents = be64_to_cpu(from->sb_frextents);
   775		to->sb_uquotino = be64_to_cpu(from->sb_uquotino);
   776		to->sb_gquotino = be64_to_cpu(from->sb_gquotino);
   777		to->sb_qflags = be16_to_cpu(from->sb_qflags);
   778		to->sb_flags = from->sb_flags;
   779		to->sb_shared_vn = from->sb_shared_vn;
   780		to->sb_inoalignmt = be32_to_cpu(from->sb_inoalignmt);
   781		to->sb_unit = be32_to_cpu(from->sb_unit);
   782		to->sb_width = be32_to_cpu(from->sb_width);
   783		to->sb_dirblklog = from->sb_dirblklog;
   784		to->sb_logsectlog = from->sb_logsectlog;
   785		to->sb_logsectsize = be16_to_cpu(from->sb_logsectsize);
   786		to->sb_logsunit = be32_to_cpu(from->sb_logsunit);
   787		to->sb_features2 = be32_to_cpu(from->sb_features2);
   788		to->sb_features_compat = be32_to_cpu(from->sb_features_compat);
   789		to->sb_features_ro_compat = be32_to_cpu(from->sb_features_ro_compat);
   790		to->sb_features_incompat = be32_to_cpu(from->sb_features_incompat);
   791		to->sb_features_log_incompat =
   792					be32_to_cpu(from->sb_features_log_incompat);
   793		/* crc is only used on disk, not in memory; just init to 0 here. */
   794		to->sb_crc = 0;
   795		to->sb_spino_align = be32_to_cpu(from->sb_spino_align);
   796		to->sb_pquotino = be64_to_cpu(from->sb_pquotino);
   797		to->sb_lsn = be64_to_cpu(from->sb_lsn);
   798		/*
   799		 * sb_meta_uuid is only on disk if it differs from sb_uuid and the
   800		 * feature flag is set; if not set we keep it only in memory.
   801		 */
   802		if (xfs_sb_is_v5(to) &&
   803		    (to->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_META_UUID))
   804			uuid_copy(&to->sb_meta_uuid, &from->sb_meta_uuid);
   805		else
   806			uuid_copy(&to->sb_meta_uuid, &from->sb_uuid);
   807		/* Convert on-disk flags to in-memory flags? */
   808		if (convert_xquota)
   809			xfs_sb_quota_from_disk(to);
   810	
   811		if (to->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR) {
   812			to->sb_metadirino = be64_to_cpu(from->sb_metadirino);
   813			to->sb_rgblklog = from->sb_rgblklog;
   814			to->sb_metadirpad0 = from->sb_metadirpad0;
 > 815			to->sb_metadirpad1 = be16_to_cpu(from->sb_metadirpad0);
   816			to->sb_rgcount = be32_to_cpu(from->sb_rgcount);
   817			to->sb_rgextents = be32_to_cpu(from->sb_rgextents);
   818			to->sb_rbmino = NULLFSINO;
   819			to->sb_rsumino = NULLFSINO;
   820		} else {
   821			to->sb_metadirino = NULLFSINO;
   822			to->sb_bad_features2 = be32_to_cpu(from->sb_bad_features2);
   823			to->sb_rgcount = 1;
   824			to->sb_rgextents = 0;
   825		}
   826	}
   827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
