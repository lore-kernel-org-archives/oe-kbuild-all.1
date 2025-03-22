Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13912142659
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 06:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742623781; cv=none; b=N214hUCU21bKMIHt1wYBNNvNmVJKJWRaYVo5oeGDQHkPZh8Grmfmqdy27T9stqi7RQUNC+dMG7o+Jpl3fM0SybohjuaX0RYS4BEH8YME/tlZyu8ZOWH/AepzkvMCgReiyGNai7tdcwwjA73uBZYsjVGJf8E3ybHGmhzSwsBRqK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742623781; c=relaxed/simple;
	bh=zTzhoZtYvfrmkIk7IkH8cOWSUkHxJ+8nFlSd9TYQGKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIzQcOImXrQLWzoWlE8aEKBHAeC4FsxsnBfnhYnQpx+HiY0c2JQSxJSM4vyfaC0PpjxBDZ3KoEUem3Fydy43rGZYMCyzsQ1X8nPWzqAX8L+aeRcUIwhtNYAk7fHX9OVwy1aCUNCrrmVylDjtqxl1dwXDmJCI0zdWHTVbQ687vFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCTFstRB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCTFstRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742623779; x=1774159779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zTzhoZtYvfrmkIk7IkH8cOWSUkHxJ+8nFlSd9TYQGKU=;
  b=BCTFstRBYg4cZU9FPFx6p8yxHIsc1Gggn2I8vmAAWa6QlhKfMym+HWNj
   Fl8Xm5Cq4KfGL2Y4x/swvdZcX34qrioqaOlmXv82HSPnuR1TD1geuJ9hZ
   8gTe/ir4wGKqmCH2N04WERGyrvSvdUV4pgfKOmE1h3OzXlXn86XED0cyj
   L12hQKn9rOY689xKtcQ4w6nhTTSh9CJHhg0d/slvWfAUDKxER/hfHI8fG
   tWkfpWIBa6jaSugacooLV2PNBwsVLe8ArcWKBUh8/aM0ybBz00mN4rl5J
   HCtEVXAxgMuMiFnuqdiHwffAk4ckRNpcuAHrPOB/vEmF/hk5Z7VKTEnX0
   Q==;
X-CSE-ConnectionGUID: gjFZwWGBQfOsT9RNQFkX+A==
X-CSE-MsgGUID: OjE6rOByRH2HdvLAHNWOrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43130051"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="43130051"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 23:09:34 -0700
X-CSE-ConnectionGUID: sG1VrRXkRV2iDh0pJ975qA==
X-CSE-MsgGUID: gifISo6JRQWcZqo/lfyFcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="123749586"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Mar 2025 23:09:33 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvs31-0001yP-0V;
	Sat, 22 Mar 2025 06:09:31 +0000
Date: Sat, 22 Mar 2025 14:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 67/69] lib/test_bitmap.c:1338:34: warning: implicit
 conversion from 'unsigned long long' to 'unsigned long' changes value from
 16045690984833335023 to 3735928559
Message-ID: <202503221442.vLSwdIEu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   8cd9e8322a409930af5fd18e7a92094265a8bf67
commit: eca29da9bb4ccd69662c988ca00bd68f78bec28b [67/69] dyndbg: add,use _ddebug_descriptors_vector
config: hexagon-randconfig-002-20250322 (https://download.01.org/0day-ci/archive/20250322/202503221442.vLSwdIEu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221442.vLSwdIEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221442.vLSwdIEu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/test_bitmap.c:11:
   In file included from include/linux/module.h:30:
   include/linux/dynamic_debug.h:558:51: error: 'counted_by' argument must be a simple declaration reference
     558 |         struct _ddebug descriptors[] __counted_by(header.num_descs);
         |                                                   ^~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:62: note: expanded from macro '__counted_by'
     346 | # define __counted_by(member)           __attribute__((__counted_by__(member)))
         |                                                                       ^~~~~~
>> lib/test_bitmap.c:1338:34: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 16045690984833335023 to 3735928559 [-Wconstant-conversion]
    1338 |                 w = IS_ENABLED(CONFIG_64BIT) ? 0xdeadbeefdeadbeefUL
         |                   ~                            ^~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from lib/bitfield_kunit.c:8:
   In file included from include/kunit/test.h:24:
   In file included from include/linux/module.h:30:
   include/linux/dynamic_debug.h:558:51: error: 'counted_by' argument must be a simple declaration reference
     558 |         struct _ddebug descriptors[] __counted_by(header.num_descs);
         |                                                   ^~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:62: note: expanded from macro '__counted_by'
     346 | # define __counted_by(member)           __attribute__((__counted_by__(member)))
         |                                                                       ^~~~~~
>> lib/bitfield_kunit.c:119:13: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 9223372036854775808 to 0 [-Wconstant-conversion]
     119 |         CHECK(u64, 0x8000000000000000ull);
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   lib/bitfield_kunit.c:98:34: note: expanded from macro 'CHECK'
      98 |                 for (v = 0; v < 1 << hweight32(mask); v++)              \
         |                                      ~~~~~~~~~~^~~~~
   include/asm-generic/bitops/const_hweight.h:28:89: note: expanded from macro 'hweight32'
      28 | #define hweight32(w) (__builtin_constant_p(w) ? __const_hweight32(w) : __arch_hweight32(w))
         |                                                                        ~~~~~~~~~~~~~~~~ ^
   lib/bitfield_kunit.c:120:13: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 9151314442816847872 to 0 [-Wconstant-conversion]
     120 |         CHECK(u64, 0x7f00000000000000ull);
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   lib/bitfield_kunit.c:98:34: note: expanded from macro 'CHECK'
      98 |                 for (v = 0; v < 1 << hweight32(mask); v++)              \
         |                                      ~~~~~~~~~~^~~~~
   include/asm-generic/bitops/const_hweight.h:28:89: note: expanded from macro 'hweight32'
      28 | #define hweight32(w) (__builtin_constant_p(w) ? __const_hweight32(w) : __arch_hweight32(w))
         |                                                                        ~~~~~~~~~~~~~~~~ ^
   lib/bitfield_kunit.c:121:13: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 422212465065984 to 0 [-Wconstant-conversion]
     121 |         CHECK(u64, 0x0001800000000000ull);
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   lib/bitfield_kunit.c:98:34: note: expanded from macro 'CHECK'
      98 |                 for (v = 0; v < 1 << hweight32(mask); v++)              \
         |                                      ~~~~~~~~~~^~~~~
   include/asm-generic/bitops/const_hweight.h:28:89: note: expanded from macro 'hweight32'
      28 | #define hweight32(w) (__builtin_constant_p(w) ? __const_hweight32(w) : __arch_hweight32(w))
         |                                                                        ~~~~~~~~~~~~~~~~ ^
   lib/bitfield_kunit.c:125:13: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 8455716864 to 4160749568 [-Wconstant-conversion]
     125 |         CHECK(u64, 0x0000001f8000000ull);
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   lib/bitfield_kunit.c:98:34: note: expanded from macro 'CHECK'
      98 |                 for (v = 0; v < 1 << hweight32(mask); v++)              \
         |                                      ~~~~~~~~~~^~~~~
   include/asm-generic/bitops/const_hweight.h:28:89: note: expanded from macro 'hweight32'
      28 | #define hweight32(w) (__builtin_constant_p(w) ? __const_hweight32(w) : __arch_hweight32(w))
         |                                                                        ~~~~~~~~~~~~~~~~ ^
   4 warnings and 1 error generated.


vim +1338 lib/test_bitmap.c

991e5583647d33 Alexander Potapenko 2024-03-27  1296  
991e5583647d33 Alexander Potapenko 2024-03-27  1297  /*
991e5583647d33 Alexander Potapenko 2024-03-27  1298   * Helper function to test bitmap_write() overwriting the chosen byte pattern.
991e5583647d33 Alexander Potapenko 2024-03-27  1299   */
991e5583647d33 Alexander Potapenko 2024-03-27  1300  static void __init test_bitmap_write_helper(const char *pattern)
991e5583647d33 Alexander Potapenko 2024-03-27  1301  {
991e5583647d33 Alexander Potapenko 2024-03-27  1302  	DECLARE_BITMAP(bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1303  	DECLARE_BITMAP(exp_bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1304  	DECLARE_BITMAP(pat_bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1305  	unsigned long w, r, bit;
991e5583647d33 Alexander Potapenko 2024-03-27  1306  	int i, n, nbits;
991e5583647d33 Alexander Potapenko 2024-03-27  1307  
991e5583647d33 Alexander Potapenko 2024-03-27  1308  	/*
991e5583647d33 Alexander Potapenko 2024-03-27  1309  	 * Only parse the pattern once and store the result in the intermediate
991e5583647d33 Alexander Potapenko 2024-03-27  1310  	 * bitmap.
991e5583647d33 Alexander Potapenko 2024-03-27  1311  	 */
991e5583647d33 Alexander Potapenko 2024-03-27  1312  	bitmap_parselist(pattern, pat_bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1313  
991e5583647d33 Alexander Potapenko 2024-03-27  1314  	/*
991e5583647d33 Alexander Potapenko 2024-03-27  1315  	 * Check that writing a single bit does not accidentally touch the
991e5583647d33 Alexander Potapenko 2024-03-27  1316  	 * adjacent bits.
991e5583647d33 Alexander Potapenko 2024-03-27  1317  	 */
991e5583647d33 Alexander Potapenko 2024-03-27  1318  	for (i = 0; i < TEST_BIT_LEN; i++) {
991e5583647d33 Alexander Potapenko 2024-03-27  1319  		bitmap_copy(bitmap, pat_bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1320  		bitmap_copy(exp_bitmap, pat_bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1321  		for (bit = 0; bit <= 1; bit++) {
991e5583647d33 Alexander Potapenko 2024-03-27  1322  			bitmap_write(bitmap, bit, i, 1);
991e5583647d33 Alexander Potapenko 2024-03-27  1323  			__assign_bit(i, exp_bitmap, bit);
991e5583647d33 Alexander Potapenko 2024-03-27  1324  			expect_eq_bitmap(exp_bitmap, bitmap,
991e5583647d33 Alexander Potapenko 2024-03-27  1325  					 TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1326  		}
991e5583647d33 Alexander Potapenko 2024-03-27  1327  	}
991e5583647d33 Alexander Potapenko 2024-03-27  1328  
991e5583647d33 Alexander Potapenko 2024-03-27  1329  	/* Ensure writing 0 bits does not change anything. */
991e5583647d33 Alexander Potapenko 2024-03-27  1330  	bitmap_copy(bitmap, pat_bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1331  	bitmap_copy(exp_bitmap, pat_bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1332  	for (i = 0; i < TEST_BIT_LEN; i++) {
991e5583647d33 Alexander Potapenko 2024-03-27  1333  		bitmap_write(bitmap, ~0UL, i, 0);
991e5583647d33 Alexander Potapenko 2024-03-27  1334  		expect_eq_bitmap(exp_bitmap, bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1335  	}
991e5583647d33 Alexander Potapenko 2024-03-27  1336  
991e5583647d33 Alexander Potapenko 2024-03-27  1337  	for (nbits = BITS_PER_LONG; nbits >= 1; nbits--) {
991e5583647d33 Alexander Potapenko 2024-03-27 @1338  		w = IS_ENABLED(CONFIG_64BIT) ? 0xdeadbeefdeadbeefUL
991e5583647d33 Alexander Potapenko 2024-03-27  1339  					     : 0xdeadbeefUL;
991e5583647d33 Alexander Potapenko 2024-03-27  1340  		w >>= (BITS_PER_LONG - nbits);
991e5583647d33 Alexander Potapenko 2024-03-27  1341  		for (i = 0; i <= TEST_BIT_LEN - nbits; i++) {
991e5583647d33 Alexander Potapenko 2024-03-27  1342  			bitmap_copy(bitmap, pat_bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1343  			bitmap_copy(exp_bitmap, pat_bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1344  			for (n = 0; n < nbits; n++)
991e5583647d33 Alexander Potapenko 2024-03-27  1345  				__assign_bit(i + n, exp_bitmap, w & BIT(n));
991e5583647d33 Alexander Potapenko 2024-03-27  1346  			bitmap_write(bitmap, w, i, nbits);
991e5583647d33 Alexander Potapenko 2024-03-27  1347  			expect_eq_bitmap(exp_bitmap, bitmap, TEST_BIT_LEN);
991e5583647d33 Alexander Potapenko 2024-03-27  1348  			r = bitmap_read(bitmap, i, nbits);
991e5583647d33 Alexander Potapenko 2024-03-27  1349  			expect_eq_ulong(r, w);
991e5583647d33 Alexander Potapenko 2024-03-27  1350  		}
991e5583647d33 Alexander Potapenko 2024-03-27  1351  	}
991e5583647d33 Alexander Potapenko 2024-03-27  1352  }
991e5583647d33 Alexander Potapenko 2024-03-27  1353  

:::::: The code at line 1338 was first introduced by commit
:::::: 991e5583647d33ee3a9c89248974ef98b9f539a8 lib/test_bitmap: add tests for bitmap_{read,write}()

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
