Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F071211A3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 12:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734699564; cv=none; b=DVoWDLaDFka6Fka6Rc6jq33trL7CLIpROlLMbQBuaFpcwRsOj7hCnGW2hyWk88K3tzdxL1kyfDJe7edhL9roVicgvmltQ52OxSuj85kyKf53FUI8J8gx7t96vNKNANl7a6/igtFez6n8FzzBffEqj51qWyQoJH8MX9/3iGnTaC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734699564; c=relaxed/simple;
	bh=2R0Trm2wrFDQe7r6/9QefdWEgR6w7u5fMk2EeK2vH14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d9IRZUkJLmf+nnC/fhHT/co+PZS3eO0ElywnvvOH5xTbB3cFurE1K26bZEKBQXJpKF9yoWoTEs2OZylHSXXHsh87Gn4tC43NhlqjfhkMFHQJ362Eg+EF8pWNkD0aGCBkXntL4DGBKWEY/FqTjDo99yol2J9BRhvaSXXKJcOjLz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3rP0E36; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3rP0E36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734699562; x=1766235562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2R0Trm2wrFDQe7r6/9QefdWEgR6w7u5fMk2EeK2vH14=;
  b=h3rP0E36I4HCuxBxW20ZKiF1HxUL16hQAL0B6yxpGqCmRvZs2OcrZqr3
   g6TB7axI49zwJZhqtNtyrPY1Kx6PETy8NUG7o4Jveyd0nvfILNgy2uzQK
   jVMgpj+wzDzV9KpeScV87cXmpI0qo5GSH6f3tMMUXTNHbOEnWzMAdMP3y
   QfYU6LTffxlL+t5011M0TK+5gwU0IZTd5aYRbzoplBfoNqnXwbK4vCOmm
   jy3FPIadWU0RiXhNut+3RLXLnxBBhHKaN99k4C9bnHvKsfoTPwlAWN7jm
   AW5TFJZavP7ORHDP2RycKrAvpUhZt7Klm5FI0KYYUVLxfNhcRri2l7tk6
   g==;
X-CSE-ConnectionGUID: kGERLWF1Rdi1isE1lvJf0w==
X-CSE-MsgGUID: /loQ+5w2T5ydfZVObTeRJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="60628629"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="60628629"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 04:59:21 -0800
X-CSE-ConnectionGUID: XLNaVbJmQo2lE2PK1qXQcg==
X-CSE-MsgGUID: HYvWmUPjQPqsmnTq8ZplbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98702662"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2024 04:59:20 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOcb8-00019n-2k;
	Fri, 20 Dec 2024 12:59:18 +0000
Date: Fri, 20 Dec 2024 20:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-aes-xts-flags 19/19]
 arch/x86/crypto/aesni-intel_glue.c:730:13: warning: 'aesni_xts_decrypt'
 defined but not used
Message-ID: <202412202035.Ru9HtNqY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes-xts-flags
head:   2b32612abff2e4adb803aa6e5fdedaf76d0be424
commit: 2b32612abff2e4adb803aa6e5fdedaf76d0be424 [19/19] crypto: x86/aes-xts - switch from function pointers to flags
config: x86_64-buildonly-randconfig-004-20241220 (https://download.01.org/0day-ci/archive/20241220/202412202035.Ru9HtNqY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202035.Ru9HtNqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202035.Ru9HtNqY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/aesni-intel_glue.c:730:13: warning: 'aesni_xts_decrypt' defined but not used [-Wunused-function]
     730 | static void aesni_xts_decrypt(const struct crypto_aes_ctx *key,
         |             ^~~~~~~~~~~~~~~~~
>> arch/x86/crypto/aesni-intel_glue.c:723:13: warning: 'aesni_xts_encrypt' defined but not used [-Wunused-function]
     723 | static void aesni_xts_encrypt(const struct crypto_aes_ctx *key,
         |             ^~~~~~~~~~~~~~~~~
>> arch/x86/crypto/aesni-intel_glue.c:717:13: warning: 'aesni_xts_encrypt_iv' defined but not used [-Wunused-function]
     717 | static void aesni_xts_encrypt_iv(const struct crypto_aes_ctx *tweak_key,
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/aesni_xts_decrypt +730 arch/x86/crypto/aesni-intel_glue.c

751fb2528c12ef Eric Biggers   2024-04-07  716  
751fb2528c12ef Eric Biggers   2024-04-07 @717  static void aesni_xts_encrypt_iv(const struct crypto_aes_ctx *tweak_key,
751fb2528c12ef Eric Biggers   2024-04-07  718  				 u8 iv[AES_BLOCK_SIZE])
751fb2528c12ef Eric Biggers   2024-04-07  719  {
751fb2528c12ef Eric Biggers   2024-04-07  720  	aesni_enc(tweak_key, iv, iv);
751fb2528c12ef Eric Biggers   2024-04-07  721  }
751fb2528c12ef Eric Biggers   2024-04-07  722  
751fb2528c12ef Eric Biggers   2024-04-07 @723  static void aesni_xts_encrypt(const struct crypto_aes_ctx *key,
54d618cc9f8696 Eric Biggers   2024-12-12  724  			      const u8 *src, u8 *dst, int len,
751fb2528c12ef Eric Biggers   2024-04-07  725  			      u8 tweak[AES_BLOCK_SIZE])
751fb2528c12ef Eric Biggers   2024-04-07  726  {
751fb2528c12ef Eric Biggers   2024-04-07  727  	aesni_xts_enc(key, dst, src, len, tweak);
751fb2528c12ef Eric Biggers   2024-04-07  728  }
751fb2528c12ef Eric Biggers   2024-04-07  729  
751fb2528c12ef Eric Biggers   2024-04-07 @730  static void aesni_xts_decrypt(const struct crypto_aes_ctx *key,
54d618cc9f8696 Eric Biggers   2024-12-12  731  			      const u8 *src, u8 *dst, int len,
751fb2528c12ef Eric Biggers   2024-04-07  732  			      u8 tweak[AES_BLOCK_SIZE])
751fb2528c12ef Eric Biggers   2024-04-07  733  {
751fb2528c12ef Eric Biggers   2024-04-07  734  	aesni_xts_dec(key, dst, src, len, tweak);
2481104fe98d5b Ard Biesheuvel 2020-12-31  735  }
2481104fe98d5b Ard Biesheuvel 2020-12-31  736  

:::::: The code at line 730 was first introduced by commit
:::::: 751fb2528c12ef64d1e863efb196cdc968b384f6 crypto: x86/aes-xts - make non-AVX implementation use new glue code

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
