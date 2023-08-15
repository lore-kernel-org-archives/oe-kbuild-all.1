Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11349100DD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692100826; x=1723636826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xpTVoMjHZeeSkyjySelWDAu5QjxZL0yp6xRdHT2cG9M=;
  b=GWng7CB1Z00m1zBytu4IOQUoOxRliIP4XVW97yIxlIooDiS73XnTq6kJ
   2Kph71fIaEEne3rQNRNtDeeWoT4GeeteahZKo0N4vBn5qR68I8jRDNMAn
   cudoY64Os/DEi/4Zl/vXGhX3kjnGlRqidIh0ziAN16Hzx2WIyHSk9a5oe
   5Dm9oIDBICTohQSohKkXIxF0jL7H7Zn7Vt/3soo2A9uLaATKBHayg3QNp
   UMEUkuVF7NJbWrVu3uoHcvFlogxXX+4bv+S+ucBCAiL/Kc+KO1uMRs2LV
   82tzgUblgBoO3PlirlDLvSGQ/aM5dHJ9mkAIazs7IhVxHUMItSBR4PagQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="351848148"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="351848148"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 05:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="877317223"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2023 05:00:26 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVsij-0000w9-2Y;
	Tue, 15 Aug 2023 12:00:21 +0000
Date: Tue, 15 Aug 2023 19:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: Georg Ottinger <g.ottinger@gmx.at>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] ext2: fix datatype of block number in
 ext2_xattr_set2()
Message-ID: <202308151943.Axc7qVP1-lkp@intel.com>
References: <20230815100340.22121-1-g.ottinger@gmx.at>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815100340.22121-1-g.ottinger@gmx.at>

Hi Georg,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc6 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Georg-Ottinger/ext2-fix-datatype-of-block-number-in-ext2_xattr_set2/20230815-180605
base:   linus/master
patch link:    https://lore.kernel.org/r/20230815100340.22121-1-g.ottinger%40gmx.at
patch subject: [PATCH v1] ext2: fix datatype of block number in ext2_xattr_set2()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230815/202308151943.Axc7qVP1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151943.Axc7qVP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151943.Axc7qVP1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:30,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/buffer_head.h:12,
                    from fs/ext2/xattr.c:57:
   fs/ext2/xattr.c: In function 'ext2_xattr_set2':
>> fs/ext2/xattr.c:748:42: warning: format '%d' expects argument of type 'int', but argument 2 has type 'ext2_fsblk_t' {aka 'long unsigned int'} [-Wformat=]
     748 |                         ea_idebug(inode, "creating block %d", block);
         |                                          ^~~~~~~~~~~~~~~~~~~  ~~~~~
         |                                                               |
         |                                                               ext2_fsblk_t {aka long unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   fs/ext2/xattr.c:88:33: note: in expansion of macro 'no_printk'
      88 | # define ea_idebug(inode, f...) no_printk(f)
         |                                 ^~~~~~~~~
   fs/ext2/xattr.c:748:25: note: in expansion of macro 'ea_idebug'
     748 |                         ea_idebug(inode, "creating block %d", block);
         |                         ^~~~~~~~~
   fs/ext2/xattr.c:748:59: note: format string is defined here
     748 |                         ea_idebug(inode, "creating block %d", block);
         |                                                          ~^
         |                                                           |
         |                                                           int
         |                                                          %ld


vim +748 fs/ext2/xattr.c

90ae40d243d46f Jan Kara          2022-07-12  701  
^1da177e4c3f41 Linus Torvalds    2005-04-16  702  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  703   * Second half of ext2_xattr_set(): Update the file system.
^1da177e4c3f41 Linus Torvalds    2005-04-16  704   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  705  static int
^1da177e4c3f41 Linus Torvalds    2005-04-16  706  ext2_xattr_set2(struct inode *inode, struct buffer_head *old_bh,
^1da177e4c3f41 Linus Torvalds    2005-04-16  707  		struct ext2_xattr_header *header)
^1da177e4c3f41 Linus Torvalds    2005-04-16  708  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  709  	struct super_block *sb = inode->i_sb;
^1da177e4c3f41 Linus Torvalds    2005-04-16  710  	struct buffer_head *new_bh = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  711  	int error;
47387409ee2e09 Tahsin Erdogan    2017-06-22  712  	struct mb_cache *ea_block_cache = EA_BLOCK_CACHE(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  713  
^1da177e4c3f41 Linus Torvalds    2005-04-16  714  	if (header) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  715  		new_bh = ext2_xattr_cache_find(inode, header);
^1da177e4c3f41 Linus Torvalds    2005-04-16  716  		if (new_bh) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  717  			/* We found an identical block in the cache. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  718  			if (new_bh == old_bh) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  719  				ea_bdebug(new_bh, "keeping this block");
^1da177e4c3f41 Linus Torvalds    2005-04-16  720  			} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  721  				/* The old block is released after updating
^1da177e4c3f41 Linus Torvalds    2005-04-16  722  				   the inode.  */
^1da177e4c3f41 Linus Torvalds    2005-04-16  723  				ea_bdebug(new_bh, "reusing block");
^1da177e4c3f41 Linus Torvalds    2005-04-16  724  
5dd4056db84387 Christoph Hellwig 2010-03-03  725  				error = dquot_alloc_block(inode, 1);
5dd4056db84387 Christoph Hellwig 2010-03-03  726  				if (error) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  727  					unlock_buffer(new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  728  					goto cleanup;
^1da177e4c3f41 Linus Torvalds    2005-04-16  729  				}
fba4d3997f4c3d Marcin Slusarz    2008-04-28  730  				le32_add_cpu(&HDR(new_bh)->h_refcount, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  731  				ea_bdebug(new_bh, "refcount now=%d",
^1da177e4c3f41 Linus Torvalds    2005-04-16  732  					le32_to_cpu(HDR(new_bh)->h_refcount));
^1da177e4c3f41 Linus Torvalds    2005-04-16  733  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  734  			unlock_buffer(new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  735  		} else if (old_bh && header == HDR(old_bh)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  736  			/* Keep this block. No need to lock the block as we
^1da177e4c3f41 Linus Torvalds    2005-04-16  737  			   don't need to change the reference count. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  738  			new_bh = old_bh;
^1da177e4c3f41 Linus Torvalds    2005-04-16  739  			get_bh(new_bh);
47387409ee2e09 Tahsin Erdogan    2017-06-22  740  			ext2_xattr_cache_insert(ea_block_cache, new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  741  		} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  742  			/* We need to allocate a new block */
24097d12efbb97 Akinobu Mita      2008-04-28  743  			ext2_fsblk_t goal = ext2_group_first_block_no(sb,
24097d12efbb97 Akinobu Mita      2008-04-28  744  						EXT2_I(inode)->i_block_group);
2a9807b4e5f804 Georg Ottinger    2023-08-15  745  			ext2_fsblk_t block = ext2_new_block(inode, goal, &error);
^1da177e4c3f41 Linus Torvalds    2005-04-16  746  			if (error)
^1da177e4c3f41 Linus Torvalds    2005-04-16  747  				goto cleanup;
^1da177e4c3f41 Linus Torvalds    2005-04-16 @748  			ea_idebug(inode, "creating block %d", block);
^1da177e4c3f41 Linus Torvalds    2005-04-16  749  
^1da177e4c3f41 Linus Torvalds    2005-04-16  750  			new_bh = sb_getblk(sb, block);
2b0542a4a0d9b8 Wang Shilong      2013-01-12  751  			if (unlikely(!new_bh)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  752  				ext2_free_blocks(inode, block, 1);
addacc7d6f0f0b Al Viro           2010-07-22  753  				mark_inode_dirty(inode);
ab6a773dbcbd2b Wang Shilong      2013-01-15  754  				error = -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  755  				goto cleanup;
^1da177e4c3f41 Linus Torvalds    2005-04-16  756  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  757  			lock_buffer(new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  758  			memcpy(new_bh->b_data, header, new_bh->b_size);
^1da177e4c3f41 Linus Torvalds    2005-04-16  759  			set_buffer_uptodate(new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  760  			unlock_buffer(new_bh);
47387409ee2e09 Tahsin Erdogan    2017-06-22  761  			ext2_xattr_cache_insert(ea_block_cache, new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  762  			
^1da177e4c3f41 Linus Torvalds    2005-04-16  763  			ext2_xattr_update_super_block(sb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  764  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  765  		mark_buffer_dirty(new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  766  		if (IS_SYNC(inode)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  767  			sync_dirty_buffer(new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  768  			error = -EIO;
^1da177e4c3f41 Linus Torvalds    2005-04-16  769  			if (buffer_req(new_bh) && !buffer_uptodate(new_bh))
^1da177e4c3f41 Linus Torvalds    2005-04-16  770  				goto cleanup;
^1da177e4c3f41 Linus Torvalds    2005-04-16  771  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  772  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  773  
^1da177e4c3f41 Linus Torvalds    2005-04-16  774  	/* Update the inode. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  775  	EXT2_I(inode)->i_file_acl = new_bh ? new_bh->b_blocknr : 0;
02027d42c3f747 Deepa Dinamani    2016-09-14  776  	inode->i_ctime = current_time(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  777  	if (IS_SYNC(inode)) {
c37650161a53c0 Christoph Hellwig 2010-10-06  778  		error = sync_inode_metadata(inode, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  779  		/* In case sync failed due to ENOSPC the inode was actually
^1da177e4c3f41 Linus Torvalds    2005-04-16  780  		 * written (only some dirty data were not) so we just proceed
^1da177e4c3f41 Linus Torvalds    2005-04-16  781  		 * as if nothing happened and cleanup the unused block */
^1da177e4c3f41 Linus Torvalds    2005-04-16  782  		if (error && error != -ENOSPC) {
3889717d2851bf Al Viro           2010-07-22  783  			if (new_bh && new_bh != old_bh) {
3889717d2851bf Al Viro           2010-07-22  784  				dquot_free_block_nodirty(inode, 1);
3889717d2851bf Al Viro           2010-07-22  785  				mark_inode_dirty(inode);
3889717d2851bf Al Viro           2010-07-22  786  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  787  			goto cleanup;
^1da177e4c3f41 Linus Torvalds    2005-04-16  788  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  789  	} else
^1da177e4c3f41 Linus Torvalds    2005-04-16  790  		mark_inode_dirty(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  791  
^1da177e4c3f41 Linus Torvalds    2005-04-16  792  	error = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  793  	if (old_bh && old_bh != new_bh) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  794  		/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  795  		 * If there was an old block and we are no longer using it,
^1da177e4c3f41 Linus Torvalds    2005-04-16  796  		 * release the old block.
^1da177e4c3f41 Linus Torvalds    2005-04-16  797  		 */
90ae40d243d46f Jan Kara          2022-07-12  798  		ext2_xattr_release_block(inode, old_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  799  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  800  
^1da177e4c3f41 Linus Torvalds    2005-04-16  801  cleanup:
^1da177e4c3f41 Linus Torvalds    2005-04-16  802  	brelse(new_bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  803  
^1da177e4c3f41 Linus Torvalds    2005-04-16  804  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  805  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  806  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
