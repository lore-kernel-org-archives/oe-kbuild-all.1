Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B014A35
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 16:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763916203; cv=none; b=JFdZkZ05CVuYMsYj4zbpW7jKTg/hXEFfpDnD6JMkiWBRTAqGkFNsGmo9HkqTY60v5ldSTj8+5qJnGPPQ1PNKdgwxUdVivDpeqscZSiRP2fwRjblLlFh3zJ/d8BKLN6jjaTBqWupgQe18Rd+B2JXcCgQGpozHejuA41VxAJ+B5Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763916203; c=relaxed/simple;
	bh=qnU5nBAJiN2XdU83YQC9clzqOLFuZc/b0LVJ5uccre8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ERx+T2yQIs5dfJ2LO0uD8+RxJGiHBaOtk2IINJMVNre0LoQdQGM5yk1Ejl/FtYPIeP9x2jksZqgQJ0NloNTEWYCp6rSrTHaxq+NRKxuFI/veCPXJWmH53hO0ygwSXtf5xKz7JHqjniRkt+w3Zd//VbSXOvQRaxTyuyKbEWO8wps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqN6dSxv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqN6dSxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763916200; x=1795452200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qnU5nBAJiN2XdU83YQC9clzqOLFuZc/b0LVJ5uccre8=;
  b=PqN6dSxvWnJ/aUxvV96z8KhdmF5qEE+f16c4uLgV4wkFQ0pv/YwQoAuK
   dTTXyeTwM2oEGGiqrzM4O7X5EsXk4E5rZJiCFVOQGiuFa6oAG20aw0RWo
   zKQawmNivPcgtmceAP0yF8Q5nbqAQKqj6mrybaQiKXvOrw25dNB2Bxxdo
   guL7Dh8hC9tIkxo0NBs/J+22xLqEAoqhx/sUBN63tBltuwhZ5zYGzHHkg
   FGx8FSeUSVcgn4cbv0OW/nZu9EIs58nxjwuEaggnk9DW92suwt0FnToAE
   P/NJjoBMRldUWFD24qd0Lra/HtKGMaYTRBNurHVCQF1bfXqTk0BuL48iK
   Q==;
X-CSE-ConnectionGUID: bHGsUA9RRlGrFYiqb8BMGQ==
X-CSE-MsgGUID: z46HFadcTm+PtYHqC81c8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="53500778"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="53500778"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 08:43:20 -0800
X-CSE-ConnectionGUID: wDgpEbspRyKgJLsDkiIwkA==
X-CSE-MsgGUID: Ad6BhCc6RkGYvdtXC6U08w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="191917130"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Nov 2025 08:43:19 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNDBE-0000000005Z-3ILg;
	Sun, 23 Nov 2025 16:43:16 +0000
Date: Mon, 24 Nov 2025 00:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 8/9]
 lib/crypto/tests/sha1_kunit.c:13:20: error: implicit declaration of function
 'sha1_final'; did you mean 'sha1_init'?
Message-ID: <202511240013.LsRURJNm-lkp@intel.com>
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
config: nios2-randconfig-001-20251123 (https://download.01.org/0day-ci/archive/20251124/202511240013.LsRURJNm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511240013.LsRURJNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511240013.LsRURJNm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/crypto/tests/sha1_kunit.c:5:
   include/crypto/sha1.h:87:46: error: 'at_least' undeclared here (not in a function)
    void sha1_final(struct sha1_ctx *ctx, u8 out[at_least SHA1_DIGEST_SIZE]);
                                                 ^~~~~~~~
   include/crypto/sha1.h:87:54: error: expected ']' before numeric constant
    void sha1_final(struct sha1_ctx *ctx, u8 out[at_least SHA1_DIGEST_SIZE]);
                                                         ^
                                                         ]
   include/crypto/sha1.h:97:46: error: 'at_least' undeclared here (not in a function)
    void sha1(const u8 *data, size_t len, u8 out[at_least SHA1_DIGEST_SIZE]);
                                                 ^~~~~~~~
   include/crypto/sha1.h:97:54: error: expected ']' before numeric constant
    void sha1(const u8 *data, size_t len, u8 out[at_least SHA1_DIGEST_SIZE]);
                                                         ^
                                                         ]
   include/crypto/sha1.h:185:15: error: 'at_least' undeclared here (not in a function)
           u8 out[at_least SHA1_DIGEST_SIZE]);
                  ^~~~~~~~
   include/crypto/sha1.h:185:23: error: expected ']' before numeric constant
           u8 out[at_least SHA1_DIGEST_SIZE]);
                          ^
                          ]
   include/crypto/sha1.h:200:16: error: 'at_least' undeclared here (not in a function)
            u8 out[at_least SHA1_DIGEST_SIZE]);
                   ^~~~~~~~
   include/crypto/sha1.h:200:24: error: expected ']' before numeric constant
            u8 out[at_least SHA1_DIGEST_SIZE]);
                           ^
                           ]
   include/crypto/sha1.h:217:14: error: 'at_least' undeclared here (not in a function)
          u8 out[at_least SHA1_DIGEST_SIZE]);
                 ^~~~~~~~
   include/crypto/sha1.h:217:22: error: expected ']' before numeric constant
          u8 out[at_least SHA1_DIGEST_SIZE]);
                         ^
                         ]
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_test_vectors':
>> lib/crypto/tests/sha1_kunit.c:8:14: error: implicit declaration of function 'sha1'; did you mean 'swab'? [-Werror=implicit-function-declaration]
    #define HASH sha1
                 ^~~~
   lib/crypto/tests/hash-test-template.h:114:3: note: in expansion of macro 'HASH'
      HASH(test_buf, data_len, actual_hash);
      ^~~~
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_all_lens_up_to_4096':
>> lib/crypto/tests/sha1_kunit.c:13:20: error: implicit declaration of function 'sha1_final'; did you mean 'sha1_init'? [-Werror=implicit-function-declaration]
    #define HASH_FINAL sha1_final
                       ^~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:140:2: note: in expansion of macro 'HASH_FINAL'
     HASH_FINAL(&ctx, hash);
     ^~~~~~~~~~
   lib/crypto/tests/hash-test-template.h: In function 'test_hmac':
>> lib/crypto/tests/sha1_kunit.c:21:26: error: implicit declaration of function 'hmac_sha1_usingrawkey'; did you mean 'hmac_sha1_init_usingrawkey'? [-Werror=implicit-function-declaration]
    #define HMAC_USINGRAWKEY hmac_sha1_usingrawkey
                             ^~~~~~~~~~~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:515:3: note: in expansion of macro 'HMAC_USINGRAWKEY'
      HMAC_USINGRAWKEY(raw_key, key_len, test_buf, data_len, mac);
      ^~~~~~~~~~~~~~~~
>> lib/crypto/tests/sha1_kunit.c:20:14: error: implicit declaration of function 'hmac_sha1' [-Werror=implicit-function-declaration]
    #define HMAC hmac_sha1
                 ^~~~~~~~~
   lib/crypto/tests/hash-test-template.h:520:3: note: in expansion of macro 'HMAC'
      HMAC(&key, test_buf, data_len, mac2);
      ^~~~
>> lib/crypto/tests/sha1_kunit.c:19:20: error: implicit declaration of function 'hmac_sha1_final'; did you mean 'hmac_sha1_init'? [-Werror=implicit-function-declaration]
    #define HMAC_FINAL hmac_sha1_final
                       ^~~~~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:525:2: note: in expansion of macro 'HMAC_FINAL'
     HMAC_FINAL(&ctx, mac);
     ^~~~~~~~~~
   cc1: some warnings being treated as errors


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
