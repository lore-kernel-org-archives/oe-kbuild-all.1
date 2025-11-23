Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CCF2C1586
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763906817; cv=none; b=kGbN2ITbziw9mVyRDsiaWLfuLL0AU/kwLrbesALzndmBGIISZ/ChypKe5HE/wGnF05k+JXbLzjMnoBVbN9a0XCoGPsBE21+5Y+S6ZvsKszE6KRLF/JhwP5/T0c+v299Qy0Su1fgPOepCt/v0jcDEc3ci3T4dd/ZvANVWzQtxSrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763906817; c=relaxed/simple;
	bh=Uu9qPNlZeqFE8Ew9KFMBRTK+97W93I2gSLE5bfQBX1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6OZLAA1zcUbWoJfVNegTtBupyt2PN7lrpC7W5YW9CoRPQk21uWJEhn4bhvx2vElPTZXhUSLy4ooMvaJQad4orK0dcRMyeNo8kvw9H8qCW9ZMsMbrLzV4XqE1lV9+G89HzOOX1Q9RDwYwzFZnMcjKuNcnOL5DedFMiYNwu+iwNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhkmP99c; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhkmP99c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763906816; x=1795442816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uu9qPNlZeqFE8Ew9KFMBRTK+97W93I2gSLE5bfQBX1o=;
  b=KhkmP99cXCBv+CIGCXzdwLgon+UZNxi4WLyAeGhNaPsbV/kdluQQgRdI
   Mip/loLI9LFkXGLVUAblqvp1LoG2ZOaMeQIQjnZMCIv5RCBDdgvR4JcPl
   IKBkdiLtVEtYReciOTuS/ESLNzDlU4IgVyc/waf3Ij5vJbVSGjv7PfOol
   5H1I3wAYzJ/tTBd8SBZwoKREnJzLIZZ6r2eqhrbXjJm+a5crRaVHAYS3T
   94X1KHf/LpomE92ss5rg6f5ciytAqzDjywKKaTDhsUlbIAb0e8GK1q51D
   NODtKZVl7If5yGtHeFimw4pBTM4Mxl+msTtwhJFFauXa9HUeXl4UR9LaB
   Q==;
X-CSE-ConnectionGUID: jiX2RsQMRVmheXnav9pmag==
X-CSE-MsgGUID: fvPDRSE0RiWvvkSrfdWv8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="68521398"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="68521398"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 06:06:55 -0800
X-CSE-ConnectionGUID: 7qIlZmg2TOOQWwT8q+l6Zg==
X-CSE-MsgGUID: l5Il9JIXTseOlKfSHDXN7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="197228601"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 23 Nov 2025 06:06:54 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNAjr-000000002QZ-1IyE;
	Sun, 23 Nov 2025 14:06:51 +0000
Date: Sun, 23 Nov 2025 15:06:48 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 8/9]
 lib/crypto/tests/sha1_kunit.c:13:20: error: implicit declaration of function
 'sha1_final'; did you mean 'sha1_init'?
Message-ID: <202511231537.t9PZnLd0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git more-at-least-decorations-v1
head:   da707520ed1dbaed0ef9666f7adfac8910423a1f
commit: 9d0bb6f6867eb6f640c52bfaa09a8de6a181c921 [8/9] lib/crypto: sha1: Add at_least decoration to fixed-size array params
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20251123/202511231537.t9PZnLd0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231537.t9PZnLd0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231537.t9PZnLd0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/crypto/tests/sha1_kunit.c:5:
   include/crypto/sha1.h:87:46: error: 'at_least' undeclared here (not in a function)
      87 | void sha1_final(struct sha1_ctx *ctx, u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                              ^~~~~~~~
   include/crypto/sha1.h:87:54: error: expected ']' before numeric constant
      87 | void sha1_final(struct sha1_ctx *ctx, u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                                      ^
         |                                                      ]
   include/crypto/sha1.h:97:46: error: 'at_least' undeclared here (not in a function)
      97 | void sha1(const u8 *data, size_t len, u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                              ^~~~~~~~
   include/crypto/sha1.h:97:54: error: expected ']' before numeric constant
      97 | void sha1(const u8 *data, size_t len, u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                                      ^
         |                                                      ]
   include/crypto/sha1.h:185:29: error: 'at_least' undeclared here (not in a function)
     185 |                      u8 out[at_least SHA1_DIGEST_SIZE]);
         |                             ^~~~~~~~
   include/crypto/sha1.h:185:37: error: expected ']' before numeric constant
     185 |                      u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                     ^
         |                                     ]
   include/crypto/sha1.h:200:23: error: 'at_least' undeclared here (not in a function)
     200 |                u8 out[at_least SHA1_DIGEST_SIZE]);
         |                       ^~~~~~~~
   include/crypto/sha1.h:200:31: error: expected ']' before numeric constant
     200 |                u8 out[at_least SHA1_DIGEST_SIZE]);
         |                               ^
         |                               ]
   include/crypto/sha1.h:217:35: error: 'at_least' undeclared here (not in a function)
     217 |                            u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                   ^~~~~~~~
   include/crypto/sha1.h:217:43: error: expected ']' before numeric constant
     217 |                            u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                           ^
         |                                           ]
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_test_vectors':
>> lib/crypto/tests/sha1_kunit.c:8:14: error: implicit declaration of function 'sha1' [-Wimplicit-function-declaration]
       8 | #define HASH sha1
         |              ^~~~
   lib/crypto/tests/hash-test-template.h:114:17: note: in expansion of macro 'HASH'
     114 |                 HASH(test_buf, data_len, actual_hash);
         |                 ^~~~
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_all_lens_up_to_4096':
>> lib/crypto/tests/sha1_kunit.c:13:20: error: implicit declaration of function 'sha1_final'; did you mean 'sha1_init'? [-Wimplicit-function-declaration]
      13 | #define HASH_FINAL sha1_final
         |                    ^~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:140:9: note: in expansion of macro 'HASH_FINAL'
     140 |         HASH_FINAL(&ctx, hash);
         |         ^~~~~~~~~~
   lib/crypto/tests/hash-test-template.h: In function 'test_hmac':
>> lib/crypto/tests/sha1_kunit.c:21:26: error: implicit declaration of function 'hmac_sha1_usingrawkey'; did you mean 'hmac_sha1_init_usingrawkey'? [-Wimplicit-function-declaration]
      21 | #define HMAC_USINGRAWKEY hmac_sha1_usingrawkey
         |                          ^~~~~~~~~~~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:515:17: note: in expansion of macro 'HMAC_USINGRAWKEY'
     515 |                 HMAC_USINGRAWKEY(raw_key, key_len, test_buf, data_len, mac);
         |                 ^~~~~~~~~~~~~~~~
>> lib/crypto/tests/sha1_kunit.c:20:14: error: implicit declaration of function 'hmac_sha1' [-Wimplicit-function-declaration]
      20 | #define HMAC hmac_sha1
         |              ^~~~~~~~~
   lib/crypto/tests/hash-test-template.h:520:17: note: in expansion of macro 'HMAC'
     520 |                 HMAC(&key, test_buf, data_len, mac2);
         |                 ^~~~
>> lib/crypto/tests/sha1_kunit.c:19:20: error: implicit declaration of function 'hmac_sha1_final'; did you mean 'hmac_sha1_init'? [-Wimplicit-function-declaration]
      19 | #define HMAC_FINAL hmac_sha1_final
         |                    ^~~~~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:525:9: note: in expansion of macro 'HMAC_FINAL'
     525 |         HMAC_FINAL(&ctx, mac);
         |         ^~~~~~~~~~


vim +13 lib/crypto/tests/sha1_kunit.c

66b13060790841 Eric Biggers 2025-07-12   7  
66b13060790841 Eric Biggers 2025-07-12  @8  #define HASH sha1
66b13060790841 Eric Biggers 2025-07-12   9  #define HASH_CTX sha1_ctx
66b13060790841 Eric Biggers 2025-07-12  10  #define HASH_SIZE SHA1_DIGEST_SIZE
66b13060790841 Eric Biggers 2025-07-12  11  #define HASH_INIT sha1_init
66b13060790841 Eric Biggers 2025-07-12  12  #define HASH_UPDATE sha1_update
66b13060790841 Eric Biggers 2025-07-12 @13  #define HASH_FINAL sha1_final
66b13060790841 Eric Biggers 2025-07-12  14  #define HMAC_KEY hmac_sha1_key
66b13060790841 Eric Biggers 2025-07-12  15  #define HMAC_CTX hmac_sha1_ctx
66b13060790841 Eric Biggers 2025-07-12  16  #define HMAC_PREPAREKEY hmac_sha1_preparekey
66b13060790841 Eric Biggers 2025-07-12  17  #define HMAC_INIT hmac_sha1_init
66b13060790841 Eric Biggers 2025-07-12  18  #define HMAC_UPDATE hmac_sha1_update
66b13060790841 Eric Biggers 2025-07-12 @19  #define HMAC_FINAL hmac_sha1_final
66b13060790841 Eric Biggers 2025-07-12 @20  #define HMAC hmac_sha1
66b13060790841 Eric Biggers 2025-07-12 @21  #define HMAC_USINGRAWKEY hmac_sha1_usingrawkey
66b13060790841 Eric Biggers 2025-07-12  22  #include "hash-test-template.h"
66b13060790841 Eric Biggers 2025-07-12  23  

:::::: The code at line 13 was first introduced by commit
:::::: 66b130607908417a126de7fdc55f0c671ac365e6 lib/crypto: tests: Add KUnit tests for SHA-1 and HMAC-SHA1

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
