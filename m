Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC51FBD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 22:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693865660; x=1725401660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4PbbMvVW5FlxbIl7YvIs7uW5t30GcqVAiCs4vzaemlo=;
  b=ZrhVBgumWsrZMlwNMfKv0AOq2/DETL29Npz/kK/6rUwnm1u1BNOyR45o
   IM9zo1EBWU33l5sDu+OYvJmCahbBsIhYQs+GZdt0ylV8f50GvVnR5du3L
   gTnSg67pvtxWKcTsSUbuK9IOLykGSAiEtm+MxiGg85LUw1gQ79HVA4jtc
   kMKKXjQ2oZTstPwZ80FflS3Yhi7EUW8SFKP5XMxxUpFsc/nJ2TSEYuEED
   AabqGynL5xXNdckuE4N/MdIOQRZZ55bjo08qXaMCU/ENY9jSSGYewoZ6n
   AgdPszlsgsN2U0UdJ9+Pb3mqht7BvmE3uXVkgj5xdTc7BTOEWD49XSX4i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="440633979"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="440633979"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 15:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="770109407"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="770109407"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 04 Sep 2023 15:14:17 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdHpk-0000s7-1L;
	Mon, 04 Sep 2023 22:14:13 +0000
Date: Tue, 5 Sep 2023 06:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 19890/23556] crypto/internal.h:66:2:
 error: implicit declaration of function 'static_key_enable'
Message-ID: <202309050624.zeIsgmCU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   4f597a1965208cd0f54dc59c207f729c840a1cb4
commit: ae4ca7a09bb6715a0f3533fa6e499ce40b5d7ac1 [19890/23556] ANDROID: fips140: allow building without LTO
config: arm64-randconfig-r003-20230905 (https://download.01.org/0day-ci/archive/20230905/202309050624.zeIsgmCU-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050624.zeIsgmCU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050624.zeIsgmCU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> crypto/fips140_gen_hmac.c:122:2: warning: 'HMAC_Update' is deprecated [-Wdeprecated-declarations]
           HMAC_Update(hmac, start_addr, end_addr - start_addr);
           ^
   /usr/include/openssl/hmac.h:45:1: note: 'HMAC_Update' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0 int HMAC_Update(HMAC_CTX *ctx, const unsigned char *data,
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
>> crypto/fips140_gen_hmac.c:184:9: warning: 'HMAC_CTX_new' is deprecated [-Wdeprecated-declarations]
           hmac = HMAC_CTX_new();
                  ^
   /usr/include/openssl/hmac.h:33:1: note: 'HMAC_CTX_new' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0 HMAC_CTX *HMAC_CTX_new(void);
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
>> crypto/fips140_gen_hmac.c:185:2: warning: 'HMAC_Init_ex' is deprecated [-Wdeprecated-declarations]
           HMAC_Init_ex(hmac, hmac_key, strlen(hmac_key), EVP_sha256(), NULL);
           ^
   /usr/include/openssl/hmac.h:43:1: note: 'HMAC_Init_ex' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0 int HMAC_Init_ex(HMAC_CTX *ctx, const void *key, int len,
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
>> crypto/fips140_gen_hmac.c:190:2: warning: 'HMAC_Final' is deprecated [-Wdeprecated-declarations]
           HMAC_Final(hmac, dg, &dglen);
           ^
   /usr/include/openssl/hmac.h:47:1: note: 'HMAC_Final' has been explicitly marked deprecated here
   OSSL_DEPRECATEDIN_3_0 int HMAC_Final(HMAC_CTX *ctx, unsigned char *md,
   ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
   #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
                                                   ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
   #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
                                                      ^
   4 warnings generated.
--
   In file included from crypto/fips140-module.c:36:
>> crypto/internal.h:66:2: error: implicit declaration of function 'static_key_enable' [-Werror,-Wimplicit-function-declaration]
           static_branch_enable(&__crypto_boot_test_finished);
           ^
   include/linux/jump_label.h:550:35: note: expanded from macro 'static_branch_enable'
   #define static_branch_enable(x)                 static_key_enable(&(x)->key)
                                                   ^
   crypto/internal.h:66:2: note: did you mean 'static_key_false'?
   include/linux/jump_label.h:550:35: note: expanded from macro 'static_branch_enable'
   #define static_branch_enable(x)                 static_key_enable(&(x)->key)
                                                   ^
   include/linux/jump_label.h:210:29: note: 'static_key_false' declared here
   static __always_inline bool static_key_false(struct static_key *key)
                               ^
>> crypto/fips140-module.c:482:8: error: implicit declaration of function 'register_trace_android_vh_sha256' [-Werror,-Wimplicit-function-declaration]
           ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
                 ^
   crypto/fips140-module.c:482:8: note: did you mean 'trace_android_vh_sha256'?
   include/trace/hooks/fips140.h:19:1: note: 'trace_android_vh_sha256' declared here
   DECLARE_HOOK(android_vh_sha256,
   ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
   #define DECLARE_HOOK DECLARE_EVENT_NOP
                        ^
   include/linux/tracepoint.h:571:21: note: expanded from macro 'DECLARE_EVENT_NOP'
           static inline void trace_##name(proto)                          \
                              ^
   <scratch space>:123:1: note: expanded from here
   trace_android_vh_sha256
   ^
>> crypto/fips140-module.c:483:8: error: implicit declaration of function 'register_trace_android_vh_aes_expandkey' [-Werror,-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
                 ^
   crypto/fips140-module.c:483:8: note: did you mean 'trace_android_vh_aes_expandkey'?
   include/trace/hooks/fips140.h:26:1: note: 'trace_android_vh_aes_expandkey' declared here
   DECLARE_HOOK(android_vh_aes_expandkey,
   ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
   #define DECLARE_HOOK DECLARE_EVENT_NOP
                        ^
   include/linux/tracepoint.h:571:21: note: expanded from macro 'DECLARE_EVENT_NOP'
           static inline void trace_##name(proto)                          \
                              ^
   <scratch space>:126:1: note: expanded from here
   trace_android_vh_aes_expandkey
   ^
>> crypto/fips140-module.c:484:8: error: implicit declaration of function 'register_trace_android_vh_aes_encrypt' [-Werror,-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
                 ^
>> crypto/fips140-module.c:485:8: error: implicit declaration of function 'register_trace_android_vh_aes_decrypt' [-Werror,-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
                 ^
   5 errors generated.
--
>> crypto/fips140-alg-registration.c:243:5: warning: no previous prototype for function 'fips140_crypto_register_alg' [-Wmissing-prototypes]
   int fips140_crypto_register_alg(struct crypto_alg *alg)
       ^
   crypto/fips140-alg-registration.c:243:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_alg(struct crypto_alg *alg)
   ^
   static 
>> crypto/fips140-alg-registration.c:248:5: warning: no previous prototype for function 'fips140_crypto_register_aead' [-Wmissing-prototypes]
   int fips140_crypto_register_aead(struct aead_alg *alg)
       ^
   crypto/fips140-alg-registration.c:248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_aead(struct aead_alg *alg)
   ^
   static 
>> crypto/fips140-alg-registration.c:253:5: warning: no previous prototype for function 'fips140_crypto_register_ahash' [-Wmissing-prototypes]
   int fips140_crypto_register_ahash(struct ahash_alg *alg)
       ^
   crypto/fips140-alg-registration.c:253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_ahash(struct ahash_alg *alg)
   ^
   static 
>> crypto/fips140-alg-registration.c:258:5: warning: no previous prototype for function 'fips140_crypto_register_rng' [-Wmissing-prototypes]
   int fips140_crypto_register_rng(struct rng_alg *alg)
       ^
   crypto/fips140-alg-registration.c:258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_rng(struct rng_alg *alg)
   ^
   static 
>> crypto/fips140-alg-registration.c:263:5: warning: no previous prototype for function 'fips140_crypto_register_shash' [-Wmissing-prototypes]
   int fips140_crypto_register_shash(struct shash_alg *alg)
       ^
   crypto/fips140-alg-registration.c:263:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_shash(struct shash_alg *alg)
   ^
   static 
>> crypto/fips140-alg-registration.c:268:5: warning: no previous prototype for function 'fips140_crypto_register_skcipher' [-Wmissing-prototypes]
   int fips140_crypto_register_skcipher(struct skcipher_alg *alg)
       ^
   crypto/fips140-alg-registration.c:268:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_skcipher(struct skcipher_alg *alg)
   ^
   static 
>> crypto/fips140-alg-registration.c:276:5: warning: no previous prototype for function 'fips140_aead_register_instance' [-Wmissing-prototypes]
   int fips140_aead_register_instance(struct crypto_template *tmpl,
       ^
   crypto/fips140-alg-registration.c:276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_aead_register_instance(struct crypto_template *tmpl,
   ^
   static 
>> crypto/fips140-alg-registration.c:283:5: warning: no previous prototype for function 'fips140_ahash_register_instance' [-Wmissing-prototypes]
   int fips140_ahash_register_instance(struct crypto_template *tmpl,
       ^
   crypto/fips140-alg-registration.c:283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_ahash_register_instance(struct crypto_template *tmpl,
   ^
   static 
>> crypto/fips140-alg-registration.c:290:5: warning: no previous prototype for function 'fips140_shash_register_instance' [-Wmissing-prototypes]
   int fips140_shash_register_instance(struct crypto_template *tmpl,
       ^
   crypto/fips140-alg-registration.c:290:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_shash_register_instance(struct crypto_template *tmpl,
   ^
   static 
>> crypto/fips140-alg-registration.c:297:5: warning: no previous prototype for function 'fips140_skcipher_register_instance' [-Wmissing-prototypes]
   int fips140_skcipher_register_instance(struct crypto_template *tmpl,
       ^
   crypto/fips140-alg-registration.c:297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_skcipher_register_instance(struct crypto_template *tmpl,
   ^
   static 
>> crypto/fips140-alg-registration.c:306:5: warning: no previous prototype for function 'fips140_crypto_register_algs' [-Wmissing-prototypes]
   int fips140_crypto_register_algs(struct crypto_alg *algs, int count)
       ^
   crypto/fips140-alg-registration.c:306:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_algs(struct crypto_alg *algs, int count)
   ^
   static 
>> crypto/fips140-alg-registration.c:320:5: warning: no previous prototype for function 'fips140_crypto_register_aeads' [-Wmissing-prototypes]
   int fips140_crypto_register_aeads(struct aead_alg *algs, int count)
       ^
   crypto/fips140-alg-registration.c:320:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_aeads(struct aead_alg *algs, int count)
   ^
   static 
>> crypto/fips140-alg-registration.c:334:5: warning: no previous prototype for function 'fips140_crypto_register_ahashes' [-Wmissing-prototypes]
   int fips140_crypto_register_ahashes(struct ahash_alg *algs, int count)
       ^
   crypto/fips140-alg-registration.c:334:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_ahashes(struct ahash_alg *algs, int count)
   ^
   static 
>> crypto/fips140-alg-registration.c:348:5: warning: no previous prototype for function 'fips140_crypto_register_rngs' [-Wmissing-prototypes]
   int fips140_crypto_register_rngs(struct rng_alg *algs, int count)
       ^
   crypto/fips140-alg-registration.c:348:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_rngs(struct rng_alg *algs, int count)
   ^
   static 
>> crypto/fips140-alg-registration.c:362:5: warning: no previous prototype for function 'fips140_crypto_register_shashes' [-Wmissing-prototypes]
   int fips140_crypto_register_shashes(struct shash_alg *algs, int count)
       ^
   crypto/fips140-alg-registration.c:362:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_shashes(struct shash_alg *algs, int count)
   ^
   static 
>> crypto/fips140-alg-registration.c:376:5: warning: no previous prototype for function 'fips140_crypto_register_skciphers' [-Wmissing-prototypes]
   int fips140_crypto_register_skciphers(struct skcipher_alg *algs, int count)
       ^
   crypto/fips140-alg-registration.c:376:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fips140_crypto_register_skciphers(struct skcipher_alg *algs, int count)
   ^
   static 
   16 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +/static_key_enable +66 crypto/internal.h

5cb1454b862ab3 Herbert Xu   2005-11-05  49  
118fe0a09c8a6e Eric Biggers 2022-11-13  50  #ifdef CONFIG_CRYPTO_MANAGER_DISABLE_TESTS
118fe0a09c8a6e Eric Biggers 2022-11-13  51  static inline bool crypto_boot_test_finished(void)
118fe0a09c8a6e Eric Biggers 2022-11-13  52  {
118fe0a09c8a6e Eric Biggers 2022-11-13  53  	return true;
118fe0a09c8a6e Eric Biggers 2022-11-13  54  }
118fe0a09c8a6e Eric Biggers 2022-11-13  55  static inline void set_crypto_boot_test_finished(void)
118fe0a09c8a6e Eric Biggers 2022-11-13  56  {
118fe0a09c8a6e Eric Biggers 2022-11-13  57  }
118fe0a09c8a6e Eric Biggers 2022-11-13  58  #else
118fe0a09c8a6e Eric Biggers 2022-11-13  59  DECLARE_STATIC_KEY_FALSE(__crypto_boot_test_finished);
118fe0a09c8a6e Eric Biggers 2022-11-13  60  static inline bool crypto_boot_test_finished(void)
118fe0a09c8a6e Eric Biggers 2022-11-13  61  {
118fe0a09c8a6e Eric Biggers 2022-11-13  62  	return static_branch_likely(&__crypto_boot_test_finished);
118fe0a09c8a6e Eric Biggers 2022-11-13  63  }
118fe0a09c8a6e Eric Biggers 2022-11-13  64  static inline void set_crypto_boot_test_finished(void)
118fe0a09c8a6e Eric Biggers 2022-11-13  65  {
118fe0a09c8a6e Eric Biggers 2022-11-13 @66  	static_branch_enable(&__crypto_boot_test_finished);
118fe0a09c8a6e Eric Biggers 2022-11-13  67  }
118fe0a09c8a6e Eric Biggers 2022-11-13  68  #endif /* !CONFIG_CRYPTO_MANAGER_DISABLE_TESTS */
9a70f42d4782c0 Herbert Xu   2021-09-17  69  

:::::: The code at line 66 was first introduced by commit
:::::: 118fe0a09c8a6e59cf6ce97627818bee25f1f3e6 UPSTREAM: crypto: api - compile out crypto_boot_test_finished when tests disabled

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
