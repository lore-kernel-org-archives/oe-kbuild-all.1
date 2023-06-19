Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4822C23A1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 04:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687149849; x=1718685849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=woFKr89V/3MCM/pyfMO0ZgveSUJv4hYbNaNdrW8HCOE=;
  b=E0Ya1ZgPlyBOxPUradABhase+gAI35RA86n8M5Y2mkdV1VRks4UN5FQM
   BUKKNkQRraHr6fu3zfp87DBpcSrqAUHtHAyHX1N00pIAiUAj33aL0qozX
   ohVKlgsI9ONFew3UrULMkb9kC/pbzCCjs4kDDJ0KxcxC4uu26zxDY/OtP
   uDHycFffjG9xygmi5CXxjKufi0g6u2av/eG8EYS0GmKXHG7IExr0i/OAh
   2jhxXqCRA3A86WvDFflXeeYHhY+Ljc6n55FUl4scXAJ/K1Xd3miDe/T7f
   PkOy6SuHT4IkU2t1C1HZRPD8KerjRxwBS/jVGcdSgSAfMrnoDO3CE4CW+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="423203643"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="423203643"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 21:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="690955364"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="690955364"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Jun 2023 21:44:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qB6kF-0004LC-1u;
	Mon, 19 Jun 2023 04:44:03 +0000
Date: Mon, 19 Jun 2023 12:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-20230618-hacks-v2 44/45]
 include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset';
 init/main.o:include/linux/blkdev.h:1532: first defined here
Message-ID: <202306191243.zoITHhmW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230618-hacks-v2
head:   45755261f269a9ff35d37c5aa481e86424e78716
commit: f698784915e1c993a52b563936ef824727a98e77 [44/45] bdev: allow to switch between bdev aops
config: microblaze-randconfig-r006-20230619 (https://download.01.org/0day-ci/archive/20230619/202306191243.zoITHhmW-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191243.zoITHhmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191243.zoITHhmW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/cramfs/inode.c:24:
>> include/linux/blkdev.h:1530:6: warning: no previous prototype for 'bdev_aops_reset' [-Wmissing-prototypes]
    1530 | void bdev_aops_reset(struct block_device *bdev)
         |      ^~~~~~~~~~~~~~~
--
   microblaze-linux-ld: init/do_mounts.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: kernel/exit.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: kernel/sched/core.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1530: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: mm/page-writeback.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: mm/readahead.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: mm/vmscan.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: mm/backing-dev.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: mm/show_mem.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: mm/madvise.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/super.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/stat.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/libfs.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1530: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/fs-writeback.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/sync.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/aio.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/quota/dquot.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/quota/quota.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/proc/devices.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/cramfs/inode.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: fs/orangefs/inode.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/io_uring.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/xattr.o: in function `bdev_aops_reset':
>> include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/nop.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/fs.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/splice.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/sync.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/advise.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/filetable.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/openclose.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/uring_cmd.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/epoll.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/statx.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/net.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/msg_ring.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/timeout.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/sqpoll.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/fdinfo.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/tctx.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/poll.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/cancel.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/kbuf.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/rsrc.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/rw.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/opdef.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/notif.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: io_uring/io-wq.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/char/random.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/base/core.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/base/class.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/base/devtmpfs.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mtd/mtdsuper.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/net/wireless/ath/ath6kl/sdio.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/net/wireless/realtek/rtw88/sdio.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/usb/gadget/function/f_fs.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/core.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/bus.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/host.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/mmc.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/mmc_ops.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/sd.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/sd_ops.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/sdio.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/sdio_ops.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/sdio_bus.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/sdio_cis.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/sdio_io.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/sdio_irq.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/slot-gpio.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/regulator.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/pwrseq.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/pwrseq_simple.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
   microblaze-linux-ld: drivers/mmc/core/pwrseq_emmc.o: in function `bdev_aops_reset':
   include/linux/blkdev.h:1532: multiple definition of `bdev_aops_reset'; init/main.o:include/linux/blkdev.h:1532: first defined here
--
   In file included from fs/orangefs/inode.c:13:
>> include/linux/blkdev.h:1530:6: warning: no previous prototype for 'bdev_aops_reset' [-Wmissing-prototypes]
    1530 | void bdev_aops_reset(struct block_device *bdev)
         |      ^~~~~~~~~~~~~~~
   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/inode.c:15:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map' defined but not used [-Wunused-const-variable=]
      86 | static const int num_kmod_keyword_mask_map = (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +1532 include/linux/blkdev.h

  1488	
  1489	#ifdef CONFIG_BLOCK
  1490	void invalidate_bdev(struct block_device *bdev);
  1491	int sync_blockdev(struct block_device *bdev);
  1492	int sync_blockdev_range(struct block_device *bdev, loff_t lstart, loff_t lend);
  1493	int sync_blockdev_nowait(struct block_device *bdev);
  1494	void sync_bdevs(bool wait);
  1495	void bdev_statx_dioalign(struct inode *inode, struct kstat *stat);
  1496	void printk_all_partitions(void);
  1497	int __init early_lookup_bdev(const char *pathname, dev_t *dev);
  1498	#ifdef CONFIG_BUFFER_HEAD
  1499	void bdev_aops_reset(struct block_device *bdev);
  1500	#else
  1501	void bdev_aops_reset(struct block_device *bdev)
  1502	{
  1503	}
  1504	#endif
  1505	#else
  1506	static inline void invalidate_bdev(struct block_device *bdev)
  1507	{
  1508	}
  1509	static inline int sync_blockdev(struct block_device *bdev)
  1510	{
  1511		return 0;
  1512	}
  1513	static inline int sync_blockdev_nowait(struct block_device *bdev)
  1514	{
  1515		return 0;
  1516	}
  1517	static inline void sync_bdevs(bool wait)
  1518	{
  1519	}
  1520	static inline void bdev_statx_dioalign(struct inode *inode, struct kstat *stat)
  1521	{
  1522	}
  1523	static inline void printk_all_partitions(void)
  1524	{
  1525	}
  1526	static inline int early_lookup_bdev(const char *pathname, dev_t *dev)
  1527	{
  1528		return -EINVAL;
  1529	}
> 1530	void bdev_aops_reset(struct block_device *bdev)
  1531	{
> 1532	}
  1533	#endif /* CONFIG_BLOCK */
  1534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
