Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE55A0F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715708573; cv=none; b=Lg6Fc7Y7UlchTElCJRc6VJzKO0VZA7bOfJmvTHF5HC3Eo2/OcA89V/NvM66dBoVOGOeomG8IfEi+y/yA6kV3E4habsPQjFg2agUNBIap/7Px8+IzS8hgGSr0m7swolb9/5pJ7McOR1oRGrTxpyxfk1pqOZSWp2l8cFN5fTBxcYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715708573; c=relaxed/simple;
	bh=sXWJARemTalBkS754aFMkd7WthVUU1Zim5hGkCU3NKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EvOk0ca02EqHru/Vx8Rto4+lddgB/gM155HduNTeNehZ5oBeTdkYlv7+uguOnaoKbmB4DH4Fwa1YRZ/f6qIdstRWhduLn3F1+IiQNQPk10mHRlfbIw8ttdc9zPyzBCksxKlzA3Y5hv+AQGISdf3GbCd6+/2axPC901kB2H6U1Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZDUI0Tp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZDUI0Tp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715708572; x=1747244572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXWJARemTalBkS754aFMkd7WthVUU1Zim5hGkCU3NKs=;
  b=RZDUI0TpqMoiVo7nVrZE71i8b/OmsMSOMYEUqvVGL2gpOf0xPlEeKjmT
   bQwpOW0+cd0+OkseHDVqd667U/MT0rHQyCFJZB7p1ZDClqT9BK65+fUkO
   CXYQEo6BY9a9TZljU+IlNnvVS045SnLdMhJe3qLBsmm7NLcHmddqUNTyI
   bgYmVPhtFuIsrpKiYYJnP7otRW/rlnGbSlzUj7pzRwFSLV7KabPgGmLqI
   /tXVxdfXR43Uu83BUMp8x+5o+J2pIYZgpXaN/HeXg6vxIJ4PsXoRoCStI
   UKzpRr9pq1w9hFrBDVgGhGtz9tDa2AZQy8xWVCW9QTTX+pHbwhm1rDqkJ
   w==;
X-CSE-ConnectionGUID: xwlpM4hqQpylsqki4itI3w==
X-CSE-MsgGUID: If0mDKmJRfSpBYg4kVX1cA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15532743"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="15532743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 10:42:51 -0700
X-CSE-ConnectionGUID: IjxOMd2dRFeUwg7UCEb5Ag==
X-CSE-MsgGUID: d0NUw8wvRLmFGyE7e96imA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="53979608"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 May 2024 10:42:50 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6wAp-000BqL-2k;
	Tue, 14 May 2024 17:42:47 +0000
Date: Wed, 15 May 2024 01:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:iomap.1 21/21] fs/btrfs/file.c:1254:12: warning:
 'btrfs_buffered_iomap_end' defined but not used
Message-ID: <202405150106.xjJqKG1L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux iomap.1
head:   18dabc17c9eeef85c6c8addf9fec377cfa3d685c
commit: 18dabc17c9eeef85c6c8addf9fec377cfa3d685c [21/21] btrfs: carve out btrfs_buffered_iomap_end
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240515/202405150106.xjJqKG1L-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405150106.xjJqKG1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405150106.xjJqKG1L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/file.c: In function 'btrfs_buffered_write':
   fs/btrfs/file.c:1435:58: error: 'num_pages' undeclared (first use in this function); did you mean 'dir_pages'?
    1435 |                         btrfs_drop_pages(fs_info, pages, num_pages, pos, copied);
         |                                                          ^~~~~~~~~
         |                                                          dir_pages
   fs/btrfs/file.c:1435:58: note: each undeclared identifier is reported only once for each function it appears in
   fs/btrfs/file.c: At top level:
>> fs/btrfs/file.c:1254:12: warning: 'btrfs_buffered_iomap_end' defined but not used [-Wunused-function]
    1254 | static int btrfs_buffered_iomap_end(struct inode *inode, loff_t pos,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/file.c:932:21: warning: 'prepare_pages' defined but not used [-Wunused-function]
     932 | static noinline int prepare_pages(struct inode *inode, struct page **pages,
         |                     ^~~~~~~~~~~~~


vim +/btrfs_buffered_iomap_end +1254 fs/btrfs/file.c

  1253	
> 1254	static int btrfs_buffered_iomap_end(struct inode *inode, loff_t pos,
  1255			loff_t length, ssize_t written, struct btrfs_iomap *bi)
  1256	{
  1257		struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  1258		struct btrfs_inode *btrfs_inode = BTRFS_I(inode);
  1259		loff_t block_start = round_down(pos, fs_info->sectorsize);
  1260		loff_t block_end = round_up(pos + written, fs_info->sectorsize) - 1;
  1261		size_t block_len = block_end + 1 - block_start;
  1262		size_t release_bytes = 0;
  1263		unsigned int extra_bits = 0;
  1264		int ret = 0;
  1265	
  1266		if (bi->metadata_only)
  1267			extra_bits |= EXTENT_NORESERVE;
  1268	
  1269		/*
  1270		 * The pages may have already been dirty, clear out old accounting so
  1271		 * we can set things up properly
  1272		 */
  1273		clear_extent_bit(&btrfs_inode->io_tree, block_start, block_end,
  1274				EXTENT_DELALLOC | EXTENT_DO_ACCOUNTING | EXTENT_DEFRAG,
  1275				&bi->cached_state);
  1276	
  1277		ret = btrfs_set_extent_delalloc(btrfs_inode, block_start, block_end,
  1278				extra_bits, &bi->cached_state);
  1279	
  1280		if (bi->reserved_bytes > block_len) {
  1281			/* release everything except the sectors we dirtied */
  1282			release_bytes = bi->reserved_bytes - block_len;
  1283			if (bi->metadata_only)
  1284				btrfs_delalloc_release_metadata(BTRFS_I(inode),
  1285						release_bytes, true);
  1286			else
  1287				btrfs_delalloc_release_space(BTRFS_I(inode),
  1288						bi->data_reserved, block_end,
  1289						release_bytes, true);
  1290		}
  1291	
  1292		/*
  1293		 * If we have not locked the extent range, because the range's
  1294		 * start offset is >= i_size, we might still have a non-NULL
  1295		 * cached extent state, acquired while marking the extent range
  1296		 * as delalloc through btrfs_dirty_pages(). Therefore free any
  1297		 * possible cached extent state to avoid a memory leak.
  1298		 */
  1299		if (bi->extents_locked)
  1300			unlock_extent(&BTRFS_I(inode)->io_tree, bi->lockstart,
  1301					bi->lockend, &bi->cached_state);
  1302		else
  1303			free_extent_state(bi->cached_state);
  1304	
  1305		btrfs_delalloc_release_extents(BTRFS_I(inode), bi->reserved_bytes);
  1306		return ret;
  1307	}
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
