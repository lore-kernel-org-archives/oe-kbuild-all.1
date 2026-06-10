Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25501F3D56
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 02:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781057881; cv=none; b=pwVnzVmZZD4przq3GgEukkIKk298WbRYUSk7t4SAmkJE4T9h3UboedHNP4B6LSGbuE+A75lWZgCRAU6Er/t3GYO4lSIAellNFaRpaWAiNggz7SrX6lv8L+sTD8NGPpg4wASE+FWxjjWTQfWToBfmB/kAEOfSjf4zCCZrSozOZMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781057881; c=relaxed/simple;
	bh=MltHAS7O3NlAQlkfwxXifPVwrPfdIhQ/rzDwqd6nSao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sznaz7UaWKZQtVi+4rmYQAb7/trulCslhviRMf85aOwBIUMKYHoKT0OqIXmMY7s1o8eaHyugS9WRGyhLSRurMm5Q2oHWH8nHt8+2J7LMPuBTMvgeoJHB9Jt7vez1HFvjy69Djn3+4YWgUGd+JJROt6A+QNfaM/H6JIEt1Kw9898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRzxBaK1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRzxBaK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781057879; x=1812593879;
  h=date:from:to:cc:subject:message-id;
  bh=MltHAS7O3NlAQlkfwxXifPVwrPfdIhQ/rzDwqd6nSao=;
  b=JRzxBaK1n5DBsxASfusXYTwjLdZUYjul9bfPGTuBZdK+WpDGpDTgMumH
   qCjKJDCl793LwyG6FSdpzBhgC4BICGLlIC1LJOQ/qdUib36FMCaw4hFen
   0zdW4pyKTtV7fZS3pHfHsGaFqvF3foKufeW++2PKOdl3mbHlsBcQN7ocS
   5yU3Hxbt0klAeLzhSZHgMcGJi4tJLrIxT0iHRIVi4Rj3Fc4WTPi6hp/3B
   2O8AsDfR5ish1kIxtnanLUT4GcYlmoeOg27im066uFivHG5xPVRgPJ4eV
   6NhbW7qQO2fl1uuS6wZRlscAtxjB5u0es7kgvgljOWwtzk70Ng+K3X1Ep
   Q==;
X-CSE-ConnectionGUID: PgBRNKqJR8CUJmFirg/seg==
X-CSE-MsgGUID: 09E//L/AQZWooRFducE0IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85730940"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85730940"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:17:58 -0700
X-CSE-ConnectionGUID: 1zX+QCzNSKaOT8GUiSrXSQ==
X-CSE-MsgGUID: b2+vpld9SHKBeKIk6EWeug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="244892914"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jun 2026 19:17:57 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX8Vu-00000000Kny-1Ilo;
	Wed, 10 Jun 2026 02:17:54 +0000
Date: Wed, 10 Jun 2026 10:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: crypto/hmac.c:301:1: warning: the frame size of 1040 bytes
 is larger than 1024 bytes
Message-ID: <202606101048.ma5faTxi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Herbert,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   acb7500801e98639f6d8c2d796ed9f64cba83d3a
commit: 9d9b193ed73a65ec47cf1fd39925b09da8216461 crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)
date:   10 months ago
config: mips-lemote2f_defconfig (https://download.01.org/0day-ci/archive/20260610/202606101048.ma5faTxi-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101048.ma5faTxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9d9b193ed73a ("crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101048.ma5faTxi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/hmac.c: In function 'hmac_setkey_ahash':
>> crypto/hmac.c:301:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     301 | }
         | ^


vim +301 crypto/hmac.c

0796ae061e6da5 Herbert Xu 2006-08-21  250  
c3103416d52176 Herbert Xu 2025-05-15  251  static int hmac_setkey_ahash(struct crypto_ahash *parent,
c3103416d52176 Herbert Xu 2025-05-15  252  			     const u8 *inkey, unsigned int keylen)
c3103416d52176 Herbert Xu 2025-05-15  253  {
c3103416d52176 Herbert Xu 2025-05-15  254  	struct ahash_hmac_ctx *tctx = crypto_ahash_ctx(parent);
c3103416d52176 Herbert Xu 2025-05-15  255  	struct crypto_ahash *fb = crypto_ahash_fb(tctx->hash);
c3103416d52176 Herbert Xu 2025-05-15  256  	int ds = crypto_ahash_digestsize(parent);
c3103416d52176 Herbert Xu 2025-05-15  257  	int bs = crypto_ahash_blocksize(parent);
c3103416d52176 Herbert Xu 2025-05-15  258  	int ss = crypto_ahash_statesize(parent);
c3103416d52176 Herbert Xu 2025-05-15  259  	HASH_REQUEST_ON_STACK(req, fb);
c3103416d52176 Herbert Xu 2025-05-15  260  	u8 *opad = &tctx->pads[ss];
c3103416d52176 Herbert Xu 2025-05-15  261  	u8 *ipad = &tctx->pads[0];
c3103416d52176 Herbert Xu 2025-05-15  262  	int err, i;
c3103416d52176 Herbert Xu 2025-05-15  263  
c3103416d52176 Herbert Xu 2025-05-15  264  	if (fips_enabled && (keylen < 112 / 8))
c3103416d52176 Herbert Xu 2025-05-15  265  		return -EINVAL;
c3103416d52176 Herbert Xu 2025-05-15  266  
c3103416d52176 Herbert Xu 2025-05-15  267  	ahash_request_set_callback(req, 0, NULL, NULL);
c3103416d52176 Herbert Xu 2025-05-15  268  
c3103416d52176 Herbert Xu 2025-05-15  269  	if (keylen > bs) {
c3103416d52176 Herbert Xu 2025-05-15  270  		ahash_request_set_virt(req, inkey, ipad, keylen);
c3103416d52176 Herbert Xu 2025-05-15  271  		err = crypto_ahash_digest(req);
c3103416d52176 Herbert Xu 2025-05-15  272  		if (err)
c3103416d52176 Herbert Xu 2025-05-15  273  			goto out_zero_req;
c3103416d52176 Herbert Xu 2025-05-15  274  
c3103416d52176 Herbert Xu 2025-05-15  275  		keylen = ds;
c3103416d52176 Herbert Xu 2025-05-15  276  	} else
c3103416d52176 Herbert Xu 2025-05-15  277  		memcpy(ipad, inkey, keylen);
c3103416d52176 Herbert Xu 2025-05-15  278  
c3103416d52176 Herbert Xu 2025-05-15  279  	memset(ipad + keylen, 0, bs - keylen);
c3103416d52176 Herbert Xu 2025-05-15  280  	memcpy(opad, ipad, bs);
c3103416d52176 Herbert Xu 2025-05-15  281  
c3103416d52176 Herbert Xu 2025-05-15  282  	for (i = 0; i < bs; i++) {
c3103416d52176 Herbert Xu 2025-05-15  283  		ipad[i] ^= HMAC_IPAD_VALUE;
c3103416d52176 Herbert Xu 2025-05-15  284  		opad[i] ^= HMAC_OPAD_VALUE;
c3103416d52176 Herbert Xu 2025-05-15  285  	}
c3103416d52176 Herbert Xu 2025-05-15  286  
c3103416d52176 Herbert Xu 2025-05-15  287  	ahash_request_set_virt(req, ipad, NULL, bs);
c3103416d52176 Herbert Xu 2025-05-15  288  	err = crypto_ahash_init(req) ?:
c3103416d52176 Herbert Xu 2025-05-15  289  	      crypto_ahash_update(req) ?:
c3103416d52176 Herbert Xu 2025-05-15  290  	      crypto_ahash_export(req, ipad);
c3103416d52176 Herbert Xu 2025-05-15  291  
c3103416d52176 Herbert Xu 2025-05-15  292  	ahash_request_set_virt(req, opad, NULL, bs);
c3103416d52176 Herbert Xu 2025-05-15  293  	err = err ?:
c3103416d52176 Herbert Xu 2025-05-15  294  	      crypto_ahash_init(req) ?:
c3103416d52176 Herbert Xu 2025-05-15  295  	      crypto_ahash_update(req) ?:
c3103416d52176 Herbert Xu 2025-05-15  296  	      crypto_ahash_export(req, opad);
c3103416d52176 Herbert Xu 2025-05-15  297  
c3103416d52176 Herbert Xu 2025-05-15  298  out_zero_req:
c3103416d52176 Herbert Xu 2025-05-15  299  	HASH_REQUEST_ZERO(req);
c3103416d52176 Herbert Xu 2025-05-15  300  	return err;
c3103416d52176 Herbert Xu 2025-05-15 @301  }
c3103416d52176 Herbert Xu 2025-05-15  302  

:::::: The code at line 301 was first introduced by commit
:::::: c3103416d5217655d707d9417aaf66f184e3d72f crypto: hmac - Add ahash support

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
