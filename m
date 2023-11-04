Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3211732
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 23:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHcRDwcq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699141923; x=1730677923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QPkF/+miSOLS21KUFO2yRTZikQgk9rEkrGaTk1M9BzU=;
  b=hHcRDwcqUAqDE1YGcpNQ9y9ci0fIGv50x8WYwGYaJdqYvb2sb4elqsG4
   rpiWrIJ7e+Y1p/NrBx2Rz6bsYI4ogx7rSZl54x+8Nu4DDbOd633Yghzqr
   UYPGUt1mky9mssWhCFPd8ffSFbB/+or5wcdMjNVT4bttOGH7AS9PH2Owo
   Xm4EZ3hKQuk351MP9h/9Xu9nr3aVcFGigsrl80yaIfPgbxL5JiC7wREUr
   dOceUdNDoZhlURwIjYZmdLvx0mHzB9Wh1f83QYb8IzDf3MGVGT80NzimM
   BdV/9wAvHu5385hApFa7RlnxmcKSehPTOLLrddVNS/4WK5vji3JxynmZS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="388002754"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="388002754"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 16:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="3267838"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Nov 2023 16:52:01 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzQQp-0004p8-1L;
	Sat, 04 Nov 2023 23:51:59 +0000
Date: Sun, 5 Nov 2023 07:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:inode-dio-wait 22/24] fs/bcachefs/fs-io.c:414:9:
 warning: ignoring return value of 'inode_dio_wait' declared with attribute
 'warn_unused_result'
Message-ID: <202311050703.SHC29A9l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git inode-dio-wait
head:   6d6e8a2139548041a8c965e89c02bf819830aafb
commit: f3f372e54a02ad8c0911e1635f3875230e237183 [22/24] fs: add __must_check to inode_dio_wait()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231105/202311050703.SHC29A9l-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311050703.SHC29A9l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311050703.SHC29A9l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fs-io.c: In function 'bchfs_truncate':
>> fs/bcachefs/fs-io.c:414:9: warning: ignoring return value of 'inode_dio_wait' declared with attribute 'warn_unused_result' [-Wunused-result]
     414 |         inode_dio_wait(&inode->v);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/fs-io.c: In function 'bch2_fallocate_dispatch':
   fs/bcachefs/fs-io.c:765:9: warning: ignoring return value of 'inode_dio_wait' declared with attribute 'warn_unused_result' [-Wunused-result]
     765 |         inode_dio_wait(&inode->v);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/fs-io.c: In function 'bch2_remap_file_range':
   fs/bcachefs/fs-io.c:866:9: warning: ignoring return value of 'inode_dio_wait' declared with attribute 'warn_unused_result' [-Wunused-result]
     866 |         inode_dio_wait(&src->v);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/fs-io.c:867:9: warning: ignoring return value of 'inode_dio_wait' declared with attribute 'warn_unused_result' [-Wunused-result]
     867 |         inode_dio_wait(&dst->v);
         |         ^~~~~~~~~~~~~~~~~~~~~~~


vim +414 fs/bcachefs/fs-io.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  391  
5902cc283c060f Kent Overstreet 2023-09-04  392  int bchfs_truncate(struct mnt_idmap *idmap,
68a507a2e8cdc9 Kent Overstreet 2021-06-14  393  		  struct bch_inode_info *inode, struct iattr *iattr)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  394  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  395  	struct bch_fs *c = inode->v.i_sb->s_fs_info;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  396  	struct address_space *mapping = inode->v.i_mapping;
e0541a9346951c Kent Overstreet 2019-10-09  397  	struct bch_inode_unpacked inode_u;
2e87eae1fb7a61 Kent Overstreet 2019-10-10  398  	s64 i_sectors_delta = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  399  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  400  
68a507a2e8cdc9 Kent Overstreet 2021-06-14  401  	/*
78d66ab1ca541b Dan Robertson   2021-06-27  402  	 * If the truncate call with change the size of the file, the
78d66ab1ca541b Dan Robertson   2021-06-27  403  	 * cmtimes should be updated. If the size will not change, we
78d66ab1ca541b Dan Robertson   2021-06-27  404  	 * do not need to update the cmtimes.
68a507a2e8cdc9 Kent Overstreet 2021-06-14  405  	 */
78d66ab1ca541b Dan Robertson   2021-06-27  406  	if (iattr->ia_size != inode->v.i_size) {
68a507a2e8cdc9 Kent Overstreet 2021-06-14  407  		if (!(iattr->ia_valid & ATTR_MTIME))
68a507a2e8cdc9 Kent Overstreet 2021-06-14  408  			ktime_get_coarse_real_ts64(&iattr->ia_mtime);
68a507a2e8cdc9 Kent Overstreet 2021-06-14  409  		if (!(iattr->ia_valid & ATTR_CTIME))
68a507a2e8cdc9 Kent Overstreet 2021-06-14  410  			ktime_get_coarse_real_ts64(&iattr->ia_ctime);
68a507a2e8cdc9 Kent Overstreet 2021-06-14  411  		iattr->ia_valid |= ATTR_MTIME|ATTR_CTIME;
78d66ab1ca541b Dan Robertson   2021-06-27  412  	}
68a507a2e8cdc9 Kent Overstreet 2021-06-14  413  
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @414  	inode_dio_wait(&inode->v);
a7ecd30c830062 Kent Overstreet 2022-11-04  415  	bch2_pagecache_block_get(inode);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  416  
6fed42bb7750e2 Kent Overstreet 2021-03-16  417  	ret = bch2_inode_find_by_inum(c, inode_inum(inode), &inode_u);
c45d473df77f41 Kent Overstreet 2019-12-18  418  	if (ret)
c45d473df77f41 Kent Overstreet 2019-12-18  419  		goto err;
c45d473df77f41 Kent Overstreet 2019-12-18  420  
c45d473df77f41 Kent Overstreet 2019-12-18  421  	/*
c45d473df77f41 Kent Overstreet 2019-12-18  422  	 * check this before next assertion; on filesystem error our normal
c45d473df77f41 Kent Overstreet 2019-12-18  423  	 * invariants are a bit broken (truncate has to truncate the page cache
c45d473df77f41 Kent Overstreet 2019-12-18  424  	 * before the inode).
c45d473df77f41 Kent Overstreet 2019-12-18  425  	 */
c45d473df77f41 Kent Overstreet 2019-12-18  426  	ret = bch2_journal_error(&c->journal);
e0541a9346951c Kent Overstreet 2019-10-09  427  	if (ret)
e0541a9346951c Kent Overstreet 2019-10-09  428  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  429  
8eb71e9e1af8aa Kent Overstreet 2022-11-15  430  	WARN_ONCE(!test_bit(EI_INODE_ERROR, &inode->ei_flags) &&
8eb71e9e1af8aa Kent Overstreet 2022-11-15  431  		  inode->v.i_size < inode_u.bi_size,
8eb71e9e1af8aa Kent Overstreet 2022-11-15  432  		  "truncate spotted in mem i_size < btree i_size: %llu < %llu\n",
8eb71e9e1af8aa Kent Overstreet 2022-11-15  433  		  (u64) inode->v.i_size, inode_u.bi_size);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  434  
e0541a9346951c Kent Overstreet 2019-10-09  435  	if (iattr->ia_size > inode->v.i_size) {
68a507a2e8cdc9 Kent Overstreet 2021-06-14  436  		ret = bch2_extend(idmap, inode, &inode_u, iattr);
54e2264e17941c Kent Overstreet 2018-08-08  437  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  438  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  439  
68a507a2e8cdc9 Kent Overstreet 2021-06-14  440  	iattr->ia_valid &= ~ATTR_SIZE;
68a507a2e8cdc9 Kent Overstreet 2021-06-14  441  
959f7368d60c89 Kent Overstreet 2023-03-19  442  	ret = bch2_truncate_folio(inode, iattr->ia_size);
74163da7c81ac5 Kent Overstreet 2021-11-06  443  	if (unlikely(ret < 0))
54e2264e17941c Kent Overstreet 2018-08-08  444  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  445  
5902cc283c060f Kent Overstreet 2023-09-04  446  	truncate_setsize(&inode->v, iattr->ia_size);
5902cc283c060f Kent Overstreet 2023-09-04  447  
6cc3535dcbb8bc Kent Overstreet 2019-09-19  448  	/*
6cc3535dcbb8bc Kent Overstreet 2019-09-19  449  	 * When extending, we're going to write the new i_size to disk
6cc3535dcbb8bc Kent Overstreet 2019-09-19  450  	 * immediately so we need to flush anything above the current on disk
6cc3535dcbb8bc Kent Overstreet 2019-09-19  451  	 * i_size first:
6cc3535dcbb8bc Kent Overstreet 2019-09-19  452  	 *
6cc3535dcbb8bc Kent Overstreet 2019-09-19  453  	 * Also, when extending we need to flush the page that i_size currently
6cc3535dcbb8bc Kent Overstreet 2019-09-19  454  	 * straddles - if it's mapped to userspace, we need to ensure that
6cc3535dcbb8bc Kent Overstreet 2019-09-19  455  	 * userspace has to redirty it and call .mkwrite -> set_page_dirty
6cc3535dcbb8bc Kent Overstreet 2019-09-19  456  	 * again to allocate the part of the page that was extended.
6cc3535dcbb8bc Kent Overstreet 2019-09-19  457  	 */
e0541a9346951c Kent Overstreet 2019-10-09  458  	if (iattr->ia_size > inode_u.bi_size)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  459  		ret = filemap_write_and_wait_range(mapping,
e0541a9346951c Kent Overstreet 2019-10-09  460  				inode_u.bi_size,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  461  				iattr->ia_size - 1);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  462  	else if (iattr->ia_size & (PAGE_SIZE - 1))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  463  		ret = filemap_write_and_wait_range(mapping,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  464  				round_down(iattr->ia_size, PAGE_SIZE),
1c6fdbd8f2465d Kent Overstreet 2017-03-16  465  				iattr->ia_size - 1);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  466  	if (ret)
54e2264e17941c Kent Overstreet 2018-08-08  467  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  468  
5902cc283c060f Kent Overstreet 2023-09-04  469  	ret = bch2_truncate(c, inode_inum(inode), iattr->ia_size, &i_sectors_delta);
5902cc283c060f Kent Overstreet 2023-09-04  470  	bch2_i_sectors_acct(c, inode, NULL, i_sectors_delta);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  471  
5902cc283c060f Kent Overstreet 2023-09-04  472  	if (unlikely(ret)) {
5902cc283c060f Kent Overstreet 2023-09-04  473  		/*
5902cc283c060f Kent Overstreet 2023-09-04  474  		 * If we error here, VFS caches are now inconsistent with btree
5902cc283c060f Kent Overstreet 2023-09-04  475  		 */
5902cc283c060f Kent Overstreet 2023-09-04  476  		set_bit(EI_INODE_ERROR, &inode->ei_flags);
54e2264e17941c Kent Overstreet 2018-08-08  477  		goto err;
5902cc283c060f Kent Overstreet 2023-09-04  478  	}
2e87eae1fb7a61 Kent Overstreet 2019-10-10  479  
b33bf1bc0d1e81 Kent Overstreet 2022-04-16  480  	bch2_fs_inconsistent_on(!inode->v.i_size && inode->v.i_blocks &&
b33bf1bc0d1e81 Kent Overstreet 2022-04-16  481  				!bch2_journal_error(&c->journal), c,
b33bf1bc0d1e81 Kent Overstreet 2022-04-16  482  				"inode %lu truncated to 0 but i_blocks %llu (ondisk %lli)",
b33bf1bc0d1e81 Kent Overstreet 2022-04-16  483  				inode->v.i_ino, (u64) inode->v.i_blocks,
b33bf1bc0d1e81 Kent Overstreet 2022-04-16  484  				inode->ei_inode.bi_sectors);
68a507a2e8cdc9 Kent Overstreet 2021-06-14  485  
68a507a2e8cdc9 Kent Overstreet 2021-06-14  486  	ret = bch2_setattr_nonsize(idmap, inode, iattr);
54e2264e17941c Kent Overstreet 2018-08-08  487  err:
a7ecd30c830062 Kent Overstreet 2022-11-04  488  	bch2_pagecache_block_put(inode);
5c1ef830f67860 Kent Overstreet 2022-09-18  489  	return bch2_err_class(ret);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  490  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  491  

:::::: The code at line 414 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
