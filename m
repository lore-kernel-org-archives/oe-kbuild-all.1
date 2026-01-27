Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD4A2DECBA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769497924; cv=none; b=YiB/JVpKIbn0DsUaJSLcsTP3pagOLWo3kdU+0EJzVoSd0+BObqCaJp3vEUPfXaN/XdvIIGC26P0BTMZMMVgJKXidVb/W3TaeNva1Mlsr30pObYhKNiR9T3sbYotVXoh2saoObiEbCf4rK+NZlWyrBHxdfpHpNSNQy513Uvi4KN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769497924; c=relaxed/simple;
	bh=3dkhmima9uRKb+2XIwXBsPbdYDTAuWLX4AaZ5lVXQ9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T5MGdD4s6+fyp7KQi6YKY83Rhmn1W9HF9Xv1yaxWQKrbuA2+e0cv3aEibCTp3AAEzbsiz/OeM90rcA1++khX/xmS16oml3ddwN6ybUCOqJWeClgqrU9pqkzvfJnxFxaih/0x11UoHpY6DgHt2Kp6UYoM38qGiKA9Ahp8KikAfME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Po0eiCsl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Po0eiCsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769497923; x=1801033923;
  h=date:from:to:cc:subject:message-id;
  bh=3dkhmima9uRKb+2XIwXBsPbdYDTAuWLX4AaZ5lVXQ9I=;
  b=Po0eiCsl7i6DsU7Kgcz22+x2Vf0O1+S4pszicBj6xAHLKLpoy7Cbnkzn
   TUNpT+ZxApKQuUEARxI6hV1DeonxIpD2xzlxN1xNuAuGbsz0eOsTEeh5C
   mUUjYyhuShmSeARw83Btq3dOXl9O6udonovmzU9RH95IQr1cmnDpsJ7Q6
   T6JxGPA1siDfQqCbh0o+m1ghX9tBaz2ku9x2krIHWTzVRCE8+1w35ApvY
   hCzMaeYeCWzZjWbtt0v4qSG+k9FSaj9umr8/psUfv5rlHnYI2Dy/B7kaJ
   aLYkADXJda2cE/5NlWlM4LVBqaBzm6HukyWP0ZUp5SepAtUwaLKyjfCps
   A==;
X-CSE-ConnectionGUID: AFz0NKCtQWm0pLAfe1+o8Q==
X-CSE-MsgGUID: mhYOE+dWTBqN5yr4Z6Fdog==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70401517"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70401517"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 23:12:03 -0800
X-CSE-ConnectionGUID: Bz7DpJudTw6VdhTmOEp0bA==
X-CSE-MsgGUID: uNc6KlWCTou19I4LigVyew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212875533"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Jan 2026 23:12:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkdF0-00000000Y5O-2muJ;
	Tue, 27 Jan 2026 07:11:58 +0000
Date: Tue, 27 Jan 2026 15:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes
 is larger than 1024 bytes
Message-ID: <202601271402.KzLVvqgJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Herbert,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fcb70a56f4d81450114034b2c61f48ce7444a0e2
commit: 9d9b193ed73a65ec47cf1fd39925b09da8216461 crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)
date:   6 months ago
config: mips-eyeq5_defconfig (https://download.01.org/0day-ci/archive/20260127/202601271402.KzLVvqgJ-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271402.KzLVvqgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271402.KzLVvqgJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/ahash.c: In function 'crypto_hash_digest':
>> crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1073 | }
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
