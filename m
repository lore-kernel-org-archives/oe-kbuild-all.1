Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342D2F39D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 23:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162809; cv=none; b=YhLMwnXB2bAl1LNlSy1/tAlG759NvW3J59cOHTklD5WR0lJK7HgOmf+fZBFjY+UT21+XAZTkHzjZyPRue2Cjn07ybaulEUwMNCk+R0IXvkb9Ee5KDvP9tpQOgsBPoFK4/xNPHRii1EUFgmRQi1E0cTKdZAKFLNHYKu89tAKKAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162809; c=relaxed/simple;
	bh=HrxSovaqQrYgBaCrYN8oJNiSWuHZcwdpC45wJq7Sszw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dedqv67k03Y1zu4qgd25/icvJqbUuMzVvzU0+35B4PZ+FbdiaL2wckCCNmz9jR6JMj6LaSbE5rOGiUnnTY+CPMKwQ3TQvwrcMteryuJedB7uiHictez9pmemvwhJ2zyrDijfI5qnxcTzK7TF/06ti//5bHeWhWesv1ItkF9T7PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqipQMAZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqipQMAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763162808; x=1794698808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HrxSovaqQrYgBaCrYN8oJNiSWuHZcwdpC45wJq7Sszw=;
  b=NqipQMAZ0bIqN1woaXnam/KMkQWb+ft7pOblDCWAORoblimSzocBDRpe
   71jfAUfr1AXlu/EY+zyBA2W8u530/tLYodJboG0sEfVjLDUClDxKo/bY0
   0jlIOyd9ucqKNhM9CBUweOJU5TmUzsUfqIYD0scRNo88OTl9nYjlnv3d5
   KQUDCM1ZBO729ReMydJGVTOPn5QKoD5jMBfigQt0skfeEdD2EdcZqw700
   WRsz3ekHot8lMy4oZTVHEgpGEA3Twz/zignQZCD0aRn549yENPyJXFKqG
   noaN21lm1ArB7fQDNFHwgsE2Pe7enwZX4V83VJH6UyNj3osfrl4E4Qf6k
   g==;
X-CSE-ConnectionGUID: Ai25cFy2R8KeYNbPEhegHg==
X-CSE-MsgGUID: gOvcKluJSaGELlSw84xwrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="90741090"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="90741090"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 15:26:47 -0800
X-CSE-ConnectionGUID: m7PjwfGTQimrZRhuRxDUuQ==
X-CSE-MsgGUID: jem/RcCCQxm/kacC6kb9qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="190673580"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2025 15:26:46 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK3Bk-0007QR-0B;
	Fri, 14 Nov 2025 23:26:44 +0000
Date: Sat, 15 Nov 2025 07:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 2/9] lib/crypto/mldsa/crypto_mldsa.c:218:13:
 warning: 'dilithium_kernel_alg_exit' defined but not used
Message-ID: <202511150746.J2odmFxR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   a35497b5ca61a0cf5a501e71ef253219ef6c7641
commit: dafb5e49cd9260d248d3aad602c3e8639de1702e [2/9] crypto: Add ML-DSA/Dilithium verify support
config: arc-randconfig-002-20251115 (https://download.01.org/0day-ci/archive/20251115/202511150746.J2odmFxR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150746.J2odmFxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511150746.J2odmFxR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/crypto/mldsa/crypto_mldsa.c:218:13: warning: 'dilithium_kernel_alg_exit' defined but not used [-Wunused-function]
     218 | static void dilithium_kernel_alg_exit(struct crypto_sig *tfm)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/crypto/mldsa/crypto_mldsa.c:213:12: warning: 'dilithium_kernel_alg_init' defined but not used [-Wunused-function]
     213 | static int dilithium_kernel_alg_init(struct crypto_sig *tfm)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/crypto/mldsa/crypto_mldsa.c:198:21: warning: 'dilithium_kernel_max_size' defined but not used [-Wunused-function]
     198 | static unsigned int dilithium_kernel_max_size(struct crypto_sig *tfm)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/crypto/mldsa/crypto_mldsa.c:123:12: warning: 'dilithium_kernel_set_pub_key_int' defined but not used [-Wunused-function]
     123 | static int dilithium_kernel_set_pub_key_int(struct crypto_sig *tfm,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/crypto/mldsa/crypto_mldsa.c:48:12: warning: 'dilithium_kernel_verify' defined but not used [-Wunused-function]
      48 | static int dilithium_kernel_verify(struct crypto_sig *tfm, const void *src,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> lib/crypto/mldsa/crypto_mldsa.c:39:12: warning: 'dilithium_kernel_sign' defined but not used [-Wunused-function]
      39 | static int dilithium_kernel_sign(struct crypto_sig *tfm, const void *src,
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/dilithium_kernel_alg_exit +218 lib/crypto/mldsa/crypto_mldsa.c

    36	
    37	/* src -> message */
    38	/* dst -> signature */
  > 39	static int dilithium_kernel_sign(struct crypto_sig *tfm, const void *src,
    40					 unsigned int slen, void *dst,
    41					 unsigned int dlen)
    42	{
    43		return -EOPNOTSUPP;
    44	}
    45	
    46	/* src -> signature */
    47	/* msg -> message */
  > 48	static int dilithium_kernel_verify(struct crypto_sig *tfm, const void *src,
    49					   unsigned int slen, const void *msg,
    50					   unsigned int msg_len)
    51	{
    52		struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
    53		struct dilithium_sig *sig;
    54		size_t sig_len;
    55		enum dilithium_type type;
    56		int ret;
    57	
    58		if (unlikely(ctx->key_type != dilithium_kernel_key_pk))
    59			return -EINVAL;
    60	
    61		type = dilithium_pk_type(&ctx->pk);
    62		sig_len = dilithium_sig_size(type);
    63		if (slen < sig_len)
    64			return -EINVAL;
    65	
    66		sig = kmalloc(sizeof(struct dilithium_sig), GFP_KERNEL);
    67		if (!sig)
    68			return -ENOMEM;
    69	
    70		ret = dilithium_sig_load(sig, src, sig_len);
    71		if (ret)
    72			goto out;
    73	
    74		ret = dilithium_verify(sig, msg, msg_len, &ctx->pk);
    75	
    76	out:
    77		kfree_sensitive(sig);
    78		return ret;
    79	}
    80	
    81	#ifdef CONFIG_CRYPTO_LIB_MLDSA_87
    82	static unsigned int dilithium_kernel_87_key_size(struct crypto_sig *tfm)
    83	{
    84		struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
    85	
    86		switch (ctx->key_type) {
    87		case dilithium_kernel_key_unset:
    88		case dilithium_kernel_key_pk:
    89		default:
    90			return sizeof(struct dilithium_87_pk);
    91		}
    92	}
    93	#endif
    94	
    95	#ifdef CONFIG_CRYPTO_LIB_MLDSA_65
    96	static unsigned int dilithium_kernel_65_key_size(struct crypto_sig *tfm)
    97	{
    98		struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
    99	
   100		switch (ctx->key_type) {
   101		case dilithium_kernel_key_unset:
   102		case dilithium_kernel_key_pk:
   103		default:
   104			return sizeof(struct dilithium_65_pk);
   105		}
   106	}
   107	#endif
   108	
   109	#ifdef CONFIG_CRYPTO_LIB_MLDSA_44
   110	static unsigned int dilithium_kernel_44_key_size(struct crypto_sig *tfm)
   111	{
   112		struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
   113	
   114		switch (ctx->key_type) {
   115		case dilithium_kernel_key_unset:
   116		case dilithium_kernel_key_pk:
   117		default:
   118			return sizeof(struct dilithium_44_pk);
   119		}
   120	}
   121	#endif
   122	
 > 123	static int dilithium_kernel_set_pub_key_int(struct crypto_sig *tfm,
   124						    const void *key,
   125						    unsigned int keylen,
   126						    enum dilithium_type type)
   127	{
   128		struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
   129		int ret;
   130	
   131		ctx->key_type = dilithium_kernel_key_unset;
   132	
   133		ret = dilithium_pk_load(&ctx->pk, key, keylen);
   134		if (!ret) {
   135			if (dilithium_pk_type(&ctx->pk) != type)
   136				ret = -EOPNOTSUPP;
   137			else
   138				ctx->key_type = dilithium_kernel_key_pk;
   139		}
   140	
   141		return ret;
   142	}
   143	
   144	#ifdef CONFIG_CRYPTO_LIB_MLDSA_44
   145	static int dilithium_kernel_44_set_pub_key(struct crypto_sig *tfm,
   146						   const void *key,
   147						   unsigned int keylen)
   148	{
   149		return dilithium_kernel_set_pub_key_int(tfm, key, keylen, DILITHIUM_44);
   150	}
   151	#endif
   152	
   153	#ifdef CONFIG_CRYPTO_LIB_MLDSA_65
   154	static int dilithium_kernel_65_set_pub_key(struct crypto_sig *tfm,
   155						   const void *key,
   156						   unsigned int keylen)
   157	{
   158		return dilithium_kernel_set_pub_key_int(tfm, key, keylen, DILITHIUM_65);
   159	}
   160	#endif
   161	
   162	#ifdef CONFIG_CRYPTO_LIB_MLDSA_87
   163	static int dilithium_kernel_87_set_pub_key(struct crypto_sig *tfm,
   164						   const void *key,
   165						   unsigned int keylen)
   166	{
   167		return dilithium_kernel_set_pub_key_int(tfm, key, keylen, DILITHIUM_87);
   168	}
   169	#endif
   170	
   171	#ifdef CONFIG_CRYPTO_LIB_MLDSA_44
   172	static int dilithium_kernel_44_set_priv_key(struct crypto_sig *tfm,
   173						    const void *key,
   174						    unsigned int keylen)
   175	{
   176		return -EOPNOTSUPP;
   177	}
   178	#endif
   179	
   180	#ifdef CONFIG_CRYPTO_LIB_MLDSA_65
   181	static int dilithium_kernel_65_set_priv_key(struct crypto_sig *tfm,
   182						    const void *key,
   183						    unsigned int keylen)
   184	{
   185		return -EOPNOTSUPP;
   186	}
   187	#endif
   188	
   189	#ifdef CONFIG_CRYPTO_LIB_MLDSA_87
   190	static int dilithium_kernel_87_set_priv_key(struct crypto_sig *tfm,
   191						    const void *key,
   192						    unsigned int keylen)
   193	{
   194		return -EOPNOTSUPP;
   195	}
   196	#endif
   197	
 > 198	static unsigned int dilithium_kernel_max_size(struct crypto_sig *tfm)
   199	{
   200		struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
   201		enum dilithium_type type;
   202	
   203		switch (ctx->key_type) {
   204		case dilithium_kernel_key_pk:
   205			type = dilithium_pk_type(&ctx->pk);
   206			/* When PK is set, this is a safety valve, result is boolean */
   207			return dilithium_sig_size(type);
   208		default:
   209			return 0;
   210		}
   211	}
   212	
 > 213	static int dilithium_kernel_alg_init(struct crypto_sig *tfm)
   214	{
   215		return 0;
   216	}
   217	
 > 218	static void dilithium_kernel_alg_exit(struct crypto_sig *tfm)
   219	{
   220		struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
   221	
   222		ctx->key_type = dilithium_kernel_key_unset;
   223	}
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
