Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE7BDF6C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706436031; cv=none; b=pH4yJVJuSPmgTxSnsMwha/qBdy+N2ADhXyT4WMMjIIijrtlF/6AosK5eOmltdhKT786Xkt6C3/ZhMlrbmY+GcSEFLHX/Lva2hxZWeKVtx3NdsmsgslPHQfaG0jZmc70f16dIh6ALmDD1Vy22bUUMDVLbjRHNDCqaZADHmSBlgsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706436031; c=relaxed/simple;
	bh=ROx9bZWyFdJ7rGiK+LFU6FhSQcdi2ce3xc+GPxyb6XI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mAHZhqPWoi01lNiFfVH9P0YrqEaEYQ1ulaLuF8qDLFzA9R6qM7jrYOWZdqQsiTPcgQFF0LlIAFINN4hoWwYnlNLhz2ST44ijZ2lp9btkFhqlhYOF0QEG0hA1PMB6wLIQ0RzfQV9QlDH/cDTX9bm6vnRoL8IY00hCWMWEtPFWZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/4xNfKr; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/4xNfKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706436028; x=1737972028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ROx9bZWyFdJ7rGiK+LFU6FhSQcdi2ce3xc+GPxyb6XI=;
  b=b/4xNfKrRrlxWnaxCoN54mCUCKQ6LWYHo69x1ZIOcR7tkiOHeSVfQ98y
   dZr55WP+nexSCz3wMFoVB7CZquNwIetbsLJ8F8C4nsmeefz9FRsRNu07M
   VA6ydz4+jGSNvfDJ1PYLILkeYaHYGoTWHgWipYxhXdjuarl7Wh1jQhz5i
   LB7fIJP4DMhI8doCsNBwVeXbbpDRP09sux0BkzGqhcMXBWvVTLh3w7Lln
   3T/KavYgiQ4al32GLP/qi5ZETcEmkDMH3yG8kyeIbaU8AM7RiRkWGC19i
   C9qyHwPcvKIX7CqBo914zO+694+/lbnpeDNBlzdVi+og1DVaJJEe4jfeC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="393190678"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393190678"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 02:00:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3131963"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2024 02:00:23 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU1xd-0003JA-0t;
	Sun, 28 Jan 2024 10:00:21 +0000
Date: Sun, 28 Jan 2024 17:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:buffered.46 89/90] fs/btrfs/compression.c:390:13: warning:
 variable 'em_start' set but not used
Message-ID: <202401281746.SO8O5kw3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux buffered.46
head:   9b93fddebc916105169c8a82d8f3f20fb30ff277
commit: 130adc41eba33396b72c405d403e80da56be7b24 [89/90] btrfs: remove readahead compression handling
config: i386-buildonly-randconfig-002-20240127 (https://download.01.org/0day-ci/archive/20240128/202401281746.SO8O5kw3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281746.SO8O5kw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281746.SO8O5kw3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/compression.c: In function 'btrfs_submit_compressed_read':
>> fs/btrfs/compression.c:390:13: warning: variable 'em_start' set but not used [-Wunused-but-set-variable]
     390 |         u64 em_start;
         |             ^~~~~~~~
>> fs/btrfs/compression.c:389:13: warning: variable 'em_len' set but not used [-Wunused-but-set-variable]
     389 |         u64 em_len;
         |             ^~~~~~


vim +/em_start +390 fs/btrfs/compression.c

c8b978188c9a0f Chris Mason       2008-10-29  369  
c8b978188c9a0f Chris Mason       2008-10-29  370  /*
c8b978188c9a0f Chris Mason       2008-10-29  371   * for a compressed read, the bio we get passed has all the inode pages
c8b978188c9a0f Chris Mason       2008-10-29  372   * in it.  We don't actually do IO on those pages but allocate new ones
c8b978188c9a0f Chris Mason       2008-10-29  373   * to hold the compressed pages on disk.
c8b978188c9a0f Chris Mason       2008-10-29  374   *
4f024f3797c43c Kent Overstreet   2013-10-11  375   * bio->bi_iter.bi_sector points to the compressed extent on disk
c8b978188c9a0f Chris Mason       2008-10-29  376   * bio->bi_io_vec points to all of the inode pages
c8b978188c9a0f Chris Mason       2008-10-29  377   *
c8b978188c9a0f Chris Mason       2008-10-29  378   * After the compressed pages are read, we copy the bytes into the
c8b978188c9a0f Chris Mason       2008-10-29  379   * bio we were passed and then call the bio end_io calls
c8b978188c9a0f Chris Mason       2008-10-29  380   */
e19493107675d4 Christoph Hellwig 2023-05-03  381  void btrfs_submit_compressed_read(struct btrfs_bio *bbio)
c8b978188c9a0f Chris Mason       2008-10-29  382  {
690834e47cf786 Christoph Hellwig 2023-03-07  383  	struct btrfs_inode *inode = bbio->inode;
544fe4a903ce71 Christoph Hellwig 2023-02-10  384  	struct btrfs_fs_info *fs_info = inode->root->fs_info;
544fe4a903ce71 Christoph Hellwig 2023-02-10  385  	struct extent_map_tree *em_tree = &inode->extent_tree;
c8b978188c9a0f Chris Mason       2008-10-29  386  	struct compressed_bio *cb;
356b4a2dc151c6 Anand Jain        2021-05-29  387  	unsigned int compressed_len;
690834e47cf786 Christoph Hellwig 2023-03-07  388  	u64 file_offset = bbio->file_offset;
e04ca626baee68 Chris Mason       2008-11-10 @389  	u64 em_len;
e04ca626baee68 Chris Mason       2008-11-10 @390  	u64 em_start;
c8b978188c9a0f Chris Mason       2008-10-29  391  	struct extent_map *em;
82e60d00b753bb Johannes Weiner   2022-11-03  392  	unsigned long pflags;
82e60d00b753bb Johannes Weiner   2022-11-03  393  	int memstall = 0;
f9f15de85d74e7 Josef Bacik       2022-02-18  394  	blk_status_t ret;
dd137dd1f2d719 Sweet Tea Dorminy 2022-03-30  395  	int ret2;
c8b978188c9a0f Chris Mason       2008-10-29  396  
c8b978188c9a0f Chris Mason       2008-10-29  397  	/* we need the actual starting offset of this extent in the file */
890871be854b5f Chris Mason       2009-09-02  398  	read_lock(&em_tree->lock);
557023ea9f06ba Qu Wenruo         2021-07-05  399  	em = lookup_extent_mapping(em_tree, file_offset, fs_info->sectorsize);
890871be854b5f Chris Mason       2009-09-02  400  	read_unlock(&em_tree->lock);
f9f15de85d74e7 Josef Bacik       2022-02-18  401  	if (!em) {
f9f15de85d74e7 Josef Bacik       2022-02-18  402  		ret = BLK_STS_IOERR;
f9f15de85d74e7 Josef Bacik       2022-02-18  403  		goto out;
f9f15de85d74e7 Josef Bacik       2022-02-18  404  	}
c8b978188c9a0f Chris Mason       2008-10-29  405  
f86f7a75e2fb5f Filipe Manana     2023-12-04  406  	ASSERT(extent_map_is_compressed(em));
d20f7043fa6565 Chris Mason       2008-12-08  407  	compressed_len = em->block_len;
6b82ce8d824bd4 liubo             2011-01-26  408  
544fe4a903ce71 Christoph Hellwig 2023-02-10  409  	cb = alloc_compressed_bio(inode, file_offset, REQ_OP_READ,
a700ca5ec4ee9c Qu Wenruo         2023-12-12  410  				  end_bbio_comprssed_read);
c8b978188c9a0f Chris Mason       2008-10-29  411  
ff5b7ee33d8241 Yan Zheng         2008-11-10  412  	cb->start = em->orig_start;
e04ca626baee68 Chris Mason       2008-11-10  413  	em_len = em->len;
e04ca626baee68 Chris Mason       2008-11-10  414  	em_start = em->start;
d20f7043fa6565 Chris Mason       2008-12-08  415  
690834e47cf786 Christoph Hellwig 2023-03-07  416  	cb->len = bbio->bio.bi_iter.bi_size;
c8b978188c9a0f Chris Mason       2008-10-29  417  	cb->compressed_len = compressed_len;
f86f7a75e2fb5f Filipe Manana     2023-12-04  418  	cb->compress_type = extent_map_compression(em);
b7d463a1d1252c Christoph Hellwig 2023-03-07  419  	cb->orig_bbio = bbio;
c8b978188c9a0f Chris Mason       2008-10-29  420  
1d8fa2e29bc851 Goldwyn Rodrigues 2022-04-26  421  	free_extent_map(em);
1d8fa2e29bc851 Goldwyn Rodrigues 2022-04-26  422  
dd137dd1f2d719 Sweet Tea Dorminy 2022-03-30  423  	cb->nr_pages = DIV_ROUND_UP(compressed_len, PAGE_SIZE);
dd137dd1f2d719 Sweet Tea Dorminy 2022-03-30  424  	cb->compressed_pages = kcalloc(cb->nr_pages, sizeof(struct page *), GFP_NOFS);
f9f15de85d74e7 Josef Bacik       2022-02-18  425  	if (!cb->compressed_pages) {
f9f15de85d74e7 Josef Bacik       2022-02-18  426  		ret = BLK_STS_RESOURCE;
544fe4a903ce71 Christoph Hellwig 2023-02-10  427  		goto out_free_bio;
f9f15de85d74e7 Josef Bacik       2022-02-18  428  	}
6b82ce8d824bd4 liubo             2011-01-26  429  
09e6cef19c9fc0 Qu Wenruo         2023-11-30  430  	ret2 = btrfs_alloc_page_array(cb->nr_pages, cb->compressed_pages, 0);
dd137dd1f2d719 Sweet Tea Dorminy 2022-03-30  431  	if (ret2) {
0e9350de2ecdf2 Dan Carpenter     2017-06-19  432  		ret = BLK_STS_RESOURCE;
544fe4a903ce71 Christoph Hellwig 2023-02-10  433  		goto out_free_compressed_pages;
15e3004a0eb2c4 Josef Bacik       2012-10-05  434  	}
c8b978188c9a0f Chris Mason       2008-10-29  435  
771ed689d2cd53 Chris Mason       2008-11-06  436  	/* include any pages we added in add_ra-bio_pages */
690834e47cf786 Christoph Hellwig 2023-03-07  437  	cb->len = bbio->bio.bi_iter.bi_size;
4513cb0c40d795 Christoph Hellwig 2023-03-14  438  	cb->bbio.bio.bi_iter.bi_sector = bbio->bio.bi_iter.bi_sector;
4513cb0c40d795 Christoph Hellwig 2023-03-14  439  	btrfs_add_compressed_bio_pages(cb);
be6a13613fd356 Qu Wenruo         2021-02-04  440  
30493ff49f81d0 Qu Wenruo         2023-01-21  441  	if (memstall)
30493ff49f81d0 Qu Wenruo         2023-01-21  442  		psi_memstall_leave(&pflags);
c8b978188c9a0f Chris Mason       2008-10-29  443  
e19493107675d4 Christoph Hellwig 2023-05-03  444  	btrfs_submit_bio(&cb->bbio, 0);
cb4411dd571c85 Christoph Hellwig 2022-04-15  445  	return;
6b82ce8d824bd4 liubo             2011-01-26  446  
544fe4a903ce71 Christoph Hellwig 2023-02-10  447  out_free_compressed_pages:
6b82ce8d824bd4 liubo             2011-01-26  448  	kfree(cb->compressed_pages);
544fe4a903ce71 Christoph Hellwig 2023-02-10  449  out_free_bio:
10e924bc320a95 Christoph Hellwig 2023-02-10  450  	bio_put(&cb->bbio.bio);
544fe4a903ce71 Christoph Hellwig 2023-02-10  451  out:
690834e47cf786 Christoph Hellwig 2023-03-07  452  	btrfs_bio_end_io(bbio, ret);
c8b978188c9a0f Chris Mason       2008-10-29  453  }
261507a02ccba9 Li Zefan          2010-12-17  454  

:::::: The code at line 390 was first introduced by commit
:::::: e04ca626baee684bea9d6239e4e1119b696101b2 Btrfs: Fix use after free during compressed reads

:::::: TO: Chris Mason <chris.mason@oracle.com>
:::::: CC: Chris Mason <chris.mason@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
