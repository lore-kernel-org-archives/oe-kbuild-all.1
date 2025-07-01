Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC283D69
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751404005; cv=none; b=EKSQlF0HReDvUxJNM86i46a5GREU5VjFmf43yTxZbsRoG/e8GvON1WvqEyExNGcdWFHL5TqBk5W7r3mNP/YWDgQv76EQisK4um1Xo2+9CSdCC6cqBL4dUfOrbqVvDg/snJ8cWAo0Mcd5kWj8gq/k1xj6+dEJcP+MvjXY4UqKhoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751404005; c=relaxed/simple;
	bh=PqIXXGqUDqryYxsL5cHYuNwovOnoFcQyiCjrLee1e60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hWW0YMVunLmdIyMvPcpCfEr8wyR3Zn51zrl3xoWLdqnciC7EVAfyHsGSqdbT5r+gqN/VqZCT8GLPsf0zttGrBpPJf+wlRcveRUQsP7q3i8WJLqjJB4qX78HQxu/4BSWoy7l2d+RAfpH13dcMzlN0xvl6B4l0WhtiW5x95SOwVN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6um7OSw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6um7OSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751404003; x=1782940003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PqIXXGqUDqryYxsL5cHYuNwovOnoFcQyiCjrLee1e60=;
  b=M6um7OSwXLeLfePZSgKDTXwZsFWAWzolIVJ4qQG6oaeNQkCUcbdCGEgl
   F3k7LiY7sl4Yt52cwDL8j2BxgFq/0kSj49dopyUsLmlkVgbzo3/YdVjti
   tAMjvc/oeBrltAEdJRqZB6LbcI1r0YX8g4hUmQ6iWZRtPd9l13W17L/oY
   If41QaTSQDI1V2GwGXJdj8rRw5LM/Z9A2tXH/mnEEQN2RkLQ+MfFpJ0OV
   +zaMuxXVKr0tJftmEh+fsjJ8O1vHdX8kWvLblOKZMlp/m4mvqP7/uln97
   QHVYYhVQal1LQKxi7qMaUJaNhhFO8dHK8lxWnpEMni4MpUccSRclbdpNQ
   w==;
X-CSE-ConnectionGUID: Tpx0qiVBSxS5eHwojxJzMA==
X-CSE-MsgGUID: /g0nkogRTLC6zmBTJWuMfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52800079"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="52800079"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 14:06:42 -0700
X-CSE-ConnectionGUID: E6NTWtk/TEOF4cA02OALjg==
X-CSE-MsgGUID: vm2oGgUBQLu5eBMd7sVe4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153643532"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2025 14:06:41 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWiBa-000097-0u;
	Tue, 01 Jul 2025 21:06:38 +0000
Date: Tue, 1 Jul 2025 23:06:14 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605]
 fs/btrfs/compression.c:531:25: warning: variable 'tree' set but not used
Message-ID: <202507012345.5Oo8Ma9A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   890108d01fde2c3b6dde4d169b695ce64362f135
commit: 00032d38eaa89c76de7d9c1ae6de8c48c14edd74 [1605/1605] btrfs: drop extent_io_ops::merge_bio_hook callback
config: x86_64-buildonly-randconfig-2001-20250501 (https://download.01.org/0day-ci/archive/20250701/202507012345.5Oo8Ma9A-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507012345.5Oo8Ma9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507012345.5Oo8Ma9A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/compression.c:417:16: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
     417 |         unsigned long nr_pages = 0;
         |                       ^
>> fs/btrfs/compression.c:531:25: warning: variable 'tree' set but not used [-Wunused-but-set-variable]
     531 |         struct extent_io_tree *tree;
         |                                ^
   2 warnings generated.
   fs/btrfs/compression.o: warning: objtool: missing symbol for section .init.text


vim +/tree +531 fs/btrfs/compression.c

771ed689d2cd53 Chris Mason        2008-11-06  515  
c8b978188c9a0f Chris Mason        2008-10-29  516  /*
c8b978188c9a0f Chris Mason        2008-10-29  517   * for a compressed read, the bio we get passed has all the inode pages
c8b978188c9a0f Chris Mason        2008-10-29  518   * in it.  We don't actually do IO on those pages but allocate new ones
c8b978188c9a0f Chris Mason        2008-10-29  519   * to hold the compressed pages on disk.
c8b978188c9a0f Chris Mason        2008-10-29  520   *
4f024f3797c43c Kent Overstreet    2013-10-11  521   * bio->bi_iter.bi_sector points to the compressed extent on disk
c8b978188c9a0f Chris Mason        2008-10-29  522   * bio->bi_io_vec points to all of the inode pages
c8b978188c9a0f Chris Mason        2008-10-29  523   *
c8b978188c9a0f Chris Mason        2008-10-29  524   * After the compressed pages are read, we copy the bytes into the
c8b978188c9a0f Chris Mason        2008-10-29  525   * bio we were passed and then call the bio end_io calls
c8b978188c9a0f Chris Mason        2008-10-29  526   */
4e4cbee93d5613 Christoph Hellwig  2017-06-03  527  blk_status_t btrfs_submit_compressed_read(struct inode *inode, struct bio *bio,
c8b978188c9a0f Chris Mason        2008-10-29  528  				 int mirror_num, unsigned long bio_flags)
c8b978188c9a0f Chris Mason        2008-10-29  529  {
0b246afa62b0cf Jeff Mahoney       2016-06-22  530  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
c8b978188c9a0f Chris Mason        2008-10-29 @531  	struct extent_io_tree *tree;
c8b978188c9a0f Chris Mason        2008-10-29  532  	struct extent_map_tree *em_tree;
c8b978188c9a0f Chris Mason        2008-10-29  533  	struct compressed_bio *cb;
c8b978188c9a0f Chris Mason        2008-10-29  534  	unsigned long compressed_len;
c8b978188c9a0f Chris Mason        2008-10-29  535  	unsigned long nr_pages;
306e16ce13c0f3 David Sterba       2011-04-19  536  	unsigned long pg_index;
c8b978188c9a0f Chris Mason        2008-10-29  537  	struct page *page;
c8b978188c9a0f Chris Mason        2008-10-29  538  	struct block_device *bdev;
c8b978188c9a0f Chris Mason        2008-10-29  539  	struct bio *comp_bio;
4f024f3797c43c Kent Overstreet    2013-10-11  540  	u64 cur_disk_byte = (u64)bio->bi_iter.bi_sector << 9;
e04ca626baee68 Chris Mason        2008-11-10  541  	u64 em_len;
e04ca626baee68 Chris Mason        2008-11-10  542  	u64 em_start;
c8b978188c9a0f Chris Mason        2008-10-29  543  	struct extent_map *em;
4e4cbee93d5613 Christoph Hellwig  2017-06-03  544  	blk_status_t ret = BLK_STS_RESOURCE;
15e3004a0eb2c4 Josef Bacik        2012-10-05  545  	int faili = 0;
d20f7043fa6565 Chris Mason        2008-12-08  546  	u32 *sums;
c8b978188c9a0f Chris Mason        2008-10-29  547  
c8b978188c9a0f Chris Mason        2008-10-29  548  	tree = &BTRFS_I(inode)->io_tree;
c8b978188c9a0f Chris Mason        2008-10-29  549  	em_tree = &BTRFS_I(inode)->extent_tree;
c8b978188c9a0f Chris Mason        2008-10-29  550  
c8b978188c9a0f Chris Mason        2008-10-29  551  	/* we need the actual starting offset of this extent in the file */
890871be854b5f Chris Mason        2009-09-02  552  	read_lock(&em_tree->lock);
c8b978188c9a0f Chris Mason        2008-10-29  553  	em = lookup_extent_mapping(em_tree,
263663cd3c4fbf Ming Lei           2017-12-18  554  				   page_offset(bio_first_page_all(bio)),
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  555  				   PAGE_SIZE);
890871be854b5f Chris Mason        2009-09-02  556  	read_unlock(&em_tree->lock);
285190d99fef69 Tsutomu Itoh       2012-02-16  557  	if (!em)
4e4cbee93d5613 Christoph Hellwig  2017-06-03  558  		return BLK_STS_IOERR;
c8b978188c9a0f Chris Mason        2008-10-29  559  
d20f7043fa6565 Chris Mason        2008-12-08  560  	compressed_len = em->block_len;
2ff7e61e0d30ff Jeff Mahoney       2016-06-22  561  	cb = kmalloc(compressed_bio_size(fs_info, compressed_len), GFP_NOFS);
6b82ce8d824bd4 liubo              2011-01-26  562  	if (!cb)
6b82ce8d824bd4 liubo              2011-01-26  563  		goto out;
6b82ce8d824bd4 liubo              2011-01-26  564  
a50299ae7cc4ba Elena Reshetova    2017-03-03  565  	refcount_set(&cb->pending_bios, 0);
c8b978188c9a0f Chris Mason        2008-10-29  566  	cb->errors = 0;
c8b978188c9a0f Chris Mason        2008-10-29  567  	cb->inode = inode;
d20f7043fa6565 Chris Mason        2008-12-08  568  	cb->mirror_num = mirror_num;
d20f7043fa6565 Chris Mason        2008-12-08  569  	sums = &cb->sums;
c8b978188c9a0f Chris Mason        2008-10-29  570  
ff5b7ee33d8241 Yan Zheng          2008-11-10  571  	cb->start = em->orig_start;
e04ca626baee68 Chris Mason        2008-11-10  572  	em_len = em->len;
e04ca626baee68 Chris Mason        2008-11-10  573  	em_start = em->start;
d20f7043fa6565 Chris Mason        2008-12-08  574  
c8b978188c9a0f Chris Mason        2008-10-29  575  	free_extent_map(em);
e04ca626baee68 Chris Mason        2008-11-10  576  	em = NULL;
c8b978188c9a0f Chris Mason        2008-10-29  577  
81381053d094a3 Christoph Hellwig  2016-11-25  578  	cb->len = bio->bi_iter.bi_size;
c8b978188c9a0f Chris Mason        2008-10-29  579  	cb->compressed_len = compressed_len;
261507a02ccba9 Li Zefan           2010-12-17  580  	cb->compress_type = extent_compress_type(bio_flags);
c8b978188c9a0f Chris Mason        2008-10-29  581  	cb->orig_bio = bio;
c8b978188c9a0f Chris Mason        2008-10-29  582  
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  583  	nr_pages = DIV_ROUND_UP(compressed_len, PAGE_SIZE);
31e818fe7375d6 David Sterba       2015-02-20  584  	cb->compressed_pages = kcalloc(nr_pages, sizeof(struct page *),
c8b978188c9a0f Chris Mason        2008-10-29  585  				       GFP_NOFS);
6b82ce8d824bd4 liubo              2011-01-26  586  	if (!cb->compressed_pages)
6b82ce8d824bd4 liubo              2011-01-26  587  		goto fail1;
6b82ce8d824bd4 liubo              2011-01-26  588  
0b246afa62b0cf Jeff Mahoney       2016-06-22  589  	bdev = fs_info->fs_devices->latest_bdev;
c8b978188c9a0f Chris Mason        2008-10-29  590  
306e16ce13c0f3 David Sterba       2011-04-19  591  	for (pg_index = 0; pg_index < nr_pages; pg_index++) {
306e16ce13c0f3 David Sterba       2011-04-19  592  		cb->compressed_pages[pg_index] = alloc_page(GFP_NOFS |
c8b978188c9a0f Chris Mason        2008-10-29  593  							      __GFP_HIGHMEM);
15e3004a0eb2c4 Josef Bacik        2012-10-05  594  		if (!cb->compressed_pages[pg_index]) {
15e3004a0eb2c4 Josef Bacik        2012-10-05  595  			faili = pg_index - 1;
0e9350de2ecdf2 Dan Carpenter      2017-06-19  596  			ret = BLK_STS_RESOURCE;
6b82ce8d824bd4 liubo              2011-01-26  597  			goto fail2;
c8b978188c9a0f Chris Mason        2008-10-29  598  		}
15e3004a0eb2c4 Josef Bacik        2012-10-05  599  	}
15e3004a0eb2c4 Josef Bacik        2012-10-05  600  	faili = nr_pages - 1;
c8b978188c9a0f Chris Mason        2008-10-29  601  	cb->nr_pages = nr_pages;
c8b978188c9a0f Chris Mason        2008-10-29  602  
e04ca626baee68 Chris Mason        2008-11-10  603  	add_ra_bio_pages(inode, em_start + em_len, cb);
771ed689d2cd53 Chris Mason        2008-11-06  604  
771ed689d2cd53 Chris Mason        2008-11-06  605  	/* include any pages we added in add_ra-bio_pages */
81381053d094a3 Christoph Hellwig  2016-11-25  606  	cb->len = bio->bi_iter.bi_size;
771ed689d2cd53 Chris Mason        2008-11-06  607  
c821e7f3daa4d0 David Sterba       2017-06-02  608  	comp_bio = btrfs_bio_alloc(bdev, cur_disk_byte);
ebcc326316f3d7 David Sterba       2018-06-29  609  	comp_bio->bi_opf = REQ_OP_READ;
c8b978188c9a0f Chris Mason        2008-10-29  610  	comp_bio->bi_private = cb;
c8b978188c9a0f Chris Mason        2008-10-29  611  	comp_bio->bi_end_io = end_compressed_bio_read;
a50299ae7cc4ba Elena Reshetova    2017-03-03  612  	refcount_set(&cb->pending_bios, 1);
c8b978188c9a0f Chris Mason        2008-10-29  613  
306e16ce13c0f3 David Sterba       2011-04-19  614  	for (pg_index = 0; pg_index < nr_pages; pg_index++) {
4e4cbee93d5613 Christoph Hellwig  2017-06-03  615  		int submit = 0;
4e4cbee93d5613 Christoph Hellwig  2017-06-03  616  
306e16ce13c0f3 David Sterba       2011-04-19  617  		page = cb->compressed_pages[pg_index];
c8b978188c9a0f Chris Mason        2008-10-29  618  		page->mapping = inode->i_mapping;
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  619  		page->index = em_start >> PAGE_SHIFT;
d20f7043fa6565 Chris Mason        2008-12-08  620  
4f024f3797c43c Kent Overstreet    2013-10-11  621  		if (comp_bio->bi_iter.bi_size)
00032d38eaa89c David Sterba       2018-07-18  622  			submit = btrfs_merge_bio_hook(page, 0, PAGE_SIZE,
c8b978188c9a0f Chris Mason        2008-10-29  623  					comp_bio, 0);
c8b978188c9a0f Chris Mason        2008-10-29  624  
70b99e6959a4c2 Chris Mason        2008-10-31  625  		page->mapping = NULL;
4e4cbee93d5613 Christoph Hellwig  2017-06-03  626  		if (submit || bio_add_page(comp_bio, page, PAGE_SIZE, 0) <
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  627  		    PAGE_SIZE) {
0b246afa62b0cf Jeff Mahoney       2016-06-22  628  			ret = btrfs_bio_wq_end_io(fs_info, comp_bio,
bfebd8b5441755 David Sterba       2014-07-30  629  						  BTRFS_WQ_ENDIO_DATA);
79787eaab46121 Jeff Mahoney       2012-03-12  630  			BUG_ON(ret); /* -ENOMEM */
c8b978188c9a0f Chris Mason        2008-10-29  631  
af09abfece59aa Chris Mason        2008-11-07  632  			/*
af09abfece59aa Chris Mason        2008-11-07  633  			 * inc the count before we submit the bio so
af09abfece59aa Chris Mason        2008-11-07  634  			 * we know the end IO handler won't happen before
af09abfece59aa Chris Mason        2008-11-07  635  			 * we inc the count.  Otherwise, the cb might get
af09abfece59aa Chris Mason        2008-11-07  636  			 * freed before we're done setting it up
af09abfece59aa Chris Mason        2008-11-07  637  			 */
a50299ae7cc4ba Elena Reshetova    2017-03-03  638  			refcount_inc(&cb->pending_bios);
af09abfece59aa Chris Mason        2008-11-07  639  
6cbff00f4632c8 Christoph Hellwig  2009-04-17  640  			if (!(BTRFS_I(inode)->flags & BTRFS_INODE_NODATASUM)) {
2ff7e61e0d30ff Jeff Mahoney       2016-06-22  641  				ret = btrfs_lookup_bio_sums(inode, comp_bio,
2ff7e61e0d30ff Jeff Mahoney       2016-06-22  642  							    sums);
79787eaab46121 Jeff Mahoney       2012-03-12  643  				BUG_ON(ret); /* -ENOMEM */
d20f7043fa6565 Chris Mason        2008-12-08  644  			}
ed6078f70335f1 David Sterba       2014-06-05  645  			sums += DIV_ROUND_UP(comp_bio->bi_iter.bi_size,
0b246afa62b0cf Jeff Mahoney       2016-06-22  646  					     fs_info->sectorsize);
d20f7043fa6565 Chris Mason        2008-12-08  647  
2ff7e61e0d30ff Jeff Mahoney       2016-06-22  648  			ret = btrfs_map_bio(fs_info, comp_bio, mirror_num, 0);
4246a0b63bd8f5 Christoph Hellwig  2015-07-20  649  			if (ret) {
4e4cbee93d5613 Christoph Hellwig  2017-06-03  650  				comp_bio->bi_status = ret;
4246a0b63bd8f5 Christoph Hellwig  2015-07-20  651  				bio_endio(comp_bio);
4246a0b63bd8f5 Christoph Hellwig  2015-07-20  652  			}
c8b978188c9a0f Chris Mason        2008-10-29  653  
c821e7f3daa4d0 David Sterba       2017-06-02  654  			comp_bio = btrfs_bio_alloc(bdev, cur_disk_byte);
ebcc326316f3d7 David Sterba       2018-06-29  655  			comp_bio->bi_opf = REQ_OP_READ;
771ed689d2cd53 Chris Mason        2008-11-06  656  			comp_bio->bi_private = cb;
771ed689d2cd53 Chris Mason        2008-11-06  657  			comp_bio->bi_end_io = end_compressed_bio_read;
771ed689d2cd53 Chris Mason        2008-11-06  658  
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  659  			bio_add_page(comp_bio, page, PAGE_SIZE, 0);
c8b978188c9a0f Chris Mason        2008-10-29  660  		}
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  661  		cur_disk_byte += PAGE_SIZE;
c8b978188c9a0f Chris Mason        2008-10-29  662  	}
c8b978188c9a0f Chris Mason        2008-10-29  663  
0b246afa62b0cf Jeff Mahoney       2016-06-22  664  	ret = btrfs_bio_wq_end_io(fs_info, comp_bio, BTRFS_WQ_ENDIO_DATA);
79787eaab46121 Jeff Mahoney       2012-03-12  665  	BUG_ON(ret); /* -ENOMEM */
c8b978188c9a0f Chris Mason        2008-10-29  666  
c2db1073fdf975 Tsutomu Itoh       2011-03-01  667  	if (!(BTRFS_I(inode)->flags & BTRFS_INODE_NODATASUM)) {
2ff7e61e0d30ff Jeff Mahoney       2016-06-22  668  		ret = btrfs_lookup_bio_sums(inode, comp_bio, sums);
79787eaab46121 Jeff Mahoney       2012-03-12  669  		BUG_ON(ret); /* -ENOMEM */
c2db1073fdf975 Tsutomu Itoh       2011-03-01  670  	}
d20f7043fa6565 Chris Mason        2008-12-08  671  
2ff7e61e0d30ff Jeff Mahoney       2016-06-22  672  	ret = btrfs_map_bio(fs_info, comp_bio, mirror_num, 0);
4246a0b63bd8f5 Christoph Hellwig  2015-07-20  673  	if (ret) {
4e4cbee93d5613 Christoph Hellwig  2017-06-03  674  		comp_bio->bi_status = ret;
4246a0b63bd8f5 Christoph Hellwig  2015-07-20  675  		bio_endio(comp_bio);
4246a0b63bd8f5 Christoph Hellwig  2015-07-20  676  	}
c8b978188c9a0f Chris Mason        2008-10-29  677  
c8b978188c9a0f Chris Mason        2008-10-29  678  	return 0;
6b82ce8d824bd4 liubo              2011-01-26  679  
6b82ce8d824bd4 liubo              2011-01-26  680  fail2:
15e3004a0eb2c4 Josef Bacik        2012-10-05  681  	while (faili >= 0) {
15e3004a0eb2c4 Josef Bacik        2012-10-05  682  		__free_page(cb->compressed_pages[faili]);
15e3004a0eb2c4 Josef Bacik        2012-10-05  683  		faili--;
15e3004a0eb2c4 Josef Bacik        2012-10-05  684  	}
6b82ce8d824bd4 liubo              2011-01-26  685  
6b82ce8d824bd4 liubo              2011-01-26  686  	kfree(cb->compressed_pages);
6b82ce8d824bd4 liubo              2011-01-26  687  fail1:
6b82ce8d824bd4 liubo              2011-01-26  688  	kfree(cb);
6b82ce8d824bd4 liubo              2011-01-26  689  out:
6b82ce8d824bd4 liubo              2011-01-26  690  	free_extent_map(em);
6b82ce8d824bd4 liubo              2011-01-26  691  	return ret;
c8b978188c9a0f Chris Mason        2008-10-29  692  }
261507a02ccba9 Li Zefan           2010-12-17  693  

:::::: The code at line 531 was first introduced by commit
:::::: c8b978188c9a0fd3d535c13debd19d522b726f1f Btrfs: Add zlib compression support

:::::: TO: Chris Mason <chris.mason@oracle.com>
:::::: CC: Chris Mason <chris.mason@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
