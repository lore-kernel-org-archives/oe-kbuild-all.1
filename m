Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BFA3C0F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694600904; x=1726136904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EoTmNYoTu9hub9BQ02LPRvcEkqcucebluHidZiTkYPs=;
  b=mqkOU13tqcv32EmW5kYPl4IHHLDZgEZlIXV3HBq4KL9cTY9luLlE29bF
   dLFdike6NYRWB8bS5AtcE1Nsy+yjHqRVC94c0j5kPPtdKNanNMctUUbS4
   2U+4kYHxcwU6OEpH+Z54kZq5tfV00y2kEhwnqMFA8Fa+2KzykYDVD4eCk
   +ICihHQjyU0KJ75QkUSJ4DG4Qi2NBypRM8pzgBZl5/IHRKwenTCXjt8UR
   x3A8ssnlWSfwCRGnOZg7S7bgqWIl7Ag50oqlbf+N30+0oGSFgxqK56vcU
   2/jZKAbyMiA45ro+A+6qm58T/RcJlhTzVg8ebxBRwa9B4VZp7DjdbpT5F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="363652633"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="363652633"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 03:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="917773492"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="917773492"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Sep 2023 03:28:22 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgN6Z-0000Of-2N;
	Wed, 13 Sep 2023 10:28:19 +0000
Date: Wed, 13 Sep 2023 18:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2179/4552] fs/bcachefs/btree_key_cache.c:701:21:
 warning: format '%zu' expects argument of type 'size_t', but argument 4 has
 type 'long int'
Message-ID: <202309131826.J2HlElWs-lkp@intel.com>
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
commit: 0b07f462c6742128c9fcd67656fb110f2d39c4e1 [2179/4552] bcachefs: btree key cache locking improvements
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230913/202309131826.J2HlElWs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131826.J2HlElWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131826.J2HlElWs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:201,
                    from fs/bcachefs/btree_key_cache.c:2:
   fs/bcachefs/bcachefs_format.h:199:25: warning: 'p' offset 3 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     199 |         struct bpos     p;
         |                         ^
   fs/bcachefs/bcachefs_format.h:201:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     201 |         struct bversion version;
         |                         ^~~~~~~
   In file included from fs/bcachefs/btree_key_cache.c:6:
   fs/bcachefs/btree_locking.h: In function 'btree_node_lock_increment':
   fs/bcachefs/btree_locking.h:169:56: warning: implicit conversion from 'enum btree_node_locked_type' to 'enum six_lock_type' [-Wenum-conversion]
     169 |                         six_lock_increment(&b->c.lock, want);
         |                                                        ^~~~
   fs/bcachefs/btree_locking.h: In function 'btree_node_lock':
   fs/bcachefs/btree_locking.h:202:60: warning: implicit conversion from 'enum six_lock_type' to 'enum btree_node_locked_type' [-Wenum-conversion]
     202 |                 btree_node_lock_increment(trans, b, level, type) ||
         |                                                            ^~~~
   In file included from fs/bcachefs/fifo.h:5,
                    from fs/bcachefs/bcachefs.h:202:
   fs/bcachefs/btree_key_cache.c: In function 'bch2_btree_key_cache_to_text':
>> fs/bcachefs/btree_key_cache.c:701:21: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'long int' [-Wformat=]
     701 |         pr_buf(out, "nr_keys:\t%zu\n",  atomic_long_read(&c->nr_keys));
         |                     ^~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         long int
   fs/bcachefs/util.h:261:34: note: in definition of macro 'pr_buf'
     261 |                                  __VA_ARGS__);                          \
         |                                  ^~~~~~~~~~~
   fs/bcachefs/btree_key_cache.c:701:34: note: format string is defined here
     701 |         pr_buf(out, "nr_keys:\t%zu\n",  atomic_long_read(&c->nr_keys));
         |                                ~~^
         |                                  |
         |                                  unsigned int
         |                                %lu
   fs/bcachefs/btree_key_cache.c:702:21: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'long int' [-Wformat=]
     702 |         pr_buf(out, "nr_dirty:\t%zu\n", atomic_long_read(&c->nr_dirty));
         |                     ^~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         long int
   fs/bcachefs/util.h:261:34: note: in definition of macro 'pr_buf'
     261 |                                  __VA_ARGS__);                          \
         |                                  ^~~~~~~~~~~
   fs/bcachefs/btree_key_cache.c:702:35: note: format string is defined here
     702 |         pr_buf(out, "nr_dirty:\t%zu\n", atomic_long_read(&c->nr_dirty));
         |                                 ~~^
         |                                   |
         |                                   unsigned int
         |                                 %lu
   In file included from fs/bcachefs/bcachefs.h:203:
   fs/bcachefs/opts.h: At top level:
   fs/bcachefs/opts.h:353:30: warning: 'bch2_opts_default' defined but not used [-Wunused-const-variable=]
     353 | static const struct bch_opts bch2_opts_default = {
         |                              ^~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:35:14: warning: 'NO_SB_OPT_MAX' defined but not used [-Wunused-const-variable=]
      35 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         |              ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/opts.h:35:1: note: in expansion of macro 'LE64_BITMASK'
      35 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         | ^~~~~~~~~~~~
   fs/bcachefs/opts.h:35:14: warning: 'NO_SB_OPT_BITS' defined but not used [-Wunused-const-variable=]
      35 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         |              ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/opts.h:35:1: note: in expansion of macro 'LE64_BITMASK'
      35 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         | ^~~~~~~~~~~~
   fs/bcachefs/opts.h:35:14: warning: 'NO_SB_OPT_OFFSET' defined but not used [-Wunused-const-variable=]
      35 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         |              ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/opts.h:35:1: note: in expansion of macro 'LE64_BITMASK'
      35 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1771:14: warning: 'BTREE_NODE_SEQ_MAX' defined but not used [-Wunused-const-variable=]
    1771 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1771:1: note: in expansion of macro 'LE64_BITMASK'
    1771 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1771:14: warning: 'BTREE_NODE_SEQ_BITS' defined but not used [-Wunused-const-variable=]
    1771 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1771:1: note: in expansion of macro 'LE64_BITMASK'
    1771 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1771:14: warning: 'BTREE_NODE_SEQ_OFFSET' defined but not used [-Wunused-const-variable=]
    1771 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1771:1: note: in expansion of macro 'LE64_BITMASK'
    1771 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1768:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_MAX' defined but not used [-Wunused-const-variable=]
    1768 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1768:1: note: in expansion of macro 'LE64_BITMASK'
    1768 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1768:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_BITS' defined but not used [-Wunused-const-variable=]
    1768 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \


vim +701 fs/bcachefs/btree_key_cache.c

   697	
   698	void bch2_btree_key_cache_to_text(struct printbuf *out, struct btree_key_cache *c)
   699	{
   700		pr_buf(out, "nr_freed:\t%zu\n",	c->nr_freed);
 > 701		pr_buf(out, "nr_keys:\t%zu\n",	atomic_long_read(&c->nr_keys));
   702		pr_buf(out, "nr_dirty:\t%zu\n",	atomic_long_read(&c->nr_dirty));
   703	}
   704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
