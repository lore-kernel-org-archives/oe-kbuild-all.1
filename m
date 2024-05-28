Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EFE38D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 00:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716856264; cv=none; b=Oq77iOjGabciztfI1kRsWJg9Sag9vKgW6j002YUbmGxHIbcGdyUgPgEKl1EIGF++TetEeBprigxQjjUz5mJhZfu75J9rt0yOagpjGbuIe9d/1pJ9JgpEhWBs7WSBq1i6ER7aJAm7BT/u6Ca5n14aFswHsze9nDh/A9de0TdFdwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716856264; c=relaxed/simple;
	bh=nJDU8Ztn5k44cipy51TShIe6ayG/bgCQDbeJ4IIdpaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rNL4mDvb8NnEi9K4JE7gAvDHujzH0vhKM+imLfV//DNV1hJ/AmHyaeIehjMb5XgUWAk4nF3Qrhid/8UYYJjMSUjHG/tEm72Arlxvm73tx71eScj0ErVfISfPbYWUlmjuA+ejq79WGSb4lz324Ts+6nJ7IJPIjN7k5b63U2j1ZAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgFVKeOR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgFVKeOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716856263; x=1748392263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJDU8Ztn5k44cipy51TShIe6ayG/bgCQDbeJ4IIdpaY=;
  b=hgFVKeORVq38aH/R+tSphTz82W+xqRPULNPhYoBjHQJrQeg34bDNfsPK
   6dcMPvQQr+eafZckVY7e2Hi1w71dQkXiM3+1am+OgO0aM5XPRbJirTjkh
   SxSfiaQz4oBfIRZF/F+Bi61DKo7zTbY5kCNH4wtD59TeQrTpMzErSQdjt
   lDfrkd6gEeii25pFz1WA06lBzmn5zN6uV5rdJ46WPkkkeDE8G6HPpumJk
   TXORHdXxNDkjHnCUC7c9PUEckvQbJFbl/4j5hGchJcHGkmn0RNnsSk0AL
   UfMntbB4yz9FDzDXhl2gReaRkTWukIV72HddR7tGD5Ymaj2AnKU0mrgFO
   A==;
X-CSE-ConnectionGUID: b4qCcdMcRQqSks9pUEU9HA==
X-CSE-MsgGUID: yb8ItKgUQRihxlwIu1vemA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23739162"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="23739162"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 17:31:03 -0700
X-CSE-ConnectionGUID: iKrGhD+8T56ym5OzOpwfBA==
X-CSE-MsgGUID: 6xByu03QQqKZuBxCCakc9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="66098711"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2024 17:31:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBkjy-000BEF-2R;
	Tue, 28 May 2024 00:30:58 +0000
Date: Tue, 28 May 2024 08:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crypto-pending 10/11]
 arch/x86/crypto/aesni-intel_glue.c:1260:56: sparse: sparse: incorrect type
 in argument 1 (different base types)
Message-ID: <202405280825.xFT9hdkt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crypto-pending
head:   1899b9e4f1b7c51cf07f580348eba11165d167f3
commit: 60a290e256b16429d52964ef69d18f9a0d2157af [10/11] crypto: x86/aes-gcm - rewrite the AES-NI optimized AES-GCM
config: x86_64-randconfig-123-20240528 (https://download.01.org/0day-ci/archive/20240528/202405280825.xFT9hdkt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280825.xFT9hdkt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280825.xFT9hdkt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/crypto/aesni-intel_glue.c:1249:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [addressable] [assigned] [usertype] a @@
   arch/x86/crypto/aesni-intel_glue.c:1249:53: sparse:     expected unsigned long long [usertype] val
   arch/x86/crypto/aesni-intel_glue.c:1249:53: sparse:     got restricted __be64 [addressable] [assigned] [usertype] a
   arch/x86/crypto/aesni-intel_glue.c:1250:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [addressable] [assigned] [usertype] b @@
   arch/x86/crypto/aesni-intel_glue.c:1250:53: sparse:     expected unsigned long long [usertype] val
   arch/x86/crypto/aesni-intel_glue.c:1250:53: sparse:     got restricted __be64 [addressable] [assigned] [usertype] b
   arch/x86/crypto/aesni-intel_glue.c:1258:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [addressable] [assigned] [usertype] a @@
   arch/x86/crypto/aesni-intel_glue.c:1258:53: sparse:     expected unsigned long long [usertype] val
   arch/x86/crypto/aesni-intel_glue.c:1258:53: sparse:     got restricted __be64 [addressable] [assigned] [usertype] a
   arch/x86/crypto/aesni-intel_glue.c:1259:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [addressable] [assigned] [usertype] b @@
   arch/x86/crypto/aesni-intel_glue.c:1259:53: sparse:     expected unsigned long long [usertype] val
   arch/x86/crypto/aesni-intel_glue.c:1259:53: sparse:     got restricted __be64 [addressable] [assigned] [usertype] b
>> arch/x86/crypto/aesni-intel_glue.c:1260:56: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 @@
   arch/x86/crypto/aesni-intel_glue.c:1260:56: sparse:     expected unsigned long long [usertype] val
   arch/x86/crypto/aesni-intel_glue.c:1260:56: sparse:     got restricted __be64
>> arch/x86/crypto/aesni-intel_glue.c:1265:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [addressable] [usertype] a @@
   arch/x86/crypto/aesni-intel_glue.c:1265:46: sparse:     expected unsigned long long [usertype] val
   arch/x86/crypto/aesni-intel_glue.c:1265:46: sparse:     got restricted __be64 [addressable] [usertype] a
>> arch/x86/crypto/aesni-intel_glue.c:1266:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [addressable] [usertype] b @@
   arch/x86/crypto/aesni-intel_glue.c:1266:46: sparse:     expected unsigned long long [usertype] val
   arch/x86/crypto/aesni-intel_glue.c:1266:46: sparse:     got restricted __be64 [addressable] [usertype] b

vim +1260 arch/x86/crypto/aesni-intel_glue.c

  1176	
  1177	/*
  1178	 * This is the setkey function for the x86_64 implementations of AES-GCM.  It
  1179	 * saves the RFC4106 nonce if applicable, expands the AES key, and precomputes
  1180	 * powers of the hash key.
  1181	 *
  1182	 * To comply with the crypto_aead API, this has to be usable in no-SIMD context.
  1183	 * For that reason, this function includes a portable C implementation of the
  1184	 * needed logic.  However, the portable C implementation is very slow, taking
  1185	 * about the same time as encrypting 37 KB of data.  To be ready for users that
  1186	 * may set a key even somewhat frequently, we therefore also include a SIMD
  1187	 * assembly implementation, expanding the AES key using AES-NI and precomputing
  1188	 * the hash key powers using PCLMULQDQ or VPCLMULQDQ.
  1189	 */
  1190	static int gcm_setkey(struct crypto_aead *tfm, const u8 *raw_key,
  1191			      unsigned int keylen, int flags)
  1192	{
  1193		struct aes_gcm_key *key = aes_gcm_key_get(tfm, flags);
  1194		int err;
  1195	
  1196		if (flags & FLAG_RFC4106) {
  1197			if (keylen < 4)
  1198				return -EINVAL;
  1199			keylen -= 4;
  1200			key->rfc4106_nonce = get_unaligned_be32(raw_key + keylen);
  1201		}
  1202	
  1203		/* The assembly code assumes the following offsets. */
  1204		BUILD_BUG_ON(offsetof(struct aes_gcm_key_aesni, base.aes_key.key_enc) != 0);
  1205		BUILD_BUG_ON(offsetof(struct aes_gcm_key_aesni, base.aes_key.key_length) != 480);
  1206		BUILD_BUG_ON(offsetof(struct aes_gcm_key_aesni, h_powers) != 496);
  1207		BUILD_BUG_ON(offsetof(struct aes_gcm_key_aesni, h_powers_xored) != 624);
  1208		BUILD_BUG_ON(offsetof(struct aes_gcm_key_aesni, h_times_x64) != 688);
  1209		BUILD_BUG_ON(offsetof(struct aes_gcm_key_avx10, base.aes_key.key_enc) != 0);
  1210		BUILD_BUG_ON(offsetof(struct aes_gcm_key_avx10, base.aes_key.key_length) != 480);
  1211		BUILD_BUG_ON(offsetof(struct aes_gcm_key_avx10, h_powers) != 512);
  1212		BUILD_BUG_ON(offsetof(struct aes_gcm_key_avx10, padding) != 768);
  1213	
  1214		if (likely(crypto_simd_usable())) {
  1215			err = aes_check_keylen(keylen);
  1216			if (err)
  1217				return err;
  1218			kernel_fpu_begin();
  1219			aesni_set_key(&key->aes_key, raw_key, keylen);
  1220			aes_gcm_precompute(key, flags);
  1221			kernel_fpu_end();
  1222		} else {
  1223			static const u8 x_to_the_minus1[16] __aligned(__alignof__(be128)) = {
  1224				[0] = 0xc2, [15] = 1
  1225			};
  1226			static const u8 x_to_the_63[16] __aligned(__alignof__(be128)) = {
  1227				[7] = 1,
  1228			};
  1229			be128 h1 = {};
  1230			be128 h;
  1231			int i;
  1232	
  1233			err = aes_expandkey(&key->aes_key, raw_key, keylen);
  1234			if (err)
  1235				return err;
  1236	
  1237			/* Encrypt the all-zeroes block to get the hash key H^1 */
  1238			aes_encrypt(&key->aes_key, (u8 *)&h1, (u8 *)&h1);
  1239	
  1240			/* Compute H^1 * x^-1 */
  1241			h = h1;
  1242			gf128mul_lle(&h, (const be128 *)x_to_the_minus1);
  1243	
  1244			/* Compute the needed key powers */
  1245			if (flags & (FLAG_AVX10_256 | FLAG_AVX10_512)) {
  1246				struct aes_gcm_key_avx10 *k = AES_GCM_KEY_AVX10(key);
  1247	
  1248				for (i = ARRAY_SIZE(k->h_powers) - 1; i >= 0; i--) {
  1249					put_unaligned_be64(h.a, &k->h_powers[i][8]);
  1250					put_unaligned_be64(h.b, &k->h_powers[i][0]);
  1251					gf128mul_lle(&h, &h1);
  1252				}
  1253				memset(k->padding, 0, sizeof(k->padding));
  1254			} else {
  1255				struct aes_gcm_key_aesni *k = AES_GCM_KEY_AESNI(key);
  1256	
  1257				for (i = ARRAY_SIZE(k->h_powers) - 1; i >= 0; i--) {
  1258					put_unaligned_be64(h.a, &k->h_powers[i][8]);
  1259					put_unaligned_be64(h.b, &k->h_powers[i][0]);
> 1260					put_unaligned_be64(h.a ^ h.b,
  1261							   &k->h_powers_xored[i]);
  1262					gf128mul_lle(&h, &h1);
  1263				}
  1264				gf128mul_lle(&h1, (const be128 *)x_to_the_63);
> 1265				put_unaligned_be64(h1.a, &k->h_times_x64[8]);
> 1266				put_unaligned_be64(h1.b, &k->h_times_x64[0]);
  1267			}
  1268		}
  1269		return 0;
  1270	}
  1271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
