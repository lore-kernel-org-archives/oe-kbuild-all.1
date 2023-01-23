Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CD18821
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 22:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674512247; x=1706048247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LbdJ/Urj1sa4VkDS2sqx28s1L6U6T8dOp4m9ExThqLU=;
  b=TxYPE7NtG1R4UxVQOLppPii8glbK9gLNW7xOTwbvZM8Ls49vvToqjOgG
   l/V58ZHb77qjv0E6VaUjphIcSWuSXaRgoH2vTEzXKlGixAY+k84DdfPaM
   EYXWc8EvQlGVnC5pnQNockykl9i0JpzLU/HAe/LcGCj2401fdFKSVdSge
   aXpYrFgxV0MQHrYy7LnlPurooFeLSrNk3LlkuJOexUW3vXte8Ya2QQyUg
   oyx1cPBaVAb7DGbP8/BblpD3d/ULLsi/p65aFVyCG6mr7pilSGwsmg9Jn
   MlSfNDoSDo8J1CIMjHrjoJVACmE+jnxo8hgBRsOgIHNmQ4WL/jWeI91m9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323858147"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="323858147"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 14:17:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750597524"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="750597524"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2023 14:17:25 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK580-0005vM-1I;
	Mon, 23 Jan 2023 22:17:24 +0000
Date: Tue, 24 Jan 2023 06:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/deprecated/android-4.14-p-release
 65/6167] drivers/md/dm-linear.c:29:5: warning: no previous prototype for
 function 'dm_linear_ctr'
Message-ID: <202301240648.XgcySGzz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/deprecated/android-4.14-p-release
head:   0ca5d5ac9152d01b3494fb2efb5390319eb9904a
commit: 47c3ee9725a835ea9aed82513fd278f6ca2dff0a [65/6167] ANDROID: dm: android-verity: Mounting root as linear device when verity disabled
config: x86_64-randconfig-a013-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240648.XgcySGzz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/47c3ee9725a835ea9aed82513fd278f6ca2dff0a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/deprecated/android-4.14-p-release
        git checkout 47c3ee9725a835ea9aed82513fd278f6ca2dff0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
