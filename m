Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757A3742C1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 11:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685099369; x=1716635369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6Tsu05dAmkquF25vD9m8HF1LMLSfRTTh3Uz6fpOY1E=;
  b=a6YYWosLrn5w3eVv+Bk7c3wcrkYtooS3OjB7k2AnvmuqAvU+ENzuwydb
   VRAcB8MayHt9cE1ifmD643A5OXRFd6gOlDEmvj0piELBIVMP7D/fhGeHX
   545dGL3sZI8CBaClcqI0OrlEryUDog40n7T/+3x7OeGsGFSRP/gXoIUNU
   HR/coZAZ9ogin71pmhF+kMoi5ZUbkRNkXm+F//NFzL1u3YmIcCxfoWiMt
   dtZd4/z22GGjYgJXuB0a8AXmF3Zk/LXMSQoxpMte1BE3l3orvScuio7U5
   XDuRmi0Cjp/vBt9j5WQReKtBJTQy4mBC7A7VBB203FIEKIT5ITVfwwI6a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="417663735"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="417663735"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 04:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="879527538"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="879527538"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 04:09:27 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2VK2-000JHD-2u;
	Fri, 26 May 2023 11:09:26 +0000
Date: Fri, 26 May 2023 19:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230525 7/31] block/fops.c:466: undefined
 reference to `iomap_readahead'
Message-ID: <202305261948.oXzRlhpS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230525
head:   1e9b17615c8ad5829f88f54de36523f291a145cc
commit: 0a38f7349c750c34175ac4d5ca6bf5861708238e [7/31] fs: add CONFIG_BUFFER_HEAD
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230526/202305261948.oXzRlhpS-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=0a38f7349c750c34175ac4d5ca6bf5861708238e
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next large-block-20230525
        git checkout 0a38f7349c750c34175ac4d5ca6bf5861708238e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261948.oXzRlhpS-lkp@intel.com/

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
   block/fops.c:611: undefined reference to `iomap_file_buffered_write'
   block/fops.c:611:(.text+0x14bc): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_file_buffered_write'
   nios2-linux-ld: block/fops.c:611: undefined reference to `iomap_file_buffered_write'
   block/fops.c:611:(.text+0x1570): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_file_buffered_write'
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
https://github.com/intel/lkp-tests/wiki
