Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B1918DF62
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 21:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735422895; cv=none; b=DkFA0Z66bCNKuOqVPpCZiduJm1/OhJNuEy75b7szZ2tNoe8crB/3fh5h9+GY+8Cm8FaoZg3QgflrmswmhZZxXAke1B6pBmsJA/Ft8/DyFDJFD2/3ac/h5WmcN/qhdDBx7d74Z9lZfmNEMjKTFDHOu6bcsusrKwFwMg4Lfw8IH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735422895; c=relaxed/simple;
	bh=TfXoOtuMvWkGZn6gycLWBNNponccasqzXomsyV3BF0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CkOhsKCgyKhEXGVB5KOe/MsNhj5ASlh//k15m1h+YN6cDAnEQVONIpI88sOQUfLm2LL4gJlMY1ljw4Y3aFbd02tCBaerCbgp09UFipTaOxRy89EXKscOj/0BWFJ/j29OPcJb8HY4SCS79WgWvNS1P1mB08To7xiyFXhu9o5ugZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XozuI9rO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XozuI9rO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735422893; x=1766958893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TfXoOtuMvWkGZn6gycLWBNNponccasqzXomsyV3BF0U=;
  b=XozuI9rO6Q72Dy1jg6hntlGFITtLbNU62gc63nPJlc4cHxzrpdlMkk/a
   GQT6n+BsFZK+e5eQ/lWrjieuBFQJXXKpiuIYrY4dD7fdxqsOlpo5jYivX
   Z5MK1qcNbwtayLJlZzORE4Rjhguu7QCxZQ1GQ/USEw2dqtHglNN0oJAnH
   fontDMkCf48sYR/Ib0s0zo1wn6X6KSmeKDFtZtSUK0OY2ZUVU0Q3N7e04
   dE34o2UGM+kpMMhOn/3+t2ZlmiWu0+fbj+6s6cVfbUrzZxCTZu6g14YD4
   oRQOf2pXn/WznBUEfpS66/e2Y39KZb2wu8gGmGSnR3nmCgaKiCQ8mAiro
   A==;
X-CSE-ConnectionGUID: 93geBLjTQ06Uhbqi254aWw==
X-CSE-MsgGUID: 8PIV5XWTSjGmaGpcr1I3Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39702772"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="39702772"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 13:54:52 -0800
X-CSE-ConnectionGUID: jHh4E2IPQLWKFOWULTWAlA==
X-CSE-MsgGUID: zilBsy8ET8OJSTmmeZIHaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104497065"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Dec 2024 13:54:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRell-0004Ku-17;
	Sat, 28 Dec 2024 21:54:49 +0000
Date: Sun, 29 Dec 2024 05:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/io_write.c:1570: warning: Function parameter or struct
 member 'bch2_write' not described in 'CLOSURE_CALLBACK'
Message-ID: <202412290558.htHV7qoA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: d4e3b928ab487a8aecd1f6a140b40ac365116cfb closures: CLOSURE_CALLBACK() to fix type punning
date:   1 year, 1 month ago
config: sh-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241229/202412290558.htHV7qoA-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290558.htHV7qoA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290558.htHV7qoA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/io_write.c:1570: warning: Function parameter or struct member 'bch2_write' not described in 'CLOSURE_CALLBACK'
>> fs/bcachefs/io_write.c:1570: warning: expecting prototype for bch2_write(). Prototype was for CLOSURE_CALLBACK() instead


vim +1570 fs/bcachefs/io_write.c

4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1551  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1552  /**
96dea3d599dbc3 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1553   * bch2_write() - handle a write to a cache device or flash only volume
96dea3d599dbc3 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1554   * @cl:		&bch_write_op->cl
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1555   *
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1556   * This is the starting point for any data to end up in a cache device; it could
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1557   * be from a normal write, or a writeback write, or a write to a flash only
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1558   * volume - it's also used by the moving garbage collector to compact data in
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1559   * mostly empty buckets.
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1560   *
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1561   * It first writes the data to the cache, creating a list of keys to be inserted
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1562   * (if the data won't fit in a single open bucket, there will be multiple keys);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1563   * after the data is written it calls bch_journal, and after the keys have been
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1564   * added to the next journal write they're inserted into the btree.
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1565   *
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1566   * If op->discard is true, instead of inserting the data it invalidates the
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1567   * region of the cache represented by op->bio and op->inode.
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1568   */
d4e3b928ab487a fs/bcachefs/io_write.c Kent Overstreet 2023-11-17  1569  CLOSURE_CALLBACK(bch2_write)
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16 @1570  {
d4e3b928ab487a fs/bcachefs/io_write.c Kent Overstreet 2023-11-17  1571  	closure_type(op, struct bch_write_op, cl);
4b0a66d508d7bf fs/bcachefs/io.c       Kent Overstreet 2019-08-21  1572  	struct bio *bio = &op->wbio.bio;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1573  	struct bch_fs *c = op->c;
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1574  	unsigned data_len;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1575  
b17d3cec14b487 fs/bcachefs/io.c       Kent Overstreet 2022-10-31  1576  	EBUG_ON(op->cl.parent);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1577  	BUG_ON(!op->nr_replicas);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1578  	BUG_ON(!op->write_point.v);
e88a75ebe86c1d fs/bcachefs/io.c       Kent Overstreet 2022-11-24  1579  	BUG_ON(bkey_eq(op->pos, POS_MAX));
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1580  
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1581  	op->start_time = local_clock();
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1582  	bch2_keylist_init(&op->insert_keys, op->inline_keys);
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1583  	wbio_init(bio)->put_bio = false;
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1584  
8244f3209b5b49 fs/bcachefs/io.c       Kent Overstreet 2021-12-14  1585  	if (bio->bi_iter.bi_size & (c->opts.block_size - 1)) {
7fec8266af12b6 fs/bcachefs/io.c       Kent Overstreet 2022-11-15  1586  		bch_err_inum_offset_ratelimited(c,
7fec8266af12b6 fs/bcachefs/io.c       Kent Overstreet 2022-11-15  1587  			op->pos.inode,
7fec8266af12b6 fs/bcachefs/io.c       Kent Overstreet 2022-11-15  1588  			op->pos.offset << 9,
0fefe8d8ef7402 fs/bcachefs/io.c       Kent Overstreet 2020-12-03  1589  			"misaligned write");
4b0a66d508d7bf fs/bcachefs/io.c       Kent Overstreet 2019-08-21  1590  		op->error = -EIO;
4b0a66d508d7bf fs/bcachefs/io.c       Kent Overstreet 2019-08-21  1591  		goto err;
4b0a66d508d7bf fs/bcachefs/io.c       Kent Overstreet 2019-08-21  1592  	}
4b0a66d508d7bf fs/bcachefs/io.c       Kent Overstreet 2019-08-21  1593  
b40901b0f71825 fs/bcachefs/io.c       Kent Overstreet 2023-03-13  1594  	if (c->opts.nochanges) {
b40901b0f71825 fs/bcachefs/io.c       Kent Overstreet 2023-03-13  1595  		op->error = -BCH_ERR_erofs_no_writes;
b40901b0f71825 fs/bcachefs/io.c       Kent Overstreet 2023-03-13  1596  		goto err;
b40901b0f71825 fs/bcachefs/io.c       Kent Overstreet 2023-03-13  1597  	}
b40901b0f71825 fs/bcachefs/io.c       Kent Overstreet 2023-03-13  1598  
b40901b0f71825 fs/bcachefs/io.c       Kent Overstreet 2023-03-13  1599  	if (!(op->flags & BCH_WRITE_MOVE) &&
d94189ad568f6c fs/bcachefs/io.c       Kent Overstreet 2023-02-09  1600  	    !bch2_write_ref_tryget(c, BCH_WRITE_REF_write)) {
858536c7cea8bb fs/bcachefs/io.c       Kent Overstreet 2022-12-11  1601  		op->error = -BCH_ERR_erofs_no_writes;
4b0a66d508d7bf fs/bcachefs/io.c       Kent Overstreet 2019-08-21  1602  		goto err;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1603  	}
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1604  
104c69745fdf7e fs/bcachefs/io.c       Daniel Hill     2022-03-15  1605  	this_cpu_add(c->counters[BCH_COUNTER_io_write], bio_sectors(bio));
4b0a66d508d7bf fs/bcachefs/io.c       Kent Overstreet 2019-08-21  1606  	bch2_increment_clock(c, bio_sectors(bio), WRITE);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1607  
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1608  	data_len = min_t(u64, bio->bi_iter.bi_size,
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1609  			 op->new_i_size - (op->pos.offset << 9));
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1610  
07358a82bb36ff fs/bcachefs/io.c       Kent Overstreet 2019-11-29  1611  	if (c->opts.inline_data &&
07358a82bb36ff fs/bcachefs/io.c       Kent Overstreet 2019-11-29  1612  	    data_len <= min(block_bytes(c) / 2, 1024U)) {
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1613  		bch2_write_data_inline(op, data_len);
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1614  		return;
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1615  	}
4be1a412ea3492 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  1616  
b17d3cec14b487 fs/bcachefs/io.c       Kent Overstreet 2022-10-31  1617  	__bch2_write(op);
4b0a66d508d7bf fs/bcachefs/io.c       Kent Overstreet 2019-08-21  1618  	return;
4b0a66d508d7bf fs/bcachefs/io.c       Kent Overstreet 2019-08-21  1619  err:
4b0a66d508d7bf fs/bcachefs/io.c       Kent Overstreet 2019-08-21  1620  	bch2_disk_reservation_put(c, &op->res);
46e4bb1c378248 fs/bcachefs/io.c       Kent Overstreet 2019-12-27  1621  
b17d3cec14b487 fs/bcachefs/io.c       Kent Overstreet 2022-10-31  1622  	closure_debug_destroy(&op->cl);
b17d3cec14b487 fs/bcachefs/io.c       Kent Overstreet 2022-10-31  1623  	if (op->end_io)
c32bd3ad1fe595 fs/bcachefs/io.c       Kent Overstreet 2019-11-11  1624  		op->end_io(op);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1625  }
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  1626  

:::::: The code at line 1570 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
