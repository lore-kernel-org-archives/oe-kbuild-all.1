Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A373C068
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 19:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706555534; cv=none; b=MDFEX/f0245+WKgiRXVci+BNJAn0+PzeGSxsnXSGKlQCtHBefE2OISWqzE5KZdrs2CBSR3Kzan1/swdU5LC6XD9PdzRc5WTIh5tnMfQI7XTSjtKpd7Qe2GpgSZycqhn+uhub2NZSVRS+3EsvA0j1Y2nFhKT4aGmxkOXzx9x61Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706555534; c=relaxed/simple;
	bh=MpZXERHQKIkNuYsPKMt3g8ko1ttJn3XKskswDx3FLrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DUHzyIPzx2z1M8dAuJlRbRpmcqH30NCiL99Mu0tuCZE79Koc+d5GyaXUKWNOY/JIyhROoyntOxntdmMHmLMrq61DuHQ+Q3+x9LJnP+VpZAIuJ6knRLJR9PjoZNRBV5yIJTlN5cD7z6PmeN2285C9UmolCoXD0BRQKE8f4a9SR+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyJ0Tzng; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyJ0Tzng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706555532; x=1738091532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpZXERHQKIkNuYsPKMt3g8ko1ttJn3XKskswDx3FLrs=;
  b=AyJ0TzngQAWTUgeZgMxbOStAkalGQE+sH/9bJLEyhKQE4dP2kS5RJksu
   47FwyUQZzo9YkTJwMzlhAjhawfrbqB5piahf9OEQfhCmeWSEH2m4hflOd
   AjVhLe6qGAG2ZB/tcZlB3lbXTruNnB7kwThG8EyxeLcKqAwz4+TmUboIQ
   BofINzvSaCQtARg7+Pjdvcz3qkW4CTwY6Cexwti/ubdfrBVmF+obs1WYB
   9yeW0N223s9KiwbapdcENGMn272Pid+cL4LhDt2ER+1yVWVEGPsBTNeCq
   890CBP580tfoS8k5G9iGxLNjrq8Z/226CueqidcW0hLX5JI3gjir1be/d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9701634"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="9701634"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 11:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="29637548"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jan 2024 11:12:10 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUX39-0004Zm-0J;
	Mon, 29 Jan 2024 19:12:07 +0000
Date: Tue, 30 Jan 2024 03:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file-bd_inode 36/37]
 drivers/md/bcache/super.c:173:47: error: passing argument 1 of 'file_bdev'
 from incompatible pointer type
Message-ID: <202401300310.HmOAJnU7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file-bd_inode
head:   92279a7f8c418cb71e6fb335e4af2c7565944a11
commit: b2f6877436de6388b3d94bbff71ffe85c59d3505 [36/37] fs,drivers: remove bdev_inode() usage outside of block layer and drivers
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240130/202401300310.HmOAJnU7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300310.HmOAJnU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300310.HmOAJnU7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/md/bcache/super.c:166:59: warning: 'struct bdev_file' declared inside parameter list will not be visible outside of this definition or declaration
     166 | static const char *read_super(struct cache_sb *sb, struct bdev_file *bdev_file,
         |                                                           ^~~~~~~~~
   drivers/md/bcache/super.c: In function 'read_super':
>> drivers/md/bcache/super.c:173:47: error: passing argument 1 of 'file_bdev' from incompatible pointer type [-Werror=incompatible-pointer-types]
     173 |         struct block_device *bdev = file_bdev(bdev_file);
         |                                               ^~~~~~~~~
         |                                               |
         |                                               struct bdev_file *
   In file included from drivers/md/bcache/util.h:6,
                    from drivers/md/bcache/bset.h:9,
                    from drivers/md/bcache/bcache.h:194,
                    from drivers/md/bcache/super.c:10:
   include/linux/blkdev.h:1493:45: note: expected 'struct file *' but argument is of type 'struct bdev_file *'
    1493 | struct block_device *file_bdev(struct file *bdev_file);
         |                                ~~~~~~~~~~~~~^~~~~~~~~
>> drivers/md/bcache/super.c:175:45: error: invalid use of undefined type 'struct bdev_file'
     175 |         page = read_cache_page_gfp(bdev_file->f_mapping,
         |                                             ^~
   drivers/md/bcache/super.c: In function 'register_bcache':
>> drivers/md/bcache/super.c:2561:30: error: passing argument 2 of 'read_super' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2561 |         err = read_super(sb, bdev_file, &sb_disk);
         |                              ^~~~~~~~~
         |                              |
         |                              struct file *
   drivers/md/bcache/super.c:166:70: note: expected 'struct bdev_file *' but argument is of type 'struct file *'
     166 | static const char *read_super(struct cache_sb *sb, struct bdev_file *bdev_file,
         |                                                    ~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/file_bdev +173 drivers/md/bcache/super.c

   164	
   165	
 > 166	static const char *read_super(struct cache_sb *sb, struct bdev_file *bdev_file,
   167				      struct cache_sb_disk **res)
   168	{
   169		const char *err;
   170		struct cache_sb_disk *s;
   171		struct page *page;
   172		unsigned int i;
 > 173		struct block_device *bdev = file_bdev(bdev_file);
   174	
 > 175		page = read_cache_page_gfp(bdev_file->f_mapping,
   176					   SB_OFFSET >> PAGE_SHIFT, GFP_KERNEL);
   177		if (IS_ERR(page))
   178			return "IO error";
   179		s = page_address(page) + offset_in_page(SB_OFFSET);
   180	
   181		sb->offset		= le64_to_cpu(s->offset);
   182		sb->version		= le64_to_cpu(s->version);
   183	
   184		memcpy(sb->magic,	s->magic, 16);
   185		memcpy(sb->uuid,	s->uuid, 16);
   186		memcpy(sb->set_uuid,	s->set_uuid, 16);
   187		memcpy(sb->label,	s->label, SB_LABEL_SIZE);
   188	
   189		sb->flags		= le64_to_cpu(s->flags);
   190		sb->seq			= le64_to_cpu(s->seq);
   191		sb->last_mount		= le32_to_cpu(s->last_mount);
   192		sb->keys		= le16_to_cpu(s->keys);
   193	
   194		for (i = 0; i < SB_JOURNAL_BUCKETS; i++)
   195			sb->d[i] = le64_to_cpu(s->d[i]);
   196	
   197		pr_debug("read sb version %llu, flags %llu, seq %llu, journal size %u\n",
   198			 sb->version, sb->flags, sb->seq, sb->keys);
   199	
   200		err = "Not a bcache superblock (bad offset)";
   201		if (sb->offset != SB_SECTOR)
   202			goto err;
   203	
   204		err = "Not a bcache superblock (bad magic)";
   205		if (memcmp(sb->magic, bcache_magic, 16))
   206			goto err;
   207	
   208		err = "Bad checksum";
   209		if (s->csum != csum_set(s))
   210			goto err;
   211	
   212		err = "Bad UUID";
   213		if (bch_is_zero(sb->uuid, 16))
   214			goto err;
   215	
   216		sb->block_size	= le16_to_cpu(s->block_size);
   217	
   218		err = "Superblock block size smaller than device block size";
   219		if (sb->block_size << 9 < bdev_logical_block_size(bdev))
   220			goto err;
   221	
   222		switch (sb->version) {
   223		case BCACHE_SB_VERSION_BDEV:
   224			sb->data_offset	= BDEV_DATA_START_DEFAULT;
   225			break;
   226		case BCACHE_SB_VERSION_BDEV_WITH_OFFSET:
   227		case BCACHE_SB_VERSION_BDEV_WITH_FEATURES:
   228			sb->data_offset	= le64_to_cpu(s->data_offset);
   229	
   230			err = "Bad data offset";
   231			if (sb->data_offset < BDEV_DATA_START_DEFAULT)
   232				goto err;
   233	
   234			break;
   235		case BCACHE_SB_VERSION_CDEV:
   236		case BCACHE_SB_VERSION_CDEV_WITH_UUID:
   237			err = read_super_common(sb, bdev, s);
   238			if (err)
   239				goto err;
   240			break;
   241		case BCACHE_SB_VERSION_CDEV_WITH_FEATURES:
   242			/*
   243			 * Feature bits are needed in read_super_common(),
   244			 * convert them firstly.
   245			 */
   246			sb->feature_compat = le64_to_cpu(s->feature_compat);
   247			sb->feature_incompat = le64_to_cpu(s->feature_incompat);
   248			sb->feature_ro_compat = le64_to_cpu(s->feature_ro_compat);
   249	
   250			/* Check incompatible features */
   251			err = "Unsupported compatible feature found";
   252			if (bch_has_unknown_compat_features(sb))
   253				goto err;
   254	
   255			err = "Unsupported read-only compatible feature found";
   256			if (bch_has_unknown_ro_compat_features(sb))
   257				goto err;
   258	
   259			err = "Unsupported incompatible feature found";
   260			if (bch_has_unknown_incompat_features(sb))
   261				goto err;
   262	
   263			err = read_super_common(sb, bdev, s);
   264			if (err)
   265				goto err;
   266			break;
   267		default:
   268			err = "Unsupported superblock version";
   269			goto err;
   270		}
   271	
   272		sb->last_mount = (u32)ktime_get_real_seconds();
   273		*res = s;
   274		return NULL;
   275	err:
   276		put_page(page);
   277		return err;
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
