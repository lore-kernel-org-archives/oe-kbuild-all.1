Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061587C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 03:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686109477; x=1717645477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/pzwBfyOVjXgqDBWGo3UjOJWwwoOk4tCMxP+IUclVng=;
  b=GQZRTEd+4rbhA746l7eUx48ZGQbl1QLxpkqmPSzrplkQUtGzOqp52CgY
   krd7GyHcXzgehsL7XRLK7UYLtNYLrDpg0o9t0cmu6zmDoeqfD86xxkMYT
   dK/mwDyHHY+lpSI1WAS3GfOu9oxlSxvCR0qXi8ytaQicdOypNBu1/f3Ig
   3+melr55epB8+h5301Q2g4UG6RYy1MNdGDDZLIinmMpPm3gEIaFJfRW3a
   BbV2Y5EVjWWoddPIHOxQGVb6ke9YhmHArfCl9omwMwq1mp2fHG7iP+vVe
   fXmV0ROWUwx41Eflkfk9aEFUURHpLynpSIN3Rgsj9rZrEYe1BsgFCz65N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337229926"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="337229926"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 20:44:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="739036888"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="739036888"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Jun 2023 20:44:34 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6k64-00063q-2Z;
	Wed, 07 Jun 2023 03:44:32 +0000
Date: Wed, 7 Jun 2023 11:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-open-release 28/31] fs/f2fs/super.c:3996:24: sparse:
 sparse: incorrect type in initializer (different base types)
Message-ID: <202306071156.QkFX98Y4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git blk-open-release
head:   0c548efe09ba601207bd6bb9fa48cf2dd706bfb3
commit: 9ec1707d2414fbbf50622f2e775f5b03b53ed327 [28/31] block: replace fmode_t with a block-specific type for block open flags
config: i386-randconfig-s001-20230606 (https://download.01.org/0day-ci/archive/20230607/202306071156.QkFX98Y4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block blk-open-release
        git checkout 9ec1707d2414fbbf50622f2e775f5b03b53ed327
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071156.QkFX98Y4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
   include/trace/events/f2fs.h:1035:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1035:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1035:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1035:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1035:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1035:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1094:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1094:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1094:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1094:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1094:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1094:1: sparse: sparse: restricted blk_opf_t degrades to integer
>> fs/f2fs/super.c:3996:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted fmode_t [usertype] mode @@     got restricted blk_mode_t @@
   fs/f2fs/super.c:3996:24: sparse:     expected restricted fmode_t [usertype] mode
   fs/f2fs/super.c:3996:24: sparse:     got restricted blk_mode_t
>> fs/f2fs/super.c:4028:76: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted blk_mode_t [usertype] mode @@     got restricted fmode_t [usertype] mode @@
   fs/f2fs/super.c:4028:76: sparse:     expected restricted blk_mode_t [usertype] mode
   fs/f2fs/super.c:4028:76: sparse:     got restricted fmode_t [usertype] mode
   fs/f2fs/super.c:4047:73: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted blk_mode_t [usertype] mode @@     got restricted fmode_t [usertype] mode @@
   fs/f2fs/super.c:4047:73: sparse:     expected restricted blk_mode_t [usertype] mode
   fs/f2fs/super.c:4047:73: sparse:     got restricted fmode_t [usertype] mode
   fs/f2fs/super.c:1433:35: sparse: sparse: context imbalance in 'f2fs_drop_inode' - unexpected unlock

vim +3996 fs/f2fs/super.c

a9cfee0ef98e99 Chao Yu           2022-09-28  3990  
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3991  static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3992  {
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3993  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
7bb3a371d19915 Masato Suzuki     2017-02-27  3994  	unsigned int max_devices = MAX_DEVICES;
71f2c820620258 Chao Yu           2021-09-01  3995  	unsigned int logical_blksize;
0fdb2bd07e136b Christoph Hellwig 2023-06-05 @3996  	fmode_t mode = sb_open_mode(sbi->sb->s_flags);
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3997  	int i;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3998  
7bb3a371d19915 Masato Suzuki     2017-02-27  3999  	/* Initialize single device information */
7bb3a371d19915 Masato Suzuki     2017-02-27  4000  	if (!RDEV(0).path[0]) {
7bb3a371d19915 Masato Suzuki     2017-02-27  4001  		if (!bdev_is_zoned(sbi->sb->s_bdev))
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4002  			return 0;
7bb3a371d19915 Masato Suzuki     2017-02-27  4003  		max_devices = 1;
7bb3a371d19915 Masato Suzuki     2017-02-27  4004  	}
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4005  
7bb3a371d19915 Masato Suzuki     2017-02-27  4006  	/*
7bb3a371d19915 Masato Suzuki     2017-02-27  4007  	 * Initialize multiple devices information, or single
7bb3a371d19915 Masato Suzuki     2017-02-27  4008  	 * zoned block device information.
7bb3a371d19915 Masato Suzuki     2017-02-27  4009  	 */
026f05079b00a5 Kees Cook         2018-06-12  4010  	sbi->devs = f2fs_kzalloc(sbi,
026f05079b00a5 Kees Cook         2018-06-12  4011  				 array_size(max_devices,
026f05079b00a5 Kees Cook         2018-06-12  4012  					    sizeof(struct f2fs_dev_info)),
026f05079b00a5 Kees Cook         2018-06-12  4013  				 GFP_KERNEL);
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4014  	if (!sbi->devs)
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4015  		return -ENOMEM;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4016  
71f2c820620258 Chao Yu           2021-09-01  4017  	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
71f2c820620258 Chao Yu           2021-09-01  4018  	sbi->aligned_blksize = true;
71f2c820620258 Chao Yu           2021-09-01  4019  
7bb3a371d19915 Masato Suzuki     2017-02-27  4020  	for (i = 0; i < max_devices; i++) {
7bb3a371d19915 Masato Suzuki     2017-02-27  4021  
7bb3a371d19915 Masato Suzuki     2017-02-27  4022  		if (i > 0 && !RDEV(i).path[0])
7bb3a371d19915 Masato Suzuki     2017-02-27  4023  			break;
7bb3a371d19915 Masato Suzuki     2017-02-27  4024  
7bb3a371d19915 Masato Suzuki     2017-02-27  4025  		if (max_devices == 1) {
7bb3a371d19915 Masato Suzuki     2017-02-27  4026  			/* Single zoned block device mount */
7bb3a371d19915 Masato Suzuki     2017-02-27  4027  			FDEV(0).bdev =
0fdb2bd07e136b Christoph Hellwig 2023-06-05 @4028  				blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev, mode,
0fdb2bd07e136b Christoph Hellwig 2023-06-05  4029  						  sbi->sb->s_type, NULL);
7bb3a371d19915 Masato Suzuki     2017-02-27  4030  		} else {
7bb3a371d19915 Masato Suzuki     2017-02-27  4031  			/* Multi-device mount */
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4032  			memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
7bb3a371d19915 Masato Suzuki     2017-02-27  4033  			FDEV(i).total_segments =
7bb3a371d19915 Masato Suzuki     2017-02-27  4034  				le32_to_cpu(RDEV(i).total_segments);
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4035  			if (i == 0) {
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4036  				FDEV(i).start_blk = 0;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4037  				FDEV(i).end_blk = FDEV(i).start_blk +
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4038  				    (FDEV(i).total_segments <<
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4039  				    sbi->log_blocks_per_seg) - 1 +
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4040  				    le32_to_cpu(raw_super->segment0_blkaddr);
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4041  			} else {
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4042  				FDEV(i).start_blk = FDEV(i - 1).end_blk + 1;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4043  				FDEV(i).end_blk = FDEV(i).start_blk +
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4044  					(FDEV(i).total_segments <<
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4045  					sbi->log_blocks_per_seg) - 1;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4046  			}
0fdb2bd07e136b Christoph Hellwig 2023-06-05  4047  			FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path, mode,
0fdb2bd07e136b Christoph Hellwig 2023-06-05  4048  							  sbi->sb->s_type,
0fdb2bd07e136b Christoph Hellwig 2023-06-05  4049  							  NULL);
7bb3a371d19915 Masato Suzuki     2017-02-27  4050  		}
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4051  		if (IS_ERR(FDEV(i).bdev))
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4052  			return PTR_ERR(FDEV(i).bdev);
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4053  
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4054  		/* to release errored devices */
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4055  		sbi->s_ndevs = i + 1;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  4056  
71f2c820620258 Chao Yu           2021-09-01  4057  		if (logical_blksize != bdev_logical_block_size(FDEV(i).bdev))
71f2c820620258 Chao Yu           2021-09-01  4058  			sbi->aligned_blksize = false;
71f2c820620258 Chao Yu           2021-09-01  4059  

:::::: The code at line 3996 was first introduced by commit
:::::: 0fdb2bd07e136b3fbfbb9eba2b7d859c31e83095 fs: remove sb->s_mode

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
