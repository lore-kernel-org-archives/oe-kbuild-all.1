Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1E9374E40
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 04:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789360205; cv=none; b=j7VeikbbqquhleMFXc2bfTmrbjFr0P/dIwkBmnPMhUMiLT0xAY+tEqXgCK3ElaYftJxK+gJsb8gBDRbqw1EWtePFQ1VUZN/YXubpKkxk6WwqyGLZfK6snK4yILeOoF6d+igvBZeSJZXJUb7if6/4hqCx3LqWqrDrgP4YUoyd+iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789360205; c=relaxed/simple;
	bh=K4yLwdzMVVSvneFZthLHn5MOqk2K4cpGfLDavdv6E+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V5oCJvRGlOD7u9iYGwC2mSDm1icp6ehE3zxr2NyjhEagd1Lp2+U+R9jBiWzrUAJiCcwhKYQGmJDENhJgZvvY6th8+0yYOt0Pa9W0wrKp8aCkLd/jHcGbR0b4RopV9G0j4LzO3VVRHHEtPAIQEt3MicI8Tgy3m+Q5Ea5OyA3JKO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XI4dofsd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XI4dofsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789360202; x=1820896202;
  h=date:from:to:cc:subject:message-id;
  bh=K4yLwdzMVVSvneFZthLHn5MOqk2K4cpGfLDavdv6E+0=;
  b=XI4dofsdUSPoTyJjKE3xoD/tcCyZ+rl2KjqyqxLTsztTwrc8OtU7X6vt
   mib3Kw7zEARQX4/f0t+FGCX5P3t5dWQSCAemtTxqPLCZQa3dfq3efP2zJ
   N9fHg68LKm1HJibCXw2wYWMRAK/R1OrN+aNyvN9S9VAuCKoqTQs6e38WL
   nlhgUoss5bMYJqhPPqya3uppnS3dmQHZzJBv02gZxfETbpSjHni/u1By0
   NaSyjMjPmmNwXilCgTtdiqLw/4ltC2MxVJuz6aYWfRB0AV0/KV6wHUkdC
   4TY/B4uTG3U+zvijdJRf9cuZ60mU0vbyO+tVIe47IivPGr8ErMQ0TCeCF
   g==;
X-CSE-ConnectionGUID: LrWOryR2SpuEQk2rAnF3lg==
X-CSE-MsgGUID: 1deR+3jQTGWm453h4iMTfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="92222720"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="92222720"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 21:30:02 -0700
X-CSE-ConnectionGUID: maARouL3Qheh0gUBLltG1g==
X-CSE-MsgGUID: 5z06ATHxT363X4UoaKa1wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="268241771"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Sep 2026 21:30:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5yKM-000000002UZ-1CHs;
	Mon, 14 Sep 2026 04:29:58 +0000
Date: Mon, 14 Sep 2026 12:29:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 18/30]
 fs/xfs/libxfs/xfs_sb.c:1352:undefined reference to `xfs_data_csum_shift'
Message-ID: <202609141225.ytGAerrF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   13c4aa2fcb1f62fdf47e7abe90741e89f682761e
commit: 7f5797416a817a414c43c8d72e0b145ae563e960 [18/30] xfs: add support for per-RTG csum files
config: i386-buildonly-randconfig-005-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141225.ytGAerrF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141225.ytGAerrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141225.ytGAerrF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/libxfs/xfs_sb.o: in function `xfs_sb_mount_common':
>> fs/xfs/libxfs/xfs_sb.c:1352:(.text+0x1c11): undefined reference to `xfs_data_csum_shift'


vim +1352 fs/xfs/libxfs/xfs_sb.c

  1282	
  1283	/*
  1284	 * xfs_mount_common
  1285	 *
  1286	 * Mount initialization code establishing various mount
  1287	 * fields from the superblock associated with the given
  1288	 * mount structure.
  1289	 *
  1290	 * Inode geometry are calculated in xfs_ialloc_setup_geometry.
  1291	 */
  1292	void
  1293	xfs_sb_mount_common(
  1294		struct xfs_mount	*mp,
  1295		struct xfs_sb		*sbp)
  1296	{
  1297		struct xfs_groups	*ags = &mp->m_groups[XG_TYPE_AG];
  1298	
  1299		mp->m_agfrotor = 0;
  1300		atomic_set(&mp->m_agirotor, 0);
  1301		mp->m_maxagi = mp->m_sb.sb_agcount;
  1302		mp->m_blkbit_log = sbp->sb_blocklog + XFS_NBBYLOG;
  1303		mp->m_blkbb_log = sbp->sb_blocklog - BBSHIFT;
  1304		mp->m_sectbb_log = sbp->sb_sectlog - BBSHIFT;
  1305		mp->m_agno_log = xfs_highbit32(sbp->sb_agcount - 1) + 1;
  1306		mp->m_blockmask = sbp->sb_blocksize - 1;
  1307		mp->m_blockwsize = xfs_rtbmblock_size(sbp) >> XFS_WORDLOG;
  1308		mp->m_rtx_per_rbmblock = mp->m_blockwsize << XFS_NBWORDLOG;
  1309	
  1310		ags->blocks = mp->m_sb.sb_agblocks;
  1311		ags->blklog = mp->m_sb.sb_agblklog;
  1312		ags->blkmask = xfs_mask32lo(mp->m_sb.sb_agblklog);
  1313	
  1314		xfs_sb_mount_rextsize(mp, sbp);
  1315	
  1316		mp->m_alloc_mxr[0] = xfs_allocbt_maxrecs(mp, sbp->sb_blocksize, true);
  1317		mp->m_alloc_mxr[1] = xfs_allocbt_maxrecs(mp, sbp->sb_blocksize, false);
  1318		mp->m_alloc_mnr[0] = mp->m_alloc_mxr[0] / 2;
  1319		mp->m_alloc_mnr[1] = mp->m_alloc_mxr[1] / 2;
  1320	
  1321		mp->m_bmap_dmxr[0] = xfs_bmbt_maxrecs(mp, sbp->sb_blocksize, true);
  1322		mp->m_bmap_dmxr[1] = xfs_bmbt_maxrecs(mp, sbp->sb_blocksize, false);
  1323		mp->m_bmap_dmnr[0] = mp->m_bmap_dmxr[0] / 2;
  1324		mp->m_bmap_dmnr[1] = mp->m_bmap_dmxr[1] / 2;
  1325	
  1326		mp->m_rmap_mxr[0] = xfs_rmapbt_maxrecs(mp, sbp->sb_blocksize, true);
  1327		mp->m_rmap_mxr[1] = xfs_rmapbt_maxrecs(mp, sbp->sb_blocksize, false);
  1328		mp->m_rmap_mnr[0] = mp->m_rmap_mxr[0] / 2;
  1329		mp->m_rmap_mnr[1] = mp->m_rmap_mxr[1] / 2;
  1330	
  1331		mp->m_rtrmap_mxr[0] = xfs_rtrmapbt_maxrecs(mp, sbp->sb_blocksize, true);
  1332		mp->m_rtrmap_mxr[1] = xfs_rtrmapbt_maxrecs(mp, sbp->sb_blocksize, false);
  1333		mp->m_rtrmap_mnr[0] = mp->m_rtrmap_mxr[0] / 2;
  1334		mp->m_rtrmap_mnr[1] = mp->m_rtrmap_mxr[1] / 2;
  1335	
  1336		mp->m_refc_mxr[0] = xfs_refcountbt_maxrecs(mp, sbp->sb_blocksize, true);
  1337		mp->m_refc_mxr[1] = xfs_refcountbt_maxrecs(mp, sbp->sb_blocksize, false);
  1338		mp->m_refc_mnr[0] = mp->m_refc_mxr[0] / 2;
  1339		mp->m_refc_mnr[1] = mp->m_refc_mxr[1] / 2;
  1340	
  1341		mp->m_rtrefc_mxr[0] = xfs_rtrefcountbt_maxrecs(mp, sbp->sb_blocksize,
  1342				true);
  1343		mp->m_rtrefc_mxr[1] = xfs_rtrefcountbt_maxrecs(mp, sbp->sb_blocksize,
  1344				false);
  1345		mp->m_rtrefc_mnr[0] = mp->m_rtrefc_mxr[0] / 2;
  1346		mp->m_rtrefc_mnr[1] = mp->m_rtrefc_mxr[1] / 2;
  1347	
  1348		mp->m_bsize = XFS_FSB_TO_BB(mp, 1);
  1349		mp->m_alloc_set_aside = xfs_alloc_set_aside(mp);
  1350		mp->m_ag_max_usable = xfs_alloc_ag_max_usable(mp);
  1351	
> 1352		mp->m_rtcsum_shift = xfs_data_csum_shift(mp->m_sb.sb_rtcsum);
  1353	}
  1354	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
