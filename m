Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC41C06
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 03:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706413516; cv=none; b=RrjHNAj0Fj3fYX+eqkGiyVrSZX/tm2nNoy8TAWH/aT6R6pvOU2Ay2t2p0lZ++YhiHWSAsj2mQEM0qF70ezV0D2Fb/QenJLw/5e/K2dC37YebriOfa0aKHHdR084RA2t7/ILhpkCjtVOgB98A5r4AiuR4MY9q6titisXfZcDawC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706413516; c=relaxed/simple;
	bh=CJsPpBd2sHTxvrKoru3H2Oe8OYYKLseFHnq2DvnnGso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pprBuyxT3PTXJYFBD5v5p75TYdVUHq8541Tl2dMCvzg6d0CkuHKaejamcONAiUDsPQj+VYU0gKmJGJPnNnpNb25VZwwPJU04AUigBghTIeXkHyBBI3D5Hh/UgM83NMMdM3tdBco6jJb+fUT+3LXRPlocQmWJKWUAPqCfg0JtdqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLtiHBnC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLtiHBnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706413514; x=1737949514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CJsPpBd2sHTxvrKoru3H2Oe8OYYKLseFHnq2DvnnGso=;
  b=YLtiHBnCyoG649FoQtT4ioP9727JTKO9BaSWrsN+8Yt+pzxH3HlCqQ88
   rN5OzC+i5yuSVHB6UPcST/EN+xzU3x6n4MgVO4xptXQAkAo5MhoXt3vAn
   SQMsgzV37cgZD06M12vPFcfslbYd0a0jSb4mLOG7nE2rG0UTxmL00oMpV
   ibx/TChUJmQ6YwSe26pIdjY7ZRk49cAyq/47AroF/xeqAlOxw6wZFwTtU
   7LxazPm9wPJsypNHL6yAbCUwrDqWuvAvzNV9BS848CvP4ytpgNqhkvggr
   6rAuNiasASZ42qBI7EU7RTCoINbPG2RRzuuzoMf4FzqtZOar0J4IqcxNi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="16262849"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="16262849"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 19:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="930751000"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="930751000"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2024 19:45:12 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTw6Y-00032Y-0t;
	Sun, 28 Jan 2024 03:45:10 +0000
Date: Sun, 28 Jan 2024 11:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:buffered.46 88/90] fs/btrfs/inode.c:962:32: warning:
 unused variable 'io_tree'
Message-ID: <202401281114.da6alX7u-lkp@intel.com>
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
commit: e6b9791039c5d27a523c8e22f54cf744ce184301 [88/90] btrfs: Introduce btrfs_writeback to lock extents during writeback
config: i386-buildonly-randconfig-002-20240127 (https://download.01.org/0day-ci/archive/20240128/202401281114.da6alX7u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281114.da6alX7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281114.da6alX7u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'submit_async_extent':
>> fs/btrfs/inode.c:962:32: warning: unused variable 'io_tree' [-Wunused-variable]
     962 |         struct extent_io_tree *io_tree = &inode->io_tree;
         |                                ^~~~~~~


vim +/io_tree +962 fs/btrfs/inode.c

2b83a0eea5a15d Qu Wenruo         2021-09-27   958  
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08   959  static int submit_async_extent(struct async_extent *async_extent)
771ed689d2cd53 Chris Mason       2008-11-06   960  {
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08   961  	struct btrfs_inode *inode = async_extent->inode;
b4ccace878f47f Qu Wenruo         2021-09-27  @962  	struct extent_io_tree *io_tree = &inode->io_tree;
b4ccace878f47f Qu Wenruo         2021-09-27   963  	struct btrfs_root *root = inode->root;
b4ccace878f47f Qu Wenruo         2021-09-27   964  	struct btrfs_fs_info *fs_info = root->fs_info;
d611935b5d434a Christoph Hellwig 2023-05-31   965  	struct btrfs_ordered_extent *ordered;
771ed689d2cd53 Chris Mason       2008-11-06   966  	struct btrfs_key ins;
771ed689d2cd53 Chris Mason       2008-11-06   967  	struct extent_map *em;
f5a84ee3cdd88d Josef Bacik       2009-11-10   968  	int ret = 0;
b4ccace878f47f Qu Wenruo         2021-09-27   969  	u64 start = async_extent->start;
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08   970  	u64 end = async_extent->end;
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08   971  	ssize_t len = end - start + 1;
771ed689d2cd53 Chris Mason       2008-11-06   972  
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08   973  	if (async_extent->blkcg_css)
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08   974  		kthread_associate_blkcg(async_extent->blkcg_css);
896d7c1a90f33e Christoph Hellwig 2023-03-27   975  
67583468086c2a Christoph Hellwig 2023-06-28   976  	if (async_extent->compress_type == BTRFS_COMPRESS_NONE) {
ee01e32877d167 Goldwyn Rodrigues 2023-08-01   977  		submit_uncompressed_range(inode, async_extent);
4b8d5187fafa03 Goldwyn Rodrigues 2023-05-02   978  		clear_extent_bits(&inode->io_tree, start, end,
e6b9791039c5d2 Goldwyn Rodrigues 2023-12-18   979  				EXTENT_DELALLOC);
e43a6210b79815 Christoph Hellwig 2023-03-27   980  		goto done;
e43a6210b79815 Christoph Hellwig 2023-03-27   981  	}
771ed689d2cd53 Chris Mason       2008-11-06   982  
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08   983  	ret = btrfs_reserve_extent(root, len,
771ed689d2cd53 Chris Mason       2008-11-06   984  				   async_extent->compressed_size,
771ed689d2cd53 Chris Mason       2008-11-06   985  				   async_extent->compressed_size,
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08   986  				   0, 0, &ins, 1, 1);
f5a84ee3cdd88d Josef Bacik       2009-11-10   987  	if (ret) {
ce62003f690dff Liu Bo            2014-07-24   988  		/*
b4ccace878f47f Qu Wenruo         2021-09-27   989  		 * Here we used to try again by going back to non-compressed
b4ccace878f47f Qu Wenruo         2021-09-27   990  		 * path for ENOSPC.  But we can't reserve space even for
b4ccace878f47f Qu Wenruo         2021-09-27   991  		 * compressed size, how could it work for uncompressed size
b4ccace878f47f Qu Wenruo         2021-09-27   992  		 * which requires larger size?  So here we directly go error
b4ccace878f47f Qu Wenruo         2021-09-27   993  		 * path.
ce62003f690dff Liu Bo            2014-07-24   994  		 */
3e04e7f10b6899 Josef Bacik       2013-02-06   995  		goto out_free;
f5a84ee3cdd88d Josef Bacik       2009-11-10   996  	}
b4ccace878f47f Qu Wenruo         2021-09-27   997  
b4ccace878f47f Qu Wenruo         2021-09-27   998  	/* Here we're doing allocation and writeback of the compressed pages */
b4ccace878f47f Qu Wenruo         2021-09-27   999  	em = create_io_em(inode, start,
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08  1000  			  len,
b4ccace878f47f Qu Wenruo         2021-09-27  1001  			  start,			/* orig_start */
6f9994dbabe575 Liu Bo            2017-01-31  1002  			  ins.objectid,			/* block_start */
6f9994dbabe575 Liu Bo            2017-01-31  1003  			  ins.offset,			/* block_len */
6f9994dbabe575 Liu Bo            2017-01-31  1004  			  ins.offset,			/* orig_block_len */
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08  1005  			  len,				/* ram_bytes */
6f9994dbabe575 Liu Bo            2017-01-31  1006  			  async_extent->compress_type,
6f9994dbabe575 Liu Bo            2017-01-31  1007  			  BTRFS_ORDERED_COMPRESSED);
b4ccace878f47f Qu Wenruo         2021-09-27  1008  	if (IS_ERR(em)) {
b4ccace878f47f Qu Wenruo         2021-09-27  1009  		ret = PTR_ERR(em);
3e04e7f10b6899 Josef Bacik       2013-02-06  1010  		goto out_free_reserve;
b4ccace878f47f Qu Wenruo         2021-09-27  1011  	}
771ed689d2cd53 Chris Mason       2008-11-06  1012  	free_extent_map(em);
3e04e7f10b6899 Josef Bacik       2013-02-06  1013  
d611935b5d434a Christoph Hellwig 2023-05-31  1014  	ordered = btrfs_alloc_ordered_extent(inode, start,	/* file_offset */
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08  1015  				       len,			/* num_bytes */
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08  1016  				       len,			/* ram_bytes */
cb36a9bb17c4ab Omar Sandoval     2019-11-06  1017  				       ins.objectid,		/* disk_bytenr */
b4ccace878f47f Qu Wenruo         2021-09-27  1018  				       ins.offset,		/* disk_num_bytes */
cb36a9bb17c4ab Omar Sandoval     2019-11-06  1019  				       0,			/* offset */
cb36a9bb17c4ab Omar Sandoval     2019-11-06  1020  				       1 << BTRFS_ORDERED_COMPRESSED,
261507a02ccba9 Li Zefan          2010-12-17  1021  				       async_extent->compress_type);
d611935b5d434a Christoph Hellwig 2023-05-31  1022  	if (IS_ERR(ordered)) {
4c0c8cfc843345 Filipe Manana     2022-09-19  1023  		btrfs_drop_extent_map_range(inode, start, end, false);
d611935b5d434a Christoph Hellwig 2023-05-31  1024  		ret = PTR_ERR(ordered);
3e04e7f10b6899 Josef Bacik       2013-02-06  1025  		goto out_free_reserve;
d9f85963e3f7f5 Filipe Manana     2014-08-25  1026  	}
0b246afa62b0cf Jeff Mahoney      2016-06-22  1027  	btrfs_dec_block_group_reservations(fs_info, ins.objectid);
771ed689d2cd53 Chris Mason       2008-11-06  1028  
b4ccace878f47f Qu Wenruo         2021-09-27  1029  	/* Clear dirty, set writeback and unlock the pages. */
e6b9791039c5d2 Goldwyn Rodrigues 2023-12-18  1030  	clear_extent_bits(&inode->io_tree, start, end, EXTENT_DELALLOC);
d611935b5d434a Christoph Hellwig 2023-05-31  1031  	btrfs_submit_compressed_write(ordered,
b3ccb4f1327abe Goldwyn Rodrigues 2023-04-20  1032  			    async_extent->bbio,
b4ccace878f47f Qu Wenruo         2021-09-27  1033  			    async_extent->pages,	/* compressed_pages */
f82b735936ffd5 Liu Bo            2017-10-23  1034  			    async_extent->nr_pages,
b3ccb4f1327abe Goldwyn Rodrigues 2023-04-20  1035  			    async_extent->write_flags);
e43a6210b79815 Christoph Hellwig 2023-03-27  1036  done:
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08  1037  	if (async_extent->blkcg_css)
896d7c1a90f33e Christoph Hellwig 2023-03-27  1038  		kthread_associate_blkcg(NULL);
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08  1039  	return ret;
b4ccace878f47f Qu Wenruo         2021-09-27  1040  
3e04e7f10b6899 Josef Bacik       2013-02-06  1041  out_free_reserve:
0b246afa62b0cf Jeff Mahoney      2016-06-22  1042  	btrfs_dec_block_group_reservations(fs_info, ins.objectid);
2ff7e61e0d30ff Jeff Mahoney      2016-06-22  1043  	btrfs_free_reserved_extent(fs_info, ins.objectid, ins.offset, 1);
79787eaab46121 Jeff Mahoney      2012-03-12  1044  out_free:
a994310aa26fcb Christoph Hellwig 2023-05-31  1045  	mapping_set_error(inode->vfs_inode.i_mapping, -EIO);
e6b9791039c5d2 Goldwyn Rodrigues 2023-12-18  1046  	clear_extent_bits(&inode->io_tree, start, end, EXTENT_DELALLOC | EXTENT_DELALLOC_NEW | EXTENT_DEFRAG | EXTENT_DO_ACCOUNTING);
40ae837b43565c Filipe Manana     2014-10-06  1047  	free_async_extent_pages(async_extent);
b3ccb4f1327abe Goldwyn Rodrigues 2023-04-20  1048  	btrfs_bio_end_io(async_extent->bbio, errno_to_blk_status(ret));
0efcbe67b18c66 Goldwyn Rodrigues 2023-05-08  1049  	goto done;
771ed689d2cd53 Chris Mason       2008-11-06  1050  }
771ed689d2cd53 Chris Mason       2008-11-06  1051  

:::::: The code at line 962 was first introduced by commit
:::::: b4ccace878f47fd5008de41d45ec42f38d0e8c7d btrfs: refactor submit_compressed_extents()

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
