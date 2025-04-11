Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811D226FD8A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 01:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744334527; cv=none; b=VLiaDFLRKgObIMSldsD30JRta4zDYl4LpT3FJGrxiYG3lc1mfbYHq8utDwfvf5cmavjgyjMQXiX6hXoQlsS2WD8vGOzUNkLu0XbnJRsIXfh3KBt+giIwvobUuQIkL1OLB2iVEgaq8Z961aNCLdHcJ3xP+DxOQKd2HoElrKDtc20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744334527; c=relaxed/simple;
	bh=YnhMRX/T1OofSXm3kVguJl/8n5smcqizUPJ2gOUjJ1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNWPC3q4uOq7SUDVUSsosA/UbxrPC73BCKng9nIsL9ODz1JgEosQRENx4Mqo88/DqmB2Cd4n4Cq6LGrnnjyYYL+Dm9lzjAalUkebkEggaiCRx3LnW3X/IX9kPKBNaDQoBeOYCW2vEp1biVwbq312YJe6EpvEJ/JBbeTGA7JO3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kbso9/Mz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kbso9/Mz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744334525; x=1775870525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YnhMRX/T1OofSXm3kVguJl/8n5smcqizUPJ2gOUjJ1U=;
  b=Kbso9/Mz7KzrKgepaWYts312E+/vlXOkpXXMdq9rPsLj/tCoADY1VFMZ
   ZAIk0Ox/7bmQXXFNcMC1+K8b8TDMBeR0kyOrk/avGFkw87YxwwNZbNveF
   MysVwdS0fJDmhmv6FsJ2Q8Py+KE8KKTCaJymYbgxTFV88WstfAgvqOXy9
   HRsUAucv4XlSM8N08GAy7MQgcz3Vco316tfjIO7mjxkOQQKG4plyWtEwQ
   I+LeD2lFoXsTSpNS5SWCpSaierQF56OMa59RULoc/xmnIOfQLgdNvJdKZ
   4hVZkK5dP81LhmL9lG4bUmmUNsXH6/O/OLa5ji5CBZNzDnihoglL+eQGq
   w==;
X-CSE-ConnectionGUID: jyQk+BAHRjG5EhJIzwHGWg==
X-CSE-MsgGUID: pORWTcPVTHaOeV9bheA+ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="49713358"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="49713358"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 18:22:05 -0700
X-CSE-ConnectionGUID: CHGqJQtvQ9ivUbjEEVMp+Q==
X-CSE-MsgGUID: 1vmIy9DuRJSOzK5igClYcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134169535"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2025 18:22:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u335l-000AhJ-1r;
	Fri, 11 Apr 2025 01:22:01 +0000
Date: Fri, 11 Apr 2025 09:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>
Subject: [linux-next:master 1514/2907] arch/x86/crypto/chacha_glue.c:252:36:
 error: 'chacha_use_simd' undeclared; did you mean 'chacha_simd'?
Message-ID: <202504110948.v2QopGcq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18
commit: 4aa6dc909e400b247bd3abf29f805d49a9c140bf [1514/2907] crypto: chacha - centralize the skcipher wrappers for arch code
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250411/202504110948.v2QopGcq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504110948.v2QopGcq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504110948.v2QopGcq-lkp@intel.com/

Note: the linux-next/master HEAD 29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18 builds fine.
      It may have been fixed somewhere.

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/algapi.h:13,
                    from include/crypto/internal/skcipher.h:11,
                    from include/crypto/internal/chacha.h:7,
                    from arch/x86/crypto/chacha_glue.c:9:
   arch/x86/crypto/chacha_glue.c: In function 'chacha_is_arch_optimized':
>> arch/x86/crypto/chacha_glue.c:252:36: error: 'chacha_use_simd' undeclared (first use in this function); did you mean 'chacha_simd'?
     252 |         return static_key_enabled(&chacha_use_simd);
         |                                    ^~~~~~~~~~~~~~~
   include/linux/jump_label.h:423:51: note: in definition of macro 'static_key_enabled'
     423 |         if (!__builtin_types_compatible_p(typeof(*x), struct static_key) &&     \
         |                                                   ^
   arch/x86/crypto/chacha_glue.c:252:36: note: each undeclared identifier is reported only once for each function it appears in
     252 |         return static_key_enabled(&chacha_use_simd);
         |                                    ^~~~~~~~~~~~~~~
   include/linux/jump_label.h:423:51: note: in definition of macro 'static_key_enabled'
     423 |         if (!__builtin_types_compatible_p(typeof(*x), struct static_key) &&     \
         |                                                   ^
>> arch/x86/crypto/chacha_glue.c:253:1: warning: control reaches end of non-void function [-Wreturn-type]
     253 | }
         | ^


vim +252 arch/x86/crypto/chacha_glue.c

   249	
   250	bool chacha_is_arch_optimized(void)
   251	{
 > 252		return static_key_enabled(&chacha_use_simd);
 > 253	}
   254	EXPORT_SYMBOL(chacha_is_arch_optimized);
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
