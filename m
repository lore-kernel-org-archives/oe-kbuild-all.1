Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4FA1BEE4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 21:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692309399; x=1723845399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hos2glX6QiGXdBHTAVP9jFW63sTEzoIamEiXJswO8CI=;
  b=TN3wT8KJ9nJJLn6hSw7n5YNRmo8yw/mn2pqQ60YnrKvO+y3PUGMJI230
   To/py0fb1GPW77jE0XEGkcmFkU15QeRBXieJsgw7Nbv7YsYzAyNsn9Xds
   4zuB42l0w/gdW31/naF/eXmwMjycVezXCO0lvDMXNURy9CpyyvuF/zL50
   e0mrcOPD4UavNvt1zqD9fTi0SaV3K6F4tT/lADnyrkg2oV9GGHD5jlr3Y
   TdOUSSMqWoXZrnstQSWCSAMQDnfTZdXqugkA8rr3StNnFwuaJy9Z/o2iW
   mgJgKhdPQjuRztsNpudGEBKXNybk0B5GUr0pjPA7MLJwk8NtI/KhiNr85
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403920673"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="403920673"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 14:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="800209314"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="800209314"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 14:56:36 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWkyp-0001Ul-2r;
	Thu, 17 Aug 2023 21:56:35 +0000
Date: Fri, 18 Aug 2023 05:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [brauner-vfs:vfs.super_wait 35/49] block/disk-events.c:302: warning:
 Excess function parameter 'events' description in 'disk_force_media_change'
Message-ID: <202308180521.aoCedovs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.super_wait
head:   32fa790ce40b4c73b40079070061718e5540bfe9
commit: de76e11e14ec9c1a731f51632e822b859eb736b5 [35/49] block: simplify the disk_force_media_change interface
config: microblaze-randconfig-r032-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180521.aoCedovs-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180521.aoCedovs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180521.aoCedovs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/disk-events.c:302: warning: Excess function parameter 'events' description in 'disk_force_media_change'


vim +302 block/disk-events.c

d5870edfa3afc4 Christoph Hellwig  2021-06-24  291  
e6138dc12de9df Matteo Croce       2021-07-13  292  /**
e6138dc12de9df Matteo Croce       2021-07-13  293   * disk_force_media_change - force a media change event
e6138dc12de9df Matteo Croce       2021-07-13  294   * @disk: the disk which will raise the event
e6138dc12de9df Matteo Croce       2021-07-13  295   * @events: the events to raise
e6138dc12de9df Matteo Croce       2021-07-13  296   *
de76e11e14ec9c Christoph Hellwig  2023-08-11  297   * Should be called when the media changes for @disk.  Generates a uevent
de76e11e14ec9c Christoph Hellwig  2023-08-11  298   * and attempts to free all dentries and inodes and invalidates all block
e6138dc12de9df Matteo Croce       2021-07-13  299   * device page cache entries in that case.
e6138dc12de9df Matteo Croce       2021-07-13  300   */
de76e11e14ec9c Christoph Hellwig  2023-08-11  301  void disk_force_media_change(struct gendisk *disk)
e6138dc12de9df Matteo Croce       2021-07-13 @302  {
de76e11e14ec9c Christoph Hellwig  2023-08-11  303  	disk_event_uevent(disk, DISK_EVENT_MEDIA_CHANGE);
b90ecc0379eb7b Demi Marie Obenour 2023-06-07  304  	inc_diskseq(disk);
e6138dc12de9df Matteo Croce       2021-07-13  305  	if (__invalidate_device(disk->part0, true))
e6138dc12de9df Matteo Croce       2021-07-13  306  		pr_warn("VFS: busy inodes on changed media %s\n",
e6138dc12de9df Matteo Croce       2021-07-13  307  			disk->disk_name);
e6138dc12de9df Matteo Croce       2021-07-13  308  	set_bit(GD_NEED_PART_SCAN, &disk->state);
e6138dc12de9df Matteo Croce       2021-07-13  309  }
e6138dc12de9df Matteo Croce       2021-07-13  310  EXPORT_SYMBOL_GPL(disk_force_media_change);
e6138dc12de9df Matteo Croce       2021-07-13  311  

:::::: The code at line 302 was first introduced by commit
:::::: e6138dc12de9df17cbda9c40314d69592855ac5e block: add a helper to raise a media changed event

:::::: TO: Matteo Croce <mcroce@microsoft.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
