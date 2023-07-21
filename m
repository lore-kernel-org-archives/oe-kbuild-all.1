Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F921FB50
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689963460; x=1721499460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBZI4Xuc7dfxaVVp6yKu7UXidXezJkmM8XpeeYsjEg4=;
  b=ikOQ623nV2TFuFyZHyiwqDP74tgREzDFG0FMGyvX44uisLSUrYNTYb34
   M12a3HkLintNy8jdSXxoSZVBgYsxZf3MauLkFDsqCQIkFfWRZhLpfqJQA
   ECqD5dXI6PIaLxh2m/kfRHt1hqsaYBg6OVUednqoxECf1+YlRY8Yzyh6Z
   0Hmwk6bziiyFGf1K7y4yV9WCpAQwErV8hKPQHgTIR1OopPDof2fkAMTxt
   iGdfGDMyTtliJ346tOFLfH9Vy3Mzrnaaar03eVD9km3i9f1YDSquVLJWN
   3kv41tmbGSz1PjYxeEaozEipt8MTnr5eriyI0uw/NfOkBjjwHRSZFo9OI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="364548536"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="364548536"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 11:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795043612"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="795043612"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 11:17:38 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMuh7-0007Wj-1r;
	Fri, 21 Jul 2023 18:17:37 +0000
Date: Sat, 22 Jul 2023 02:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 3/11] crypto/ecdsa.c:162:23: error: 'struct
 akcipher_request' has no member named 'encoding'
Message-ID: <202307220243.iaX2Axu9-lkp@intel.com>
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
config: arc-randconfig-r043-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220243.iaX2Axu9-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220243.iaX2Axu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220243.iaX2Axu9-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/ecdsa.c: In function 'ecdsa_verify':
>> crypto/ecdsa.c:162:23: error: 'struct akcipher_request' has no member named 'encoding'
     162 |         if (strcmp(req->encoding, "x962") == 0) {
         |                       ^~
   crypto/ecdsa.c:167:30: error: 'struct akcipher_request' has no member named 'encoding'
     167 |         } else if (strcmp(req->encoding, "p1363") == 0 &&
         |                              ^~


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
