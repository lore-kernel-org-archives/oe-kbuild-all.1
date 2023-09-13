Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0966229CA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 21:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694638814; x=1726174814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lJ23kENwbaOyUIuHNNevMINcZm5i/Mg7vseDnRUROTA=;
  b=cNVPdKe5GrhoDLOHP4wQSu17GeIjW7cWa2dBL92FBGK1v/lgIU78GGl1
   IEoDpT4SRS46AW3dGzm7XgVhSfV0MEtMsWluzohsiNEN9OiwjaQUtL6c2
   UOZytP0kol5KTNdoxPkX5WzWYdCsTGnvGghWV5yNeERP3qvFV1v/6ojlC
   xxa+twWYHd9J9TW283uY1HW/LOJB/yFvkl62vv3h4x6gLTytXf9XdTaxV
   UOw501nAolutHITG4cJFGhmCfBOHM/5hT7hAZpPEcFf2IJXr7uXu0/05v
   6mhlFyjL3nIezFtZvO0U1h+WguwVQm9tjAlzAOHK3NOXtlR6Hk8xfpaa6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="465154783"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="465154783"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 14:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="737678781"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="737678781"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Sep 2023 14:00:10 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgWy0-0000dh-2I;
	Wed, 13 Sep 2023 21:00:08 +0000
Date: Thu, 14 Sep 2023 05:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3370/4552] fs/bcachefs/alloc_background.c:626:33:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 3 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202309140449.OibuS29N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e143016b56ecb0fcda5bb6026b0a25fe55274f56
commit: 4be0d766a7e917bc514bd9f5ebeca365a2b22f07 [3370/4552] bcachefs: bucket_gens btree
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230914/202309140449.OibuS29N-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140449.OibuS29N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140449.OibuS29N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:206,
                    from fs/bcachefs/alloc_background.c:2:
   fs/bcachefs/bcachefs_format.h:215:25: warning: 'p' offset 3 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     215 |         struct bpos     p;
         |                         ^
   fs/bcachefs/bcachefs_format.h:217:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     217 |         struct bversion version;
         |                         ^~~~~~~
   In file included from fs/bcachefs/btree_io.h:7,
                    from fs/bcachefs/alloc_background.c:7:
   fs/bcachefs/btree_locking.h: In function 'mark_btree_node_locked':
   fs/bcachefs/btree_locking.h:88:53: warning: implicit conversion from 'enum six_lock_type' to 'enum btree_node_locked_type' [-Wenum-conversion]
      88 |         mark_btree_node_locked_noreset(path, level, type);
         |                                                     ^~~~
   fs/bcachefs/btree_locking.h: In function 'bch2_btree_node_unlock_write_inlined':
   fs/bcachefs/btree_locking.h:175:58: warning: implicit conversion from 'enum six_lock_type' to 'enum btree_node_locked_type' [-Wenum-conversion]
     175 |         mark_btree_node_locked_noreset(path, b->c.level, SIX_LOCK_intent);
         |                                                          ^~~~~~~~~~~~~~~
   fs/bcachefs/btree_locking.h: In function 'btree_node_lock_increment':
   fs/bcachefs/btree_locking.h:241:54: warning: implicit conversion from 'enum btree_node_locked_type' to 'enum six_lock_type' [-Wenum-conversion]
     241 |                         six_lock_increment(&b->lock, want);
         |                                                      ^~~~
   fs/bcachefs/btree_locking.h: In function 'btree_node_lock':
   fs/bcachefs/btree_locking.h:261:56: warning: implicit conversion from 'enum six_lock_type' to 'enum btree_node_locked_type' [-Wenum-conversion]
     261 |             btree_node_lock_increment(trans, b, level, type) ||
         |                                                        ^~~~
   fs/bcachefs/btree_locking.h: In function '__btree_node_lock_write':
   fs/bcachefs/btree_locking.h:288:56: warning: implicit conversion from 'enum six_lock_type' to 'enum btree_node_locked_type' [-Wenum-conversion]
     288 |         mark_btree_node_locked_noreset(path, b->level, SIX_LOCK_write);
         |                                                        ^~~~~~~~~~~~~~
   fs/bcachefs/btree_io.h: In function 'compat_btree_node':
   fs/bcachefs/btree_io.h:203:40: warning: implicit conversion from 'enum btree_id' to 'enum btree_node_type' [-Wenum-conversion]
     203 |             btree_node_type_is_extents(btree_id) &&
         |                                        ^~~~~~~~
   fs/bcachefs/btree_io.h:220:40: warning: implicit conversion from 'enum btree_id' to 'enum btree_node_type' [-Wenum-conversion]
     220 |             btree_node_type_is_extents(btree_id) &&
         |                                        ^~~~~~~~
   In file included from fs/bcachefs/vstructs.h:5,
                    from fs/bcachefs/bcachefs_format.h:79:
   fs/bcachefs/alloc_background.c: In function 'bch2_alloc_v4_invalid':
   fs/bcachefs/alloc_background.c:271:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
     271 |                 prt_printf(err, "bad val size (%lu != %u)",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:221:63: note: in definition of macro 'prt_printf'
     221 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/alloc_background.c:271:50: note: format string is defined here
     271 |                 prt_printf(err, "bad val size (%lu != %u)",
         |                                                ~~^
         |                                                  |
         |                                                  long unsigned int
         |                                                %u
   fs/bcachefs/alloc_background.c: In function 'bch2_bucket_gens_invalid':
>> fs/bcachefs/alloc_background.c:626:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     626 |                 prt_printf(err, "bad val size (%lu != %zu)",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
     627 |                        bkey_val_bytes(k.k), sizeof(struct bch_bucket_gens));
         |                        ~~~~~~~~~~~~~~~~~~~
         |                        |
         |                        size_t {aka unsigned int}
   fs/bcachefs/util.h:221:63: note: in definition of macro 'prt_printf'
     221 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/alloc_background.c:626:50: note: format string is defined here
     626 |                 prt_printf(err, "bad val size (%lu != %zu)",
         |                                                ~~^
         |                                                  |
         |                                                  long unsigned int
         |                                                %u
   fs/bcachefs/alloc_background.c: At top level:
   fs/bcachefs/alloc_background.c:939:17: warning: no previous prototype for 'bch2_get_key_or_hole' [-Wmissing-prototypes]
     939 | struct bkey_s_c bch2_get_key_or_hole(struct btree_iter *iter, struct bpos end, struct bkey *hole)
         |                 ^~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/alloc_background.c:1003:17: warning: no previous prototype for 'bch2_get_key_or_real_bucket_hole' [-Wmissing-prototypes]
    1003 | struct bkey_s_c bch2_get_key_or_real_bucket_hole(struct btree_iter *iter, struct bkey *hole)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/btree_io.h:8:
   fs/bcachefs/checksum.h:123:23: warning: 'bch2_compression_opt_to_type' defined but not used [-Wunused-const-variable=]
     123 | static const unsigned bch2_compression_opt_to_type[] = {
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/bcachefs.h:210:
   fs/bcachefs/opts.h:435:30: warning: 'bch2_opts_default' defined but not used [-Wunused-const-variable=]
     435 | static const struct bch_opts bch2_opts_default = {
         |                              ^~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2180:14: warning: 'BTREE_NODE_SEQ_MAX' defined but not used [-Wunused-const-variable=]
    2180 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2180:1: note: in expansion of macro 'LE64_BITMASK'
    2180 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2180:14: warning: 'BTREE_NODE_SEQ_BITS' defined but not used [-Wunused-const-variable=]
    2180 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2180:1: note: in expansion of macro 'LE64_BITMASK'
    2180 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2180:14: warning: 'BTREE_NODE_SEQ_OFFSET' defined but not used [-Wunused-const-variable=]
    2180 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2180:1: note: in expansion of macro 'LE64_BITMASK'
    2180 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2177:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_MAX' defined but not used [-Wunused-const-variable=]
    2177 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2177:1: note: in expansion of macro 'LE64_BITMASK'
    2177 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2177:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_BITS' defined but not used [-Wunused-const-variable=]
    2177 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2177:1: note: in expansion of macro 'LE64_BITMASK'
    2177 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2177:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_OFFSET' defined but not used [-Wunused-const-variable=]
    2177 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2177:1: note: in expansion of macro 'LE64_BITMASK'
    2177 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2176:14: warning: 'BTREE_NODE_LEVEL_MAX' defined but not used [-Wunused-const-variable=]
    2176 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2176:1: note: in expansion of macro 'LE64_BITMASK'
    2176 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2176:14: warning: 'BTREE_NODE_LEVEL_BITS' defined but not used [-Wunused-const-variable=]
    2176 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2176:1: note: in expansion of macro 'LE64_BITMASK'


vim +626 fs/bcachefs/alloc_background.c

   621	
   622	int bch2_bucket_gens_invalid(const struct bch_fs *c, struct bkey_s_c k,
   623				     int rw, struct printbuf *err)
   624	{
   625		if (bkey_val_bytes(k.k) != sizeof(struct bch_bucket_gens)) {
 > 626			prt_printf(err, "bad val size (%lu != %zu)",
   627			       bkey_val_bytes(k.k), sizeof(struct bch_bucket_gens));
   628			return -BCH_ERR_invalid_bkey;
   629		}
   630	
   631		return 0;
   632	}
   633	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
