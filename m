Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D113C062A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 11:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511205; cv=none; b=UFENIHowBvy5gPYjHAbDPmMX/ogk2fTZQLcrEfv0S2S8bEsnv9WfH0ewUr4onhRd2oaBvPHA/Shq7WVyyKYJ/5C+CmDzdAtvIaOkYYfaHMiGR5ToHXNHg7TU3uN1MzOqH3PUFSZ67RhqqX+RG8GmKHIRT39Qf3jnbg3v46NQZM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511205; c=relaxed/simple;
	bh=6pc3TozSF+qHQwbSAYJ1FOFUN74SERhWLke4IKkKeRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UlIMOxw5YcJx3YdoIKP7A7bAl55tFNStVSwzH9Yqoz0k0zqvMyQpsyFRTATHTVP7gzQMxEOWSCwmgDP4OOYofyQQyJBUB2m7xYoAJF8/hGeVpbt6U/U/UDu2QeHyQSw2ZwiVnFOE9lm75/9MGCW0oRc29YcHjP3mshhPMb5pHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAdvmbpG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAdvmbpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783511203; x=1815047203;
  h=date:from:to:cc:subject:message-id;
  bh=6pc3TozSF+qHQwbSAYJ1FOFUN74SERhWLke4IKkKeRU=;
  b=LAdvmbpGsQW+h2qmEuY+oKEX6flTo+YvNsxXsD/J56xUAiNzxOZv0ont
   o38j9O8TzvOyPDfPe/lK4QcS5Rs9L70SmhXsobhe0+/Bp9UH45wMCeWpT
   jjHhjp5gsjul5MG/jBC0SfNo6v27gdXPvEYckdrED1T8cqYJVEa70E4lC
   ChoNiixf4gU/kwawdab4EeaidkPlb7vwhaLNkqgJIqkiAF2GHXTJlP6Tz
   GC8KX3gFVuK61A0ghRNvoof21bGDrPcob1Wxp9hC4UnMfYCIJDL3EAx8F
   FD4vWSv9TNxdnQ0ZUWeWHtt5Dyr5XonVllEwHqmDAy1Eo7pYQJ/Ca8sdZ
   w==;
X-CSE-ConnectionGUID: M3KW/392QnG8YQg+WIteaA==
X-CSE-MsgGUID: 8pyQwVzxQM2BHJyMQunlkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95684882"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95684882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 04:46:42 -0700
X-CSE-ConnectionGUID: WIzAGDubSr6QJ1/XSb8H5w==
X-CSE-MsgGUID: ng7riHUOQGO38GonYNMylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="252531292"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Jul 2026 04:46:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whQjJ-00000000GJr-1OL1;
	Wed, 08 Jul 2026 11:46:21 +0000
Date: Wed, 08 Jul 2026 19:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:aes-modes-v1 12/33]
 lib/crypto/aes.c:1381:undefined reference to `ghash_update'
Message-ID: <202607081944.lMl8fmQi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-modes-v1
head:   d26ef6871f91c259a44fb5a45937efe22313453a
commit: 226c7efda7ad68e38931cc7937d107184d1b27ac [12/33] crypto: aes - Add GCM support using library
config: x86_64-randconfig-122-20260708 (https://download.01.org/0day-ci/archive/20260708/202607081944.lMl8fmQi-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081944.lMl8fmQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081944.lMl8fmQi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/crypto/aes.o: in function `ghash_pad':
>> lib/crypto/aes.c:1381:(.text+0x244): undefined reference to `ghash_update'
   ld: lib/crypto/aes.o: in function `aes_gcm_encrypt_final':
   lib/crypto/aes.c:1489:(.text+0x2ba): undefined reference to `ghash_update'
>> ld: lib/crypto/aes.c:1490:(.text+0x2c9): undefined reference to `ghash_final'
   ld: lib/crypto/aes.o: in function `ghash_pad':
   lib/crypto/aes.c:1381:(.text+0x465): undefined reference to `ghash_update'
   ld: lib/crypto/aes.o: in function `aes_gcm_decrypt_final':
   lib/crypto/aes.c:1509:(.text+0x4db): undefined reference to `ghash_update'
   ld: lib/crypto/aes.c:1510:(.text+0x4ea): undefined reference to `ghash_final'
   ld: lib/crypto/aes.o: in function `aes_gcm_auth_update':
   lib/crypto/aes.c:1370:(.text+0x634): undefined reference to `ghash_update'
   ld: lib/crypto/aes.o: in function `ghash_pad':
   lib/crypto/aes.c:1381:(.text+0x378e): undefined reference to `ghash_update'
   ld: lib/crypto/aes.o: in function `aes_gcm_crypt_update':
   lib/crypto/aes.c:1409:(.text+0x37db): undefined reference to `ghash_update'
>> ld: lib/crypto/aes.c:1437:(.text+0x3816): undefined reference to `ghash_update'
   ld: lib/crypto/aes.c:1458:(.text+0x38df): undefined reference to `ghash_update'
   ld: lib/crypto/aes.o:lib/crypto/aes.c:1381: more undefined references to `ghash_update' follow
   ld: lib/crypto/aes.o: in function `aes_gcm_preparekey':
>> lib/crypto/aes.c:1340:(.text+0x501b): undefined reference to `ghash_preparekey'


vim +1381 lib/crypto/aes.c

a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1324  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1325  int aes_gcm_preparekey(struct aes_gcm_key *key, const u8 *in_key,
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1326  		       size_t key_len, size_t authtag_len)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1327  {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1328  	u8 h[AES_BLOCK_SIZE] = { 0 };
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1329  	int err;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1330  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1331  	err = crypto_gcm_check_authsize(authtag_len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1332  	if (unlikely(err))
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1333  		return err;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1334  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1335  	err = aes_prepareenckey(&key->aes, in_key, key_len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1336  	if (unlikely(err))
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1337  		return err;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1338  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1339  	aes_encrypt(&key->aes, h, h);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06 @1340  	ghash_preparekey(&key->ghash, h);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1341  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1342  	key->authtag_len = authtag_len;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1343  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1344  	memzero_explicit(h, sizeof(h));
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1345  	return 0;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1346  }
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1347  EXPORT_SYMBOL_GPL(aes_gcm_preparekey);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1348  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1349  void aes_gcm_init(struct aes_gcm_ctx *ctx, const u8 nonce[12],
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1350  		  const struct aes_gcm_key *key)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1351  {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1352  	ctx->key = key;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1353  	ctx->ad_len = 0;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1354  	ctx->data_len = 0;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1355  	ghash_init(&ctx->ghash, &key->ghash);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1356  	memset(ctx->keystream, 0, sizeof(ctx->keystream));
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1357  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1358  	memcpy(ctx->ctr32, nonce, 12);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1359  	ctx->ctr32[3] = cpu_to_be32(1);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1360  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1361  	aes_encrypt(&key->aes, ctx->j0_enc, ctx->ctr);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1362  	ctx->ctr32[3] = cpu_to_be32(2);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1363  }
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1364  EXPORT_SYMBOL_GPL(aes_gcm_init);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1365  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1366  void aes_gcm_auth_update(struct aes_gcm_ctx *ctx, const u8 *ad, size_t len)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1367  {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1368  	WARN_ON_ONCE(ctx->data_len != 0);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1369  	if (len) {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1370  		ghash_update(&ctx->ghash, ad, len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1371  		ctx->ad_len += len;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1372  	}
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1373  }
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1374  EXPORT_SYMBOL_GPL(aes_gcm_auth_update);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1375  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1376  static const u8 gcm_zeroes[AES_BLOCK_SIZE];
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1377  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1378  static __always_inline void ghash_pad(struct ghash_ctx *ghash, u64 len)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1379  {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1380  	if (len % AES_BLOCK_SIZE)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06 @1381  		ghash_update(ghash, gcm_zeroes, -len % AES_BLOCK_SIZE);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1382  }
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1383  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1384  static __always_inline void aes_gcm_crypt_update(struct aes_gcm_ctx *ctx,
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1385  						 u8 *dst, const u8 *src,
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1386  						 size_t len, bool enc)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1387  {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1388  	size_t partial_len, n;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1389  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1390  	if (unlikely(len == 0))
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1391  		return;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1392  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1393  	partial_len = ctx->data_len % AES_BLOCK_SIZE;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1394  	if (ctx->data_len == 0)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1395  		ghash_pad(&ctx->ghash, ctx->ad_len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1396  	ctx->data_len += len;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1397  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1398  	if (unlikely(partial_len != 0)) {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1399  		/*
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1400  		 * The previous call ended on a non-block-aligned data_len, so
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1401  		 * continue using a previously-generated keystream block.
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1402  		 */
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1403  		n = min(len, AES_BLOCK_SIZE - partial_len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1404  		if (enc) {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1405  			crypto_xor_cpy(dst, src, &ctx->keystream[partial_len],
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1406  				       n);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1407  			ghash_update(&ctx->ghash, dst, n);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1408  		} else {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1409  			ghash_update(&ctx->ghash, src, n);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1410  			crypto_xor_cpy(dst, src, &ctx->keystream[partial_len],
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1411  				       n);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1412  		}
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1413  		dst += n;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1414  		src += n;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1415  		len -= n;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1416  	}
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1417  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1418  	if (len >= AES_BLOCK_SIZE) {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1419  		n = round_down(len, AES_BLOCK_SIZE);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1420  		if (enc) {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1421  			if (likely(aes_gcm_encrypt_update_arch(
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1422  				    dst, src, n, &ctx->ghash.acc, ctx->ctr32,
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1423  				    &ctx->key->aes, &ctx->key->ghash))) {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1424  				be32_add_cpu(&ctx->ctr32[3],
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1425  					     n / AES_BLOCK_SIZE);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1426  			} else {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1427  				aes_ctr(dst, src, n, ctx->ctr, &ctx->key->aes);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1428  				ghash_update(&ctx->ghash, dst, n);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1429  			}
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1430  		} else {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1431  			if (likely(aes_gcm_decrypt_update_arch(
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1432  				    dst, src, n, &ctx->ghash.acc, ctx->ctr32,
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1433  				    &ctx->key->aes, &ctx->key->ghash))) {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1434  				be32_add_cpu(&ctx->ctr32[3],
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1435  					     n / AES_BLOCK_SIZE);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1436  			} else {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06 @1437  				ghash_update(&ctx->ghash, src, n);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1438  				aes_ctr(dst, src, n, ctx->ctr, &ctx->key->aes);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1439  			}
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1440  		}
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1441  		dst += n;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1442  		src += n;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1443  		len -= n;
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1444  	}
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1445  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1446  	if (len != 0) {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1447  		/*
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1448  		 * Ending on a non-block aligned data_len.  Generate the next
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1449  		 * keystream block, use the needed portion of it, and leave it
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1450  		 * cached in ctx->keystream in case this isn't the final call.
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1451  		 */
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1452  		aes_encrypt(&ctx->key->aes, ctx->keystream, ctx->ctr);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1453  		be32_add_cpu(&ctx->ctr32[3], 1);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1454  		if (enc) {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1455  			crypto_xor_cpy(dst, src, ctx->keystream, len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1456  			ghash_update(&ctx->ghash, dst, len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1457  		} else {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1458  			ghash_update(&ctx->ghash, src, len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1459  			crypto_xor_cpy(dst, src, ctx->keystream, len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1460  		}
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1461  	}
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1462  }
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1463  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1464  void aes_gcm_encrypt_update(struct aes_gcm_ctx *ctx, u8 *dst, const u8 *src,
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1465  			    size_t len)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1466  {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1467  	aes_gcm_crypt_update(ctx, dst, src, len, /* enc= */ true);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1468  }
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1469  EXPORT_SYMBOL_GPL(aes_gcm_encrypt_update);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1470  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1471  void aes_gcm_decrypt_update(struct aes_gcm_ctx *ctx, u8 *dst, const u8 *src,
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1472  			    size_t len)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1473  {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1474  	aes_gcm_crypt_update(ctx, dst, src, len, /* enc= */ false);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1475  }
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1476  EXPORT_SYMBOL_GPL(aes_gcm_decrypt_update);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1477  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1478  void aes_gcm_encrypt_final(struct aes_gcm_ctx *ctx, u8 *authtag)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1479  {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1480  	__be64 tail[2];
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1481  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1482  	WARN_ON_ONCE(ctx->data_len > (1ULL << 36) - 32);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1483  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1484  	ghash_pad(&ctx->ghash,
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1485  		  ctx->data_len == 0 ? ctx->ad_len : ctx->data_len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1486  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1487  	tail[0] = cpu_to_be64(ctx->ad_len * 8);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1488  	tail[1] = cpu_to_be64(ctx->data_len * 8);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1489  	ghash_update(&ctx->ghash, (const u8 *)tail, 16);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06 @1490  	ghash_final(&ctx->ghash, ctx->ctr); /* Use ctr as temp buffer */
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1491  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1492  	crypto_xor_cpy(authtag, ctx->ctr, ctx->j0_enc, ctx->key->authtag_len);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1493  	memzero_explicit(ctx, sizeof(*ctx));
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1494  }
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1495  EXPORT_SYMBOL_GPL(aes_gcm_encrypt_final);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1496  

:::::: The code at line 1381 was first introduced by commit
:::::: a4cb2dd97cb6b72f10659729b2f72a370bb77df7 lib/crypto: aes: Add GCM support

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
