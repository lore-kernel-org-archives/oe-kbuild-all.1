Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F2727F00
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 16:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689958480; x=1721494480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ulc+EXTSVMlJaRetSduXGKAUlW3KBcgPrGgFbOk6BSg=;
  b=FD+R21IO96oEuADL82GO397HAJ/t+8MPvsCGzZrEzGPaUSvC+pokYiEf
   UKVQ83Vkbwwk3W5m8vblCh4STAb02/5ynaBED22AnRymY9Os6JQrQpoho
   tO9p9MSon13tKP8kGMae3wxiieoyWMVA+YKKyIAzf0woUFzCfJ25IG4Yp
   0U6pKyAlCCamL1IZeSy7nhz6Wa9RZROQxwQz7RRt194/zdHe4VmtNMwe1
   V3LhKUG/iIyTvkL+lAhkoYfBTAqNJkAzZdmF/ME10uwym6jiS3Kq6C8pb
   g+ApIIMxEV8fM61BA51KzJDOJHT6k0PqNoEf1Uf1oFBrxgHplqureynRK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347359170"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="347359170"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 09:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795020301"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="795020301"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 09:54:35 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMtOk-0007T1-2k;
	Fri, 21 Jul 2023 16:54:34 +0000
Date: Sat, 22 Jul 2023 00:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 3/11] crypto/ecdsa.c:162:18: error: no member named
 'encoding' in 'struct akcipher_request'
Message-ID: <202307220026.iT7elEi8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   96a0cfd9d2e825f7d0e1c537a000bdb500a57884
commit: 2cd97b5433685c1115bd618dd054d7413f838ed0 [3/11] crypto: ecdsa - Support P1363 signature encoding
config: s390-randconfig-r015-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220026.iT7elEi8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220026.iT7elEi8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220026.iT7elEi8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from crypto/ecdsa.c:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from crypto/ecdsa.c:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from crypto/ecdsa.c:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> crypto/ecdsa.c:162:18: error: no member named 'encoding' in 'struct akcipher_request'
     162 |         if (strcmp(req->encoding, "x962") == 0) {
         |                    ~~~  ^
   crypto/ecdsa.c:167:25: error: no member named 'encoding' in 'struct akcipher_request'
     167 |         } else if (strcmp(req->encoding, "p1363") == 0 &&
         |                           ~~~  ^
   12 warnings and 2 errors generated.


vim +162 crypto/ecdsa.c

   133	
   134	/*
   135	 * Verify an ECDSA signature.
   136	 */
   137	static int ecdsa_verify(struct akcipher_request *req)
   138	{
   139		struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
   140		struct ecc_ctx *ctx = akcipher_tfm_ctx(tfm);
   141		size_t keylen = ctx->curve->g.ndigits * sizeof(u64);
   142		struct ecdsa_signature_ctx sig_ctx = {
   143			.curve = ctx->curve,
   144		};
   145		u8 rawhash[ECC_MAX_BYTES];
   146		u64 hash[ECC_MAX_DIGITS];
   147		unsigned char *buffer;
   148		ssize_t diff;
   149		int ret;
   150	
   151		if (unlikely(!ctx->pub_key_set))
   152			return -EINVAL;
   153	
   154		buffer = kmalloc(req->src_len + req->dst_len, GFP_KERNEL);
   155		if (!buffer)
   156			return -ENOMEM;
   157	
   158		sg_pcopy_to_buffer(req->src,
   159			sg_nents_for_len(req->src, req->src_len + req->dst_len),
   160			buffer, req->src_len + req->dst_len, 0);
   161	
 > 162		if (strcmp(req->encoding, "x962") == 0) {
   163			ret = asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx,
   164					       buffer, req->src_len);
   165			if (ret < 0)
   166				goto error;
   167		} else if (strcmp(req->encoding, "p1363") == 0 &&
   168			   req->src_len == 2 * keylen) {
   169			ecc_swap_digits(buffer, sig_ctx.r, ctx->curve->g.ndigits);
   170			ecc_swap_digits(buffer + keylen,
   171						sig_ctx.s, ctx->curve->g.ndigits);
   172		} else {
   173			ret = -EINVAL;
   174			goto error;
   175		}
   176	
   177		/* if the hash is shorter then we will add leading zeros to fit to ndigits */
   178		diff = keylen - req->dst_len;
   179		if (diff >= 0) {
   180			if (diff)
   181				memset(rawhash, 0, diff);
   182			memcpy(&rawhash[diff], buffer + req->src_len, req->dst_len);
   183		} else if (diff < 0) {
   184			/* given hash is longer, we take the left-most bytes */
   185			memcpy(&rawhash, buffer + req->src_len, keylen);
   186		}
   187	
   188		ecc_swap_digits((u64 *)rawhash, hash, ctx->curve->g.ndigits);
   189	
   190		ret = _ecdsa_verify(ctx, hash, sig_ctx.r, sig_ctx.s);
   191	
   192	error:
   193		kfree(buffer);
   194	
   195		return ret;
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
