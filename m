Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD7E31750
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 19:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkwkaYEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701718910; x=1733254910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N4IABidXLCDgGx2ggOP6a6/JI5fLeYZ35dtg43Hk+Xs=;
  b=JkwkaYEc3JxcCVAjRN/YHWVLcHKeoSpaWV/2/m3Iz6Lgkn8iHbPZayfm
   S2t/vm8fuqb3Oh4WgMptCqSIUlP2XxbLs5+dSNiyuXYyWGu8JpJTehvV6
   NwUWsJqp7t05iYKSJmc7cGb3QFn5rGUgyTGQc8lR5sUtpDQEfxW+5VRDV
   hwppyXBKDUFuYvv4/q/dCPk67IWkhPXiJ+vJYRrHwwtAOQPIreRpwRx5f
   m+IQ5DgD3+ZOykDd4wx++tv9o7mzCUlPe0Gq/usVGz4/qVGkWRqEsFayR
   +5exw4JB7tpq4GZmi4bJFKUHISAwaXMMi9J6tjNgxoWt6SfAHtMe/qmVf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="460281350"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="460281350"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 11:41:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="720426405"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="720426405"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Dec 2023 11:41:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAEp3-00081z-2l;
	Mon, 04 Dec 2023 19:41:43 +0000
Date: Tue, 5 Dec 2023 03:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/freevxfs/vxfs_immed.c:67: warning: Function parameter or member
 'fp' not described in 'vxfs_immed_read_folio'
Message-ID: <202312050334.bmiUtFL0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 42d7a524e9ee13f6ea8b1539a293a365db2ba2f5 freevxfs: Convert vxfs_immed to read_folio
date:   1 year, 7 months ago
config: x86_64-buildonly-randconfig-004-20231010 (https://download.01.org/0day-ci/archive/20231205/202312050334.bmiUtFL0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312050334.bmiUtFL0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312050334.bmiUtFL0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/freevxfs/vxfs_immed.c:67: warning: Function parameter or member 'fp' not described in 'vxfs_immed_read_folio'
>> fs/freevxfs/vxfs_immed.c:67: warning: Excess function parameter 'file' description in 'vxfs_immed_read_folio'


vim +67 fs/freevxfs/vxfs_immed.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  49  
^1da177e4c3f41 Linus Torvalds          2005-04-16  50  /**
42d7a524e9ee13 Matthew Wilcox (Oracle  2022-04-29  51)  * vxfs_immed_read_folio - read part of an immed inode into pagecache
^1da177e4c3f41 Linus Torvalds          2005-04-16  52   * @file:	file context (unused)
42d7a524e9ee13 Matthew Wilcox (Oracle  2022-04-29  53)  * @folio:	folio to fill in.
^1da177e4c3f41 Linus Torvalds          2005-04-16  54   *
^1da177e4c3f41 Linus Torvalds          2005-04-16  55   * Description:
42d7a524e9ee13 Matthew Wilcox (Oracle  2022-04-29  56)  *   vxfs_immed_read_folio reads a part of the immed area of the
^1da177e4c3f41 Linus Torvalds          2005-04-16  57   *   file that hosts @pp into the pagecache.
^1da177e4c3f41 Linus Torvalds          2005-04-16  58   *
^1da177e4c3f41 Linus Torvalds          2005-04-16  59   * Returns:
^1da177e4c3f41 Linus Torvalds          2005-04-16  60   *   Zero on success, else a negative error code.
^1da177e4c3f41 Linus Torvalds          2005-04-16  61   *
^1da177e4c3f41 Linus Torvalds          2005-04-16  62   * Locking status:
42d7a524e9ee13 Matthew Wilcox (Oracle  2022-04-29  63)  *   @folio is locked and will be unlocked.
^1da177e4c3f41 Linus Torvalds          2005-04-16  64   */
^1da177e4c3f41 Linus Torvalds          2005-04-16  65  static int
42d7a524e9ee13 Matthew Wilcox (Oracle  2022-04-29  66) vxfs_immed_read_folio(struct file *fp, struct folio *folio)
^1da177e4c3f41 Linus Torvalds          2005-04-16 @67  {

:::::: The code at line 67 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
