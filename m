Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D217740
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUh2pCKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698931527; x=1730467527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YZX5pQ7anyk+uDMua7gAyFCpQJLSvxBBTjgWjdpEuC8=;
  b=cUh2pCKsJH1/NPZahycb/AjS5TzU8uH2Z44/v9KYCmeL/9l8rO67JYbs
   zvweKyLtn+L8CCuroVMO+pweYVTcCTj86SZSzawbulWIIwkTaKxkiBOpp
   sWeo/qP1/Li3mylMsgVt8bULW6zqJiaq7M8YjTgRSk1zCVWVpl4KbhWFe
   qkkVeOhDXUbei3QB7yonWDjDSLR6CeFUkrKZHeJHBgqbYtniYNI+x6dyV
   qiFR5CsMeeb+l/UOGaBO2Y4icyWOgBGyM4NodXtyMsq3z3L72lk3KfKrv
   FDOQnjE/qqXLtrim9XRhF/riOXowDSNi/pjtSeqpXlkH50+klGNyQFOSc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1580249"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1580249"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 06:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="934780833"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="934780833"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Nov 2023 06:25:24 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyXhL-0001Tw-0X;
	Thu, 02 Nov 2023 13:25:23 +0000
Date: Thu, 2 Nov 2023 21:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:file-force-align 506/507] fs/xfs/xfs_bmap_util.c:1450:9:
 error: implicit declaration of function
 'trace_xfs_convert_bigalloc_file_space'; did you mean
 'xfs_convert_bigalloc_file_space'?
Message-ID: <202311022124.PIIRVz7e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git file-force-align
head:   2f5d0685694a329d50ad1988293dc3f838d798ed
commit: 9560af7afefad8ce14877a40e356fb869ca7c785 [506/507] xfs: support reflink with force align enabled
config: powerpc64-randconfig-002-20231102 (https://download.01.org/0day-ci/archive/20231102/202311022124.PIIRVz7e-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311022124.PIIRVz7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311022124.PIIRVz7e-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_bmap_util.c: In function 'xfs_convert_bigalloc_file_space':
>> fs/xfs/xfs_bmap_util.c:1450:9: error: implicit declaration of function 'trace_xfs_convert_bigalloc_file_space'; did you mean 'xfs_convert_bigalloc_file_space'? [-Werror=implicit-function-declaration]
    1450 |         trace_xfs_convert_bigalloc_file_space(ip, pos, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_convert_bigalloc_file_space
   cc1: some warnings being treated as errors


vim +1450 fs/xfs/xfs_bmap_util.c

d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1415  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1416  /*
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1417   * Prepare a file with multi-fsblock allocation units for a remapping.
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1418   *
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1419   * File allocation units (AU) must be fully mapped to the data fork.  If the
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1420   * space in an AU have not been fully written, there can be multiple extent
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1421   * mappings (e.g. mixed written and unwritten blocks) to the AU.  If the log
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1422   * does not have a means to ensure that all remappings for a given AU will be
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1423   * completed even if the fs goes down, we must maintain the above constraint in
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1424   * another way.
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1425   *
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1426   * Convert the unwritten parts of an AU to written by writing zeroes to the
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1427   * storage and flipping the mapping.  Once this completes, there will be a
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1428   * single mapping for the entire AU, and we can proceed with the remapping
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1429   * operation.
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1430   *
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1431   * Callers must ensure that there are no dirty pages in the given range.
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1432   */
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1433  int
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1434  xfs_convert_bigalloc_file_space(
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1435  	struct xfs_inode	*ip,
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1436  	loff_t			pos,
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1437  	uint64_t		len)
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1438  {
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1439  	struct xfs_mount	*mp = ip->i_mount;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1440  	xfs_fileoff_t		off;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1441  	xfs_fileoff_t		endoff;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1442  	int			error;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1443  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1444  	if (!xfs_inode_has_bigallocunit(ip))
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1445  		return 0;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1446  
f05b39e060631e Darrick J. Wong 2023-03-06  1447  	off = xfs_rtb_rounddown_rtx(mp, XFS_B_TO_FSBT(mp, pos));
f05b39e060631e Darrick J. Wong 2023-03-06  1448  	endoff = xfs_rtb_roundup_rtx(mp, XFS_B_TO_FSB(mp, pos + len));
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1449  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06 @1450  	trace_xfs_convert_bigalloc_file_space(ip, pos, len);
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1451  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1452  	while (off < endoff) {
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1453  		if (fatal_signal_pending(current))
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1454  			return -EINTR;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1455  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1456  		error = xfs_convert_bigalloc_mapping(ip, &off, endoff);
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1457  		if (error)
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1458  			return error;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1459  	}
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1460  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1461  	return 0;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1462  }
2f1c2bb5cdbcf6 Darrick J. Wong 2023-03-06  1463  

:::::: The code at line 1450 was first introduced by commit
:::::: d0c6e4b2d648b8ae0382bb9e56bbf8c88e438646 xfs: make atomic extent swapping support realtime files

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
