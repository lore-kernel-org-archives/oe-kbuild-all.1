Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2D30AAC0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241998; cv=none; b=PSm3JAilUo5GIveOPjrP8XIEh2k2QfnN+q5/COLEmeT8pQ0cKG22ev+ct8OWCWzUWn2LRwXAETwCq7es2a7jwPFr8I3dmi6+N5XKyEacDglwEfGVKs8PZ1gDWwYy9GxQ1NUlgdHo88Jjx9z44+OJkr+72ij0f4BwkB2OY8drGE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241998; c=relaxed/simple;
	bh=DUCg9GV1h2szOBRv18co15sBLqO0o1v/Gg9z06qvltY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oeEDdq6BD4MRcYAxKP+FWIsXT5M75tdCMlphZr4npyxVt+b2GXG4IV68oOTfdnlk0h0ipqoQIXyaF0UudKO6V40/59yUS7U1LzJ/lMidR9BLZT2+CCjZZsSKYy85A/V5NSh6rt/3sfoVLbuJ1tlFS4Lwe3vne2LKnBsmM1fECOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksP40pEu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksP40pEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762241996; x=1793777996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DUCg9GV1h2szOBRv18co15sBLqO0o1v/Gg9z06qvltY=;
  b=ksP40pEujfL6ka3UTKUyTvAKDYeAacKkE91Ttli0CliS/O4s8RGfIYFL
   u/yS3RuuritLXNgVy2izxKlx5EF+kY/V6nyTUDlyvqWDEr01j2+GcVukQ
   i7R1WWoezS/WpXDUD57a9whW2SsoZkYNpBrRDi/R4RJLnLNC1OFQb4FYy
   +lbBagPb7MOPdj95fkuQTu2a48x6kBarwTpA7GOibk5pLLTMWZHXFm4Y2
   ysB/R755Jx3AMViikahW/Ut3Zjx/7oe1Jd/EjmfoAzK6qlpTBBf439osw
   ku0KKHkGh5+o/2A/z3TmRcKN8eJf1FBYzi7N2M/1paYnyy3z7Rpw9BV47
   w==;
X-CSE-ConnectionGUID: JIFsadssQPafkss7bddxMQ==
X-CSE-MsgGUID: dmWTTldKSBmUdr4QVSBqow==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81958359"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="81958359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 23:39:56 -0800
X-CSE-ConnectionGUID: SRtVRxJETKOUkPCTbvXivQ==
X-CSE-MsgGUID: 1XCAC+6yQeK94xYH4h5/og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="187239676"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Nov 2025 23:39:54 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGBdY-000R3a-2j;
	Tue, 04 Nov 2025 07:39:35 +0000
Date: Tue, 4 Nov 2025 15:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-ioerr-reporting 18/28]
 fs/xfs/xfs_notify_failure.c:531:27: warning: unused variable 'notify'
Message-ID: <202511041506.gq5JxBUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-ioerr-reporting
head:   fe3c1f3502d002505e2a3992b3448ee14141eede
commit: b98248a61ffa4266e1711739cc71bf8d3c7793ad [18/28] xfs: add media error reporting ioctl
config: arm-randconfig-r072-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041506.gq5JxBUS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041506.gq5JxBUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041506.gq5JxBUS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/xfs_notify_failure.c: In function 'xfs_report_one_data_loss':
   fs/xfs/xfs_notify_failure.c:474:10: error: invalid use of undefined type 'struct xfs_failure_info'
     474 |    notify->startblock + notify->blockcount;
         |          ^~
   fs/xfs/xfs_notify_failure.c:474:31: error: invalid use of undefined type 'struct xfs_failure_info'
     474 |    notify->startblock + notify->blockcount;
         |                               ^~
   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_notify_failure.c:6:
   fs/xfs/xfs_notify_failure.c:487:12: error: invalid use of undefined type 'struct xfs_failure_info'
     487 |  if (notify->startblock > rec->rm_startblock) {
         |            ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/xfs/xfs_notify_failure.c:487:2: note: in expansion of macro 'if'
     487 |  if (notify->startblock > rec->rm_startblock) {
         |  ^~
   fs/xfs/xfs_notify_failure.c:487:12: error: invalid use of undefined type 'struct xfs_failure_info'
     487 |  if (notify->startblock > rec->rm_startblock) {
         |            ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/xfs/xfs_notify_failure.c:487:2: note: in expansion of macro 'if'
     487 |  if (notify->startblock > rec->rm_startblock) {
         |  ^~
   fs/xfs/xfs_notify_failure.c:487:12: error: invalid use of undefined type 'struct xfs_failure_info'
     487 |  if (notify->startblock > rec->rm_startblock) {
         |            ^~
   include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
      68 |  (cond) ?     \
         |   ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/xfs/xfs_notify_failure.c:487:2: note: in expansion of macro 'if'
     487 |  if (notify->startblock > rec->rm_startblock) {
         |  ^~
   fs/xfs/xfs_notify_failure.c:488:20: error: invalid use of undefined type 'struct xfs_failure_info'
     488 |   fileoff += notify->startblock - rec->rm_startblock;
         |                    ^~
   fs/xfs/xfs_notify_failure.c:489:19: error: invalid use of undefined type 'struct xfs_failure_info'
     489 |   blocks -= notify->startblock - rec->rm_startblock;
         |                   ^~
   fs/xfs/xfs_notify_failure.c: In function 'xfs_report_data_loss':
   fs/xfs/xfs_notify_failure.c:531:10: error: variable 'notify' has initializer but incomplete type
     531 |   struct xfs_failure_info notify = { };
         |          ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_notify_failure.c:531:27: error: storage size of 'notify' isn't known
     531 |   struct xfs_failure_info notify = { };
         |                           ^~~~~~
>> fs/xfs/xfs_notify_failure.c:531:27: warning: unused variable 'notify' [-Wunused-variable]


vim +/notify +531 fs/xfs/xfs_notify_failure.c

   500	
   501	static int
   502	xfs_report_data_loss(
   503		struct xfs_mount	*mp,
   504		enum xfs_group_type	type,
   505		xfs_daddr_t		daddr,
   506		u64			bblen)
   507	{
   508		struct xfs_group	*xg = NULL;
   509		struct xfs_trans	*tp;
   510		xfs_fsblock_t		start_bno, end_bno;
   511		uint32_t		start_gno, end_gno;
   512		int			error;
   513	
   514		if (type == XG_TYPE_RTG) {
   515			start_bno = xfs_daddr_to_rtb(mp, daddr);
   516			end_bno = xfs_daddr_to_rtb(mp, daddr + bblen - 1);
   517		} else {
   518			start_bno = XFS_DADDR_TO_FSB(mp, daddr);
   519			end_bno = XFS_DADDR_TO_FSB(mp, daddr + bblen - 1);
   520		}
   521	
   522		tp = xfs_trans_alloc_empty(mp);
   523		start_gno = xfs_fsb_to_gno(mp, start_bno, type);
   524		end_gno = xfs_fsb_to_gno(mp, end_bno, type);
   525		while ((xg = xfs_group_next_range(mp, xg, start_gno, end_gno, type))) {
   526			struct xfs_buf		*agf_bp = NULL;
   527			struct xfs_rtgroup	*rtg = NULL;
   528			struct xfs_btree_cur	*cur;
   529			struct xfs_rmap_irec	ri_low = { };
   530			struct xfs_rmap_irec	ri_high;
 > 531			struct xfs_failure_info	notify = { };
   532	
   533			if (type == XG_TYPE_AG) {
   534				struct xfs_perag	*pag = to_perag(xg);
   535	
   536				error = xfs_alloc_read_agf(pag, tp, 0, &agf_bp);
   537				if (error) {
   538					xfs_perag_put(pag);
   539					break;
   540				}
   541	
   542				cur = xfs_rmapbt_init_cursor(mp, tp, agf_bp, pag);
   543			} else {
   544				rtg = to_rtg(xg);
   545				xfs_rtgroup_lock(rtg, XFS_RTGLOCK_RMAP);
   546				cur = xfs_rtrmapbt_init_cursor(tp, rtg);
   547			}
   548	
   549			/*
   550			 * Set the rmap range from ri_low to ri_high, which represents
   551			 * a [start, end] where we looking for the files or metadata.
   552			 */
   553			memset(&ri_high, 0xFF, sizeof(ri_high));
   554			if (xg->xg_gno == start_gno)
   555				ri_low.rm_startblock =
   556					xfs_fsb_to_gbno(mp, start_bno, type);
   557			if (xg->xg_gno == end_gno)
   558				ri_high.rm_startblock =
   559					xfs_fsb_to_gbno(mp, end_bno, type);
   560	
   561			notify.startblock = ri_low.rm_startblock;
   562			notify.blockcount = min(xg->xg_block_count,
   563						ri_high.rm_startblock + 1) -
   564						ri_low.rm_startblock;
   565	
   566			error = xfs_rmap_query_range(cur, &ri_low, &ri_high,
   567					xfs_report_one_data_loss, &notify);
   568			xfs_btree_del_cursor(cur, error);
   569			if (agf_bp)
   570				xfs_trans_brelse(tp, agf_bp);
   571			if (rtg)
   572				xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_RMAP);
   573			if (error) {
   574				xfs_group_put(xg);
   575				break;
   576			}
   577		}
   578	
   579		xfs_trans_cancel(tp);
   580		return 0;
   581	}
   582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
