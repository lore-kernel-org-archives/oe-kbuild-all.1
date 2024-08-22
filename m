Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FC21D12E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 17:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724347946; cv=none; b=egiKZSxrQUZM2xQPjMvmeHEVs88QAcN8908zs2yW2ZftZgIfiFiTC/tbgrjQT6QS5wFUEvGTU3ANNb6gNFsCcUFeXaNcBkVLLAw3jt0oomsKNWKs9wTD/3rF0beYqjFtqXW2SCW1sVsF9vtsQuArEhcjs8urXWuGk+SwOn3AidQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724347946; c=relaxed/simple;
	bh=L50mzvZieSsGn0k1rLClybdikF1el3vKdsWIGiOzOYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pvl4m8vce82RMwgp2vSrTyTu8SWeo9udpLJkiSAlOFw7tfT7/7FW0kvSSOeVOnplMdgPVoMGUHFuUXqvI+pPp47ZSyq1OjzdClRqhz0SXGKA3Ng8LbTGHPY0ArhPqJ9VCkedasHeKg2jj1OSjeRvEXg53Y7CCbyziuRCliAXBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6FNZGI/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6FNZGI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724347944; x=1755883944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L50mzvZieSsGn0k1rLClybdikF1el3vKdsWIGiOzOYk=;
  b=Y6FNZGI/9shSk39mysIuk/fmGjCTdxTCJRAfRfjJgTn2dHywuDWQH04A
   bwjTE85b8a7YIaFQs1Ose3edF7flDnPn11AbmqtInO6dmaEv64eju78Vm
   3e5RQ8jwxu+/WmeixOSRrpIN4LUnqOoBkV8Ck9ShmCYUg13G3OQCZ+aEa
   8sQgKgFwBRGXerqn4p9Bcm3P2j8NTu629GZr7KkEvVZV9FOCAVPr3O2hK
   LqwEQp4sgrAqk7Eosm/46ykOgALbBUq+kqbjnd9Qllni23QqxvYLyC6A+
   tnWoSinMNl0kc9OaAmsbTgtUELM051ZhTX1lFMX5mTruFdI49P4NeQ/GN
   A==;
X-CSE-ConnectionGUID: Imvk+eOGTuS4ZVhYRELhiw==
X-CSE-MsgGUID: Hr3tdx/YTb+PZbP/hXr0Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22595764"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22595764"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:32:24 -0700
X-CSE-ConnectionGUID: fRZ0sDDAQuis0I8BX33+mg==
X-CSE-MsgGUID: y98ckreKQ3Cid6rHkPYfYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61552881"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Aug 2024 10:32:23 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shBfZ-000D2R-0k;
	Thu, 22 Aug 2024 17:32:21 +0000
Date: Fri, 23 Aug 2024 01:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 256/262] fs/xfs/xfs_discard.c:731:70: error:
 macro "xfs_trim_rtdev_extents" requires 5 arguments, but only 4 given
Message-ID: <202408230145.HPMwvdz7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   b465ef695ec134c0e73be7eb771a50ac9df25dd6
commit: 3d64521d183c25ed63ae122087ec6919b3b2b609 [256/262] xfs: don't bother reporting blocks trimmed via FITRIM
config: i386-buildonly-randconfig-006-20240822 (https://download.01.org/0day-ci/archive/20240823/202408230145.HPMwvdz7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230145.HPMwvdz7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230145.HPMwvdz7-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_discard.c: In function 'xfs_ioc_trim':
>> fs/xfs/xfs_discard.c:731:70: error: macro "xfs_trim_rtdev_extents" requires 5 arguments, but only 4 given
     731 |                 error = xfs_trim_rtdev_extents(mp, start, end, minlen);
         |                                                                      ^
   fs/xfs/xfs_discard.c:654: note: macro "xfs_trim_rtdev_extents" defined here
     654 | # define xfs_trim_rtdev_extents(m,s,e,n,b)      (-EOPNOTSUPP)
         | 
>> fs/xfs/xfs_discard.c:731:25: error: 'xfs_trim_rtdev_extents' undeclared (first use in this function); did you mean 'xfs_trim_datadev_extents'?
     731 |                 error = xfs_trim_rtdev_extents(mp, start, end, minlen);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         xfs_trim_datadev_extents
   fs/xfs/xfs_discard.c:731:25: note: each undeclared identifier is reported only once for each function it appears in


vim +/xfs_trim_rtdev_extents +731 fs/xfs/xfs_discard.c

   656	
   657	/*
   658	 * trim a range of the filesystem.
   659	 *
   660	 * Note: the parameters passed from userspace are byte ranges into the
   661	 * filesystem which does not match to the format we use for filesystem block
   662	 * addressing. FSB addressing is sparse (AGNO|AGBNO), while the incoming format
   663	 * is a linear address range. Hence we need to use DADDR based conversions and
   664	 * comparisons for determining the correct offset and regions to trim.
   665	 *
   666	 * The realtime device is mapped into the FITRIM "address space" immediately
   667	 * after the data device.
   668	 */
   669	int
   670	xfs_ioc_trim(
   671		struct xfs_mount		*mp,
   672		struct fstrim_range __user	*urange)
   673	{
   674		unsigned int		granularity =
   675			bdev_discard_granularity(mp->m_ddev_targp->bt_bdev);
   676		struct block_device	*rt_bdev = NULL;
   677		struct fstrim_range	range;
   678		xfs_daddr_t		start, end;
   679		xfs_extlen_t		minlen;
   680		xfs_rfsblock_t		max_blocks;
   681		int			error, last_error = 0;
   682	
   683		if (!capable(CAP_SYS_ADMIN))
   684			return -EPERM;
   685		if (mp->m_rtdev_targp &&
   686		    bdev_max_discard_sectors(mp->m_rtdev_targp->bt_bdev))
   687			rt_bdev = mp->m_rtdev_targp->bt_bdev;
   688		if (!bdev_max_discard_sectors(mp->m_ddev_targp->bt_bdev) && !rt_bdev)
   689			return -EOPNOTSUPP;
   690	
   691		if (rt_bdev)
   692			granularity = max(granularity,
   693					  bdev_discard_granularity(rt_bdev));
   694	
   695		/*
   696		 * We haven't recovered the log, so we cannot use our bnobt-guided
   697		 * storage zapping commands.
   698		 */
   699		if (xfs_has_norecovery(mp))
   700			return -EROFS;
   701	
   702		if (copy_from_user(&range, urange, sizeof(range)))
   703			return -EFAULT;
   704	
   705		range.minlen = max_t(u64, granularity, range.minlen);
   706		minlen = XFS_B_TO_FSB(mp, range.minlen);
   707	
   708		/*
   709		 * Truncating down the len isn't actually quite correct, but using
   710		 * BBTOB would mean we trivially get overflows for values
   711		 * of ULLONG_MAX or slightly lower.  And ULLONG_MAX is the default
   712		 * used by the fstrim application.  In the end it really doesn't
   713		 * matter as trimming blocks is an advisory interface.
   714		 */
   715		max_blocks = mp->m_sb.sb_dblocks + mp->m_sb.sb_rblocks;
   716		if (range.start >= XFS_FSB_TO_B(mp, max_blocks) ||
   717		    range.minlen > XFS_FSB_TO_B(mp, mp->m_ag_max_usable) ||
   718		    range.len < mp->m_sb.sb_blocksize)
   719			return -EINVAL;
   720	
   721		start = BTOBB(range.start);
   722		end = start + BTOBBT(range.len) - 1;
   723	
   724		if (bdev_max_discard_sectors(mp->m_ddev_targp->bt_bdev)) {
   725			error = xfs_trim_datadev_extents(mp, start, end, minlen);
   726			if (error)
   727				last_error = error;
   728		}
   729	
   730		if (rt_bdev && !xfs_trim_should_stop()) {
 > 731			error = xfs_trim_rtdev_extents(mp, start, end, minlen);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
