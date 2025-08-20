Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754525A65B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 17:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710327; cv=none; b=cYCN5Wr1LGXKBAVl79/d4ZTPQ4ttAy7qnAZ46zcReXnFSjFTa58+fyLG6dhmyMGb/Fa11X5lSEgdeSczlpAYLBSSyyyuPi9KrtOAK+keWdtXb49l2LtWiEV1ATfhnweXm8VPKcdpGgWiDYwJora/5wDHgfgNjq47gUaTEl4IQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710327; c=relaxed/simple;
	bh=6vP6RsSYQTkYRk1Z4HyBHbvyRHzqSviltWsnfCvphwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sb32fgE479aQ0ScrVdYwkaA9kWfJLNAqRDcClGUJqJhelcQNsMIM/FGVsXVNCf2zK3AXmUXwCi9TtZNpuGTpqwHOTUXkVV2soezl5AKyYtDG8Q3a/sGFSss9gtwHu9N4oC9+2h5wIo0+M/NHELSCkMCA9jUfRnWGiHaQl0cjLKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+KQaFQS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+KQaFQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755710325; x=1787246325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6vP6RsSYQTkYRk1Z4HyBHbvyRHzqSviltWsnfCvphwY=;
  b=c+KQaFQSipYDv5rRJ7nRrm6ZSwKX1/fe65F5HYrKYEqKTM0EBb9J1cdT
   phR0Jt01VMKv4m5yp3msklk+k9zm2/VCXRCUotJ7OL8aDlUUYN+DkhRAc
   Dgd0tQiBKZ/BvGIp6/chOVpX0KIPK3EODHjOLreCJ5paxwBEde6O+H64l
   Tea1Cbhz6PgLSpufIDfSApiJjiDu8JiwtTi2XBgjHwin+dqDYzJ/BEalM
   EyaixZ6+VQjs0zZ94c5PqmEZb2wCeEahLxmVGnQvwn/TCaWthMmHf8arL
   1IghNzrppzXqvb523L0nng9JJcJQwx+ojotJVG0vigSI4OGc6gLWk7+X6
   A==;
X-CSE-ConnectionGUID: vFb2w0RZTqO89txQaSAOeg==
X-CSE-MsgGUID: eW2K7cMCSNqm3rtEShyBsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57015452"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57015452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 10:18:41 -0700
X-CSE-ConnectionGUID: c68xfDe3R8i5Xjxm+2A0+A==
X-CSE-MsgGUID: Q4ME+NHTS/qqW11AidP9ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="173530022"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2025 10:18:40 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uomSL-000JX9-2f;
	Wed, 20 Aug 2025 17:18:37 +0000
Date: Thu, 21 Aug 2025 01:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] btrfs: extract the compressed folio padding into a
 helper
Message-ID: <202508210037.zgdzvjJV-lkp@intel.com>
References: <e8da4be87bbe97624e9f025b92e7a5265073b519.1755668227.git.wqu@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8da4be87bbe97624e9f025b92e7a5265073b519.1755668227.git.wqu@suse.com>

Hi Qu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20250820]
[cannot apply to linus/master v6.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-extract-the-compressed-folio-padding-into-a-helper/20250820-134248
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/e8da4be87bbe97624e9f025b92e7a5265073b519.1755668227.git.wqu%40suse.com
patch subject: [PATCH RFC] btrfs: extract the compressed folio padding into a helper
config: x86_64-buildonly-randconfig-002-20250820 (https://download.01.org/0day-ci/archive/20250821/202508210037.zgdzvjJV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210037.zgdzvjJV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210037.zgdzvjJV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'compress_file_range':
>> fs/btrfs/inode.c:867:22: warning: unused variable 'poff' [-Wunused-variable]
     867 |         unsigned int poff;
         |                      ^~~~


vim +/poff +867 fs/btrfs/inode.c

af61081fb522ab Qu Wenruo          2024-05-23   836  
d352ac68148b69 Chris Mason        2008-09-29   837  /*
c15d8cf29551ea Christoph Hellwig  2023-06-28   838   * Work queue call back to started compression on a file and pages.
c8b978188c9a0f Chris Mason        2008-10-29   839   *
c15d8cf29551ea Christoph Hellwig  2023-06-28   840   * This is done inside an ordered work queue, and the compression is spread
c15d8cf29551ea Christoph Hellwig  2023-06-28   841   * across many cpus.  The actual IO submission is step two, and the ordered work
c15d8cf29551ea Christoph Hellwig  2023-06-28   842   * queue takes care of making sure that happens in the same order things were
c15d8cf29551ea Christoph Hellwig  2023-06-28   843   * put onto the queue by writepages and friends.
c8b978188c9a0f Chris Mason        2008-10-29   844   *
c15d8cf29551ea Christoph Hellwig  2023-06-28   845   * If this code finds it can't get good compression, it puts an entry onto the
c15d8cf29551ea Christoph Hellwig  2023-06-28   846   * work queue to write the uncompressed bytes.  This makes sure that both
c15d8cf29551ea Christoph Hellwig  2023-06-28   847   * compressed inodes and uncompressed inodes are written in the same order that
c15d8cf29551ea Christoph Hellwig  2023-06-28   848   * the flusher thread sent them down.
d352ac68148b69 Chris Mason        2008-09-29   849   */
c15d8cf29551ea Christoph Hellwig  2023-06-28   850  static void compress_file_range(struct btrfs_work *work)
b888db2bd7b67f Chris Mason        2007-08-27   851  {
c15d8cf29551ea Christoph Hellwig  2023-06-28   852  	struct async_chunk *async_chunk =
c15d8cf29551ea Christoph Hellwig  2023-06-28   853  		container_of(work, struct async_chunk, work);
99a01bd6388e52 David Sterba       2022-10-28   854  	struct btrfs_inode *inode = async_chunk->inode;
99a01bd6388e52 David Sterba       2022-10-28   855  	struct btrfs_fs_info *fs_info = inode->root->fs_info;
a994310aa26fcb Christoph Hellwig  2023-05-31   856  	struct address_space *mapping = inode->vfs_inode.i_mapping;
0b246afa62b0cf Jeff Mahoney       2016-06-22   857  	u64 blocksize = fs_info->sectorsize;
1368c6dac7f10a Nikolay Borisov    2019-03-12   858  	u64 start = async_chunk->start;
1368c6dac7f10a Nikolay Borisov    2019-03-12   859  	u64 end = async_chunk->end;
c8b978188c9a0f Chris Mason        2008-10-29   860  	u64 actual_end;
d98da49977f673 Josef Bacik        2019-10-11   861  	u64 i_size;
e6dcd2dc9c4891 Chris Mason        2008-07-17   862  	int ret = 0;
400b172b8cdcff Qu Wenruo          2024-01-29   863  	struct folio **folios;
400b172b8cdcff Qu Wenruo          2024-01-29   864  	unsigned long nr_folios;
c8b978188c9a0f Chris Mason        2008-10-29   865  	unsigned long total_compressed = 0;
c8b978188c9a0f Chris Mason        2008-10-29   866  	unsigned long total_in = 0;
e94e54e89b4f9c Christoph Hellwig  2023-06-28  @867  	unsigned int poff;
c8b978188c9a0f Chris Mason        2008-10-29   868  	int i;
0b246afa62b0cf Jeff Mahoney       2016-06-22   869  	int compress_type = fs_info->compress_type;
fc5c0c58258748 Daniel Vacek       2025-03-06   870  	int compress_level = fs_info->compress_level;
b888db2bd7b67f Chris Mason        2007-08-27   871  
99a01bd6388e52 David Sterba       2022-10-28   872  	inode_should_defrag(inode, start, end, end - start + 1, SZ_16K);
4cb5300bc839b8 Chris Mason        2011-05-24   873  
44962ca37c8cf8 Christoph Hellwig  2023-06-28   874  	/*
44962ca37c8cf8 Christoph Hellwig  2023-06-28   875  	 * We need to call clear_page_dirty_for_io on each page in the range.
44962ca37c8cf8 Christoph Hellwig  2023-06-28   876  	 * Otherwise applications with the file mmap'd can wander in and change
44962ca37c8cf8 Christoph Hellwig  2023-06-28   877  	 * the page contents while we are compressing them.
44962ca37c8cf8 Christoph Hellwig  2023-06-28   878  	 */
0d12afad24677f David Sterba       2025-02-17   879  	ret = extent_range_clear_dirty_for_io(inode, start, end);
a39484371dd29e Qu Wenruo          2024-05-23   880  
a39484371dd29e Qu Wenruo          2024-05-23   881  	/*
a39484371dd29e Qu Wenruo          2024-05-23   882  	 * All the folios should have been locked thus no failure.
a39484371dd29e Qu Wenruo          2024-05-23   883  	 *
a39484371dd29e Qu Wenruo          2024-05-23   884  	 * And even if some folios are missing, btrfs_compress_folios()
a39484371dd29e Qu Wenruo          2024-05-23   885  	 * would handle them correctly, so here just do an ASSERT() check for
a39484371dd29e Qu Wenruo          2024-05-23   886  	 * early logic errors.
a39484371dd29e Qu Wenruo          2024-05-23   887  	 */
a39484371dd29e Qu Wenruo          2024-05-23   888  	ASSERT(ret == 0);
44962ca37c8cf8 Christoph Hellwig  2023-06-28   889  
d98da49977f673 Josef Bacik        2019-10-11   890  	/*
d98da49977f673 Josef Bacik        2019-10-11   891  	 * We need to save i_size before now because it could change in between
d98da49977f673 Josef Bacik        2019-10-11   892  	 * us evaluating the size and assigning it.  This is because we lock and
d98da49977f673 Josef Bacik        2019-10-11   893  	 * unlock the page in truncate and fallocate, and then modify the i_size
d98da49977f673 Josef Bacik        2019-10-11   894  	 * later on.
d98da49977f673 Josef Bacik        2019-10-11   895  	 *
d98da49977f673 Josef Bacik        2019-10-11   896  	 * The barriers are to emulate READ_ONCE, remove that once i_size_read
d98da49977f673 Josef Bacik        2019-10-11   897  	 * does that for us.
d98da49977f673 Josef Bacik        2019-10-11   898  	 */
d98da49977f673 Josef Bacik        2019-10-11   899  	barrier();
99a01bd6388e52 David Sterba       2022-10-28   900  	i_size = i_size_read(&inode->vfs_inode);
d98da49977f673 Josef Bacik        2019-10-11   901  	barrier();
d98da49977f673 Josef Bacik        2019-10-11   902  	actual_end = min_t(u64, i_size, end + 1);
c8b978188c9a0f Chris Mason        2008-10-29   903  again:
400b172b8cdcff Qu Wenruo          2024-01-29   904  	folios = NULL;
400b172b8cdcff Qu Wenruo          2024-01-29   905  	nr_folios = (end >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
400b172b8cdcff Qu Wenruo          2024-01-29   906  	nr_folios = min_t(unsigned long, nr_folios, BTRFS_MAX_COMPRESSED_PAGES);
c8b978188c9a0f Chris Mason        2008-10-29   907  
f03d9301f15fb6 Chris Mason        2009-02-04   908  	/*
f03d9301f15fb6 Chris Mason        2009-02-04   909  	 * we don't want to send crud past the end of i_size through
f03d9301f15fb6 Chris Mason        2009-02-04   910  	 * compression, that's just a waste of CPU time.  So, if the
f03d9301f15fb6 Chris Mason        2009-02-04   911  	 * end of the file is before the start of our current
f03d9301f15fb6 Chris Mason        2009-02-04   912  	 * requested range of bytes, we bail out to the uncompressed
f03d9301f15fb6 Chris Mason        2009-02-04   913  	 * cleanup code that can deal with all of this.
f03d9301f15fb6 Chris Mason        2009-02-04   914  	 *
f03d9301f15fb6 Chris Mason        2009-02-04   915  	 * It isn't really the fastest way to fix things, but this is a
f03d9301f15fb6 Chris Mason        2009-02-04   916  	 * very uncommon corner.
f03d9301f15fb6 Chris Mason        2009-02-04   917  	 */
f03d9301f15fb6 Chris Mason        2009-02-04   918  	if (actual_end <= start)
f03d9301f15fb6 Chris Mason        2009-02-04   919  		goto cleanup_and_bail_uncompressed;
f03d9301f15fb6 Chris Mason        2009-02-04   920  
c8b978188c9a0f Chris Mason        2008-10-29   921  	total_compressed = actual_end - start;
c8b978188c9a0f Chris Mason        2008-10-29   922  
4bcbb33255131a Shilong Wang       2014-10-07   923  	/*
0cf9b244e7db17 Qu Wenruo          2021-09-27   924  	 * Skip compression for a small file range(<=blocksize) that
0132761017e012 Nicholas D Steeves 2016-05-19   925  	 * isn't an inline extent, since it doesn't save disk space at all.
4bcbb33255131a Shilong Wang       2014-10-07   926  	 */
4bcbb33255131a Shilong Wang       2014-10-07   927  	if (total_compressed <= blocksize &&
99a01bd6388e52 David Sterba       2022-10-28   928  	   (start > 0 || end + 1 < inode->disk_i_size))
4bcbb33255131a Shilong Wang       2014-10-07   929  		goto cleanup_and_bail_uncompressed;
4bcbb33255131a Shilong Wang       2014-10-07   930  
069eac7850890a David Sterba       2017-02-14   931  	total_compressed = min_t(unsigned long, total_compressed,
069eac7850890a David Sterba       2017-02-14   932  			BTRFS_MAX_UNCOMPRESSED);
c8b978188c9a0f Chris Mason        2008-10-29   933  	total_in = 0;
c8b978188c9a0f Chris Mason        2008-10-29   934  	ret = 0;
db94535db75e67 Chris Mason        2007-10-15   935  
771ed689d2cd53 Chris Mason        2008-11-06   936  	/*
e94e54e89b4f9c Christoph Hellwig  2023-06-28   937  	 * We do compression for mount -o compress and when the inode has not
e94e54e89b4f9c Christoph Hellwig  2023-06-28   938  	 * been flagged as NOCOMPRESS.  This flag can change at any time if we
e94e54e89b4f9c Christoph Hellwig  2023-06-28   939  	 * discover bad compression ratios.
c8b978188c9a0f Chris Mason        2008-10-29   940  	 */
e94e54e89b4f9c Christoph Hellwig  2023-06-28   941  	if (!inode_need_compress(inode, start, end))
6a7167bf9c9258 Christoph Hellwig  2023-06-28   942  		goto cleanup_and_bail_uncompressed;
e94e54e89b4f9c Christoph Hellwig  2023-06-28   943  
400b172b8cdcff Qu Wenruo          2024-01-29   944  	folios = kcalloc(nr_folios, sizeof(struct folio *), GFP_NOFS);
400b172b8cdcff Qu Wenruo          2024-01-29   945  	if (!folios) {
e94e54e89b4f9c Christoph Hellwig  2023-06-28   946  		/*
e94e54e89b4f9c Christoph Hellwig  2023-06-28   947  		 * Memory allocation failure is not a fatal error, we can fall
e94e54e89b4f9c Christoph Hellwig  2023-06-28   948  		 * back to uncompressed code.
e94e54e89b4f9c Christoph Hellwig  2023-06-28   949  		 */
6a7167bf9c9258 Christoph Hellwig  2023-06-28   950  		goto cleanup_and_bail_uncompressed;
560f7d75457f86 Li Zefan           2011-09-08   951  	}
c8b978188c9a0f Chris Mason        2008-10-29   952  
009b2056cb259c David Sterba       2025-07-09   953  	if (0 < inode->defrag_compress && inode->defrag_compress < BTRFS_NR_COMPRESS_TYPES) {
99a01bd6388e52 David Sterba       2022-10-28   954  		compress_type = inode->defrag_compress;
fc5c0c58258748 Daniel Vacek       2025-03-06   955  		compress_level = inode->defrag_compress_level;
fc5c0c58258748 Daniel Vacek       2025-03-06   956  	} else if (inode->prop_compress) {
99a01bd6388e52 David Sterba       2022-10-28   957  		compress_type = inode->prop_compress;
fc5c0c58258748 Daniel Vacek       2025-03-06   958  	}
261507a02ccba9 Li Zefan           2010-12-17   959  
e94e54e89b4f9c Christoph Hellwig  2023-06-28   960  	/* Compression level is applied here. */
fc5c0c58258748 Daniel Vacek       2025-03-06   961  	ret = btrfs_compress_folios(compress_type, compress_level,
f30187d354df74 Qu Wenruo          2025-08-10   962  				    inode, start, folios, &nr_folios, &total_in,
e5d74902362f1a David Sterba       2017-02-14   963  				    &total_compressed);
e94e54e89b4f9c Christoph Hellwig  2023-06-28   964  	if (ret)
184aa1ffa5fdf7 Christoph Hellwig  2023-06-28   965  		goto mark_incompressible;
c8b978188c9a0f Chris Mason        2008-10-29   966  
7367253a351ef7 Qu Wenruo          2021-07-26   967  	/*
6a7167bf9c9258 Christoph Hellwig  2023-06-28   968  	 * Try to create an inline extent.
6a7167bf9c9258 Christoph Hellwig  2023-06-28   969  	 *
6a7167bf9c9258 Christoph Hellwig  2023-06-28   970  	 * If we didn't compress the entire range, try to create an uncompressed
6a7167bf9c9258 Christoph Hellwig  2023-06-28   971  	 * inline extent, else a compressed one.
6a7167bf9c9258 Christoph Hellwig  2023-06-28   972  	 *
7367253a351ef7 Qu Wenruo          2021-07-26   973  	 * Check cow_file_range() for why we don't even try to create inline
e94e54e89b4f9c Christoph Hellwig  2023-06-28   974  	 * extent for the subpage case.
7367253a351ef7 Qu Wenruo          2021-07-26   975  	 */
6eecfa22403e2c Josef Bacik        2024-03-20   976  	if (total_in < actual_end)
478574370bef79 Boris Burkov       2024-07-22   977  		ret = cow_file_range_inline(inode, NULL, start, end, 0,
7034674b8a0703 Josef Bacik        2024-04-03   978  					    BTRFS_COMPRESS_NONE, NULL, false);
6eecfa22403e2c Josef Bacik        2024-03-20   979  	else
478574370bef79 Boris Burkov       2024-07-22   980  		ret = cow_file_range_inline(inode, NULL, start, end, total_compressed,
7034674b8a0703 Josef Bacik        2024-04-03   981  					    compress_type, folios[0], false);
79787eaab46121 Jeff Mahoney       2012-03-12   982  	if (ret <= 0) {
a994310aa26fcb Christoph Hellwig  2023-05-31   983  		if (ret < 0)
a994310aa26fcb Christoph Hellwig  2023-05-31   984  			mapping_set_error(mapping, -EIO);
f778b6b8e0136c Christoph Hellwig  2023-06-28   985  		goto free_pages;
c8b978188c9a0f Chris Mason        2008-10-29   986  	}
c8b978188c9a0f Chris Mason        2008-10-29   987  
c8b978188c9a0f Chris Mason        2008-10-29   988  	/*
e94e54e89b4f9c Christoph Hellwig  2023-06-28   989  	 * We aren't doing an inline extent. Round the compressed size up to a
e94e54e89b4f9c Christoph Hellwig  2023-06-28   990  	 * block size boundary so the allocator does sane things.
c8b978188c9a0f Chris Mason        2008-10-29   991  	 */
fda2832febb192 Qu Wenruo          2013-02-26   992  	total_compressed = ALIGN(total_compressed, blocksize);
c8b978188c9a0f Chris Mason        2008-10-29   993  
c8b978188c9a0f Chris Mason        2008-10-29   994  	/*
e94e54e89b4f9c Christoph Hellwig  2023-06-28   995  	 * One last check to make sure the compression is really a win, compare
e94e54e89b4f9c Christoph Hellwig  2023-06-28   996  	 * the page count read with the blocks on disk, compression must free at
e94e54e89b4f9c Christoph Hellwig  2023-06-28   997  	 * least one sector.
c8b978188c9a0f Chris Mason        2008-10-29   998  	 */
4c162778d63eb8 Qu Wenruo          2021-09-27   999  	total_in = round_up(total_in, fs_info->sectorsize);
e94e54e89b4f9c Christoph Hellwig  2023-06-28  1000  	if (total_compressed + blocksize > total_in)
184aa1ffa5fdf7 Christoph Hellwig  2023-06-28  1001  		goto mark_incompressible;
c8bb0c8bd22a4b Ashish Samant      2016-03-25  1002  
c8bb0c8bd22a4b Ashish Samant      2016-03-25  1003  	/*
e94e54e89b4f9c Christoph Hellwig  2023-06-28  1004  	 * The async work queues will take care of doing actual allocation on
e94e54e89b4f9c Christoph Hellwig  2023-06-28  1005  	 * disk for these compressed pages, and will submit the bios.
c8bb0c8bd22a4b Ashish Samant      2016-03-25  1006  	 */
400b172b8cdcff Qu Wenruo          2024-01-29  1007  	ret = add_async_extent(async_chunk, start, total_in, total_compressed, folios,
400b172b8cdcff Qu Wenruo          2024-01-29  1008  			       nr_folios, compress_type);
dbe6cda68f0e1b David Sterba       2024-01-24  1009  	BUG_ON(ret);
1170862d783a3b Timofey Titovets   2017-10-03  1010  	if (start + total_in < end) {
1170862d783a3b Timofey Titovets   2017-10-03  1011  		start += total_in;
c8bb0c8bd22a4b Ashish Samant      2016-03-25  1012  		cond_resched();
c8bb0c8bd22a4b Ashish Samant      2016-03-25  1013  		goto again;
c8bb0c8bd22a4b Ashish Samant      2016-03-25  1014  	}
3134508e47df8f Christoph Hellwig  2023-06-28  1015  	return;
e94e54e89b4f9c Christoph Hellwig  2023-06-28  1016  
184aa1ffa5fdf7 Christoph Hellwig  2023-06-28  1017  mark_incompressible:
184aa1ffa5fdf7 Christoph Hellwig  2023-06-28  1018  	if (!btrfs_test_opt(fs_info, FORCE_COMPRESS) && !inode->prop_compress)
184aa1ffa5fdf7 Christoph Hellwig  2023-06-28  1019  		inode->flags |= BTRFS_INODE_NOCOMPRESS;
e94e54e89b4f9c Christoph Hellwig  2023-06-28  1020  cleanup_and_bail_uncompressed:
dbe6cda68f0e1b David Sterba       2024-01-24  1021  	ret = add_async_extent(async_chunk, start, end - start + 1, 0, NULL, 0,
c8bb0c8bd22a4b Ashish Samant      2016-03-25  1022  			       BTRFS_COMPRESS_NONE);
dbe6cda68f0e1b David Sterba       2024-01-24  1023  	BUG_ON(ret);
f778b6b8e0136c Christoph Hellwig  2023-06-28  1024  free_pages:
400b172b8cdcff Qu Wenruo          2024-01-29  1025  	if (folios) {
400b172b8cdcff Qu Wenruo          2024-01-29  1026  		for (i = 0; i < nr_folios; i++) {
400b172b8cdcff Qu Wenruo          2024-01-29  1027  			WARN_ON(folios[i]->mapping);
400b172b8cdcff Qu Wenruo          2024-01-29  1028  			btrfs_free_compr_folio(folios[i]);
c8b978188c9a0f Chris Mason        2008-10-29  1029  		}
400b172b8cdcff Qu Wenruo          2024-01-29  1030  		kfree(folios);
1e701a3292e25a Chris Mason        2010-03-11  1031  	}
771ed689d2cd53 Chris Mason        2008-11-06  1032  }
771ed689d2cd53 Chris Mason        2008-11-06  1033  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
