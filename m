Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63543D961
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jan 2024 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aF5F3SZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704831693; x=1736367693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3tZT/ZHWMW5zve+f/Gr/++ZvbzNII34HrKb2U3/PMk=;
  b=aF5F3SZIWzAoOVgTpBlG2dKxBhqlNn9dyFq0XBLKmyb2LjYj1nAx1t62
   UFbOOW+KhssnfIRibZsP/Da7npY/r2+jL6zr0fQdc/X4o4lzVPqfDx43N
   9R3VdlInkpbSPZUa/v/FooI09EXFhC9vKR14qHQScPLQARS310T3ImRUk
   JYg/jWpqmGUqyUPiCLU8RJgLh0Xme2IoWTZSBnVYX9MCIPPyZiKu1Kv9w
   vx284f02uZXaVZxjxG2AJ67icvVyNCvRnTa7m7r5SSZj5L5k/KxyDbgWw
   7smkShSrvFw/Bz5OEQdwHNDe0SA9HJ/TYIiE06WP6G32ITgCW/lXw2n31
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="19818306"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="19818306"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 12:21:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="852314542"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="852314542"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jan 2024 12:21:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNIbI-0006F8-2x;
	Tue, 09 Jan 2024 20:21:28 +0000
Date: Wed, 10 Jan 2024 04:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:report-refcounts 554/579]
 fs/xfs/scrub/cow_repair.c:493:33: warning: variable 'rtx' is uninitialized
 when used here
Message-ID: <202401100409.Q3tBGVIh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git report-refcounts
head:   5d14a0777e62110ddaa8cb745f99d018345be8f2
commit: 4681ae00cfc6de7d04b0dd50e782093474bb96cd [554/579] xfs: fix CoW forks for realtime files
config: x86_64-buildonly-randconfig-006-20240109 (https://download.01.org/0day-ci/archive/20240110/202401100409.Q3tBGVIh-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401100409.Q3tBGVIh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401100409.Q3tBGVIh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/scrub/cow_repair.c:493:33: warning: variable 'rtx' is uninitialized when used here [-Wuninitialized]
     493 |         rtbno = xfs_rtx_to_rtb(sc->mp, rtx);
         |                                        ^~~
   fs/xfs/scrub/cow_repair.c:476:19: note: initialize the variable 'rtx' to silence this warning
     476 |         xfs_rtxnum_t            rtx;
         |                                    ^
         |                                     = 0
   1 warning generated.


vim +/rtx +493 fs/xfs/scrub/cow_repair.c

   465	
   466	/*
   467	 * Allocate a replacement rt CoW staging extent of up to the given number of
   468	 * blocks, and fill out the mapping.
   469	 */
   470	STATIC int
   471	xrep_cow_alloc_rt(
   472		struct xfs_scrub	*sc,
   473		xfs_extlen_t		maxlen,
   474		struct xrep_cow_extent	*repl)
   475	{
   476		xfs_rtxnum_t		rtx;
   477		xfs_rtxlen_t		maxrtx;
   478		xfs_rtxlen_t		rtxlen = 0;
   479		xfs_rtblock_t		rtbno;
   480		xfs_extlen_t		len;
   481		int			error;
   482	
   483		maxrtx = xfs_rtb_to_rtx(sc->mp, maxlen);
   484		error = xfs_trans_reserve_more(sc->tp, 0, maxrtx);
   485		if (error)
   486			return error;
   487	
   488		xfs_rtbitmap_lock(sc->tp, sc->mp);
   489		error = xfs_rtallocate_extent(sc->tp, 0, maxlen, &rtxlen, &rtx);
   490		if (error)
   491			return error;
   492	
 > 493		rtbno = xfs_rtx_to_rtb(sc->mp, rtx);
   494		len = xfs_rtxlen_to_extlen(sc->mp, rtxlen);
   495		xfs_refcount_alloc_cow_extent(sc->tp, true, rtbno, len);
   496	
   497		repl->fsbno = rtbno;
   498		repl->len = len;
   499		return 0;
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
