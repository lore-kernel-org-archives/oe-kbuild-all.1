Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6297F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682172227; x=1713708227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CHZjaPH8uKotKqcuZumxHK+TJm5xHq9FTNV17JGk3KU=;
  b=Dix7pmn1ikB23aP9LIjRBArC0O5xYTFTosYYCsx6k0lZGIK3PiZQcBT9
   r2uEC4E4ZzypJeHigzOX9XqYGeoEG40yzhLcEPW8GM8sUtGF637nHDNMm
   +nWV7VHab3SQ2sSIMjETVFXRIdGtZU0hAqDBMbBVrYyWRJjyFFCzrkodN
   eDG2eb8K2jYoUY5K0Aee7KFQx+Exn/JlO4WBlkZodpnyFCGzuWOnajP/f
   u8J8KyZbFdfEPWzR2veE1Zn6guLSqvXsaJ20gd2u9j23JPcabjPEa57At
   nzCA2l7hd6KQe0CCr/Q/rzH5GOZ7yUMPx+oOyXDFFwuIrnmIWCWdfVlsH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="346178111"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="346178111"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 07:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="804044518"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="804044518"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2023 07:03:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqDq4-000hKK-2y;
	Sat, 22 Apr 2023 14:03:44 +0000
Date: Sat, 22 Apr 2023 22:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:make-buffer_heads-optional 14/14] block/fops.c:466:
 undefined reference to `iomap_readahead'
Message-ID: <202304222243.xgrnihyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git make-buffer_heads-optional
head:   174c941608ab09d2dc94900c64dd05128de04796
commit: 174c941608ab09d2dc94900c64dd05128de04796 [14/14] fs: add CONFIG_BUFFER_HEAD
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230422/202304222243.xgrnihyc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block make-buffer_heads-optional
        git checkout 174c941608ab09d2dc94900c64dd05128de04796
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222243.xgrnihyc-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: block/fops.o: in function `blkdev_readahead':
>> block/fops.c:466: undefined reference to `iomap_readahead'
   block/fops.c:466:(.text+0x10): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_readahead'
   nios2-linux-ld: block/fops.o: in function `blkdev_writepages':
>> block/fops.c:492: undefined reference to `iomap_writepages'
   block/fops.c:492:(.text+0x274): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_writepages'
   nios2-linux-ld: block/fops.o: in function `blkdev_read_folio':
>> block/fops.c:461: undefined reference to `iomap_read_folio'
   block/fops.c:461:(.text+0x2a0): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_read_folio'
   nios2-linux-ld: block/fops.o: in function `blkdev_buffered_write':
   block/fops.c:608: undefined reference to `iomap_file_buffered_write'
   block/fops.c:608:(.text+0x13e4): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_file_buffered_write'
   nios2-linux-ld: block/fops.c:608: undefined reference to `iomap_file_buffered_write'
   block/fops.c:608:(.text+0x141c): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_file_buffered_write'
>> nios2-linux-ld: block/fops.o:(.rodata+0xa8): undefined reference to `iomap_invalidate_folio'
>> nios2-linux-ld: block/fops.o:(.rodata+0xac): undefined reference to `iomap_release_folio'
>> nios2-linux-ld: block/fops.o:(.rodata+0xc0): undefined reference to `iomap_is_partially_uptodate'


vim +466 block/fops.c

   446	
   447	const struct address_space_operations def_blk_aops = {
   448		.dirty_folio	= block_dirty_folio,
   449		.invalidate_folio = block_invalidate_folio,
   450		.read_folio	= blkdev_read_folio,
   451		.readahead	= blkdev_readahead,
   452		.writepage	= blkdev_writepage,
   453		.write_begin	= blkdev_write_begin,
   454		.write_end	= blkdev_write_end,
   455		.migrate_folio	= buffer_migrate_folio_norefs,
   456		.is_dirty_writeback = buffer_check_dirty_writeback,
   457	};
   458	#else /* CONFIG_BUFFER_HEAD */
   459	static int blkdev_read_folio(struct file *file, struct folio *folio)
   460	{
 > 461		return iomap_read_folio(folio, &blkdev_iomap_ops);
   462	}
   463	
   464	static void blkdev_readahead(struct readahead_control *rac)
   465	{
 > 466		iomap_readahead(rac, &blkdev_iomap_ops);
   467	}
   468	
   469	static int blkdev_map_blocks(struct iomap_writepage_ctx *wpc,
   470			struct inode *inode, loff_t offset)
   471	{
   472		loff_t isize = i_size_read(inode);
   473	
   474		if (WARN_ON_ONCE(offset >= isize))
   475			return -EIO;
   476		if (offset >= wpc->iomap.offset &&
   477		    offset < wpc->iomap.offset + wpc->iomap.length)
   478			return 0;
   479		return blkdev_iomap_begin(inode, offset, isize - offset,
   480					  IOMAP_WRITE, &wpc->iomap, NULL);
   481	}
   482	
   483	static const struct iomap_writeback_ops blkdev_writeback_ops = {
   484		.map_blocks		= blkdev_map_blocks,
   485	};
   486	
   487	static int blkdev_writepages(struct address_space *mapping,
   488			struct writeback_control *wbc)
   489	{
   490		struct iomap_writepage_ctx wpc = { };
   491	
 > 492		return iomap_writepages(mapping, wbc, &wpc, &blkdev_writeback_ops);
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
