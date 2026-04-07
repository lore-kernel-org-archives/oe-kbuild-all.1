Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA653859CF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 06:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775542864; cv=none; b=Hnsh3vPPgBkahCGh2Vi5atGIWtD3aTdY8xsRvn8E3gFk8upy+uBQeCXeuYceAYuylVxQ/wfYDkLnDHn29xlAXe43qN5IfuK1VmFQ6RxemTeND2yg9mFNcGDjv9k+4AiSPZa+3XY0nVsXJeeUmAXF9wKGxULY7OE2w6GteYvfE+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775542864; c=relaxed/simple;
	bh=q/EypgtifU1N9HNMFvR69tHlb1raAuWPgQbHKu0s/FA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=glMRp7rrAcMSvjnSGq8RDYCnsqdj487ljoYwDQngSkd2ndttqS+lcqbK+f+FRUwfvA2vvUOBs5c8rnDI1CI8SY41KzJBBo2Dk5fRl8yMtfxbR1WHNxpjEWcC/1kOMA0+4xmlWnD+ELzFD8QjS74dFp2S3SqSEjNhmPH80pV8pN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPvBeuWJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPvBeuWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775542860; x=1807078860;
  h=date:from:to:cc:subject:message-id;
  bh=q/EypgtifU1N9HNMFvR69tHlb1raAuWPgQbHKu0s/FA=;
  b=PPvBeuWJbZbcv5Q2dT3Y5JhYBzTFr7F1fYKzK7QAevRLEfL61gkbyQzh
   MnKkhPzthcoCHHppZ0/Igyclybow7kxtjF7GC3Nby4W7MGkikvBaapDr1
   p4wl4iPtoRi+evaZ6MN/jTiaCyYGISJA8Wj6yWatk+jFkWMLFfPhynJsx
   reOGinUBtEXfjBaJqeH7jSgI7p9xZr6H+D5F3pJP8mdHVTY7llTqpeFsH
   EuqOHVdP/lkA1CUWSacqLC99WqHagFF24PWk2xWeE0SnjViSBV/bi+640
   /3sqw3wc3lTPd6ktpc4qtaywsdksfYgCkgR3vgfay1vQJ+w+8fp5i8LyQ
   Q==;
X-CSE-ConnectionGUID: cd0g8yI3SHqRpQGyrwdfQA==
X-CSE-MsgGUID: kZgF5X6XT8GHv3JwQTjsww==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76569967"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76569967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 23:20:54 -0700
X-CSE-ConnectionGUID: nVJf3yu7Q9qwfRM8pyNwVg==
X-CSE-MsgGUID: fFGz1se0Tg6kv0BKn1P8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227983837"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 23:20:53 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9znu-000000000Fz-0BZA;
	Tue, 07 Apr 2026 06:20:50 +0000
Date: Tue, 07 Apr 2026 14:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 41/51] fs/rpdfs/place.h:17:15:
 error: unknown type name 'u128'
Message-ID: <202604071404.cdhIo6eL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   9a0627207ad856d2a5eb09f3458afb1e34ac10a3
commit: 7db9f9d6d7cd9f1130ec06063f679a26a17d9fc0 [41/51] rpdfs: add place details metadata
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260407/202604071404.cdhIo6eL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071404.cdhIo6eL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071404.cdhIo6eL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/rpdfs/block.h:8,
                    from fs/rpdfs/txn.h:7,
                    from fs/rpdfs/balloc.h:10,
                    from fs/rpdfs/balloc.c:8:
>> fs/rpdfs/place.h:17:15: error: unknown type name 'u128'
      17 | static inline u128 rpdfs_place_full(u8 type, u64 ino, u8 depth, u64 off)
         |               ^~~~
   fs/rpdfs/place.h: In function 'rpdfs_place_full':
>> fs/rpdfs/place.h:19:18: error: 'u128' undeclared (first use in this function)
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                  ^~~~
   fs/rpdfs/place.h:19:18: note: each undeclared identifier is reported only once for each function it appears in
>> fs/rpdfs/place.h:19:23: error: expected ')' before 'rpdfs_place_hi'
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                ~      ^~~~~~~~~~~~~~
         |                       )
   fs/rpdfs/place.h: At top level:
   fs/rpdfs/place.h:32:65: error: unknown type name 'u128'
      32 | static inline void rpdfs_place_split_le(__le64 *lo, __le64 *hi, u128 full)
         |                                                                 ^~~~
   fs/rpdfs/place.h:38:15: error: unknown type name 'u128'
      38 | static inline u128 rpdfs_place_combine_le(__le64 lo, __le64 hi)
         |               ^~~~
   fs/rpdfs/place.h: In function 'rpdfs_place_combine_le':
   fs/rpdfs/place.h:40:18: error: 'u128' undeclared (first use in this function)
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                  ^~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:566,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from fs/rpdfs/balloc.c:3:
>> include/uapi/linux/swab.h:131:10: error: expected expression before '__u64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |          ^~~~~
   include/uapi/linux/byteorder/big_endian.h:33:26: note: in expansion of macro '__swab64'
      33 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/rpdfs/place.h:40:23: note: in expansion of macro 'le64_to_cpu'
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                       ^~~~~~~~~~~
   fs/rpdfs/block.h: At top level:
>> fs/rpdfs/block.h:79:9: error: unknown type name 'u128'
      79 |         u128 place;
         |         ^~~~
--
   In file included from fs/rpdfs/block.h:8,
                    from fs/rpdfs/txn.h:7,
                    from fs/rpdfs/balloc.h:10,
                    from fs/rpdfs/block.c:9:
>> fs/rpdfs/place.h:17:15: error: unknown type name 'u128'
      17 | static inline u128 rpdfs_place_full(u8 type, u64 ino, u8 depth, u64 off)
         |               ^~~~
   fs/rpdfs/place.h: In function 'rpdfs_place_full':
>> fs/rpdfs/place.h:19:18: error: 'u128' undeclared (first use in this function)
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                  ^~~~
   fs/rpdfs/place.h:19:18: note: each undeclared identifier is reported only once for each function it appears in
>> fs/rpdfs/place.h:19:23: error: expected ')' before 'rpdfs_place_hi'
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                ~      ^~~~~~~~~~~~~~
         |                       )
   fs/rpdfs/place.h: At top level:
   fs/rpdfs/place.h:32:65: error: unknown type name 'u128'
      32 | static inline void rpdfs_place_split_le(__le64 *lo, __le64 *hi, u128 full)
         |                                                                 ^~~~
   fs/rpdfs/place.h:38:15: error: unknown type name 'u128'
      38 | static inline u128 rpdfs_place_combine_le(__le64 lo, __le64 hi)
         |               ^~~~
   fs/rpdfs/place.h: In function 'rpdfs_place_combine_le':
   fs/rpdfs/place.h:40:18: error: 'u128' undeclared (first use in this function)
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                  ^~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:566,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from fs/rpdfs/block.c:3:
>> include/uapi/linux/swab.h:131:10: error: expected expression before '__u64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |          ^~~~~
   include/uapi/linux/byteorder/big_endian.h:33:26: note: in expansion of macro '__swab64'
      33 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/rpdfs/place.h:40:23: note: in expansion of macro 'le64_to_cpu'
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                       ^~~~~~~~~~~
   fs/rpdfs/block.h: At top level:
>> fs/rpdfs/block.h:79:9: error: unknown type name 'u128'
      79 |         u128 place;
         |         ^~~~
   fs/rpdfs/block.c: In function 'send_block_write':
>> fs/rpdfs/block.c:614:9: error: implicit declaration of function 'rpdfs_place_split_le'; did you mean 'rpdfs_place_combine_le'? [-Wimplicit-function-declaration]
     614 |         rpdfs_place_split_le(&wr.det.place_lo, &wr.det.place_hi, bk->hnd.place);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         rpdfs_place_combine_le
   fs/rpdfs/block.c: In function 'rpdfs_block_acquire':
>> fs/rpdfs/place.h:8:39: warning: right shift count >= width of type [-Wshift-count-overflow]
       8 | #define RPA(place)      (u64)((place) >> 64), (u64)(place)
         |                                       ^~
   fs/rpdfs/block.c:189:63: note: in expansion of macro 'RPA'
     189 |         (bk)->hnd.bnr, (bk)->hnd.alloc_ctr, (bk)->hnd.wcount, RPA((bk)->hnd.place), \
         |                                                               ^~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'RBA'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:631:9: note: in expansion of macro 'dynamic_pr_debug'
     631 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   fs/rpdfs/pr.h:19:9: note: in expansion of macro 'pr_debug'
      19 |         pr_debug("rpdfs: %s:%u: "fmt"\n", __func__, __LINE__, ##args); \
         |         ^~~~~~~~
   fs/rpdfs/pr.h:26:9: note: in expansion of macro '_rpdfs_pr_debug'
      26 |         _rpdfs_pr_debug(fmt, ##args)
         |         ^~~~~~~~~~~~~~~
   fs/rpdfs/block.c:1233:17: note: in expansion of macro 'rpdfs_prd_rfi'
    1233 |                 rpdfs_prd_rfi(rfi, "acquire mode %u rbaf %x wait "RBF,
         |                 ^~~~~~~~~~~~~
   fs/rpdfs/block.c: In function 'recv_block_grant_mode':
>> fs/rpdfs/place.h:8:39: warning: right shift count >= width of type [-Wshift-count-overflow]
       8 | #define RPA(place)      (u64)((place) >> 64), (u64)(place)
         |                                       ^~
   fs/rpdfs/block.c:189:63: note: in expansion of macro 'RPA'
     189 |         (bk)->hnd.bnr, (bk)->hnd.alloc_ctr, (bk)->hnd.wcount, RPA((bk)->hnd.place), \
         |                                                               ^~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'RBA'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:631:9: note: in expansion of macro 'dynamic_pr_debug'
     631 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   fs/rpdfs/pr.h:19:9: note: in expansion of macro 'pr_debug'
      19 |         pr_debug("rpdfs: %s:%u: "fmt"\n", __func__, __LINE__, ##args); \
         |         ^~~~~~~~
   fs/rpdfs/pr.h:22:9: note: in expansion of macro '_rpdfs_pr_debug'
      22 |         _rpdfs_pr_debug(fmt, ##args)
         |         ^~~~~~~~~~~~~~~
   fs/rpdfs/block.c:1610:9: note: in expansion of macro 'rpdfs_prd'
    1610 |         rpdfs_prd("mode %u "RBF, cm->mode, RBA(bk));
         |         ^~~~~~~~~
--
   In file included from fs/rpdfs/block.h:8,
                    from fs/rpdfs/txn.h:7,
                    from fs/rpdfs/balloc.h:10,
                    from fs/rpdfs/btree_txn.c:3:
>> fs/rpdfs/place.h:17:15: error: unknown type name 'u128'
      17 | static inline u128 rpdfs_place_full(u8 type, u64 ino, u8 depth, u64 off)
         |               ^~~~
   fs/rpdfs/place.h: In function 'rpdfs_place_full':
>> fs/rpdfs/place.h:19:18: error: 'u128' undeclared (first use in this function)
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                  ^~~~
   fs/rpdfs/place.h:19:18: note: each undeclared identifier is reported only once for each function it appears in
>> fs/rpdfs/place.h:19:23: error: expected ')' before 'rpdfs_place_hi'
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                ~      ^~~~~~~~~~~~~~
         |                       )
   fs/rpdfs/place.h: At top level:
   fs/rpdfs/place.h:32:65: error: unknown type name 'u128'
      32 | static inline void rpdfs_place_split_le(__le64 *lo, __le64 *hi, u128 full)
         |                                                                 ^~~~
   fs/rpdfs/place.h:38:15: error: unknown type name 'u128'
      38 | static inline u128 rpdfs_place_combine_le(__le64 lo, __le64 hi)
         |               ^~~~
   fs/rpdfs/place.h: In function 'rpdfs_place_combine_le':
   fs/rpdfs/place.h:40:18: error: 'u128' undeclared (first use in this function)
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                  ^~~~
>> fs/rpdfs/place.h:40:23: error: expected ')' before 'le64_to_cpu'
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                ~      ^~~~~~~~~~~
         |                       )
>> fs/rpdfs/place.h:40:48: error: implicit declaration of function 'le64_to_cpu' [-Wimplicit-function-declaration]
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                                                ^~~~~~~~~~~
   fs/rpdfs/block.h: At top level:
>> fs/rpdfs/block.h:79:9: error: unknown type name 'u128'
      79 |         u128 place;
         |         ^~~~
--
   In file included from rpdfs/block.h:8,
                    from rpdfs/txn.h:7,
                    from rpdfs/balloc.h:10,
                    from rpdfs/balloc.c:8:
   rpdfs/place.h:17:15: error: unknown type name 'u128'
      17 | static inline u128 rpdfs_place_full(u8 type, u64 ino, u8 depth, u64 off)
         |               ^~~~
   rpdfs/place.h: In function 'rpdfs_place_full':
   rpdfs/place.h:19:18: error: 'u128' undeclared (first use in this function)
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                  ^~~~
   rpdfs/place.h:19:18: note: each undeclared identifier is reported only once for each function it appears in
   rpdfs/place.h:19:23: error: expected ')' before 'rpdfs_place_hi'
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                ~      ^~~~~~~~~~~~~~
         |                       )
   rpdfs/place.h: At top level:
   rpdfs/place.h:32:65: error: unknown type name 'u128'
      32 | static inline void rpdfs_place_split_le(__le64 *lo, __le64 *hi, u128 full)
         |                                                                 ^~~~
   rpdfs/place.h:38:15: error: unknown type name 'u128'
      38 | static inline u128 rpdfs_place_combine_le(__le64 lo, __le64 hi)
         |               ^~~~
   rpdfs/place.h: In function 'rpdfs_place_combine_le':
   rpdfs/place.h:40:18: error: 'u128' undeclared (first use in this function)
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                  ^~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:566,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from rpdfs/balloc.c:3:
>> include/uapi/linux/swab.h:131:10: error: expected expression before '__u64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |          ^~~~~
   include/uapi/linux/byteorder/big_endian.h:33:26: note: in expansion of macro '__swab64'
      33 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   rpdfs/place.h:40:23: note: in expansion of macro 'le64_to_cpu'
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                       ^~~~~~~~~~~
   rpdfs/block.h: At top level:
   rpdfs/block.h:79:9: error: unknown type name 'u128'
      79 |         u128 place;
         |         ^~~~
--
   In file included from rpdfs/block.h:8,
                    from rpdfs/txn.h:7,
                    from rpdfs/balloc.h:10,
                    from rpdfs/block.c:9:
   rpdfs/place.h:17:15: error: unknown type name 'u128'
      17 | static inline u128 rpdfs_place_full(u8 type, u64 ino, u8 depth, u64 off)
         |               ^~~~
   rpdfs/place.h: In function 'rpdfs_place_full':
   rpdfs/place.h:19:18: error: 'u128' undeclared (first use in this function)
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                  ^~~~
   rpdfs/place.h:19:18: note: each undeclared identifier is reported only once for each function it appears in
   rpdfs/place.h:19:23: error: expected ')' before 'rpdfs_place_hi'
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                ~      ^~~~~~~~~~~~~~
         |                       )
   rpdfs/place.h: At top level:
   rpdfs/place.h:32:65: error: unknown type name 'u128'
      32 | static inline void rpdfs_place_split_le(__le64 *lo, __le64 *hi, u128 full)
         |                                                                 ^~~~
   rpdfs/place.h:38:15: error: unknown type name 'u128'
      38 | static inline u128 rpdfs_place_combine_le(__le64 lo, __le64 hi)
         |               ^~~~
   rpdfs/place.h: In function 'rpdfs_place_combine_le':
   rpdfs/place.h:40:18: error: 'u128' undeclared (first use in this function)
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                  ^~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:566,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from rpdfs/block.c:3:
>> include/uapi/linux/swab.h:131:10: error: expected expression before '__u64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |          ^~~~~
   include/uapi/linux/byteorder/big_endian.h:33:26: note: in expansion of macro '__swab64'
      33 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   rpdfs/place.h:40:23: note: in expansion of macro 'le64_to_cpu'
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                       ^~~~~~~~~~~
   rpdfs/block.h: At top level:
   rpdfs/block.h:79:9: error: unknown type name 'u128'
      79 |         u128 place;
         |         ^~~~
   rpdfs/block.c: In function 'send_block_write':
   rpdfs/block.c:614:9: error: implicit declaration of function 'rpdfs_place_split_le'; did you mean 'rpdfs_place_combine_le'? [-Wimplicit-function-declaration]
     614 |         rpdfs_place_split_le(&wr.det.place_lo, &wr.det.place_hi, bk->hnd.place);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         rpdfs_place_combine_le
   rpdfs/block.c: In function 'rpdfs_block_acquire':
   rpdfs/place.h:8:39: warning: right shift count >= width of type [-Wshift-count-overflow]
       8 | #define RPA(place)      (u64)((place) >> 64), (u64)(place)
         |                                       ^~
   rpdfs/block.c:189:63: note: in expansion of macro 'RPA'
     189 |         (bk)->hnd.bnr, (bk)->hnd.alloc_ctr, (bk)->hnd.wcount, RPA((bk)->hnd.place), \
         |                                                               ^~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'RBA'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:631:9: note: in expansion of macro 'dynamic_pr_debug'
     631 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   rpdfs/pr.h:19:9: note: in expansion of macro 'pr_debug'
      19 |         pr_debug("rpdfs: %s:%u: "fmt"\n", __func__, __LINE__, ##args); \
         |         ^~~~~~~~
   rpdfs/pr.h:26:9: note: in expansion of macro '_rpdfs_pr_debug'
      26 |         _rpdfs_pr_debug(fmt, ##args)
         |         ^~~~~~~~~~~~~~~
   rpdfs/block.c:1233:17: note: in expansion of macro 'rpdfs_prd_rfi'
    1233 |                 rpdfs_prd_rfi(rfi, "acquire mode %u rbaf %x wait "RBF,
         |                 ^~~~~~~~~~~~~
   rpdfs/block.c: In function 'recv_block_grant_mode':
   rpdfs/place.h:8:39: warning: right shift count >= width of type [-Wshift-count-overflow]
       8 | #define RPA(place)      (u64)((place) >> 64), (u64)(place)
         |                                       ^~
   rpdfs/block.c:189:63: note: in expansion of macro 'RPA'
     189 |         (bk)->hnd.bnr, (bk)->hnd.alloc_ctr, (bk)->hnd.wcount, RPA((bk)->hnd.place), \
         |                                                               ^~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'RBA'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:631:9: note: in expansion of macro 'dynamic_pr_debug'
     631 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   rpdfs/pr.h:19:9: note: in expansion of macro 'pr_debug'
      19 |         pr_debug("rpdfs: %s:%u: "fmt"\n", __func__, __LINE__, ##args); \
         |         ^~~~~~~~
   rpdfs/pr.h:22:9: note: in expansion of macro '_rpdfs_pr_debug'
      22 |         _rpdfs_pr_debug(fmt, ##args)
         |         ^~~~~~~~~~~~~~~
   rpdfs/block.c:1610:9: note: in expansion of macro 'rpdfs_prd'
    1610 |         rpdfs_prd("mode %u "RBF, cm->mode, RBA(bk));
         |         ^~~~~~~~~


vim +/u128 +17 fs/rpdfs/place.h

     6	
     7	#define RPF		"%llx%016llx"
   > 8	#define RPA(place)	(u64)((place) >> 64), (u64)(place)
     9	
    10	static inline u64 rpdfs_place_hi(u8 type, u64 ino, u8 depth)
    11	{
    12		return ((type & RPDFS_PLACE_TYPE_MASK) << RPDFS_PLACE_TYPE_SHIFT) |
    13		       ((ino & RPDFS_PLACE_INO_MASK) << RPDFS_PLACE_INO_SHIFT) |
    14		       (depth & RPDFS_PLACE_DEPTH_MASK);
    15	}
    16	
  > 17	static inline u128 rpdfs_place_full(u8 type, u64 ino, u8 depth, u64 off)
    18	{
  > 19		return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
    20	}
    21	
    22	static inline u64 rpdfs_place_hi_type(u64 place_hi)
    23	{
    24		return (place_hi >> RPDFS_PLACE_TYPE_SHIFT) & RPDFS_PLACE_TYPE_MASK;
    25	}
    26	
    27	static inline u64 rpdfs_place_hi_ino(u64 place_hi)
    28	{
    29		return (place_hi >> RPDFS_PLACE_INO_SHIFT) & RPDFS_PLACE_INO_MASK;
    30	}
    31	
    32	static inline void rpdfs_place_split_le(__le64 *lo, __le64 *hi, u128 full)
    33	{
    34		*lo = cpu_to_le64((u64)full);
    35		*hi = cpu_to_le64(full >> 64);
    36	}
    37	
    38	static inline u128 rpdfs_place_combine_le(__le64 lo, __le64 hi)
    39	{
  > 40		return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
