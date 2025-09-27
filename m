Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C12D7DF2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758971050; cv=none; b=R0OgWGscthn2EnBjV9uGuSQF51DuBYWGj6to7bytlXfQc10M3mkZeu8O2nAhuNygJg0erNu8e3ZzcTxU53pCtlCK46mxvfnrw19TKMYK1vHe2MbSsps81x0/5eo7E6GXhOARSAFjla+nozew/XaluLvnYgx3w7aG56sTg9rUPJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758971050; c=relaxed/simple;
	bh=2+uzM+JwwBo3fsbfORU4ky3Bv0XSKTUEbXmc419TC4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jvn5ixwVs/Sdsh3S9adefCcIUIzHhjijlV0lghutjLfS6Zvoang6X2P87hLuv6OHZ7TnEqWhQlnF12j6KZQ5mtp/KQNFU+KCgmVm3E1i2SsRpOo1nVvih6XKjt0z3yJI1HVKujBAO/SLeafPLV2Nq83rqVDcdJFcJmjelW47tXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ew05cah3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ew05cah3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758971048; x=1790507048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+uzM+JwwBo3fsbfORU4ky3Bv0XSKTUEbXmc419TC4E=;
  b=Ew05cah35aZpZE3EJkrjaIAqFHIoIZhzdSG8Nw0dWD29+rHxH4s5+NTs
   6d1kuKMOmwp3sqB5SkRZlAz0Z1UUjjLV8wIXqhSAi1hmaNuU+y+fo4MWN
   yDaBFT9dXwEJqMQ57hVjKNTec2lJTubruqukJUZvXh3a/O963F+Ii91ky
   wEs2sQqEG4ziffofHaWT9m371kxtU3bRcuzZ9xM7OmRySJ/QMsPmINJjf
   FrK2Rwk9oCiLw+Vuu7tvdyH11azw1fxHJ3xAo4z2nnemfA+/KDA8q6xEN
   yVXV9UjpoTS7CrZIToYgLRtdnei3AZauikuciHYEdjZ0qx8eC5n9FOWd9
   Q==;
X-CSE-ConnectionGUID: XfV+FPmgQBShd+TdKvgwVw==
X-CSE-MsgGUID: kDZSH6xaR1OAvrEaLaANlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65099728"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65099728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 04:04:08 -0700
X-CSE-ConnectionGUID: z1hu5aWfQL2qS2tvEhsvyA==
X-CSE-MsgGUID: iPsJtEj1SQernNYTSRruww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="201493427"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2025 04:04:06 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Sih-0006zr-2T;
	Sat, 27 Sep 2025 11:04:03 +0000
Date: Sat, 27 Sep 2025 19:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] fs/xfs/xfs_log.c:565:15:
 warning: unused variable 'log'
Message-ID: <202509271818.bYbVT5Xh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c780a63e7ef2ba78633db7ab560b9e12f76dd956
commit: 4e340de538f37a4ddd186cd29493eb73f480acee [0/1] xfs: journal geometry is not properly bounds checked
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250927/202509271818.bYbVT5Xh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271818.bYbVT5Xh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509271818.bYbVT5Xh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_log.c:565:15: warning: unused variable 'log' [-Wunused-variable]
     565 |         struct xlog     *log;
         |                          ^~~
   1 warning generated.


vim +/log +565 fs/xfs/xfs_log.c

   547	
   548	/*
   549	 * Mount a log filesystem
   550	 *
   551	 * mp		- ubiquitous xfs mount point structure
   552	 * log_target	- buftarg of on-disk log device
   553	 * blk_offset	- Start block # where block size is 512 bytes (BBSIZE)
   554	 * num_bblocks	- Number of BBSIZE blocks in on-disk log
   555	 *
   556	 * Return error or zero.
   557	 */
   558	int
   559	xfs_log_mount(
   560		xfs_mount_t	*mp,
   561		xfs_buftarg_t	*log_target,
   562		xfs_daddr_t	blk_offset,
   563		int		num_bblks)
   564	{
 > 565		struct xlog	*log;
   566		int		error = 0;
   567		int		min_logfsbs;
   568	
   569		if (!(mp->m_flags & XFS_MOUNT_NORECOVERY)) {
   570			xfs_notice(mp, "Mounting V%d Filesystem",
   571				   XFS_SB_VERSION_NUM(&mp->m_sb));
   572		} else {
   573			xfs_notice(mp,
   574	"Mounting V%d filesystem in no-recovery mode. Filesystem will be inconsistent.",
   575				   XFS_SB_VERSION_NUM(&mp->m_sb));
   576			ASSERT(mp->m_flags & XFS_MOUNT_RDONLY);
   577		}
   578	
   579		mp->m_log = xlog_alloc_log(mp, log_target, blk_offset, num_bblks);
   580		if (IS_ERR(mp->m_log)) {
   581			error = PTR_ERR(mp->m_log);
   582			goto out;
   583		}
   584	
   585		/*
   586		 * Now that we have set up the log and it's internal geometry
   587		 * parameters, we can validate the given log space and drop a critical
   588		 * message via syslog if the log size is too small. A log that is too
   589		 * small can lead to unexpected situations in transaction log space
   590		 * reservation stage. The superblock verifier has already validated all
   591		 * the other log geometry constraints, so we don't have to check those
   592		 * here.
   593		 *
   594		 * Note: For v4 filesystems, we can't just reject the mount if the
   595		 * validation fails.  This would mean that people would have to
   596		 * downgrade their kernel just to remedy the situation as there is no
   597		 * way to grow the log (short of black magic surgery with xfs_db).
   598		 *
   599		 * We can, however, reject mounts for V5 format filesystems, as the
   600		 * mkfs binary being used to make the filesystem should never create a
   601		 * filesystem with a log that is too small.
   602		 */
   603		min_logfsbs = xfs_log_calc_minimum_size(mp);
   604		if (mp->m_sb.sb_logblocks < min_logfsbs) {
   605			xfs_warn(mp,
   606			"Log size %d blocks too small, minimum size is %d blocks",
   607				 mp->m_sb.sb_logblocks, min_logfsbs);
   608	
   609			/*
   610			 * Log check errors are always fatal on v5; or whenever bad
   611			 * metadata leads to a crash.
   612			 */
   613			if (xfs_sb_version_hascrc(&mp->m_sb)) {
   614				xfs_crit(mp, "AAIEEE! Log failed size checks. Abort!");
   615				ASSERT(0);
   616				error = -EINVAL;
   617				goto out_free_log;
   618			}
   619			xfs_crit(mp, "Log size out of supported range.");
   620			xfs_crit(mp,
   621	"Continuing onwards, but if log hangs are experienced then please report this message in the bug report.");
   622		}
   623	
   624		/*
   625		 * Initialize the AIL now we have a log.
   626		 */
   627		error = xfs_trans_ail_init(mp);
   628		if (error) {
   629			xfs_warn(mp, "AIL initialisation failed: error %d", error);
   630			goto out_free_log;
   631		}
   632		mp->m_log->l_ailp = mp->m_ail;
   633	
   634		/*
   635		 * skip log recovery on a norecovery mount.  pretend it all
   636		 * just worked.
   637		 */
   638		if (!(mp->m_flags & XFS_MOUNT_NORECOVERY)) {
   639			int	readonly = (mp->m_flags & XFS_MOUNT_RDONLY);
   640	
   641			if (readonly)
   642				mp->m_flags &= ~XFS_MOUNT_RDONLY;
   643	
   644			error = xlog_recover(mp->m_log);
   645	
   646			if (readonly)
   647				mp->m_flags |= XFS_MOUNT_RDONLY;
   648			if (error) {
   649				xfs_warn(mp, "log mount/recovery failed: error %d",
   650					error);
   651				xlog_recover_cancel(mp->m_log);
   652				goto out_destroy_ail;
   653			}
   654		}
   655	
   656		error = xfs_sysfs_init(&mp->m_log->l_kobj, &xfs_log_ktype, &mp->m_kobj,
   657				       "log");
   658		if (error)
   659			goto out_destroy_ail;
   660	
   661		/* Normal transactions can now occur */
   662		mp->m_log->l_flags &= ~XLOG_ACTIVE_RECOVERY;
   663	
   664		/*
   665		 * Now the log has been fully initialised and we know were our
   666		 * space grant counters are, we can initialise the permanent ticket
   667		 * needed for delayed logging to work.
   668		 */
   669		xlog_cil_init_post_recovery(mp->m_log);
   670	
   671		return 0;
   672	
   673	out_destroy_ail:
   674		xfs_trans_ail_destroy(mp);
   675	out_free_log:
   676		xlog_dealloc_log(mp->m_log);
   677	out:
   678		return error;
   679	}
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
