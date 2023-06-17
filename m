Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4359DEC9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 22:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687039855; x=1718575855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CP0bVgHY5MLTGJ7UAxbbDDMov/urenUi939XXoytSgc=;
  b=Slq2ScCiMG5pbQI+A0hQuY6K3TA6r5tRCWEJq/iS0hGKFjt89k/AtFLs
   PcDzoQRbNw5eXwdBX6Im6ZT23v2uZsHvOkrJ1xEHc6aqo5LYsOwZQSlNm
   PffvHuq7VYKOUys3HEAS4hafonPnmSOSTbg+5Dj9Wz2Qe4pVYKEjFWeE7
   fJvb/PybsYWYHObwKX5MpkiKXfXNeegeDUvgIIZa12BQ5Y4BBEiF1H23X
   wLpYFdmWctgRA7Lv6OtnQA/5D+FjP9Ro1RIgZV2JpVgDInaVU61Nnmz9C
   q+eBRZ0rc+RltTaO/FuI/i7UTJzbeRRK2V8owi6g7+Pi4sDkpfEYk7O7K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="344169653"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="344169653"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 15:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="837423880"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="837423880"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Jun 2023 15:10:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAe8B-00039k-36;
	Sat, 17 Jun 2023 22:10:51 +0000
Date: Sun, 18 Jun 2023 06:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Hannes Reinecke <hare@suse.de>,
	Christian Brauner <brauner@kernel.org>
Subject: [axboe-block:for-6.5/block 167/191] drivers/block/swim.c:643:22:
 sparse: sparse: restricted blk_mode_t degrades to integer
Message-ID: <202306180622.qh2vPluH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.5/block
head:   245165658e1c9f95c0fecfe02b9b1ebd30a1198a
commit: 05bdb9965305bbfdae79b31d22df03d1e2cfcb22 [167/191] block: replace fmode_t with a block-specific type for block open flags
config: m68k-randconfig-s033-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180622.qh2vPluH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180622.qh2vPluH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180622.qh2vPluH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/block/swim.c:643:22: sparse: sparse: restricted blk_mode_t degrades to integer
>> drivers/block/swim.c:643:29: sparse: sparse: restricted fmode_t degrades to integer
   drivers/block/swim.c: note: in included file (through include/linux/kref.h, include/linux/mm_types.h, include/linux/buildid.h, ...):
   include/linux/spinlock.h:400:9: sparse: sparse: context imbalance in 'swim_queue_rq' - wrong count at exit

vim +643 drivers/block/swim.c

8852ecd9748824 Laurent Vivier    2008-11-15  610  
05bdb9965305bb Christoph Hellwig 2023-06-08  611  static int floppy_open(struct gendisk *disk, blk_mode_t mode)
8852ecd9748824 Laurent Vivier    2008-11-15  612  {
d32e2bf8379172 Christoph Hellwig 2023-06-08  613  	struct floppy_state *fs = disk->private_data;
8852ecd9748824 Laurent Vivier    2008-11-15  614  	struct swim __iomem *base = fs->swd->base;
8852ecd9748824 Laurent Vivier    2008-11-15  615  	int err;
8852ecd9748824 Laurent Vivier    2008-11-15  616  
05bdb9965305bb Christoph Hellwig 2023-06-08  617  	if (fs->ref_count == -1 || (fs->ref_count && mode & BLK_OPEN_EXCL))
8852ecd9748824 Laurent Vivier    2008-11-15  618  		return -EBUSY;
05bdb9965305bb Christoph Hellwig 2023-06-08  619  	if (mode & BLK_OPEN_EXCL)
8852ecd9748824 Laurent Vivier    2008-11-15  620  		fs->ref_count = -1;
8852ecd9748824 Laurent Vivier    2008-11-15  621  	else
8852ecd9748824 Laurent Vivier    2008-11-15  622  		fs->ref_count++;
8852ecd9748824 Laurent Vivier    2008-11-15  623  	swim_write(base, setup, S_IBM_DRIVE  | S_FCLK_DIV2);
8852ecd9748824 Laurent Vivier    2008-11-15  624  	udelay(10);
b3906535ccc6cd Finn Thain        2018-04-11  625  	swim_drive(base, fs->location);
8852ecd9748824 Laurent Vivier    2008-11-15  626  	swim_motor(base, ON);
8852ecd9748824 Laurent Vivier    2008-11-15  627  	swim_action(base, SETMFM);
8852ecd9748824 Laurent Vivier    2008-11-15  628  	if (fs->ejected)
8852ecd9748824 Laurent Vivier    2008-11-15  629  		setup_medium(fs);
8852ecd9748824 Laurent Vivier    2008-11-15  630  	if (!fs->disk_in) {
8852ecd9748824 Laurent Vivier    2008-11-15  631  		err = -ENXIO;
8852ecd9748824 Laurent Vivier    2008-11-15  632  		goto out;
8852ecd9748824 Laurent Vivier    2008-11-15  633  	}
8852ecd9748824 Laurent Vivier    2008-11-15  634  
5a13388d7aa117 Finn Thain        2018-04-11  635  	set_capacity(fs->disk, fs->total_secs);
5a13388d7aa117 Finn Thain        2018-04-11  636  
05bdb9965305bb Christoph Hellwig 2023-06-08  637  	if (mode & BLK_OPEN_NDELAY)
8852ecd9748824 Laurent Vivier    2008-11-15  638  		return 0;
8852ecd9748824 Laurent Vivier    2008-11-15  639  
05bdb9965305bb Christoph Hellwig 2023-06-08  640  	if (mode & (BLK_OPEN_READ | BLK_OPEN_WRITE)) {
d32e2bf8379172 Christoph Hellwig 2023-06-08  641  		if (disk_check_media_change(disk) && fs->disk_in)
433d21ce313e93 Christoph Hellwig 2020-09-08  642  			fs->ejected = 0;
8852ecd9748824 Laurent Vivier    2008-11-15 @643  		if ((mode & FMODE_WRITE) && fs->write_protected) {
8852ecd9748824 Laurent Vivier    2008-11-15  644  			err = -EROFS;
8852ecd9748824 Laurent Vivier    2008-11-15  645  			goto out;
8852ecd9748824 Laurent Vivier    2008-11-15  646  		}
8852ecd9748824 Laurent Vivier    2008-11-15  647  	}
8852ecd9748824 Laurent Vivier    2008-11-15  648  	return 0;
8852ecd9748824 Laurent Vivier    2008-11-15  649  out:
8852ecd9748824 Laurent Vivier    2008-11-15  650  	if (fs->ref_count < 0)
8852ecd9748824 Laurent Vivier    2008-11-15  651  		fs->ref_count = 0;
8852ecd9748824 Laurent Vivier    2008-11-15  652  	else if (fs->ref_count > 0)
8852ecd9748824 Laurent Vivier    2008-11-15  653  		--fs->ref_count;
8852ecd9748824 Laurent Vivier    2008-11-15  654  
8852ecd9748824 Laurent Vivier    2008-11-15  655  	if (fs->ref_count == 0)
8852ecd9748824 Laurent Vivier    2008-11-15  656  		swim_motor(base, OFF);
8852ecd9748824 Laurent Vivier    2008-11-15  657  	return err;
8852ecd9748824 Laurent Vivier    2008-11-15  658  }
8852ecd9748824 Laurent Vivier    2008-11-15  659  

:::::: The code at line 643 was first introduced by commit
:::::: 8852ecd97488249ca7fe2c0d3eb44cae95886881 m68k: mac - Add SWIM floppy support

:::::: TO: Laurent Vivier <laurent@lvivier.info>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
