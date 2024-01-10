Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9694BA81
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPo8WvG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704897906; x=1736433906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RNK7QSW72dfw1scmJ3lkd5kS+uzX+PB3XPZPnXHz6So=;
  b=SPo8WvG+HJ8Vt6ZvU7H4R2bgeNFQQ1rbaYJ0ZYAaK2DCTSd3s2+ekaKG
   qQidKYoLHG7Zd/82BeSDK2iZn0j4MCKd0ixdO5u/6BN5qbO+KXJh2JFh1
   9vp6yOtRJuqgALizCD/Rsw0PHTWzGOz7ECB3yczwMtrtN7JOdqvjg3WQp
   APwDr4E+WGkuVyt5xNj5P4XwdHsWw0lY4ubDPDVO8IZopI2ZTeL7Mht1e
   Z549K/0257SWuKvbQEkv7lDgFAw5YucxB9rC4ka6Os4kyWtS/JBrRlzFY
   5QGtFIlhbRpbEO/J+kxjjJSaNtY+dzV2rhgrSoCH7dYjYnV0rXaU0xbEp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="12024218"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="12024218"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 06:45:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="905561691"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="905561691"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Jan 2024 06:45:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNZpF-00078g-27;
	Wed, 10 Jan 2024 14:45:01 +0000
Date: Wed, 10 Jan 2024 22:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 180/340]
 fs/xfs/libxfs/xfs_btree.c:314:25: warning: unused variable 'bno'
Message-ID: <202401102231.0Lq7zlvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   6820c932698e9b793276281d37b90a8c4538f1f3
commit: e91832006a51ef03833a939d6487612cbac98a35 [180/340] xfs: support in-memory btrees
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240110/202401102231.0Lq7zlvB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401102231.0Lq7zlvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401102231.0Lq7zlvB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_btree.c: In function 'xfs_btree_check_ptr':
>> fs/xfs/libxfs/xfs_btree.c:314:25: warning: unused variable 'bno' [-Wunused-variable]
     314 |                 xfbno_t bno             = be64_to_cpu((&ptr->l)[index]);
         |                         ^~~


vim +/bno +314 fs/xfs/libxfs/xfs_btree.c

   301	
   302	/*
   303	 * Check that a given (indexed) btree pointer at a certain level of a
   304	 * btree is valid and doesn't point past where it should.
   305	 */
   306	static int
   307	xfs_btree_check_ptr(
   308		struct xfs_btree_cur		*cur,
   309		const union xfs_btree_ptr	*ptr,
   310		int				index,
   311		int				level)
   312	{
   313		if (cur->bc_ops->geom_flags & XFS_BTGEO_IN_MEM) {
 > 314			xfbno_t bno		= be64_to_cpu((&ptr->l)[index]);
   315	
   316			ASSERT(cur->bc_ops->geom_flags & XFS_BTGEO_LONG_PTRS);
   317	
   318			if (xfbtree_verify_bno(cur->bc_mem.xfbtree, bno))
   319				return 0;
   320	
   321			xfs_err(cur->bc_mp,
   322	"In-memory: Corrupt btree %d flags 0x%x pointer at level %d index %d fa %pS.",
   323					cur->bc_btnum, cur->bc_flags, level, index,
   324					__this_address);
   325			return -EFSCORRUPTED;
   326		} else if (cur->bc_ops->geom_flags & XFS_BTGEO_LONG_PTRS) {
   327			if (xfs_btree_check_lptr(cur, be64_to_cpu((&ptr->l)[index]),
   328					level))
   329				return 0;
   330			xfs_err(cur->bc_mp,
   331	"Inode %llu fork %d: Corrupt btree %d pointer at level %d index %d.",
   332					cur->bc_ino.ip->i_ino,
   333					cur->bc_ino.whichfork, cur->bc_btnum,
   334					level, index);
   335		} else {
   336			if (xfs_btree_check_sptr(cur, be32_to_cpu((&ptr->s)[index]),
   337					level))
   338				return 0;
   339			xfs_err(cur->bc_mp,
   340	"AG %u: Corrupt btree %d pointer at level %d index %d.",
   341					cur->bc_ag.pag->pag_agno, cur->bc_btnum,
   342					level, index);
   343		}
   344	
   345		xfs_btree_mark_sick(cur);
   346		return -EFSCORRUPTED;
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
