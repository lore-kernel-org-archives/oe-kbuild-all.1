Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA31993B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730370913; cv=none; b=cAWKLvbZF7h6O0flDezOr3DBftWGqqicq81WD3/U6Sg2ApBCTo0YrzbNcYZb0kdJUikmI9ZF3Sb8nwCqMMo5UWV3oAp42NZeNqc3HVmTCgnsVhqEddOEj3V/8US4FmpNBksabuhe1E03rhfgjsGlh+a725XYFeT70fCiKlS7z0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730370913; c=relaxed/simple;
	bh=dmR3V51/PgxaAEeM3chbsh9dW8UNfFN9/LLAqt6/rY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HJz06VQ39HF8O6ZqytbljHvBGN6CBg9plG9Cz893GY0ySwwTnFE5FOfNCl/6Ai9WLBwL9PyZlkBlQ60fj/L7CxHXSuBOKONLF8cLtrGZxvH0Top564Od3jOWbDFzUa+1P8MgTxqG0evp/csXOe3rAN8ZmyPOHsToIH0/T7ed+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUleUxOM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUleUxOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730370910; x=1761906910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dmR3V51/PgxaAEeM3chbsh9dW8UNfFN9/LLAqt6/rY0=;
  b=XUleUxOMIiSfHVaHfqEEaBX9u2yTuMu2epMmQAm2TLnvV2l0jHgQBWP5
   cO0NF4KzVWJyriRF7ToXXzxBRcq8a0do8XpPvT0TPWqSI5Lj6big3uMOr
   DyX3bHKJydZCqCabzRI97NUkOHEmj/4r5fGevCmFKSE4uoQExf150StlE
   va0K8a7yg6M9y7Vd0j/I0cWbGnyKKUhHN6IsbCVm3bIEEwkH5qpoMANX0
   0Yo0IFNcsMKKdXyM9E+GSa4oir5S1DFlOEIDYHOZTuH76s/+7n4gJcizR
   pJoLxNE7p/vLOYhaWRuXGDyXCO2jgjKgArfkD6DiL66Ls6sEZBQMxdpO+
   g==;
X-CSE-ConnectionGUID: d0VaCzwOTEmJrAYLlUXqbA==
X-CSE-MsgGUID: hooGfrKwTkO+jrS+tlJirA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30208794"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="30208794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:35:10 -0700
X-CSE-ConnectionGUID: s0gyqJIcTeyR0U9nEKgy4Q==
X-CSE-MsgGUID: 8cTQS5qmQe6AB84FbbAosQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82709775"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2024 03:35:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6SWA-000fyo-1L;
	Thu, 31 Oct 2024 10:35:06 +0000
Date: Thu, 31 Oct 2024 18:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 73/78]
 drivers/md/dm-verity-chromeos.c:418:19: error: incompatible integer to
 pointer conversion passing 'fmode_t' (aka 'unsigned int') to parameter of
 type 'void *'
Message-ID: <202410311837.yv3gT3r8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c177bfa506750a08f31510adc2d3aa8ceec0f6c4
commit: 1963b113a7341f89f48813b72c9d9022970e0560 [73/78] CHROMIUM: dm-verity: use GPT try counter for integrity retries
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241031/202410311837.yv3gT3r8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311837.yv3gT3r8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311837.yv3gT3r8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/md/dm-verity-chromeos.c:19:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/md/dm-verity-chromeos.c:418:19: error: incompatible integer to pointer conversion passing 'fmode_t' (aka 'unsigned int') to parameter of type 'void *' [-Wint-conversion]
     418 |         blkdev_put(bdev, dev_mode);
         |                          ^~~~~~~~
   include/linux/blkdev.h:1511:50: note: passing argument to parameter 'holder' here
    1511 | void blkdev_put(struct block_device *bdev, void *holder);
         |                                                  ^
   drivers/md/dm-verity-chromeos.c:445:20: error: incompatible integer to pointer conversion passing 'fmode_t' (aka 'unsigned int') to parameter of type 'void *' [-Wint-conversion]
     445 |                 blkdev_put(bdev, dev_mode);
         |                                  ^~~~~~~~
   include/linux/blkdev.h:1511:50: note: passing argument to parameter 'holder' here
    1511 | void blkdev_put(struct block_device *bdev, void *holder);
         |                                                  ^
   drivers/md/dm-verity-chromeos.c:481:26: error: incompatible integer to pointer conversion passing 'fmode_t' (aka 'unsigned int') to parameter of type 'void *' [-Wint-conversion]
     481 |         blkdev_put(kernel_bdev, FMODE_READ);
         |                                 ^~~~~~~~~~
   include/linux/fs.h:111:21: note: expanded from macro 'FMODE_READ'
     111 | #define FMODE_READ              ((__force fmode_t)0x1)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:1511:50: note: passing argument to parameter 'holder' here
    1511 | void blkdev_put(struct block_device *bdev, void *holder);
         |                                                  ^
   5 warnings and 3 errors generated.


vim +418 drivers/md/dm-verity-chromeos.c

   373	
   374	static int chromeos_handle_retries(struct bio *bio,
   375					   dev_t devt,
   376					   u8 active_gpt_entry_id,
   377					   sector_t hdr_lba,
   378					   struct page *hdr_page,
   379					   struct page *tbl_pages)
   380	{
   381		struct block_device *bdev;
   382		fmode_t dev_mode = 0;
   383		int ret = 0;
   384	
   385		dev_mode = FMODE_READ;
   386		bdev = blkdev_get_by_dev(devt, dev_mode,
   387					 chromeos_handle_retries, NULL);
   388		if (IS_ERR(bdev)) {
   389			DMERR("update_tries: could not open device for reading: %ld",
   390			      PTR_ERR(bdev));
   391			dev_mode = 0;
   392			ret = -1;
   393			goto failed;
   394		}
   395	
   396		/*
   397		 * Request read operation with REQ_PREFLUSH flag to ensure that the
   398		 * cache of non-volatile storage device has been flushed before read is
   399		 * started.
   400		 */
   401		if (chromeos_gpt_io_submit(bio, bdev, REQ_OP_READ,
   402					   REQ_SYNC | REQ_PREFLUSH, hdr_lba,
   403					   hdr_page, tbl_pages)) {
   404			DMERR("update_tries: failed reading %s GPT",
   405			      hdr_lba == 1 ? "primary" : "secondary");
   406			ret = -1;
   407			goto failed;
   408		}
   409	
   410		if (chromeos_increment_gpt_err_count(hdr_page, tbl_pages,
   411						     active_gpt_entry_id)) {
   412			DMERR("update_tries: retries exceeded");
   413			ret = -1;
   414			goto failed;
   415		}
   416	
   417		/* The block dev was being changed on read. Let's reopen here. */
 > 418		blkdev_put(bdev, dev_mode);
   419		dev_mode = FMODE_WRITE;
   420		bdev = blkdev_get_by_dev(devt, dev_mode,
   421					 chromeos_handle_retries, NULL);
   422		if (IS_ERR(bdev)) {
   423			DMERR("update_tries: could not open device for writing");
   424			dev_mode = 0;
   425			ret = -1;
   426			goto failed;
   427		}
   428	
   429		/*
   430		 * Request write operation with REQ_FUA flag to ensure that I/O
   431		 * completion for the write is signaled only after the data has been
   432		 * committed to non-volatile storage.
   433		 */
   434		if (chromeos_gpt_io_submit(bio, bdev, REQ_OP_WRITE,
   435					   REQ_SYNC | REQ_FUA, hdr_lba,
   436					   hdr_page, tbl_pages)) {
   437			DMERR("update_tries: failed writing %s GPT",
   438			      hdr_lba == 1 ? "primary" : "secondary");
   439			ret = -1;
   440			goto failed;
   441		}
   442	
   443	failed:
   444		if (dev_mode)
   445			blkdev_put(bdev, dev_mode);
   446	
   447		if (!ret)
   448			DMERR("update_tries: updated %s GPT",
   449			      hdr_lba == 1 ? "primary" : "secondary");
   450	
   451		return ret;
   452	}
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
