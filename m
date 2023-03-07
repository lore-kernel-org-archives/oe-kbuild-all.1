Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E49B321D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678199836; x=1709735836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4d+OZ4rZDZH+w57yCnef19DAjE8XQkUxDHQ54lgY+vY=;
  b=h6CnTHnOjgn3VEwkCkXJZ0VBH0C0lILyq0XKD3gKHrOIzkx/p2GVeI90
   G1OwKTI2FerdQv8Xg1F5304t+YBGbfjPYOmLzKbhO7gyreU4xWaMu22iI
   f2J81hXET6jg5WeMMwfWla50EbUv2yXPcR2PrwPFJ39cAUA0hVm0gO55o
   wmL1o80b1DTyInbicOY0f7l0xxN2VCM4GPiSmF89pr5rLpuS9ZFvf2GfU
   YCLULB3Kyz3G6a6vhe3TF8HCfozUmJAORf/WCF1HS5bwxFrBrlMF3ha+e
   xMv7a9DeYL/LjKD8B1KV6OEtSL8SXBk03ONg9KhtLRYGxdftVjrfuykBw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="335885426"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="335885426"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 06:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800410070"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="800410070"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Mar 2023 06:37:09 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZYRA-0001OV-1p;
	Tue, 07 Mar 2023 14:37:08 +0000
Date: Tue, 7 Mar 2023 22:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.14.y 7741/9999] crypto/twofish_common.c:700:1:
 warning: the frame size of 4952 bytes is larger than 2048 bytes
Message-ID: <202303072243.6AtNtuXD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiko,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   7878a41b6cc1ada4bb804eee96beb2c54322806c
commit: fa4261496d3265009449723859f50f68a27881c1 [7741/9999] init/Kconfig: make COMPILE_TEST depend on !S390
config: s390-randconfig-r002-20230305 (https://download.01.org/0day-ci/archive/20230307/202303072243.6AtNtuXD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=fa4261496d3265009449723859f50f68a27881c1
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.14.y
        git checkout fa4261496d3265009449723859f50f68a27881c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303072243.6AtNtuXD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/twofish_common.c: In function '__twofish_setkey':
>> crypto/twofish_common.c:700:1: warning: the frame size of 4952 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    }
    ^


vim +700 crypto/twofish_common.c

2729bb427f686e4 Joachim Fritschi 2006-06-20  512  
2729bb427f686e4 Joachim Fritschi 2006-06-20  513  #define CALC_SB256_2(i, a, b) \
2729bb427f686e4 Joachim Fritschi 2006-06-20  514     ctx->s[0][i] = mds[0][q0[q0[q1[(b) ^ sa] ^ se] ^ si] ^ sm]; \
2729bb427f686e4 Joachim Fritschi 2006-06-20  515     ctx->s[1][i] = mds[1][q0[q1[q1[(a) ^ sb] ^ sf] ^ sj] ^ sn]; \
2729bb427f686e4 Joachim Fritschi 2006-06-20  516     ctx->s[2][i] = mds[2][q1[q0[q0[(a) ^ sc] ^ sg] ^ sk] ^ so]; \
2729bb427f686e4 Joachim Fritschi 2006-06-20  517     ctx->s[3][i] = mds[3][q1[q1[q0[(b) ^ sd] ^ sh] ^ sl] ^ sp];
2729bb427f686e4 Joachim Fritschi 2006-06-20  518  
2729bb427f686e4 Joachim Fritschi 2006-06-20  519  /* Macros to calculate the whitening and round subkeys.  CALC_K_2 computes the
2729bb427f686e4 Joachim Fritschi 2006-06-20  520   * last two stages of the h() function for a given index (either 2i or 2i+1).
2729bb427f686e4 Joachim Fritschi 2006-06-20  521   * a, b, c, and d are the four bytes going into the last two stages.  For
2729bb427f686e4 Joachim Fritschi 2006-06-20  522   * 128-bit keys, this is the entire h() function and a and c are the index
2729bb427f686e4 Joachim Fritschi 2006-06-20  523   * preprocessed through q0 and q1 respectively; for longer keys they are the
2729bb427f686e4 Joachim Fritschi 2006-06-20  524   * output of previous stages.  j is the index of the first key byte to use.
2729bb427f686e4 Joachim Fritschi 2006-06-20  525   * CALC_K computes a pair of subkeys for 128-bit Twofish, by calling CALC_K_2
2729bb427f686e4 Joachim Fritschi 2006-06-20  526   * twice, doing the Pseudo-Hadamard Transform, and doing the necessary
2729bb427f686e4 Joachim Fritschi 2006-06-20  527   * rotations.  Its parameters are: a, the array to write the results into,
2729bb427f686e4 Joachim Fritschi 2006-06-20  528   * j, the index of the first output entry, k and l, the preprocessed indices
2729bb427f686e4 Joachim Fritschi 2006-06-20  529   * for index 2i, and m and n, the preprocessed indices for index 2i+1.
2729bb427f686e4 Joachim Fritschi 2006-06-20  530   * CALC_K192_2 expands CALC_K_2 to handle 192-bit keys, by doing an
2729bb427f686e4 Joachim Fritschi 2006-06-20  531   * additional lookup-and-XOR stage.  The parameters a, b, c and d are the
2729bb427f686e4 Joachim Fritschi 2006-06-20  532   * four bytes going into the last three stages.  For 192-bit keys, c = d
2729bb427f686e4 Joachim Fritschi 2006-06-20  533   * are the index preprocessed through q0, and a = b are the index
2729bb427f686e4 Joachim Fritschi 2006-06-20  534   * preprocessed through q1; j is the index of the first key byte to use.
2729bb427f686e4 Joachim Fritschi 2006-06-20  535   * CALC_K192 is identical to CALC_K but for using the CALC_K192_2 macro
2729bb427f686e4 Joachim Fritschi 2006-06-20  536   * instead of CALC_K_2.
2729bb427f686e4 Joachim Fritschi 2006-06-20  537   * CALC_K256_2 expands CALC_K192_2 to handle 256-bit keys, by doing an
2729bb427f686e4 Joachim Fritschi 2006-06-20  538   * additional lookup-and-XOR stage.  The parameters a and b are the index
2729bb427f686e4 Joachim Fritschi 2006-06-20  539   * preprocessed through q0 and q1 respectively; j is the index of the first
2729bb427f686e4 Joachim Fritschi 2006-06-20  540   * key byte to use.  CALC_K256 is identical to CALC_K but for using the
2729bb427f686e4 Joachim Fritschi 2006-06-20  541   * CALC_K256_2 macro instead of CALC_K_2. */
2729bb427f686e4 Joachim Fritschi 2006-06-20  542  
2729bb427f686e4 Joachim Fritschi 2006-06-20  543  #define CALC_K_2(a, b, c, d, j) \
2729bb427f686e4 Joachim Fritschi 2006-06-20  544       mds[0][q0[a ^ key[(j) + 8]] ^ key[j]] \
2729bb427f686e4 Joachim Fritschi 2006-06-20  545     ^ mds[1][q0[b ^ key[(j) + 9]] ^ key[(j) + 1]] \
2729bb427f686e4 Joachim Fritschi 2006-06-20  546     ^ mds[2][q1[c ^ key[(j) + 10]] ^ key[(j) + 2]] \
2729bb427f686e4 Joachim Fritschi 2006-06-20  547     ^ mds[3][q1[d ^ key[(j) + 11]] ^ key[(j) + 3]]
2729bb427f686e4 Joachim Fritschi 2006-06-20  548  
2729bb427f686e4 Joachim Fritschi 2006-06-20  549  #define CALC_K(a, j, k, l, m, n) \
2729bb427f686e4 Joachim Fritschi 2006-06-20  550     x = CALC_K_2 (k, l, k, l, 0); \
2729bb427f686e4 Joachim Fritschi 2006-06-20  551     y = CALC_K_2 (m, n, m, n, 4); \
2729bb427f686e4 Joachim Fritschi 2006-06-20  552     y = rol32(y, 8); \
2729bb427f686e4 Joachim Fritschi 2006-06-20  553     x += y; y += x; ctx->a[j] = x; \
2729bb427f686e4 Joachim Fritschi 2006-06-20  554     ctx->a[(j) + 1] = rol32(y, 9)
2729bb427f686e4 Joachim Fritschi 2006-06-20  555  
2729bb427f686e4 Joachim Fritschi 2006-06-20  556  #define CALC_K192_2(a, b, c, d, j) \
2729bb427f686e4 Joachim Fritschi 2006-06-20  557     CALC_K_2 (q0[a ^ key[(j) + 16]], \
2729bb427f686e4 Joachim Fritschi 2006-06-20  558  	     q1[b ^ key[(j) + 17]], \
2729bb427f686e4 Joachim Fritschi 2006-06-20  559  	     q0[c ^ key[(j) + 18]], \
2729bb427f686e4 Joachim Fritschi 2006-06-20  560  	     q1[d ^ key[(j) + 19]], j)
2729bb427f686e4 Joachim Fritschi 2006-06-20  561  
2729bb427f686e4 Joachim Fritschi 2006-06-20  562  #define CALC_K192(a, j, k, l, m, n) \
2729bb427f686e4 Joachim Fritschi 2006-06-20  563     x = CALC_K192_2 (l, l, k, k, 0); \
2729bb427f686e4 Joachim Fritschi 2006-06-20  564     y = CALC_K192_2 (n, n, m, m, 4); \
2729bb427f686e4 Joachim Fritschi 2006-06-20  565     y = rol32(y, 8); \
2729bb427f686e4 Joachim Fritschi 2006-06-20  566     x += y; y += x; ctx->a[j] = x; \
2729bb427f686e4 Joachim Fritschi 2006-06-20  567     ctx->a[(j) + 1] = rol32(y, 9)
2729bb427f686e4 Joachim Fritschi 2006-06-20  568  
2729bb427f686e4 Joachim Fritschi 2006-06-20  569  #define CALC_K256_2(a, b, j) \
2729bb427f686e4 Joachim Fritschi 2006-06-20  570     CALC_K192_2 (q1[b ^ key[(j) + 24]], \
2729bb427f686e4 Joachim Fritschi 2006-06-20  571  	        q1[a ^ key[(j) + 25]], \
2729bb427f686e4 Joachim Fritschi 2006-06-20  572  	        q0[a ^ key[(j) + 26]], \
2729bb427f686e4 Joachim Fritschi 2006-06-20  573  	        q0[b ^ key[(j) + 27]], j)
2729bb427f686e4 Joachim Fritschi 2006-06-20  574  
2729bb427f686e4 Joachim Fritschi 2006-06-20  575  #define CALC_K256(a, j, k, l, m, n) \
2729bb427f686e4 Joachim Fritschi 2006-06-20  576     x = CALC_K256_2 (k, l, 0); \
2729bb427f686e4 Joachim Fritschi 2006-06-20  577     y = CALC_K256_2 (m, n, 4); \
2729bb427f686e4 Joachim Fritschi 2006-06-20  578     y = rol32(y, 8); \
2729bb427f686e4 Joachim Fritschi 2006-06-20  579     x += y; y += x; ctx->a[j] = x; \
2729bb427f686e4 Joachim Fritschi 2006-06-20  580     ctx->a[(j) + 1] = rol32(y, 9)
2729bb427f686e4 Joachim Fritschi 2006-06-20  581  
2729bb427f686e4 Joachim Fritschi 2006-06-20  582  /* Perform the key setup. */
81559f9ad3d88c0 Jussi Kivilinna  2011-10-18  583  int __twofish_setkey(struct twofish_ctx *ctx, const u8 *key,
81559f9ad3d88c0 Jussi Kivilinna  2011-10-18  584  		     unsigned int key_len, u32 *flags)
2729bb427f686e4 Joachim Fritschi 2006-06-20  585  {
2729bb427f686e4 Joachim Fritschi 2006-06-20  586  	int i, j, k;
2729bb427f686e4 Joachim Fritschi 2006-06-20  587  
2729bb427f686e4 Joachim Fritschi 2006-06-20  588  	/* Temporaries for CALC_K. */
2729bb427f686e4 Joachim Fritschi 2006-06-20  589  	u32 x, y;
2729bb427f686e4 Joachim Fritschi 2006-06-20  590  
2729bb427f686e4 Joachim Fritschi 2006-06-20  591  	/* The S vector used to key the S-boxes, split up into individual bytes.
2729bb427f686e4 Joachim Fritschi 2006-06-20  592  	 * 128-bit keys use only sa through sh; 256-bit use all of them. */
2729bb427f686e4 Joachim Fritschi 2006-06-20  593  	u8 sa = 0, sb = 0, sc = 0, sd = 0, se = 0, sf = 0, sg = 0, sh = 0;
2729bb427f686e4 Joachim Fritschi 2006-06-20  594  	u8 si = 0, sj = 0, sk = 0, sl = 0, sm = 0, sn = 0, so = 0, sp = 0;
2729bb427f686e4 Joachim Fritschi 2006-06-20  595  
2729bb427f686e4 Joachim Fritschi 2006-06-20  596  	/* Temporary for CALC_S. */
2729bb427f686e4 Joachim Fritschi 2006-06-20  597  	u8 tmp;
2729bb427f686e4 Joachim Fritschi 2006-06-20  598  
2729bb427f686e4 Joachim Fritschi 2006-06-20  599  	/* Check key length. */
560c06ae1ab7c67 Herbert Xu       2006-08-13  600  	if (key_len % 8)
2729bb427f686e4 Joachim Fritschi 2006-06-20  601  	{
2729bb427f686e4 Joachim Fritschi 2006-06-20  602  		*flags |= CRYPTO_TFM_RES_BAD_KEY_LEN;
2729bb427f686e4 Joachim Fritschi 2006-06-20  603  		return -EINVAL; /* unsupported key length */
2729bb427f686e4 Joachim Fritschi 2006-06-20  604  	}
2729bb427f686e4 Joachim Fritschi 2006-06-20  605  
2729bb427f686e4 Joachim Fritschi 2006-06-20  606  	/* Compute the first two words of the S vector.  The magic numbers are
2729bb427f686e4 Joachim Fritschi 2006-06-20  607  	 * the entries of the RS matrix, preprocessed through poly_to_exp. The
2729bb427f686e4 Joachim Fritschi 2006-06-20  608  	 * numbers in the comments are the original (polynomial form) matrix
2729bb427f686e4 Joachim Fritschi 2006-06-20  609  	 * entries. */
2729bb427f686e4 Joachim Fritschi 2006-06-20  610  	CALC_S (sa, sb, sc, sd, 0, 0x00, 0x2D, 0x01, 0x2D); /* 01 A4 02 A4 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  611  	CALC_S (sa, sb, sc, sd, 1, 0x2D, 0xA4, 0x44, 0x8A); /* A4 56 A1 55 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  612  	CALC_S (sa, sb, sc, sd, 2, 0x8A, 0xD5, 0xBF, 0xD1); /* 55 82 FC 87 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  613  	CALC_S (sa, sb, sc, sd, 3, 0xD1, 0x7F, 0x3D, 0x99); /* 87 F3 C1 5A */
2729bb427f686e4 Joachim Fritschi 2006-06-20  614  	CALC_S (sa, sb, sc, sd, 4, 0x99, 0x46, 0x66, 0x96); /* 5A 1E 47 58 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  615  	CALC_S (sa, sb, sc, sd, 5, 0x96, 0x3C, 0x5B, 0xED); /* 58 C6 AE DB */
2729bb427f686e4 Joachim Fritschi 2006-06-20  616  	CALC_S (sa, sb, sc, sd, 6, 0xED, 0x37, 0x4F, 0xE0); /* DB 68 3D 9E */
2729bb427f686e4 Joachim Fritschi 2006-06-20  617  	CALC_S (sa, sb, sc, sd, 7, 0xE0, 0xD0, 0x8C, 0x17); /* 9E E5 19 03 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  618  	CALC_S (se, sf, sg, sh, 8, 0x00, 0x2D, 0x01, 0x2D); /* 01 A4 02 A4 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  619  	CALC_S (se, sf, sg, sh, 9, 0x2D, 0xA4, 0x44, 0x8A); /* A4 56 A1 55 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  620  	CALC_S (se, sf, sg, sh, 10, 0x8A, 0xD5, 0xBF, 0xD1); /* 55 82 FC 87 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  621  	CALC_S (se, sf, sg, sh, 11, 0xD1, 0x7F, 0x3D, 0x99); /* 87 F3 C1 5A */
2729bb427f686e4 Joachim Fritschi 2006-06-20  622  	CALC_S (se, sf, sg, sh, 12, 0x99, 0x46, 0x66, 0x96); /* 5A 1E 47 58 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  623  	CALC_S (se, sf, sg, sh, 13, 0x96, 0x3C, 0x5B, 0xED); /* 58 C6 AE DB */
2729bb427f686e4 Joachim Fritschi 2006-06-20  624  	CALC_S (se, sf, sg, sh, 14, 0xED, 0x37, 0x4F, 0xE0); /* DB 68 3D 9E */
2729bb427f686e4 Joachim Fritschi 2006-06-20  625  	CALC_S (se, sf, sg, sh, 15, 0xE0, 0xD0, 0x8C, 0x17); /* 9E E5 19 03 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  626  
2729bb427f686e4 Joachim Fritschi 2006-06-20  627  	if (key_len == 24 || key_len == 32) { /* 192- or 256-bit key */
2729bb427f686e4 Joachim Fritschi 2006-06-20  628  		/* Calculate the third word of the S vector */
2729bb427f686e4 Joachim Fritschi 2006-06-20  629  		CALC_S (si, sj, sk, sl, 16, 0x00, 0x2D, 0x01, 0x2D); /* 01 A4 02 A4 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  630  		CALC_S (si, sj, sk, sl, 17, 0x2D, 0xA4, 0x44, 0x8A); /* A4 56 A1 55 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  631  		CALC_S (si, sj, sk, sl, 18, 0x8A, 0xD5, 0xBF, 0xD1); /* 55 82 FC 87 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  632  		CALC_S (si, sj, sk, sl, 19, 0xD1, 0x7F, 0x3D, 0x99); /* 87 F3 C1 5A */
2729bb427f686e4 Joachim Fritschi 2006-06-20  633  		CALC_S (si, sj, sk, sl, 20, 0x99, 0x46, 0x66, 0x96); /* 5A 1E 47 58 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  634  		CALC_S (si, sj, sk, sl, 21, 0x96, 0x3C, 0x5B, 0xED); /* 58 C6 AE DB */
2729bb427f686e4 Joachim Fritschi 2006-06-20  635  		CALC_S (si, sj, sk, sl, 22, 0xED, 0x37, 0x4F, 0xE0); /* DB 68 3D 9E */
2729bb427f686e4 Joachim Fritschi 2006-06-20  636  		CALC_S (si, sj, sk, sl, 23, 0xE0, 0xD0, 0x8C, 0x17); /* 9E E5 19 03 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  637  	}
2729bb427f686e4 Joachim Fritschi 2006-06-20  638  
2729bb427f686e4 Joachim Fritschi 2006-06-20  639  	if (key_len == 32) { /* 256-bit key */
2729bb427f686e4 Joachim Fritschi 2006-06-20  640  		/* Calculate the fourth word of the S vector */
2729bb427f686e4 Joachim Fritschi 2006-06-20  641  		CALC_S (sm, sn, so, sp, 24, 0x00, 0x2D, 0x01, 0x2D); /* 01 A4 02 A4 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  642  		CALC_S (sm, sn, so, sp, 25, 0x2D, 0xA4, 0x44, 0x8A); /* A4 56 A1 55 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  643  		CALC_S (sm, sn, so, sp, 26, 0x8A, 0xD5, 0xBF, 0xD1); /* 55 82 FC 87 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  644  		CALC_S (sm, sn, so, sp, 27, 0xD1, 0x7F, 0x3D, 0x99); /* 87 F3 C1 5A */
2729bb427f686e4 Joachim Fritschi 2006-06-20  645  		CALC_S (sm, sn, so, sp, 28, 0x99, 0x46, 0x66, 0x96); /* 5A 1E 47 58 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  646  		CALC_S (sm, sn, so, sp, 29, 0x96, 0x3C, 0x5B, 0xED); /* 58 C6 AE DB */
2729bb427f686e4 Joachim Fritschi 2006-06-20  647  		CALC_S (sm, sn, so, sp, 30, 0xED, 0x37, 0x4F, 0xE0); /* DB 68 3D 9E */
2729bb427f686e4 Joachim Fritschi 2006-06-20  648  		CALC_S (sm, sn, so, sp, 31, 0xE0, 0xD0, 0x8C, 0x17); /* 9E E5 19 03 */
2729bb427f686e4 Joachim Fritschi 2006-06-20  649  
2729bb427f686e4 Joachim Fritschi 2006-06-20  650  		/* Compute the S-boxes. */
2729bb427f686e4 Joachim Fritschi 2006-06-20  651  		for ( i = j = 0, k = 1; i < 256; i++, j += 2, k += 2 ) {
2729bb427f686e4 Joachim Fritschi 2006-06-20  652  			CALC_SB256_2( i, calc_sb_tbl[j], calc_sb_tbl[k] );
2729bb427f686e4 Joachim Fritschi 2006-06-20  653  		}
2729bb427f686e4 Joachim Fritschi 2006-06-20  654  
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  655  		/* CALC_K256/CALC_K192/CALC_K loops were unrolled.
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  656  		 * Unrolling produced x2.5 more code (+18k on i386),
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  657  		 * and speeded up key setup by 7%:
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  658  		 * unrolled: twofish_setkey/sec: 41128
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  659  		 *     loop: twofish_setkey/sec: 38148
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  660  		 * CALC_K256: ~100 insns each
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  661  		 * CALC_K192: ~90 insns
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  662  		 *    CALC_K: ~70 insns
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  663  		 */
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  664  		/* Calculate whitening and round subkeys */
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  665  		for ( i = 0; i < 8; i += 2 ) {
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  666  			CALC_K256 (w, i, q0[i], q1[i], q0[i+1], q1[i+1]);
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  667  		}
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  668  		for ( i = 0; i < 32; i += 2 ) {
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  669  			CALC_K256 (k, i, q0[i+8], q1[i+8], q0[i+9], q1[i+9]);
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  670  		}
2729bb427f686e4 Joachim Fritschi 2006-06-20  671  	} else if (key_len == 24) { /* 192-bit key */
2729bb427f686e4 Joachim Fritschi 2006-06-20  672  		/* Compute the S-boxes. */
2729bb427f686e4 Joachim Fritschi 2006-06-20  673  		for ( i = j = 0, k = 1; i < 256; i++, j += 2, k += 2 ) {
2729bb427f686e4 Joachim Fritschi 2006-06-20  674  		        CALC_SB192_2( i, calc_sb_tbl[j], calc_sb_tbl[k] );
2729bb427f686e4 Joachim Fritschi 2006-06-20  675  		}
2729bb427f686e4 Joachim Fritschi 2006-06-20  676  
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  677  		/* Calculate whitening and round subkeys */
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  678  		for ( i = 0; i < 8; i += 2 ) {
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  679  			CALC_K192 (w, i, q0[i], q1[i], q0[i+1], q1[i+1]);
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  680  		}
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  681  		for ( i = 0; i < 32; i += 2 ) {
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  682  			CALC_K192 (k, i, q0[i+8], q1[i+8], q0[i+9], q1[i+9]);
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  683  		}
2729bb427f686e4 Joachim Fritschi 2006-06-20  684  	} else { /* 128-bit key */
2729bb427f686e4 Joachim Fritschi 2006-06-20  685  		/* Compute the S-boxes. */
2729bb427f686e4 Joachim Fritschi 2006-06-20  686  		for ( i = j = 0, k = 1; i < 256; i++, j += 2, k += 2 ) {
2729bb427f686e4 Joachim Fritschi 2006-06-20  687  			CALC_SB_2( i, calc_sb_tbl[j], calc_sb_tbl[k] );
2729bb427f686e4 Joachim Fritschi 2006-06-20  688  		}
2729bb427f686e4 Joachim Fritschi 2006-06-20  689  
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  690  		/* Calculate whitening and round subkeys */
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  691  		for ( i = 0; i < 8; i += 2 ) {
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  692  			CALC_K (w, i, q0[i], q1[i], q0[i+1], q1[i+1]);
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  693  		}
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  694  		for ( i = 0; i < 32; i += 2 ) {
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  695  			CALC_K (k, i, q0[i+8], q1[i+8], q0[i+9], q1[i+9]);
e2b21b5002a2bf2 Denys Vlasenko   2007-10-26  696  		}
2729bb427f686e4 Joachim Fritschi 2006-06-20  697  	}
2729bb427f686e4 Joachim Fritschi 2006-06-20  698  
2729bb427f686e4 Joachim Fritschi 2006-06-20  699  	return 0;
2729bb427f686e4 Joachim Fritschi 2006-06-20 @700  }
81559f9ad3d88c0 Jussi Kivilinna  2011-10-18  701  EXPORT_SYMBOL_GPL(__twofish_setkey);
2729bb427f686e4 Joachim Fritschi 2006-06-20  702  

:::::: The code at line 700 was first introduced by commit
:::::: 2729bb427f686e47970406d6bde6b11892885f29 [CRYPTO] twofish: Split out common c code

:::::: TO: Joachim Fritschi <jfritschi@freenet.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
