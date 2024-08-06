Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5941BA895
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 07:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722929315; cv=none; b=WZpDtVUrqul91lcNFaftg+Mg/yOhuuzCySlA2ejhaac3y14ZUpOQGpKXjNc7ZxliZrh0EOfxkcZhSc5gAfOtQx98nS/yqErjTfUbLgNJivjCEJZ6pPgNMsAG95naynY/LxmQOeyMogEL/GUDraQJoJnKl0kMs/lkq3wZ+6nUatg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722929315; c=relaxed/simple;
	bh=JhST8h93TnZoay4YOEdbDtiujIciasjgvJOfFM4j8U4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jbf55Ot57j0ZJH5QOE72/UjU64wzOVh1PZ3lq2LfAs3r+BC34HI8oWHKTJdrd6aK8j39dsmMGnCyIxfzKwwIr8Ot/YMUqZ0EG4kkRYO2JrIBoiwJXW5ZHIb+xBWZzbsdK0rLQKaG/EKQTOd09wa5KQnLXHEQiXY8kJ5vRggWjV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT6r7wgg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT6r7wgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722929314; x=1754465314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JhST8h93TnZoay4YOEdbDtiujIciasjgvJOfFM4j8U4=;
  b=jT6r7wggMKXsmw+opeIMTW5ADdXCYKB2ObDmfe3pcQCiP+giio5JzlS/
   oZjkgUQaXWFuWTj3CnREY/Hd14zepGdyyUdzRmpDFD+x73n+lQCKGxR+k
   5Bm2AsWijYno9WYiIQIz85kkx5qwQW9wllb9NhXazIJfo3/Gwr0L59u31
   /aiTWG9uB01HPC2Fmc05sQ+sSvNZfWU6pY1KgWSdHGJJWvorVpxnNzqrP
   exPQpr6TaIBQ/pVbUfohEVMWU37sTXWY60dwPDwJNbEU+y2lkNgO45tQE
   Qx2f3IBnlGqBqNJ82Zhz2N/fudusycd49LWjMnwlJzIEbBJVJ7kX5aUJn
   Q==;
X-CSE-ConnectionGUID: kRDi9e/PT7mVCYxZpySeDA==
X-CSE-MsgGUID: +0/a0lUATliehPxNH4os8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24691869"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="24691869"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 00:28:31 -0700
X-CSE-ConnectionGUID: l+d59IRcRXudfyAm4187Ig==
X-CSE-MsgGUID: izyCx0nYRvK54VxfUVrlDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="60555437"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Aug 2024 00:28:29 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbEcN-0004GO-28;
	Tue, 06 Aug 2024 07:28:27 +0000
Date: Tue, 6 Aug 2024 15:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap-rebase 22/60]
 fs/xfs/xfs_log_recover.c:3413:12: error: call to undeclared function
 'xfs_rtgroup_alloc'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202408061559.k7FPMgfR-lkp@intel.com>
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
config: arm-randconfig-001-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061559.k7FPMgfR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061559.k7FPMgfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061559.k7FPMgfR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_log_recover.c:6:
   In file included from fs/xfs/xfs.h:26:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/xfs/xfs_log_recover.c:3413:12: error: call to undeclared function 'xfs_rtgroup_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3413 |                         error = xfs_rtgroup_alloc(mp, rgno);
         |                                 ^
   fs/xfs/xfs_log_recover.c:3413:12: note: did you mean 'xfs_rtgroup_hold'?
   fs/xfs/libxfs/xfs_rtgroup.h:53:1: note: 'xfs_rtgroup_hold' declared here
      53 | xfs_rtgroup_hold(struct xfs_rtgroup *rtg)
         | ^
   1 warning and 1 error generated.
--
   In file included from fs/xfs/xfs_mount.c:6:
   In file included from fs/xfs/xfs.h:26:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/xfs/xfs_mount.c:846:11: error: call to undeclared function 'xfs_rtgroup_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     846 |                 error = xfs_rtgroup_alloc(mp, rgno);
         |                         ^
   fs/xfs/xfs_mount.c:846:11: note: did you mean 'xfs_rtgroup_hold'?
   fs/xfs/libxfs/xfs_rtgroup.h:53:1: note: 'xfs_rtgroup_hold' declared here
      53 | xfs_rtgroup_hold(struct xfs_rtgroup *rtg)
         | ^
   1 warning and 1 error generated.


vim +/xfs_rtgroup_alloc +3413 fs/xfs/xfs_log_recover.c

  3337	
  3338	/*
  3339	 * Do the actual recovery
  3340	 */
  3341	STATIC int
  3342	xlog_do_recover(
  3343		struct xlog		*log,
  3344		xfs_daddr_t		head_blk,
  3345		xfs_daddr_t		tail_blk)
  3346	{
  3347		struct xfs_mount	*mp = log->l_mp;
  3348		struct xfs_buf		*bp = mp->m_sb_bp;
  3349		struct xfs_sb		*sbp = &mp->m_sb;
  3350		xfs_rgnumber_t		old_rgcount = sbp->sb_rgcount;
  3351		int			error;
  3352	
  3353		trace_xfs_log_recover(log, head_blk, tail_blk);
  3354	
  3355		/*
  3356		 * First replay the images in the log.
  3357		 */
  3358		error = xlog_do_log_recovery(log, head_blk, tail_blk);
  3359		if (error)
  3360			return error;
  3361	
  3362		if (xlog_is_shutdown(log))
  3363			return -EIO;
  3364	
  3365		/*
  3366		 * We now update the tail_lsn since much of the recovery has completed
  3367		 * and there may be space available to use.  If there were no extent or
  3368		 * iunlinks, we can free up the entire log.  This was set in
  3369		 * xlog_find_tail to be the lsn of the last known good LR on disk.  If
  3370		 * there are extent frees or iunlinks they will have some entries in the
  3371		 * AIL; so we look at the AIL to determine how to set the tail_lsn.
  3372		 */
  3373		xfs_ail_assign_tail_lsn(log->l_ailp);
  3374	
  3375		/*
  3376		 * Now that we've finished replaying all buffer and inode updates,
  3377		 * re-read the superblock and reverify it.
  3378		 */
  3379		xfs_buf_lock(bp);
  3380		xfs_buf_hold(bp);
  3381		error = _xfs_buf_read(bp, XBF_READ);
  3382		if (error) {
  3383			if (!xlog_is_shutdown(log)) {
  3384				xfs_buf_ioerror_alert(bp, __this_address);
  3385				ASSERT(0);
  3386			}
  3387			xfs_buf_relse(bp);
  3388			return error;
  3389		}
  3390	
  3391		/* Convert superblock from on-disk format */
  3392		xfs_sb_from_disk(sbp, bp->b_addr);
  3393		xfs_buf_relse(bp);
  3394	
  3395		/* re-initialise in-core superblock and geometry structures */
  3396		mp->m_features |= xfs_sb_version_to_features(sbp);
  3397		xfs_reinit_percpu_counters(mp);
  3398		error = xfs_initialize_perag(mp, sbp->sb_agcount, sbp->sb_dblocks,
  3399				&mp->m_maxagi);
  3400		if (error) {
  3401			xfs_warn(mp, "Failed post-recovery per-ag init: %d", error);
  3402			return error;
  3403		}
  3404	
  3405		if (sbp->sb_rgcount < old_rgcount) {
  3406			xfs_warn(mp, "rgcount shrink not supported");
  3407			return -EINVAL;
  3408		}
  3409		if (sbp->sb_rgcount > old_rgcount) {
  3410			xfs_rgnumber_t		rgno;
  3411	
  3412			for (rgno = old_rgcount; rgno < sbp->sb_rgcount; rgno++) {
> 3413				error = xfs_rtgroup_alloc(mp, rgno);
  3414				if (error) {
  3415					xfs_warn(mp,
  3416		"Failed post-recovery rtgroup init: %d",
  3417						error);
  3418					return error;
  3419				}
  3420			}
  3421		}
  3422		mp->m_alloc_set_aside = xfs_alloc_set_aside(mp);
  3423	
  3424		/* Normal transactions can now occur */
  3425		clear_bit(XLOG_ACTIVE_RECOVERY, &log->l_opstate);
  3426		return 0;
  3427	}
  3428	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
