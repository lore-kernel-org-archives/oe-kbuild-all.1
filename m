Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABFE3F12E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523075; cv=none; b=EZHT66/KNoU47d5ZTEWZ7NXzu50FlhiALTJfaXemBBKC6ik+SFGAXOgSKdSWvMDciLJWhPFnKRk/Z8nVn87Pqc/MYSfQAZUmnCOUJqN9934W031oMCA54fyUF0MaNLOaHUqpqfJxj0VNi59sfSTZVfqz451ac87e04QALorkBCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523075; c=relaxed/simple;
	bh=8OeJtqC9LUazFoPnipZathJIO2h1dq5Mdlq3rtEUxt0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o1kp+B+qpEzhk152CwWD5lpTynQ//kmnpSfNcoJbSYKtQWUDWhfKBh40oCyfkdOsXSRhhBKgx7Ctyc3o4MCa2wVYji02dWLXLYx4WF2BuBB641wdguhFRgBZJUJRn73UeHQiCDYLUVOVynm4On7BtInkuUlaXFnW4eULeJTQdX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P37PKL5w; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P37PKL5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783523072; x=1815059072;
  h=date:from:to:cc:subject:message-id;
  bh=8OeJtqC9LUazFoPnipZathJIO2h1dq5Mdlq3rtEUxt0=;
  b=P37PKL5wnfKObsDs7aucwNYHU1xaTrkgknCOc/SvgQV03LNUur+gJ++4
   dq7yHCrgjeVTLAY8BAu7c7VxOACgQYosFPM6/0dEVleUuByDxjNDnABno
   IKAvPEGr9j+l4sq2WoiUWdyN0hhTRR3yxILgGx00Km3B51UG8sEHJsvVa
   9t/vm8c8lHlvjDZI7bG4cFuAgde0zaj5W/xmm8c0Y+WItoEVOJk59+LXZ
   O8TEwBveudRu/k47UTBOYNJMMR6mNOZq8BwfH38LXJAV1Y7bcL5aUUFEi
   Y80O0XI4p0g2qL9tj+VAsQxaMQPwwT/f18c3zLYTR5IqhMrHIZNFLcVb2
   g==;
X-CSE-ConnectionGUID: QrU3ELl1QLGZ+CPL5kurRg==
X-CSE-MsgGUID: 1e99Fjr4Tg+Kufs0W2PS2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95562927"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95562927"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 08:04:30 -0700
X-CSE-ConnectionGUID: K/oHP2EOTtKyEsSoqt8XaQ==
X-CSE-MsgGUID: XjtQZjFlTR+8Y0gByQqs7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258176813"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Jul 2026 08:04:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whTp4-00000000GY9-2KPo;
	Wed, 08 Jul 2026 15:04:26 +0000
Date: Wed, 08 Jul 2026 23:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:aes-modes-v1 12/33]
 lib/crypto/aes.c:1370:(.text+0x1d88): relocation truncated to fit:
 R_NIOS2_CALL26 against `ghash_update'
Message-ID: <202607082209.68Oz67cn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-modes-v1
head:   d26ef6871f91c259a44fb5a45937efe22313453a
commit: 226c7efda7ad68e38931cc7937d107184d1b27ac [12/33] crypto: aes - Add GCM support using library
config: nios2-randconfig-r111-20260708 (https://download.01.org/0day-ci/archive/20260708/202607082209.68Oz67cn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607082209.68Oz67cn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607082209.68Oz67cn-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: lib/crypto/aes.o: in function `aes_gcm_auth_update':
   lib/crypto/aes.c:1370:(.text+0x1d88): undefined reference to `ghash_update'
>> lib/crypto/aes.c:1370:(.text+0x1d88): relocation truncated to fit: R_NIOS2_CALL26 against `ghash_update'
   nios2-linux-ld: lib/crypto/aes.o: in function `ghash_pad':
   lib/crypto/aes.c:1381:(.text+0x1e64): undefined reference to `ghash_update'
   lib/crypto/aes.c:1381:(.text+0x1e64): relocation truncated to fit: R_NIOS2_CALL26 against `ghash_update'
   nios2-linux-ld: lib/crypto/aes.o: in function `aes_gcm_encrypt_final':
   lib/crypto/aes.c:1489:(.text+0x1ec8): undefined reference to `ghash_update'
   lib/crypto/aes.c:1489:(.text+0x1ec8): relocation truncated to fit: R_NIOS2_CALL26 against `ghash_update'
>> nios2-linux-ld: lib/crypto/aes.c:1490:(.text+0x1ed4): undefined reference to `ghash_final'
>> lib/crypto/aes.c:1490:(.text+0x1ed4): relocation truncated to fit: R_NIOS2_CALL26 against `ghash_final'
   nios2-linux-ld: lib/crypto/aes.o: in function `ghash_pad':
   lib/crypto/aes.c:1381:(.text+0x1fbc): undefined reference to `ghash_update'
   lib/crypto/aes.c:1381:(.text+0x1fbc): relocation truncated to fit: R_NIOS2_CALL26 against `ghash_update'
   nios2-linux-ld: lib/crypto/aes.o: in function `aes_gcm_decrypt_final':
   lib/crypto/aes.c:1509:(.text+0x2020): undefined reference to `ghash_update'
   lib/crypto/aes.c:1509:(.text+0x2020): relocation truncated to fit: R_NIOS2_CALL26 against `ghash_update'
   nios2-linux-ld: lib/crypto/aes.c:1510:(.text+0x202c): undefined reference to `ghash_final'
   lib/crypto/aes.c:1510:(.text+0x202c): relocation truncated to fit: R_NIOS2_CALL26 against `ghash_final'
   nios2-linux-ld: lib/crypto/aes.o: in function `ghash_pad':
   lib/crypto/aes.c:1381:(.text+0x2120): undefined reference to `ghash_update'
   lib/crypto/aes.c:1381:(.text+0x2120): relocation truncated to fit: R_NIOS2_CALL26 against `ghash_update'
   nios2-linux-ld: lib/crypto/aes.o: in function `aes_gcm_crypt_update':
   lib/crypto/aes.c:1409:(.text+0x2160): undefined reference to `ghash_update'
   lib/crypto/aes.c:1409:(.text+0x2160): relocation truncated to fit: R_NIOS2_CALL26 against `ghash_update'
>> nios2-linux-ld: lib/crypto/aes.c:1437:(.text+0x21a4): undefined reference to `ghash_update'
   lib/crypto/aes.c:1437:(.text+0x21a4): relocation truncated to fit: R_NIOS2_CALL26 against `ghash_update'
   nios2-linux-ld: lib/crypto/aes.c:1458:(.text+0x21fc): undefined reference to `ghash_update'
   lib/crypto/aes.c:1458:(.text+0x21fc): additional relocation overflows omitted from the output
   nios2-linux-ld: lib/crypto/aes.o: in function `ghash_pad':
   lib/crypto/aes.c:1381:(.text+0x2360): undefined reference to `ghash_update'
   nios2-linux-ld: lib/crypto/aes.o:lib/crypto/aes.c:1407: more undefined references to `ghash_update' follow
   nios2-linux-ld: lib/crypto/aes.o: in function `aes_gcm_preparekey':
   lib/crypto/aes.c:1340:(.text+0x2c00): undefined reference to `ghash_preparekey'


vim +1370 lib/crypto/aes.c

a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1365  
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1366  void aes_gcm_auth_update(struct aes_gcm_ctx *ctx, const u8 *ad, size_t len)
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1367  {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1368  	WARN_ON_ONCE(ctx->data_len != 0);
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1369  	if (len) {
a4cb2dd97cb6b72 Eric Biggers 2026-07-06 @1370  		ghash_update(&ctx->ghash, ad, len);
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
a4cb2dd97cb6b72 Eric Biggers 2026-07-06  1381  		ghash_update(ghash, gcm_zeroes, -len % AES_BLOCK_SIZE);
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

:::::: The code at line 1370 was first introduced by commit
:::::: a4cb2dd97cb6b72f10659729b2f72a370bb77df7 lib/crypto: aes: Add GCM support

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
