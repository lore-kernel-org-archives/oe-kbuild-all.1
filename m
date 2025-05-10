Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2A233736
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746872410; cv=none; b=dFrPm1f293QdpN8rQpuTUKHf/89xYnRFSSz7epBczQpftHqRFTnbAnjUnpBde763ZjkisJdP424lySP7qjHcJYqavNZ1iXMUxkXCNhLI6/nmK6v1JS/FUMtDqpj8XZPFS1q9bviuH9jV2wWeELtgHDSzeklTBApYhLwOdrpE134=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746872410; c=relaxed/simple;
	bh=9+8D2KgBQjRv7RIbAG1ugGL5CQa/kqQo33aqX98vSlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1LBHP0JEuXfNUqj7OtQF4I2gcCtYl1NpWk8Q5y1yQgfpDJtOHusYen9LCi7op3TFcKgjCLMwFCNCSDYI7Ob0/FYNHgjatjjevj2wQJk2348Jzj9mVb66+32nILUmvnoX9szXysT7vreY5WpU0zHfX4MJls28DneP4g05JjgIPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eF2nwdJz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eF2nwdJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746872408; x=1778408408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9+8D2KgBQjRv7RIbAG1ugGL5CQa/kqQo33aqX98vSlM=;
  b=eF2nwdJzJadEs+0Ezs5RHoi9rT7X+L+ZGT/1u47n/26Ck7s+ti9w8XeN
   h+E10izM6kWir4v2LPREsP22Ho1DjQCnQi7qPcdwL02Ee5of/W4niM/+Y
   gO7lRoGLysts/Nwb92352YgN5kENPPkeuBhnqx7WJjYyCc2c8bPP54Qsz
   oUCI22lNJsaq2p3EYxR1w/TfCZljEcZvdYcBKzcw64UbzPhTmMbYiC+lZ
   BxkweC479Tp0FX5YN1XijMQjsCcU+JZ9TRTE5hC7YnUo+UDq5i8WDqMEQ
   7m1exmASapSXrQO8LB0iN3Rc0KYrFqlYCmURAryS7Z8vv7CdmwIy1jJLt
   w==;
X-CSE-ConnectionGUID: O4vnQ+X8Rhe1zC5bRRqTpg==
X-CSE-MsgGUID: knTMt16CSu6dxfWyj3PTnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51360774"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="51360774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 03:20:05 -0700
X-CSE-ConnectionGUID: 4lT1esovQdWNWZmZuMp6Yg==
X-CSE-MsgGUID: EFirsk4ESKiAtMzYX+BWcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141821560"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 May 2025 03:20:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDhJI-000Czh-2v;
	Sat, 10 May 2025 10:20:00 +0000
Date: Sat, 10 May 2025 18:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] fs/xfs/xfs_reflink.c:592:4:
 warning: converting the result of '<<' to a boolean always evaluates to true
Message-ID: <202505101801.Ae9uE8nw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   a79e0786f3fa90fd521f198ac6ccf6b11dbf67c2
commit: 9a7fed7349b376b193c3d4c921087e4183af26b0 [0/94] anolis: xfs: add capability to unshare shared range of files that don't trigger cow
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250510/202505101801.Ae9uE8nw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101801.Ae9uE8nw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101801.Ae9uE8nw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_reflink.c:592:4: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
     592 |                         XFS_QMOPT_RES_REGBLKS);
         |                         ^
   fs/xfs/libxfs/xfs_quota_defs.h:85:35: note: expanded from macro 'XFS_QMOPT_RES_REGBLKS'
      85 | #define XFS_QMOPT_RES_REGBLKS   (1u << 7)
         |                                     ^
   1 warning generated.


vim +592 fs/xfs/xfs_reflink.c

   529	
   530	STATIC int
   531	xfs_reflink_unshare_range(
   532		struct xfs_mount	*mp,
   533		struct xfs_bmbt_irec	*oimap,
   534		struct xfs_rmap_irec	*rmap)
   535	{
   536		struct xfs_inode	*ip;
   537		xfs_fileoff_t		offset_fsb = oimap->br_startoff;
   538		xfs_filblks_t		count_fsb = oimap->br_blockcount;
   539		struct xfs_trans	*tp;
   540		int			nimaps, error = 0;
   541		bool			shared, found;
   542		xfs_filblks_t		resaligned;
   543		xfs_extlen_t		resblks = 0;
   544		uint			lockmode = XFS_ILOCK_EXCL | XFS_IOLOCK_EXCL | XFS_MMAPLOCK_EXCL;
   545		struct xfs_bmbt_irec	imap = *oimap;
   546		struct xfs_bmbt_irec	cmap;
   547	
   548		error = xfs_iget(mp, NULL, rmap->rm_owner, 0, 0, &ip);
   549		if (error < 0)
   550			return error;
   551	
   552		xfs_ilock(ip, lockmode);
   553		xfs_flush_unmap_range(ip, XFS_FSB_TO_B(mp, imap.br_startoff),
   554				XFS_FSB_TO_B(mp, imap.br_blockcount));
   555	
   556		error = xfs_find_trim_cow_extent(ip, &imap, &cmap, &shared, &found);
   557		if (error || !shared)
   558			goto error;
   559	
   560		if (found)
   561			goto convert;
   562	
   563		resaligned = xfs_aligned_fsb_count(imap.br_startoff,
   564			imap.br_blockcount, xfs_get_cowextsz_hint(ip));
   565		resblks = XFS_DIOSTRAT_SPACE_RES(mp, resaligned);
   566	
   567		xfs_iunlock(ip, XFS_ILOCK_EXCL);
   568		error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, resblks, 0, 0, &tp);
   569		if (error) {
   570			lockmode = XFS_IOLOCK_EXCL | XFS_MMAPLOCK_EXCL;
   571			goto error;
   572		}
   573	
   574		xfs_ilock(ip, XFS_ILOCK_EXCL);
   575	
   576		error = xfs_qm_dqattach_locked(ip, false);
   577		if (error)
   578			goto out_trans_cancel;
   579	
   580		/*
   581		 * Check for an overlapping extent again now that we dropped the ilock.
   582		 */
   583		error = xfs_find_trim_cow_extent(ip, &imap, &cmap, &shared, &found);
   584		if (error || !shared)
   585			goto out_trans_cancel;
   586		if (found) {
   587			xfs_trans_cancel(tp);
   588			goto convert;
   589		}
   590	
   591		error = xfs_trans_reserve_quota_nblks(tp, ip, resblks, 0,
 > 592				XFS_QMOPT_RES_REGBLKS);
   593		if (error)
   594			goto out_trans_cancel;
   595	
   596		xfs_trans_ijoin(tp, ip, 0);
   597	
   598		/* Allocate the entire reservation as zeroed blocks. */
   599		nimaps = 1;
   600		error = xfs_bmapi_write(tp, ip, imap.br_startoff, imap.br_blockcount,
   601				XFS_BMAPI_COWFORK | XFS_BMAPI_ZERO, resblks, &cmap, &nimaps);
   602		if (error)
   603			goto out_trans_cancel;
   604	
   605		xfs_inode_set_cowblocks_tag(ip);
   606		error = xfs_trans_commit(tp);
   607		if (error)
   608			goto error;
   609	
   610		/*
   611		 * Allocation succeeded but the requested range was not even partially
   612		 * satisfied?  Bail out!
   613		 */
   614		if (nimaps == 0) {
   615			error = -ENOSPC;
   616			goto error;
   617		}
   618	convert:
   619		xfs_trim_extent(&cmap, offset_fsb, count_fsb);
   620		trace_xfs_reflink_convert_cow(ip, &cmap);
   621		error = xfs_reflink_convert_cow_locked(ip, offset_fsb, count_fsb);
   622		if (error)
   623			goto error;
   624		cmap.br_state = XFS_EXT_NORM;
   625		dax_copy_range(xfs_inode_buftarg(ip)->bt_bdev,
   626				xfs_inode_buftarg(ip)->bt_daxdev,
   627				BBTOB(xfs_fsb_to_db(ip, oimap->br_startblock)),
   628				BBTOB(xfs_fsb_to_db(ip, cmap.br_startblock)),
   629				XFS_FSB_TO_B(mp, cmap.br_blockcount));
   630		xfs_iunlock(ip, XFS_ILOCK_EXCL);
   631		xfs_reflink_end_cow(ip, XFS_FSB_TO_B(mp, cmap.br_startoff),
   632				XFS_FSB_TO_B(mp, cmap.br_blockcount));
   633		xfs_iunlock(ip, XFS_IOLOCK_EXCL | XFS_MMAPLOCK_EXCL);
   634		xfs_irele(ip);
   635		return error;
   636	
   637	out_trans_cancel:
   638		xfs_trans_cancel(tp);
   639	
   640	error:
   641		xfs_iunlock(ip, lockmode);
   642		xfs_irele(ip);
   643		return error;
   644	}
   645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
