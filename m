Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A0F15B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 01:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679536626; x=1711072626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hBwoYvb7t1pTzgwd5L5jTzap5pt3wrW0qS8fEMi6fDw=;
  b=F0R0zmfN+HpsYlXGJG51IvdXqx0XgAFL+cqJ8x4bulOXoUngWu3wNukv
   A4G5u4ywHTzaTwiLVtdJxKpg7MOXDzQ432AhY51IwReJT1YKrvJZ2nlP2
   trbCnpbNNJm9vTOGCfsWsSa4Rr7gTF1K8Zp45kUrepj/qCHywppyfNRNV
   Fu1p6mSJCOSBAqEhB2LYLvOZz2ZzEdUxEpblLhRX+NDGwQ4mGQSWkywE8
   Hhd0zTvsGwQueepNJQZEjit4nP393HDKPofoH03MCnh87yRoxdDiKZWIV
   Q7/EgB9LCdFxEfrrGBYKX/CLCWDa3BpsjZNGCmB6+wj3HuvgfujgUvFTO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340912680"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="340912680"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 18:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="771268781"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="771268781"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2023 18:57:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfACN-000Dpo-2s;
	Thu, 23 Mar 2023 01:57:03 +0000
Date: Thu, 23 Mar 2023 09:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230322-deprecate-bdev_disk_changed 1/1]
 block/partitions/core.c:701:1: warning: data definition has no type or
 storage class
Message-ID: <202303230917.GT8niXu6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230322-deprecate-bdev_disk_changed
head:   64988d63873be8d60ab3ebb87c869cba3960116e
commit: 64988d63873be8d60ab3ebb87c869cba3960116e [1/1] block: annotate bdev_disk_changed() deprecation with a symbol namespace
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230323/202303230917.GT8niXu6-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=64988d63873be8d60ab3ebb87c869cba3960116e
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230322-deprecate-bdev_disk_changed
        git checkout 64988d63873be8d60ab3ebb87c869cba3960116e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230917.GT8niXu6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/partitions/core.c:701:1: warning: data definition has no type or storage class
     701 | EXPORT_SYMBOL_GPL_NS(bdev_disk_changed, BLOCK_DEPRECATED);
         | ^~~~~~~~~~~~~~~~~~~~
   block/partitions/core.c:701:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL_NS' [-Werror=implicit-int]
>> block/partitions/core.c:701:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors


vim +701 block/partitions/core.c

   654	
   655	int bdev_disk_changed(struct gendisk *disk, bool invalidate)
   656	{
   657		int ret = 0;
   658	
   659		lockdep_assert_held(&disk->open_mutex);
   660	
   661		if (!disk_live(disk))
   662			return -ENXIO;
   663	
   664	rescan:
   665		if (disk->open_partitions)
   666			return -EBUSY;
   667		sync_blockdev(disk->part0);
   668		invalidate_bdev(disk->part0);
   669		blk_drop_partitions(disk);
   670	
   671		clear_bit(GD_NEED_PART_SCAN, &disk->state);
   672	
   673		/*
   674		 * Historically we only set the capacity to zero for devices that
   675		 * support partitions (independ of actually having partitions created).
   676		 * Doing that is rather inconsistent, but changing it broke legacy
   677		 * udisks polling for legacy ide-cdrom devices.  Use the crude check
   678		 * below to get the sane behavior for most device while not breaking
   679		 * userspace for this particular setup.
   680		 */
   681		if (invalidate) {
   682			if (!(disk->flags & GENHD_FL_NO_PART) ||
   683			    !(disk->flags & GENHD_FL_REMOVABLE))
   684				set_capacity(disk, 0);
   685		}
   686	
   687		if (get_capacity(disk)) {
   688			ret = blk_add_partitions(disk);
   689			if (ret == -EAGAIN)
   690				goto rescan;
   691		} else if (invalidate) {
   692			/*
   693			 * Tell userspace that the media / partition table may have
   694			 * changed.
   695			 */
   696			kobject_uevent(&disk_to_dev(disk)->kobj, KOBJ_CHANGE);
   697		}
   698	
   699		return ret;
   700	}
 > 701	EXPORT_SYMBOL_GPL_NS(bdev_disk_changed, BLOCK_DEPRECATED);
   702	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
