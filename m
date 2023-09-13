Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7DA639
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694617843; x=1726153843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0SxHDiA0dDDv9k0+GVK3RL311TVxDbzLlxFz46LJQHg=;
  b=mbEqlzywwAEcS1zjKEjm7okPD0Ec0U9pTDGr5AIuak63wDpKaHUWhcgN
   J9B9LCDV8D3BgncV3HsF20/b1nSNv138QIjrmy9sEgCYJkCFaFJXrPU96
   EI9IgWOplZAgwpTPN6Z5/gpGdY6PVHHpfocBDjNr+I2O5kQ4wW7Gczc+E
   lCZP0WFUIgWVUmVMl49OHd1pHhOb878ZTsHoi/TE15iFCOB4pY27lCunA
   jjrutTKGNy3rydGhZP3h4BeMExTbiB9PbQAyAa+Z5do3BVOLOfauFn4KB
   HxdqY+InKjyfuyeLpivz21kwth0YXYLIrAH1ZoB5qQqLawxInLhB5NW4A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363720723"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="363720723"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 08:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814247674"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="814247674"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2023 08:10:10 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgRVI-0000DF-1z;
	Wed, 13 Sep 2023 15:10:08 +0000
Date: Wed, 13 Sep 2023 23:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2726/4552] fs/bcachefs/bcachefs.h:181:21:
 warning: format '%zu' expects argument of type 'size_t', but argument 6 has
 type 'long unsigned int'
Message-ID: <202309132317.PRko6EpK-lkp@intel.com>
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
commit: 7a82e75ddaef8b97fd1eac358d6c320dc120ec61 [2726/4552] bcachefs: New data structure for buckets waiting on journal commit
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230913/202309132317.PRko6EpK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309132317.PRko6EpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309132317.PRko6EpK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:206,
                    from fs/bcachefs/buckets_waiting_for_journal.c:3:
   fs/bcachefs/bcachefs_format.h:200:25: warning: 'p' offset 3 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     200 |         struct bpos     p;
         |                         ^
   fs/bcachefs/bcachefs_format.h:202:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     202 |         struct bversion version;
         |                         ^~~~~~~
   fs/bcachefs/buckets_waiting_for_journal.c: In function 'bch2_set_bucket_needs_journal_commit':
>> fs/bcachefs/bcachefs.h:181:21: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
     181 | #define pr_fmt(fmt) "bcachefs: %s() " fmt "\n", __func__
         |                     ^~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in expansion of macro 'pr_fmt'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:9: note: in expansion of macro '__dynamic_func_call_cls'
     246 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:267:9: note: in expansion of macro '_dynamic_func_call'
     267 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   fs/bcachefs/buckets_waiting_for_journal.c:136:9: note: in expansion of macro 'pr_debug'
     136 |         pr_debug("took %zu rehashes, table at %zu/%zu elements",
         |         ^~~~~~~~
   In file included from fs/bcachefs/bcachefs.h:209:
   fs/bcachefs/opts.h: At top level:
   fs/bcachefs/opts.h:406:30: warning: 'bch2_opts_default' defined but not used [-Wunused-const-variable=]
     406 | static const struct bch_opts bch2_opts_default = {
         |                              ^~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:45:14: warning: 'NO_SB_OPT_MAX' defined but not used [-Wunused-const-variable=]
      45 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         |              ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:88:25: note: in definition of macro 'LE_BITMASK'
      88 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/opts.h:45:1: note: in expansion of macro 'LE64_BITMASK'
      45 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         | ^~~~~~~~~~~~
   fs/bcachefs/opts.h:45:14: warning: 'NO_SB_OPT_BITS' defined but not used [-Wunused-const-variable=]
      45 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         |              ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/opts.h:45:1: note: in expansion of macro 'LE64_BITMASK'
      45 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         | ^~~~~~~~~~~~
   fs/bcachefs/opts.h:45:14: warning: 'NO_SB_OPT_OFFSET' defined but not used [-Wunused-const-variable=]
      45 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         |              ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/opts.h:45:1: note: in expansion of macro 'LE64_BITMASK'
      45 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1893:14: warning: 'BTREE_NODE_SEQ_MAX' defined but not used [-Wunused-const-variable=]
    1893 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:88:25: note: in definition of macro 'LE_BITMASK'
      88 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1893:1: note: in expansion of macro 'LE64_BITMASK'
    1893 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1893:14: warning: 'BTREE_NODE_SEQ_BITS' defined but not used [-Wunused-const-variable=]
    1893 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1893:1: note: in expansion of macro 'LE64_BITMASK'
    1893 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1893:14: warning: 'BTREE_NODE_SEQ_OFFSET' defined but not used [-Wunused-const-variable=]
    1893 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1893:1: note: in expansion of macro 'LE64_BITMASK'
    1893 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1890:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_MAX' defined but not used [-Wunused-const-variable=]
    1890 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:88:25: note: in definition of macro 'LE_BITMASK'
      88 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1890:1: note: in expansion of macro 'LE64_BITMASK'
    1890 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1890:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_BITS' defined but not used [-Wunused-const-variable=]
    1890 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1890:1: note: in expansion of macro 'LE64_BITMASK'
    1890 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1890:14: warning: 'BTREE_NODE_NEW_EXTENT_OVERWRITE_OFFSET' defined but not used [-Wunused-const-variable=]
    1890 | LE64_BITMASK(BTREE_NODE_NEW_EXTENT_OVERWRITE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +181 fs/bcachefs/bcachefs.h

5ec30115c06692 Kent Overstreet 2017-03-16    4  
5ec30115c06692 Kent Overstreet 2017-03-16    5  /*
5ec30115c06692 Kent Overstreet 2017-03-16    6   * SOME HIGH LEVEL CODE DOCUMENTATION:
5ec30115c06692 Kent Overstreet 2017-03-16    7   *
5ec30115c06692 Kent Overstreet 2017-03-16    8   * Bcache mostly works with cache sets, cache devices, and backing devices.
5ec30115c06692 Kent Overstreet 2017-03-16    9   *
5ec30115c06692 Kent Overstreet 2017-03-16   10   * Support for multiple cache devices hasn't quite been finished off yet, but
5ec30115c06692 Kent Overstreet 2017-03-16   11   * it's about 95% plumbed through. A cache set and its cache devices is sort of
5ec30115c06692 Kent Overstreet 2017-03-16   12   * like a md raid array and its component devices. Most of the code doesn't care
5ec30115c06692 Kent Overstreet 2017-03-16   13   * about individual cache devices, the main abstraction is the cache set.
5ec30115c06692 Kent Overstreet 2017-03-16   14   *
5ec30115c06692 Kent Overstreet 2017-03-16   15   * Multiple cache devices is intended to give us the ability to mirror dirty
5ec30115c06692 Kent Overstreet 2017-03-16   16   * cached data and metadata, without mirroring clean cached data.
5ec30115c06692 Kent Overstreet 2017-03-16   17   *
5ec30115c06692 Kent Overstreet 2017-03-16   18   * Backing devices are different, in that they have a lifetime independent of a
5ec30115c06692 Kent Overstreet 2017-03-16   19   * cache set. When you register a newly formatted backing device it'll come up
5ec30115c06692 Kent Overstreet 2017-03-16   20   * in passthrough mode, and then you can attach and detach a backing device from
5ec30115c06692 Kent Overstreet 2017-03-16   21   * a cache set at runtime - while it's mounted and in use. Detaching implicitly
5ec30115c06692 Kent Overstreet 2017-03-16   22   * invalidates any cached data for that backing device.
5ec30115c06692 Kent Overstreet 2017-03-16   23   *
5ec30115c06692 Kent Overstreet 2017-03-16   24   * A cache set can have multiple (many) backing devices attached to it.
5ec30115c06692 Kent Overstreet 2017-03-16   25   *
5ec30115c06692 Kent Overstreet 2017-03-16   26   * There's also flash only volumes - this is the reason for the distinction
5ec30115c06692 Kent Overstreet 2017-03-16   27   * between struct cached_dev and struct bcache_device. A flash only volume
5ec30115c06692 Kent Overstreet 2017-03-16   28   * works much like a bcache device that has a backing device, except the
5ec30115c06692 Kent Overstreet 2017-03-16   29   * "cached" data is always dirty. The end result is that we get thin
5ec30115c06692 Kent Overstreet 2017-03-16   30   * provisioning with very little additional code.
5ec30115c06692 Kent Overstreet 2017-03-16   31   *
5ec30115c06692 Kent Overstreet 2017-03-16   32   * Flash only volumes work but they're not production ready because the moving
5ec30115c06692 Kent Overstreet 2017-03-16   33   * garbage collector needs more work. More on that later.
5ec30115c06692 Kent Overstreet 2017-03-16   34   *
5ec30115c06692 Kent Overstreet 2017-03-16   35   * BUCKETS/ALLOCATION:
5ec30115c06692 Kent Overstreet 2017-03-16   36   *
5ec30115c06692 Kent Overstreet 2017-03-16   37   * Bcache is primarily designed for caching, which means that in normal
5ec30115c06692 Kent Overstreet 2017-03-16   38   * operation all of our available space will be allocated. Thus, we need an
5ec30115c06692 Kent Overstreet 2017-03-16   39   * efficient way of deleting things from the cache so we can write new things to
5ec30115c06692 Kent Overstreet 2017-03-16   40   * it.
5ec30115c06692 Kent Overstreet 2017-03-16   41   *
5ec30115c06692 Kent Overstreet 2017-03-16   42   * To do this, we first divide the cache device up into buckets. A bucket is the
5ec30115c06692 Kent Overstreet 2017-03-16   43   * unit of allocation; they're typically around 1 mb - anywhere from 128k to 2M+
5ec30115c06692 Kent Overstreet 2017-03-16   44   * works efficiently.
5ec30115c06692 Kent Overstreet 2017-03-16   45   *
5ec30115c06692 Kent Overstreet 2017-03-16   46   * Each bucket has a 16 bit priority, and an 8 bit generation associated with
5ec30115c06692 Kent Overstreet 2017-03-16   47   * it. The gens and priorities for all the buckets are stored contiguously and
5ec30115c06692 Kent Overstreet 2017-03-16   48   * packed on disk (in a linked list of buckets - aside from the superblock, all
5ec30115c06692 Kent Overstreet 2017-03-16   49   * of bcache's metadata is stored in buckets).
5ec30115c06692 Kent Overstreet 2017-03-16   50   *
5ec30115c06692 Kent Overstreet 2017-03-16   51   * The priority is used to implement an LRU. We reset a bucket's priority when
5ec30115c06692 Kent Overstreet 2017-03-16   52   * we allocate it or on cache it, and every so often we decrement the priority
5ec30115c06692 Kent Overstreet 2017-03-16   53   * of each bucket. It could be used to implement something more sophisticated,
5ec30115c06692 Kent Overstreet 2017-03-16   54   * if anyone ever gets around to it.
5ec30115c06692 Kent Overstreet 2017-03-16   55   *
5ec30115c06692 Kent Overstreet 2017-03-16   56   * The generation is used for invalidating buckets. Each pointer also has an 8
5ec30115c06692 Kent Overstreet 2017-03-16   57   * bit generation embedded in it; for a pointer to be considered valid, its gen
5ec30115c06692 Kent Overstreet 2017-03-16   58   * must match the gen of the bucket it points into.  Thus, to reuse a bucket all
5ec30115c06692 Kent Overstreet 2017-03-16   59   * we have to do is increment its gen (and write its new gen to disk; we batch
5ec30115c06692 Kent Overstreet 2017-03-16   60   * this up).
5ec30115c06692 Kent Overstreet 2017-03-16   61   *
5ec30115c06692 Kent Overstreet 2017-03-16   62   * Bcache is entirely COW - we never write twice to a bucket, even buckets that
5ec30115c06692 Kent Overstreet 2017-03-16   63   * contain metadata (including btree nodes).
5ec30115c06692 Kent Overstreet 2017-03-16   64   *
5ec30115c06692 Kent Overstreet 2017-03-16   65   * THE BTREE:
5ec30115c06692 Kent Overstreet 2017-03-16   66   *
5ec30115c06692 Kent Overstreet 2017-03-16   67   * Bcache is in large part design around the btree.
5ec30115c06692 Kent Overstreet 2017-03-16   68   *
5ec30115c06692 Kent Overstreet 2017-03-16   69   * At a high level, the btree is just an index of key -> ptr tuples.
5ec30115c06692 Kent Overstreet 2017-03-16   70   *
5ec30115c06692 Kent Overstreet 2017-03-16   71   * Keys represent extents, and thus have a size field. Keys also have a variable
5ec30115c06692 Kent Overstreet 2017-03-16   72   * number of pointers attached to them (potentially zero, which is handy for
5ec30115c06692 Kent Overstreet 2017-03-16   73   * invalidating the cache).
5ec30115c06692 Kent Overstreet 2017-03-16   74   *
5ec30115c06692 Kent Overstreet 2017-03-16   75   * The key itself is an inode:offset pair. The inode number corresponds to a
5ec30115c06692 Kent Overstreet 2017-03-16   76   * backing device or a flash only volume. The offset is the ending offset of the
5ec30115c06692 Kent Overstreet 2017-03-16   77   * extent within the inode - not the starting offset; this makes lookups
5ec30115c06692 Kent Overstreet 2017-03-16   78   * slightly more convenient.
5ec30115c06692 Kent Overstreet 2017-03-16   79   *
5ec30115c06692 Kent Overstreet 2017-03-16   80   * Pointers contain the cache device id, the offset on that device, and an 8 bit
5ec30115c06692 Kent Overstreet 2017-03-16   81   * generation number. More on the gen later.
5ec30115c06692 Kent Overstreet 2017-03-16   82   *
5ec30115c06692 Kent Overstreet 2017-03-16   83   * Index lookups are not fully abstracted - cache lookups in particular are
5ec30115c06692 Kent Overstreet 2017-03-16   84   * still somewhat mixed in with the btree code, but things are headed in that
5ec30115c06692 Kent Overstreet 2017-03-16   85   * direction.
5ec30115c06692 Kent Overstreet 2017-03-16   86   *
5ec30115c06692 Kent Overstreet 2017-03-16   87   * Updates are fairly well abstracted, though. There are two different ways of
5ec30115c06692 Kent Overstreet 2017-03-16   88   * updating the btree; insert and replace.
5ec30115c06692 Kent Overstreet 2017-03-16   89   *
5ec30115c06692 Kent Overstreet 2017-03-16   90   * BTREE_INSERT will just take a list of keys and insert them into the btree -
5ec30115c06692 Kent Overstreet 2017-03-16   91   * overwriting (possibly only partially) any extents they overlap with. This is
5ec30115c06692 Kent Overstreet 2017-03-16   92   * used to update the index after a write.
5ec30115c06692 Kent Overstreet 2017-03-16   93   *
5ec30115c06692 Kent Overstreet 2017-03-16   94   * BTREE_REPLACE is really cmpxchg(); it inserts a key into the btree iff it is
5ec30115c06692 Kent Overstreet 2017-03-16   95   * overwriting a key that matches another given key. This is used for inserting
5ec30115c06692 Kent Overstreet 2017-03-16   96   * data into the cache after a cache miss, and for background writeback, and for
5ec30115c06692 Kent Overstreet 2017-03-16   97   * the moving garbage collector.
5ec30115c06692 Kent Overstreet 2017-03-16   98   *
5ec30115c06692 Kent Overstreet 2017-03-16   99   * There is no "delete" operation; deleting things from the index is
5ec30115c06692 Kent Overstreet 2017-03-16  100   * accomplished by either by invalidating pointers (by incrementing a bucket's
5ec30115c06692 Kent Overstreet 2017-03-16  101   * gen) or by inserting a key with 0 pointers - which will overwrite anything
5ec30115c06692 Kent Overstreet 2017-03-16  102   * previously present at that location in the index.
5ec30115c06692 Kent Overstreet 2017-03-16  103   *
5ec30115c06692 Kent Overstreet 2017-03-16  104   * This means that there are always stale/invalid keys in the btree. They're
5ec30115c06692 Kent Overstreet 2017-03-16  105   * filtered out by the code that iterates through a btree node, and removed when
5ec30115c06692 Kent Overstreet 2017-03-16  106   * a btree node is rewritten.
5ec30115c06692 Kent Overstreet 2017-03-16  107   *
5ec30115c06692 Kent Overstreet 2017-03-16  108   * BTREE NODES:
5ec30115c06692 Kent Overstreet 2017-03-16  109   *
5ec30115c06692 Kent Overstreet 2017-03-16  110   * Our unit of allocation is a bucket, and we we can't arbitrarily allocate and
5ec30115c06692 Kent Overstreet 2017-03-16  111   * free smaller than a bucket - so, that's how big our btree nodes are.
5ec30115c06692 Kent Overstreet 2017-03-16  112   *
5ec30115c06692 Kent Overstreet 2017-03-16  113   * (If buckets are really big we'll only use part of the bucket for a btree node
5ec30115c06692 Kent Overstreet 2017-03-16  114   * - no less than 1/4th - but a bucket still contains no more than a single
5ec30115c06692 Kent Overstreet 2017-03-16  115   * btree node. I'd actually like to change this, but for now we rely on the
5ec30115c06692 Kent Overstreet 2017-03-16  116   * bucket's gen for deleting btree nodes when we rewrite/split a node.)
5ec30115c06692 Kent Overstreet 2017-03-16  117   *
5ec30115c06692 Kent Overstreet 2017-03-16  118   * Anyways, btree nodes are big - big enough to be inefficient with a textbook
5ec30115c06692 Kent Overstreet 2017-03-16  119   * btree implementation.
5ec30115c06692 Kent Overstreet 2017-03-16  120   *
5ec30115c06692 Kent Overstreet 2017-03-16  121   * The way this is solved is that btree nodes are internally log structured; we
5ec30115c06692 Kent Overstreet 2017-03-16  122   * can append new keys to an existing btree node without rewriting it. This
5ec30115c06692 Kent Overstreet 2017-03-16  123   * means each set of keys we write is sorted, but the node is not.
5ec30115c06692 Kent Overstreet 2017-03-16  124   *
5ec30115c06692 Kent Overstreet 2017-03-16  125   * We maintain this log structure in memory - keeping 1Mb of keys sorted would
5ec30115c06692 Kent Overstreet 2017-03-16  126   * be expensive, and we have to distinguish between the keys we have written and
5ec30115c06692 Kent Overstreet 2017-03-16  127   * the keys we haven't. So to do a lookup in a btree node, we have to search
5ec30115c06692 Kent Overstreet 2017-03-16  128   * each sorted set. But we do merge written sets together lazily, so the cost of
5ec30115c06692 Kent Overstreet 2017-03-16  129   * these extra searches is quite low (normally most of the keys in a btree node
5ec30115c06692 Kent Overstreet 2017-03-16  130   * will be in one big set, and then there'll be one or two sets that are much
5ec30115c06692 Kent Overstreet 2017-03-16  131   * smaller).
5ec30115c06692 Kent Overstreet 2017-03-16  132   *
5ec30115c06692 Kent Overstreet 2017-03-16  133   * This log structure makes bcache's btree more of a hybrid between a
5ec30115c06692 Kent Overstreet 2017-03-16  134   * conventional btree and a compacting data structure, with some of the
5ec30115c06692 Kent Overstreet 2017-03-16  135   * advantages of both.
5ec30115c06692 Kent Overstreet 2017-03-16  136   *
5ec30115c06692 Kent Overstreet 2017-03-16  137   * GARBAGE COLLECTION:
5ec30115c06692 Kent Overstreet 2017-03-16  138   *
5ec30115c06692 Kent Overstreet 2017-03-16  139   * We can't just invalidate any bucket - it might contain dirty data or
5ec30115c06692 Kent Overstreet 2017-03-16  140   * metadata. If it once contained dirty data, other writes might overwrite it
5ec30115c06692 Kent Overstreet 2017-03-16  141   * later, leaving no valid pointers into that bucket in the index.
5ec30115c06692 Kent Overstreet 2017-03-16  142   *
5ec30115c06692 Kent Overstreet 2017-03-16  143   * Thus, the primary purpose of garbage collection is to find buckets to reuse.
5ec30115c06692 Kent Overstreet 2017-03-16  144   * It also counts how much valid data it each bucket currently contains, so that
5ec30115c06692 Kent Overstreet 2017-03-16  145   * allocation can reuse buckets sooner when they've been mostly overwritten.
5ec30115c06692 Kent Overstreet 2017-03-16  146   *
5ec30115c06692 Kent Overstreet 2017-03-16  147   * It also does some things that are really internal to the btree
5ec30115c06692 Kent Overstreet 2017-03-16  148   * implementation. If a btree node contains pointers that are stale by more than
5ec30115c06692 Kent Overstreet 2017-03-16  149   * some threshold, it rewrites the btree node to avoid the bucket's generation
5ec30115c06692 Kent Overstreet 2017-03-16  150   * wrapping around. It also merges adjacent btree nodes if they're empty enough.
5ec30115c06692 Kent Overstreet 2017-03-16  151   *
5ec30115c06692 Kent Overstreet 2017-03-16  152   * THE JOURNAL:
5ec30115c06692 Kent Overstreet 2017-03-16  153   *
5ec30115c06692 Kent Overstreet 2017-03-16  154   * Bcache's journal is not necessary for consistency; we always strictly
5ec30115c06692 Kent Overstreet 2017-03-16  155   * order metadata writes so that the btree and everything else is consistent on
5ec30115c06692 Kent Overstreet 2017-03-16  156   * disk in the event of an unclean shutdown, and in fact bcache had writeback
5ec30115c06692 Kent Overstreet 2017-03-16  157   * caching (with recovery from unclean shutdown) before journalling was
5ec30115c06692 Kent Overstreet 2017-03-16  158   * implemented.
5ec30115c06692 Kent Overstreet 2017-03-16  159   *
5ec30115c06692 Kent Overstreet 2017-03-16  160   * Rather, the journal is purely a performance optimization; we can't complete a
5ec30115c06692 Kent Overstreet 2017-03-16  161   * write until we've updated the index on disk, otherwise the cache would be
5ec30115c06692 Kent Overstreet 2017-03-16  162   * inconsistent in the event of an unclean shutdown. This means that without the
5ec30115c06692 Kent Overstreet 2017-03-16  163   * journal, on random write workloads we constantly have to update all the leaf
5ec30115c06692 Kent Overstreet 2017-03-16  164   * nodes in the btree, and those writes will be mostly empty (appending at most
5ec30115c06692 Kent Overstreet 2017-03-16  165   * a few keys each) - highly inefficient in terms of amount of metadata writes,
5ec30115c06692 Kent Overstreet 2017-03-16  166   * and it puts more strain on the various btree resorting/compacting code.
5ec30115c06692 Kent Overstreet 2017-03-16  167   *
5ec30115c06692 Kent Overstreet 2017-03-16  168   * The journal is just a log of keys we've inserted; on startup we just reinsert
5ec30115c06692 Kent Overstreet 2017-03-16  169   * all the keys in the open journal entries. That means that when we're updating
5ec30115c06692 Kent Overstreet 2017-03-16  170   * a node in the btree, we can wait until a 4k block of keys fills up before
5ec30115c06692 Kent Overstreet 2017-03-16  171   * writing them out.
5ec30115c06692 Kent Overstreet 2017-03-16  172   *
5ec30115c06692 Kent Overstreet 2017-03-16  173   * For simplicity, we only journal updates to leaf nodes; updates to parent
5ec30115c06692 Kent Overstreet 2017-03-16  174   * nodes are rare enough (since our leaf nodes are huge) that it wasn't worth
5ec30115c06692 Kent Overstreet 2017-03-16  175   * the complexity to deal with journalling them (in particular, journal replay)
5ec30115c06692 Kent Overstreet 2017-03-16  176   * - updates to non leaf nodes just happen synchronously (see btree_split()).
5ec30115c06692 Kent Overstreet 2017-03-16  177   */
5ec30115c06692 Kent Overstreet 2017-03-16  178  
5ec30115c06692 Kent Overstreet 2017-03-16  179  #undef pr_fmt
c11146808d76d2 Kent Overstreet 2022-01-04  180  #ifdef __KERNEL__
5ec30115c06692 Kent Overstreet 2017-03-16 @181  #define pr_fmt(fmt) "bcachefs: %s() " fmt "\n", __func__
c11146808d76d2 Kent Overstreet 2022-01-04  182  #else
c11146808d76d2 Kent Overstreet 2022-01-04  183  #define pr_fmt(fmt) "%s() " fmt "\n", __func__
c11146808d76d2 Kent Overstreet 2022-01-04  184  #endif
5ec30115c06692 Kent Overstreet 2017-03-16  185  

:::::: The code at line 181 was first introduced by commit
:::::: 5ec30115c06692f17b20e4f4c7bdcd62cf96e30d bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
