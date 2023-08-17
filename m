Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECF5171BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692294879; x=1723830879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o8kpVKZ4qF3ELiOuvzaCIn9gGHSoclDI+w6C5YsE2qw=;
  b=cd4MtNKvetV14XcOuH0CMaIQ7i5IaxYAlSudBz+DWXcG2ddhecUI5jKM
   fmxOrxaqV5QtxA4T9sxrxjFIaE6lE0YUmf9WYYOJvWaPFAPp9lKtR6s4o
   //CVKrHU0LMOSZRY0asQRn8UHM+sS/SK734TN72UXSdvgs6zQQV8aW18K
   fe89o1Gu3DxnfSr6GJip0BUv9FECT2FXy7gCZKLtYwrgynwAn/izz2UcM
   clMAYIWhX7YB60O3+TXZJSibie9+QFhgiZ5ReuODh9wypOkIhNwsl9sQ/
   OdOiX0191p+3QFG+Qniu/6Yxpgj4SgbY/9oHMp2Hm0x6adbLSQcwa2lEQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="370355926"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="370355926"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 10:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728238052"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="728238052"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 10:54:36 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWhCd-0001Md-1l;
	Thu, 17 Aug 2023 17:54:35 +0000
Date: Fri, 18 Aug 2023 01:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ritesh Harjani <riteshh@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [stable:linux-5.15.y 7075/9999] fs/ext4/mballoc.c:5903: warning:
 Excess function parameter 'bh' description in 'ext4_mb_clear_bb'
Message-ID: <202308180155.gOO89MKk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: 09546886a0eaf21238b389ababa562f61bb193ab [7075/9999] ext4: refactor ext4_free_blocks() to pull out ext4_mb_clear_bb()
config: x86_64-randconfig-x062-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180155.gOO89MKk-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180155.gOO89MKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180155.gOO89MKk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/mballoc.c:5903: warning: Excess function parameter 'bh' description in 'ext4_mb_clear_bb'


vim +5903 fs/ext4/mballoc.c

8016e29f4362e2 Harshad Shirwadkar    2020-10-15  5889  
4433871130f365 Theodore Ts'o         2009-11-22  5890  /**
09546886a0eaf2 Ritesh Harjani        2022-02-16  5891   * ext4_mb_clear_bb() -- helper function for freeing blocks.
09546886a0eaf2 Ritesh Harjani        2022-02-16  5892   *			Used by ext4_free_blocks()
4433871130f365 Theodore Ts'o         2009-11-22  5893   * @handle:		handle for this transaction
4433871130f365 Theodore Ts'o         2009-11-22  5894   * @inode:		inode
c60990b361cc0a Theodore Ts'o         2019-06-19  5895   * @bh:			optional buffer of the block to be freed
c60990b361cc0a Theodore Ts'o         2019-06-19  5896   * @block:		starting physical block to be freed
c60990b361cc0a Theodore Ts'o         2019-06-19  5897   * @count:		number of blocks to be freed
5def1360252b97 Yongqiang Yang        2011-06-05  5898   * @flags:		flags used by ext4_free_blocks
c9de560ded61fa Alex Tomas            2008-01-29  5899   */
09546886a0eaf2 Ritesh Harjani        2022-02-16  5900  static void ext4_mb_clear_bb(handle_t *handle, struct inode *inode,
09546886a0eaf2 Ritesh Harjani        2022-02-16  5901  			       ext4_fsblk_t block, unsigned long count,
09546886a0eaf2 Ritesh Harjani        2022-02-16  5902  			       int flags)
c9de560ded61fa Alex Tomas            2008-01-29 @5903  {
26346ff681cb42 Aneesh Kumar K.V      2008-02-10  5904  	struct buffer_head *bitmap_bh = NULL;
c9de560ded61fa Alex Tomas            2008-01-29  5905  	struct super_block *sb = inode->i_sb;
c9de560ded61fa Alex Tomas            2008-01-29  5906  	struct ext4_group_desc *gdp;
498e5f24158da7 Theodore Ts'o         2008-11-05  5907  	unsigned int overflow;
c9de560ded61fa Alex Tomas            2008-01-29  5908  	ext4_grpblk_t bit;
c9de560ded61fa Alex Tomas            2008-01-29  5909  	struct buffer_head *gd_bh;
c9de560ded61fa Alex Tomas            2008-01-29  5910  	ext4_group_t block_group;
c9de560ded61fa Alex Tomas            2008-01-29  5911  	struct ext4_sb_info *sbi;
c9de560ded61fa Alex Tomas            2008-01-29  5912  	struct ext4_buddy e4b;
84130193e0e656 Theodore Ts'o         2011-09-09  5913  	unsigned int count_clusters;
c9de560ded61fa Alex Tomas            2008-01-29  5914  	int err = 0;
c9de560ded61fa Alex Tomas            2008-01-29  5915  	int ret;
c9de560ded61fa Alex Tomas            2008-01-29  5916  
8016e29f4362e2 Harshad Shirwadkar    2020-10-15  5917  	sbi = EXT4_SB(sb);
8016e29f4362e2 Harshad Shirwadkar    2020-10-15  5918  
c9de560ded61fa Alex Tomas            2008-01-29  5919  do_more:
c9de560ded61fa Alex Tomas            2008-01-29  5920  	overflow = 0;
c9de560ded61fa Alex Tomas            2008-01-29  5921  	ext4_get_group_no_and_offset(sb, block, &block_group, &bit);
c9de560ded61fa Alex Tomas            2008-01-29  5922  
163a203ddb36c3 Darrick J. Wong       2013-08-28  5923  	if (unlikely(EXT4_MB_GRP_BBITMAP_CORRUPT(
163a203ddb36c3 Darrick J. Wong       2013-08-28  5924  			ext4_get_group_info(sb, block_group))))
163a203ddb36c3 Darrick J. Wong       2013-08-28  5925  		return;
163a203ddb36c3 Darrick J. Wong       2013-08-28  5926  
c9de560ded61fa Alex Tomas            2008-01-29  5927  	/*
c9de560ded61fa Alex Tomas            2008-01-29  5928  	 * Check to see if we are freeing blocks across a group
c9de560ded61fa Alex Tomas            2008-01-29  5929  	 * boundary.
c9de560ded61fa Alex Tomas            2008-01-29  5930  	 */
84130193e0e656 Theodore Ts'o         2011-09-09  5931  	if (EXT4_C2B(sbi, bit) + count > EXT4_BLOCKS_PER_GROUP(sb)) {
84130193e0e656 Theodore Ts'o         2011-09-09  5932  		overflow = EXT4_C2B(sbi, bit) + count -
84130193e0e656 Theodore Ts'o         2011-09-09  5933  			EXT4_BLOCKS_PER_GROUP(sb);
c9de560ded61fa Alex Tomas            2008-01-29  5934  		count -= overflow;
c9de560ded61fa Alex Tomas            2008-01-29  5935  	}
810da240f221d6 Lukas Czerner         2013-03-02  5936  	count_clusters = EXT4_NUM_B2C(sbi, count);
574ca174c97f79 Theodore Ts'o         2008-07-11  5937  	bitmap_bh = ext4_read_block_bitmap(sb, block_group);
9008a58e5dcee0 Darrick J. Wong       2015-10-17  5938  	if (IS_ERR(bitmap_bh)) {
9008a58e5dcee0 Darrick J. Wong       2015-10-17  5939  		err = PTR_ERR(bitmap_bh);
9008a58e5dcee0 Darrick J. Wong       2015-10-17  5940  		bitmap_bh = NULL;
c9de560ded61fa Alex Tomas            2008-01-29  5941  		goto error_return;
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5942  	}
c9de560ded61fa Alex Tomas            2008-01-29  5943  	gdp = ext4_get_group_desc(sb, block_group, &gd_bh);
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5944  	if (!gdp) {
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5945  		err = -EIO;
c9de560ded61fa Alex Tomas            2008-01-29  5946  		goto error_return;
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5947  	}
c9de560ded61fa Alex Tomas            2008-01-29  5948  
c9de560ded61fa Alex Tomas            2008-01-29  5949  	if (in_range(ext4_block_bitmap(sb, gdp), block, count) ||
c9de560ded61fa Alex Tomas            2008-01-29  5950  	    in_range(ext4_inode_bitmap(sb, gdp), block, count) ||
c9de560ded61fa Alex Tomas            2008-01-29  5951  	    in_range(block, ext4_inode_table(sb, gdp),
49598e04b5a1c3 Jun Piao              2018-01-11  5952  		     sbi->s_itb_per_group) ||
c9de560ded61fa Alex Tomas            2008-01-29  5953  	    in_range(block + count - 1, ext4_inode_table(sb, gdp),
49598e04b5a1c3 Jun Piao              2018-01-11  5954  		     sbi->s_itb_per_group)) {
c9de560ded61fa Alex Tomas            2008-01-29  5955  
12062dddda4509 Eric Sandeen          2010-02-15  5956  		ext4_error(sb, "Freeing blocks in system zone - "
0610b6e9993982 Theodore Ts'o         2009-06-15  5957  			   "Block = %llu, count = %lu", block, count);
519deca0496a4d Aneesh Kumar K.V      2008-05-15  5958  		/* err = 0. ext4_std_error should be a no op */
519deca0496a4d Aneesh Kumar K.V      2008-05-15  5959  		goto error_return;
c9de560ded61fa Alex Tomas            2008-01-29  5960  	}
c9de560ded61fa Alex Tomas            2008-01-29  5961  
c9de560ded61fa Alex Tomas            2008-01-29  5962  	BUFFER_TRACE(bitmap_bh, "getting write access");
188c299e2a26cc Jan Kara              2021-08-16  5963  	err = ext4_journal_get_write_access(handle, sb, bitmap_bh,
188c299e2a26cc Jan Kara              2021-08-16  5964  					    EXT4_JTR_NONE);
c9de560ded61fa Alex Tomas            2008-01-29  5965  	if (err)
c9de560ded61fa Alex Tomas            2008-01-29  5966  		goto error_return;
c9de560ded61fa Alex Tomas            2008-01-29  5967  
c9de560ded61fa Alex Tomas            2008-01-29  5968  	/*
c9de560ded61fa Alex Tomas            2008-01-29  5969  	 * We are about to modify some metadata.  Call the journal APIs
c9de560ded61fa Alex Tomas            2008-01-29  5970  	 * to unshare ->b_data if a currently-committing transaction is
c9de560ded61fa Alex Tomas            2008-01-29  5971  	 * using it
c9de560ded61fa Alex Tomas            2008-01-29  5972  	 */
c9de560ded61fa Alex Tomas            2008-01-29  5973  	BUFFER_TRACE(gd_bh, "get_write_access");
188c299e2a26cc Jan Kara              2021-08-16  5974  	err = ext4_journal_get_write_access(handle, sb, gd_bh, EXT4_JTR_NONE);
c9de560ded61fa Alex Tomas            2008-01-29  5975  	if (err)
c9de560ded61fa Alex Tomas            2008-01-29  5976  		goto error_return;
c9de560ded61fa Alex Tomas            2008-01-29  5977  #ifdef AGGRESSIVE_CHECK
c9de560ded61fa Alex Tomas            2008-01-29  5978  	{
c9de560ded61fa Alex Tomas            2008-01-29  5979  		int i;
84130193e0e656 Theodore Ts'o         2011-09-09  5980  		for (i = 0; i < count_clusters; i++)
c9de560ded61fa Alex Tomas            2008-01-29  5981  			BUG_ON(!mb_test_bit(bit + i, bitmap_bh->b_data));
c9de560ded61fa Alex Tomas            2008-01-29  5982  	}
c9de560ded61fa Alex Tomas            2008-01-29  5983  #endif
84130193e0e656 Theodore Ts'o         2011-09-09  5984  	trace_ext4_mballoc_free(sb, inode, block_group, bit, count_clusters);
c9de560ded61fa Alex Tomas            2008-01-29  5985  
adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  5986  	/* __GFP_NOFAIL: retry infinitely, ignore TIF_MEMDIE and memcg limit. */
adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  5987  	err = ext4_mb_load_buddy_gfp(sb, block_group, &e4b,
adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  5988  				     GFP_NOFS|__GFP_NOFAIL);
920313a726e04f Aneesh Kumar K.V      2009-01-05  5989  	if (err)
920313a726e04f Aneesh Kumar K.V      2009-01-05  5990  		goto error_return;
e6362609b6c71c Theodore Ts'o         2009-11-23  5991  
f96c450dabf549 Daeho Jeong           2016-02-21  5992  	/*
f96c450dabf549 Daeho Jeong           2016-02-21  5993  	 * We need to make sure we don't reuse the freed block until after the
f96c450dabf549 Daeho Jeong           2016-02-21  5994  	 * transaction is committed. We make an exception if the inode is to be
f96c450dabf549 Daeho Jeong           2016-02-21  5995  	 * written in writeback mode since writeback mode has weak data
f96c450dabf549 Daeho Jeong           2016-02-21  5996  	 * consistency guarantees.
f96c450dabf549 Daeho Jeong           2016-02-21  5997  	 */
f96c450dabf549 Daeho Jeong           2016-02-21  5998  	if (ext4_handle_valid(handle) &&
f96c450dabf549 Daeho Jeong           2016-02-21  5999  	    ((flags & EXT4_FREE_BLOCKS_METADATA) ||
f96c450dabf549 Daeho Jeong           2016-02-21  6000  	     !ext4_should_writeback_data(inode))) {
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6001  		struct ext4_free_data *new_entry;
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6002  		/*
7444a072c387a9 Michal Hocko          2015-07-05  6003  		 * We use __GFP_NOFAIL because ext4_free_blocks() is not allowed
7444a072c387a9 Michal Hocko          2015-07-05  6004  		 * to fail.
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6005  		 */
7444a072c387a9 Michal Hocko          2015-07-05  6006  		new_entry = kmem_cache_alloc(ext4_free_data_cachep,
7444a072c387a9 Michal Hocko          2015-07-05  6007  				GFP_NOFS|__GFP_NOFAIL);
18aadd47f88464 Bobi Jam              2012-02-20  6008  		new_entry->efd_start_cluster = bit;
18aadd47f88464 Bobi Jam              2012-02-20  6009  		new_entry->efd_group = block_group;
18aadd47f88464 Bobi Jam              2012-02-20  6010  		new_entry->efd_count = count_clusters;
18aadd47f88464 Bobi Jam              2012-02-20  6011  		new_entry->efd_tid = handle->h_transaction->t_tid;
955ce5f5be67df Aneesh Kumar K.V      2009-05-02  6012  
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6013  		ext4_lock_group(sb, block_group);
84130193e0e656 Theodore Ts'o         2011-09-09  6014  		mb_clear_bits(bitmap_bh->b_data, bit, count_clusters);
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6015  		ext4_mb_free_metadata(handle, &e4b, new_entry);
c9de560ded61fa Alex Tomas            2008-01-29  6016  	} else {
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6017  		/* need to update group_info->bb_free and bitmap
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6018  		 * with group lock held. generate_buddy look at
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6019  		 * them with group lock_held
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6020  		 */
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6021  		if (test_opt(sb, DISCARD)) {
a015434480dcdb Daeho Jeong           2017-06-22  6022  			err = ext4_issue_discard(sb, block_group, bit, count,
a015434480dcdb Daeho Jeong           2017-06-22  6023  						 NULL);
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6024  			if (err && err != -EOPNOTSUPP)
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6025  				ext4_msg(sb, KERN_WARNING, "discard request in"
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6026  					 " group:%d block:%d count:%lu failed"
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6027  					 " with %d", block_group, bit, count,
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6028  					 err);
8f9ff189205a68 Lukas Czerner         2013-10-30  6029  		} else
8f9ff189205a68 Lukas Czerner         2013-10-30  6030  			EXT4_MB_GRP_CLEAR_TRIMMED(e4b.bd_info);
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6031  
955ce5f5be67df Aneesh Kumar K.V      2009-05-02  6032  		ext4_lock_group(sb, block_group);
84130193e0e656 Theodore Ts'o         2011-09-09  6033  		mb_clear_bits(bitmap_bh->b_data, bit, count_clusters);
84130193e0e656 Theodore Ts'o         2011-09-09  6034  		mb_free_blocks(inode, &e4b, bit, count_clusters);
c9de560ded61fa Alex Tomas            2008-01-29  6035  	}
c9de560ded61fa Alex Tomas            2008-01-29  6036  
021b65bb1e4e4b Theodore Ts'o         2011-09-09  6037  	ret = ext4_free_group_clusters(sb, gdp) + count_clusters;
021b65bb1e4e4b Theodore Ts'o         2011-09-09  6038  	ext4_free_group_clusters_set(sb, gdp, ret);
79f1ba49569e5a Tao Ma                2012-10-22  6039  	ext4_block_bitmap_csum_set(sb, block_group, gdp, bitmap_bh);
feb0ab32a57e4e Darrick J. Wong       2012-04-29  6040  	ext4_group_desc_csum_set(sb, block_group, gdp);
955ce5f5be67df Aneesh Kumar K.V      2009-05-02  6041  	ext4_unlock_group(sb, block_group);
c9de560ded61fa Alex Tomas            2008-01-29  6042  
772cb7c83ba256 Jose R. Santos        2008-07-11  6043  	if (sbi->s_log_groups_per_flex) {
772cb7c83ba256 Jose R. Santos        2008-07-11  6044  		ext4_group_t flex_group = ext4_flex_group(sbi, block_group);
90ba983f6889e6 Theodore Ts'o         2013-03-11  6045  		atomic64_add(count_clusters,
7c990728b99ed6 Suraj Jitindar Singh  2020-02-18  6046  			     &sbi_array_rcu_deref(sbi, s_flex_groups,
7c990728b99ed6 Suraj Jitindar Singh  2020-02-18  6047  						  flex_group)->free_clusters);
772cb7c83ba256 Jose R. Santos        2008-07-11  6048  	}
772cb7c83ba256 Jose R. Santos        2008-07-11  6049  
9fe671496b6c28 Eric Whitney          2018-10-01  6050  	/*
9fe671496b6c28 Eric Whitney          2018-10-01  6051  	 * on a bigalloc file system, defer the s_freeclusters_counter
9fe671496b6c28 Eric Whitney          2018-10-01  6052  	 * update to the caller (ext4_remove_space and friends) so they
9fe671496b6c28 Eric Whitney          2018-10-01  6053  	 * can determine if a cluster freed here should be rereserved
9fe671496b6c28 Eric Whitney          2018-10-01  6054  	 */
9fe671496b6c28 Eric Whitney          2018-10-01  6055  	if (!(flags & EXT4_FREE_BLOCKS_RERESERVE_CLUSTER)) {
7b415bf60f6afb Aditya Kali           2011-09-09  6056  		if (!(flags & EXT4_FREE_BLOCKS_NO_QUOT_UPDATE))
7b415bf60f6afb Aditya Kali           2011-09-09  6057  			dquot_free_block(inode, EXT4_C2B(sbi, count_clusters));
9fe671496b6c28 Eric Whitney          2018-10-01  6058  		percpu_counter_add(&sbi->s_freeclusters_counter,
9fe671496b6c28 Eric Whitney          2018-10-01  6059  				   count_clusters);
9fe671496b6c28 Eric Whitney          2018-10-01  6060  	}
7d7345322d60ed Jan Kara              2013-08-17  6061  
7d7345322d60ed Jan Kara              2013-08-17  6062  	ext4_mb_unload_buddy(&e4b);
7b415bf60f6afb Aditya Kali           2011-09-09  6063  
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6064  	/* We dirtied the bitmap block */
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6065  	BUFFER_TRACE(bitmap_bh, "dirtied bitmap block");
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6066  	err = ext4_handle_dirty_metadata(handle, NULL, bitmap_bh);
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6067  
c9de560ded61fa Alex Tomas            2008-01-29  6068  	/* And the group descriptor block */
c9de560ded61fa Alex Tomas            2008-01-29  6069  	BUFFER_TRACE(gd_bh, "dirtied group descriptor block");
0390131ba84fd3 Frank Mayhar          2009-01-07  6070  	ret = ext4_handle_dirty_metadata(handle, NULL, gd_bh);
c9de560ded61fa Alex Tomas            2008-01-29  6071  	if (!err)
c9de560ded61fa Alex Tomas            2008-01-29  6072  		err = ret;
c9de560ded61fa Alex Tomas            2008-01-29  6073  
c9de560ded61fa Alex Tomas            2008-01-29  6074  	if (overflow && !err) {
c9de560ded61fa Alex Tomas            2008-01-29  6075  		block += count;
c9de560ded61fa Alex Tomas            2008-01-29  6076  		count = overflow;
c9de560ded61fa Alex Tomas            2008-01-29  6077  		put_bh(bitmap_bh);
c9de560ded61fa Alex Tomas            2008-01-29  6078  		goto do_more;
c9de560ded61fa Alex Tomas            2008-01-29  6079  	}
c9de560ded61fa Alex Tomas            2008-01-29  6080  error_return:
c9de560ded61fa Alex Tomas            2008-01-29  6081  	brelse(bitmap_bh);
c9de560ded61fa Alex Tomas            2008-01-29  6082  	ext4_std_error(sb, err);
c9de560ded61fa Alex Tomas            2008-01-29  6083  	return;
c9de560ded61fa Alex Tomas            2008-01-29  6084  }
7360d1731e5dc7 Lukas Czerner         2010-10-27  6085  

:::::: The code at line 5903 was first introduced by commit
:::::: c9de560ded61faa5b754137b7753da252391c55a ext4: Add multi block allocator for ext4

:::::: TO: Alex Tomas <alex@clusterfs.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
