Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DB511700
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 21:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691787899; x=1723323899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RgpUAFlyBl/WDGWYD709LV8R5pvrftKwKaVVUYDJ/og=;
  b=ECzRIU3fDa/sO1UpuayMbYlDRmnNJPjTvVNakwiFYu3WRL3PWvGJAhWT
   Ud9iFKO8ghyrIskvFvF1s1F3goHPOz8GUwnF/RoLs0643k06yxQIYqv/o
   Deyk5AWt6uOG8a5s/fazAqc8VbfouVcyq4CBF/OevS6j6We7jsByAxKr2
   osjuVEXxmmSzuNHZmoEhKimPd5MnpGtQvjuORD3maKKY/KBaULmPZp0lI
   MPhb5HWa13c5Id1+kstFtTw2TOEFhIvugt5WscEIFk0PzUuQPVeTE7Sfp
   tc1yXKAveqszbTAGs9phsF2fPpRn8qvVU+nmqKxAX1pN7pR0HX51vtKkO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369232111"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="369232111"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 14:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682653290"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="682653290"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 14:04:53 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUZJT-00082e-31;
	Fri, 11 Aug 2023 21:04:51 +0000
Date: Sat, 12 Aug 2023 05:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jack-fs:bdev_handle 29/29] fs/romfs/super.c:596:17: error: implicit
 declaration of function 'blkdev_put'
Message-ID: <202308120444.X7EZLROh-lkp@intel.com>
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
config: parisc-randconfig-r035-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120444.X7EZLROh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120444.X7EZLROh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120444.X7EZLROh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/romfs/super.c: In function 'romfs_kill_sb':
>> fs/romfs/super.c:596:17: error: implicit declaration of function 'blkdev_put' [-Werror=implicit-function-declaration]
     596 |                 blkdev_put(sb->s_bdev, sb);
         |                 ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/blkdev_put +596 fs/romfs/super.c

b941759985841f David Howells     2019-03-25  579  
da4458bda237aa David Howells     2009-02-12  580  /*
da4458bda237aa David Howells     2009-02-12  581   * destroy a romfs superblock in the appropriate manner
da4458bda237aa David Howells     2009-02-12  582   */
da4458bda237aa David Howells     2009-02-12  583  static void romfs_kill_sb(struct super_block *sb)
da4458bda237aa David Howells     2009-02-12  584  {
a23edcb080c703 Jan Kara          2023-07-24  585  	generic_shutdown_super(sb);
a23edcb080c703 Jan Kara          2023-07-24  586  
da4458bda237aa David Howells     2009-02-12  587  #ifdef CONFIG_ROMFS_ON_MTD
da4458bda237aa David Howells     2009-02-12  588  	if (sb->s_mtd) {
a23edcb080c703 Jan Kara          2023-07-24  589  		put_mtd_device(sb->s_mtd);
a23edcb080c703 Jan Kara          2023-07-24  590  		sb->s_mtd = NULL;
da4458bda237aa David Howells     2009-02-12  591  	}
da4458bda237aa David Howells     2009-02-12  592  #endif
da4458bda237aa David Howells     2009-02-12  593  #ifdef CONFIG_ROMFS_ON_BLOCK
da4458bda237aa David Howells     2009-02-12  594  	if (sb->s_bdev) {
a23edcb080c703 Jan Kara          2023-07-24  595  		sync_blockdev(sb->s_bdev);
87b02a2ec40b29 Christoph Hellwig 2023-08-02 @596  		blkdev_put(sb->s_bdev, sb);
da4458bda237aa David Howells     2009-02-12  597  	}
da4458bda237aa David Howells     2009-02-12  598  #endif
da4458bda237aa David Howells     2009-02-12  599  }
da4458bda237aa David Howells     2009-02-12  600  

:::::: The code at line 596 was first introduced by commit
:::::: 87b02a2ec40b2944ae4a2fdb078a53e39fca67a5 fs: use the super_block as holder when mounting file systems

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
