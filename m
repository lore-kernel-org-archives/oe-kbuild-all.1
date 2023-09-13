Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B98AD52
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 18:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694628599; x=1726164599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1SjpcihCe+Y5PRzkc39Noxhi7e9p6/Z/6KaUYAYjhu8=;
  b=D9FD9T8ZK8lVj156qKPGWpc8nJfiR7/1JKgFJv5gHQXfi0i33PejmPby
   DTQCdFOAgozFeHR/uy0JXttVVw56rHzmL/rpXzobWSthADvrb9A+kv/Cw
   AQBY1PVo5bXoELIpG7P0aCTxCKlq4dp6xH7lb+FLN/95ESH0JdON7hSBd
   XHAe7zA8/tFaIkQKj+/3VzRixmwkkNBtule5NgkMARt7J2oveG08+JciS
   +p9VyvERwuO32p2OvrhpChexFt77uRNlsXy8VVTFQ2H6qZVIlvQxCi0/n
   NtqFoRDk7DPn9+j2hzGXigsn9D0tNdGtRvTM9DsYJatF+KuQHnKCmpa4W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378660835"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="378660835"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 11:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814309035"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="814309035"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2023 11:09:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgUJG-0000Rp-1F;
	Wed, 13 Sep 2023 18:09:54 +0000
Date: Thu, 14 Sep 2023 02:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3349/4552] fs/bcachefs/alloc_background.c:271:33:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 3 has type 'unsigned int'
Message-ID: <202309140235.PXjhIQKN-lkp@intel.com>
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
commit: 11be8e8db283485aa09fa68985f2aee1af0097bf [3349/4552] bcachefs: New on disk format: Backpointers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230914/202309140235.PXjhIQKN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140235.PXjhIQKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140235.PXjhIQKN-lkp@intel.com/

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
>> fs/bcachefs/alloc_background.c:271:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
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
   In file included from fs/bcachefs/btree_io.h:8:
   fs/bcachefs/checksum.h: At top level:
   fs/bcachefs/checksum.h:120:23: warning: 'bch2_compression_opt_to_type' defined but not used [-Wunused-const-variable=]
     120 | static const unsigned bch2_compression_opt_to_type[] = {
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/bcachefs.h:209:
   fs/bcachefs/opts.h:428:30: warning: 'bch2_opts_default' defined but not used [-Wunused-const-variable=]
     428 | static const struct bch_opts bch2_opts_default = {
         |                              ^~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2115:14: warning: 'BTREE_NODE_SEQ_MAX' defined but not used [-Wunused-const-variable=]
    2115 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2115:1: note: in expansion of macro 'LE64_BITMASK'
    2115 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2115:14: warning: 'BTREE_NODE_SEQ_BITS' defined but not used [-Wunused-const-variable=]
    2115 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2115:1: note: in expansion of macro 'LE64_BITMASK'
    2115 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2115:14: warning: 'BTREE_NODE_SEQ_OFFSET' defined but not used [-Wunused-const-variable=]
    2115 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2115:1: note: in expansion of macro 'LE64_BITMASK'
    2115 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2112:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_MAX' defined but not used [-Wunused-const-variable=]
    2112 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2112:1: note: in expansion of macro 'LE64_BITMASK'
    2112 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2112:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_BITS' defined but not used [-Wunused-const-variable=]
    2112 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2112:1: note: in expansion of macro 'LE64_BITMASK'
    2112 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2112:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_OFFSET' defined but not used [-Wunused-const-variable=]
    2112 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2112:1: note: in expansion of macro 'LE64_BITMASK'
    2112 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2111:14: warning: 'BTREE_NODE_LEVEL_MAX' defined but not used [-Wunused-const-variable=]
    2111 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2111:1: note: in expansion of macro 'LE64_BITMASK'
    2111 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2111:14: warning: 'BTREE_NODE_LEVEL_BITS' defined but not used [-Wunused-const-variable=]
    2111 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2111:1: note: in expansion of macro 'LE64_BITMASK'
    2111 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:2111:14: warning: 'BTREE_NODE_LEVEL_OFFSET' defined but not used [-Wunused-const-variable=]
    2111 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:2111:1: note: in expansion of macro 'LE64_BITMASK'
    2111 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);


vim +271 fs/bcachefs/alloc_background.c

   264	
   265	int bch2_alloc_v4_invalid(const struct bch_fs *c, struct bkey_s_c k,
   266				  int rw, struct printbuf *err)
   267	{
   268		struct bkey_s_c_alloc_v4 a = bkey_s_c_to_alloc_v4(k);
   269	
   270		if (alloc_v4_u64s(a.v) != bkey_val_u64s(k.k)) {
 > 271			prt_printf(err, "bad val size (%lu != %u)",
   272			       bkey_val_u64s(k.k), alloc_v4_u64s(a.v));
   273			return -BCH_ERR_invalid_bkey;
   274		}
   275	
   276		if (!BCH_ALLOC_V4_BACKPOINTERS_START(a.v) &&
   277		    BCH_ALLOC_V4_NR_BACKPOINTERS(a.v)) {
   278			prt_printf(err, "invalid backpointers_start");
   279			return -BCH_ERR_invalid_bkey;
   280		}
   281	
   282		/*
   283		 * XXX this is wrong, we'll be checking updates that happened from
   284		 * before BCH_FS_CHECK_BACKPOINTERS_DONE
   285		 */
   286		if (rw == WRITE && test_bit(BCH_FS_CHECK_BACKPOINTERS_DONE, &c->flags)) {
   287			unsigned i, bp_len = 0;
   288	
   289			for (i = 0; i < BCH_ALLOC_V4_NR_BACKPOINTERS(a.v); i++)
   290				bp_len += alloc_v4_backpointers_c(a.v)[i].bucket_len;
   291	
   292			if (bp_len > a.v->dirty_sectors) {
   293				prt_printf(err, "too many backpointers");
   294				return -BCH_ERR_invalid_bkey;
   295			}
   296		}
   297	
   298		if (rw == WRITE) {
   299			if (alloc_data_type(*a.v, a.v->data_type) != a.v->data_type) {
   300				prt_printf(err, "invalid data type (got %u should be %u)",
   301				       a.v->data_type, alloc_data_type(*a.v, a.v->data_type));
   302				return -BCH_ERR_invalid_bkey;
   303			}
   304	
   305			switch (a.v->data_type) {
   306			case BCH_DATA_free:
   307			case BCH_DATA_need_gc_gens:
   308			case BCH_DATA_need_discard:
   309				if (a.v->dirty_sectors ||
   310				    a.v->cached_sectors ||
   311				    a.v->stripe) {
   312					prt_printf(err, "empty data type free but have data");
   313					return -BCH_ERR_invalid_bkey;
   314				}
   315				break;
   316			case BCH_DATA_sb:
   317			case BCH_DATA_journal:
   318			case BCH_DATA_btree:
   319			case BCH_DATA_user:
   320			case BCH_DATA_parity:
   321				if (!a.v->dirty_sectors) {
   322					prt_printf(err, "data_type %s but dirty_sectors==0",
   323					       bch2_data_types[a.v->data_type]);
   324					return -BCH_ERR_invalid_bkey;
   325				}
   326				break;
   327			case BCH_DATA_cached:
   328				if (!a.v->cached_sectors ||
   329				    a.v->dirty_sectors ||
   330				    a.v->stripe) {
   331					prt_printf(err, "data type inconsistency");
   332					return -BCH_ERR_invalid_bkey;
   333				}
   334	
   335				if (!a.v->io_time[READ] &&
   336				    test_bit(BCH_FS_CHECK_ALLOC_TO_LRU_REFS_DONE, &c->flags)) {
   337					prt_printf(err, "cached bucket with read_time == 0");
   338					return -BCH_ERR_invalid_bkey;
   339				}
   340				break;
   341			case BCH_DATA_stripe:
   342				if (!a.v->stripe) {
   343					prt_printf(err, "data_type %s but stripe==0",
   344					       bch2_data_types[a.v->data_type]);
   345					return -BCH_ERR_invalid_bkey;
   346				}
   347				break;
   348			}
   349		}
   350	
   351		return 0;
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
