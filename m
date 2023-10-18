Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401B03FB0C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRlo7Rrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697651055; x=1729187055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmaQ0OkQBNshCxSmfvzXH8wBQtSkrdJFsv8v+kH8Qyc=;
  b=GRlo7RrpPuyGtsZCR2y8XQg50dHvrTl5LPWpTFB5pszZ6snuB+eP508q
   MvfyE30unu7OsS37KAyEFFfM/fnbn24b4YNOqZVb49djBtPFfDrYPesxS
   U6e/p47EeRz5A+bRvxdK0t5PvTkt+SulIodI26t4zVambqGA2ZjnEt2sD
   wROZ0IQaUv6s8sEzo/BvrpgXRmI0H99EdjHWns7emLLknjURauqDtz6zT
   nFUaZGIjqxhcYILaTpAS9J5Xqjg9TQNgOV+fShwhErV+RyBKCdyLijgxb
   FgzNIM3P/KTcyK3wkKjIvc45X260SrVVgkYoxacPBJnZVVkj2OAMb5UNZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="472300420"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="472300420"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 10:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="873118681"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="873118681"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2023 10:44:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtAaY-0000lo-18;
	Wed, 18 Oct 2023 17:44:10 +0000
Date: Thu, 19 Oct 2023 01:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3892/13299] fs/bcachefs/snapshot.h:36:21:
 warning: array subscript <unknown> is outside array bounds of 'struct
 snapshot_t[0]'
Message-ID: <202310190116.5JjceoZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: 68d1c81e582aac9ad93ff6c663a0b5af7c5777b2 [3892/13299] bcachefs: Split out snapshot.c
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20231019/202310190116.5JjceoZJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190116.5JjceoZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190116.5JjceoZJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_MAX' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_BITS' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_OFFSET' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   In file included from fs/bcachefs/btree_trans_commit.c:9:
   In function 'want_new_bset',
       inlined from 'bch2_btree_node_prep_for_write' at fs/bcachefs/btree_trans_commit.c:77:6:
   fs/bcachefs/btree_update_interior.h:274:50: warning: array subscript 0 is outside array bounds of 'struct bkey_packed[0]' [-Warray-bounds=]
     274 |                 __bch_btree_u64s_remaining(c, b, &bne->keys.start[0]);
         |                                                  ^~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_btree_node_prep_for_write':
   fs/bcachefs/bcachefs_format.h:2297:36: note: while referencing 'start'
    2297 |                 struct bkey_packed start[0];
         |                                    ^~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/backing-dev-defs.h:5,
                    from fs/bcachefs/bcachefs.h:186:
   fs/bcachefs/btree_trans_commit.c: In function 'bch2_trans_commit_write_locked.isra':
   fs/bcachefs/btree_trans_commit.c:703:35: warning: array subscript 0 is outside array bounds of 'struct bkey_i[0]' [-Warray-bounds=]
     703 |                         bkey_copy(&entry->start[0], &wb->k);
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/bcachefs/util.h:28:33: note: in expansion of macro 'BUG_ON'
      28 | #define EBUG_ON(cond)           BUG_ON(cond)
         |                                 ^~~~~~
   fs/bcachefs/bkey.h:101:9: note: in expansion of macro 'EBUG_ON'
     101 |         EBUG_ON((u64 *) (_dst) > (u64 *) (_src) &&              \
         |         ^~~~~~~
   fs/bcachefs/btree_trans_commit.c:703:25: note: in expansion of macro 'bkey_copy'
     703 |                         bkey_copy(&entry->start[0], &wb->k);
         |                         ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1542:33: note: while referencing 'start'
    1542 |                 struct bkey_i   start[0];
         |                                 ^~~~~
   fs/bcachefs/btree_trans_commit.c:687:33: warning: array subscript 0 is outside array bounds of 'struct bkey_i[0]' [-Warray-bounds=]
     687 |                                 bkey_reassemble(&entry->start[0],
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     688 |                                                 (struct bkey_s_c) { &i->old_k, i->old_v });
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1542:33: note: while referencing 'start'
    1542 |                 struct bkey_i   start[0];
         |                                 ^~~~~
   fs/bcachefs/btree_trans_commit.c:695:35: warning: array subscript 0 is outside array bounds of 'struct bkey_i[0]' [-Warray-bounds=]
     695 |                         bkey_copy(&entry->start[0], i->k);
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/bcachefs/util.h:28:33: note: in expansion of macro 'BUG_ON'
      28 | #define EBUG_ON(cond)           BUG_ON(cond)
         |                                 ^~~~~~
   fs/bcachefs/bkey.h:101:9: note: in expansion of macro 'EBUG_ON'
     101 |         EBUG_ON((u64 *) (_dst) > (u64 *) (_src) &&              \
         |         ^~~~~~~
   fs/bcachefs/btree_trans_commit.c:695:25: note: in expansion of macro 'bkey_copy'
     695 |                         bkey_copy(&entry->start[0], i->k);
         |                         ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1542:33: note: while referencing 'start'
    1542 |                 struct bkey_i   start[0];
         |                                 ^~~~~
   In file included from fs/bcachefs/btree_trans_commit.c:17:
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9,
       inlined from 'bch2_snapshot_is_internal_node' at fs/bcachefs/snapshot.h:142:6,
       inlined from 'btree_insert_entry_checks' at fs/bcachefs/btree_trans_commit.c:268:2,
       inlined from 'do_bch2_trans_commit.isra' at fs/bcachefs/btree_trans_commit.c:831:3:
>> fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                 ~~~~^~~~~~~~~~~~~~
   In file included from fs/bcachefs/bcachefs.h:419:
   fs/bcachefs/subvolume_types.h: In function 'do_bch2_trans_commit.isra':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
--
   fs/bcachefs/bcachefs_format.h:870:1: note: in expansion of macro 'LE32_BITMASK'
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_BITS' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_MAX' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_BITS' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_OFFSET' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   In file included from fs/bcachefs/btree_update.c:14:
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9:
   fs/bcachefs/snapshot.h:36:16: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                ^~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/bcachefs.h:419:
   fs/bcachefs/subvolume_types.h: In function 'snapshot_t':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9,
       inlined from '__bch2_snapshot_parent' at fs/bcachefs/snapshot.h:70:15,
       inlined from 'bch2_snapshot_parent' at fs/bcachefs/snapshot.h:87:7,
       inlined from 'need_whiteout_for_snapshot' at fs/bcachefs/btree_update.c:140:7:
>> fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                 ~~~~^~~~~~~~~~~~~~
   fs/bcachefs/subvolume_types.h: In function 'need_whiteout_for_snapshot':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9,
       inlined from '__bch2_snapshot_parent' at fs/bcachefs/snapshot.h:73:6,
       inlined from 'bch2_snapshot_parent' at fs/bcachefs/snapshot.h:87:7,
       inlined from 'need_whiteout_for_snapshot' at fs/bcachefs/btree_update.c:140:7:
>> fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                 ~~~~^~~~~~~~~~~~~~
   fs/bcachefs/subvolume_types.h: In function 'need_whiteout_for_snapshot':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9,
       inlined from '__bch2_snapshot_parent' at fs/bcachefs/snapshot.h:73:34,
       inlined from 'bch2_snapshot_parent' at fs/bcachefs/snapshot.h:87:7,
       inlined from 'need_whiteout_for_snapshot' at fs/bcachefs/btree_update.c:140:7:
>> fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                 ~~~~^~~~~~~~~~~~~~
   fs/bcachefs/subvolume_types.h: In function 'need_whiteout_for_snapshot':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9,
       inlined from 'bch2_snapshot_is_internal_node' at fs/bcachefs/snapshot.h:142:6,
       inlined from 'bch2_snapshot_is_leaf' at fs/bcachefs/snapshot.h:151:10,
       inlined from 'check_pos_snapshot_overwritten' at fs/bcachefs/btree_update.c:70:6,
       inlined from 'extent_back_merge' at fs/bcachefs/btree_update.c:117:10:
>> fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                 ~~~~^~~~~~~~~~~~~~
   fs/bcachefs/subvolume_types.h: In function 'extent_back_merge':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9,
       inlined from 'bch2_snapshot_is_internal_node' at fs/bcachefs/snapshot.h:142:6,
       inlined from 'bch2_snapshot_is_leaf' at fs/bcachefs/snapshot.h:151:10,
       inlined from 'check_pos_snapshot_overwritten' at fs/bcachefs/btree_update.c:70:6,
       inlined from 'extent_back_merge' at fs/bcachefs/btree_update.c:118:3:
>> fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                 ~~~~^~~~~~~~~~~~~~
   fs/bcachefs/subvolume_types.h: In function 'extent_back_merge':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9,
       inlined from 'bch2_snapshot_is_internal_node' at fs/bcachefs/snapshot.h:142:6,
       inlined from 'bch2_snapshot_is_leaf' at fs/bcachefs/snapshot.h:151:10,
       inlined from 'check_pos_snapshot_overwritten' at fs/bcachefs/btree_update.c:70:6,
       inlined from 'extent_front_merge' at fs/bcachefs/btree_update.c:94:10:
>> fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                 ~~~~^~~~~~~~~~~~~~
   fs/bcachefs/subvolume_types.h: In function 'extent_front_merge':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9,
       inlined from 'bch2_snapshot_is_internal_node' at fs/bcachefs/snapshot.h:142:6,
       inlined from 'bch2_snapshot_is_leaf' at fs/bcachefs/snapshot.h:151:10,
       inlined from 'check_pos_snapshot_overwritten' at fs/bcachefs/btree_update.c:70:6,
       inlined from 'extent_front_merge' at fs/bcachefs/btree_update.c:95:3:
>> fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                 ~~~~^~~~~~~~~~~~~~
   fs/bcachefs/subvolume_types.h: In function 'extent_front_merge':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9,
       inlined from 'bch2_snapshot_has_children' at fs/bcachefs/snapshot.h:196:6,
       inlined from '__bch2_insert_snapshot_whiteouts' at fs/bcachefs/btree_update.c:174:7:
>> fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                 ~~~~^~~~~~~~~~~~~~
   fs/bcachefs/subvolume_types.h: In function '__bch2_insert_snapshot_whiteouts':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
   In function '__snapshot_t',
       inlined from 'snapshot_t' at fs/bcachefs/snapshot.h:41:9,
       inlined from 'bch2_snapshot_has_children' at fs/bcachefs/snapshot.h:196:6,
       inlined from '__bch2_insert_snapshot_whiteouts' at fs/bcachefs/btree_update.c:174:7:
>> fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
      36 |         return &t->s[U32_MAX - id];
         |                 ~~~~^~~~~~~~~~~~~~
   fs/bcachefs/subvolume_types.h: In function '__bch2_insert_snapshot_whiteouts':
   fs/bcachefs/subvolume_types.h:23:33: note: while referencing 's'
      23 |         struct snapshot_t       s[0];
         |                                 ^
..


vim +36 fs/bcachefs/snapshot.h

    33	
    34	static inline struct snapshot_t *__snapshot_t(struct snapshot_table *t, u32 id)
    35	{
  > 36		return &t->s[U32_MAX - id];
    37	}
    38	
    39	static inline const struct snapshot_t *snapshot_t(struct bch_fs *c, u32 id)
    40	{
  > 41		return __snapshot_t(rcu_dereference(c->snapshots), id);
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
