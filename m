Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F335674
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 04:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695961272; x=1727497272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15qG9WRxiA6hsRw68LOUar4Xh3w0BoGUVsOE4WO/+Lo=;
  b=RcaAxhlMuw/3ThqdRObLhRPQeVE/wnJB+NG1z3E28GN2qWuAKoLXZSLk
   9wYhnpfljKll63NuSywqlgP+EIb97S4XfbHFUu+DjjOhZIlhGCXbrSaqs
   UPyKybNrK4PoQSfKG8ixzQXEutEVKCQEXzkI8j1Tmyg7sYneItZPOASP1
   gn//JuEPVo27nWss7n9MikQo5u9siTbDhFAeZdhY/bwGUrvSzH6t+Ugi5
   TA810QprctXDm+GeX8tFUS2UCMORwgquaASZ+ZvPHgObXVwTK9ltL/RFw
   pR5XbIOedm7FEo7NG3n0wle7cgaJT9o61rOyWx+ClDzZ+Sh50f+8cgPWQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="385050369"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="385050369"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 21:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753258301"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="753258301"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Sep 2023 21:21:09 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm4zz-0002Sf-1j;
	Fri, 29 Sep 2023 04:21:07 +0000
Date: Fri, 29 Sep 2023 12:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-r2pro 21/25]
 drivers/crypto/rockchip/rk3588_crypto.c:558:13: warning: unused variable 'v'
Message-ID: <202309291214.ZSazkoGZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-r2pro
head:   ea614a1898ba713d79d0682665591c8c919e7410
commit: 7fa20a5abadb55268a0445f9691b989227d30707 [21/25] crypto: rockchip: add rk3588
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230929/202309291214.ZSazkoGZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291214.ZSazkoGZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291214.ZSazkoGZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/rockchip/rk3588_crypto.c:8:
   drivers/crypto/rockchip/rk3588_crypto.h:195:49: error: field 'skcipher' has incomplete type
     195 |                 struct skcipher_engine_alg      skcipher;
         |                                                 ^~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto.h:196:41: error: field 'hash' has incomplete type
     196 |                 struct ahash_engine_alg hash;
         |                                         ^~~~
   drivers/crypto/rockchip/rk3588_crypto.c:163:17: error: field name not in record or union initializer
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
   drivers/crypto/rockchip/rk3588_crypto.c:507:31: error: implicit declaration of function 'crypto_engine_register_skcipher'; did you mean 'crypto_unregister_skcipher'? [-Werror=implicit-function-declaration]
     507 |                         err = crypto_engine_register_skcipher(&rk_cipher_algs[i].alg.skcipher);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               crypto_unregister_skcipher
   drivers/crypto/rockchip/rk3588_crypto.c:513:31: error: implicit declaration of function 'crypto_engine_register_ahash'; did you mean 'crypto_unregister_ahash'? [-Werror=implicit-function-declaration]
     513 |                         err = crypto_engine_register_ahash(&rk_cipher_algs[i].alg.hash);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               crypto_unregister_ahash
   drivers/crypto/rockchip/rk3588_crypto.c:526:25: error: implicit declaration of function 'crypto_engine_unregister_skcipher'; did you mean 'crypto_unregister_skcipher'? [-Werror=implicit-function-declaration]
     526 |                         crypto_engine_unregister_skcipher(&rk_cipher_algs[k].alg.skcipher);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         crypto_unregister_skcipher
   drivers/crypto/rockchip/rk3588_crypto.c:528:25: error: implicit declaration of function 'crypto_engine_unregister_ahash'; did you mean 'crypto_unregister_ahash'? [-Werror=implicit-function-declaration]
     528 |                         crypto_engine_unregister_ahash(&rk_cipher_algs[i].alg.hash);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         crypto_unregister_ahash
   drivers/crypto/rockchip/rk3588_crypto.c: In function 'rk_crypto_probe':
>> drivers/crypto/rockchip/rk3588_crypto.c:558:13: warning: unused variable 'v' [-Wunused-variable]
     558 |         u32 v;
         |             ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/crypto/rockchip/rk3588_crypto_ahash.c:9:
   drivers/crypto/rockchip/rk3588_crypto.h:195:49: error: field 'skcipher' has incomplete type
     195 |                 struct skcipher_engine_alg      skcipher;
         |                                                 ^~~~~~~~
   drivers/crypto/rockchip/rk3588_crypto.h:196:41: error: field 'hash' has incomplete type
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
>> drivers/crypto/rockchip/rk3588_crypto_ahash.c:274:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 11 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
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
   drivers/crypto/rockchip/rk3588_crypto_ahash.c:324:43: note: in expansion of macro 'container_of'
     324 |         struct rk_crypto_template *algt = container_of(alg, struct rk_crypto_template, alg.hash.base);
         |                                           ^~~~~~~~~~~~


vim +/v +558 drivers/crypto/rockchip/rk3588_crypto.c

   494	
   495	static int rk_crypto_register(struct rk_crypto_dev *rkc)
   496	{
   497		unsigned int i, k;
   498		int err = 0;
   499	
   500		for (i = 0; i < ARRAY_SIZE(rk_cipher_algs); i++) {
   501			rk_cipher_algs[i].dev = rkc;
   502			switch (rk_cipher_algs[i].type) {
   503			case CRYPTO_ALG_TYPE_SKCIPHER:
   504				dev_info(rkc->dev, "Register %s as %s\n",
   505					 rk_cipher_algs[i].alg.skcipher.base.base.cra_name,
   506					 rk_cipher_algs[i].alg.skcipher.base.base.cra_driver_name);
   507				err = crypto_engine_register_skcipher(&rk_cipher_algs[i].alg.skcipher);
   508				break;
   509			case CRYPTO_ALG_TYPE_AHASH:
   510				dev_info(rkc->dev, "Register %s as %s\n",
   511					 rk_cipher_algs[i].alg.hash.base.halg.base.cra_name,
   512					 rk_cipher_algs[i].alg.hash.base.halg.base.cra_driver_name);
   513				err = crypto_engine_register_ahash(&rk_cipher_algs[i].alg.hash);
   514				break;
   515			default:
   516				dev_err(rkc->dev, "unknown algorithm\n");
   517			}
   518			if (err)
   519				goto err_cipher_algs;
   520		}
   521		return 0;
   522	
   523	err_cipher_algs:
   524		for (k = 0; k < i; k++) {
   525			if (rk_cipher_algs[i].type == CRYPTO_ALG_TYPE_SKCIPHER)
 > 526				crypto_engine_unregister_skcipher(&rk_cipher_algs[k].alg.skcipher);
   527			else
   528				crypto_engine_unregister_ahash(&rk_cipher_algs[i].alg.hash);
   529		}
   530		return err;
   531	}
   532	
   533	static void rk_crypto_unregister(void)
   534	{
   535		unsigned int i;
   536	
   537		for (i = 0; i < ARRAY_SIZE(rk_cipher_algs); i++) {
   538			if (rk_cipher_algs[i].type == CRYPTO_ALG_TYPE_SKCIPHER)
   539				crypto_engine_unregister_skcipher(&rk_cipher_algs[i].alg.skcipher);
   540			else
   541				crypto_engine_unregister_ahash(&rk_cipher_algs[i].alg.hash);
   542		}
   543	}
   544	
   545	static const struct of_device_id crypto_of_id_table[] = {
   546		{ .compatible = "rockchip,rk3588-crypto",
   547		  .data = &rk3588_variant,
   548		},
   549		{}
   550	};
   551	MODULE_DEVICE_TABLE(of, crypto_of_id_table);
   552	
   553	static int rk_crypto_probe(struct platform_device *pdev)
   554	{
   555		struct device *dev = &pdev->dev;
   556		struct rk_crypto_dev *rkc, *first;
   557		int err = 0;
 > 558		u32 v;
   559	
   560		rkc = devm_kzalloc(&pdev->dev, sizeof(*rkc), GFP_KERNEL);
   561		if (!rkc) {
   562			err = -ENOMEM;
   563			goto err_crypto;
   564		}
   565	
   566		rkc->dev = &pdev->dev;
   567		platform_set_drvdata(pdev, rkc);
   568	
   569		rkc->variant = of_device_get_match_data(&pdev->dev);
   570		if (!rkc->variant) {
   571			dev_err(&pdev->dev, "Missing variant\n");
   572			return -EINVAL;
   573		}
   574	
   575		rkc->rst = devm_reset_control_array_get_exclusive(dev);
   576		if (IS_ERR(rkc->rst)) {
   577			err = PTR_ERR(rkc->rst);
   578			dev_err(&pdev->dev, "Fail to get resets err=%d\n", err);
   579			goto err_crypto;
   580		}
   581	
   582		rkc->tl = dma_alloc_coherent(rkc->dev,
   583					     sizeof(struct rk_crypto_lli) * MAX_LLI,
   584					     &rkc->t_phy, GFP_KERNEL);
   585		if (!rkc->tl) {
   586			dev_err(rkc->dev, "Cannot get DMA memory for task\n");
   587			err = -ENOMEM;
   588			goto err_crypto;
   589		}
   590	
   591		reset_control_assert(rkc->rst);
   592		usleep_range(10, 20);
   593		reset_control_deassert(rkc->rst);
   594	
   595		rkc->reg = devm_platform_ioremap_resource(pdev, 0);
   596		if (IS_ERR(rkc->reg)) {
   597			err = PTR_ERR(rkc->reg);
   598			dev_err(&pdev->dev, "Fail to get resources\n");
   599			goto err_crypto;
   600		}
   601	
   602		err = rk_crypto_get_clks(rkc);
   603		if (err)
   604			goto err_crypto;
   605	
   606		rkc->irq = platform_get_irq(pdev, 0);
   607		if (rkc->irq < 0) {
   608			dev_err(&pdev->dev, "control Interrupt is not available.\n");
   609			err = rkc->irq;
   610			goto err_crypto;
   611		}
   612	
   613		err = devm_request_irq(&pdev->dev, rkc->irq,
   614				       rk_crypto_irq_handle, IRQF_SHARED,
   615				       "rk-crypto", pdev);
   616	
   617		if (err) {
   618			dev_err(&pdev->dev, "irq request failed.\n");
   619			goto err_crypto;
   620		}
   621	
   622		rkc->engine = crypto_engine_alloc_init(&pdev->dev, true);
   623		crypto_engine_start(rkc->engine);
   624		init_completion(&rkc->complete);
   625	
   626		err = rk_crypto_pm_init(rkc);
   627		if (err)
   628			goto err_pm;
   629	
   630		err = pm_runtime_resume_and_get(&pdev->dev);
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
