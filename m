Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7131D52E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 20:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOyWfv20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704314635; x=1735850635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P75mzbEZZXjvAlTvNyPpWxsdIZwzWC5BPNB5iYMp+Ww=;
  b=MOyWfv20deHBP9NJmJNsiqS2EXr2sGguW4OITU+aFD9xoiabfAmMer6d
   IT34b0zpSII6zt6Bj8xy9NerNq2rzunZy6UwPaQK+oEOmOp2c1WVk76Ey
   wW1mQ0AgAEbIKyywBR+/uBd9cEvEq6LJ44WWFqzG9irk26BdheqzjJBfp
   LUU0Z+VCru/0HyzR14Qx1/hs4jCLtehYnR7ulbB1LdcScNA/GqrxI5Bqs
   JnZNw+e16/z/UNH4DltL7zPvBAtGNF2+8OUPB6VJyk0SfFqMDdAcPHbGv
   q3UD407a0E6yrYe6cF4ImIZWRHBZyDMBjRG0/m5esUS2rXZ9S3sefXqkB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="461373814"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="461373814"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 12:43:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="814364378"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="814364378"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Jan 2024 12:43:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL85e-000MYW-1W;
	Wed, 03 Jan 2024 20:43:50 +0000
Date: Thu, 4 Jan 2024 04:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file 41/42] fs/nilfs2/gcinode.c:88:31:
 error: 'struct super_block' has no member named 'f_s_bdev'; did you mean
 's_bdev'?
Message-ID: <202401040416.YFqvQdOH-lkp@intel.com>
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
config: i386-randconfig-013-20240103 (https://download.01.org/0day-ci/archive/20240104/202401040416.YFqvQdOH-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040416.YFqvQdOH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040416.YFqvQdOH-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nilfs2/gcinode.c: In function 'nilfs_gccache_submit_read_data':
>> fs/nilfs2/gcinode.c:88:31: error: 'struct super_block' has no member named 'f_s_bdev'; did you mean 's_bdev'?
      88 |   bh->f_b_bdev = inode->i_sb->f_s_bdev;
         |                               ^~~~~~~~
         |                               s_bdev
--
   fs/nilfs2/mdt.c: In function 'nilfs_mdt_create_block':
>> fs/nilfs2/mdt.c:93:21: error: 'struct super_block' has no member named 'f_s_bdev'; did you mean 's_bdev'?
      93 |  bh->f_b_bdev = sb->f_s_bdev;
         |                     ^~~~~~~~
         |                     s_bdev
--
   fs/nilfs2/recovery.c: In function 'nilfs_compute_checksum':
>> fs/nilfs2/recovery.c:110:24: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
     110 |    bh = __bread(nilfs->ns_f_bdev, ++start, blocksize);
         |                        ^~~~~~~~~
         |                        ns_bdev
   fs/nilfs2/recovery.c: In function 'nilfs_read_super_root_block':
   fs/nilfs2/recovery.c:139:25: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
     139 |  bh_sr = __bread(nilfs->ns_f_bdev, sr_block, nilfs->ns_blocksize);
         |                         ^~~~~~~~~
         |                         ns_bdev
   fs/nilfs2/recovery.c: In function 'nilfs_read_log_header':
   fs/nilfs2/recovery.c:186:26: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
     186 |  bh_sum = __bread(nilfs->ns_f_bdev, start_blocknr, nilfs->ns_blocksize);
         |                          ^~~~~~~~~
         |                          ns_bdev
   fs/nilfs2/recovery.c: In function 'nilfs_read_summary_info':
   fs/nilfs2/recovery.c:253:25: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
     253 |   *pbh = __bread(nilfs->ns_f_bdev, blocknr + 1,
         |                         ^~~~~~~~~
         |                         ns_bdev
   fs/nilfs2/recovery.c: In function 'nilfs_skip_summary_info':
   fs/nilfs2/recovery.c:292:25: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
     292 |   *pbh = __bread(nilfs->ns_f_bdev, blocknr + bcnt,
         |                         ^~~~~~~~~
         |                         ns_bdev
   fs/nilfs2/recovery.c: In function 'nilfs_scan_dsync_log':
   fs/nilfs2/recovery.c:321:22: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
     321 |  bh = __bread(nilfs->ns_f_bdev, start_blocknr, nilfs->ns_blocksize);
         |                      ^~~~~~~~~
         |                      ns_bdev
   fs/nilfs2/recovery.c: In function 'nilfs_recovery_copy_block':
   fs/nilfs2/recovery.c:480:26: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
     480 |  bh_org = __bread(nilfs->ns_f_bdev, rb->blocknr, nilfs->ns_blocksize);
         |                          ^~~~~~~~~
         |                          ns_bdev
   fs/nilfs2/recovery.c: In function 'nilfs_finish_roll_forward':
   fs/nilfs2/recovery.c:699:23: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
     699 |  bh = __getblk(nilfs->ns_f_bdev, ri->ri_lsegs_start, nilfs->ns_blocksize);
         |                       ^~~~~~~~~
         |                       ns_bdev
   fs/nilfs2/recovery.c: In function 'nilfs_search_super_root':
   fs/nilfs2/recovery.c:825:23: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
     825 |   __breadahead(nilfs->ns_f_bdev, b++, nilfs->ns_blocksize);
         |                       ^~~~~~~~~
         |                       ns_bdev
   fs/nilfs2/recovery.c:871:25: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
     871 |     __breadahead(nilfs->ns_f_bdev, b++,
         |                         ^~~~~~~~~
         |                         ns_bdev
--
   fs/nilfs2/the_nilfs.c: In function 'alloc_nilfs':
>> fs/nilfs2/the_nilfs.c:66:9: error: 'struct the_nilfs' has no member named 'ns_f_bdev'; did you mean 'ns_bdev'?
      66 |  nilfs->ns_f_bdev = sb->s_f_bdev;
         |         ^~~~~~~~~
         |         ns_bdev
--
   fs/nilfs2/btnode.c: In function 'nilfs_btnode_create_block':
>> fs/nilfs2/btnode.c:63:30: error: 'struct super_block' has no member named 'f_s_bdev'; did you mean 's_bdev'?
      63 |  bh->f_b_bdev = inode->i_sb->f_s_bdev;
         |                              ^~~~~~~~
         |                              s_bdev
   fs/nilfs2/btnode.c: In function 'nilfs_btnode_submit_block':
   fs/nilfs2/btnode.c:123:30: error: 'struct super_block' has no member named 'f_s_bdev'; did you mean 's_bdev'?
     123 |  bh->f_b_bdev = inode->i_sb->f_s_bdev;
         |                              ^~~~~~~~
         |                              s_bdev


vim +88 fs/nilfs2/gcinode.c

    36	
    37	/*
    38	 * nilfs_gccache_submit_read_data() - add data buffer and submit read request
    39	 * @inode - gc inode
    40	 * @blkoff - dummy offset treated as the key for the page cache
    41	 * @pbn - physical block number of the block
    42	 * @vbn - virtual block number of the block, 0 for non-virtual block
    43	 * @out_bh - indirect pointer to a buffer_head struct to receive the results
    44	 *
    45	 * Description: nilfs_gccache_submit_read_data() registers the data buffer
    46	 * specified by @pbn to the GC pagecache with the key @blkoff.
    47	 * This function sets @vbn (@pbn if @vbn is zero) in b_blocknr of the buffer.
    48	 *
    49	 * Return Value: On success, 0 is returned. On Error, one of the following
    50	 * negative error code is returned.
    51	 *
    52	 * %-EIO - I/O error.
    53	 *
    54	 * %-ENOMEM - Insufficient amount of memory available.
    55	 *
    56	 * %-ENOENT - The block specified with @pbn does not exist.
    57	 */
    58	int nilfs_gccache_submit_read_data(struct inode *inode, sector_t blkoff,
    59					   sector_t pbn, __u64 vbn,
    60					   struct buffer_head **out_bh)
    61	{
    62		struct buffer_head *bh;
    63		int err;
    64	
    65		bh = nilfs_grab_buffer(inode, inode->i_mapping, blkoff, 0);
    66		if (unlikely(!bh))
    67			return -ENOMEM;
    68	
    69		if (buffer_uptodate(bh))
    70			goto out;
    71	
    72		if (pbn == 0) {
    73			struct the_nilfs *nilfs = inode->i_sb->s_fs_info;
    74	
    75			err = nilfs_dat_translate(nilfs->ns_dat, vbn, &pbn);
    76			if (unlikely(err)) /* -EIO, -ENOMEM, -ENOENT */
    77				goto failed;
    78		}
    79	
    80		lock_buffer(bh);
    81		if (buffer_uptodate(bh)) {
    82			unlock_buffer(bh);
    83			goto out;
    84		}
    85	
    86		if (!buffer_mapped(bh)) {
    87			bh->b_bdev = inode->i_sb->s_bdev;
  > 88			bh->f_b_bdev = inode->i_sb->f_s_bdev;
    89			set_buffer_mapped(bh);
    90		}
    91		bh->b_blocknr = pbn;
    92		bh->b_end_io = end_buffer_read_sync;
    93		get_bh(bh);
    94		submit_bh(REQ_OP_READ, bh);
    95		if (vbn)
    96			bh->b_blocknr = vbn;
    97	 out:
    98		err = 0;
    99		*out_bh = bh;
   100	
   101	 failed:
   102		unlock_page(bh->b_page);
   103		put_page(bh->b_page);
   104		if (unlikely(err))
   105			brelse(bh);
   106		return err;
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
