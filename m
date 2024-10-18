Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8B92A1CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 01:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729213259; cv=none; b=owpwNUkZLTfR7E/RyQmeiloUun2hGJO6WcP7H/R95Rv71wkzyO1/sePrEL1NLCVxlHryOKwlbhKgg8v4MSblhmMVVexKbebebNOW8JQEe1UrlQ7GxeaMuotWdwvQRE/9S53ST4U77S/+MvBdKnEu4IqZCsVuk1DfF3YAq6qdi9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729213259; c=relaxed/simple;
	bh=QM/AtrtHeLUaPufBFb9+YSx6H0iP6UoDeVGRkCYC5nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlR8iUPZWFk1i2MawVYGm4kcBZsCKNVd4R6L6F4ZVnhAn9D4mWgBVcsMEXbQFd/DXkqsX5iuYcXgldprF65CiOY5hR4jvNtsWN4YZryf8wM7ByCHP7whHKsI7baUYywt+L+rOMSZCAFK2acsV53yXUCIJQpdpKt/mfjR5TsezQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGT2OwUP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGT2OwUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729213258; x=1760749258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QM/AtrtHeLUaPufBFb9+YSx6H0iP6UoDeVGRkCYC5nU=;
  b=hGT2OwUPeZGLlvTWMY1NIe/l6GMP/XxP95myrSZx001DljohJoo6GJAH
   iJTnGWkdmYVNewuc3O5SXC6oMBfVulMKTSniVCf7iTKk9ZAuxcRdDeVPy
   bQku1C49YNJg23GpK9FrI9+Atn83LYvqvAx1KGlCF9PnARyGgRZZzDrxJ
   Eaz8RycOaMTg/4C3/LV/YuUn8LmfFCkmEKbfzMzKFPNoGsmLqNpvgBhX+
   0f+zvfZnnBDBV565S7loF+utxChP8z7VFSveMbeWpnpzn5ltn3bsDpwYo
   oAT6nT3dpuE3VoEjiIMTXr7ppW5TvoajQjXQLwQhkZdUv7oum66o+Bv+d
   g==;
X-CSE-ConnectionGUID: hMXqWqe2QD6wCYb0Z/Llgg==
X-CSE-MsgGUID: 5ayDNKaoRla31+uscMLL9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46190143"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46190143"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 18:00:57 -0700
X-CSE-ConnectionGUID: 2wvxc15XSPWQFZ/V5R4I+Q==
X-CSE-MsgGUID: ylcdgJ4JQ2O2t2sMjUApLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="102021541"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Oct 2024 18:00:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1bMM-000N5v-0J;
	Fri, 18 Oct 2024 01:00:54 +0000
Date: Fri, 18 Oct 2024 09:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] md: lockless bitmap demo
Message-ID: <202410180825.HoDga1OW-lkp@intel.com>
References: <20241015083557.4033741-1-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015083557.4033741-1-yukuai1@huaweicloud.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on device-mapper-dm/for-next linus/master v6.12-rc3 next-20241017]
[cannot apply to song-md/md-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/md-lockless-bitmap-demo/20241015-164053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20241015083557.4033741-1-yukuai1%40huaweicloud.com
patch subject: [PATCH RFC] md: lockless bitmap demo
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241018/202410180825.HoDga1OW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180825.HoDga1OW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180825.HoDga1OW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/md_meta.c: In function 'md_alloc_meta_file':
>> drivers/md/md_meta.c:89:37: warning: '_meta' directive writing 5 bytes into a region of size between 1 and 32 [-Wformat-overflow=]
      89 |         sprintf(disk->disk_name, "%s_meta", mdname(mddev));
         |                                     ^~~~~
   drivers/md/md_meta.c:89:9: note: 'sprintf' output between 6 and 37 bytes into a destination of size 32
      89 |         sprintf(disk->disk_name, "%s_meta", mdname(mddev));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_meta +89 drivers/md/md_meta.c

    78	
    79	int md_alloc_meta_file(struct mddev *mddev)
    80	{
    81		int ret;
    82		struct file *bdev_file;
    83		struct gendisk *disk = blk_alloc_disk(&mddev->gendisk->queue->limits,
    84						      NUMA_NO_NODE);
    85	
    86		if (!disk)
    87			return -ENOMEM;
    88	
  > 89		sprintf(disk->disk_name, "%s_meta", mdname(mddev));
    90		disk->flags |= GENHD_FL_HIDDEN;
    91		disk->fops = &md_meta_fops;
    92	
    93		ret = add_disk(disk);
    94		if (ret) {
    95			put_disk(disk);
    96			return ret;
    97		}
    98	
    99		/*
   100		 * Currently is only used for bitmap IO, so disk size is bitmap size, at
   101		 * most 64KB + super block.
   102		 */
   103		set_capacity(disk, 64 * 2 + (PAGE_SIZE >> SECTOR_SHIFT));
   104		bdev_file = bdev_file_alloc(disk->part0, BLK_OPEN_READ | BLK_OPEN_WRITE);
   105		if (IS_ERR(bdev_file)) {
   106			del_gendisk(disk);
   107			put_disk(disk);
   108			return PTR_ERR(bdev_file);
   109		}
   110	
   111		disk->private_data = mddev;
   112		mddev->meta_file = bdev_file;
   113	
   114		/* corresponding to the blkdev_put_no_open() from blkdev_release() */
   115		get_device(disk_to_dev(disk));
   116	
   117		bdev_file->f_flags |= O_LARGEFILE;
   118		bdev_file->f_mode |= FMODE_CAN_ODIRECT;
   119		bdev_file->f_mapping = disk->part0->bd_mapping;
   120		bdev_file->f_wb_err = filemap_sample_wb_err(bdev_file->f_mapping);
   121	
   122		/* not actually opened */
   123		bdev_file->private_data = ERR_PTR(-ENODEV);
   124	
   125		return 0;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
