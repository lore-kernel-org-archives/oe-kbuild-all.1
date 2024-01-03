Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032A1D557
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELaGdyOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704315912; x=1735851912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I9nscGmELNsaMPiMjkcSVuRU036l4hnHeQDEjaIAoXs=;
  b=ELaGdyObX0z8C10gl3k9OKKegBrPUJisUAKejToWSO9Rbk8ZlFb/rkQ7
   OQ3/tJ0co0MdI4mNaDwZI6rZAlTsYc4/a6rPxGmI9oRoBA93fWu6IfqUx
   JhwMGiv14Fzt+5PgIpKFtginJutaoeYqq9BX6qQjw8jTDQUlmsIpss7H/
   lq6iaYiZSZSnenVrsAjNU+xgcAvuu1d4VQgDoUwJpbZaal8qH2L5pLn3d
   u6RBDRUAmnmV4IjSBYcYbVcLs4eBIVU/uVeLwycdFILIIVxZoPfmdCKhK
   zq2dTKCRuDR5uRDL11B+uBaUkOUe/SVpRZXuAxIpIRraNbu4pAF9OyOBR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="399851080"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="399851080"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 13:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="845991616"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="845991616"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 03 Jan 2024 13:05:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL8QF-000MZc-0p;
	Wed, 03 Jan 2024 21:05:07 +0000
Date: Thu, 4 Jan 2024 05:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file 41/42] fs/mpage.c:485:30: warning:
 variable 'boundary_bdev' set but not used
Message-ID: <202401040414.W8CWeh2A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file
head:   81a0b5d317a5188e7e8aaf68adf070d44c7a3eea
commit: 6d26064a464a6f8ace90a2176a17bd6f853825e0 [41/42] [DRAFT] buffer: port block device access to files and get rid of bd_inode access
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240104/202401040414.W8CWeh2A-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040414.W8CWeh2A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040414.W8CWeh2A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/mpage.c: In function '__mpage_writepage':
>> fs/mpage.c:485:30: warning: variable 'boundary_bdev' set but not used [-Wunused-but-set-variable]
     485 |         struct block_device *boundary_bdev = NULL;
         |                              ^~~~~~~~~~~~~
--
>> fs/buffer.c:1423: warning: Function parameter or member 'f_bdev' not described in 'bdev_getblk'
>> fs/buffer.c:1423: warning: Excess function parameter 'bdev' description in 'bdev_getblk'
>> fs/buffer.c:1464: warning: Function parameter or member 'f_bdev' not described in '__bread_gfp'
>> fs/buffer.c:1464: warning: Excess function parameter 'bdev' description in '__bread_gfp'
>> fs/buffer.c:1700: warning: Function parameter or member 'f_bdev' not described in 'clean_bdev_aliases'
>> fs/buffer.c:1700: warning: Excess function parameter 'bdev' description in 'clean_bdev_aliases'
--
>> fs/jbd2/journal.c:1649: warning: Function parameter or member 'f_bdev' not described in 'jbd2_journal_init_dev'
>> fs/jbd2/journal.c:1649: warning: Excess function parameter 'bdev' description in 'jbd2_journal_init_dev'


vim +/boundary_bdev +485 fs/mpage.c

f892760aa66a2d Matthew Wilcox          2017-10-13  467  
d585bdbeb79aa1 Matthew Wilcox (Oracle  2023-01-26  468) static int __mpage_writepage(struct folio *folio, struct writeback_control *wbc,
0ea97180162518 Miklos Szeredi          2007-05-10  469  		      void *data)
^1da177e4c3f41 Linus Torvalds          2005-04-16  470  {
0ea97180162518 Miklos Szeredi          2007-05-10  471  	struct mpage_data *mpd = data;
0ea97180162518 Miklos Szeredi          2007-05-10  472  	struct bio *bio = mpd->bio;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  473) 	struct address_space *mapping = folio->mapping;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  474) 	struct inode *inode = mapping->host;
^1da177e4c3f41 Linus Torvalds          2005-04-16  475  	const unsigned blkbits = inode->i_blkbits;
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  476  	const unsigned blocks_per_page = PAGE_SIZE >> blkbits;
^1da177e4c3f41 Linus Torvalds          2005-04-16  477  	sector_t last_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  478  	sector_t block_in_file;
^1da177e4c3f41 Linus Torvalds          2005-04-16  479  	sector_t blocks[MAX_BUF_PER_PAGE];
^1da177e4c3f41 Linus Torvalds          2005-04-16  480  	unsigned page_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  481  	unsigned first_unmapped = blocks_per_page;
^1da177e4c3f41 Linus Torvalds          2005-04-16  482  	struct block_device *bdev = NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  483  	int boundary = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  484  	sector_t boundary_block = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16 @485  	struct block_device *boundary_bdev = NULL;
6d26064a464a6f Christian Brauner       2024-01-02  486  	struct file *f_boundary_bdev = NULL;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  487) 	size_t length;
^1da177e4c3f41 Linus Torvalds          2005-04-16  488  	struct buffer_head map_bh;
^1da177e4c3f41 Linus Torvalds          2005-04-16  489  	loff_t i_size = i_size_read(inode);
0ea97180162518 Miklos Szeredi          2007-05-10  490  	int ret = 0;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  491) 	struct buffer_head *head = folio_buffers(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  492  
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  493) 	if (head) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  494  		struct buffer_head *bh = head;
^1da177e4c3f41 Linus Torvalds          2005-04-16  495  
^1da177e4c3f41 Linus Torvalds          2005-04-16  496  		/* If they're all mapped and dirty, do it */
^1da177e4c3f41 Linus Torvalds          2005-04-16  497  		page_block = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  498  		do {
^1da177e4c3f41 Linus Torvalds          2005-04-16  499  			BUG_ON(buffer_locked(bh));
^1da177e4c3f41 Linus Torvalds          2005-04-16  500  			if (!buffer_mapped(bh)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  501  				/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  502  				 * unmapped dirty buffers are created by
e621900ad28b74 Matthew Wilcox (Oracle  2022-02-09  503) 				 * block_dirty_folio -> mmapped data
^1da177e4c3f41 Linus Torvalds          2005-04-16  504  				 */
^1da177e4c3f41 Linus Torvalds          2005-04-16  505  				if (buffer_dirty(bh))
^1da177e4c3f41 Linus Torvalds          2005-04-16  506  					goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  507  				if (first_unmapped == blocks_per_page)
^1da177e4c3f41 Linus Torvalds          2005-04-16  508  					first_unmapped = page_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  509  				continue;
^1da177e4c3f41 Linus Torvalds          2005-04-16  510  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  511  
^1da177e4c3f41 Linus Torvalds          2005-04-16  512  			if (first_unmapped != blocks_per_page)
^1da177e4c3f41 Linus Torvalds          2005-04-16  513  				goto confused;	/* hole -> non-hole */
^1da177e4c3f41 Linus Torvalds          2005-04-16  514  
^1da177e4c3f41 Linus Torvalds          2005-04-16  515  			if (!buffer_dirty(bh) || !buffer_uptodate(bh))
^1da177e4c3f41 Linus Torvalds          2005-04-16  516  				goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  517  			if (page_block) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  518  				if (bh->b_blocknr != blocks[page_block-1] + 1)
^1da177e4c3f41 Linus Torvalds          2005-04-16  519  					goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  520  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  521  			blocks[page_block++] = bh->b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  522  			boundary = buffer_boundary(bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  523  			if (boundary) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  524  				boundary_block = bh->b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  525  				boundary_bdev = bh->b_bdev;
6d26064a464a6f Christian Brauner       2024-01-02  526  				f_boundary_bdev = bh->f_b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  527  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  528  			bdev = bh->b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  529  		} while ((bh = bh->b_this_page) != head);
^1da177e4c3f41 Linus Torvalds          2005-04-16  530  
^1da177e4c3f41 Linus Torvalds          2005-04-16  531  		if (first_unmapped)
^1da177e4c3f41 Linus Torvalds          2005-04-16  532  			goto page_is_mapped;
^1da177e4c3f41 Linus Torvalds          2005-04-16  533  
^1da177e4c3f41 Linus Torvalds          2005-04-16  534  		/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  535  		 * Page has buffers, but they are all unmapped. The page was
^1da177e4c3f41 Linus Torvalds          2005-04-16  536  		 * created by pagein or read over a hole which was handled by
2c69e2057962b6 Matthew Wilcox (Oracle  2022-04-29  537) 		 * block_read_full_folio().  If this address_space is also
d4388340ae0bc8 Matthew Wilcox (Oracle  2020-06-01  538) 		 * using mpage_readahead then this can rarely happen.
^1da177e4c3f41 Linus Torvalds          2005-04-16  539  		 */
^1da177e4c3f41 Linus Torvalds          2005-04-16  540  		goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  541  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  542  
^1da177e4c3f41 Linus Torvalds          2005-04-16  543  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  544  	 * The page has no buffers: map it to disk
^1da177e4c3f41 Linus Torvalds          2005-04-16  545  	 */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  546) 	BUG_ON(!folio_test_uptodate(folio));
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  547) 	block_in_file = (sector_t)folio->index << (PAGE_SHIFT - blkbits);
4b89a37d54a0b5 Jan Kara                2023-01-03  548  	/*
4b89a37d54a0b5 Jan Kara                2023-01-03  549  	 * Whole page beyond EOF? Skip allocating blocks to avoid leaking
4b89a37d54a0b5 Jan Kara                2023-01-03  550  	 * space.
4b89a37d54a0b5 Jan Kara                2023-01-03  551  	 */
4b89a37d54a0b5 Jan Kara                2023-01-03  552  	if (block_in_file >= (i_size + (1 << blkbits) - 1) >> blkbits)
4b89a37d54a0b5 Jan Kara                2023-01-03  553  		goto page_is_mapped;
^1da177e4c3f41 Linus Torvalds          2005-04-16  554  	last_block = (i_size - 1) >> blkbits;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  555) 	map_bh.b_folio = folio;
^1da177e4c3f41 Linus Torvalds          2005-04-16  556  	for (page_block = 0; page_block < blocks_per_page; ) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  557  
^1da177e4c3f41 Linus Torvalds          2005-04-16  558  		map_bh.b_state = 0;
b0cf2321c65991 Badari Pulavarty        2006-03-26  559  		map_bh.b_size = 1 << blkbits;
0ea97180162518 Miklos Szeredi          2007-05-10  560  		if (mpd->get_block(inode, block_in_file, &map_bh, 1))
^1da177e4c3f41 Linus Torvalds          2005-04-16  561  			goto confused;
7010839ccfd4f8 Jan Kara                2023-01-25  562  		if (!buffer_mapped(&map_bh))
7010839ccfd4f8 Jan Kara                2023-01-25  563  			goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  564  		if (buffer_new(&map_bh))
e64855c6cfaa0a Jan Kara                2016-11-04  565  			clean_bdev_bh_alias(&map_bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  566  		if (buffer_boundary(&map_bh)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  567  			boundary_block = map_bh.b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  568  			boundary_bdev = map_bh.b_bdev;
6d26064a464a6f Christian Brauner       2024-01-02  569  			f_boundary_bdev = map_bh.f_b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  570  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  571  		if (page_block) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  572  			if (map_bh.b_blocknr != blocks[page_block-1] + 1)
^1da177e4c3f41 Linus Torvalds          2005-04-16  573  				goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  574  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  575  		blocks[page_block++] = map_bh.b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  576  		boundary = buffer_boundary(&map_bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  577  		bdev = map_bh.b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  578  		if (block_in_file == last_block)
^1da177e4c3f41 Linus Torvalds          2005-04-16  579  			break;
^1da177e4c3f41 Linus Torvalds          2005-04-16  580  		block_in_file++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  581  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  582  	BUG_ON(page_block == 0);
^1da177e4c3f41 Linus Torvalds          2005-04-16  583  
^1da177e4c3f41 Linus Torvalds          2005-04-16  584  	first_unmapped = page_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  585  
^1da177e4c3f41 Linus Torvalds          2005-04-16  586  page_is_mapped:
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  587) 	/* Don't bother writing beyond EOF, truncate will discard the folio */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  588) 	if (folio_pos(folio) >= i_size)
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  589) 		goto confused;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  590) 	length = folio_size(folio);
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  591) 	if (folio_pos(folio) + length > i_size) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  592  		/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  593  		 * The page straddles i_size.  It must be zeroed out on each
2a61aa40163852 Adam Buchbinder         2009-12-11  594  		 * and every writepage invocation because it may be mmapped.
^1da177e4c3f41 Linus Torvalds          2005-04-16  595  		 * "A file is mapped in multiples of the page size.  For a file
^1da177e4c3f41 Linus Torvalds          2005-04-16  596  		 * that is not a multiple of the page size, the remaining memory
^1da177e4c3f41 Linus Torvalds          2005-04-16  597  		 * is zeroed when mapped, and writes to that region are not
^1da177e4c3f41 Linus Torvalds          2005-04-16  598  		 * written out to the file."
^1da177e4c3f41 Linus Torvalds          2005-04-16  599  		 */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  600) 		length = i_size - folio_pos(folio);
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  601) 		folio_zero_segment(folio, length, folio_size(folio));
^1da177e4c3f41 Linus Torvalds          2005-04-16  602  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  603  
^1da177e4c3f41 Linus Torvalds          2005-04-16  604  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  605  	 * This page will go to BIO.  Do we need to send this BIO off first?
^1da177e4c3f41 Linus Torvalds          2005-04-16  606  	 */
0ea97180162518 Miklos Szeredi          2007-05-10  607  	if (bio && mpd->last_block_in_bio != blocks[0] - 1)
f0d6ca46d68670 Pankaj Raghav           2023-04-11  608  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  609  
^1da177e4c3f41 Linus Torvalds          2005-04-16  610  alloc_new:
^1da177e4c3f41 Linus Torvalds          2005-04-16  611  	if (bio == NULL) {
77c436de01c0f2 Christoph Hellwig       2022-02-22  612  		bio = bio_alloc(bdev, BIO_MAX_VECS,
77c436de01c0f2 Christoph Hellwig       2022-02-22  613  				REQ_OP_WRITE | wbc_to_write_flags(wbc),
77c436de01c0f2 Christoph Hellwig       2022-02-22  614  				GFP_NOFS);
d5f68a42da7a45 Christoph Hellwig       2022-01-24  615  		bio->bi_iter.bi_sector = blocks[0] << (blkbits - 9);
b16b1deb553adc Tejun Heo               2015-06-02  616  		wbc_init_bio(wbc, bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  617  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  618  
^1da177e4c3f41 Linus Torvalds          2005-04-16  619  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  620  	 * Must try to add the page before marking the buffer clean or
^1da177e4c3f41 Linus Torvalds          2005-04-16  621  	 * the confused fail path above (OOM) will be very confused when
^1da177e4c3f41 Linus Torvalds          2005-04-16  622  	 * it finds all bh marked clean (i.e. it will not write anything)
^1da177e4c3f41 Linus Torvalds          2005-04-16  623  	 */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  624) 	wbc_account_cgroup_owner(wbc, &folio->page, folio_size(folio));
^1da177e4c3f41 Linus Torvalds          2005-04-16  625  	length = first_unmapped << blkbits;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  626) 	if (!bio_add_folio(bio, folio, length, 0)) {
f0d6ca46d68670 Pankaj Raghav           2023-04-11  627  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  628  		goto alloc_new;
^1da177e4c3f41 Linus Torvalds          2005-04-16  629  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  630  
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  631) 	clean_buffers(&folio->page, first_unmapped);
^1da177e4c3f41 Linus Torvalds          2005-04-16  632  
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  633) 	BUG_ON(folio_test_writeback(folio));
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  634) 	folio_start_writeback(folio);
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  635) 	folio_unlock(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  636  	if (boundary || (first_unmapped != blocks_per_page)) {
f0d6ca46d68670 Pankaj Raghav           2023-04-11  637  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  638  		if (boundary_block) {
6d26064a464a6f Christian Brauner       2024-01-02  639  			write_boundary_block(f_boundary_bdev,
^1da177e4c3f41 Linus Torvalds          2005-04-16  640  					boundary_block, 1 << blkbits);
^1da177e4c3f41 Linus Torvalds          2005-04-16  641  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  642  	} else {
0ea97180162518 Miklos Szeredi          2007-05-10  643  		mpd->last_block_in_bio = blocks[blocks_per_page - 1];
^1da177e4c3f41 Linus Torvalds          2005-04-16  644  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  645  	goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  646  
^1da177e4c3f41 Linus Torvalds          2005-04-16  647  confused:
^1da177e4c3f41 Linus Torvalds          2005-04-16  648  	if (bio)
f0d6ca46d68670 Pankaj Raghav           2023-04-11  649  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  650  
^1da177e4c3f41 Linus Torvalds          2005-04-16  651  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  652  	 * The caller has a ref on the inode, so *mapping is stable
^1da177e4c3f41 Linus Torvalds          2005-04-16  653  	 */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  654) 	ret = block_write_full_page(&folio->page, mpd->get_block, wbc);
0ea97180162518 Miklos Szeredi          2007-05-10  655  	mapping_set_error(mapping, ret);
^1da177e4c3f41 Linus Torvalds          2005-04-16  656  out:
0ea97180162518 Miklos Szeredi          2007-05-10  657  	mpd->bio = bio;
0ea97180162518 Miklos Szeredi          2007-05-10  658  	return ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  659  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  660  

:::::: The code at line 485 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
