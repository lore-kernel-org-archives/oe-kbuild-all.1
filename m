Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81908468
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 20:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691784778; x=1723320778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bGU1+Xi+vKLz54DpeRplnkP9eh9FZdal2v6/DEs/tTQ=;
  b=WOIya7uf6aN5GQB3yqvzN+DHB0WS97PKf5JYHPk/r4FcqsQlslB/JIX4
   T5jkGU3Wk+4sz/Xpxy2YeWrJlmiTQZF19MVKQtDd6IxLcYcGsxg/f3SJR
   3ssInD4knipaSoq+wFu/Eqe3PKEZD5I/Be6ieSt2EwhEgqIOjpyFe7wIo
   +SkMEHiOp0wfL8p3+9Y2e9SV+TygXTfSpKxCiOkTkZl1X/J+DBwwRK6r3
   HHu4IHeEzDG7t0kQ6BTEAbcP+QERcCUitBocyjld2Ow8PLtRT9QvpAsoT
   d6snB/BjrzADoLU39TWkhbjyeBaEcGW6bQUnz/zz6sXzt3vc0iXqf/X18
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="370653564"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="370653564"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 13:12:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="979324679"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="979324679"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2023 13:12:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUYV8-00080K-2O;
	Fri, 11 Aug 2023 20:12:50 +0000
Date: Sat, 12 Aug 2023 04:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jack-fs:bdev_handle 29/29] fs/cramfs/inode.c:498:17: error:
 implicit declaration of function 'blkdev_put'
Message-ID: <202308120445.mARUDRQa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle
head:   1b96ba5f6b5fcb2bd0a267c592add81699cbf6c8
commit: 1b96ba5f6b5fcb2bd0a267c592add81699cbf6c8 [29/29] block: Remove blkdev_get_by_*() functions
config: xtensa-randconfig-r036-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120445.mARUDRQa-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120445.mARUDRQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120445.mARUDRQa-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/cramfs/inode.c: In function 'cramfs_kill_sb':
>> fs/cramfs/inode.c:498:17: error: implicit declaration of function 'blkdev_put' [-Werror=implicit-function-declaration]
     498 |                 blkdev_put(sb->s_bdev, sb);
         |                 ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/blkdev_put +498 fs/cramfs/inode.c

eddcd97659e31f Nicolas Pitre     2017-10-12  484  
2309fb8ef40e82 Al Viro           2013-12-10  485  static void cramfs_kill_sb(struct super_block *sb)
^1da177e4c3f41 Linus Torvalds    2005-04-16  486  {
f7f4f4dd6948e3 Al Viro           2013-12-10  487  	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
31d92e55198d4e Fabian Frederick  2014-08-08  488  
a23edcb080c703 Jan Kara          2023-07-24  489  	generic_shutdown_super(sb);
a23edcb080c703 Jan Kara          2023-07-24  490  
08a8f308688032 Joe Perches       2018-05-13  491  	if (IS_ENABLED(CONFIG_CRAMFS_MTD) && sb->s_mtd) {
99c18ce580c6cc Nicolas Pitre     2017-10-13  492  		if (sbi && sbi->mtd_point_size)
99c18ce580c6cc Nicolas Pitre     2017-10-13  493  			mtd_unpoint(sb->s_mtd, 0, sbi->mtd_point_size);
a23edcb080c703 Jan Kara          2023-07-24  494  		put_mtd_device(sb->s_mtd);
a23edcb080c703 Jan Kara          2023-07-24  495  		sb->s_mtd = NULL;
99c18ce580c6cc Nicolas Pitre     2017-10-13  496  	} else if (IS_ENABLED(CONFIG_CRAMFS_BLOCKDEV) && sb->s_bdev) {
a23edcb080c703 Jan Kara          2023-07-24  497  		sync_blockdev(sb->s_bdev);
87b02a2ec40b29 Christoph Hellwig 2023-08-02 @498  		blkdev_put(sb->s_bdev, sb);
99c18ce580c6cc Nicolas Pitre     2017-10-13  499  	}
2309fb8ef40e82 Al Viro           2013-12-10  500  	kfree(sbi);
^1da177e4c3f41 Linus Torvalds    2005-04-16  501  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  502  

:::::: The code at line 498 was first introduced by commit
:::::: 87b02a2ec40b2944ae4a2fdb078a53e39fca67a5 fs: use the super_block as holder when mounting file systems

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
