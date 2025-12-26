Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA081917F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 21:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766782952; cv=none; b=jti8fKyBjK9ACh+8DaVBMMqKeF/NeD6D/F39hmzb/m0IIGeKhSL3z5O3yFM3xxOqhuVqNZkdCE+wmaRWGJheH4iRrz2LDIQI4eGgOwho/PsaXwiRCiI7Garb0mwCD9xinJul9Q6c5LXB4khR08b2N1m5maiGIq8f5qVhi7unCf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766782952; c=relaxed/simple;
	bh=++wjPT1ZKGJb23aJURpaU8xuxktjH0mR87bxLIMJfhk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T/tcOp4OqhvOI92PDZEJh+v2cjSDG/y+YMtKk9yfLWusKfBgXoJyz6S0XpixzynNBTKY/4SZFHhqGBrdhasMMcglSqAA92QOXj67ZaxF37GISDTyaEQnUqQWoH8YTw+UA/E+XOuR2IiVL2R8M0hw4fJyx2vAeNmMiF2LXDDz61I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzRDEUyF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzRDEUyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766782950; x=1798318950;
  h=date:from:to:cc:subject:message-id;
  bh=++wjPT1ZKGJb23aJURpaU8xuxktjH0mR87bxLIMJfhk=;
  b=KzRDEUyFbVzj8Azw2vNkhvS7Tn3SiPk+aSMCiOor1YsfpKa9NIm/YnTU
   fRuFVbfNKxhRQXwpBBjeMbJO42L7/ojXv6Yw1is8vwGuBnBjym3YSfj5G
   YDp+TMBow3MNMuMFugeA6F5aMwwwu+A4Re/Pp3vPC4y3RDr8CcGSR0cfj
   /3nJ2oyrV4qXtsP1eABw7C9EiGHR6wodeXjUVvOvBf+vPX2iAcS5xgWye
   1T9yJBkTKMMxkyFjIRvXxptFLDbTOnKZtKXyAbmcNWm6sThghhyocoLU7
   6/MOLRXSSMajsvdQX3Hv1XkF/vbLiy+8VjOC3ZtYW0EFI6SKDB1ObQD4a
   A==;
X-CSE-ConnectionGUID: a12XWJtuS1qqzog7I+eMdg==
X-CSE-MsgGUID: sE9DMmdhSUqw2I1lLK9zcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68597731"
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="68597731"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 13:02:29 -0800
X-CSE-ConnectionGUID: RLJk65EvR8eIkwjzw0BUpw==
X-CSE-MsgGUID: H5qqkl4VQp6oe4NyIzZQPg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Dec 2025 13:02:27 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZEx7-000000005Lj-1u7k;
	Fri, 26 Dec 2025 21:02:25 +0000
Date: Sat, 27 Dec 2025 05:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes
 is larger than 1024 bytes
Message-ID: <202512270438.YfZ22yXt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f0e9c8cefa913dd9bd1d79b9a68896ea130f106
commit: 9d9b193ed73a65ec47cf1fd39925b09da8216461 crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)
date:   5 months ago
config: mips-lemote2f_defconfig (https://download.01.org/0day-ci/archive/20251227/202512270438.YfZ22yXt-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512270438.YfZ22yXt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512270438.YfZ22yXt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/ahash.c: In function 'crypto_hash_digest':
>> crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1073 | }
         | ^
--
   crypto/hmac.c: In function 'hmac_setkey_ahash':
>> crypto/hmac.c:301:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     301 | }
         | ^


vim +1073 crypto/ahash.c

04bfa4c7d5119c Herbert Xu 2025-04-12  1059  
04bfa4c7d5119c Herbert Xu 2025-04-12  1060  int crypto_hash_digest(struct crypto_ahash *tfm, const u8 *data,
04bfa4c7d5119c Herbert Xu 2025-04-12  1061  		       unsigned int len, u8 *out)
04bfa4c7d5119c Herbert Xu 2025-04-12  1062  {
19da081a28c95f Herbert Xu 2025-04-23  1063  	HASH_REQUEST_ON_STACK(req, crypto_ahash_fb(tfm));
04bfa4c7d5119c Herbert Xu 2025-04-12  1064  	int err;
04bfa4c7d5119c Herbert Xu 2025-04-12  1065  
04bfa4c7d5119c Herbert Xu 2025-04-12  1066  	ahash_request_set_callback(req, 0, NULL, NULL);
04bfa4c7d5119c Herbert Xu 2025-04-12  1067  	ahash_request_set_virt(req, data, out, len);
04bfa4c7d5119c Herbert Xu 2025-04-12  1068  	err = crypto_ahash_digest(req);
04bfa4c7d5119c Herbert Xu 2025-04-12  1069  
04bfa4c7d5119c Herbert Xu 2025-04-12  1070  	ahash_request_zero(req);
04bfa4c7d5119c Herbert Xu 2025-04-12  1071  
04bfa4c7d5119c Herbert Xu 2025-04-12  1072  	return err;
04bfa4c7d5119c Herbert Xu 2025-04-12 @1073  }
04bfa4c7d5119c Herbert Xu 2025-04-12  1074  EXPORT_SYMBOL_GPL(crypto_hash_digest);
04bfa4c7d5119c Herbert Xu 2025-04-12  1075  

:::::: The code at line 1073 was first introduced by commit
:::::: 04bfa4c7d5119ca38f8133bfdae7957a60c8b221 crypto: hash - Add HASH_REQUEST_ON_STACK

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
