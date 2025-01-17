Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9AE1F941B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737105320; cv=none; b=QqZIcnhtF/DqKpUbIAvaxi30tPag0cIc8DNLMphGk30leWCGfoO+wrvtFaD2uJHs/KZcwUYvNoHLUuzY27AlC/FIgwsBfOytxgx9WcGvZuCI1n5B2uLB951kubFc5t0Jkpfpz77mjwGThH//sJaDl/uPGOLYfOZkL8dfhPS+s2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737105320; c=relaxed/simple;
	bh=+lr5gYw5m1xhk8vOOwM82LeuxY0oJMOJe0wozSVjA30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIxXUsIlRHZ4U6FcLrIv9aFWUxrZtLBl8925jtJW17daxAwbJcvkZJMeB6SNHA9JbKcFXWqr7thWqSJR4yXXdjB7pwc8OzR9QiadUh4oexn9loE3PbpAtl9WNeMMJa0IeB5BloGB97N5pyE0uQYp0nDoPu+tj1wLvngn0wkNwto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/P8dBK4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/P8dBK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737105318; x=1768641318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+lr5gYw5m1xhk8vOOwM82LeuxY0oJMOJe0wozSVjA30=;
  b=d/P8dBK4SDBfql3pb236z+YYSeSIWSEJzzrLFhTAI1vZdxFV+/wQITGd
   xiOHltC4Lq4B6ZAYhxWhlgrNjOxbWYKhG22dYThla3Mdf1+mp/r0tOb3f
   0sUG3dWDCn+jKVoY/yR3S0ASyn+tiEGiG7qwOos+fSnU9MQ5qV7iZWKM5
   ajWQCIOAlUv2Nx0MMk3Zajpg+INE4NKiX8DDE6iUmbOLIF/NpJhnxt9Oj
   N7M2wa/jpvYsK3bPmEPa6JpNPHEunAo+rsIaxJ4geHEMebEgepe+uvLS4
   Jq0h+xWf6axVKmweNMgIzU8C2ChBUreCaSEsaDr7VRmVTrMHOXuAhA0Ui
   Q==;
X-CSE-ConnectionGUID: 5HT20S1sSEyZXg0ZDDJR4w==
X-CSE-MsgGUID: gYkKGrH4QVy06UHYClq+iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="55080244"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="55080244"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 01:15:17 -0800
X-CSE-ConnectionGUID: jW2n3xcTTvGzKIEVuFSDOA==
X-CSE-MsgGUID: 7KDhFlBzTQyAH6xKuleUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106225919"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 01:15:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYiRd-000T0f-0n;
	Fri, 17 Jan 2025 09:15:13 +0000
Date: Fri, 17 Jan 2025 17:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] crypto/fips140_gen_hmac.c:122:2:
 warning: 'HMAC_Update' is deprecated
Message-ID: <202501171702.ObLLw2Rx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   a15ea19d1a4fd17a6e4f560b2b42d461fc73e596
commit: ae4ca7a09bb6715a0f3533fa6e499ce40b5d7ac1 [1/1] ANDROID: fips140: allow building without LTO
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250117/202501171702.ObLLw2Rx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171702.ObLLw2Rx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171702.ObLLw2Rx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/fips140_gen_hmac.c:122:2: warning: 'HMAC_Update' is deprecated [-Wdeprecated-declarations]
     122 |         HMAC_Update(hmac, start_addr, end_addr - start_addr);
         |         ^
   /usr/include/openssl/hmac.h:45:1: note: 'HMAC_Update' has been explicitly marked deprecated here
      45 | OSSL_DEPRECATEDIN_3_0 int HMAC_Update(HMAC_CTX *ctx, const unsigned char *data,
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
>> crypto/fips140_gen_hmac.c:184:9: warning: 'HMAC_CTX_new' is deprecated [-Wdeprecated-declarations]
     184 |         hmac = HMAC_CTX_new();
         |                ^
   /usr/include/openssl/hmac.h:33:1: note: 'HMAC_CTX_new' has been explicitly marked deprecated here
      33 | OSSL_DEPRECATEDIN_3_0 HMAC_CTX *HMAC_CTX_new(void);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
>> crypto/fips140_gen_hmac.c:185:2: warning: 'HMAC_Init_ex' is deprecated [-Wdeprecated-declarations]
     185 |         HMAC_Init_ex(hmac, hmac_key, strlen(hmac_key), EVP_sha256(), NULL);
         |         ^
   /usr/include/openssl/hmac.h:43:1: note: 'HMAC_Init_ex' has been explicitly marked deprecated here
      43 | OSSL_DEPRECATEDIN_3_0 int HMAC_Init_ex(HMAC_CTX *ctx, const void *key, int len,
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
>> crypto/fips140_gen_hmac.c:190:2: warning: 'HMAC_Final' is deprecated [-Wdeprecated-declarations]
     190 |         HMAC_Final(hmac, dg, &dglen);
         |         ^
   /usr/include/openssl/hmac.h:47:1: note: 'HMAC_Final' has been explicitly marked deprecated here
      47 | OSSL_DEPRECATEDIN_3_0 int HMAC_Final(HMAC_CTX *ctx, unsigned char *md,
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   4 warnings generated.
--
>> crypto/fips140-alg-registration.c:243:5: warning: no previous prototype for function 'fips140_crypto_register_alg' [-Wmissing-prototypes]
     243 | int fips140_crypto_register_alg(struct crypto_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:243:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     243 | int fips140_crypto_register_alg(struct crypto_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:248:5: warning: no previous prototype for function 'fips140_crypto_register_aead' [-Wmissing-prototypes]
     248 | int fips140_crypto_register_aead(struct aead_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     248 | int fips140_crypto_register_aead(struct aead_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:253:5: warning: no previous prototype for function 'fips140_crypto_register_ahash' [-Wmissing-prototypes]
     253 | int fips140_crypto_register_ahash(struct ahash_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     253 | int fips140_crypto_register_ahash(struct ahash_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:258:5: warning: no previous prototype for function 'fips140_crypto_register_rng' [-Wmissing-prototypes]
     258 | int fips140_crypto_register_rng(struct rng_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     258 | int fips140_crypto_register_rng(struct rng_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:263:5: warning: no previous prototype for function 'fips140_crypto_register_shash' [-Wmissing-prototypes]
     263 | int fips140_crypto_register_shash(struct shash_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:263:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     263 | int fips140_crypto_register_shash(struct shash_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:268:5: warning: no previous prototype for function 'fips140_crypto_register_skcipher' [-Wmissing-prototypes]
     268 | int fips140_crypto_register_skcipher(struct skcipher_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:268:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     268 | int fips140_crypto_register_skcipher(struct skcipher_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:276:5: warning: no previous prototype for function 'fips140_aead_register_instance' [-Wmissing-prototypes]
     276 | int fips140_aead_register_instance(struct crypto_template *tmpl,
         |     ^
   crypto/fips140-alg-registration.c:276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     276 | int fips140_aead_register_instance(struct crypto_template *tmpl,
         | ^
         | static 
>> crypto/fips140-alg-registration.c:283:5: warning: no previous prototype for function 'fips140_ahash_register_instance' [-Wmissing-prototypes]
     283 | int fips140_ahash_register_instance(struct crypto_template *tmpl,
         |     ^
   crypto/fips140-alg-registration.c:283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     283 | int fips140_ahash_register_instance(struct crypto_template *tmpl,
         | ^
         | static 
>> crypto/fips140-alg-registration.c:290:5: warning: no previous prototype for function 'fips140_shash_register_instance' [-Wmissing-prototypes]
     290 | int fips140_shash_register_instance(struct crypto_template *tmpl,
         |     ^
   crypto/fips140-alg-registration.c:290:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     290 | int fips140_shash_register_instance(struct crypto_template *tmpl,
         | ^
         | static 
>> crypto/fips140-alg-registration.c:297:5: warning: no previous prototype for function 'fips140_skcipher_register_instance' [-Wmissing-prototypes]
     297 | int fips140_skcipher_register_instance(struct crypto_template *tmpl,
         |     ^
   crypto/fips140-alg-registration.c:297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     297 | int fips140_skcipher_register_instance(struct crypto_template *tmpl,
         | ^
         | static 
>> crypto/fips140-alg-registration.c:306:5: warning: no previous prototype for function 'fips140_crypto_register_algs' [-Wmissing-prototypes]
     306 | int fips140_crypto_register_algs(struct crypto_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:306:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     306 | int fips140_crypto_register_algs(struct crypto_alg *algs, int count)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:320:5: warning: no previous prototype for function 'fips140_crypto_register_aeads' [-Wmissing-prototypes]
     320 | int fips140_crypto_register_aeads(struct aead_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:320:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     320 | int fips140_crypto_register_aeads(struct aead_alg *algs, int count)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:334:5: warning: no previous prototype for function 'fips140_crypto_register_ahashes' [-Wmissing-prototypes]
     334 | int fips140_crypto_register_ahashes(struct ahash_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:334:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     334 | int fips140_crypto_register_ahashes(struct ahash_alg *algs, int count)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:348:5: warning: no previous prototype for function 'fips140_crypto_register_rngs' [-Wmissing-prototypes]
     348 | int fips140_crypto_register_rngs(struct rng_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:348:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     348 | int fips140_crypto_register_rngs(struct rng_alg *algs, int count)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:362:5: warning: no previous prototype for function 'fips140_crypto_register_shashes' [-Wmissing-prototypes]
     362 | int fips140_crypto_register_shashes(struct shash_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:362:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     362 | int fips140_crypto_register_shashes(struct shash_alg *algs, int count)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:376:5: warning: no previous prototype for function 'fips140_crypto_register_skciphers' [-Wmissing-prototypes]
     376 | int fips140_crypto_register_skciphers(struct skcipher_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:376:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     376 | int fips140_crypto_register_skciphers(struct skcipher_alg *algs, int count)
         | ^
         | static 
   16 warnings generated.


vim +/HMAC_Update +122 crypto/fips140_gen_hmac.c

2db9143a1b5a70 Ard Biesheuvel 2021-03-23  116  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  117  static void hmac_section(HMAC_CTX *hmac, const char *start, const char *end)
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  118  {
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  119  	void *start_addr = get_sym_addr(start);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  120  	void *end_addr = get_sym_addr(end);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  121  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23 @122  	HMAC_Update(hmac, start_addr, end_addr - start_addr);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  123  }
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  124  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  125  int main(int argc, char **argv)
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  126  {
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  127  	Elf64_Shdr *symtab_shdr;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  128  	const char *hmac_key;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  129  	unsigned char *dg;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  130  	unsigned int dglen;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  131  	struct stat stat;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  132  	HMAC_CTX *hmac;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  133  	int fd, ret;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  134  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  135  	if (argc < 2) {
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  136  		fprintf(stderr, "file argument missing\n");
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  137  		exit(EXIT_FAILURE);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  138  	}
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  139  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  140  	fd = open(argv[1], O_RDWR);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  141  	if (fd < 0) {
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  142  		fprintf(stderr, "failed to open %s\n", argv[1]);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  143  		exit(EXIT_FAILURE);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  144  	}
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  145  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  146  	ret = fstat(fd, &stat);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  147  	if (ret < 0) {
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  148  		fprintf(stderr, "failed to stat() %s\n", argv[1]);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  149  		exit(EXIT_FAILURE);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  150  	}
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  151  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  152  	ehdr = mmap(0, stat.st_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  153  	if (ehdr == MAP_FAILED) {
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  154  		fprintf(stderr, "failed to mmap() %s\n", argv[1]);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  155  		exit(EXIT_FAILURE);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  156  	}
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  157  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  158  	shdr = (void *)ehdr + ehdr->e_shoff;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  159  	num_shdr = ehdr->e_shnum;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  160  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  161  	symtab_shdr = find_symtab_section();
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  162  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  163  	syms = (void *)ehdr + symtab_shdr->sh_offset;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  164  	num_syms = symtab_shdr->sh_size / sizeof(Elf64_Sym);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  165  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  166  	strtab = (void *)ehdr + shdr[symtab_shdr->sh_link].sh_offset;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  167  	shstrtab = (void *)ehdr + shdr[ehdr->e_shstrndx].sh_offset;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  168  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  169  	if (!update_rela_ref("text") || !update_rela_ref("rodata"))
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  170  		exit(EXIT_FAILURE);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  171  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  172  	hmac_key = get_sym_addr("fips140_integ_hmac_key");
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  173  	if (!hmac_key) {
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  174  		fprintf(stderr, "failed to locate HMAC key in binary\n");
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  175  		exit(EXIT_FAILURE);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  176  	}
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  177  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  178  	dg = get_sym_addr("fips140_integ_hmac_digest");
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  179  	if (!dg) {
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  180  		fprintf(stderr, "failed to locate HMAC digest in binary\n");
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  181  		exit(EXIT_FAILURE);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  182  	}
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  183  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23 @184  	hmac = HMAC_CTX_new();
2db9143a1b5a70 Ard Biesheuvel 2021-03-23 @185  	HMAC_Init_ex(hmac, hmac_key, strlen(hmac_key), EVP_sha256(), NULL);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  186  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  187  	hmac_section(hmac, "__fips140_text_start", "__fips140_text_end");
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  188  	hmac_section(hmac, "__fips140_rodata_start", "__fips140_rodata_end");
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  189  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23 @190  	HMAC_Final(hmac, dg, &dglen);

:::::: The code at line 122 was first introduced by commit
:::::: 2db9143a1b5a70edaa69a5e1b12acfef490c6d38 ANDROID: fips140: add kernel crypto module

:::::: TO: Ard Biesheuvel <ardb@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
