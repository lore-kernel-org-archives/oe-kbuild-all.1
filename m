Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EF4C132
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718376547; cv=none; b=YT+k0IDg3/Sz8XDmw/Yyrs+Lh0EBpjQdyOIYElvUt1S9MhgHVXYolmxcwMx/eEsY2fXQjpTeUCcP7OLXU0vFzUfooYKwtQ8KtRKyDSxK/fn++C/8Lc6DVMTWBSP5Dj0BDYY4Zx6A67gx4ziEuLDujyf6Wtr5lVZ9QoDI3ZAvyvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718376547; c=relaxed/simple;
	bh=n2hC3EIoLcJVVMrJhmCvRNHNn/BUNV3Am/++D24Zb2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvBBPTzutozWoMclNPX6HZArPYKyTtCBZ5X28zsjxzhYrui3AGJ77ZgOZKg0dQXwjfjkxhA1eUJsE8yc3kZVISS+8Krio7Nyu7/atYxJz7VtC5vc/1J34pIOTzt687wwXvWIBHxcZjvLFuY3xXRN5RREthCklaesTX5SFOV7HLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0y6xXbt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0y6xXbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718376546; x=1749912546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n2hC3EIoLcJVVMrJhmCvRNHNn/BUNV3Am/++D24Zb2s=;
  b=Z0y6xXbtsPhQwKwPvYzo9ArIhSQBYXQfVPDa3g7PJD4Ioeh1NGhkCxDM
   kDMWxVgMrDE6+sHYWxHJkLCyl5zwvh3c6QuQ/uJl9lrxJlM89/izAsg5l
   Su9YY6MDstIQxRzCLw/N8/6HyhsvSErcjqmc+bRSQZ6tonejIu9474Dv4
   lCpjM5AYaK7Q8vFM1zeS7+xXiTJ+CYQ/6Nb4Kc7WlF1goQmpmpSo29f7w
   qhpcnBCYm7PlsPU4LHgW0XVO02PRIYF6fC5ZqbNskY07WjB7UEypMq3AG
   BKrmkEMyvgQPmNWuw6qwd4MA/sO1jnYE7N1mJjksi9BMV9cBdlOsdIia6
   A==;
X-CSE-ConnectionGUID: oE9d4b6LQu6xgzLDGAHyHQ==
X-CSE-MsgGUID: 8+lbcppfSQq538Rdx+Lf1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15098188"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="15098188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 07:49:05 -0700
X-CSE-ConnectionGUID: raNb92PbTPyNMiySUvZ5lQ==
X-CSE-MsgGUID: f9GYHHtCR1yUHk0LAXjscg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="71292346"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2024 07:49:05 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI8Eg-0001PD-0y;
	Fri, 14 Jun 2024 14:49:02 +0000
Date: Fri, 14 Jun 2024 22:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Shushu Yi <teddyxym@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC V6] md/raid5: optimize Scattered Address Space and
 Thread-Level Parallelism to improve RAID5 performance
Message-ID: <202406142236.P3muSO1U-lkp@intel.com>
References: <SJ0PR10MB5741D624033B16510F56A525D8C72@SJ0PR10MB5741.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR10MB5741D624033B16510F56A525D8C72@SJ0PR10MB5741.namprd10.prod.outlook.com>

Hi Shushu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.10-rc3]
[also build test WARNING on linus/master next-20240613]
[cannot apply to song-md/md-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shushu-Yi/md-raid5-optimize-Scattered-Address-Space-and-Thread-Level-Parallelism-to-improve-RAID5-performance/20240612-033849
base:   v6.10-rc3
patch link:    https://lore.kernel.org/r/SJ0PR10MB5741D624033B16510F56A525D8C72%40SJ0PR10MB5741.namprd10.prod.outlook.com
patch subject: [RFC V6] md/raid5: optimize Scattered Address Space and Thread-Level Parallelism to improve RAID5 performance
config: x86_64-randconfig-122-20240614 (https://download.01.org/0day-ci/archive/20240614/202406142236.P3muSO1U-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142236.P3muSO1U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142236.P3muSO1U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/md-bitmap.c:1387:72: sparse: sparse: Using plain integer as NULL pointer
   drivers/md/md-bitmap.c:2328:80: sparse: sparse: Using plain integer as NULL pointer
   drivers/md/md-bitmap.c:2357:85: sparse: sparse: Using plain integer as NULL pointer
   drivers/md/md-bitmap.c:2362:84: sparse: sparse: Using plain integer as NULL pointer
   drivers/md/md-bitmap.c:2398:93: sparse: sparse: Using plain integer as NULL pointer

vim +1387 drivers/md/md-bitmap.c

  1308	
  1309	/*
  1310	 * bitmap daemon -- periodically wakes up to clean bits and flush pages
  1311	 *			out to disk
  1312	 */
  1313	void md_bitmap_daemon_work(struct mddev *mddev)
  1314	{
  1315		struct bitmap *bitmap;
  1316		unsigned long j;
  1317		unsigned long nextpage;
  1318		sector_t blocks;
  1319		struct bitmap_counts *counts;
  1320	
  1321		/* Use a mutex to guard daemon_work against
  1322		 * bitmap_destroy.
  1323		 */
  1324		mutex_lock(&mddev->bitmap_info.mutex);
  1325		bitmap = mddev->bitmap;
  1326		if (bitmap == NULL) {
  1327			mutex_unlock(&mddev->bitmap_info.mutex);
  1328			return;
  1329		}
  1330		if (time_before(jiffies, bitmap->daemon_lastrun
  1331				+ mddev->bitmap_info.daemon_sleep))
  1332			goto done;
  1333	
  1334		bitmap->daemon_lastrun = jiffies;
  1335		if (bitmap->allclean) {
  1336			mddev_set_timeout(mddev, MAX_SCHEDULE_TIMEOUT, true);
  1337			goto done;
  1338		}
  1339		bitmap->allclean = 1;
  1340	
  1341		mddev_add_trace_msg(bitmap->mddev, "md bitmap_daemon_work");
  1342	
  1343		/* Any file-page which is PENDING now needs to be written.
  1344		 * So set NEEDWRITE now, then after we make any last-minute changes
  1345		 * we will write it.
  1346		 */
  1347		for (j = 0; j < bitmap->storage.file_pages; j++)
  1348			if (test_and_clear_page_attr(bitmap, j,
  1349						     BITMAP_PAGE_PENDING))
  1350				set_page_attr(bitmap, j,
  1351					      BITMAP_PAGE_NEEDWRITE);
  1352	
  1353		if (bitmap->need_sync &&
  1354		    mddev->bitmap_info.external == 0) {
  1355			/* Arrange for superblock update as well as
  1356			 * other changes */
  1357			bitmap_super_t *sb;
  1358			bitmap->need_sync = 0;
  1359			if (bitmap->storage.filemap) {
  1360				sb = kmap_atomic(bitmap->storage.sb_page);
  1361				sb->events_cleared =
  1362					cpu_to_le64(bitmap->events_cleared);
  1363				kunmap_atomic(sb);
  1364				set_page_attr(bitmap, 0,
  1365					      BITMAP_PAGE_NEEDWRITE);
  1366			}
  1367		}
  1368		/* Now look at the bitmap counters and if any are '2' or '1',
  1369		 * decrement and handle accordingly.
  1370		 */
  1371		counts = &bitmap->counts;
  1372		write_lock_irq(&counts->mlock);
  1373		nextpage = 0;
  1374		for (j = 0; j < counts->chunks; j++) {
  1375			bitmap_counter_t *bmc;
  1376			sector_t  block = (sector_t)j << counts->chunkshift;
  1377	
  1378			if (j == nextpage) {
  1379				nextpage += PAGE_COUNTER_RATIO;
  1380				if (!counts->bp[j >> PAGE_COUNTER_SHIFT].pending) {
  1381					j |= PAGE_COUNTER_MASK;
  1382					continue;
  1383				}
  1384				counts->bp[j >> PAGE_COUNTER_SHIFT].pending = 0;
  1385			}
  1386	
> 1387			bmc = md_bitmap_get_counter(counts, block, &blocks, 0, 0, 0);
  1388			if (!bmc) {
  1389				j |= PAGE_COUNTER_MASK;
  1390				continue;
  1391			}
  1392			if (*bmc == 1 && !bitmap->need_sync) {
  1393				/* We can clear the bit */
  1394				*bmc = 0;
  1395				md_bitmap_count_page(counts, block, -1);
  1396				md_bitmap_file_clear_bit(bitmap, block);
  1397			} else if (*bmc && *bmc <= 2) {
  1398				*bmc = 1;
  1399				md_bitmap_set_pending(counts, block);
  1400				bitmap->allclean = 0;
  1401			}
  1402		}
  1403		write_unlock_irq(&counts->mlock);
  1404	
  1405		md_bitmap_wait_writes(bitmap);
  1406		/* Now start writeout on any page in NEEDWRITE that isn't DIRTY.
  1407		 * DIRTY pages need to be written by bitmap_unplug so it can wait
  1408		 * for them.
  1409		 * If we find any DIRTY page we stop there and let bitmap_unplug
  1410		 * handle all the rest.  This is important in the case where
  1411		 * the first blocking holds the superblock and it has been updated.
  1412		 * We mustn't write any other blocks before the superblock.
  1413		 */
  1414		for (j = 0;
  1415		     j < bitmap->storage.file_pages
  1416			     && !test_bit(BITMAP_STALE, &bitmap->flags);
  1417		     j++) {
  1418			if (test_page_attr(bitmap, j,
  1419					   BITMAP_PAGE_DIRTY))
  1420				/* bitmap_unplug will handle the rest */
  1421				break;
  1422			if (bitmap->storage.filemap &&
  1423			    test_and_clear_page_attr(bitmap, j,
  1424						     BITMAP_PAGE_NEEDWRITE))
  1425				filemap_write_page(bitmap, j, false);
  1426		}
  1427	
  1428	 done:
  1429		if (bitmap->allclean == 0)
  1430			mddev_set_timeout(mddev, mddev->bitmap_info.daemon_sleep, true);
  1431		mutex_unlock(&mddev->bitmap_info.mutex);
  1432	}
  1433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
