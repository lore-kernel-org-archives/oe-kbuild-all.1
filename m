Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B935610EB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 02:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBQ/MKGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696732909; x=1728268909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1IMEtdfZp31O3PdCLkZc62ABMSMGlE5YC93TtIrUWSM=;
  b=lBQ/MKGcpDYtazmae9UYy52i3v/E7kxMZAQ899Fp5sXW6YQIXS3r/dq5
   /kWPy/ysj45DdDl9piq7sTPq8/F68fh/TJsXSRLwDwU60ESfZGYXi4EL0
   X6jVziwvtW6mWEYM9eaPeDXNDvkU6veZ7ak0QNSOWca7hsiJEy0Kjax5e
   kqV0pb/nd23hwjh94izQLDNH7nU4B7Jih98sTgF7soAdkKO8TMrGBfspn
   8KTSfXfb6WPtMIAapHLHy4XrB9OUz0eMgj0GqSnlSIC+UnrJoRTItF9o5
   nzU+qAqEgosCZT8s8I7d5LxVcJUADrKAoWOgdH14IgxgRF4PYlVJPvWE3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="382843278"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="382843278"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 19:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="822968785"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="822968785"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2023 19:41:43 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpJjh-000547-24;
	Sun, 08 Oct 2023 02:41:41 +0000
Date: Sun, 8 Oct 2023 10:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-r2pro 21/31]
 drivers/crypto/rockchip/rk3588_crypto.h:195:49: error: field 'skcipher' has
 incomplete type
Message-ID: <202310081013.5w2hu0r1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-r2pro
head:   9842ce31a69979c73f0cde792d386d87f04b86cc
commit: 7fa20a5abadb55268a0445f9691b989227d30707 [21/31] crypto: rockchip: add rk3588
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231008/202310081013.5w2hu0r1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310081013.5w2hu0r1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310081013.5w2hu0r1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/crypto/rockchip/rk3588_crypto.c:8:
>> drivers/crypto/rockchip/rk3588_crypto.h:195:49: error: field 'skcipher' has incomplete type
     195 |                 struct skcipher_engine_alg      skcipher;
         |                                                 ^~~~~~~~
>> drivers/crypto/rockchip/rk3588_crypto.h:196:41: error: field 'hash' has incomplete type
     196 |                 struct ahash_engine_alg hash;
         |                                         ^~~~
>> drivers/crypto/rockchip/rk3588_crypto.c:163:17: error: field name not in record or union initializer
     163 |                 .alg.skcipher.base = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:163:17: note: (near initialization for 'rk_cipher_algs[0].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:181:17: error: field name not in record or union initializer
     181 |                 .alg.skcipher.op = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:181:17: note: (near initialization for 'rk_cipher_algs[0].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:188:17: error: field name not in record or union initializer
     188 |                 .alg.skcipher.base = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:188:17: note: (near initialization for 'rk_cipher_algs[1].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:207:17: error: field name not in record or union initializer
     207 |                 .alg.skcipher.op = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:207:17: note: (near initialization for 'rk_cipher_algs[1].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:215:17: error: field name not in record or union initializer
     215 |                 .alg.skcipher.base = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:215:17: note: (near initialization for 'rk_cipher_algs[2].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:234:17: error: field name not in record or union initializer
     234 |                 .alg.skcipher.op = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:234:17: note: (near initialization for 'rk_cipher_algs[2].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:241:17: error: field name not in record or union initializer
     241 |                 .alg.hash.base = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:241:17: note: (near initialization for 'rk_cipher_algs[3].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:267:17: error: field name not in record or union initializer
     267 |                 .alg.hash.op = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:267:17: note: (near initialization for 'rk_cipher_algs[3].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:275:17: error: field name not in record or union initializer
     275 |                 .alg.hash.base = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:275:17: note: (near initialization for 'rk_cipher_algs[4].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:301:17: error: field name not in record or union initializer
     301 |                 .alg.hash.op = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:301:17: note: (near initialization for 'rk_cipher_algs[4].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:308:17: error: field name not in record or union initializer
     308 |                 .alg.hash.base = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:308:17: note: (near initialization for 'rk_cipher_algs[5].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:334:17: error: field name not in record or union initializer
     334 |                 .alg.hash.op = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:334:17: note: (near initialization for 'rk_cipher_algs[5].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:341:17: error: field name not in record or union initializer
     341 |                 .alg.hash.base = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:341:17: note: (near initialization for 'rk_cipher_algs[6].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:367:17: error: field name not in record or union initializer
     367 |                 .alg.hash.op = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:367:17: note: (near initialization for 'rk_cipher_algs[6].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:374:17: error: field name not in record or union initializer
     374 |                 .alg.hash.base = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:374:17: note: (near initialization for 'rk_cipher_algs[7].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:400:17: error: field name not in record or union initializer
     400 |                 .alg.hash.op = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:400:17: note: (near initialization for 'rk_cipher_algs[7].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:407:17: error: field name not in record or union initializer
     407 |                 .alg.hash.base = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:407:17: note: (near initialization for 'rk_cipher_algs[8].alg')
   drivers/crypto/rockchip/rk3588_crypto.c:433:17: error: field name not in record or union initializer
     433 |                 .alg.hash.op = {
         |                 ^
   drivers/crypto/rockchip/rk3588_crypto.c:433:17: note: (near initialization for 'rk_cipher_algs[8].alg')
   drivers/crypto/rockchip/rk3588_crypto.c: In function 'rk_crypto_register':
>> drivers/crypto/rockchip/rk3588_crypto.c:507:31: error: implicit declaration of function 'crypto_engine_register_skcipher'; did you mean 'crypto_unregister_skcipher'? [-Werror=implicit-function-declaration]
     507 |                         err = crypto_engine_register_skcipher(&rk_cipher_algs[i].alg.skcipher);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               crypto_unregister_skcipher
>> drivers/crypto/rockchip/rk3588_crypto.c:513:31: error: implicit declaration of function 'crypto_engine_register_ahash'; did you mean 'crypto_unregister_ahash'? [-Werror=implicit-function-declaration]
     513 |                         err = crypto_engine_register_ahash(&rk_cipher_algs[i].alg.hash);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               crypto_unregister_ahash
>> drivers/crypto/rockchip/rk3588_crypto.c:526:25: error: implicit declaration of function 'crypto_engine_unregister_skcipher'; did you mean 'crypto_unregister_skcipher'? [-Werror=implicit-function-declaration]
     526 |                         crypto_engine_unregister_skcipher(&rk_cipher_algs[k].alg.skcipher);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         crypto_unregister_skcipher
>> drivers/crypto/rockchip/rk3588_crypto.c:528:25: error: implicit declaration of function 'crypto_engine_unregister_ahash'; did you mean 'crypto_unregister_ahash'? [-Werror=implicit-function-declaration]
     528 |                         crypto_engine_unregister_ahash(&rk_cipher_algs[i].alg.hash);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         crypto_unregister_ahash
   drivers/crypto/rockchip/rk3588_crypto.c: In function 'rk_crypto_probe':
   drivers/crypto/rockchip/rk3588_crypto.c:558:13: warning: unused variable 'v' [-Wunused-variable]
     558 |         u32 v;
         |             ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/crypto/rockchip/rk3588_crypto_skcipher.c:8:
>> drivers/crypto/rockchip/rk3588_crypto.h:195:49: error: field 'skcipher' has incomplete type
     195 |                 struct skcipher_engine_alg      skcipher;
         |                                                 ^~~~~~~~
>> drivers/crypto/rockchip/rk3588_crypto.h:196:41: error: field 'hash' has incomplete type
     196 |                 struct ahash_engine_alg hash;
         |                                         ^~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/algapi.h:13,
                    from include/crypto/scatterwalk.h:14,
                    from drivers/crypto/rockchip/rk3588_crypto_skcipher.c:7:
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c: In function 'rk_cipher_need_fallback':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c:189:43: note: in expansion of macro 'container_of'
     189 |         struct rk_crypto_template *algt = container_of(alg, struct rk_crypto_template, alg.skcipher.base);
         |                                           ^~~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c: In function 'rk_cipher_fallback':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c:243:43: note: in expansion of macro 'container_of'
     243 |         struct rk_crypto_template *algt = container_of(alg, struct rk_crypto_template, alg.skcipher.base);
         |                                           ^~~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c: In function 'rk_skcipher_encrypt':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c:321:43: note: in expansion of macro 'container_of'
     321 |         struct rk_crypto_template *algt = container_of(alg, struct rk_crypto_template, alg.skcipher.base);
         |                                           ^~~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c: In function 'rk_skcipher_decrypt':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c:332:43: note: in expansion of macro 'container_of'
     332 |         struct rk_crypto_template *algt = container_of(alg, struct rk_crypto_template, alg.skcipher.base);
         |                                           ^~~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c: In function 'rk2_cipher_run':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c:350:43: note: in expansion of macro 'container_of'
     350 |         struct rk_crypto_template *algt = container_of(alg, struct rk_crypto_template, alg.skcipher.base);
         |                                           ^~~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_skcipher.c: In function 'rk_cipher_tfm_init':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
--
   In file included from drivers/crypto/rockchip/rk3588_crypto_ahash.c:9:
>> drivers/crypto/rockchip/rk3588_crypto.h:195:49: error: field 'skcipher' has incomplete type
     195 |                 struct skcipher_engine_alg      skcipher;
         |                                                 ^~~~~~~~
>> drivers/crypto/rockchip/rk3588_crypto.h:196:41: error: field 'hash' has incomplete type
     196 |                 struct ahash_engine_alg hash;
         |                                         ^~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from include/linux/iopoll.h:9,
                    from drivers/crypto/rockchip/rk3588_crypto_ahash.c:8:
   drivers/crypto/rockchip/rk3588_crypto_ahash.c: In function 'rk_ahash_need_fallback':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_ahash.c:15:43: note: in expansion of macro 'container_of'
      15 |         struct rk_crypto_template *algt = container_of(alg, struct rk_crypto_template, alg.hash.base);
         |                                           ^~~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_ahash.c: In function 'rk_ahash_digest_fb':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_ahash.c:39:43: note: in expansion of macro 'container_of'
      39 |         struct rk_crypto_template *algt = container_of(alg, struct rk_crypto_template, alg.hash.base);
         |                                           ^~~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_ahash.c: In function 'zero_message_process':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_ahash.c:58:43: note: in expansion of macro 'container_of'
      58 |         struct rk_crypto_template *algt = container_of(alg, struct rk_crypto_template, alg.hash.base);
         |                                           ^~~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_ahash.c: In function 'rk2_hash_run':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_ahash.c:223:43: note: in expansion of macro 'container_of'
     223 |         struct rk_crypto_template *algt = container_of(alg, struct rk_crypto_template, alg.hash.base);
         |                                           ^~~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30:
   drivers/crypto/rockchip/rk3588_crypto_ahash.c:274:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 11 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     274 |                 dev_dbg(rkc->dev, "HASH SG %d sglen=%d user=%x dma=%x mode=%x len=%d todo=%d phy=%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_ahash.c:274:17: note: in expansion of macro 'dev_dbg'
     274 |                 dev_dbg(rkc->dev, "HASH SG %d sglen=%d user=%x dma=%x mode=%x len=%d todo=%d phy=%llx\n",
         |                 ^~~~~~~
   drivers/crypto/rockchip/rk3588_crypto_ahash.c:274:101: note: format string is defined here
     274 |                 dev_dbg(rkc->dev, "HASH SG %d sglen=%d user=%x dma=%x mode=%x len=%d todo=%d phy=%llx\n",
         |                                                                                                  ~~~^
         |                                                                                                     |
         |                                                                                                     long long unsigned int
         |                                                                                                  %x
   drivers/crypto/rockchip/rk3588_crypto_ahash.c: In function 'rk_hash_init_tfm':


vim +/skcipher +195 drivers/crypto/rockchip/rk3588_crypto.h

   188	
   189	struct rk_crypto_template {
   190		u32 type;
   191		u32 rk_mode;
   192		bool is_xts;
   193		struct rk_crypto_dev           *dev;
   194		union {
 > 195			struct skcipher_engine_alg	skcipher;
 > 196			struct ahash_engine_alg	hash;
   197		} alg;
   198		unsigned long stat_req;
   199		unsigned long stat_fb;
   200		unsigned long stat_fb_len;
   201		unsigned long stat_fb_sglen;
   202		unsigned long stat_fb_align;
   203		unsigned long stat_fb_sgdiff;
   204	};
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
