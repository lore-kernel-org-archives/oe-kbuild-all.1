Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCD18E28
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 15:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lc60v1Mw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702655807; x=1734191807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZSIztNaPN0rSBmlktDcZncPxDHvl1XXqeUP4gZPtTpM=;
  b=lc60v1MwbY4X3hX0RYn0+ctwkrsnbwDq11bntzDL5QzFzpfYNV+oleL6
   zRXm6Qiaoy+WTPI015Mc5aGKFwRa+ZzT6+KpfhVrB++NytS7zzXCMi+2W
   OOUrEZTA1u4R8bN2xedwCnEth3H7VxoFXMH32rMjmnRLhjHT6YkkQXwhQ
   mf5axvXqYpA6zdA+P2JFHC06HaxtBUoPkm5+NkNJDLg5jAuxl4ClSAki7
   uIDYxkEJquH0kcn8gDIFkVm/YBMUmOqWyOsb+02uKi/QOvrlpkshhlZ64
   Z3+1DJ/Il8pULdsLMRbFc3QmIhlA9ot6u0B+f6qAfG0aRFR/+QNm3dQMD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2377771"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2377771"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 07:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021974265"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="1021974265"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Dec 2023 07:56:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEAYM-0000Og-0H;
	Fri, 15 Dec 2023 15:56:42 +0000
Date: Fri, 15 Dec 2023 23:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 12/21] kernel/power/user.c:363:62: sparse:
 sparse: incorrect type in argument 3 (different base types)
Message-ID: <202312152314.X5tGiRUj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   43916c7034e99197255e7e8e545e81da6e6599ff
commit: a6035ee096200565f91190bdc9492117b9fc6d96 [12/21] CHROMIUM: PM: hibernate: Add three ioctls for secure image transfer
config: x86_64-randconfig-122-20231215 (https://download.01.org/0day-ci/archive/20231215/202312152314.X5tGiRUj-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312152314.X5tGiRUj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312152314.X5tGiRUj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/power/user.c:334:63: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int new @@     got restricted blk_status_t [usertype] bi_status @@
   kernel/power/user.c:334:63: sparse:     expected int new
   kernel/power/user.c:334:63: sparse:     got restricted blk_status_t [usertype] bi_status
   kernel/power/user.c:357:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted blk_status_t [usertype] status @@     got int @@
   kernel/power/user.c:357:47: sparse:     expected restricted blk_status_t [usertype] status
   kernel/power/user.c:357:47: sparse:     got int
>> kernel/power/user.c:363:62: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got restricted gfp_t @@
   kernel/power/user.c:363:62: sparse:     expected restricted blk_opf_t [usertype] opf
   kernel/power/user.c:363:62: sparse:     got restricted gfp_t
>> kernel/power/user.c:363:79: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp_mask @@     got int @@
   kernel/power/user.c:363:79: sparse:     expected restricted gfp_t [usertype] gfp_mask
   kernel/power/user.c:363:79: sparse:     got int
>> kernel/power/user.c:407:61: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int op @@     got restricted blk_opf_t @@
   kernel/power/user.c:407:61: sparse:     expected int op
   kernel/power/user.c:407:61: sparse:     got restricted blk_opf_t
>> kernel/power/user.c:408:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int op_flags @@     got restricted blk_opf_t @@
   kernel/power/user.c:408:42: sparse:     expected int op_flags
   kernel/power/user.c:408:42: sparse:     got restricted blk_opf_t
   kernel/power/user.c:420:54: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted blk_status_t [usertype] status @@     got int @@
   kernel/power/user.c:420:54: sparse:     expected restricted blk_status_t [usertype] status
   kernel/power/user.c:420:54: sparse:     got int
   kernel/power/user.c:424:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int op @@     got restricted blk_opf_t @@
   kernel/power/user.c:424:42: sparse:     expected int op
   kernel/power/user.c:424:42: sparse:     got restricted blk_opf_t
   kernel/power/user.c:424:75: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int op_flags @@     got restricted blk_opf_t @@
   kernel/power/user.c:424:75: sparse:     expected int op_flags
   kernel/power/user.c:424:75: sparse:     got restricted blk_opf_t

vim +363 kernel/power/user.c

   359	
   360	static int snapshot_submit_io(int op, int op_flags, sector_t sector,
   361			struct snapshot_bio_batch *batch, void *data)
   362	{
 > 363		struct bio *bio = bio_alloc(batch->bdev, 1, GFP_NOIO | __GFP_HIGH, op | op_flags);
   364	
   365		if (!bio)
   366			return -ENOMEM;
   367	
   368		if (data && !bio_add_page(bio, virt_to_page(data), PAGE_SIZE, 0)) {
   369			pr_err("Adding page to bio failed at %llu\n",
   370			       (unsigned long long)bio->bi_iter.bi_sector);
   371			bio_put(bio);
   372			return -EFAULT;
   373		}
   374	
   375		bio->bi_iter.bi_sector = sector;
   376		bio->bi_end_io = snapshot_bio_end_io;
   377		bio->bi_private = batch;
   378		atomic_inc(&batch->count);
   379		submit_bio(bio);
   380	
   381		if (bio->bi_opf & REQ_SYNC)
   382			return snapshot_bio_batch_wait(batch);
   383	
   384		return 0;
   385	}
   386	
   387	static int snapshot_rw_block_device(int direction, struct snapshot_data *data)
   388	{
   389		struct snapshot_bio_batch batch;
   390		ktime_t start = ktime_get();
   391		sector_t sector = 0;
   392		int res;
   393	
   394		BUG_ON(direction != WRITE && direction != READ);
   395		snapshot_bio_batch_init(&batch, data->bdev);
   396	
   397		while (atomic_read(&batch.status) == BLK_STS_OK) {
   398			/* When writing we're reading from the snapshot, vice-versa. */
   399			if (direction == WRITE)
   400				res = snapshot_read_next(&data->handle);
   401			else
   402				res = snapshot_write_next(&data->handle);
   403	
   404			if (res <= 0)
   405				break;
   406	
 > 407			res = snapshot_submit_io(direction == WRITE ? REQ_OP_WRITE : REQ_OP_READ,
 > 408					REQ_IDLE | (data->handle.sync_read ? REQ_SYNC : 0), sector,
   409					&batch, data_of(data->handle));
   410			if (res)
   411				break;
   412	
   413			sector += PAGE_SECTORS;
   414		}
   415	
   416		snapshot_bio_batch_wait(&batch);
   417		snapshot_bio_batch_finish(&batch);
   418	
   419		if (!res)
   420			res = blk_status_to_errno(atomic_read(&batch.status));
   421	
   422		/* Issue a final flush to make sure everything is committed to disk */
   423		if (!res && direction == WRITE)
   424			res = snapshot_submit_io(REQ_OP_WRITE, REQ_FUA | REQ_SYNC | REQ_PREFLUSH,
   425					sector, &batch, NULL);
   426	
   427		if (!res) {
   428			swsusp_show_speed(start, ktime_get(),
   429					  sector >> PAGE_SECTORS_SHIFT,
   430					  "transferred image via ioctl");
   431		}
   432	
   433		return res;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
