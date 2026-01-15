Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6342749DF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 17:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498724; cv=none; b=sfNtGuLspELZTUrhBMdsovWCWT9CiwL0/dJxSzZ54IyTEekMCQJ3yT5I31kAG+rJ4+HvxG1IEOFQzGjJBgLmXHHfY0Nn3jXZ+obb6JzR1DtyT+JoT3xejlQ4N6T0PWUnY8gMMi3J03BlOp90BG5HJsFvPTgCcs9grIzC0ToIZOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498724; c=relaxed/simple;
	bh=mLq/rijb6jbPggwK6xBiBR3oarVtw8yj3otjEOjqRvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mc3THZRee/vG5+4NXXMUvIHTf2/4fhDifn10yJPAevTjIezQ1K0IKGp8Q9U1cB2aL2I7446jnBg6dIckfrjc4gqXW8tYqxyxu+2JH0v1JVCGiXhCgyqarbRByhMh+dRIoEcF2DYEFEOXtVzaVsxSsi8GrJ26hveg1Fn6TnSmfhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABGDJ5np; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABGDJ5np"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768498722; x=1800034722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mLq/rijb6jbPggwK6xBiBR3oarVtw8yj3otjEOjqRvU=;
  b=ABGDJ5np6bfP32UYZvBL/wxdybe0jgKhmJER+OQcFHTv2UACtzKDEgcX
   9ZH0ZktDp+Bd1xXeRBJj5D66xwR0Xt1vFkKNVOPXpYofNyembSYISkquB
   o5caSoUpYIsipPcOqqssE0CHq3VloV1gAVqTt0kaPe4qT2NGzRbMoYsDn
   0K0+DsafzkXxtB0RfOOfH9iyPMZtmPnCmsfvj/xgbUQZJo9Rf9vKSq7Lk
   WJsPxB5rdXe34+d3ro7N+RLf94eT0B5cP2DxeVBDwetFIukbQLWSQqb9I
   CIEkwa4OshtpEkQybt9RTiBF/O2d9IeaOfO01ea+bthD739Vhby7aw7P8
   w==;
X-CSE-ConnectionGUID: BuE0ru1yRyW5xeSCWxqbsg==
X-CSE-MsgGUID: uRavHuc0TAeEnLNhgGZUUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81175857"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="81175857"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 09:38:41 -0800
X-CSE-ConnectionGUID: bW0HwGOSSpeUW3iGCZUwBg==
X-CSE-MsgGUID: tRNUTDENTr6k2F4bQaSS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209516861"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jan 2026 09:38:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgRIr-00000000IzK-20Qr;
	Thu, 15 Jan 2026 17:38:37 +0000
Date: Fri, 16 Jan 2026 01:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Diangang Li <diangangli@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] block: export windowed IO P99 latency
Message-ID: <202601160139.JUgX771I-lkp@intel.com>
References: <20260109083126.15052-2-lidiangang@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109083126.15052-2-lidiangang@bytedance.com>

Hi Diangang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Diangang-Li/block-export-windowed-IO-P99-latency/20260109-163449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260109083126.15052-2-lidiangang%40bytedance.com
patch subject: [RFC 1/1] block: export windowed IO P99 latency
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260116/202601160139.JUgX771I-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160139.JUgX771I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160139.JUgX771I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/genhd.c: In function 'diskstats_show':
>> block/genhd.c:1460:1: warning: the frame size of 1800 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1460 | }
         | ^
   block/genhd.c: In function 'part_stat_show':
   block/genhd.c:1146:1: warning: the frame size of 1892 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1146 | }
         | ^


vim +1460 block/genhd.c

^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1386  
a6e2ba88774bc5 block/genhd.c         Randy Dunlap          2008-05-23  1387  #ifdef CONFIG_PROC_FS
cf771cb5a7b716 block/genhd.c         Tejun Heo             2008-09-03  1388  /*
cf771cb5a7b716 block/genhd.c         Tejun Heo             2008-09-03  1389   * aggregate disk stat collector.  Uses the same stats that the sysfs
cf771cb5a7b716 block/genhd.c         Tejun Heo             2008-09-03  1390   * entries do, above, but makes them available through one seq_file.
cf771cb5a7b716 block/genhd.c         Tejun Heo             2008-09-03  1391   *
cf771cb5a7b716 block/genhd.c         Tejun Heo             2008-09-03  1392   * The output looks suspiciously like /proc/partitions with a bunch of
cf771cb5a7b716 block/genhd.c         Tejun Heo             2008-09-03  1393   * extra fields.
cf771cb5a7b716 block/genhd.c         Tejun Heo             2008-09-03  1394   */
cf771cb5a7b716 block/genhd.c         Tejun Heo             2008-09-03  1395  static int diskstats_show(struct seq_file *seqf, void *v)
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1396  {
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1397  	struct gendisk *gp = v;
ad1eaa5344b293 block/genhd.c         Christoph Hellwig     2020-11-24  1398  	struct block_device *hd;
e016b78201a2d9 block/genhd.c         Mikulas Patocka       2018-12-06  1399  	unsigned int inflight;
ea18e0f0a63af9 block/genhd.c         Konstantin Khlebnikov 2020-03-25  1400  	struct disk_stats stat;
7fae67cc9c0e06 block/genhd.c         Christoph Hellwig     2021-04-06  1401  	unsigned long idx;
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1402  
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1403  	/*
ed9e1982347b36 block/genhd.c         Tejun Heo             2008-08-25  1404  	if (&disk_to_dev(gp)->kobj.entry == block_class.devices.next)
cf771cb5a7b716 block/genhd.c         Tejun Heo             2008-09-03  1405  		seq_puts(seqf,	"major minor name"
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1406  				"     rio rmerge rsect ruse wio wmerge "
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1407  				"wsect wuse running use aveq"
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1408  				"\n\n");
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1409  	*/
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1410  
7fae67cc9c0e06 block/genhd.c         Christoph Hellwig     2021-04-06  1411  	rcu_read_lock();
7fae67cc9c0e06 block/genhd.c         Christoph Hellwig     2021-04-06  1412  	xa_for_each(&gp->part_tbl, idx, hd) {
7fae67cc9c0e06 block/genhd.c         Christoph Hellwig     2021-04-06  1413  		if (bdev_is_partition(hd) && !bdev_nr_sectors(hd))
7fae67cc9c0e06 block/genhd.c         Christoph Hellwig     2021-04-06  1414  			continue;
ea18e0f0a63af9 block/genhd.c         Konstantin Khlebnikov 2020-03-25  1415  
f2987c5816bda0 block/genhd.c         Yu Kuai               2025-05-06  1416  		inflight = bdev_count_inflight(hd);
86d7331299fda7 block/genhd.c         Zhang Wensheng        2022-02-17  1417  		if (inflight) {
86d7331299fda7 block/genhd.c         Zhang Wensheng        2022-02-17  1418  			part_stat_lock();
86d7331299fda7 block/genhd.c         Zhang Wensheng        2022-02-17  1419  			update_io_ticks(hd, jiffies, true);
86d7331299fda7 block/genhd.c         Zhang Wensheng        2022-02-17  1420  			part_stat_unlock();
86d7331299fda7 block/genhd.c         Zhang Wensheng        2022-02-17  1421  		}
86d7331299fda7 block/genhd.c         Zhang Wensheng        2022-02-17  1422  		part_stat_read_all(hd, &stat);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1423  		seq_put_decimal_ull_width(seqf, "",  MAJOR(hd->bd_dev), 4);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1424  		seq_put_decimal_ull_width(seqf, " ", MINOR(hd->bd_dev), 7);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1425  		seq_printf(seqf, " %pg", hd);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1426  		seq_put_decimal_ull(seqf, " ", stat.ios[STAT_READ]);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1427  		seq_put_decimal_ull(seqf, " ", stat.merges[STAT_READ]);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1428  		seq_put_decimal_ull(seqf, " ", stat.sectors[STAT_READ]);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1429  		seq_put_decimal_ull(seqf, " ", (unsigned int)div_u64(stat.nsecs[STAT_READ],
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1430  								     NSEC_PER_MSEC));
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1431  		seq_put_decimal_ull(seqf, " ", stat.ios[STAT_WRITE]);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1432  		seq_put_decimal_ull(seqf, " ", stat.merges[STAT_WRITE]);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1433  		seq_put_decimal_ull(seqf, " ", stat.sectors[STAT_WRITE]);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1434  		seq_put_decimal_ull(seqf, " ", (unsigned int)div_u64(stat.nsecs[STAT_WRITE],
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1435  								     NSEC_PER_MSEC));
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1436  		seq_put_decimal_ull(seqf, " ", inflight);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1437  		seq_put_decimal_ull(seqf, " ", jiffies_to_msecs(stat.io_ticks));
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1438  		seq_put_decimal_ull(seqf, " ", (unsigned int)div_u64(stat.nsecs[STAT_READ] +
8cd5b8fc00716f block/genhd.c         Konstantin Khlebnikov 2020-03-25  1439  								     stat.nsecs[STAT_WRITE] +
8cd5b8fc00716f block/genhd.c         Konstantin Khlebnikov 2020-03-25  1440  								     stat.nsecs[STAT_DISCARD] +
8cd5b8fc00716f block/genhd.c         Konstantin Khlebnikov 2020-03-25  1441  								     stat.nsecs[STAT_FLUSH],
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1442  								     NSEC_PER_MSEC));
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1443  		seq_put_decimal_ull(seqf, " ", stat.ios[STAT_DISCARD]);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1444  		seq_put_decimal_ull(seqf, " ", stat.merges[STAT_DISCARD]);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1445  		seq_put_decimal_ull(seqf, " ", stat.sectors[STAT_DISCARD]);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1446  		seq_put_decimal_ull(seqf, " ", (unsigned int)div_u64(stat.nsecs[STAT_DISCARD],
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1447  								     NSEC_PER_MSEC));
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1448  		seq_put_decimal_ull(seqf, " ", stat.ios[STAT_FLUSH]);
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1449  		seq_put_decimal_ull(seqf, " ", (unsigned int)div_u64(stat.nsecs[STAT_FLUSH],
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1450  								     NSEC_PER_MSEC));
f8b4ca85f47647 block/genhd.c         Diangang Li           2026-01-09  1451  		seq_put_decimal_ull(seqf, " ", diskstat_p99_us(stat.latency[STAT_READ][0]));
f8b4ca85f47647 block/genhd.c         Diangang Li           2026-01-09  1452  		seq_put_decimal_ull(seqf, " ", diskstat_p99_us(stat.latency[STAT_WRITE][0]));
f8b4ca85f47647 block/genhd.c         Diangang Li           2026-01-09  1453  		seq_put_decimal_ull(seqf, " ", diskstat_p99_us(stat.latency[STAT_DISCARD][0]));
f8b4ca85f47647 block/genhd.c         Diangang Li           2026-01-09  1454  		seq_put_decimal_ull(seqf, " ", diskstat_p99_us(stat.latency[STAT_FLUSH][0]));
bda9c7d92f24b6 block/genhd.c         David Wang            2024-11-08  1455  		seq_putc(seqf, '\n');
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1456  	}
7fae67cc9c0e06 block/genhd.c         Christoph Hellwig     2021-04-06  1457  	rcu_read_unlock();
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1458  
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1459  	return 0;
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16 @1460  }
^1da177e4c3f41 drivers/block/genhd.c Linus Torvalds        2005-04-16  1461  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
