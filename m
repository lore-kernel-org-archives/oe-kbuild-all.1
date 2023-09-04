Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9423D8B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693849456; x=1725385456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZqga/p47kzb3w5pwh4xZXVd7LV9R0oEIc+/dKRaz9E=;
  b=XOa2ve8DiYajmPpBQbcidUTghd6BP/+TFczkavucDAxRP/oenUfmVD4j
   VdT8rWGajASfaaSdxVooBgPvR+vgka7VXDBW9GTbxhlBRmVrVLIDmCIXv
   VRmxPxEnZV6PVt7ZUOIQNAwDsRJN9zzQNDXxzFjT+hozzAwLtl+uTeKRj
   3mOwju37Ubs8ar/Zkg6P+4OpNxqHa1PbnF5XymX1wqyJYB2VtjbWfL+5k
   vQ9o5CJXfEYapENyTQQBFfWQc2URN3FY1Me5NGyneV+IBUkDDN50f2d49
   JATLX2RhpzOYAfkwBp23yS61ZBo3t+pbhYLDE8tvImKlosaHWp+vdawOB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="361674253"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="361674253"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 10:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="830967652"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="830967652"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2023 10:44:11 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdDcP-0000hn-1J;
	Mon, 04 Sep 2023 17:44:09 +0000
Date: Tue, 5 Sep 2023 01:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:fs-kill_sb 18/19] fs/9p/vfs_super.c:215: warning:
 expecting prototype for v9fs_kill_super(). Prototype was for v9fs_free_sb()
 instead
Message-ID: <202309050152.fRI64bNh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git fs-kill_sb
head:   31aeed05bb9e3121a8a1d7ffb5e7a449ec9aed4e
commit: b22c5e3061ae2725766f6537f7248bab8b8beb57 [18/19] fs: simple ->shutdown_sb and ->free_sb conversions
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230905/202309050152.fRI64bNh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050152.fRI64bNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050152.fRI64bNh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/9p/vfs_super.c:215: warning: expecting prototype for v9fs_kill_super(). Prototype was for v9fs_free_sb() instead


vim +215 fs/9p/vfs_super.c

9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  207  
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  208  /**
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  209   * v9fs_kill_super - Kill Superblock
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  210   * @s: superblock
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  211   *
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  212   */
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  213  
b22c5e3061ae27 Christoph Hellwig   2023-08-31  214  static void v9fs_free_sb(struct super_block *s)
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09 @215  {
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  216  	struct v9fs_session_info *v9ses = s->s_fs_info;
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  217  
5d3851530d6d68 Joe Perches         2011-11-28  218  	p9_debug(P9_DEBUG_VFS, " %p\n", s);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  219  
6d96d3ab7aea5f Aneesh Kumar K.V    2010-03-29  220  	v9fs_session_cancel(v9ses);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  221  	v9fs_session_close(v9ses);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  222  	kfree(v9ses);
1b5ab3e86712b6 Abhishek Kulkarni   2009-07-19  223  	s->s_fs_info = NULL;
b22c5e3061ae27 Christoph Hellwig   2023-08-31  224  	p9_debug(P9_DEBUG_VFS, "exiting free_sb\n");
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  225  }
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  226  

:::::: The code at line 215 was first introduced by commit
:::::: 9e82cf6a802a72f0f447eb4c76d6a3fc8736a31d [PATCH] v9fs: VFS superblock operations and glue

:::::: TO: Eric Van Hensbergen <ericvh@gmail.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
