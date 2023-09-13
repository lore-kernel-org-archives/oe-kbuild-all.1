Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C93381E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 03:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694575203; x=1726111203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DozEKoivlENCfcCvRAK75wIvq6gtPfCj3Ngg5utnnC0=;
  b=M/dPgg32l/LzlIFyMFPY6J/VEkZj4AcVPuls0j+HJ+X+pJ1lKJPFilXn
   ywE8aKQqgOEA8FoeDX2QwnO+O8HBbHlkazTu3Tj+6K7g7N6dsPWG6Y6K+
   7gt+SWHEvu9cBIcBJGibgyiw1L3GZZgq4ITbic966EDjrK7sEWavf5AO1
   8oZMDLYFDUChzhZ/PPSoIujlzoqdhCTJDkxz8D4dMwDlMYxBI+ugUqGKU
   mGNjz2QAHaOQLG7CWNFLggEqSG9fLzCEznH60hRGquAE75ucX5cT62hYS
   mx8RIipyDvqihoWaHTqW6EVEQEPjybFoJ5tMXxkKJKZSu3g4rJBcjErY0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444991392"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="444991392"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 20:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737330219"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="737330219"
Received: from lkp-server02.sh.intel.com (HELO e6439d5ea182) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Sep 2023 20:20:00 -0700
Received: from kbuild by e6439d5ea182 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgGQ1-000011-2c;
	Wed, 13 Sep 2023 03:19:57 +0000
Date: Wed, 13 Sep 2023 11:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1566/4552] fs/bcachefs/recovery.c:1047:1:
 warning: the frame size of 1036 bytes is larger than 1024 bytes
Message-ID: <202309131129.tMaaY5xP-lkp@intel.com>
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
commit: 4c6d7dc235d545fda4a63f7ab337718752d5674f [1566/4552] bcachefs: Factor out fs-common.c
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230913/202309131129.tMaaY5xP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131129.tMaaY5xP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131129.tMaaY5xP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/bcachefs_format.h:969:1: note: in expansion of macro 'LE64_BITMASK'
     969 | LE64_BITMASK(BCH_MEMBER_DISCARD,        struct bch_member, flags[0], 14, 15)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:968:14: warning: 'BCH_MEMBER_REPLACEMENT_MAX' defined but not used [-Wunused-const-variable=]
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:968:1: note: in expansion of macro 'LE64_BITMASK'
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:968:14: warning: 'BCH_MEMBER_REPLACEMENT_BITS' defined but not used [-Wunused-const-variable=]
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:968:1: note: in expansion of macro 'LE64_BITMASK'
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:968:14: warning: 'BCH_MEMBER_REPLACEMENT_OFFSET' defined but not used [-Wunused-const-variable=]
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:968:1: note: in expansion of macro 'LE64_BITMASK'
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:966:14: warning: 'BCH_MEMBER_STATE_MAX' defined but not used [-Wunused-const-variable=]
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:966:1: note: in expansion of macro 'LE64_BITMASK'
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:966:14: warning: 'BCH_MEMBER_STATE_BITS' defined but not used [-Wunused-const-variable=]
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:966:1: note: in expansion of macro 'LE64_BITMASK'
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:966:14: warning: 'BCH_MEMBER_STATE_OFFSET' defined but not used [-Wunused-const-variable=]
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:966:1: note: in expansion of macro 'LE64_BITMASK'
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:852:23: warning: 'BKEY_ALLOC_VAL_U64s_MAX' defined but not used [-Wunused-const-variable=]
     852 | static const unsigned BKEY_ALLOC_VAL_U64s_MAX =
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:845:23: warning: 'BCH_ALLOC_FIELD_BYTES' defined but not used [-Wunused-const-variable=]
     845 | static const unsigned BCH_ALLOC_FIELD_BYTES[] = {
         |                       ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:770:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:770:1: note: in expansion of macro 'LE32_BITMASK'
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:770:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:770:1: note: in expansion of macro 'LE32_BITMASK'
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:770:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:770:1: note: in expansion of macro 'LE32_BITMASK'
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:769:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     769 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:769:1: note: in expansion of macro 'LE32_BITMASK'
     769 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/recovery.c: In function 'bch2_fs_initialize':
>> fs/bcachefs/recovery.c:1047:1: warning: the frame size of 1036 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1047 | }
         | ^


vim +1047 fs/bcachefs/recovery.c

5ec30115c06692 Kent Overstreet 2017-03-16   951  
5ec30115c06692 Kent Overstreet 2017-03-16   952  int bch2_fs_initialize(struct bch_fs *c)
5ec30115c06692 Kent Overstreet 2017-03-16   953  {
5ec30115c06692 Kent Overstreet 2017-03-16   954  	struct bch_inode_unpacked root_inode, lostfound_inode;
5ec30115c06692 Kent Overstreet 2017-03-16   955  	struct bkey_inode_buf packed_inode;
5ec30115c06692 Kent Overstreet 2017-03-16   956  	struct qstr lostfound = QSTR("lost+found");
5ec30115c06692 Kent Overstreet 2017-03-16   957  	const char *err = "cannot allocate memory";
5ec30115c06692 Kent Overstreet 2017-03-16   958  	struct bch_dev *ca;
5ec30115c06692 Kent Overstreet 2017-03-16   959  	LIST_HEAD(journal);
5ec30115c06692 Kent Overstreet 2017-03-16   960  	unsigned i;
5ec30115c06692 Kent Overstreet 2017-03-16   961  	int ret;
5ec30115c06692 Kent Overstreet 2017-03-16   962  
5ec30115c06692 Kent Overstreet 2017-03-16   963  	bch_notice(c, "initializing new filesystem");
5ec30115c06692 Kent Overstreet 2017-03-16   964  
decc0240da004e Kent Overstreet 2019-01-24   965  	mutex_lock(&c->sb_lock);
decc0240da004e Kent Overstreet 2019-01-24   966  	for_each_online_member(ca, c, i)
decc0240da004e Kent Overstreet 2019-01-24   967  		bch2_mark_dev_superblock(c, ca, 0);
decc0240da004e Kent Overstreet 2019-01-24   968  	mutex_unlock(&c->sb_lock);
decc0240da004e Kent Overstreet 2019-01-24   969  
5ec30115c06692 Kent Overstreet 2017-03-16   970  	set_bit(BCH_FS_ALLOC_READ_DONE, &c->flags);
8af1222edf595a Kent Overstreet 2019-02-10   971  	set_bit(BCH_FS_INITIAL_GC_DONE, &c->flags);
5ec30115c06692 Kent Overstreet 2017-03-16   972  
b58555a61ffdc0 Kent Overstreet 2018-11-24   973  	for (i = 0; i < BTREE_ID_NR; i++)
b58555a61ffdc0 Kent Overstreet 2018-11-24   974  		bch2_btree_root_alloc(c, i);
b58555a61ffdc0 Kent Overstreet 2018-11-24   975  
5ec30115c06692 Kent Overstreet 2017-03-16   976  	err = "unable to allocate journal buckets";
ad45f8688b90d3 Kent Overstreet 2019-02-28   977  	for_each_online_member(ca, c, i) {
ad45f8688b90d3 Kent Overstreet 2019-02-28   978  		ret = bch2_dev_journal_alloc(ca);
ad45f8688b90d3 Kent Overstreet 2019-02-28   979  		if (ret) {
5ec30115c06692 Kent Overstreet 2017-03-16   980  			percpu_ref_put(&ca->io_ref);
5ec30115c06692 Kent Overstreet 2017-03-16   981  			goto err;
5ec30115c06692 Kent Overstreet 2017-03-16   982  		}
ad45f8688b90d3 Kent Overstreet 2019-02-28   983  	}
5ec30115c06692 Kent Overstreet 2017-03-16   984  
5ec30115c06692 Kent Overstreet 2017-03-16   985  	/*
5ec30115c06692 Kent Overstreet 2017-03-16   986  	 * journal_res_get() will crash if called before this has
5ec30115c06692 Kent Overstreet 2017-03-16   987  	 * set up the journal.pin FIFO and journal.cur pointer:
5ec30115c06692 Kent Overstreet 2017-03-16   988  	 */
67dfac2ba399e7 Kent Overstreet 2019-04-04   989  	bch2_fs_journal_start(&c->journal, 1, &journal);
5ec30115c06692 Kent Overstreet 2017-03-16   990  	bch2_journal_set_replay_done(&c->journal);
5ec30115c06692 Kent Overstreet 2017-03-16   991  
84fab18db64cc4 Kent Overstreet 2019-03-21   992  	err = "error going read write";
9a28381865cb6f Kent Overstreet 2019-03-21   993  	ret = __bch2_fs_read_write(c, true);
5ec30115c06692 Kent Overstreet 2017-03-16   994  	if (ret)
5ec30115c06692 Kent Overstreet 2017-03-16   995  		goto err;
5ec30115c06692 Kent Overstreet 2017-03-16   996  
5ec30115c06692 Kent Overstreet 2017-03-16   997  	bch2_inode_init(c, &root_inode, 0, 0,
5ec30115c06692 Kent Overstreet 2017-03-16   998  			S_IFDIR|S_IRWXU|S_IRUGO|S_IXUGO, 0, NULL);
5ec30115c06692 Kent Overstreet 2017-03-16   999  	root_inode.bi_inum = BCACHEFS_ROOT_INO;
5ec30115c06692 Kent Overstreet 2017-03-16  1000  	bch2_inode_pack(&packed_inode, &root_inode);
5ec30115c06692 Kent Overstreet 2017-03-16  1001  
5ec30115c06692 Kent Overstreet 2017-03-16  1002  	err = "error creating root directory";
5ec30115c06692 Kent Overstreet 2017-03-16  1003  	ret = bch2_btree_insert(c, BTREE_ID_INODES,
5ec30115c06692 Kent Overstreet 2017-03-16  1004  				&packed_inode.inode.k_i,
a65ac463e761bf Kent Overstreet 2018-08-08  1005  				NULL, NULL, 0);
5ec30115c06692 Kent Overstreet 2017-03-16  1006  	if (ret)
5ec30115c06692 Kent Overstreet 2017-03-16  1007  		goto err;
5ec30115c06692 Kent Overstreet 2017-03-16  1008  
4c6d7dc235d545 Kent Overstreet 2019-10-02  1009  	bch2_inode_init_early(c, &lostfound_inode);
5ec30115c06692 Kent Overstreet 2017-03-16  1010  
5ec30115c06692 Kent Overstreet 2017-03-16  1011  	err = "error creating lost+found";
4c6d7dc235d545 Kent Overstreet 2019-10-02  1012  	ret = bch2_trans_do(c, NULL, BTREE_INSERT_ATOMIC,
4c6d7dc235d545 Kent Overstreet 2019-10-02  1013  		bch2_create_trans(&trans, BCACHEFS_ROOT_INO,
4c6d7dc235d545 Kent Overstreet 2019-10-02  1014  				  &root_inode, &lostfound_inode,
4c6d7dc235d545 Kent Overstreet 2019-10-02  1015  				  &lostfound,
4c6d7dc235d545 Kent Overstreet 2019-10-02  1016  				  0, 0, 0755, 0,
4c6d7dc235d545 Kent Overstreet 2019-10-02  1017  				  NULL, NULL));
5ec30115c06692 Kent Overstreet 2017-03-16  1018  	if (ret)
5ec30115c06692 Kent Overstreet 2017-03-16  1019  		goto err;
5ec30115c06692 Kent Overstreet 2017-03-16  1020  
5ec30115c06692 Kent Overstreet 2017-03-16  1021  	if (enabled_qtypes(c)) {
5ec30115c06692 Kent Overstreet 2017-03-16  1022  		ret = bch2_fs_quota_read(c);
5ec30115c06692 Kent Overstreet 2017-03-16  1023  		if (ret)
5ec30115c06692 Kent Overstreet 2017-03-16  1024  			goto err;
5ec30115c06692 Kent Overstreet 2017-03-16  1025  	}
5ec30115c06692 Kent Overstreet 2017-03-16  1026  
5ec30115c06692 Kent Overstreet 2017-03-16  1027  	err = "error writing first journal entry";
5ec30115c06692 Kent Overstreet 2017-03-16  1028  	ret = bch2_journal_meta(&c->journal);
5ec30115c06692 Kent Overstreet 2017-03-16  1029  	if (ret)
5ec30115c06692 Kent Overstreet 2017-03-16  1030  		goto err;
5ec30115c06692 Kent Overstreet 2017-03-16  1031  
5ec30115c06692 Kent Overstreet 2017-03-16  1032  	mutex_lock(&c->sb_lock);
b2be0f6ff6f11a Kent Overstreet 2018-11-01  1033  	c->disk_sb.sb->version = c->disk_sb.sb->version_min =
b2be0f6ff6f11a Kent Overstreet 2018-11-01  1034  		le16_to_cpu(bcachefs_metadata_version_current);
b2be0f6ff6f11a Kent Overstreet 2018-11-01  1035  	c->disk_sb.sb->features[0] |= 1ULL << BCH_FEATURE_ATOMIC_NLINK;
b2be0f6ff6f11a Kent Overstreet 2018-11-01  1036  
5ec30115c06692 Kent Overstreet 2017-03-16  1037  	SET_BCH_SB_INITIALIZED(c->disk_sb.sb, true);
5ec30115c06692 Kent Overstreet 2017-03-16  1038  	SET_BCH_SB_CLEAN(c->disk_sb.sb, false);
5ec30115c06692 Kent Overstreet 2017-03-16  1039  
5ec30115c06692 Kent Overstreet 2017-03-16  1040  	bch2_write_super(c);
5ec30115c06692 Kent Overstreet 2017-03-16  1041  	mutex_unlock(&c->sb_lock);
5ec30115c06692 Kent Overstreet 2017-03-16  1042  
5ec30115c06692 Kent Overstreet 2017-03-16  1043  	return 0;
5ec30115c06692 Kent Overstreet 2017-03-16  1044  err:
2a0e5cdfe329ec Kent Overstreet 2018-11-04  1045  	pr_err("Error initializing new filesystem: %s (%i)", err, ret);
5ec30115c06692 Kent Overstreet 2017-03-16  1046  	return ret;
5ec30115c06692 Kent Overstreet 2017-03-16 @1047  }

:::::: The code at line 1047 was first introduced by commit
:::::: 5ec30115c06692f17b20e4f4c7bdcd62cf96e30d bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
