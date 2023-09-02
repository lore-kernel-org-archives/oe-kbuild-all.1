Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6917D8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 03:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693624869; x=1725160869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Udi5NWtUMcWhP29CUyRgWxnZjWAXsqgK35/jf3/ZiGU=;
  b=KO4gh8EecX2W/Zyf0sBZpOipqWJtk8Y8FsstfM9IuzBqAY9wsPD2G4v9
   L1Nn7KROkTDVtT9yQ6JmLcF9a6gmgMbYe56/g0+IzFEKKRe22P46ZTk3Z
   N0gO3xHCSweFWnH+V1i6F0k4/oaeWmATkwlH0MI7aWVJuw1DVFxhZU5FU
   kdY+GCjqPg0shH7/yMyYHWJ5x/t6Viu81OwKuuYl2mFWBaTXCf5UuJMtA
   8iSKjZvIBn9+XPvLMOhI0TgU7/ZtBe83+Ic6BK7XdZs1e7GFmsHaYuG1p
   93fFfaAISNYzLz1PbEEdcc78uxP9BWVC3bOaPYkj6wCDn30cCUPJ5GduG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442745203"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="442745203"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 20:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986884706"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="986884706"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Sep 2023 20:21:04 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcHC2-0001uh-25;
	Sat, 02 Sep 2023 03:21:02 +0000
Date: Sat, 2 Sep 2023 11:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-20230901 46/46] do_mounts.c:(.text+0x4):
 multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0):
 first defined here
Message-ID: <202309021134.VmtFtuyL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230901
head:   8e33509f10cabce9067f10fcabb3f4350048056d
commit: 8e33509f10cabce9067f10fcabb3f4350048056d [46/46] bdev: allow to switch between bdev aops
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20230902/202309021134.VmtFtuyL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021134.VmtFtuyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021134.VmtFtuyL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: init/do_mounts.o: in function `bdev_aops_reset':
>> do_mounts.c:(.text+0x4): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: kernel/exit.o: in function `bdev_aops_reset':
   exit.c:(.text+0x580): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: kernel/sched/core.o: in function `bdev_aops_reset':
   core.c:(.text+0xe2c): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: mm/page-writeback.o: in function `bdev_aops_reset':
   page-writeback.c:(.text+0x12e0): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: mm/readahead.o: in function `bdev_aops_reset':
   readahead.c:(.text+0x4a8): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: mm/vmscan.o: in function `bdev_aops_reset':
   vmscan.c:(.text+0x190c): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: mm/backing-dev.o: in function `bdev_aops_reset':
   backing-dev.c:(.text+0x488): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: mm/show_mem.o: in function `bdev_aops_reset':
   show_mem.c:(.text+0xc0): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/super.o: in function `bdev_aops_reset':
   super.c:(.text+0x15e4): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/stat.o: in function `bdev_aops_reset':
   stat.c:(.text+0x7d8): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/libfs.o: in function `bdev_aops_reset':
   libfs.c:(.text+0x15e0): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/fs-writeback.o: in function `bdev_aops_reset':
   fs-writeback.c:(.text+0xd70): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/sync.o: in function `bdev_aops_reset':
   sync.c:(.text+0x1cc): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/aio.o: in function `bdev_aops_reset':
   aio.c:(.text+0x1668): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/iomap/trace.o: in function `bdev_aops_reset':
   trace.c:(.text+0x0): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/iomap/iter.o: in function `bdev_aops_reset':
   iter.c:(.text+0x0): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/iomap/buffered-io.o: in function `bdev_aops_reset':
   buffered-io.c:(.text+0x2cd4): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/iomap/direct-io.o: in function `bdev_aops_reset':
   direct-io.c:(.text+0xd10): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/iomap/fiemap.o: in function `bdev_aops_reset':
   fiemap.c:(.text+0x2a4): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/iomap/seek.o: in function `bdev_aops_reset':
   seek.c:(.text+0x220): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: fs/proc/devices.o: in function `bdev_aops_reset':
   devices.c:(.text+0x84): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/bdev.o: in function `bdev_aops_reset':
   bdev.c:(.text+0xb28): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/fops.o: in function `bdev_aops_reset':
   fops.c:(.text+0xbc4): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/bio.o: in function `bdev_aops_reset':
   bio.c:(.text+0xf64): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/elevator.o: in function `bdev_aops_reset':
   elevator.c:(.text+0x3b0): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-core.o: in function `bdev_aops_reset':
   blk-core.c:(.text+0x328): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-sysfs.o: in function `bdev_aops_reset':
   blk-sysfs.c:(.text+0x808): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-flush.o: in function `bdev_aops_reset':
   blk-flush.c:(.text+0x498): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-settings.o: in function `bdev_aops_reset':
   blk-settings.c:(.text+0x864): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-ioc.o: in function `bdev_aops_reset':
   blk-ioc.c:(.text+0xcc): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-map.o: in function `bdev_aops_reset':
   blk-map.c:(.text+0xd34): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-merge.o: in function `bdev_aops_reset':
   blk-merge.c:(.text+0x8b0): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-timeout.o: in function `bdev_aops_reset':
   blk-timeout.c:(.text+0x14): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-lib.o: in function `bdev_aops_reset':
   blk-lib.c:(.text+0x624): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-mq.o: in function `bdev_aops_reset':
   blk-mq.c:(.text+0x27c8): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-mq-tag.o: in function `bdev_aops_reset':
   blk-mq-tag.c:(.text+0x39c): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-stat.o: in function `bdev_aops_reset':
   blk-stat.c:(.text+0x194): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-mq-sysfs.o: in function `bdev_aops_reset':
   blk-mq-sysfs.c:(.text+0x1cc): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-mq-cpumap.o: in function `bdev_aops_reset':
   blk-mq-cpumap.c:(.text+0x50): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-mq-sched.o: in function `bdev_aops_reset':
   blk-mq-sched.c:(.text+0x43c): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/ioctl.o: in function `bdev_aops_reset':
   ioctl.c:(.text+0x798): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/genhd.o: in function `bdev_aops_reset':
   genhd.c:(.text+0x1208): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/ioprio.o: in function `bdev_aops_reset':
   ioprio.c:(.text+0x224): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/partitions/core.o: in function `bdev_aops_reset':
   core.c:(.text+0x764): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/partitions/msdos.o: in function `bdev_aops_reset':
   msdos.c:(.text+0x2a4): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/partitions/efi.o: in function `bdev_aops_reset':
   efi.c:(.text+0xcf0): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-rq-qos.o: in function `bdev_aops_reset':
   blk-rq-qos.c:(.text+0x34): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/disk-events.o: in function `bdev_aops_reset':
   disk-events.c:(.text+0x2a8): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/blk-ia-ranges.o: in function `bdev_aops_reset':
   blk-ia-ranges.c:(.text+0x68): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: block/early-lookup.o: in function `bdev_aops_reset':
   early-lookup.c:(.text+0x0): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here
   arm-linux-gnueabi-ld: io_uring/io_uring.o: in function `bdev_aops_reset':
   io_uring.c:(.text+0x11d8): multiple definition of `bdev_aops_reset'; init/main.o:main.c:(.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
