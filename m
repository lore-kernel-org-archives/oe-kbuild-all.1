Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A691DDA24
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 22:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771971765; cv=none; b=qLEzDjrzff50z3ZzhzX8OFec2q6u+mccJfGAGtPV2jUcNeoz5o3fa3ISrrxE++Nytqvv2oEjIqGkU9GQSLVBOIHyXm6+33GlZmKUCdyNt2/DdnsoWif2NUPy/esLVjKzKIsqsPIYpgw3vv5QR8EEapcG3pSnWBs5SRbG1+PYBA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771971765; c=relaxed/simple;
	bh=yx7CzD3xcyOgMCGg3y72SSJs3ZzQWcuyBiieymAb1cY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SiLY+MQlOpByF4Wngtb7xUmz+0mXz5fmCn1mTtMgJd1EPliCGs00QWT9kSGISUKolnvN4ZwBy2bW1wD3jqh4+j1S3fcwB574+VV7zKbxIXqppXyW6mZpT8kpJvKhj9dXEZHGOONZcKWDuvrbJqUo6rzZrWROQMIwIFXOIinjRPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSwlixB9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSwlixB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771971763; x=1803507763;
  h=date:from:to:cc:subject:message-id;
  bh=yx7CzD3xcyOgMCGg3y72SSJs3ZzQWcuyBiieymAb1cY=;
  b=VSwlixB9KHzwSLKr3w+Bn7/GcoGtR/JPXRqc8FXN9JqB+lWKfwdNCQ9e
   anz311B7J/Ke3HKxPhLYbvAUBdVfqldqhHmF0reYHwfoLbhv4rFV/LTPl
   3+hPSBc7Gzep/yadDj0ISlphFsmW4Q7x7j1JtNFU3mTP7pHU8H/xG4U8d
   2JdnTt8auJEeHDqBIlbD9b6qpYPegtn6rmoxQfVCR+QeRUGbWcWmupztk
   8QXeBmNVcUWtmqcqIrWsuPk5DvmpfFPNLoG9exeHfukqIhbx6xVFt/+Nx
   pqkgukRQ2HgperkeM0ItD6p7rgd4S1qznM1gX1I9oPi60MQlBwoJjZ9nm
   w==;
X-CSE-ConnectionGUID: D9UqlR0kThKIstgeuE1MEA==
X-CSE-MsgGUID: R/KE1DyxQ9aT5nI1I6lMVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="60578385"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="60578385"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 14:22:43 -0800
X-CSE-ConnectionGUID: gvCrMr8CSuWZJX+kMtH3cw==
X-CSE-MsgGUID: suD/jhk9Tze1s/s93t1oRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="215273160"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Feb 2026 14:22:42 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv0nc-000000002V3-1Ch5;
	Tue, 24 Feb 2026 22:22:37 +0000
Date: Wed, 25 Feb 2026 06:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 64/64] sha256.c:undefined
 reference to `fips140_lib_funcs_loaded'
Message-ID: <202602250626.WTSIyiot-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   46dd99e420696c966a7354f8e93d3b36fa6da00d
commit: 1aa0ebd06571e65783bdaee8605f6a8460fe4a5b [64/64] ANDROID: lib/crypto: Support overriding crypto library functions
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260225/202602250626.WTSIyiot-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250626.WTSIyiot-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250626.WTSIyiot-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/crypto/sha256.o: in function `__hmac_sha256_init':
>> sha256.c:(.text+0xa): undefined reference to `fips140_lib_funcs_loaded'
>> ld: sha256.c:(.text+0x4c): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `sha224_init':
   sha256.c:(.text+0x82): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0xb5): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `sha256_init':
   sha256.c:(.text+0xc2): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0xf5): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `sha256_finup_2x_is_optimized':
   sha256.c:(.text+0x102): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x115): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `sha224.part.0':
>> sha256.c:(.text+0x145): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `sha256.part.0':
   sha256.c:(.text+0x185): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha224.part.0':
   sha256.c:(.text+0x1d1): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha224_usingrawkey.part.0':
   sha256.c:(.text+0x218): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o:sha256.c:(.text+0x251): more undefined references to `fips140_lib_funcs' follow
   ld: lib/crypto/sha256.o: in function `__sha256_update':
   sha256.c:(.text+0xacb): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0xc35): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `sha224_final':
   sha256.c:(.text+0xf0c): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0xf7c): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `sha224':
   sha256.c:(.text+0x1012): undefined reference to `fips140_lib_funcs_loaded'
>> ld: sha256.c:(.text+0x103b): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x10bc): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `sha256_final':
   sha256.c:(.text+0x110c): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x117c): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `sha256':
   sha256.c:(.text+0x1212): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x123b): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x12bc): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `sha256_finup_2x':
   sha256.c:(.text+0x138b): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x13d6): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha224_preparekey':
   sha256.c:(.text+0x158b): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x15ba): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha256_preparekey':
   sha256.c:(.text+0x160b): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x163a): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha224_init_usingrawkey':
   sha256.c:(.text+0x168c): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x16cc): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha256_init_usingrawkey':
   sha256.c:(.text+0x170c): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x174c): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha224_final':
   sha256.c:(.text+0x1983): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x19a2): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha256_final':
   sha256.c:(.text+0x19c3): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x19e2): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha224':
   sha256.c:(.text+0x1a16): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1a44): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1a8a): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1ab8): undefined reference to `fips140_lib_funcs'
   ld: sha256.c:(.text+0x1aef): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha256':
   sha256.c:(.text+0x1b16): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1b44): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1b8a): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1bb8): undefined reference to `fips140_lib_funcs'
   ld: sha256.c:(.text+0x1bef): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha224_usingrawkey':
   sha256.c:(.text+0x1c15): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1c43): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1c82): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1cae): undefined reference to `fips140_lib_funcs'
   ld: sha256.c:(.text+0x1ce7): undefined reference to `fips140_lib_funcs'
   ld: lib/crypto/sha256.o: in function `hmac_sha256_usingrawkey':
   sha256.c:(.text+0x1d15): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1d43): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1d82): undefined reference to `fips140_lib_funcs_loaded'
   ld: sha256.c:(.text+0x1dae): undefined reference to `fips140_lib_funcs'
   ld: sha256.c:(.text+0x1de7): undefined reference to `fips140_lib_funcs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
