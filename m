Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D554917C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 00:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681174729; x=1712710729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qSRc/xOC5XXq1qXItCW1unX4Q2oZ38MdOId9N74oPzU=;
  b=BZB5hKlSyZbxTmYIHWNmtGcXg8P2eO/aLq0NKWMqmhYgm9rXZDlFmaK8
   +zkHTH5j5ZB05T/4yFN7UXU/AOqoUe9Fyx5xhjfyhWOfrnxsJFxQQlk51
   YJ+pMN2mK6UyKirepUsKIncE5YKtdvwU2Gvd5rFvoW62Z/m2Ol6Gi/e39
   UQDLzeXDqx3dNZTcoix5+ZF/5x3WJN3wnllYQ9mIJdS/V1BMCKotCZFNo
   SZHA5fN6AyiFxS0GwTYCe14bkk8KR0RjSW5VDHDKtuEilgtz7fWCh7ncz
   fKOcdMv6KTmllAR/OfaCppgV/j1Hghih/QQxgZCmb5fIuTHFkoIbiWG74
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327589022"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="327589022"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 17:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752948896"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="752948896"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 17:58:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm2LN-000Vli-1B;
	Tue, 11 Apr 2023 00:58:45 +0000
Date: Tue, 11 Apr 2023 08:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 717/29447]
 drivers/md/dm-linear.c:29:5: warning: no previous prototype for function
 'dm_linear_ctr'
Message-ID: <202304110845.vjsDQahx-lkp@intel.com>
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
commit: 47c3ee9725a835ea9aed82513fd278f6ca2dff0a [717/29447] ANDROID: dm: android-verity: Mounting root as linear device when verity disabled
config: x86_64-randconfig-a001-20230410 (https://download.01.org/0day-ci/archive/20230411/202304110845.vjsDQahx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.14-stable
        git checkout 47c3ee9725a835ea9aed82513fd278f6ca2dff0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110845.vjsDQahx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-linear.c:29:5: warning: no previous prototype for function 'dm_linear_ctr' [-Wmissing-prototypes]
   int dm_linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
       ^
   drivers/md/dm-linear.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
   ^
   static 
>> drivers/md/dm-linear.c:72:6: warning: no previous prototype for function 'dm_linear_dtr' [-Wmissing-prototypes]
   void dm_linear_dtr(struct dm_target *ti)
        ^
   drivers/md/dm-linear.c:72:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dm_linear_dtr(struct dm_target *ti)
   ^
   static 
>> drivers/md/dm-linear.c:97:5: warning: no previous prototype for function 'dm_linear_map' [-Wmissing-prototypes]
   int dm_linear_map(struct dm_target *ti, struct bio *bio)
       ^
   drivers/md/dm-linear.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_map(struct dm_target *ti, struct bio *bio)
   ^
   static 
>> drivers/md/dm-linear.c:115:6: warning: no previous prototype for function 'dm_linear_status' [-Wmissing-prototypes]
   void dm_linear_status(struct dm_target *ti, status_type_t type,
        ^
   drivers/md/dm-linear.c:115:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dm_linear_status(struct dm_target *ti, status_type_t type,
   ^
   static 
>> drivers/md/dm-linear.c:149:5: warning: no previous prototype for function 'dm_linear_iterate_devices' [-Wmissing-prototypes]
   int dm_linear_iterate_devices(struct dm_target *ti,
       ^
   drivers/md/dm-linear.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_iterate_devices(struct dm_target *ti,
   ^
   static 
   5 warnings generated.


vim +/dm_linear_ctr +29 drivers/md/dm-linear.c

    25	
    26	/*
    27	 * Construct a linear mapping: <dev_path> <offset>
    28	 */
  > 29	int dm_linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
    30	{
    31		struct linear_c *lc;
    32		unsigned long long tmp;
    33		char dummy;
    34		int ret;
    35	
    36		if (argc != 2) {
    37			ti->error = "Invalid argument count";
    38			return -EINVAL;
    39		}
    40	
    41		lc = kmalloc(sizeof(*lc), GFP_KERNEL);
    42		if (lc == NULL) {
    43			ti->error = "Cannot allocate linear context";
    44			return -ENOMEM;
    45		}
    46	
    47		ret = -EINVAL;
    48		if (sscanf(argv[1], "%llu%c", &tmp, &dummy) != 1) {
    49			ti->error = "Invalid device sector";
    50			goto bad;
    51		}
    52		lc->start = tmp;
    53	
    54		ret = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table), &lc->dev);
    55		if (ret) {
    56			ti->error = "Device lookup failed";
    57			goto bad;
    58		}
    59	
    60		ti->num_flush_bios = 1;
    61		ti->num_discard_bios = 1;
    62		ti->num_write_same_bios = 1;
    63		ti->num_write_zeroes_bios = 1;
    64		ti->private = lc;
    65		return 0;
    66	
    67	      bad:
    68		kfree(lc);
    69		return ret;
    70	}
    71	
  > 72	void dm_linear_dtr(struct dm_target *ti)
    73	{
    74		struct linear_c *lc = (struct linear_c *) ti->private;
    75	
    76		dm_put_device(ti, lc->dev);
    77		kfree(lc);
    78	}
    79	
    80	static sector_t linear_map_sector(struct dm_target *ti, sector_t bi_sector)
    81	{
    82		struct linear_c *lc = ti->private;
    83	
    84		return lc->start + dm_target_offset(ti, bi_sector);
    85	}
    86	
    87	static void linear_map_bio(struct dm_target *ti, struct bio *bio)
    88	{
    89		struct linear_c *lc = ti->private;
    90	
    91		bio_set_dev(bio, lc->dev->bdev);
    92		if (bio_sectors(bio) || bio_op(bio) == REQ_OP_ZONE_RESET)
    93			bio->bi_iter.bi_sector =
    94				linear_map_sector(ti, bio->bi_iter.bi_sector);
    95	}
    96	
  > 97	int dm_linear_map(struct dm_target *ti, struct bio *bio)
    98	{
    99		linear_map_bio(ti, bio);
   100	
   101		return DM_MAPIO_REMAPPED;
   102	}
   103	
   104	static int linear_end_io(struct dm_target *ti, struct bio *bio,
   105				 blk_status_t *error)
   106	{
   107		struct linear_c *lc = ti->private;
   108	
   109		if (!*error && bio_op(bio) == REQ_OP_ZONE_REPORT)
   110			dm_remap_zone_report(ti, bio, lc->start);
   111	
   112		return DM_ENDIO_DONE;
   113	}
   114	
 > 115	void dm_linear_status(struct dm_target *ti, status_type_t type,
   116				  unsigned status_flags, char *result, unsigned maxlen)
   117	{
   118		struct linear_c *lc = (struct linear_c *) ti->private;
   119	
   120		switch (type) {
   121		case STATUSTYPE_INFO:
   122			result[0] = '\0';
   123			break;
   124	
   125		case STATUSTYPE_TABLE:
   126			snprintf(result, maxlen, "%s %llu", lc->dev->name,
   127					(unsigned long long)lc->start);
   128			break;
   129		}
   130	}
   131	
   132	static int dm_linear_prepare_ioctl(struct dm_target *ti,
   133			struct block_device **bdev, fmode_t *mode)
   134	{
   135		struct linear_c *lc = (struct linear_c *) ti->private;
   136		struct dm_dev *dev = lc->dev;
   137	
   138		*bdev = dev->bdev;
   139	
   140		/*
   141		 * Only pass ioctls through if the device sizes match exactly.
   142		 */
   143		if (lc->start ||
   144		    ti->len != i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT)
   145			return 1;
   146		return 0;
   147	}
   148	
 > 149	int dm_linear_iterate_devices(struct dm_target *ti,
   150					  iterate_devices_callout_fn fn, void *data)
   151	{
   152		struct linear_c *lc = ti->private;
   153	
   154		return fn(ti, lc->dev, lc->start, ti->len, data);
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
