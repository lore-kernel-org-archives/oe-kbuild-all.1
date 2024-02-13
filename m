Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E005511724
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 06:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707806189; cv=none; b=paxHhdM7+DieIznOO9BIaJzKPicQOtteLaiJm3/FM0y76HmnV9zToflqzuLl+7icL1bk5Ed4aylkeRAWyunJ4iw9/0/rEM2W1e8xDU0sKuoWOOClBw8dkkIC/OyTYZ2maPTBfARKnsMmDw423/KCaN3OwfSYGmX2seicn0QKGsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707806189; c=relaxed/simple;
	bh=finOPyIuA5YmcacGQLgNvjUPosOVgfkIKdaQNVaDjYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=StZkOjLJGUxjEOTXgDeM0YHKsEPfDLo9g6sOYlZToXGaHA7oRXBLH0Gt2RNii8qJ5qlC5NpLw13dcF7fPpDdZXFPNTsh1erH3vN+PgJ5voXAAZsfS7r6MJL3LhWaVpDN9Gll6/upNUXWQrwj3Db3Mcmp1lrhAZsWhWezxdd+b2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpUFYzCT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpUFYzCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707806187; x=1739342187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=finOPyIuA5YmcacGQLgNvjUPosOVgfkIKdaQNVaDjYk=;
  b=ZpUFYzCTLv766+x6T+l0yzD74z3DaGjvl2NOIe7mGpQFto/kwDxgwvUD
   dfVB39OpoViYytns4QbVqtGmGvS9Z0m/RQFDKPGbCvkQuyNGP0FFZpFCk
   cy7XYfoFhA0/3KTYDBA/ztYj0095T4YgokrPYtSQ4vsBYSGKqQ4wEzGtv
   5T5VXI+CMp82ccp7xUFPYmKHpRWiLaegeogq6XghPlaBqoOlYqQMKvhDv
   UJmpfGO0M4CvKJzTT9+5gb/DTBh+S5xMEovUUSqejEsr4M4vuOiYC0apC
   AkhOFG2QNbCQAN6W67i7ot9P19TQZD57KUnBmB1U8g0q34fXkpniMOPMe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1683460"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1683460"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 22:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="33886504"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2024 22:36:25 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZmP0-0007Yy-3B;
	Tue, 13 Feb 2024 06:36:22 +0000
Date: Tue, 13 Feb 2024 14:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:buffered-iomap 72/93] fs/btrfs/extent_io.c:970:14: error:
 too few arguments to function 'btrfs_get_extent'
Message-ID: <202402131413.KIZcSl9C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux buffered-iomap
head:   7cb60beb922ba5589e5aea0181ced3e235df7435
commit: f3c4e26cd94df8423f59e3cd0caad08193e9fbb3 [72/93] btrfs: return btrfs_path when getting an extent_map
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240213/202402131413.KIZcSl9C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402131413.KIZcSl9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402131413.KIZcSl9C-lkp@intel.com/

Note: the goldwynr/buffered-iomap HEAD 7cb60beb922ba5589e5aea0181ced3e235df7435 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/btrfs/extent_io.c: In function '__get_extent_map':
>> fs/btrfs/extent_io.c:970:14: error: too few arguments to function 'btrfs_get_extent'
     970 |         em = btrfs_get_extent(BTRFS_I(inode), page, start, len);
         |              ^~~~~~~~~~~~~~~~
   In file included from fs/btrfs/extent_io.c:21:
   fs/btrfs/btrfs_inode.h:495:20: note: declared here
     495 | struct extent_map *btrfs_get_extent(struct btrfs_inode *inode,
         |                    ^~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c: At top level:
   fs/btrfs/extent_io.c:321:25: warning: 'find_lock_delalloc_range' defined but not used [-Wunused-function]
     321 | noinline_for_stack bool find_lock_delalloc_range(struct inode *inode,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/btrfs_get_extent +970 fs/btrfs/extent_io.c

d1310b2e0cd98e Chris Mason        2008-01-24   952  
7066bae048944f Qu Wenruo          2024-01-08   953  static struct extent_map *__get_extent_map(struct inode *inode, struct page *page,
1a5ee1e6260368 Nikolay Borisov    2020-09-14   954  		 u64 start, u64 len, struct extent_map **em_cached)
125bac016d60e7 Miao Xie           2013-07-25   955  {
125bac016d60e7 Miao Xie           2013-07-25   956  	struct extent_map *em;
125bac016d60e7 Miao Xie           2013-07-25   957  
125bac016d60e7 Miao Xie           2013-07-25   958  	if (em_cached && *em_cached) {
125bac016d60e7 Miao Xie           2013-07-25   959  		em = *em_cached;
cbc0e9287d710c Filipe Manana      2014-02-25   960  		if (extent_map_in_tree(em) && start >= em->start &&
125bac016d60e7 Miao Xie           2013-07-25   961  		    start < extent_map_end(em)) {
490b54d6fb75f6 Elena Reshetova    2017-03-03   962  			refcount_inc(&em->refs);
125bac016d60e7 Miao Xie           2013-07-25   963  			return em;
125bac016d60e7 Miao Xie           2013-07-25   964  		}
125bac016d60e7 Miao Xie           2013-07-25   965  
125bac016d60e7 Miao Xie           2013-07-25   966  		free_extent_map(em);
125bac016d60e7 Miao Xie           2013-07-25   967  		*em_cached = NULL;
125bac016d60e7 Miao Xie           2013-07-25   968  	}
125bac016d60e7 Miao Xie           2013-07-25   969  
7066bae048944f Qu Wenruo          2024-01-08  @970  	em = btrfs_get_extent(BTRFS_I(inode), page, start, len);
c03475506e3e7f Filipe Manana      2022-02-03   971  	if (em_cached && !IS_ERR(em)) {
125bac016d60e7 Miao Xie           2013-07-25   972  		BUG_ON(*em_cached);
490b54d6fb75f6 Elena Reshetova    2017-03-03   973  		refcount_inc(&em->refs);
125bac016d60e7 Miao Xie           2013-07-25   974  		*em_cached = em;
125bac016d60e7 Miao Xie           2013-07-25   975  	}
125bac016d60e7 Miao Xie           2013-07-25   976  	return em;
125bac016d60e7 Miao Xie           2013-07-25   977  }
d1310b2e0cd98e Chris Mason        2008-01-24   978  /*
d1310b2e0cd98e Chris Mason        2008-01-24   979   * basic readpage implementation.  Locked extent state structs are inserted
d1310b2e0cd98e Chris Mason        2008-01-24   980   * into the tree that are removed when the IO is done (by the end_io
d1310b2e0cd98e Chris Mason        2008-01-24   981   * handlers)
79787eaab46121 Jeff Mahoney       2012-03-12   982   * XXX JDM: This needs looking at to ensure proper page locking
baf863b9c29617 Liu Bo             2016-07-11   983   * return 0 on success, otherwise return error
d1310b2e0cd98e Chris Mason        2008-01-24   984   */
7aab8b32825eec Christoph Hellwig  2022-04-15   985  static int btrfs_do_readpage(struct page *page, struct extent_map **em_cached,
c000bc04bad42d Christoph Hellwig  2023-02-27   986  		      struct btrfs_bio_ctrl *bio_ctrl, u64 *prev_em_start)
d1310b2e0cd98e Chris Mason        2008-01-24   987  {
d1310b2e0cd98e Chris Mason        2008-01-24   988  	struct inode *inode = page->mapping->host;
fc711e4b4cb261 David Sterba       2023-09-14   989  	struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
4eee4fa4f8ab8c Miao Xie           2012-12-21   990  	u64 start = page_offset(page);
8eec8296a086cf David Sterba       2017-06-06   991  	const u64 end = start + PAGE_SIZE - 1;
d1310b2e0cd98e Chris Mason        2008-01-24   992  	u64 cur = start;
d1310b2e0cd98e Chris Mason        2008-01-24   993  	u64 extent_offset;
d1310b2e0cd98e Chris Mason        2008-01-24   994  	u64 last_byte = i_size_read(inode);
d1310b2e0cd98e Chris Mason        2008-01-24   995  	u64 block_start;
d1310b2e0cd98e Chris Mason        2008-01-24   996  	struct extent_map *em;
baf863b9c29617 Liu Bo             2016-07-11   997  	int ret = 0;
306e16ce13c0f3 David Sterba       2011-04-19   998  	size_t pg_offset = 0;
d1310b2e0cd98e Chris Mason        2008-01-24   999  	size_t iosize;
4f9ba23084d5db David Sterba       2024-01-16  1000  	size_t blocksize = fs_info->sectorsize;
ae6957ebbfcd41 David Sterba       2020-02-05  1001  
32443de3382be9 Qu Wenruo          2021-01-26  1002  	ret = set_page_extent_mapped(page);
32443de3382be9 Qu Wenruo          2021-01-26  1003  	if (ret < 0) {
92082d40976ed0 Qu Wenruo          2021-02-02  1004  		unlock_page(page);
551733372fda4c Christoph Hellwig  2023-02-27  1005  		return ret;
32443de3382be9 Qu Wenruo          2021-01-26  1006  	}
d1310b2e0cd98e Chris Mason        2008-01-24  1007  
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1008  	if (page->index == last_byte >> PAGE_SHIFT) {
7073017aeb98db Johannes Thumshirn 2018-12-05  1009  		size_t zero_offset = offset_in_page(last_byte);
c8b978188c9a0f Chris Mason        2008-10-29  1010  
c8b978188c9a0f Chris Mason        2008-10-29  1011  		if (zero_offset) {
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1012  			iosize = PAGE_SIZE - zero_offset;
d048b9c2a737eb Ira Weiny          2021-05-04  1013  			memzero_page(page, zero_offset, iosize);
c8b978188c9a0f Chris Mason        2008-10-29  1014  		}
c8b978188c9a0f Chris Mason        2008-10-29  1015  	}
a700ca5ec4ee9c Qu Wenruo          2023-12-12  1016  	bio_ctrl->end_io_func = end_bbio_data_read;
92082d40976ed0 Qu Wenruo          2021-02-02  1017  	begin_page_read(fs_info, page);
d1310b2e0cd98e Chris Mason        2008-01-24  1018  	while (cur <= end) {
a140453bf9fb64 Christoph Hellwig  2023-02-27  1019  		enum btrfs_compression_type compress_type = BTRFS_COMPRESS_NONE;
005efedf2c7d0a Filipe Manana      2015-09-14  1020  		bool force_bio_submit = false;
0c64c33c603f69 Qu Wenruo          2021-01-06  1021  		u64 disk_bytenr;
c8f2f24bd56a9f Josef Bacik        2013-02-11  1022  
6a404910205525 Qu Wenruo          2021-09-27  1023  		ASSERT(IS_ALIGNED(cur, fs_info->sectorsize));
d1310b2e0cd98e Chris Mason        2008-01-24  1024  		if (cur >= last_byte) {
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1025  			iosize = PAGE_SIZE - pg_offset;
d048b9c2a737eb Ira Weiny          2021-05-04  1026  			memzero_page(page, pg_offset, iosize);
92082d40976ed0 Qu Wenruo          2021-02-02  1027  			end_page_read(page, true, cur, iosize);
d1310b2e0cd98e Chris Mason        2008-01-24  1028  			break;
d1310b2e0cd98e Chris Mason        2008-01-24  1029  		}
7066bae048944f Qu Wenruo          2024-01-08  1030  		em = __get_extent_map(inode, page, cur, end - cur + 1, em_cached);
c03475506e3e7f Filipe Manana      2022-02-03  1031  		if (IS_ERR(em)) {
92082d40976ed0 Qu Wenruo          2021-02-02  1032  			end_page_read(page, false, cur, end + 1 - cur);
551733372fda4c Christoph Hellwig  2023-02-27  1033  			return PTR_ERR(em);
d1310b2e0cd98e Chris Mason        2008-01-24  1034  		}
d1310b2e0cd98e Chris Mason        2008-01-24  1035  		extent_offset = cur - em->start;
d1310b2e0cd98e Chris Mason        2008-01-24  1036  		BUG_ON(extent_map_end(em) <= cur);
d1310b2e0cd98e Chris Mason        2008-01-24  1037  		BUG_ON(end < cur);
d1310b2e0cd98e Chris Mason        2008-01-24  1038  
f86f7a75e2fb5f Filipe Manana      2023-12-04  1039  		compress_type = extent_map_compression(em);
c8b978188c9a0f Chris Mason        2008-10-29  1040  
d1310b2e0cd98e Chris Mason        2008-01-24  1041  		iosize = min(extent_map_end(em) - cur, end - cur + 1);
fda2832febb192 Qu Wenruo          2013-02-26  1042  		iosize = ALIGN(iosize, blocksize);
a140453bf9fb64 Christoph Hellwig  2023-02-27  1043  		if (compress_type != BTRFS_COMPRESS_NONE)
0c64c33c603f69 Qu Wenruo          2021-01-06  1044  			disk_bytenr = em->block_start;
949b32732eab33 Goldwyn Rodrigues  2020-09-15  1045  		else
0c64c33c603f69 Qu Wenruo          2021-01-06  1046  			disk_bytenr = em->block_start + extent_offset;
d1310b2e0cd98e Chris Mason        2008-01-24  1047  		block_start = em->block_start;
f86f7a75e2fb5f Filipe Manana      2023-12-04  1048  		if (em->flags & EXTENT_FLAG_PREALLOC)
d899e05215178f Yan Zheng          2008-10-30  1049  			block_start = EXTENT_MAP_HOLE;
005efedf2c7d0a Filipe Manana      2015-09-14  1050  
005efedf2c7d0a Filipe Manana      2015-09-14  1051  		/*
005efedf2c7d0a Filipe Manana      2015-09-14  1052  		 * If we have a file range that points to a compressed extent
260db43cd2f556 Randy Dunlap       2020-08-04  1053  		 * and it's followed by a consecutive file range that points
005efedf2c7d0a Filipe Manana      2015-09-14  1054  		 * to the same compressed extent (possibly with a different
005efedf2c7d0a Filipe Manana      2015-09-14  1055  		 * offset and/or length, so it either points to the whole extent
005efedf2c7d0a Filipe Manana      2015-09-14  1056  		 * or only part of it), we must make sure we do not submit a
005efedf2c7d0a Filipe Manana      2015-09-14  1057  		 * single bio to populate the pages for the 2 ranges because
005efedf2c7d0a Filipe Manana      2015-09-14  1058  		 * this makes the compressed extent read zero out the pages
005efedf2c7d0a Filipe Manana      2015-09-14  1059  		 * belonging to the 2nd range. Imagine the following scenario:
005efedf2c7d0a Filipe Manana      2015-09-14  1060  		 *
005efedf2c7d0a Filipe Manana      2015-09-14  1061  		 *  File layout
005efedf2c7d0a Filipe Manana      2015-09-14  1062  		 *  [0 - 8K]                     [8K - 24K]
005efedf2c7d0a Filipe Manana      2015-09-14  1063  		 *    |                               |
005efedf2c7d0a Filipe Manana      2015-09-14  1064  		 *    |                               |
005efedf2c7d0a Filipe Manana      2015-09-14  1065  		 * points to extent X,         points to extent X,
005efedf2c7d0a Filipe Manana      2015-09-14  1066  		 * offset 4K, length of 8K     offset 0, length 16K
005efedf2c7d0a Filipe Manana      2015-09-14  1067  		 *
005efedf2c7d0a Filipe Manana      2015-09-14  1068  		 * [extent X, compressed length = 4K uncompressed length = 16K]
005efedf2c7d0a Filipe Manana      2015-09-14  1069  		 *
005efedf2c7d0a Filipe Manana      2015-09-14  1070  		 * If the bio to read the compressed extent covers both ranges,
005efedf2c7d0a Filipe Manana      2015-09-14  1071  		 * it will decompress extent X into the pages belonging to the
005efedf2c7d0a Filipe Manana      2015-09-14  1072  		 * first range and then it will stop, zeroing out the remaining
005efedf2c7d0a Filipe Manana      2015-09-14  1073  		 * pages that belong to the other range that points to extent X.
005efedf2c7d0a Filipe Manana      2015-09-14  1074  		 * So here we make sure we submit 2 bios, one for the first
005efedf2c7d0a Filipe Manana      2015-09-14  1075  		 * range and another one for the third range. Both will target
005efedf2c7d0a Filipe Manana      2015-09-14  1076  		 * the same physical extent from disk, but we can't currently
005efedf2c7d0a Filipe Manana      2015-09-14  1077  		 * make the compressed bio endio callback populate the pages
005efedf2c7d0a Filipe Manana      2015-09-14  1078  		 * for both ranges because each compressed bio is tightly
005efedf2c7d0a Filipe Manana      2015-09-14  1079  		 * coupled with a single extent map, and each range can have
005efedf2c7d0a Filipe Manana      2015-09-14  1080  		 * an extent map with a different offset value relative to the
005efedf2c7d0a Filipe Manana      2015-09-14  1081  		 * uncompressed data of our extent and different lengths. This
005efedf2c7d0a Filipe Manana      2015-09-14  1082  		 * is a corner case so we prioritize correctness over
005efedf2c7d0a Filipe Manana      2015-09-14  1083  		 * non-optimal behavior (submitting 2 bios for the same extent).
005efedf2c7d0a Filipe Manana      2015-09-14  1084  		 */
f86f7a75e2fb5f Filipe Manana      2023-12-04  1085  		if (compress_type != BTRFS_COMPRESS_NONE &&
005efedf2c7d0a Filipe Manana      2015-09-14  1086  		    prev_em_start && *prev_em_start != (u64)-1 &&
8e928218780e2f Filipe Manana      2019-02-14  1087  		    *prev_em_start != em->start)
005efedf2c7d0a Filipe Manana      2015-09-14  1088  			force_bio_submit = true;
005efedf2c7d0a Filipe Manana      2015-09-14  1089  
005efedf2c7d0a Filipe Manana      2015-09-14  1090  		if (prev_em_start)
8e928218780e2f Filipe Manana      2019-02-14  1091  			*prev_em_start = em->start;
005efedf2c7d0a Filipe Manana      2015-09-14  1092  
d1310b2e0cd98e Chris Mason        2008-01-24  1093  		free_extent_map(em);
d1310b2e0cd98e Chris Mason        2008-01-24  1094  		em = NULL;
d1310b2e0cd98e Chris Mason        2008-01-24  1095  
d1310b2e0cd98e Chris Mason        2008-01-24  1096  		/* we've found a hole, just zero and go on */
d1310b2e0cd98e Chris Mason        2008-01-24  1097  		if (block_start == EXTENT_MAP_HOLE) {
d048b9c2a737eb Ira Weiny          2021-05-04  1098  			memzero_page(page, pg_offset, iosize);
92082d40976ed0 Qu Wenruo          2021-02-02  1099  			end_page_read(page, true, cur, iosize);
d1310b2e0cd98e Chris Mason        2008-01-24  1100  			cur = cur + iosize;
306e16ce13c0f3 David Sterba       2011-04-19  1101  			pg_offset += iosize;
d1310b2e0cd98e Chris Mason        2008-01-24  1102  			continue;
d1310b2e0cd98e Chris Mason        2008-01-24  1103  		}
d1310b2e0cd98e Chris Mason        2008-01-24  1104  		/* the get_extent function already copied into the page */
70dec8079d7869 Chris Mason        2008-01-29  1105  		if (block_start == EXTENT_MAP_INLINE) {
52b029f42751d0 Ethan Lien         2022-08-19  1106  			end_page_read(page, true, cur, iosize);
70dec8079d7869 Chris Mason        2008-01-29  1107  			cur = cur + iosize;
306e16ce13c0f3 David Sterba       2011-04-19  1108  			pg_offset += iosize;
70dec8079d7869 Chris Mason        2008-01-29  1109  			continue;
70dec8079d7869 Chris Mason        2008-01-29  1110  		}
d1310b2e0cd98e Chris Mason        2008-01-24  1111  
f8ed4852f3a924 Christoph Hellwig  2023-02-27  1112  		if (bio_ctrl->compress_type != compress_type) {
c9bc621fb4988d Christoph Hellwig  2023-02-27  1113  			submit_one_bio(bio_ctrl);
f8ed4852f3a924 Christoph Hellwig  2023-02-27  1114  			bio_ctrl->compress_type = compress_type;
f8ed4852f3a924 Christoph Hellwig  2023-02-27  1115  		}
c9bc621fb4988d Christoph Hellwig  2023-02-27  1116  
eb8d0c6d042fbe Christoph Hellwig  2023-02-27  1117  		if (force_bio_submit)
eb8d0c6d042fbe Christoph Hellwig  2023-02-27  1118  			submit_one_bio(bio_ctrl);
551733372fda4c Christoph Hellwig  2023-02-27  1119  		submit_extent_page(bio_ctrl, disk_bytenr, page, iosize,
f8ed4852f3a924 Christoph Hellwig  2023-02-27  1120  				   pg_offset);
d1310b2e0cd98e Chris Mason        2008-01-24  1121  		cur = cur + iosize;
306e16ce13c0f3 David Sterba       2011-04-19  1122  		pg_offset += iosize;
d1310b2e0cd98e Chris Mason        2008-01-24  1123  	}
551733372fda4c Christoph Hellwig  2023-02-27  1124  
551733372fda4c Christoph Hellwig  2023-02-27  1125  	return 0;
d1310b2e0cd98e Chris Mason        2008-01-24  1126  }
d1310b2e0cd98e Chris Mason        2008-01-24  1127  

:::::: The code at line 970 was first introduced by commit
:::::: 7066bae048944fa2fd2bca91e390926bc285b7de btrfs: remove the pg_offset parameter from btrfs_get_extent()

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
