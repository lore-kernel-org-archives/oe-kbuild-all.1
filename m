Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A220F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 05:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681190098; x=1712726098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ol+DNGbaYrWW1G2lg2gwMncLWD6HzVVOiY2wKk3RVL0=;
  b=JniTL64GMbJUUK5ZwLIz3+OwMIOcYrCt5vr/SKYbQF5zkw4MPjmdjb5H
   IN3kxn+89aWzq5qHm80hFHIjs1m2VXUfOXZ6KJn+EXBwo9rDNH/C//Sel
   ByG9npZYTCLog+MLgh0rygNqdiWlQXRmd8ko4hOdkgtBznxUmNctUpEYA
   KmV0Rvsh2v6gdzH/Gp8VsZC8Dljf5qRGhXLkyGUSnYgTDUxT7gJEJZBSI
   1mnX1LgbeFVBJm0dgADqsQ6T8rwDHaCvj6tGUxZUqMw73xuzuNctb12Se
   jptxVdS484RS94FMTEJTYQmXD8X31dWTn7zJv/25YM3H7D++y2tbneHcc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="406354680"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="406354680"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 22:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="753009211"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="753009211"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 22:14:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm6LF-000VyH-2o;
	Tue, 11 Apr 2023 05:14:53 +0000
Date: Tue, 11 Apr 2023 13:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 727/29447]
 drivers/md/dm-linear.c:104:5: warning: no previous prototype for function
 'dm_linear_end_io'
Message-ID: <202304111352.pADPlBOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Badhri,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   285fc83a087180f0bc30b75285d4bc2cdcceae06
commit: 539de6b39dcce96f93d6bb19439d00f870f8fa3a [727/29447] ANDROID: dm: android-verity: rebase for 4.9
config: x86_64-randconfig-a001-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111352.pADPlBOu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.14-stable
        git checkout 539de6b39dcce96f93d6bb19439d00f870f8fa3a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111352.pADPlBOu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-linear.c:29:5: warning: no previous prototype for function 'dm_linear_ctr' [-Wmissing-prototypes]
   int dm_linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
       ^
   drivers/md/dm-linear.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
   ^
   static 
   drivers/md/dm-linear.c:72:6: warning: no previous prototype for function 'dm_linear_dtr' [-Wmissing-prototypes]
   void dm_linear_dtr(struct dm_target *ti)
        ^
   drivers/md/dm-linear.c:72:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dm_linear_dtr(struct dm_target *ti)
   ^
   static 
   drivers/md/dm-linear.c:97:5: warning: no previous prototype for function 'dm_linear_map' [-Wmissing-prototypes]
   int dm_linear_map(struct dm_target *ti, struct bio *bio)
       ^
   drivers/md/dm-linear.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_map(struct dm_target *ti, struct bio *bio)
   ^
   static 
>> drivers/md/dm-linear.c:104:5: warning: no previous prototype for function 'dm_linear_end_io' [-Wmissing-prototypes]
   int dm_linear_end_io(struct dm_target *ti, struct bio *bio,
       ^
   drivers/md/dm-linear.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_end_io(struct dm_target *ti, struct bio *bio,
   ^
   static 
   drivers/md/dm-linear.c:116:6: warning: no previous prototype for function 'dm_linear_status' [-Wmissing-prototypes]
   void dm_linear_status(struct dm_target *ti, status_type_t type,
        ^
   drivers/md/dm-linear.c:116:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dm_linear_status(struct dm_target *ti, status_type_t type,
   ^
   static 
   drivers/md/dm-linear.c:133:5: warning: no previous prototype for function 'dm_linear_prepare_ioctl' [-Wmissing-prototypes]
   int dm_linear_prepare_ioctl(struct dm_target *ti,
       ^
   drivers/md/dm-linear.c:133:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_prepare_ioctl(struct dm_target *ti,
   ^
   static 
   drivers/md/dm-linear.c:150:5: warning: no previous prototype for function 'dm_linear_iterate_devices' [-Wmissing-prototypes]
   int dm_linear_iterate_devices(struct dm_target *ti,
       ^
   drivers/md/dm-linear.c:150:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_iterate_devices(struct dm_target *ti,
   ^
   static 
>> drivers/md/dm-linear.c:158:6: warning: no previous prototype for function 'dm_linear_dax_direct_access' [-Wmissing-prototypes]
   long dm_linear_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
        ^
   drivers/md/dm-linear.c:158:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   long dm_linear_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
   ^
   static 
>> drivers/md/dm-linear.c:175:8: warning: no previous prototype for function 'dm_linear_dax_copy_from_iter' [-Wmissing-prototypes]
   size_t dm_linear_dax_copy_from_iter(struct dm_target *ti, pgoff_t pgoff,
          ^
   drivers/md/dm-linear.c:175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t dm_linear_dax_copy_from_iter(struct dm_target *ti, pgoff_t pgoff,
   ^
   static 
   9 warnings generated.


vim +/dm_linear_end_io +104 drivers/md/dm-linear.c

   103	
 > 104	int dm_linear_end_io(struct dm_target *ti, struct bio *bio,
   105				 blk_status_t *error)
   106	{
   107		struct linear_c *lc = ti->private;
   108	
   109		if (!*error && bio_op(bio) == REQ_OP_ZONE_REPORT)
   110			dm_remap_zone_report(ti, bio, lc->start);
   111	
   112		return DM_ENDIO_DONE;
   113	}
   114	EXPORT_SYMBOL_GPL(dm_linear_end_io);
   115	
   116	void dm_linear_status(struct dm_target *ti, status_type_t type,
   117				  unsigned status_flags, char *result, unsigned maxlen)
   118	{
   119		struct linear_c *lc = (struct linear_c *) ti->private;
   120	
   121		switch (type) {
   122		case STATUSTYPE_INFO:
   123			result[0] = '\0';
   124			break;
   125	
   126		case STATUSTYPE_TABLE:
   127			snprintf(result, maxlen, "%s %llu", lc->dev->name,
   128					(unsigned long long)lc->start);
   129			break;
   130		}
   131	}
   132	
   133	int dm_linear_prepare_ioctl(struct dm_target *ti,
   134			struct block_device **bdev, fmode_t *mode)
   135	{
   136		struct linear_c *lc = (struct linear_c *) ti->private;
   137		struct dm_dev *dev = lc->dev;
   138	
   139		*bdev = dev->bdev;
   140	
   141		/*
   142		 * Only pass ioctls through if the device sizes match exactly.
   143		 */
   144		if (lc->start ||
   145		    ti->len != i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT)
   146			return 1;
   147		return 0;
   148	}
   149	
   150	int dm_linear_iterate_devices(struct dm_target *ti,
   151					  iterate_devices_callout_fn fn, void *data)
   152	{
   153		struct linear_c *lc = ti->private;
   154	
   155		return fn(ti, lc->dev, lc->start, ti->len, data);
   156	}
   157	
 > 158	long dm_linear_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
   159			long nr_pages, void **kaddr, pfn_t *pfn)
   160	{
   161		long ret;
   162		struct linear_c *lc = ti->private;
   163		struct block_device *bdev = lc->dev->bdev;
   164		struct dax_device *dax_dev = lc->dev->dax_dev;
   165		sector_t dev_sector, sector = pgoff * PAGE_SECTORS;
   166	
   167		dev_sector = linear_map_sector(ti, sector);
   168		ret = bdev_dax_pgoff(bdev, dev_sector, nr_pages * PAGE_SIZE, &pgoff);
   169		if (ret)
   170			return ret;
   171		return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
   172	}
   173	EXPORT_SYMBOL_GPL(dm_linear_dax_direct_access);
   174	
 > 175	size_t dm_linear_dax_copy_from_iter(struct dm_target *ti, pgoff_t pgoff,
   176			void *addr, size_t bytes, struct iov_iter *i)
   177	{
   178		struct linear_c *lc = ti->private;
   179		struct block_device *bdev = lc->dev->bdev;
   180		struct dax_device *dax_dev = lc->dev->dax_dev;
   181		sector_t dev_sector, sector = pgoff * PAGE_SECTORS;
   182	
   183		dev_sector = linear_map_sector(ti, sector);
   184		if (bdev_dax_pgoff(bdev, dev_sector, ALIGN(bytes, PAGE_SIZE), &pgoff))
   185			return 0;
   186		return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i);
   187	}
   188	EXPORT_SYMBOL_GPL(dm_linear_dax_copy_from_iter);
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
