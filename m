Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9693A1C84C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032821; cv=none; b=mZnDBVmlvQIfb561RuvpsvXkdP1SW0NpHXvLvGLe6b9S0w7c3PLTbPVzb9bW7V905HKg3/0jLio8OoCRiE/yHWHbz/55IkEoA5sT4c72MqWZSDuft0nzDCC9xXm+UjN2T+1XBKDPnXUs9zTUjIJFAg6y12xT5w21CVjUub8xbEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032821; c=relaxed/simple;
	bh=YH1lJ2hkxlTFqf4NpUHGhyUaL9HcLZLja65M3iqtiMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgPprGp4P8imzDEvUQih257WudkCCy0Qbs6TRVAvfGLGcDSbx5ZtmRe9o2rVQgQrpXra6iKq7Wo8a4TkHebuqI4cR7Q7OGGJEBsyjNClsWxOmitvIlpqVstJgHIEkVUv88oZqS8vvi50etetGxxppqgzVcj2fQhFZt6+fX4ODAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kj1XYG6R; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kj1XYG6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761032819; x=1792568819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YH1lJ2hkxlTFqf4NpUHGhyUaL9HcLZLja65M3iqtiMo=;
  b=kj1XYG6RmSqh5s6sbhneCnzwMBpvbVRUnIbF466NsC+e+uwZ3EXRQz1p
   duIh1e5cOWk6W1sBAGGLWpjR1Ib3eRbv3Xx+4043g1DU+YQtokxc+ZSfr
   i4ZGtSfA0tJINZ2nC8B5gDeqReDFNUUHrJJa1k7Attb+cHheV5cK1ZhVK
   Ta+TRF5tGWlYrfkqgDEmnYZPgSRsLI2XcQXo3iIID81EX83EfIrW0/4PR
   ahJE4KjwooUihhDwp935BMY40Utlpv+E6stKGkjPEUgkxq+AYCNl0RnWQ
   y8FXMFUyKjiIx+wB8KAIIetw8v4PV5UyeHfkXC9fXZpXKvQ4uSnoENJPo
   A==;
X-CSE-ConnectionGUID: DMkuBg+ZQ2GEGGU2SdyVJA==
X-CSE-MsgGUID: YF31W1YFQTKAuIMvvHMYHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63062602"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="63062602"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 00:46:59 -0700
X-CSE-ConnectionGUID: t50A5rv2Q8erOIHz4t3tSA==
X-CSE-MsgGUID: FP3/qu9/S4idVzQJmdi7VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="188637572"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Oct 2025 00:46:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB753-000Ad7-0C;
	Tue, 21 Oct 2025 07:46:54 +0000
Date: Tue, 21 Oct 2025 15:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:sha3-lib-v1 26/26] include/crypto/sha3.h:172:undefined
 reference to `__sha3_update'
Message-ID: <202510211511.BnD3u8oA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha3-lib-v1
head:   c5c0c0a14b8403b1ef406166200a7f88d876c361
commit: c5c0c0a14b8403b1ef406166200a7f88d876c361 [26/26] crypto: sha3 - Reimplement using library API
config: x86_64-buildonly-randconfig-001-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211511.BnD3u8oA-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211511.BnD3u8oA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211511.BnD3u8oA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: crypto/sha3.o: in function `crypto_sha3_512_digest':
   crypto/sha3.c:80:(.text+0xa9): undefined reference to `sha3_512'
   ld: crypto/sha3.o: in function `crypto_sha3_384_digest':
   crypto/sha3.c:73:(.text+0xc2): undefined reference to `sha3_384'
   ld: crypto/sha3.o: in function `crypto_sha3_256_digest':
   crypto/sha3.c:66:(.text+0xdb): undefined reference to `sha3_256'
   ld: crypto/sha3.o: in function `crypto_sha3_224_digest':
   crypto/sha3.c:59:(.text+0x127): undefined reference to `sha3_224'
   ld: crypto/sha3.o: in function `sha3_update':
>> include/crypto/sha3.h:172:(.text+0x13e): undefined reference to `__sha3_update'
   ld: crypto/sha3.o: in function `sha3_final':
>> include/crypto/sha3.h:188:(.text+0x15c): undefined reference to `__sha3_squeeze'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +172 include/crypto/sha3.h

b46f957158f397c David Howells 2025-10-17  157  
b46f957158f397c David Howells 2025-10-17  158  /**
43d55a06b81657e Eric Biggers  2025-10-19  159   * sha3_update() - Update a SHA-3 digest context with input data
43d55a06b81657e Eric Biggers  2025-10-19  160   * @ctx: The context to update; must have been initialized
43d55a06b81657e Eric Biggers  2025-10-19  161   * @in: The input data
43d55a06b81657e Eric Biggers  2025-10-19  162   * @in_len: Length of the input data in bytes
b46f957158f397c David Howells 2025-10-17  163   *
43d55a06b81657e Eric Biggers  2025-10-19  164   * This can be called any number of times to add data to a SHA3-224, SHA3-256,
43d55a06b81657e Eric Biggers  2025-10-19  165   * SHA3-384, or SHA3-512 digest (depending on which init function was called).
b46f957158f397c David Howells 2025-10-17  166   *
b46f957158f397c David Howells 2025-10-17  167   * Context: Any context.
b46f957158f397c David Howells 2025-10-17  168   */
43d55a06b81657e Eric Biggers  2025-10-19  169  static inline void sha3_update(struct sha3_ctx *ctx,
43d55a06b81657e Eric Biggers  2025-10-19  170  			       const u8 *in, size_t in_len)
b46f957158f397c David Howells 2025-10-17  171  {
43d55a06b81657e Eric Biggers  2025-10-19 @172  	__sha3_update(&ctx->ctx, in, in_len);
b46f957158f397c David Howells 2025-10-17  173  }
b46f957158f397c David Howells 2025-10-17  174  
b46f957158f397c David Howells 2025-10-17  175  /**
43d55a06b81657e Eric Biggers  2025-10-19  176   * sha3_final() - Finish computing a SHA-3 message digest
43d55a06b81657e Eric Biggers  2025-10-19  177   * @ctx: The context to finalize; must have been initialized
43d55a06b81657e Eric Biggers  2025-10-19  178   * @out: (output) The resulting SHA3-224, SHA3-256, SHA3-384, or SHA3-512
43d55a06b81657e Eric Biggers  2025-10-19  179   *	 message digest, matching the init function that was called.  Note that
43d55a06b81657e Eric Biggers  2025-10-19  180   *	 the size differs for each one; see SHA3_*_DIGEST_SIZE.
b46f957158f397c David Howells 2025-10-17  181   *
43d55a06b81657e Eric Biggers  2025-10-19  182   * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
b46f957158f397c David Howells 2025-10-17  183   *
b46f957158f397c David Howells 2025-10-17  184   * Context: Any context.
b46f957158f397c David Howells 2025-10-17  185   */
43d55a06b81657e Eric Biggers  2025-10-19  186  static inline void sha3_final(struct sha3_ctx *ctx, u8 *out)
b46f957158f397c David Howells 2025-10-17  187  {
43d55a06b81657e Eric Biggers  2025-10-19 @188  	__sha3_squeeze(&ctx->ctx, out, ctx->digest_size);
43d55a06b81657e Eric Biggers  2025-10-19  189  	sha3_zeroize_ctx(ctx);
b46f957158f397c David Howells 2025-10-17  190  }
b46f957158f397c David Howells 2025-10-17  191  

:::::: The code at line 172 was first introduced by commit
:::::: 43d55a06b81657e314c6ed721fa5a8bf441d63b4 lib/crypto: sha3: Simplify the API

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
