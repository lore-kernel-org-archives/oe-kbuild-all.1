Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26483290DB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783160968; cv=none; b=hfafjnQHdsq2l6ttDS0xhNRWo/wkWLjsjjfh0X8h4FAX4Pj2LIP9436xZ0Umi0MJNiWFqIJ0QpJ/S1h8qfH5IGXh7LqV2V98FbrWUiOGeCGgllWE5ME6hFu1ovC03y8doIwubMVAOWT+O2aoDZyeqnDSjh7wdrkycb9w5RWGV1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783160968; c=relaxed/simple;
	bh=8nm1XKihwUjtH/GdqfqtWF7x57GVGJscwfth2TMw64s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PRPZ2/eanfn6bW2pguUiMZzStWnpSvjFZbQdwIVTcnQuBhf0LMdPgt3Ll5zeMzpPiaqnKFrmTYKAR1Yhyhj3fDUOHjghANSrz/HFV0ZlOlaBZxADhpS4wx+IeztxGu+a530Tn8mWh9iqXb3pe6fPp5q7HrsnHdge11Cy2vlzy8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbO/xbzv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbO/xbzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783160967; x=1814696967;
  h=date:from:to:cc:subject:message-id;
  bh=8nm1XKihwUjtH/GdqfqtWF7x57GVGJscwfth2TMw64s=;
  b=hbO/xbzvKr3soADH0aGQKHvj6DuE+FvQovSJhmJ9qzrhuisaZh92Ut70
   lon0NKBDL176GwlDjv3Jv8+1mcu2ZFARsoCkWnFP1eWXcUjvpvhMDk3GY
   nKqw1x6qq+S/zI9NujWXLAVJx48TQ8WgUWUSn/IxAYdYBHuBN6ipVl08V
   MHou/g7p1uYxnsBhoZW9Z4LQVND9jOCP0mDqSKlYhE3c3uKTE1gb/3EyV
   vDd1UthLVVdoJeTOcn8LuEfst6zjLr9vRYhKBUV4YmT3CV3dUCPMMAt4Q
   QtdDJo0so2Zb6b7RUHySZMLDP/b8iVryGq8fvxzGMGKvDigvx7VFdWn/x
   w==;
X-CSE-ConnectionGUID: eCra9n7ESfG8G1dfSnodpw==
X-CSE-MsgGUID: 6QEn/8mgScKuUWmIEYPu7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="101423832"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="101423832"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 03:29:26 -0700
X-CSE-ConnectionGUID: W/saeH5oSWyrHKDFEuNX6w==
X-CSE-MsgGUID: CWx9+PYQSl6dzdgNvFy5oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="246903116"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jul 2026 03:29:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfxcV-00000000Czb-0Ogs;
	Sat, 04 Jul 2026 10:29:15 +0000
Date: Sat, 04 Jul 2026 18:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1] fs/ext4/mballoc.c:5318:
 warning: Excess function parameter 'bh' description in 'ext4_mb_clear_bb'
Message-ID: <202607041844.HMaVAWJl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   a00af2707c1d0a67daa8f91db74300f65d84db3b
commit: 8ddbd3df9314d82afc0881dca4aef0c736422dd2 [0/1] UPSTREAM: ext4: refactor ext4_free_blocks() to pull out ext4_mb_clear_bb()
config: i386-randconfig-012-20260702 (https://download.01.org/0day-ci/archive/20260704/202607041844.HMaVAWJl-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041844.HMaVAWJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041844.HMaVAWJl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/mballoc.c:5318: warning: Excess function parameter 'bh' description in 'ext4_mb_clear_bb'


vim +5318 fs/ext4/mballoc.c

8016e29f4362e2 Harshad Shirwadkar    2020-10-15  5304  
4433871130f365 Theodore Ts'o         2009-11-22  5305  /**
8ddbd3df9314d8 Ritesh Harjani        2022-02-16  5306   * ext4_mb_clear_bb() -- helper function for freeing blocks.
8ddbd3df9314d8 Ritesh Harjani        2022-02-16  5307   *			Used by ext4_free_blocks()
4433871130f365 Theodore Ts'o         2009-11-22  5308   * @handle:		handle for this transaction
4433871130f365 Theodore Ts'o         2009-11-22  5309   * @inode:		inode
c60990b361cc0a Theodore Ts'o         2019-06-19  5310   * @bh:			optional buffer of the block to be freed
c60990b361cc0a Theodore Ts'o         2019-06-19  5311   * @block:		starting physical block to be freed
c60990b361cc0a Theodore Ts'o         2019-06-19  5312   * @count:		number of blocks to be freed
5def1360252b97 Yongqiang Yang        2011-06-05  5313   * @flags:		flags used by ext4_free_blocks
c9de560ded61fa Alex Tomas            2008-01-29  5314   */
8ddbd3df9314d8 Ritesh Harjani        2022-02-16  5315  static void ext4_mb_clear_bb(handle_t *handle, struct inode *inode,
8ddbd3df9314d8 Ritesh Harjani        2022-02-16  5316  			       ext4_fsblk_t block, unsigned long count,
8ddbd3df9314d8 Ritesh Harjani        2022-02-16  5317  			       int flags)
c9de560ded61fa Alex Tomas            2008-01-29 @5318  {
26346ff681cb42 Aneesh Kumar K.V      2008-02-10  5319  	struct buffer_head *bitmap_bh = NULL;
c9de560ded61fa Alex Tomas            2008-01-29  5320  	struct super_block *sb = inode->i_sb;
c9de560ded61fa Alex Tomas            2008-01-29  5321  	struct ext4_group_desc *gdp;
498e5f24158da7 Theodore Ts'o         2008-11-05  5322  	unsigned int overflow;
c9de560ded61fa Alex Tomas            2008-01-29  5323  	ext4_grpblk_t bit;
c9de560ded61fa Alex Tomas            2008-01-29  5324  	struct buffer_head *gd_bh;
c9de560ded61fa Alex Tomas            2008-01-29  5325  	ext4_group_t block_group;
c9de560ded61fa Alex Tomas            2008-01-29  5326  	struct ext4_sb_info *sbi;
c9de560ded61fa Alex Tomas            2008-01-29  5327  	struct ext4_buddy e4b;
84130193e0e656 Theodore Ts'o         2011-09-09  5328  	unsigned int count_clusters;
c9de560ded61fa Alex Tomas            2008-01-29  5329  	int err = 0;
c9de560ded61fa Alex Tomas            2008-01-29  5330  	int ret;
c9de560ded61fa Alex Tomas            2008-01-29  5331  
8016e29f4362e2 Harshad Shirwadkar    2020-10-15  5332  	sbi = EXT4_SB(sb);
8016e29f4362e2 Harshad Shirwadkar    2020-10-15  5333  
c9de560ded61fa Alex Tomas            2008-01-29  5334  do_more:
c9de560ded61fa Alex Tomas            2008-01-29  5335  	overflow = 0;
c9de560ded61fa Alex Tomas            2008-01-29  5336  	ext4_get_group_no_and_offset(sb, block, &block_group, &bit);
c9de560ded61fa Alex Tomas            2008-01-29  5337  
163a203ddb36c3 Darrick J. Wong       2013-08-28  5338  	if (unlikely(EXT4_MB_GRP_BBITMAP_CORRUPT(
163a203ddb36c3 Darrick J. Wong       2013-08-28  5339  			ext4_get_group_info(sb, block_group))))
163a203ddb36c3 Darrick J. Wong       2013-08-28  5340  		return;
163a203ddb36c3 Darrick J. Wong       2013-08-28  5341  
c9de560ded61fa Alex Tomas            2008-01-29  5342  	/*
c9de560ded61fa Alex Tomas            2008-01-29  5343  	 * Check to see if we are freeing blocks across a group
c9de560ded61fa Alex Tomas            2008-01-29  5344  	 * boundary.
c9de560ded61fa Alex Tomas            2008-01-29  5345  	 */
84130193e0e656 Theodore Ts'o         2011-09-09  5346  	if (EXT4_C2B(sbi, bit) + count > EXT4_BLOCKS_PER_GROUP(sb)) {
84130193e0e656 Theodore Ts'o         2011-09-09  5347  		overflow = EXT4_C2B(sbi, bit) + count -
84130193e0e656 Theodore Ts'o         2011-09-09  5348  			EXT4_BLOCKS_PER_GROUP(sb);
c9de560ded61fa Alex Tomas            2008-01-29  5349  		count -= overflow;
c9de560ded61fa Alex Tomas            2008-01-29  5350  	}
810da240f221d6 Lukas Czerner         2013-03-02  5351  	count_clusters = EXT4_NUM_B2C(sbi, count);
574ca174c97f79 Theodore Ts'o         2008-07-11  5352  	bitmap_bh = ext4_read_block_bitmap(sb, block_group);
9008a58e5dcee0 Darrick J. Wong       2015-10-17  5353  	if (IS_ERR(bitmap_bh)) {
9008a58e5dcee0 Darrick J. Wong       2015-10-17  5354  		err = PTR_ERR(bitmap_bh);
9008a58e5dcee0 Darrick J. Wong       2015-10-17  5355  		bitmap_bh = NULL;
c9de560ded61fa Alex Tomas            2008-01-29  5356  		goto error_return;
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5357  	}
c9de560ded61fa Alex Tomas            2008-01-29  5358  	gdp = ext4_get_group_desc(sb, block_group, &gd_bh);
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5359  	if (!gdp) {
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5360  		err = -EIO;
c9de560ded61fa Alex Tomas            2008-01-29  5361  		goto error_return;
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5362  	}
c9de560ded61fa Alex Tomas            2008-01-29  5363  
c9de560ded61fa Alex Tomas            2008-01-29  5364  	if (in_range(ext4_block_bitmap(sb, gdp), block, count) ||
c9de560ded61fa Alex Tomas            2008-01-29  5365  	    in_range(ext4_inode_bitmap(sb, gdp), block, count) ||
c9de560ded61fa Alex Tomas            2008-01-29  5366  	    in_range(block, ext4_inode_table(sb, gdp),
49598e04b5a1c3 Jun Piao              2018-01-11  5367  		     sbi->s_itb_per_group) ||
c9de560ded61fa Alex Tomas            2008-01-29  5368  	    in_range(block + count - 1, ext4_inode_table(sb, gdp),
49598e04b5a1c3 Jun Piao              2018-01-11  5369  		     sbi->s_itb_per_group)) {
c9de560ded61fa Alex Tomas            2008-01-29  5370  
12062dddda4509 Eric Sandeen          2010-02-15  5371  		ext4_error(sb, "Freeing blocks in system zone - "
0610b6e9993982 Theodore Ts'o         2009-06-15  5372  			   "Block = %llu, count = %lu", block, count);
519deca0496a4d Aneesh Kumar K.V      2008-05-15  5373  		/* err = 0. ext4_std_error should be a no op */
519deca0496a4d Aneesh Kumar K.V      2008-05-15  5374  		goto error_return;
c9de560ded61fa Alex Tomas            2008-01-29  5375  	}
c9de560ded61fa Alex Tomas            2008-01-29  5376  
c9de560ded61fa Alex Tomas            2008-01-29  5377  	BUFFER_TRACE(bitmap_bh, "getting write access");
c9de560ded61fa Alex Tomas            2008-01-29  5378  	err = ext4_journal_get_write_access(handle, bitmap_bh);
c9de560ded61fa Alex Tomas            2008-01-29  5379  	if (err)
c9de560ded61fa Alex Tomas            2008-01-29  5380  		goto error_return;
c9de560ded61fa Alex Tomas            2008-01-29  5381  
c9de560ded61fa Alex Tomas            2008-01-29  5382  	/*
c9de560ded61fa Alex Tomas            2008-01-29  5383  	 * We are about to modify some metadata.  Call the journal APIs
c9de560ded61fa Alex Tomas            2008-01-29  5384  	 * to unshare ->b_data if a currently-committing transaction is
c9de560ded61fa Alex Tomas            2008-01-29  5385  	 * using it
c9de560ded61fa Alex Tomas            2008-01-29  5386  	 */
c9de560ded61fa Alex Tomas            2008-01-29  5387  	BUFFER_TRACE(gd_bh, "get_write_access");
c9de560ded61fa Alex Tomas            2008-01-29  5388  	err = ext4_journal_get_write_access(handle, gd_bh);
c9de560ded61fa Alex Tomas            2008-01-29  5389  	if (err)
c9de560ded61fa Alex Tomas            2008-01-29  5390  		goto error_return;
c9de560ded61fa Alex Tomas            2008-01-29  5391  #ifdef AGGRESSIVE_CHECK
c9de560ded61fa Alex Tomas            2008-01-29  5392  	{
c9de560ded61fa Alex Tomas            2008-01-29  5393  		int i;
84130193e0e656 Theodore Ts'o         2011-09-09  5394  		for (i = 0; i < count_clusters; i++)
c9de560ded61fa Alex Tomas            2008-01-29  5395  			BUG_ON(!mb_test_bit(bit + i, bitmap_bh->b_data));
c9de560ded61fa Alex Tomas            2008-01-29  5396  	}
c9de560ded61fa Alex Tomas            2008-01-29  5397  #endif
84130193e0e656 Theodore Ts'o         2011-09-09  5398  	trace_ext4_mballoc_free(sb, inode, block_group, bit, count_clusters);
c9de560ded61fa Alex Tomas            2008-01-29  5399  
adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  5400  	/* __GFP_NOFAIL: retry infinitely, ignore TIF_MEMDIE and memcg limit. */
adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  5401  	err = ext4_mb_load_buddy_gfp(sb, block_group, &e4b,
adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  5402  				     GFP_NOFS|__GFP_NOFAIL);
920313a726e04f Aneesh Kumar K.V      2009-01-05  5403  	if (err)
920313a726e04f Aneesh Kumar K.V      2009-01-05  5404  		goto error_return;
e6362609b6c71c Theodore Ts'o         2009-11-23  5405  
f96c450dabf549 Daeho Jeong           2016-02-21  5406  	/*
f96c450dabf549 Daeho Jeong           2016-02-21  5407  	 * We need to make sure we don't reuse the freed block until after the
f96c450dabf549 Daeho Jeong           2016-02-21  5408  	 * transaction is committed. We make an exception if the inode is to be
f96c450dabf549 Daeho Jeong           2016-02-21  5409  	 * written in writeback mode since writeback mode has weak data
f96c450dabf549 Daeho Jeong           2016-02-21  5410  	 * consistency guarantees.
f96c450dabf549 Daeho Jeong           2016-02-21  5411  	 */
f96c450dabf549 Daeho Jeong           2016-02-21  5412  	if (ext4_handle_valid(handle) &&
f96c450dabf549 Daeho Jeong           2016-02-21  5413  	    ((flags & EXT4_FREE_BLOCKS_METADATA) ||
f96c450dabf549 Daeho Jeong           2016-02-21  5414  	     !ext4_should_writeback_data(inode))) {
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5415  		struct ext4_free_data *new_entry;
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5416  		/*
7444a072c387a9 Michal Hocko          2015-07-05  5417  		 * We use __GFP_NOFAIL because ext4_free_blocks() is not allowed
7444a072c387a9 Michal Hocko          2015-07-05  5418  		 * to fail.
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5419  		 */
7444a072c387a9 Michal Hocko          2015-07-05  5420  		new_entry = kmem_cache_alloc(ext4_free_data_cachep,
7444a072c387a9 Michal Hocko          2015-07-05  5421  				GFP_NOFS|__GFP_NOFAIL);
18aadd47f88464 Bobi Jam              2012-02-20  5422  		new_entry->efd_start_cluster = bit;
18aadd47f88464 Bobi Jam              2012-02-20  5423  		new_entry->efd_group = block_group;
18aadd47f88464 Bobi Jam              2012-02-20  5424  		new_entry->efd_count = count_clusters;
18aadd47f88464 Bobi Jam              2012-02-20  5425  		new_entry->efd_tid = handle->h_transaction->t_tid;
955ce5f5be67df Aneesh Kumar K.V      2009-05-02  5426  
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5427  		ext4_lock_group(sb, block_group);
84130193e0e656 Theodore Ts'o         2011-09-09  5428  		mb_clear_bits(bitmap_bh->b_data, bit, count_clusters);
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5429  		ext4_mb_free_metadata(handle, &e4b, new_entry);
c9de560ded61fa Alex Tomas            2008-01-29  5430  	} else {
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5431  		/* need to update group_info->bb_free and bitmap
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5432  		 * with group lock held. generate_buddy look at
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5433  		 * them with group lock_held
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5434  		 */
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  5435  		if (test_opt(sb, DISCARD)) {
a015434480dcdb Daeho Jeong           2017-06-22  5436  			err = ext4_issue_discard(sb, block_group, bit, count,
a015434480dcdb Daeho Jeong           2017-06-22  5437  						 NULL);
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  5438  			if (err && err != -EOPNOTSUPP)
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  5439  				ext4_msg(sb, KERN_WARNING, "discard request in"
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  5440  					 " group:%d block:%d count:%lu failed"
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  5441  					 " with %d", block_group, bit, count,
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  5442  					 err);
8f9ff189205a68 Lukas Czerner         2013-10-30  5443  		} else
8f9ff189205a68 Lukas Czerner         2013-10-30  5444  			EXT4_MB_GRP_CLEAR_TRIMMED(e4b.bd_info);
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  5445  
955ce5f5be67df Aneesh Kumar K.V      2009-05-02  5446  		ext4_lock_group(sb, block_group);
84130193e0e656 Theodore Ts'o         2011-09-09  5447  		mb_clear_bits(bitmap_bh->b_data, bit, count_clusters);
84130193e0e656 Theodore Ts'o         2011-09-09  5448  		mb_free_blocks(inode, &e4b, bit, count_clusters);
c9de560ded61fa Alex Tomas            2008-01-29  5449  	}
c9de560ded61fa Alex Tomas            2008-01-29  5450  
021b65bb1e4e4b Theodore Ts'o         2011-09-09  5451  	ret = ext4_free_group_clusters(sb, gdp) + count_clusters;
021b65bb1e4e4b Theodore Ts'o         2011-09-09  5452  	ext4_free_group_clusters_set(sb, gdp, ret);
79f1ba49569e5a Tao Ma                2012-10-22  5453  	ext4_block_bitmap_csum_set(sb, block_group, gdp, bitmap_bh);
feb0ab32a57e4e Darrick J. Wong       2012-04-29  5454  	ext4_group_desc_csum_set(sb, block_group, gdp);
955ce5f5be67df Aneesh Kumar K.V      2009-05-02  5455  	ext4_unlock_group(sb, block_group);
c9de560ded61fa Alex Tomas            2008-01-29  5456  
772cb7c83ba256 Jose R. Santos        2008-07-11  5457  	if (sbi->s_log_groups_per_flex) {
772cb7c83ba256 Jose R. Santos        2008-07-11  5458  		ext4_group_t flex_group = ext4_flex_group(sbi, block_group);
90ba983f6889e6 Theodore Ts'o         2013-03-11  5459  		atomic64_add(count_clusters,
7c990728b99ed6 Suraj Jitindar Singh  2020-02-18  5460  			     &sbi_array_rcu_deref(sbi, s_flex_groups,
7c990728b99ed6 Suraj Jitindar Singh  2020-02-18  5461  						  flex_group)->free_clusters);
772cb7c83ba256 Jose R. Santos        2008-07-11  5462  	}
772cb7c83ba256 Jose R. Santos        2008-07-11  5463  
9fe671496b6c28 Eric Whitney          2018-10-01  5464  	/*
9fe671496b6c28 Eric Whitney          2018-10-01  5465  	 * on a bigalloc file system, defer the s_freeclusters_counter
9fe671496b6c28 Eric Whitney          2018-10-01  5466  	 * update to the caller (ext4_remove_space and friends) so they
9fe671496b6c28 Eric Whitney          2018-10-01  5467  	 * can determine if a cluster freed here should be rereserved
9fe671496b6c28 Eric Whitney          2018-10-01  5468  	 */
9fe671496b6c28 Eric Whitney          2018-10-01  5469  	if (!(flags & EXT4_FREE_BLOCKS_RERESERVE_CLUSTER)) {
7b415bf60f6afb Aditya Kali           2011-09-09  5470  		if (!(flags & EXT4_FREE_BLOCKS_NO_QUOT_UPDATE))
7b415bf60f6afb Aditya Kali           2011-09-09  5471  			dquot_free_block(inode, EXT4_C2B(sbi, count_clusters));
9fe671496b6c28 Eric Whitney          2018-10-01  5472  		percpu_counter_add(&sbi->s_freeclusters_counter,
9fe671496b6c28 Eric Whitney          2018-10-01  5473  				   count_clusters);
9fe671496b6c28 Eric Whitney          2018-10-01  5474  	}
7d7345322d60ed Jan Kara              2013-08-17  5475  
7d7345322d60ed Jan Kara              2013-08-17  5476  	ext4_mb_unload_buddy(&e4b);
7b415bf60f6afb Aditya Kali           2011-09-09  5477  
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5478  	/* We dirtied the bitmap block */
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5479  	BUFFER_TRACE(bitmap_bh, "dirtied bitmap block");
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5480  	err = ext4_handle_dirty_metadata(handle, NULL, bitmap_bh);
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5481  
c9de560ded61fa Alex Tomas            2008-01-29  5482  	/* And the group descriptor block */
c9de560ded61fa Alex Tomas            2008-01-29  5483  	BUFFER_TRACE(gd_bh, "dirtied group descriptor block");
0390131ba84fd3 Frank Mayhar          2009-01-07  5484  	ret = ext4_handle_dirty_metadata(handle, NULL, gd_bh);
c9de560ded61fa Alex Tomas            2008-01-29  5485  	if (!err)
c9de560ded61fa Alex Tomas            2008-01-29  5486  		err = ret;
c9de560ded61fa Alex Tomas            2008-01-29  5487  
c9de560ded61fa Alex Tomas            2008-01-29  5488  	if (overflow && !err) {
c9de560ded61fa Alex Tomas            2008-01-29  5489  		block += count;
c9de560ded61fa Alex Tomas            2008-01-29  5490  		count = overflow;
c9de560ded61fa Alex Tomas            2008-01-29  5491  		put_bh(bitmap_bh);
c9de560ded61fa Alex Tomas            2008-01-29  5492  		goto do_more;
c9de560ded61fa Alex Tomas            2008-01-29  5493  	}
c9de560ded61fa Alex Tomas            2008-01-29  5494  error_return:
c9de560ded61fa Alex Tomas            2008-01-29  5495  	brelse(bitmap_bh);
c9de560ded61fa Alex Tomas            2008-01-29  5496  	ext4_std_error(sb, err);
c9de560ded61fa Alex Tomas            2008-01-29  5497  	return;
c9de560ded61fa Alex Tomas            2008-01-29  5498  }
7360d1731e5dc7 Lukas Czerner         2010-10-27  5499  

:::::: The code at line 5318 was first introduced by commit
:::::: c9de560ded61faa5b754137b7753da252391c55a ext4: Add multi block allocator for ext4

:::::: TO: Alex Tomas <alex@clusterfs.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
