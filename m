Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A3812
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 06:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692341085; x=1723877085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tFodE45JHoR2tPsdriU5rUvYTtnYu6JxnSk7dzX1uG8=;
  b=hySRPodDN0HrrtuM/fB0C9MLwvpWZU9moyGIGDu+TRqmht/uMJZl/Jxa
   8LUrO8J6qlhdn23yWah3ZQfutK3SnSzv89eNqW4Xq64aN/pmpdYxSM7+E
   Y4wgfbEBHo7x83lQbwxS/ruIMtq5bIbBuHGUIA22TjrXGos95/4gCpVy3
   kwTq2+t8tOcQW0YXF5XQtkCBT80qEsN0JsfI1ZLjCNqO7a2E34sOqYm5r
   r275w2A4CdnzxIFvDKDCyeIK+A3gMwVfJK8nHYWLz38hHlvENTueOqLnT
   LPxG5PbrGbLDXCBxeMoLW0867KR0X/E8l75tSvFatDA8v+ZNSvyI4ntME
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439407971"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="439407971"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 23:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="684762708"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="684762708"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Aug 2023 23:44:36 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWtDn-0002BD-0p;
	Fri, 18 Aug 2023 06:44:35 +0000
Date: Fri, 18 Aug 2023 14:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:sb_write_barrier 37/41] fs/namespace.c:562: warning:
 Function parameter or member 'file' not described in 'mnt_drop_write_file'
Message-ID: <202308181442.4xWBjXou-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux sb_write_barrier
head:   9bcb451a73fb8cb2bff4e5945bce0942909db148
commit: 3211477be5da244f6cc20c7e97ed2167f73f202e [37/41] fs: add srcu variants for mnt_{want,drop}_write() helpers
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230818/202308181442.4xWBjXou-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181442.4xWBjXou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181442.4xWBjXou-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namespace.c:562: warning: Function parameter or member 'file' not described in 'mnt_drop_write_file'
>> fs/namespace.c:562: warning: Excess function parameter 'mnt' description in 'mnt_drop_write_file'
>> fs/namespace.c:578: warning: Function parameter or member 'file' not described in 'mnt_drop_write_file_srcu'
>> fs/namespace.c:578: warning: Excess function parameter 'mnt' description in 'mnt_drop_write_file_srcu'
   fs/namespace.c:3132: warning: Function parameter or member 'mp' not described in 'can_move_mount_beneath'


vim +562 fs/namespace.c

eb04c28288bb00 Jan Kara       2012-06-12  552  
3211477be5da24 Amir Goldstein 2022-11-20  553  /**
3211477be5da24 Amir Goldstein 2022-11-20  554   * mnt_drop_write_file - give up write access to a file's mount
3211477be5da24 Amir Goldstein 2022-11-20  555   * @mnt: the mount on which to give up write access
3211477be5da24 Amir Goldstein 2022-11-20  556   *
3211477be5da24 Amir Goldstein 2022-11-20  557   * Tells the low-level filesystem that we are done performing writes to it and
3211477be5da24 Amir Goldstein 2022-11-20  558   * also allows filesystem to be frozen again.  Must be matched with
3211477be5da24 Amir Goldstein 2022-11-20  559   * mnt_want_write_file() call above.
3211477be5da24 Amir Goldstein 2022-11-20  560   */
7c6893e3c9abf6 Miklos Szeredi 2017-09-05  561  void mnt_drop_write_file(struct file *file)
7c6893e3c9abf6 Miklos Szeredi 2017-09-05 @562  {
a6795a585929d9 Miklos Szeredi 2018-07-18  563  	__mnt_drop_write_file(file);
7c6893e3c9abf6 Miklos Szeredi 2017-09-05  564  	sb_end_write(file_inode(file)->i_sb);
7c6893e3c9abf6 Miklos Szeredi 2017-09-05  565  }
2a79f17e4a641a Al Viro        2011-12-09  566  EXPORT_SYMBOL(mnt_drop_write_file);
2a79f17e4a641a Al Viro        2011-12-09  567  
3211477be5da24 Amir Goldstein 2022-11-20  568  /**
3211477be5da24 Amir Goldstein 2022-11-20  569   * mnt_drop_write_file_srcu - give up write access to a file's mount
3211477be5da24 Amir Goldstein 2022-11-20  570   * @mnt: the mount on which to give up write access
3211477be5da24 Amir Goldstein 2022-11-20  571   * @idx: return value from corresponding mnt_want_write_file_srcu()
3211477be5da24 Amir Goldstein 2022-11-20  572   *
3211477be5da24 Amir Goldstein 2022-11-20  573   * Tells the low-level filesystem that we are done performing writes to it and
3211477be5da24 Amir Goldstein 2022-11-20  574   * also allows filesystem to be frozen again.  Must be matched with
3211477be5da24 Amir Goldstein 2022-11-20  575   * mnt_want_write_file_srcu() call above.
3211477be5da24 Amir Goldstein 2022-11-20  576   */
3211477be5da24 Amir Goldstein 2022-11-20  577  void mnt_drop_write_file_srcu(struct file *file, int idx)
3211477be5da24 Amir Goldstein 2022-11-20 @578  {
3211477be5da24 Amir Goldstein 2022-11-20  579  	__mnt_drop_write_file(file);
3211477be5da24 Amir Goldstein 2022-11-20  580  	sb_end_write_srcu(file_inode(file)->i_sb, idx);
3211477be5da24 Amir Goldstein 2022-11-20  581  }
3211477be5da24 Amir Goldstein 2022-11-20  582  EXPORT_SYMBOL_GPL(mnt_drop_write_file_srcu);
3211477be5da24 Amir Goldstein 2022-11-20  583  

:::::: The code at line 562 was first introduced by commit
:::::: 7c6893e3c9abf6a9676e060a1e35e5caca673d57 ovl: don't allow writing ioctl on lower layer

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
