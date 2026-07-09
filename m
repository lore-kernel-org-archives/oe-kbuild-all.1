Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82CE384CE7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 05:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783574650; cv=none; b=sH/FVUqVfLvouPh4lvsNAqy6HyOcTCIKVKKh4lrShTOMO2ZtKdzOD4jna31PRfcyj50TVWed6wwypFNIfJ4rD9ZMv2hkLul2jXqUTDZ875/bThvbh1k9VXfJUZ7Rr4mpNhg7Ng8uuK/xHZNismTYJhq2gxgSeDp8teU3C5tysYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783574650; c=relaxed/simple;
	bh=4hDXYsQSKTlRpB0upw5Rl9t3Cr2PZ/j40Dx0xwXm4Nk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BaFAlX0qlEWKh8eIWYaXlGdkfcNtotp+sBvPIgaMSYD7w03H78jwiDGD5aY1DAwXHS2uD/QoemyuLQ8KJ+mVz2DEGdssEVzswDgRwd6SBCQWU6v2lq/3Jz5S6w3sEwcJ/kG+dv5/tCTMPeSYbQjjV3pwy5pbxHFTKlDuG6XcTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHmHrGB0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHmHrGB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783574649; x=1815110649;
  h=date:from:to:cc:subject:message-id;
  bh=4hDXYsQSKTlRpB0upw5Rl9t3Cr2PZ/j40Dx0xwXm4Nk=;
  b=nHmHrGB0SdUkL1kdw4IyGPyqI9KR7ilQgrcPVSsFFcUNNaOpZZRkXd9a
   czMMVJLTgkG45x1pMOqCzkXm51d5POYeZHDoTJxkY2qlFddc69t//j+Ri
   Qqy6UqyCRCKhPDIBftwGwUNDd8dlsvQB45v7QBTIsqcQmtx/8XLbzHaAN
   hlxLxjgdb+eTGfgnA4qaQHIXqwWoZu3deXFe3Cr1vjNLbLxMUdhTZ6T+3
   yrtl09TtVk9D6KWKsB1meCBLSPq3cRJVTO6M5kw4eqjwSg1B6zT/4KKc4
   zLcbi6RO4zrn2W4zk72y453av5QdC5QI8VCLoE4PcV879cwyW49ZoEJ+x
   A==;
X-CSE-ConnectionGUID: HeBJrRyPQ4CgT9Xg3ZZ/fA==
X-CSE-MsgGUID: 6gdDqG2UTVWabfmf54edkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84360212"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84360212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 22:24:06 -0700
X-CSE-ConnectionGUID: rqWFNlNVS7qnIHAFWcIg1A==
X-CSE-MsgGUID: pcRa6ErMRL60gQRd/MfZ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259385585"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jul 2026 22:24:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whhEw-00000000HJ9-0u8W;
	Thu, 09 Jul 2026 05:24:02 +0000
Date: Thu, 09 Jul 2026 13:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:llm-fixes-22 118/129]
 fs/xfs/scrub/quota_repair.c:320:3: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202607091345.ut4Vf8e5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-22
head:   ced08f72306d1ae24c172dbb6a2dbff99aec3be4
commit: 06adca9a2b052cd5c47fb0a7ad3df7d274028800 [118/129] xfs: reinitialize dquot block if non-first dquot can't load
config: alpha-randconfig-r134-20260708 (https://download.01.org/0day-ci/archive/20260709/202607091345.ut4Vf8e5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091345.ut4Vf8e5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091345.ut4Vf8e5-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/quota_repair.c: In function 'xrep_quota_block':
>> fs/xfs/scrub/quota_repair.c:320:3: error: a label can only be part of a statement and a declaration is not a statement
      int  bad = 0;
      ^~~


vim +320 fs/xfs/scrub/quota_repair.c

   290	
   291	/* Fix anything the verifiers complain about. */
   292	STATIC int
   293	xrep_quota_block(
   294		struct xfs_scrub	*sc,
   295		xfs_daddr_t		daddr,
   296		xfs_dqtype_t		dqtype,
   297		xfs_dqid_t		id)
   298	{
   299		struct xfs_dqblk	*dqblk;
   300		struct xfs_quotainfo	*qi = sc->mp->m_quotainfo;
   301		struct xfs_def_quota	*defq = xfs_get_defquota(qi, dqtype);
   302		struct xfs_buf		*bp = NULL;
   303		enum xfs_blft		buftype = 0;
   304		int			i;
   305		int			error;
   306	
   307		error = xfs_trans_read_buf(sc->mp, sc->tp, sc->mp->m_ddev_targp, daddr,
   308				qi->qi_dqchunklen, 0, &bp, &xfs_dquot_buf_ops);
   309		switch (error) {
   310		case -EFSBADCRC:
   311		case -EFSCORRUPTED:
   312			/* Failed verifier, retry read with no ops. */
   313			error = xfs_trans_read_buf(sc->mp, sc->tp,
   314					sc->mp->m_ddev_targp, daddr, qi->qi_dqchunklen,
   315					0, &bp, NULL);
   316			if (error)
   317				return error;
   318			break;
   319		case 0:
 > 320			int		bad = 0;
   321	
   322			dqblk = bp->b_addr;
   323	
   324			/*
   325			 * If there's nothing that would impede a dqiterate, we're
   326			 * done.
   327			 */
   328			for (i = 0; i < qi->qi_dqperchunk; i++, dqblk++) {
   329				struct xfs_disk_dquot	*ddq = &dqblk->dd_diskdq;
   330	
   331				if ((ddq->d_type & XFS_DQTYPE_REC_MASK) != dqtype ||
   332				    id + i != be32_to_cpu(ddq->d_id))
   333					bad++;
   334			}
   335	
   336			if (!bad) {
   337				xfs_trans_brelse(sc->tp, bp);
   338				return 0;
   339			}
   340			break;
   341		default:
   342			return error;
   343		}
   344	
   345		/* Something's wrong with the block, fix the whole thing. */
   346		dqblk = bp->b_addr;
   347		bp->b_ops = &xfs_dquot_buf_ops;
   348		for (i = 0; i < qi->qi_dqperchunk; i++, dqblk++) {
   349			struct xfs_disk_dquot	*ddq = &dqblk->dd_diskdq;
   350	
   351			trace_xrep_disk_dquot(sc->mp, dqtype, id + i);
   352	
   353			ddq->d_magic = cpu_to_be16(XFS_DQUOT_MAGIC);
   354			ddq->d_version = XFS_DQUOT_VERSION;
   355			ddq->d_type = dqtype;
   356			ddq->d_id = cpu_to_be32(id + i);
   357	
   358			if (xfs_has_bigtime(sc->mp) && ddq->d_id)
   359				ddq->d_type |= XFS_DQTYPE_BIGTIME;
   360	
   361			xrep_quota_fix_timer(sc->mp, ddq, ddq->d_blk_softlimit,
   362					ddq->d_bcount, &ddq->d_btimer,
   363					defq->blk.time);
   364	
   365			xrep_quota_fix_timer(sc->mp, ddq, ddq->d_ino_softlimit,
   366					ddq->d_icount, &ddq->d_itimer,
   367					defq->ino.time);
   368	
   369			xrep_quota_fix_timer(sc->mp, ddq, ddq->d_rtb_softlimit,
   370					ddq->d_rtbcount, &ddq->d_rtbtimer,
   371					defq->rtb.time);
   372	
   373			/* We only support v5 filesystems so always set these. */
   374			dqblk->dd_lsn = 0;
   375			uuid_copy(&dqblk->dd_uuid, &sc->mp->m_sb.sb_meta_uuid);
   376			xfs_update_cksum((char *)dqblk, sizeof(struct xfs_dqblk),
   377					 XFS_DQUOT_CRC_OFF);
   378		}
   379		switch (dqtype) {
   380		case XFS_DQTYPE_USER:
   381			buftype = XFS_BLFT_UDQUOT_BUF;
   382			break;
   383		case XFS_DQTYPE_GROUP:
   384			buftype = XFS_BLFT_GDQUOT_BUF;
   385			break;
   386		case XFS_DQTYPE_PROJ:
   387			buftype = XFS_BLFT_PDQUOT_BUF;
   388			break;
   389		}
   390		xfs_trans_buf_set_type(sc->tp, bp, buftype);
   391		xfs_trans_log_buf(sc->tp, bp, 0, BBTOB(bp->b_length) - 1);
   392		return xrep_roll_trans(sc);
   393	}
   394	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
