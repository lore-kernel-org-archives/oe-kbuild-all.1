Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEA517F5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 02:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711247310; cv=none; b=TPG2lR7BDiLpo+AYAeXpmKt5RDAeQWV6PluCAt6eNKi1l8ttF+h8u3w1tMQfIVfGV66pY+AoeL4RdLMlmdu+6clgThFwKpMEJiBqU35/eR9l5aSX7Jc0ObAGblR5td3TbWJtfkTGcsvmGnjNVlochRI1S/+XmcGaVLZ6U/KB5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711247310; c=relaxed/simple;
	bh=sW2ir/v1uBuNF1Y7T1KA9gyA8bVV/Tjqp4LrnvWYsAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bI9XeS/0qsKwaey0zCHvQNDm+UJwToJww2nsdY1Fam1Z9/grs1m1JgvGylqZKlVdCnRnUW8424vqBgutbPqCVhiFQpqao+2dYxjC9d8d/vgDLiRtSyCl+GZesp/XJuarQb8yHKLdHB/wyEBxsj/Oiz8gmzie1vwBUNe3DswW2vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcsvnRP8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcsvnRP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711247307; x=1742783307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sW2ir/v1uBuNF1Y7T1KA9gyA8bVV/Tjqp4LrnvWYsAA=;
  b=NcsvnRP8MVQ8OFVpCQnwnkQmftFw6fBAeTwtrfpqBAdG069ULYJSwNj0
   c41pBN0Dz58bwyF4974vF/Paq93dPYyd7OL4/cBaLqZD6MHX/TWS5BDbV
   m3LRM7Gzgaw0fgbgJdHuJFspcTwg2oUQN0stTidX8L5oyQeAXA538FUA2
   pYbn/2f37jrOIOpxtyfdur1e193oFQL3zLZGDaPVHmfRvyjVBOVDH6Dvr
   WMVFz0sCNAsd9rRpQ+wvSlSEt9AVS5XmXkfdGHeT3twa7yseBD8vbRTJi
   BZNENQJwS0Wb2dOy/pLgc4ibLkbyrS+9ThblB+i3IpzRpiYZO3aXmdG+G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="16816458"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="16816458"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 19:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15362425"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Mar 2024 19:28:23 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roDau-000LcL-2B;
	Sun, 24 Mar 2024 02:28:20 +0000
Date: Sun, 24 Mar 2024 10:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.9-mw1/enable-unsigned-sanitizer 1/1]
 crypto/blake2b_generic.c:70:13: warning: stack frame size (9500) exceeds
 limit (4096) in 'blake2b_compress_one_generic'
Message-ID: <202403241022.pRxrWebU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.9-mw1/enable-unsigned-sanitizer
head:   08baa5a3cbf184794670a8645fadd7dc5584f395
commit: 08baa5a3cbf184794670a8645fadd7dc5584f395 [1/1] ubsan: Reintroduce unsigned overflow sanitizer
config: i386-randconfig-052-20240324 (https://download.01.org/0day-ci/archive/20240324/202403241022.pRxrWebU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241022.pRxrWebU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241022.pRxrWebU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/blake2b_generic.c:70:13: warning: stack frame size (9500) exceeds limit (4096) in 'blake2b_compress_one_generic' [-Wframe-larger-than]
      70 | static void blake2b_compress_one_generic(struct blake2b_state *S,
         |             ^
   1 warning generated.


vim +/blake2b_compress_one_generic +70 crypto/blake2b_generic.c

91d689337fe8b7 David Sterba      2019-10-24   45  
91d689337fe8b7 David Sterba      2019-10-24   46  #define G(r,i,a,b,c,d)                                  \
91d689337fe8b7 David Sterba      2019-10-24   47  	do {                                            \
91d689337fe8b7 David Sterba      2019-10-24   48  		a = a + b + m[blake2b_sigma[r][2*i+0]]; \
91d689337fe8b7 David Sterba      2019-10-24   49  		d = ror64(d ^ a, 32);                   \
91d689337fe8b7 David Sterba      2019-10-24   50  		c = c + d;                              \
91d689337fe8b7 David Sterba      2019-10-24   51  		b = ror64(b ^ c, 24);                   \
91d689337fe8b7 David Sterba      2019-10-24   52  		a = a + b + m[blake2b_sigma[r][2*i+1]]; \
91d689337fe8b7 David Sterba      2019-10-24   53  		d = ror64(d ^ a, 16);                   \
91d689337fe8b7 David Sterba      2019-10-24   54  		c = c + d;                              \
91d689337fe8b7 David Sterba      2019-10-24   55  		b = ror64(b ^ c, 63);                   \
91d689337fe8b7 David Sterba      2019-10-24   56  	} while (0)
91d689337fe8b7 David Sterba      2019-10-24   57  
91d689337fe8b7 David Sterba      2019-10-24   58  #define ROUND(r)                                \
91d689337fe8b7 David Sterba      2019-10-24   59  	do {                                    \
91d689337fe8b7 David Sterba      2019-10-24   60  		G(r,0,v[ 0],v[ 4],v[ 8],v[12]); \
91d689337fe8b7 David Sterba      2019-10-24   61  		G(r,1,v[ 1],v[ 5],v[ 9],v[13]); \
91d689337fe8b7 David Sterba      2019-10-24   62  		G(r,2,v[ 2],v[ 6],v[10],v[14]); \
91d689337fe8b7 David Sterba      2019-10-24   63  		G(r,3,v[ 3],v[ 7],v[11],v[15]); \
91d689337fe8b7 David Sterba      2019-10-24   64  		G(r,4,v[ 0],v[ 5],v[10],v[15]); \
91d689337fe8b7 David Sterba      2019-10-24   65  		G(r,5,v[ 1],v[ 6],v[11],v[12]); \
91d689337fe8b7 David Sterba      2019-10-24   66  		G(r,6,v[ 2],v[ 7],v[ 8],v[13]); \
91d689337fe8b7 David Sterba      2019-10-24   67  		G(r,7,v[ 3],v[ 4],v[ 9],v[14]); \
91d689337fe8b7 David Sterba      2019-10-24   68  	} while (0)
91d689337fe8b7 David Sterba      2019-10-24   69  
28dcca4cc0c01e Eric Biggers      2020-12-23  @70  static void blake2b_compress_one_generic(struct blake2b_state *S,
28dcca4cc0c01e Eric Biggers      2020-12-23   71  					 const u8 block[BLAKE2B_BLOCK_SIZE])
91d689337fe8b7 David Sterba      2019-10-24   72  {
91d689337fe8b7 David Sterba      2019-10-24   73  	u64 m[16];
91d689337fe8b7 David Sterba      2019-10-24   74  	u64 v[16];
91d689337fe8b7 David Sterba      2019-10-24   75  	size_t i;
91d689337fe8b7 David Sterba      2019-10-24   76  
91d689337fe8b7 David Sterba      2019-10-24   77  	for (i = 0; i < 16; ++i)
91d689337fe8b7 David Sterba      2019-10-24   78  		m[i] = get_unaligned_le64(block + i * sizeof(m[i]));
91d689337fe8b7 David Sterba      2019-10-24   79  
91d689337fe8b7 David Sterba      2019-10-24   80  	for (i = 0; i < 8; ++i)
91d689337fe8b7 David Sterba      2019-10-24   81  		v[i] = S->h[i];
91d689337fe8b7 David Sterba      2019-10-24   82  
28dcca4cc0c01e Eric Biggers      2020-12-23   83  	v[ 8] = BLAKE2B_IV0;
28dcca4cc0c01e Eric Biggers      2020-12-23   84  	v[ 9] = BLAKE2B_IV1;
28dcca4cc0c01e Eric Biggers      2020-12-23   85  	v[10] = BLAKE2B_IV2;
28dcca4cc0c01e Eric Biggers      2020-12-23   86  	v[11] = BLAKE2B_IV3;
28dcca4cc0c01e Eric Biggers      2020-12-23   87  	v[12] = BLAKE2B_IV4 ^ S->t[0];
28dcca4cc0c01e Eric Biggers      2020-12-23   88  	v[13] = BLAKE2B_IV5 ^ S->t[1];
28dcca4cc0c01e Eric Biggers      2020-12-23   89  	v[14] = BLAKE2B_IV6 ^ S->f[0];
28dcca4cc0c01e Eric Biggers      2020-12-23   90  	v[15] = BLAKE2B_IV7 ^ S->f[1];
91d689337fe8b7 David Sterba      2019-10-24   91  
91d689337fe8b7 David Sterba      2019-10-24   92  	ROUND(0);
91d689337fe8b7 David Sterba      2019-10-24   93  	ROUND(1);
91d689337fe8b7 David Sterba      2019-10-24   94  	ROUND(2);
91d689337fe8b7 David Sterba      2019-10-24   95  	ROUND(3);
91d689337fe8b7 David Sterba      2019-10-24   96  	ROUND(4);
91d689337fe8b7 David Sterba      2019-10-24   97  	ROUND(5);
91d689337fe8b7 David Sterba      2019-10-24   98  	ROUND(6);
91d689337fe8b7 David Sterba      2019-10-24   99  	ROUND(7);
91d689337fe8b7 David Sterba      2019-10-24  100  	ROUND(8);
91d689337fe8b7 David Sterba      2019-10-24  101  	ROUND(9);
91d689337fe8b7 David Sterba      2019-10-24  102  	ROUND(10);
91d689337fe8b7 David Sterba      2019-10-24  103  	ROUND(11);
0c0408e86dbe8f Arnd Bergmann     2020-05-05  104  #ifdef CONFIG_CC_IS_CLANG
2947a4567f3a79 Nathan Chancellor 2024-01-09  105  #pragma nounroll /* https://llvm.org/pr45803 */
0c0408e86dbe8f Arnd Bergmann     2020-05-05  106  #endif
91d689337fe8b7 David Sterba      2019-10-24  107  	for (i = 0; i < 8; ++i)
91d689337fe8b7 David Sterba      2019-10-24  108  		S->h[i] = S->h[i] ^ v[i] ^ v[i + 8];
91d689337fe8b7 David Sterba      2019-10-24  109  }
91d689337fe8b7 David Sterba      2019-10-24  110  

:::::: The code at line 70 was first introduced by commit
:::::: 28dcca4cc0c01e2467549a36b1b0eacfdb01236c crypto: blake2b - sync with blake2s implementation

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
