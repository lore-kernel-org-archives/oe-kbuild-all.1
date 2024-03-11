Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC4D52F70
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 17:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710177897; cv=none; b=XFdNJisHVCuTeu7ofBZFR6W6VQYxzcOVtaRrlLbra4zpGIaQtRNpbDU4f/b6hmoO3H8zVpoF8XB5heDK/0NOHLaKc8Mpfrj5/Tvo1Wd9w5wCkuDWmjzZMCkSscd/FsUj/jbGHH0P+iSBv/KyP46WNhm3QEYWwGfvbLzflLCfmCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710177897; c=relaxed/simple;
	bh=xsKW+UwYyQMFNAuH9gJ9ejF3/G6+4Q6ID+5rFrYcTHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mqQ7PSZbBIabF2My9vlMYOY7aPUZfcRDd78cFHpuLdBy5bG8eNYljq+CCJP2N4VWJgZj0CkbzBY9KQONTi8aONCDEAdi3nLar/FPyGd1uqoVgNUGFtnLRmdw5eVbVp7V5XYJOTmBlNX8v2hWOFIMpXrpN/xSo3PMf+akA0zYW3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrtWgPZH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrtWgPZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710177895; x=1741713895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xsKW+UwYyQMFNAuH9gJ9ejF3/G6+4Q6ID+5rFrYcTHk=;
  b=DrtWgPZH+MQ0v/nBRSCDnnDizYpbut18JPOSCCQAw3Z2rqjkNKAqGwah
   NQEipbmCAKDQ4Fi0LbehWMJp9QM/l57rEpjQC/oX1q98fJVRd7hbOWKt7
   ICHi7ACbCv5zml0CtJOByK/OSC51X32cgnqsVzMtFpJd2y9CcEo8gVz0D
   CqGxvFqRXSSKg8VSUVWjbsO16c8+s9dYqH9soboTeCU25wg0hFBU0/FjE
   ZBuVbOv5XYCdtUkTqNVlZhwJgS4IdGSgFXK9xh1OEE2rIuCdDrS8Z/KOL
   HoaJ3/C6udMA5WI22ejCkufXuMGSCeB6vnEMZOeDpGpNL3psy4vu0pKAf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8671575"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8671575"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 10:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="15815027"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2024 10:24:53 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjjOM-0009Jt-21;
	Mon, 11 Mar 2024 17:24:50 +0000
Date: Tue, 12 Mar 2024 01:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future-before-eventlog 24/34] crypto/ecdsa.c:168:26:
 error: use of undeclared identifier 'keylen'
Message-ID: <202403120134.PjPZMbIw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/l1k/linux spdm-future-before-eventlog
head:   fde830bd8ee973e5acff536fac518cf4bdb59714
commit: b1f6bc235c339a809e75744eddd2dbd4ef97dfe3 [24/34] crypto: ecdsa - Rename keylen to bufsize where necessary
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240312/202403120134.PjPZMbIw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120134.PjPZMbIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120134.PjPZMbIw-lkp@intel.com/

Note: the l1k/spdm-future-before-eventlog HEAD fde830bd8ee973e5acff536fac518cf4bdb59714 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from crypto/ecdsa.c:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from crypto/ecdsa.c:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from crypto/ecdsa.c:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from crypto/ecdsa.c:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> crypto/ecdsa.c:168:26: error: use of undeclared identifier 'keylen'
     168 |                    req->src_len == 2 * keylen) {
         |                                        ^
   crypto/ecdsa.c:170:27: error: use of undeclared identifier 'keylen'
     170 |                 ecc_swap_digits(&buffer[keylen], sig_ctx.s,
         |                                         ^
   7 warnings and 2 errors generated.


vim +/keylen +168 crypto/ecdsa.c

4e6602916bc692 Stefan Berger 2021-03-16  133  
4e6602916bc692 Stefan Berger 2021-03-16  134  /*
4e6602916bc692 Stefan Berger 2021-03-16  135   * Verify an ECDSA signature.
4e6602916bc692 Stefan Berger 2021-03-16  136   */
4e6602916bc692 Stefan Berger 2021-03-16  137  static int ecdsa_verify(struct akcipher_request *req)
4e6602916bc692 Stefan Berger 2021-03-16  138  {
4e6602916bc692 Stefan Berger 2021-03-16  139  	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
4e6602916bc692 Stefan Berger 2021-03-16  140  	struct ecc_ctx *ctx = akcipher_tfm_ctx(tfm);
b1f6bc235c339a Stefan Berger 2024-03-06  141  	size_t bufsize = ctx->curve->g.ndigits * sizeof(u64);
4e6602916bc692 Stefan Berger 2021-03-16  142  	struct ecdsa_signature_ctx sig_ctx = {
4e6602916bc692 Stefan Berger 2021-03-16  143  		.curve = ctx->curve,
4e6602916bc692 Stefan Berger 2021-03-16  144  	};
4e6602916bc692 Stefan Berger 2021-03-16  145  	u8 rawhash[ECC_MAX_BYTES];
4e6602916bc692 Stefan Berger 2021-03-16  146  	u64 hash[ECC_MAX_DIGITS];
4e6602916bc692 Stefan Berger 2021-03-16  147  	unsigned char *buffer;
4e6602916bc692 Stefan Berger 2021-03-16  148  	ssize_t diff;
4e6602916bc692 Stefan Berger 2021-03-16  149  	int ret;
4e6602916bc692 Stefan Berger 2021-03-16  150  
4e6602916bc692 Stefan Berger 2021-03-16  151  	if (unlikely(!ctx->pub_key_set))
4e6602916bc692 Stefan Berger 2021-03-16  152  		return -EINVAL;
4e6602916bc692 Stefan Berger 2021-03-16  153  
4e6602916bc692 Stefan Berger 2021-03-16  154  	buffer = kmalloc(req->src_len + req->dst_len, GFP_KERNEL);
4e6602916bc692 Stefan Berger 2021-03-16  155  	if (!buffer)
4e6602916bc692 Stefan Berger 2021-03-16  156  		return -ENOMEM;
4e6602916bc692 Stefan Berger 2021-03-16  157  
4e6602916bc692 Stefan Berger 2021-03-16  158  	sg_pcopy_to_buffer(req->src,
4e6602916bc692 Stefan Berger 2021-03-16  159  		sg_nents_for_len(req->src, req->src_len + req->dst_len),
4e6602916bc692 Stefan Berger 2021-03-16  160  		buffer, req->src_len + req->dst_len, 0);
4e6602916bc692 Stefan Berger 2021-03-16  161  
44fef4022d2ba0 Lukas Wunner  2023-07-02  162  	if (strcmp(req->enc, "x962") == 0) {
4e6602916bc692 Stefan Berger 2021-03-16  163  		ret = asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx,
4e6602916bc692 Stefan Berger 2021-03-16  164  				       buffer, req->src_len);
4e6602916bc692 Stefan Berger 2021-03-16  165  		if (ret < 0)
4e6602916bc692 Stefan Berger 2021-03-16  166  			goto error;
44fef4022d2ba0 Lukas Wunner  2023-07-02  167  	} else if (strcmp(req->enc, "p1363") == 0 &&
44fef4022d2ba0 Lukas Wunner  2023-07-02 @168  		   req->src_len == 2 * keylen) {
44fef4022d2ba0 Lukas Wunner  2023-07-02  169  		ecc_swap_digits(buffer, sig_ctx.r, ctx->curve->g.ndigits);
44fef4022d2ba0 Lukas Wunner  2023-07-02  170  		ecc_swap_digits(&buffer[keylen], sig_ctx.s,
44fef4022d2ba0 Lukas Wunner  2023-07-02  171  				ctx->curve->g.ndigits);
44fef4022d2ba0 Lukas Wunner  2023-07-02  172  	} else {
44fef4022d2ba0 Lukas Wunner  2023-07-02  173  		ret = -EINVAL;
44fef4022d2ba0 Lukas Wunner  2023-07-02  174  		goto error;
44fef4022d2ba0 Lukas Wunner  2023-07-02  175  	}
4e6602916bc692 Stefan Berger 2021-03-16  176  
4e6602916bc692 Stefan Berger 2021-03-16  177  	/* if the hash is shorter then we will add leading zeros to fit to ndigits */
b1f6bc235c339a Stefan Berger 2024-03-06  178  	diff = bufsize - req->dst_len;
4e6602916bc692 Stefan Berger 2021-03-16  179  	if (diff >= 0) {
4e6602916bc692 Stefan Berger 2021-03-16  180  		if (diff)
4e6602916bc692 Stefan Berger 2021-03-16  181  			memset(rawhash, 0, diff);
4e6602916bc692 Stefan Berger 2021-03-16  182  		memcpy(&rawhash[diff], buffer + req->src_len, req->dst_len);
4e6602916bc692 Stefan Berger 2021-03-16  183  	} else if (diff < 0) {
4e6602916bc692 Stefan Berger 2021-03-16  184  		/* given hash is longer, we take the left-most bytes */
b1f6bc235c339a Stefan Berger 2024-03-06  185  		memcpy(&rawhash, buffer + req->src_len, bufsize);
4e6602916bc692 Stefan Berger 2021-03-16  186  	}
4e6602916bc692 Stefan Berger 2021-03-16  187  
4e6602916bc692 Stefan Berger 2021-03-16  188  	ecc_swap_digits((u64 *)rawhash, hash, ctx->curve->g.ndigits);
4e6602916bc692 Stefan Berger 2021-03-16  189  
4e6602916bc692 Stefan Berger 2021-03-16  190  	ret = _ecdsa_verify(ctx, hash, sig_ctx.r, sig_ctx.s);
4e6602916bc692 Stefan Berger 2021-03-16  191  
4e6602916bc692 Stefan Berger 2021-03-16  192  error:
4e6602916bc692 Stefan Berger 2021-03-16  193  	kfree(buffer);
4e6602916bc692 Stefan Berger 2021-03-16  194  
4e6602916bc692 Stefan Berger 2021-03-16  195  	return ret;
4e6602916bc692 Stefan Berger 2021-03-16  196  }
4e6602916bc692 Stefan Berger 2021-03-16  197  

:::::: The code at line 168 was first introduced by commit
:::::: 44fef4022d2ba0bfb622127c51a6999ee9bcd0a7 crypto: ecdsa - Support P1363 signature encoding

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
