Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E2E26ADC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 03:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479872; cv=none; b=ZZsFGjli0fQ9UYk3M9j1qklQ/meP7fJmqrU4/QEizczbiAFzBjWTSk5cevFG4gnqK11t72qhtBd02kk/wDZ2hZBCPf0bOidCQgpaOErL3TUxHVArFBDFSbQ7TRzgzCommJHzzfJJz3cOgGo4S1e3yc/xUXXe/BK5Q+H/i/8lvD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479872; c=relaxed/simple;
	bh=r0VNLiKNKnhFvE1QCJJe3JYMD/JmlxrOHqgxdZatroI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YtnlIEPTM1syey8D7TRx9HG1YnOs0BOkSv/HmU/rgwcAG2I7HIe2OCW4l7dp/sC8kWqaU8JA1pOxnpiIF8plhOhL48+/aBx4Csb2NxsOs5yywV3QTG2gYeP/XkPgkFeWl1FgEKvb4ejm0xf2Pyp/uUzE5LFSENXOYKbAmkvylk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZgyj0u8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZgyj0u8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783479871; x=1815015871;
  h=date:from:to:cc:subject:message-id;
  bh=r0VNLiKNKnhFvE1QCJJe3JYMD/JmlxrOHqgxdZatroI=;
  b=bZgyj0u8bdyXP5KhWoFcKcMLiwXB4cbRoIVh3DvCAaSC/oyZZdZspwSC
   4kFl8YJMdHHBb1L0cGX1xRLCTucyq5bv/VDXvJxqmEYTR/ZeWf6Gv//VX
   86/vqhllyU9ZQxuSjePnlzgaG7KPqOO9g4gj95DDj/zJQvFO4VXc1ArdU
   1u2SnNC1pfHadIm0thR95nKMPYeQNi1A63JAUU6/+WIGLw+qMQEBva9iF
   8kQ7CnDfd6K0aW9iLg2LSrUepisBh+QDJ9fyhPJaSt4eB1pI9KJVp5NM+
   bKAP5sh5KeXXQjzkwJ4CCc5+Fzk9R15tMSunDerRLH1S+TYArD953Nffs
   g==;
X-CSE-ConnectionGUID: t5FzIa5JTP6IWdnaaHBKIA==
X-CSE-MsgGUID: rU7pvgY4TMK2nwMY6Ai9eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="71655101"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71655101"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 20:04:30 -0700
X-CSE-ConnectionGUID: AtYch4xeQ6SHuxzMDH12yw==
X-CSE-MsgGUID: qMiEt7S2QYuyGXXIf0qqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258473572"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Jul 2026 20:04:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whIaH-00000000Fyb-48ae;
	Wed, 08 Jul 2026 03:04:25 +0000
Date: Wed, 08 Jul 2026 11:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-codex-fixes 119/122]
 fs/xfs/scrub/quota_repair.c:320:3: warning: label followed by a declaration
 is a C23 extension
Message-ID: <202607081027.laYTrMKO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-codex-fixes
head:   8cb8707b5e700fabc3c6bcd612aa914b4bc54fa4
commit: 7606c37564764f10a45b99dd82490fd1499d0dfc [119/122] xfs: reinitialize dquot block if non-first dquot can't load
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260708/202607081027.laYTrMKO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081027.laYTrMKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081027.laYTrMKO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/scrub/quota_repair.c:320:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     320 |                 int             bad = 0;
         |                 ^
   1 warning generated.


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
   332				    id != be32_to_cpu(ddq->d_id))
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
