Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD004422
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 17:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694540178; x=1726076178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X+ybu9FRfs2W1tdEMef7fJgyaQxZ2Hecocfhsi8nA1E=;
  b=ImmE/H2pjqehj0LmAwTcGmYOvHX2+Wed7vtGH1hstw5arm7zQCldmEDD
   YYC6+18oGOPhhElb4gb2DTNt7CqZFccEJneyLSeDALJO6v1gGIFIoCk8c
   QXUOC5Te7ieLR8jqtADU4b8Eupo/egxeKMC4y77+xudTy4mETttN2Towe
   nOIzUNfvdDfzeMoosP9u/1FT69p2wFZ4eHCO9vViyXoHZastjUerrQYiJ
   VWd+XCkn2kz3b3TjvZPsShHjabaHZ+K7SSuktCm5L4Ewh6rA3VwfGAZqG
   yisRah2UGpf7q/458VZms1Kb7jCrNEnHNWYYJ9rv6lUBwp2/pLCTs9ox8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444884977"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="444884977"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 10:36:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="1074634158"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="1074634158"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Sep 2023 10:36:16 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg7J8-000039-0j;
	Tue, 12 Sep 2023 17:36:14 +0000
Date: Wed, 13 Sep 2023 01:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1417/4552] fs/bcachefs/fs-io.c:472:1: warning:
 the frame size of 1128 bytes is larger than 1024 bytes
Message-ID: <202309130131.2WumgLAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: 3aa143b23cefca592fc35600912b9546da01276e [1417/4552] bcachefs: bch2_trans_mark_update()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230913/202309130131.2WumgLAq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130131.2WumgLAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130131.2WumgLAq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/bcachefs_format.h:946:14: warning: 'BCH_MEMBER_REPLACEMENT_MAX' defined but not used [-Wunused-const-variable=]
     946 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:946:1: note: in expansion of macro 'LE64_BITMASK'
     946 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:946:14: warning: 'BCH_MEMBER_REPLACEMENT_BITS' defined but not used [-Wunused-const-variable=]
     946 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:946:1: note: in expansion of macro 'LE64_BITMASK'
     946 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:946:14: warning: 'BCH_MEMBER_REPLACEMENT_OFFSET' defined but not used [-Wunused-const-variable=]
     946 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:946:1: note: in expansion of macro 'LE64_BITMASK'
     946 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:944:14: warning: 'BCH_MEMBER_STATE_MAX' defined but not used [-Wunused-const-variable=]
     944 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:944:1: note: in expansion of macro 'LE64_BITMASK'
     944 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:944:14: warning: 'BCH_MEMBER_STATE_BITS' defined but not used [-Wunused-const-variable=]
     944 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:944:1: note: in expansion of macro 'LE64_BITMASK'
     944 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:944:14: warning: 'BCH_MEMBER_STATE_OFFSET' defined but not used [-Wunused-const-variable=]
     944 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:944:1: note: in expansion of macro 'LE64_BITMASK'
     944 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:850:23: warning: 'BKEY_ALLOC_VAL_U64s_MAX' defined but not used [-Wunused-const-variable=]
     850 | static const unsigned BKEY_ALLOC_VAL_U64s_MAX =
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:843:23: warning: 'BCH_ALLOC_FIELD_BYTES' defined but not used [-Wunused-const-variable=]
     843 | static const unsigned BCH_ALLOC_FIELD_BYTES[] = {
         |                       ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:768:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     768 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:768:1: note: in expansion of macro 'LE32_BITMASK'
     768 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:768:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     768 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:768:1: note: in expansion of macro 'LE32_BITMASK'
     768 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:768:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     768 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:768:1: note: in expansion of macro 'LE32_BITMASK'
     768 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:767:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     767 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:767:1: note: in expansion of macro 'LE32_BITMASK'
     767 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:447:23: warning: 'bch_crc_bytes' defined but not used [-Wunused-const-variable=]
     447 | static const unsigned bch_crc_bytes[] = {
         |                       ^~~~~~~~~~~~~
   fs/bcachefs/fs-io.c: In function 'bchfs_write_index_update':
>> fs/bcachefs/fs-io.c:472:1: warning: the frame size of 1128 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     472 | }
         | ^
   fs/bcachefs/fs-io.c: In function 'bch2_fcollapse':
   fs/bcachefs/fs-io.c:2497:1: warning: the frame size of 1204 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2497 | }
         | ^
   fs/bcachefs/fs-io.c: In function 'bch2_fallocate':
   fs/bcachefs/fs-io.c:2651:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2651 | }
         | ^


vim +472 fs/bcachefs/fs-io.c

5ec30115c06692f Kent Overstreet 2017-03-16  420  
5ec30115c06692f Kent Overstreet 2017-03-16  421  static int bchfs_write_index_update(struct bch_write_op *wop)
5ec30115c06692f Kent Overstreet 2017-03-16  422  {
a5bf195caf06bce Kent Overstreet 2018-07-20  423  	struct bch_fs *c = wop->c;
5ec30115c06692f Kent Overstreet 2017-03-16  424  	struct bchfs_write_op *op = container_of(wop,
5ec30115c06692f Kent Overstreet 2017-03-16  425  				struct bchfs_write_op, op);
c955f6c19b2f71f Kent Overstreet 2018-08-08  426  	struct quota_res *quota_res = op->is_dio
c955f6c19b2f71f Kent Overstreet 2018-08-08  427  		? &container_of(op, struct dio_write, iop)->quota_res
c955f6c19b2f71f Kent Overstreet 2018-08-08  428  		: NULL;
c955f6c19b2f71f Kent Overstreet 2018-08-08  429  	struct bch_inode_info *inode = op->inode;
5ec30115c06692f Kent Overstreet 2017-03-16  430  	struct keylist *keys = &op->op.insert_keys;
5ec30115c06692f Kent Overstreet 2017-03-16  431  	struct bkey_i *k = bch2_keylist_front(keys);
c955f6c19b2f71f Kent Overstreet 2018-08-08  432  	struct btree_trans trans;
c955f6c19b2f71f Kent Overstreet 2018-08-08  433  	struct btree_iter *iter;
5ec30115c06692f Kent Overstreet 2017-03-16  434  	int ret;
5ec30115c06692f Kent Overstreet 2017-03-16  435  
c955f6c19b2f71f Kent Overstreet 2018-08-08  436  	BUG_ON(k->k.p.inode != inode->v.i_ino);
5ec30115c06692f Kent Overstreet 2017-03-16  437  
a5bf195caf06bce Kent Overstreet 2018-07-20  438  	bch2_trans_init(&trans, c);
c955f6c19b2f71f Kent Overstreet 2018-08-08  439  	bch2_trans_preload_iters(&trans);
2d6d06497ec23ec Kent Overstreet 2018-07-12  440  
c955f6c19b2f71f Kent Overstreet 2018-08-08  441  	iter = bch2_trans_get_iter(&trans,
2d6d06497ec23ec Kent Overstreet 2018-07-12  442  				BTREE_ID_EXTENTS,
c955f6c19b2f71f Kent Overstreet 2018-08-08  443  				bkey_start_pos(&k->k),
5ec30115c06692f Kent Overstreet 2017-03-16  444  				BTREE_ITER_INTENT);
5ec30115c06692f Kent Overstreet 2017-03-16  445  
5ec30115c06692f Kent Overstreet 2017-03-16  446  	do {
21db81ed85b79cd Kent Overstreet 2018-08-05  447  		BKEY_PADDED(k) tmp;
5ec30115c06692f Kent Overstreet 2017-03-16  448  
21db81ed85b79cd Kent Overstreet 2018-08-05  449  		bkey_copy(&tmp.k, bch2_keylist_front(keys));
5ec30115c06692f Kent Overstreet 2017-03-16  450  
c955f6c19b2f71f Kent Overstreet 2018-08-08  451  		ret = bch2_extent_update(&trans, inode,
c955f6c19b2f71f Kent Overstreet 2018-08-08  452  				&wop->res, quota_res,
c955f6c19b2f71f Kent Overstreet 2018-08-08  453  				iter, &tmp.k,
c955f6c19b2f71f Kent Overstreet 2018-08-08  454  				op->new_i_size,
c955f6c19b2f71f Kent Overstreet 2018-08-08  455  				!op->unalloc,
c955f6c19b2f71f Kent Overstreet 2018-08-08  456  				op->is_dio,
c955f6c19b2f71f Kent Overstreet 2018-08-08  457  				&op->sectors_added);
5ec30115c06692f Kent Overstreet 2017-03-16  458  		if (ret == -EINTR)
5ec30115c06692f Kent Overstreet 2017-03-16  459  			continue;
5ec30115c06692f Kent Overstreet 2017-03-16  460  		if (ret)
5ec30115c06692f Kent Overstreet 2017-03-16  461  			break;
5ec30115c06692f Kent Overstreet 2017-03-16  462  
c955f6c19b2f71f Kent Overstreet 2018-08-08  463  		if (bkey_cmp(iter->pos, bch2_keylist_front(keys)->k.p) < 0)
c955f6c19b2f71f Kent Overstreet 2018-08-08  464  			bch2_cut_front(iter->pos, bch2_keylist_front(keys));
21db81ed85b79cd Kent Overstreet 2018-08-05  465  		else
5ec30115c06692f Kent Overstreet 2017-03-16  466  			bch2_keylist_pop_front(keys);
5ec30115c06692f Kent Overstreet 2017-03-16  467  	} while (!bch2_keylist_empty(keys));
5ec30115c06692f Kent Overstreet 2017-03-16  468  
2d6d06497ec23ec Kent Overstreet 2018-07-12  469  	bch2_trans_exit(&trans);
5ec30115c06692f Kent Overstreet 2017-03-16  470  
5ec30115c06692f Kent Overstreet 2017-03-16  471  	return ret;
5ec30115c06692f Kent Overstreet 2017-03-16 @472  }
5ec30115c06692f Kent Overstreet 2017-03-16  473  

:::::: The code at line 472 was first introduced by commit
:::::: 5ec30115c06692f17b20e4f4c7bdcd62cf96e30d bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
