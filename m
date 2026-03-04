Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F253451AE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626081; cv=none; b=GL733VqtG33uviCssDRP3MJdlR3lgF49NWbrCsFDwYsd4IM/l0WFFz9bwJ//baFaiFp6gkCjc6pICClJfxArY1RI3XSeGryXOuixKzH7JoJEYq+ZQHA67AIeZY4LWrjENjf61L15iCYFL2Mz3cfD6tPRuzYjIQoBApInHXbZrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626081; c=relaxed/simple;
	bh=SJmIvn/ZMgxBumEDxb2Kq0fFoXPSykXUVPw+hWn1fbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=neFU7M4PSGI4eYPG11eG5L7pMkvkfj/ctlOW+Bl5TaN9yGha0eOeIxQ8gWg3RCLeMAO/lVgFA/Wfxm9WjJsJUyxwQoDowQf2AyUtxtuLs1wWwuv7HXY0nLb9kRf8I1EKTJsZsZR95RtFm7r3/qs4Dc93vXXFLOYzY3USoaiefKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlxlUD0S; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlxlUD0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772626077; x=1804162077;
  h=date:from:to:cc:subject:message-id;
  bh=SJmIvn/ZMgxBumEDxb2Kq0fFoXPSykXUVPw+hWn1fbs=;
  b=FlxlUD0SYeLTf5ukPD3G3Tbi0gWbQr9BSllCsl+VAzckAfoZN9Xla+6V
   7o3QJjDIZNmc+6VrzwisnHGUarUv4w2okpw5BW4wD5hvP0we6uxyj3WA/
   2nQ3LBao33ZM5/bSwo/izv6zDiaquHq9fWHyIyTrmmVf0GuwshO+6Flwi
   dvw+0invCWqh8/SlF6q489z7HNPvGqSIyNvAcyTxDgnrUL5lrrVVV1Y6o
   Z5TPs+E6Wsa2ytcEokEDLFewmVeXk6JaYnqS/rY60O01OUOyXIL7MGya/
   HrR77ZpyYPH/8Vst11ECDV4/wNZbOoriSPxnoUP6TpQSH8vD2sLvB14WD
   w==;
X-CSE-ConnectionGUID: Te+tPmk2QpWf8B4eI8fJLA==
X-CSE-MsgGUID: DvC0Q8EGQpyfENnAsBxZWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96300239"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="96300239"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 04:00:42 -0800
X-CSE-ConnectionGUID: wTsJoCDaQuifSs3WAX75XA==
X-CSE-MsgGUID: XUkCqUefRiuTcTh+bJUF8A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2026 04:00:40 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxku5-000000003gv-3soy;
	Wed, 04 Mar 2026 12:00:37 +0000
Date: Wed, 04 Mar 2026 19:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260302 13/13]
 drivers/md/bcache/bcache.h:770:35: error: passing argument 1 of 'KEY_SIZE'
 from incompatible pointer type
Message-ID: <202603041948.bxoAEprd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260302
head:   edaeb7365fb0decc352db789ed93ef51bc8ebafa
commit: edaeb7365fb0decc352db789ed93ef51bc8ebafa [13/13] bcachefs: Avoid dozens of -Wflex-array-member-not-at-end warnings
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260304/202603041948.bxoAEprd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041948.bxoAEprd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041948.bxoAEprd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/md/bcache/btree.c:24:
   drivers/md/bcache/btree.c: In function 'bch_btree_init_next':
>> drivers/md/bcache/bcache.h:770:35: error: passing argument 1 of 'KEY_SIZE' from incompatible pointer type [-Wincompatible-pointer-types]
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
         |                                   |
         |                                   struct bkey_fixed *
   drivers/md/bcache/btree.c:120:26: note: in expansion of macro 'btree_blocks'
     120 |         if (b->written < btree_blocks(b))
         |                          ^~~~~~~~~~~~
   In file included from drivers/md/bcache/bcache.h:193:
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: in expansion of macro 'KEY_FIELD'
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^~~~~~~~~
   drivers/md/bcache/btree.c: In function 'bch_btree_node_read_done':
>> drivers/md/bcache/bcache.h:770:35: error: passing argument 1 of 'KEY_SIZE' from incompatible pointer type [-Wincompatible-pointer-types]
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
         |                                   |
         |                                   struct bkey_fixed *
   drivers/md/bcache/btree.c:171:27: note: in expansion of macro 'btree_blocks'
     171 |              b->written < btree_blocks(b) && i->seq == b->keys.set[0].data->seq;
         |                           ^~~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: in expansion of macro 'KEY_FIELD'
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^~~~~~~~~
>> drivers/md/bcache/bcache.h:770:35: error: passing argument 1 of 'KEY_SIZE' from incompatible pointer type [-Wincompatible-pointer-types]
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
         |                                   |
         |                                   struct bkey_fixed *
   drivers/md/bcache/btree.c:179:21: note: in expansion of macro 'btree_blocks'
     179 |                     btree_blocks(b))
         |                     ^~~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: in expansion of macro 'KEY_FIELD'
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^~~~~~~~~
>> drivers/md/bcache/btree.c:209:57: error: passing argument 1 of 'KEY_SIZE' from incompatible pointer type [-Wincompatible-pointer-types]
     209 |              bset_sector_offset(&b->keys, i) < KEY_SIZE(&b->key);
         |                                                         ^~~~~~~
         |                                                         |
         |                                                         struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: in expansion of macro 'KEY_FIELD'
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^~~~~~~~~
>> drivers/md/bcache/btree.c:219:22: error: passing argument 1 of 'bkey_cmp' from incompatible pointer type [-Wincompatible-pointer-types]
     219 |             bkey_cmp(&b->key, &b->keys.set[0].end) < 0)
         |                      ^~~~~~~
         |                      |
         |                      struct bkey_fixed *
   In file included from drivers/md/bcache/bcache.h:194:
   drivers/md/bcache/bset.h:425:60: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     425 | static __always_inline int64_t bkey_cmp(const struct bkey *l,
         |                                         ~~~~~~~~~~~~~~~~~~~^
>> drivers/md/bcache/bcache.h:770:35: error: passing argument 1 of 'KEY_SIZE' from incompatible pointer type [-Wincompatible-pointer-types]
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
         |                                   |
         |                                   struct bkey_fixed *
   drivers/md/bcache/btree.c:222:26: note: in expansion of macro 'btree_blocks'
     222 |         if (b->written < btree_blocks(b))
         |                          ^~~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: in expansion of macro 'KEY_FIELD'
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^~~~~~~~~
>> drivers/md/bcache/btree.c:231:54: error: passing argument 2 of 'PTR_BUCKET_NR' from incompatible pointer type [-Wincompatible-pointer-types]
     231 |                             err, PTR_BUCKET_NR(b->c, &b->key, 0),
         |                                                      ^~~~~~~
         |                                                      |
         |                                                      struct bkey_fixed *
   drivers/md/bcache/bcache.h:821:55: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     821 |                                    const struct bkey *k,
         |                                    ~~~~~~~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c: In function 'bch_btree_node_read':
   drivers/md/bcache/btree.c:254:41: error: passing argument 1 of 'KEY_SIZE' from incompatible pointer type [-Wincompatible-pointer-types]
     254 |         bio->bi_iter.bi_size = KEY_SIZE(&b->key) << 9;
         |                                         ^~~~~~~
         |                                         |
         |                                         struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: in expansion of macro 'KEY_FIELD'
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^~~~~~~~~
>> drivers/md/bcache/btree.c:261:36: error: passing argument 3 of 'bch_submit_bbio' from incompatible pointer type [-Wincompatible-pointer-types]
     261 |         bch_submit_bbio(bio, b->c, &b->key, 0);
         |                                    ^~~~~~~
         |                                    |
         |                                    struct bkey_fixed *
   drivers/md/bcache/bcache.h:985:35: note: expected 'struct bkey *' but argument is of type 'struct bkey_fixed *'
     985 |                      struct bkey *k, unsigned int ptr);
         |                      ~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c:278:49: error: passing argument 2 of 'PTR_BUCKET_NR' from incompatible pointer type [-Wincompatible-pointer-types]
     278 |                             PTR_BUCKET_NR(b->c, &b->key, 0));
         |                                                 ^~~~~~~
         |                                                 |
         |                                                 struct bkey_fixed *
   drivers/md/bcache/bcache.h:821:55: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     821 |                                    const struct bkey *k,
         |                                    ~~~~~~~~~~~~~~~~~~~^
   In file included from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/mempool.h:8,
                    from include/linux/bio.h:8,
                    from drivers/md/bcache/bcache.h:181:
   drivers/md/bcache/btree.c: In function 'do_btree_node_write':
>> drivers/md/bcache/btree.c:371:27: error: passing argument 1 of 'bkey_bytes' from incompatible pointer type [-Wincompatible-pointer-types]
     371 |         bkey_copy(&k.key, &b->key);
         |                           ^~~~~~~
         |                           |
         |                           struct bkey_fixed *
   arch/m68k/include/asm/string.h:53:48: note: in definition of macro 'memcpy'
      53 | #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
         |                                                ^
   drivers/md/bcache/bcache_ondisk.h:121:33: note: in expansion of macro 'unsafe_memcpy'
     121 | #define bkey_copy(_dest, _src)  unsafe_memcpy(_dest, _src, bkey_bytes(_src), \
         |                                 ^~~~~~~~~~~~~
   drivers/md/bcache/btree.c:371:9: note: in expansion of macro 'bkey_copy'
     371 |         bkey_copy(&k.key, &b->key);
         |         ^~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:116:59: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     116 | static inline unsigned long bkey_bytes(const struct bkey *k)
         |                                        ~~~~~~~~~~~~~~~~~~~^
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from arch/m68k/include/asm/processor.h:11,
                    from include/linux/sched.h:13:
   drivers/md/bcache/btree.c: In function '__bch_btree_node_write':
>> drivers/md/bcache/bcache.h:770:35: error: passing argument 1 of 'KEY_SIZE' from incompatible pointer type [-Wincompatible-pointer-types]
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
         |                                   |
         |                                   struct bkey_fixed *
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/md/bcache/btree.c:412:9: note: in expansion of macro 'BUG_ON'
     412 |         BUG_ON(b->written >= btree_blocks(b));
         |         ^~~~~~
   drivers/md/bcache/btree.c:412:30: note: in expansion of macro 'btree_blocks'
     412 |         BUG_ON(b->written >= btree_blocks(b));
         |                              ^~~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: in expansion of macro 'KEY_FIELD'
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^~~~~~~~~
   drivers/md/bcache/btree.c: In function 'mca_find':
>> drivers/md/bcache/btree.c:859:33: error: passing argument 1 of 'PTR_GEN' from incompatible pointer type [-Wincompatible-pointer-types]
     859 |                 if (PTR_HASH(c, &b->key) == PTR_HASH(c, k))
         |                                 ^~~~~~~
         |                                 |
         |                                 struct bkey_fixed *
   drivers/md/bcache/btree.c:100:52: note: in definition of macro 'PTR_HASH'
     100 |         (((k)->ptr[0] >> c->bucket_bits) | PTR_GEN(k, 0))
         |                                                    ^
   drivers/md/bcache/bcache_ondisk.h:45:45: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      45 | static inline __u64 name(const struct bkey *k, unsigned int i)          \
         |                          ~~~~~~~~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:102:1: note: in expansion of macro 'PTR_FIELD'
     102 | PTR_FIELD(PTR_GEN,                      0,  8)
         | ^~~~~~~~~
   drivers/md/bcache/btree.c: In function 'bch_btree_node_get':
   drivers/md/bcache/btree.c:1035:33: error: passing argument 1 of 'PTR_GEN' from incompatible pointer type [-Wincompatible-pointer-types]
    1035 |                 if (PTR_HASH(c, &b->key) != PTR_HASH(c, k)) {
         |                                 ^~~~~~~
         |                                 |
         |                                 struct bkey_fixed *
   drivers/md/bcache/btree.c:100:52: note: in definition of macro 'PTR_HASH'
     100 |         (((k)->ptr[0] >> c->bucket_bits) | PTR_GEN(k, 0))
         |                                                    ^
   drivers/md/bcache/bcache_ondisk.h:45:45: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      45 | static inline __u64 name(const struct bkey *k, unsigned int i)          \
         |                          ~~~~~~~~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:102:1: note: in expansion of macro 'PTR_FIELD'
     102 | PTR_FIELD(PTR_GEN,                      0,  8)
         | ^~~~~~~~~
   drivers/md/bcache/btree.c: In function 'btree_node_free':
>> drivers/md/bcache/btree.c:1110:31: error: passing argument 2 of 'bch_bucket_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1110 |         bch_bucket_free(b->c, &b->key);
         |                               ^~~~~~~
         |                               |
         |                               struct bkey_fixed *
   drivers/md/bcache/bcache.h:994:56: note: expected 'struct bkey *' but argument is of type 'struct bkey_fixed *'
     994 | void bch_bucket_free(struct cache_set *c, struct bkey *k);
         |                                           ~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c: In function 'btree_node_alloc_replacement':
>> drivers/md/bcache/btree.c:1177:31: error: passing argument 1 of 'bkey_copy_key' from incompatible pointer type [-Wincompatible-pointer-types]
    1177 |                 bkey_copy_key(&n->key, &b->key);
         |                               ^~~~~~~
         |                               |
         |                               struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:124:47: note: expected 'struct bkey *' but argument is of type 'struct bkey_fixed *'
     124 | static inline void bkey_copy_key(struct bkey *dest, const struct bkey *src)
         |                                  ~~~~~~~~~~~~~^~~~
   drivers/md/bcache/btree.c:1177:40: error: passing argument 2 of 'bkey_copy_key' from incompatible pointer type [-Wincompatible-pointer-types]
    1177 |                 bkey_copy_key(&n->key, &b->key);
         |                                        ^~~~~~~
         |                                        |
         |                                        struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:124:72: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     124 | static inline void bkey_copy_key(struct bkey *dest, const struct bkey *src)
         |                                                     ~~~~~~~~~~~~~~~~~~~^~~
   drivers/md/bcache/btree.c: In function 'make_btree_freeing_key':
   drivers/md/bcache/btree.c:1192:22: error: passing argument 1 of 'bkey_bytes' from incompatible pointer type [-Wincompatible-pointer-types]
    1192 |         bkey_copy(k, &b->key);
         |                      ^~~~~~~
         |                      |
         |                      struct bkey_fixed *
   arch/m68k/include/asm/string.h:53:48: note: in definition of macro 'memcpy'
      53 | #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
         |                                                ^
   drivers/md/bcache/bcache_ondisk.h:121:33: note: in expansion of macro 'unsafe_memcpy'
     121 | #define bkey_copy(_dest, _src)  unsafe_memcpy(_dest, _src, bkey_bytes(_src), \
         |                                 ^~~~~~~~~~~~~
   drivers/md/bcache/btree.c:1192:9: note: in expansion of macro 'bkey_copy'
    1192 |         bkey_copy(k, &b->key);
         |         ^~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:116:59: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     116 | static inline unsigned long bkey_bytes(const struct bkey *k)
         |                                        ~~~~~~~~~~~~~~~~~~~^
>> drivers/md/bcache/btree.c:1198:58: error: passing argument 2 of 'PTR_BUCKET' from incompatible pointer type [-Wincompatible-pointer-types]
    1198 |                                         PTR_BUCKET(b->c, &b->key, i)));
         |                                                          ^~~~~~~
         |                                                          |
         |                                                          struct bkey_fixed *
   drivers/md/bcache/bcache.h:828:60: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     828 |                                         const struct bkey *k,
         |                                         ~~~~~~~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c: In function 'btree_gc_mark_node':
   drivers/md/bcache/btree.c:1332:39: error: passing argument 1 of 'bkey_cmp' from incompatible pointer type [-Wincompatible-pointer-types]
    1332 |                              bkey_cmp(&b->key, &t->end) < 0,
         |                                       ^~~~~~~
         |                                       |
         |                                       struct bkey_fixed *
   drivers/md/bcache/bcache.h:880:13: note: in definition of macro 'btree_bug_on'
     880 |         if (cond)                                                       \
         |             ^~~~
   drivers/md/bcache/bset.h:425:60: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     425 | static __always_inline int64_t bkey_cmp(const struct bkey *l,
         |                                         ~~~~~~~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c: In function 'btree_gc_coalesce':
>> drivers/md/bcache/bcache.h:770:35: error: passing argument 1 of 'KEY_SIZE' from incompatible pointer type [-Wincompatible-pointer-types]
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
         |                                   |
         |                                   struct bkey_fixed *
   drivers/md/bcache/btree.c:1434:29: note: in expansion of macro 'btree_blocks'
    1434 |                             btree_blocks(new_nodes[i]))
         |                             ^~~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: in expansion of macro 'KEY_FIELD'
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^~~~~~~~~
>> drivers/md/bcache/btree.c:1439:30: error: assignment to 'struct bkey *' from incompatible pointer type 'struct bkey_fixed *' [-Wincompatible-pointer-types]
    1439 |                         last = &r->b->key;
         |                              ^
>> drivers/md/bcache/bcache.h:770:35: error: passing argument 1 of 'KEY_SIZE' from incompatible pointer type [-Wincompatible-pointer-types]
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
         |                                   |
         |                                   struct bkey_fixed *
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/md/bcache/btree.c:1442:17: note: in expansion of macro 'BUG_ON'
    1442 |                 BUG_ON(__set_blocks(n1, n1->keys + keys, block_bytes(b->c->cache)) >
         |                 ^~~~~~
   drivers/md/bcache/btree.c:1443:24: note: in expansion of macro 'btree_blocks'
    1443 |                        btree_blocks(new_nodes[i]));
         |                        ^~~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: in expansion of macro 'KEY_FIELD'
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^~~~~~~~~
   drivers/md/bcache/btree.c:1446:39: error: passing argument 1 of 'bkey_copy_key' from incompatible pointer type [-Wincompatible-pointer-types]
    1446 |                         bkey_copy_key(&new_nodes[i]->key, last);
         |                                       ^~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:124:47: note: expected 'struct bkey *' but argument is of type 'struct bkey_fixed *'
     124 | static inline void bkey_copy_key(struct bkey *dest, const struct bkey *src)
         |                                  ~~~~~~~~~~~~~^~~~
>> drivers/md/bcache/btree.c:1463:53: error: passing argument 1 of 'bkey_u64s' from incompatible pointer type [-Wincompatible-pointer-types]
    1463 |                                           bkey_u64s(&new_nodes[i]->key)))
         |                                                     ^~~~~~~~~~~~~~~~~~
         |                                                     |
         |                                                     struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:111:58: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     111 | static inline unsigned long bkey_u64s(const struct bkey *k)
         |                                       ~~~~~~~~~~~~~~~~~~~^
>> drivers/md/bcache/btree.c:1467:43: error: passing argument 2 of 'bch_keylist_add' from incompatible pointer type [-Wincompatible-pointer-types]
    1467 |                 bch_keylist_add(&keylist, &new_nodes[i]->key);
         |                                           ^~~~~~~~~~~~~~~~~~
         |                                           |
         |                                           struct bkey_fixed *
   drivers/md/bcache/bset.h:528:68: note: expected 'struct bkey *' but argument is of type 'struct bkey_fixed *'
     528 | static inline void bch_keylist_add(struct keylist *l, struct bkey *k)
         |                                                       ~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c:1482:63: error: passing argument 1 of 'bkey_u64s' from incompatible pointer type [-Wincompatible-pointer-types]
    1482 |                 if (__bch_keylist_realloc(&keylist, bkey_u64s(&r[i].b->key)))
         |                                                               ^~~~~~~~~~~~
         |                                                               |
         |                                                               struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:111:58: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     111 | static inline unsigned long bkey_u64s(const struct bkey *k)
         |                                       ~~~~~~~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c: In function 'btree_gc_rewrite_node':
   drivers/md/bcache/btree.c:1553:32: error: passing argument 2 of 'bch_keylist_add' from incompatible pointer type [-Wincompatible-pointer-types]
    1553 |         bch_keylist_add(&keys, &n->key);
         |                                ^~~~~~~
         |                                |
         |                                struct bkey_fixed *
   drivers/md/bcache/bset.h:528:68: note: expected 'struct bkey *' but argument is of type 'struct bkey_fixed *'
     528 | static inline void bch_keylist_add(struct keylist *l, struct bkey *k)
         |                                                       ~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c: In function 'btree_gc_recurse':
   drivers/md/bcache/btree.c:1656:55: error: passing argument 2 of 'bkey_copy_key' from incompatible pointer type [-Wincompatible-pointer-types]
    1656 |                         bkey_copy_key(&b->c->gc_done, &last->b->key);
         |                                                       ^~~~~~~~~~~~~
         |                                                       |
         |                                                       struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:124:72: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     124 | static inline void bkey_copy_key(struct bkey *dest, const struct bkey *src)
         |                                                     ~~~~~~~~~~~~~~~~~~~^~~
   drivers/md/bcache/btree.c: In function 'bch_btree_gc_root':
>> drivers/md/bcache/btree.c:1718:50: error: passing argument 3 of '__bch_btree_mark_key' from incompatible pointer type [-Wincompatible-pointer-types]
    1718 |         __bch_btree_mark_key(b->c, b->level + 1, &b->key);
         |                                                  ^~~~~~~
         |                                                  |
         |                                                  struct bkey_fixed *
   drivers/md/bcache/btree.c:1227:50: note: expected 'struct bkey *' but argument is of type 'struct bkey_fixed *'
    1227 |                                     struct bkey *k)
         |                                     ~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c:1726:39: error: passing argument 2 of 'bkey_copy_key' from incompatible pointer type [-Wincompatible-pointer-types]
    1726 |         bkey_copy_key(&b->c->gc_done, &b->key);
         |                                       ^~~~~~~
         |                                       |
         |                                       struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:124:72: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     124 | static inline void bkey_copy_key(struct bkey *dest, const struct bkey *src)
         |                                                     ~~~~~~~~~~~~~~~~~~~^~~
   drivers/md/bcache/btree.c: In function 'bch_btree_gc_finish':
   drivers/md/bcache/btree.c:1771:34: error: passing argument 1 of 'KEY_PTRS' from incompatible pointer type [-Wincompatible-pointer-types]
    1771 |         for (i = 0; i < KEY_PTRS(&c->uuid_bucket); i++)
         |                                  ^~~~~~~~~~~~~~~
         |                                  |
         |                                  struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:57:1: note: in expansion of macro 'KEY_FIELD'
      57 | KEY_FIELD(KEY_PTRS,     high, 60, 3)
         | ^~~~~~~~~
   drivers/md/bcache/btree.c:1772:43: error: passing argument 2 of 'PTR_BUCKET' from incompatible pointer type [-Wincompatible-pointer-types]
    1772 |                 SET_GC_MARK(PTR_BUCKET(c, &c->uuid_bucket, i),
         |                                           ^~~~~~~~~~~~~~~
         |                                           |
         |                                           struct bkey_fixed *
   drivers/md/bcache/bcache.h:828:60: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     828 |                                         const struct bkey *k,
         |                                         ~~~~~~~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c:1789:50: error: passing argument 1 of 'KEY_PTRS' from incompatible pointer type [-Wincompatible-pointer-types]
    1789 |                         for (j = 0; j < KEY_PTRS(&w->key); j++)
         |                                                  ^~~~~~~
         |                                                  |
         |                                                  struct bkey_fixed *
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
      12 | static inline __u64 name(const type *k)                         \
         |                          ~~~~~~~~~~~~^
   drivers/md/bcache/bcache_ondisk.h:42:9: note: in expansion of macro 'BITMASK'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:57:1: note: in expansion of macro 'KEY_FIELD'
      57 | KEY_FIELD(KEY_PTRS,     high, 60, 3)
         | ^~~~~~~~~
   drivers/md/bcache/btree.c:1790:59: error: passing argument 2 of 'PTR_BUCKET' from incompatible pointer type [-Wincompatible-pointer-types]
    1790 |                                 SET_GC_MARK(PTR_BUCKET(c, &w->key, j),
         |                                                           ^~~~~~~
         |                                                           |
         |                                                           struct bkey_fixed *
   drivers/md/bcache/bcache.h:828:60: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     828 |                                         const struct bkey *k,
         |                                         ~~~~~~~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c: In function 'bch_btree_check_recurse':
   drivers/md/bcache/btree.c:1922:50: error: passing argument 3 of 'bch_initial_mark_key' from incompatible pointer type [-Wincompatible-pointer-types]
    1922 |         bch_initial_mark_key(b->c, b->level + 1, &b->key);
         |                                                  ^~~~~~~
         |                                                  |
         |                                                  struct bkey_fixed *
   drivers/md/bcache/btree.c:1280:72: note: expected 'struct bkey *' but argument is of type 'struct bkey_fixed *'
    1280 | void bch_initial_mark_key(struct cache_set *c, int level, struct bkey *k)
         |                                                           ~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c: In function 'bch_btree_check':
   drivers/md/bcache/btree.c:2064:53: error: passing argument 3 of 'bch_initial_mark_key' from incompatible pointer type [-Wincompatible-pointer-types]
    2064 |         bch_initial_mark_key(c, c->root->level + 1, &c->root->key);
         |                                                     ^~~~~~~~~~~~~
         |                                                     |
         |                                                     struct bkey_fixed *
   drivers/md/bcache/btree.c:1280:72: note: expected 'struct bkey *' but argument is of type 'struct bkey_fixed *'
    1280 | void bch_initial_mark_key(struct cache_set *c, int level, struct bkey *k)
         |                                                           ~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c: In function 'btree_insert_key':
   drivers/md/bcache/btree.c:2168:28: error: passing argument 2 of 'bkey_cmp' from incompatible pointer type [-Wincompatible-pointer-types]
    2168 |         BUG_ON(bkey_cmp(k, &b->key) > 0);
         |                            ^~~~~~~
         |                            |
         |                            struct bkey_fixed *
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/md/bcache/btree.c:2168:9: note: in expansion of macro 'BUG_ON'
    2168 |         BUG_ON(bkey_cmp(k, &b->key) > 0);
         |         ^~~~~~
   drivers/md/bcache/bset.h:426:60: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
     426 |                                         const struct bkey *r)
         |                                         ~~~~~~~~~~~~~~~~~~~^
   drivers/md/bcache/btree.c: In function 'bch_btree_insert_keys':
   drivers/md/bcache/btree.c:2208:33: error: passing argument 2 of 'bkey_cmp' from incompatible pointer type [-Wincompatible-pointer-types]
    2208 |                 if (bkey_cmp(k, &b->key) <= 0) {
         |                                 ^~~~~~~
         |                                 |
         |                                 struct bkey_fixed *
   drivers/md/bcache/bset.h:426:60: note: expected 'const struct bkey *' but argument is of type 'struct bkey_fixed *'
..


vim +/KEY_SIZE +770 drivers/md/bcache/bcache.h

cafe563591446cf Kent Overstreet 2013-03-23  767  
cafe563591446cf Kent Overstreet 2013-03-23  768  #define btree_bytes(c)		((c)->btree_pages * PAGE_SIZE)
cafe563591446cf Kent Overstreet 2013-03-23  769  #define btree_blocks(b)							\
6f10f7d1b02b1bb Coly Li         2018-08-11 @770  	((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
cafe563591446cf Kent Overstreet 2013-03-23  771  

:::::: The code at line 770 was first introduced by commit
:::::: 6f10f7d1b02b1bbc305f88d7696445dd38b13881 bcache: style fix to replace 'unsigned' by 'unsigned int'

:::::: TO: Coly Li <colyli@suse.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
