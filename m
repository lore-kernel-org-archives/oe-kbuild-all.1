Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EAB23B61B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762248233; cv=none; b=DZI6D4zt9vbDawDtQxby6C7aRuMcQFAF5DhrPPYepWwVLLFJWjwY1dvYzr7lNLo2KIxFrHYKyR/1/cYldxPwPyYSt2vcMzaB8qWXrKhjQIoU7hyW6tUmDn8YlUDLOrwe0q2Qo94ATfCqIBQgRl0UwBdQttn7mT8/tj6eFg93uvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762248233; c=relaxed/simple;
	bh=i/faRy2zS/Yz1an9lsMbbDMjY6ERiHYMFHITJmSFYek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQAomGSjKMnAcyp7k5uKw1MTT9EYPkGq7OdI9Bf8fdYZV6a1y0MkHgmDyem6QqDzSMAQoK6yxMcC8FFcXKS7GBfJh6VnRCj2syj8UXeokeZvwJZNOd9YsW5ZN6zYrNoKt+hkAxuHG6LGgD3lV9bnFDToeiG09odFwpgtvF0BcHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LPDEV9J+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LPDEV9J+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762248231; x=1793784231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i/faRy2zS/Yz1an9lsMbbDMjY6ERiHYMFHITJmSFYek=;
  b=LPDEV9J+y4Q6tLJ54WP7J6FUP8FPmR0GOzE6lhfaY93m5EdoifEPzkFN
   jafJkUualPy2++4AImVUxE2rY/WUr+iaFrTf+OfdkG4DqkT/ZP/PhhtWk
   OV+8AENNX62CLISVJ9bZV92zBtCLBBovnv4MesvSfUFlZ9xshKOtnlGIZ
   wUErYPcSTZiNDu+ZnbMuz9TdirDWaYwbV1IdNgwNQIeMv7xavexkrZvDI
   YpCEDUUb2mThJl5oY8hGrlrveAPJSr19HNk4cyV9gxWsBI616DaccA32l
   NT3jknIfxeKsb86Hs4ebQRKQWvKWwo9k7Fn85qpEmvY/kOPhQyfs9Z3Bt
   A==;
X-CSE-ConnectionGUID: pCw7MGfmS62npJLXtgmnvg==
X-CSE-MsgGUID: OoKmc3MPQDufIim0lKi8bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68197013"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="68197013"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 01:23:49 -0800
X-CSE-ConnectionGUID: 8X6An0kyRYOt64W4l3lUTA==
X-CSE-MsgGUID: QBIgLTRnQGmWkkOqovocKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="192277303"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 01:23:48 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGDGP-000RCE-2E;
	Tue, 04 Nov 2025 09:23:43 +0000
Date: Tue, 4 Nov 2025 17:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-ioerr-reporting 18/28]
 fs/xfs/xfs_notify_failure.c:474:10: error: invalid use of undefined type
 'struct xfs_failure_info'
Message-ID: <202511041718.pViu7hoD-lkp@intel.com>
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
config: arm-randconfig-r072-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041718.pViu7hoD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041718.pViu7hoD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041718.pViu7hoD-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_notify_failure.c: In function 'xfs_report_one_data_loss':
>> fs/xfs/xfs_notify_failure.c:474:10: error: invalid use of undefined type 'struct xfs_failure_info'
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
>> fs/xfs/xfs_notify_failure.c:531:10: error: variable 'notify' has initializer but incomplete type
     531 |   struct xfs_failure_info notify = { };
         |          ^~~~~~~~~~~~~~~~
>> fs/xfs/xfs_notify_failure.c:531:27: error: storage size of 'notify' isn't known
     531 |   struct xfs_failure_info notify = { };
         |                           ^~~~~~
   fs/xfs/xfs_notify_failure.c:531:27: warning: unused variable 'notify' [-Wunused-variable]


vim +474 fs/xfs/xfs_notify_failure.c

   461	
   462	static int
   463	xfs_report_one_data_loss(
   464		struct xfs_btree_cur		*cur,
   465		const struct xfs_rmap_irec	*rec,
   466		void				*data)
   467	{
   468		struct xfs_mount		*mp = cur->bc_mp;
   469		struct xfs_inode		*ip;
   470		struct xfs_failure_info		*notify = data;
   471		xfs_fileoff_t			fileoff = rec->rm_offset;
   472		xfs_extlen_t			blocks = rec->rm_blockcount;
   473		const xfs_agblock_t		notify_end =
 > 474				notify->startblock + notify->blockcount;
   475		const xfs_agblock_t		rmap_end =
   476				rec->rm_startblock + rec->rm_blockcount;
   477		int				error = 0;
   478	
   479		if (XFS_RMAP_NON_INODE_OWNER(rec->rm_owner) ||
   480		    (rec->rm_flags & (XFS_RMAP_ATTR_FORK | XFS_RMAP_BMBT_BLOCK)))
   481			return 0;
   482	
   483		error = xfs_iget(mp, cur->bc_tp, rec->rm_owner, 0, 0, &ip);
   484		if (error)
   485			return 0;
   486	
   487		if (notify->startblock > rec->rm_startblock) {
   488			fileoff += notify->startblock - rec->rm_startblock;
   489			blocks -= notify->startblock - rec->rm_startblock;
   490		}
   491		if (rmap_end > notify_end)
   492			blocks -= rmap_end - notify_end;
   493	
   494		xfs_inode_media_error(ip, XFS_FSB_TO_B(mp, fileoff),
   495				XFS_FSB_TO_B(mp, blocks));
   496	
   497		xfs_irele(ip);
   498		return 0;
   499	}
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
